Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874EC2D5D65
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49329.87227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMo6-0003JN-6v; Thu, 10 Dec 2020 14:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49329.87227; Thu, 10 Dec 2020 14:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMo6-0003Iy-3S; Thu, 10 Dec 2020 14:20:34 +0000
Received: by outflank-mailman (input) for mailman id 49329;
 Thu, 10 Dec 2020 14:20:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knMo4-0003Iq-W0; Thu, 10 Dec 2020 14:20:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knMo4-0000J1-KJ; Thu, 10 Dec 2020 14:20:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1knMo4-0006gM-CR; Thu, 10 Dec 2020 14:20:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1knMo4-0007pZ-Bz; Thu, 10 Dec 2020 14:20:32 +0000
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
	bh=UUqXxPSsItJ5010qRD0JUk/Gdag5QMLhHX1UyXLQtRI=; b=jE8umKoHrrjmXFzTqh0ahxKpDK
	/ozkmdOKUc6RAomu0Jny/p2t2+wzwd5K8JBWd+0D38gt6FJFWM4XajduwxbIhbhehhSpXhCQe+1Pz
	EOnXzz1eEjusuUnq2gqLjerKO2W4lrzXVxvvoQf90HqPHE7MYVKnKEKtbGfrwmxydAbo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1knMo4-0007pZ-Bz@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Dec 2020 14:20:32 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-ovmf-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157384/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/157384.bisection-summary --basis-template=157345 --blessings=real,real-bisect,real-retry ovmf test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 157366 fail [host=pinot1] / 157345 [host=elbling0] 157338 [host=chardonnay0] 157333 [host=fiano1] 157323 [host=pinot0] 157255 [host=elbling1] 157214 [host=huxelrebe1] 157204 [host=chardonnay1] 157194 [host=huxelrebe0] 157191 [host=albana0] 157184 [host=albana1] 157178 [host=fiano1] 157167 [host=fiano0] 157117 [host=chardonnay0] 157104 [host=elbling0] 157060 [host=rimava1] 157055 [host=pinot0] 157042 [host=elbling1] 157025 [host=chardonnay1] 157018 ok.
Failure / basis pass flights: 157366 / 157018
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 272a1db63a09087ce3da4cf44ec7b758611ff1ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e9d62effa37ea13fe04fc89b21d2de7776f183a2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 8147e00e4fbfcc43b665dc6bf279b204c501ba04
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#e9d62effa37ea13fe04fc89b21d2de7776f183a2-272a1db63a09087ce3da4cf44ec7b758611ff1ed git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#748d619be3282fba35f99446098ac2d0579f6063-748d619be3282fba35f99446098ac2d0579f6063 git://xenbits.xen.org/xen.git#8147e00e4fbfcc43b665dc6bf279b204c501ba04-777e3590f154e6a8af560dd318b9465fa168db20
Loaded 10001 nodes in revision graph
Searching for test results:
 157018 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e9d62effa37ea13fe04fc89b21d2de7776f183a2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 8147e00e4fbfcc43b665dc6bf279b204c501ba04
 157025 [host=chardonnay1]
 157042 [host=elbling1]
 157055 [host=pinot0]
 157060 [host=rimava1]
 157104 [host=elbling0]
 157117 [host=chardonnay0]
 157167 [host=fiano0]
 157178 [host=fiano1]
 157184 [host=albana1]
 157191 [host=albana0]
 157194 [host=huxelrebe0]
 157204 [host=chardonnay1]
 157214 [host=huxelrebe1]
 157255 [host=elbling1]
 157323 [host=pinot0]
 157333 [host=fiano1]
 157338 [host=chardonnay0]
 157345 [host=elbling0]
 157348 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 272a1db63a09087ce3da4cf44ec7b758611ff1ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157352 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e9d62effa37ea13fe04fc89b21d2de7776f183a2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 8147e00e4fbfcc43b665dc6bf279b204c501ba04
 157356 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 272a1db63a09087ce3da4cf44ec7b758611ff1ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157357 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 375e9b190e37041129b35a1c667993ea145e5b7e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 be3755af37263833cb3b1c6b1f2ba219bdf97ec3
 157354 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 272a1db63a09087ce3da4cf44ec7b758611ff1ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157360 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4b69fab6e20a98f56acd3c717bd53812950fe5b5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 30d430b2126697dda0bd53d19fe267fb4d30e9b8
 157363 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ee78edceca89057ab9854f7e5070391a8229ece4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157367 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4b69fab6e20a98f56acd3c717bd53812950fe5b5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157370 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7061294be500de021bef3d4bc5218134d223315f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157372 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157375 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157378 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157366 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 272a1db63a09087ce3da4cf44ec7b758611ff1ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157380 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157382 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
 157384 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
Searching for interesting versions
 Result found: flight 157018 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20, results HASH(0x55ebf437e0b0) HASH(0x55ebf38fb810) HASH(0x55ebf43891a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 4b69fab6e20a98f56acd3c717bd53812950fe5b5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20, results HASH(0x55ebf4395800) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4b69fab6e20a98f56acd3c717bd53812950fe5b5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 30d430b2126697dda0bd53d19fe267fb4d30e9b8, results HASH(0x55ebf43866f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 375e9b190e37041129b35a1c667993ea145e5b7e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 be3755af37263833cb3b1c6b1f2ba219bdf97ec3, results HASH(0x55ebf4387c20) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e9d62effa37ea13fe04fc89b21d2de7776f183a2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 8147e00e4fbfcc43b665dc6bf279b204c501ba04, results HASH(0x55ebf438bab0) HASH(0x55ebf4396728) Result found: flight 157348 (fail), for basis failure (at ancestor ~5611)
 Repro found: flight 157352 (pass), for basis pass
 Repro found: flight 157354 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 777e3590f154e6a8af560dd318b9465fa168db20
No revisions left to test, checking graph state.
 Result found: flight 157372 (pass), for last pass
 Result found: flight 157375 (fail), for first failure
 Repro found: flight 157378 (pass), for last pass
 Repro found: flight 157380 (fail), for first failure
 Repro found: flight 157382 (pass), for last pass
 Repro found: flight 157384 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
  Bug not present: 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157384/


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

Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
157384: tolerable ALL FAIL

flight 157384 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/157384/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


