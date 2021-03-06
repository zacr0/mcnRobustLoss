classdef nneuclideanloss < nntest
  methods (Test)

    function basic(test)
      x = test.randn([100 1]) ;
      t = test.randn([100 1]) ;
      y = vl_nneuclideanloss(x, t) ;

      % check derivatives with numerical approximation
      dzdy = test.randn(size(y)) ;
      dzdx = vl_nneuclideanloss(x, t, dzdy) ;
      test.der(@(x) vl_nneuclideanloss(x, t), x, dzdy, dzdx, 1e-3*test.range) ;
    end

    function basicWithInstanceWeights(test)
      x = test.randn([100 1]) ;
      t = test.randn([100 1]) ;
      w = test.randn([100 1]) ;
      y = vl_nneuclideanloss(x, t, 'instanceWeights', w) ;

      % check derivatives with numerical approximation
      dzdy = test.randn(size(y)) ;
      dzdx = vl_nneuclideanloss(x, t, dzdy, 'instanceWeights', w) ;
      test.der(@(x) vl_nneuclideanloss(x, t, 'instanceWeights', w), x, ...
                                        dzdy, dzdx, 1e-3*test.range) ;
    end

  end
end
