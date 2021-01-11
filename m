Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7E2F0CCE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 07:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64587.114108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyqYY-0000Mh-PS; Mon, 11 Jan 2021 06:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64587.114108; Mon, 11 Jan 2021 06:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyqYY-0000MF-Ji; Mon, 11 Jan 2021 06:19:58 +0000
Received: by outflank-mailman (input) for mailman id 64587;
 Mon, 11 Jan 2021 06:19:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyqYX-0000M7-GR; Mon, 11 Jan 2021 06:19:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyqYX-0000ug-8L; Mon, 11 Jan 2021 06:19:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyqYX-0006C3-0B; Mon, 11 Jan 2021 06:19:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kyqYW-0007tZ-Vx; Mon, 11 Jan 2021 06:19:56 +0000
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
	bh=pSxirbhHrzpgHmAfbFlIJI4KlduzzqkCmx2OW1KYv7I=; b=4ZWu9CF6Z/2+VqxsYVIdSL5SR2
	XQzfDVLy/Mb0StVru+c4sMYy4CReRn3aeF0Q3kfembwudRUjjSGnpN8liFyMnh03jhwTgeG9dbzVj
	cI/ksraSFh4MHQ6S/4CK6BzikPOArv6duaeLuf7FwMYT4tqkMRuO3wEsOHR4r24UZ2GU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-arm64-arm64-xl-xsm
Message-Id: <E1kyqYW-0007tZ-Vx@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Jan 2021 06:19:56 +0000

branch xen-unstable
xenbranch xen-unstable
job test-arm64-arm64-xl-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158347/


  commit 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Author: Bertrand Marquis <bertrand.marquis@arm.com>
  Date:   Thu Dec 17 15:38:02 2020 +0000
  
      xen/arm: Add ID registers and complete cpuinfo
      
      Add definition and entries in cpuinfo for ID registers introduced in
      newer Arm Architecture reference manual:
      - ID_PFR2: processor feature register 2
      - ID_DFR1: debug feature register 1
      - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
      - ID_ISA6: ISA Feature register 6
      Add more bitfield definitions in PFR fields of cpuinfo.
      Add MVFR2 register definition for aarch32.
      Add MVFRx_EL1 defines for aarch32.
      Add mvfr values in cpuinfo.
      Add some registers definition for arm64 in sysregs as some are not
      always know by compilers.
      Initialize the new values added in cpuinfo in identify_cpu during init.
      
      Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-xl-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-arm64-arm64-xl-xsm.xen-boot --summary-out=tmp/158347.bisection-summary --basis-template=158290 --blessings=real,real-bisect,real-retry xen-unstable test-arm64-arm64-xl-xsm xen-boot
Searching for failure / basis pass:
 158322 fail [host=rochester1] / 158290 [host=laxton1] 158269 [host=laxton0] 158231 [host=rochester0] 158183 [host=laxton1] 158146 [host=rochester0] 158132 ok.
Failure / basis pass flights: 158322 / 158132
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c-ce59e3d\
 da5f99afbe7257e1e9a22dffd5c4d033c
Loaded 5001 nodes in revision graph
Searching for test results:
 158132 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
 158146 [host=rochester0]
 158183 [host=laxton1]
 158231 [host=rochester0]
 158269 [host=laxton0]
 158290 [host=laxton1]
 158296 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158303 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158324 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
 158325 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158326 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 c7115531ea8ede5c6ab27f972c1be6ecad388f55
 158328 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7d2d7a43d0141de69d837854ce139bcd47a7b859
 158330 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 07b9acea116e8329d613004766b8606756986db5
 158332 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158322 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158337 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a
 158338 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158339 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158342 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158343 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158345 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158347 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
Searching for interesting versions
 Result found: flight 158132 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac, results HASH(0x55997a5fed48) HASH(0x55997a604648) HASH(0x55997a5776e8) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a, results \
 HASH(0x55997a5fd910) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c, results HASH(0x55997a567fe0) HASH(0x55997a570028) Result found: flight 158296 (fail), for basis failure (at ancestor ~771)
 Repro found: flight 158324 (pass), for basis pass
 Repro found: flight 158325 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
No revisions left to test, checking graph state.
 Result found: flight 158338 (pass), for last pass
 Result found: flight 158339 (fail), for first failure
 Repro found: flight 158342 (pass), for last pass
 Repro found: flight 158343 (fail), for first failure
 Repro found: flight 158345 (pass), for last pass
 Repro found: flight 158347 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158347/


  commit 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Author: Bertrand Marquis <bertrand.marquis@arm.com>
  Date:   Thu Dec 17 15:38:02 2020 +0000
  
      xen/arm: Add ID registers and complete cpuinfo
      
      Add definition and entries in cpuinfo for ID registers introduced in
      newer Arm Architecture reference manual:
      - ID_PFR2: processor feature register 2
      - ID_DFR1: debug feature register 1
      - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
      - ID_ISA6: ISA Feature register 6
      Add more bitfield definitions in PFR fields of cpuinfo.
      Add MVFR2 register definition for aarch32.
      Add MVFRx_EL1 defines for aarch32.
      Add mvfr values in cpuinfo.
      Add some registers definition for arm64 in sysregs as some are not
      always know by compilers.
      Initialize the new values added in cpuinfo in identify_cpu during init.
      
      Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-arm64-arm64-xl-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
158347: tolerable ALL FAIL

flight 158347 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158347/

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


