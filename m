Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58645F6199
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2019 22:06:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTXtA-00065J-5p; Sat, 09 Nov 2019 21:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AOvs=ZB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iTXt8-00065E-CY
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2019 21:03:18 +0000
X-Inumbo-ID: 548f9326-0334-11ea-a1f1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 548f9326-0334-11ea-a1f1-12813bfff9fa;
 Sat, 09 Nov 2019 21:03:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iTXsy-0007t0-7t; Sat, 09 Nov 2019 21:03:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iTXsx-0007T9-Vv; Sat, 09 Nov 2019 21:03:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iTXsx-00059D-VD; Sat, 09 Nov 2019 21:03:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iTXsx-00059D-VD@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Nov 2019 21:03:07 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-arm64-libvirt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2709459825754645674=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2709459825754645674==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  f96395e78eaccffbf128336382c74b1250f04032
  Bug not present: 3d46d684d15d557ddbbf8ec20f12facd828495ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143971/


  commit f96395e78eaccffbf128336382c74b1250f04032
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Nov 6 15:55:12 2019 +0100
  
      build: mandate use of a build dir != src dir
      
      Historically we've allowed builds in the main src dir, but meson does
      not support this. Explicitly force separate build dir in autotools to
      align with meson. We must re-enable dependency tracking which the RPM
      %configure macro turns off. Without this, the build dir doesn't get
      the source directory tree mirrored.
      
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/143971.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 143935 fail [host=laxton1] / 143904 [host=rochester0] 143789 [host=rochester0] 143589 [host=laxton0] 143484 ok.
Failure / basis pass flights: 143935 / 143484
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 70218e10bcde54456ac436fee7ce39ce0a7d4457 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 6f3ac73cd3792c7eeccb4533e545270d640bef4c 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a-70218e10bcde54456ac436fee7ce39ce0a7d4457 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#6f3ac73cd3792c7eeccb4533e545270d640bef4\
 c-1bcc65b9a1408cf445b7b3f9499b27d9c235db71 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#120996f147131eca8af90e30c900bc14bc824d9f-9caa19be0e534c687081fbdfcd301406e728c98c git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 12520 nodes in revision graph
Searching for test results:
 143391 pass irrelevant
 143484 pass bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 6f3ac73cd3792c7eeccb4533e545270d640bef4c 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143589 [host=laxton0]
 143789 [host=rochester0]
 143904 [host=rochester0]
 143957 fail 70218e10bcde54456ac436fee7ce39ce0a7d4457 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143959 pass 13ec827052fcd79a4350f499aab5f4aa20ea83fa 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143935 fail 70218e10bcde54456ac436fee7ce39ce0a7d4457 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143954 pass bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 6f3ac73cd3792c7eeccb4533e545270d640bef4c 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143958 pass a6dfa6ee9996434ad19aa7be8e56efa04eea3657 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143961 fail eda04022ca3fae04a92aa20491d7266513aaca46 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143962 fail c647107922c8120d1c92fa242b7ae1aa6b0d14d4 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143963 pass 3d46d684d15d557ddbbf8ec20f12facd828495ad 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143964 fail f96395e78eaccffbf128336382c74b1250f04032 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143966 pass 3d46d684d15d557ddbbf8ec20f12facd828495ad 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143968 fail f96395e78eaccffbf128336382c74b1250f04032 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143969 pass 3d46d684d15d557ddbbf8ec20f12facd828495ad 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143971 fail f96395e78eaccffbf128336382c74b1250f04032 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 143484 (pass), for basis pass
 Result found: flight 143935 (fail), for basis failure
 Repro found: flight 143954 (pass), for basis pass
 Repro found: flight 143957 (fail), for basis failure
 0 revisions at 3d46d684d15d557ddbbf8ec20f12facd828495ad 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 1bcc65b9a1408cf445b7b3f9499b27d9c235db71 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143963 (pass), for last pass
 Result found: flight 143964 (fail), for first failure
 Repro found: flight 143966 (pass), for last pass
 Repro found: flight 143968 (fail), for first failure
 Repro found: flight 143969 (pass), for last pass
 Repro found: flight 143971 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  f96395e78eaccffbf128336382c74b1250f04032
  Bug not present: 3d46d684d15d557ddbbf8ec20f12facd828495ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143971/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit f96395e78eaccffbf128336382c74b1250f04032
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Nov 6 15:55:12 2019 +0100
  
      build: mandate use of a build dir != src dir
      
      Historically we've allowed builds in the main src dir, but meson does
      not support this. Explicitly force separate build dir in autotools to
      align with meson. We must re-enable dependency tracking which the RPM
      %configure macro turns off. Without this, the build dir doesn't get
      the source directory tree mirrored.
      
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
143971: tolerable ALL FAIL

flight 143971 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143971/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary



--===============2709459825754645674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2709459825754645674==--
