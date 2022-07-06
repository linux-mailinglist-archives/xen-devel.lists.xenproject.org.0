Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B4568CE0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362323.592318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o970b-0007eH-OD; Wed, 06 Jul 2022 15:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362323.592318; Wed, 06 Jul 2022 15:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o970b-0007cD-LB; Wed, 06 Jul 2022 15:32:09 +0000
Received: by outflank-mailman (input) for mailman id 362323;
 Wed, 06 Jul 2022 15:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o970Z-0007c3-WF; Wed, 06 Jul 2022 15:32:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o970Z-0003uE-SW; Wed, 06 Jul 2022 15:32:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o970Z-0005WC-Iw; Wed, 06 Jul 2022 15:32:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o970Z-0005Ux-IS; Wed, 06 Jul 2022 15:32:07 +0000
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
	bh=j6rltrRj/RPAg7Cp7lMqZhG0YBIS/UGLa9KNYmQZQHs=; b=gTeVMG7SIBmkM1Geo7bcoGd8Zx
	X6MdUkQeQi2+cvIHHnB8xFgw3Tulfj/DDM26GVwFZd2wC1nmCPcOk/yTGXB4tS7wgMmYULen8CJA6
	4vzu9k+EtBtTTNmHnvzCvcRGCx8cpBgmcAc37d3jky0th/M0mfRU3k/CugrEfPZvzOCg=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-arm64-arm64-xl-xsm
Message-Id: <E1o970Z-0005Ux-IS@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jul 2022 15:32:07 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-arm64-arm64-xl-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8d410ac2c178e1dd1001cadddbe9ca75a9738c95
  Bug not present: 4df2e99d731402da48afb19dc970ccab5a0814d6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171534/


  commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
  Author: Demi Marie Obenour <demi@invisiblethingslab.com>
  Date:   Tue Jul 5 13:10:46 2022 +0200
  
      EFI: preserve the System Resource Table for dom0
      
      The EFI System Resource Table (ESRT) is necessary for fwupd to identify
      firmware updates to install.  According to the UEFI specification §23.4,
      the ESRT shall be stored in memory of type EfiBootServicesData.  However,
      memory of type EfiBootServicesData is considered general-purpose memory
      by Xen, so the ESRT needs to be moved somewhere where Xen will not
      overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
      which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
      in memory of type EfiRuntimeServicesData.
      
      Earlier versions of this patch reserved the memory in which the ESRT was
      located.  This created awkward alignment problems, and required either
      splitting the E820 table or wasting memory.  It also would have required
      a new platform op for dom0 to use to indicate if the ESRT is reserved.
      By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
      does not need to be modified, and dom0 can just check the type of the
      memory region containing the ESRT.  The copy is only done if the ESRT is
      not already in EfiRuntimeServicesData memory, avoiding memory leaks on
      repeated kexec.
      
      See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
      for details.
      
      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot --summary-out=tmp/171534.bisection-summary --basis-template=171486 --blessings=real,real-bisect,real-retry xen-unstable-smoke test-arm64-arm64-xl-xsm xen-boot
Searching for failure / basis pass:
 171529 fail [host=laxton1] / 171486 ok.
Failure / basis pass flights: 171529 / 171486
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
Basis pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#4df2e99d731402da48afb19dc970ccab5a0814d6-61ff273\
 3221e3b5bae5f647d9a460c7a68a5ace8
Loaded 5001 nodes in revision graph
Searching for test results:
 171486 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
 171501 [host=rochester0]
 171505 [host=rochester0]
 171506 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
 171507 [host=rochester0]
 171510 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
 171513 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
 171511 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
 171515 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c4184bf305dc14c3e150617904c40b120664efe6
 171518 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
 171521 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
 171522 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
 171519 [host=rochester1]
 171524 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
 171527 [host=rochester1]
 171530 [host=rochester1]
 171531 [host=rochester1]
 171529 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
 171532 [host=rochester1]
 171534 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
Searching for interesting versions
 Result found: flight 171486 (pass), for basis pass
 For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6, results HASH(0x558b35d49170) HASH(0x558b35d531c0) HASH(0x558b35d5c8b0) HASH(0x558b35d605c0) Result found: flight 171506 (fail), for basis failure (at ancestor ~260)
 Repro found: flight 171510 (pass), for basis pass
 Repro found: flight 171511 (fail), for basis failure
 0 revisions at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4df2e99d731402da48afb19dc970ccab5a0814d6
No revisions left to test, checking graph state.
 Result found: flight 171486 (pass), for last pass
 Result found: flight 171518 (fail), for first failure
 Repro found: flight 171521 (pass), for last pass
 Repro found: flight 171522 (fail), for first failure
 Repro found: flight 171524 (pass), for last pass
 Repro found: flight 171534 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8d410ac2c178e1dd1001cadddbe9ca75a9738c95
  Bug not present: 4df2e99d731402da48afb19dc970ccab5a0814d6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171534/


  commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
  Author: Demi Marie Obenour <demi@invisiblethingslab.com>
  Date:   Tue Jul 5 13:10:46 2022 +0200
  
      EFI: preserve the System Resource Table for dom0
      
      The EFI System Resource Table (ESRT) is necessary for fwupd to identify
      firmware updates to install.  According to the UEFI specification §23.4,
      the ESRT shall be stored in memory of type EfiBootServicesData.  However,
      memory of type EfiBootServicesData is considered general-purpose memory
      by Xen, so the ESRT needs to be moved somewhere where Xen will not
      overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
      which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
      in memory of type EfiRuntimeServicesData.
      
      Earlier versions of this patch reserved the memory in which the ESRT was
      located.  This created awkward alignment problems, and required either
      splitting the E820 table or wasting memory.  It also would have required
      a new platform op for dom0 to use to indicate if the ESRT is reserved.
      By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
      does not need to be modified, and dom0 can just check the type of the
      memory region containing the ESRT.  The copy is only done if the ESRT is
      not already in EfiRuntimeServicesData memory, avoiding memory leaks on
      repeated kexec.
      
      See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
      for details.
      
      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
171534: tolerable ALL FAIL

flight 171534 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171534/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                fail baseline untested


jobs:
 test-arm64-arm64-xl-xsm                                      fail    


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


