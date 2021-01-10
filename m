Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D82F06D1
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jan 2021 12:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64435.113868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyZKk-0004Ks-Tn; Sun, 10 Jan 2021 11:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64435.113868; Sun, 10 Jan 2021 11:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyZKk-0004KH-Og; Sun, 10 Jan 2021 11:56:34 +0000
Received: by outflank-mailman (input) for mailman id 64435;
 Sun, 10 Jan 2021 11:56:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyZKj-0004K4-HU; Sun, 10 Jan 2021 11:56:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyZKj-0006SL-D4; Sun, 10 Jan 2021 11:56:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyZKj-0006Vf-6g; Sun, 10 Jan 2021 11:56:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kyZKj-0000Qd-6A; Sun, 10 Jan 2021 11:56:33 +0000
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
	bh=bVDyasubXItteTjPSfCRwvRhENjdo6lc8VaCQbscK/U=; b=sXQEKNmBZH4XcQDiuxawlJFtT2
	WYkxeMiuQWyPwHRGJEegcOdTd+MQakQqperQ3qa2IsQkHqhav3B4BwwvCInNYVev1+9u+qdpXfrFc
	E1V81cYa87V+IhW/VvPx4lAZZCuYSWYmmQD3BGeTmMkCIlUXyR1BYHdDZU+woUvwP4/k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-arm64-arm64-examine
Message-Id: <E1kyZKj-0000Qd-6A@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Jan 2021 11:56:33 +0000

branch xen-unstable
xenbranch xen-unstable
job test-arm64-arm64-examine
testid reboot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158321/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-examine.reboot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-arm64-arm64-examine.reboot --summary-out=tmp/158321.bisection-summary --basis-template=158290 --blessings=real,real-bisect,real-retry xen-unstable test-arm64-arm64-examine reboot
Searching for failure / basis pass:
 158303 fail [host=rochester1] / 158290 [host=laxton1] 158269 [host=laxton0] 158231 [host=rochester0] 158183 ok.
Failure / basis pass flights: 158303 / 158183
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#7ba2ab495be54f608cb47440e1497b2795bd301a-ce59e3d\
 da5f99afbe7257e1e9a22dffd5c4d033c
Loaded 5001 nodes in revision graph
Searching for test results:
 158132 [host=laxton0]
 158146 [host=laxton1]
 158183 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a
 158231 [host=rochester0]
 158269 [host=laxton0]
 158290 [host=laxton1]
 158296 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158302 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a
 158305 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158306 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 c7115531ea8ede5c6ab27f972c1be6ecad388f55
 158308 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7d2d7a43d0141de69d837854ce139bcd47a7b859
 158309 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 07b9acea116e8329d613004766b8606756986db5
 158318 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158311 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158313 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158314 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158316 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158317 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158303 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 ce59e3dda5f99afbe7257e1e9a22dffd5c4d033c
 158321 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
Searching for interesting versions
 Result found: flight 158183 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac, results HASH(0x562171ce2c68) HASH(0x562171c8fab0) HASH(0x562171c7def8) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 7ba2ab495be54f608cb47440e1497b2795bd301a, results \
 HASH(0x562171c7e9a0) HASH(0x562171c7f120) Result found: flight 158296 (fail), for basis failure (at ancestor ~771)
 Repro found: flight 158302 (pass), for basis pass
 Repro found: flight 158303 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
No revisions left to test, checking graph state.
 Result found: flight 158313 (pass), for last pass
 Result found: flight 158314 (fail), for first failure
 Repro found: flight 158316 (pass), for last pass
 Repro found: flight 158317 (fail), for first failure
 Repro found: flight 158318 (pass), for last pass
 Repro found: flight 158321 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158321/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-arm64-arm64-examine.reboot.{dot,ps,png,html,svg}.
----------------------------------------
158321: tolerable ALL FAIL

flight 158321 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158321/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-examine      8 reboot                  fail baseline untested


jobs:
 test-arm64-arm64-examine                                     fail    


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


