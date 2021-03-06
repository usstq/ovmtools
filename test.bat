rem step1: test all models
set ONEDNN_VERBOSE=0
set new_log=win.brg.2
set base_log=win.jit.2
set bin_dir= %cd%\../openvino/bin/intel64/RelWithDebInfo
set model_dir=c:/models/
rem with brg
python test_all.py %bin_dir% %new_log% %model_dir% -cpu_experimental=brgconv -dopt
rem without brg
python test_all.py %bin_dir% %base_log% %model_dir% -dopt

rem step2: filter test results(select best performance)
python postprocess.py %new_log%.log %base_log%.log -0.1 %model_dir% %bin_dir%
