Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C02D82FC
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 00:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50974.89865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knsHt-0001Fg-7H; Fri, 11 Dec 2020 23:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50974.89865; Fri, 11 Dec 2020 23:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knsHt-0001FF-1L; Fri, 11 Dec 2020 23:57:25 +0000
Received: by outflank-mailman (input) for mailman id 50974;
 Fri, 11 Dec 2020 23:57:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knsHr-0001F7-KX; Fri, 11 Dec 2020 23:57:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knsHr-00035Y-8V; Fri, 11 Dec 2020 23:57:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knsHr-0005or-1v; Fri, 11 Dec 2020 23:57:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1knsHr-0001pa-1N; Fri, 11 Dec 2020 23:57:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=3ld2xvypCZxJvMWa5rduiip4qnouATZwstt2kV2XV20=; b=QE6z1orn8Y8oMHCYN1AAcsGkTY
	CqDnzEW3dt5JBnMt5uAJ4Dc6Fanc+f/9jXn3yVieIfmcSU/NgxS2DKK/VUYtGp2xQzKcCM/Mqcxpx
	WyFSzWYhBRcpZIoOZ/p1I4xdN4V0P+qxIyn4093X8d2sf+cHd8W+85/uqCNee/sct2dY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1knsHr-0001pa-1N@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Dec 2020 23:57:23 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
  Bug not present: 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157448/


  commit cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
  Author: Guo Dong <guo.dong@intel.com>
  Date:   Wed Dec 2 14:18:18 2020 -0700
  
      UefiCpuPkg/CpuDxe: Fix boot error
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3084
      
      When DXE drivers are dispatched above 4GB memory and
      the system is already in 64bit mode, the address
      setCodeSelectorLongJump in stack will be override
      by parameter. so change to use 64bit address and
      jump to qword address.
      
      Signed-off-by: Guo Dong <guo.dong@intel.com>
      Reviewed-by: Ray Ni <ray.ni@intel.com>
      Reviewed-by: Eric Dong <eric.dong@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/157448.bisection-summary --basis-template=157345 --blessings=real,real-bisect,real-retry ovmf test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 157416 fail [host=pinot0] / 157394 [host=elbling1] 157390 [host=elbling0] 157383 [host=albana0] 157366 [host=godello1] 157354 [host=godello0] 157348 [host=fiano0] 157345 [host=huxelrebe0] 157338 [host=chardonnay1] 157333 [host=chardonnay0] 157323 [host=rimava1] 157255 [host=huxelrebe1] 157214 [host=elbling1] 157204 [host=godello0] 157194 [host=elbling0] 157191 [host=fiano1] 157184 [host=albana0] 157178 [host=albana1] 157167 [host=godello1] 157117 [host=pinot1] 157104 [host=huxelrebe1] 157060 [h\
 ost=huxelrebe0] 157055 [host=godello0] 157042 ok.
Failure / basis pass flights: 157416 / 157042
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4633b36b94f7b4a1f41901657cbbff452173d35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 872f953262d68a11da7bc2fb3ded16df234b8700 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 181f2c224ccd0a2900d6ae94ec390a546731f593
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#872f953262d68a11da7bc2fb3ded16df234b8700-d4633b36b94f7b4a1f41901657cbbff452173d35 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#748d619be3282fba35f99446098ac2d0579f6063-748d619be3282fba35f99446098ac2d0579f6063 git://xenbits.xen.org/xen.git#181f2c224ccd0a2900d6ae94ec390a546731f593-777e3590f154e6a8af560dd318b9465fa168db20
Loaded 10001 nodes in revision graph
Searching for test results:
 157042 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 872f953262d68a11da7bc2fb3ded16df234b8700 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 181f2c224ccd0a2900d6ae94ec390a546731f593
 157055 [host=godello0]
 157060 [host=huxelrebe0]
 157104 [host=huxelrebe1]
 157117 [host=pinot1]
 157167 [host=godello1]
 157178 [host=albana1]
 157184 [host=albana0]
 157191 [host=fiano1]
 157194 [host=elbling0]
 157204 [host=godello0]
 157214 [host=elbling1]
 157255 [host=huxelrebe1]
 157323 [host=rimava1]
 157333 [host=chardonnay0]
 157338 [host=chardonnay1]
 157345 [host=huxelrebe0]
 157348 [host=fiano0]
 157354 [host=godello0]
 157366 [host=godello1]
 157383 [host=albana0]
 157390 [host=elbling0]
 157394 [host=elbling1]
 157399 []
 157402 []
 157406 []
 157410 []
 157412 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4633b36b94f7b4a1f41901657cbbff452173d35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157415 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 872f953262d68a11da7bc2fb3ded16df234b8700 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 181f2c224ccd0a2900d6ae94ec390a546731f593
 157419 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4633b36b94f7b4a1f41901657cbbff452173d35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157427 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 97e2b622d1f32ba35194dbca104c3bf918bf3271 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 728acba1ba4ad6f9b69fd6929362a9750fe4dbe8
 157432 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157416 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4633b36b94f7b4a1f41901657cbbff452173d35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157434 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c5d970a01e76c1a20f6bb009b32e479ad2444548 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157436 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d315bd2286cde306f1ef5256026038e610505cca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157440 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157441 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157444 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157445 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157446 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157448 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
Searching for interesting versions
 Result found: flight 157042 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20, results HASH(0x55d11c590470) HASH(0x55d11c58de68) HASH(0x55d11c598938) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 97e2b622d1f32ba35194dbca104c3bf918bf3271 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 728acba1ba4ad6f9b69fd6929362a9750fe4dbe8, results HASH(0x55d11c592c20) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 872f953262d68a11da7bc2fb3ded16df234b8700 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 181f2c224ccd0a2900d6ae94ec390a546731f593, results HASH(0x55d11c5970b0) HASH(0x55d11c5953a8) Result found: flight 157412 (fail), for basis failure (at ancestor ~5611)
 Repro found: flight 157415 (pass), for basis pass
 Repro found: flight 157416 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
No revisions left to test, checking graph state.
 Result found: flight 157432 (pass), for last pass
 Result found: flight 157441 (fail), for first failure
 Repro found: flight 157444 (pass), for last pass
 Repro found: flight 157445 (fail), for first failure
 Repro found: flight 157446 (pass), for last pass
 Repro found: flight 157448 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
  Bug not present: 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157448/


  commit cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
  Author: Guo Dong <guo.dong@intel.com>
  Date:   Wed Dec 2 14:18:18 2020 -0700
  
      UefiCpuPkg/CpuDxe: Fix boot error
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3084
      
      When DXE drivers are dispatched above 4GB memory and
      the system is already in 64bit mode, the address
      setCodeSelectorLongJump in stack will be override
      by parameter. so change to use 64bit address and
      jump to qword address.
      
      Signed-off-by: Guo Dong <guo.dong@intel.com>
      Reviewed-by: Ray Ni <ray.ni@intel.com>
      Reviewed-by: Eric Dong <eric.dong@intel.com>

Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
157448: tolerable ALL FAIL

flight 157448 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/157448/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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


