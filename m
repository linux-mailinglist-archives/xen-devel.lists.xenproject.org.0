Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2CD2ED42E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 17:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62976.111753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxY38-00015W-O9; Thu, 07 Jan 2021 16:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62976.111753; Thu, 07 Jan 2021 16:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxY38-000153-II; Thu, 07 Jan 2021 16:22:10 +0000
Received: by outflank-mailman (input) for mailman id 62976;
 Thu, 07 Jan 2021 16:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxY36-00014p-Od; Thu, 07 Jan 2021 16:22:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxY36-0004nq-IC; Thu, 07 Jan 2021 16:22:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxY36-0001Jd-BC; Thu, 07 Jan 2021 16:22:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxY36-0005qm-Ai; Thu, 07 Jan 2021 16:22:08 +0000
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
	bh=5OnqyISeoT5TspSfsaTioLCA9xWaN+w6jd9S+QNYduw=; b=upyKjOBhQtNVRZV0lQOw1ytYDN
	rGNZQc8lWsn+FRqDs2cz+hIlWIjjNW7/aLYf0szCLWzLiJ/voqmEIZD5hYVxWMQDW3l/4+9J6c7wD
	nqkFS3kADVigwGbzJC9Ph54cb2FrEpD+XxEA3vmw7Q2t9qYJuTDfsfVFMPhH6v4zER9M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-armhf-armhf-xl
Message-Id: <E1kxY36-0005qm-Ai@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jan 2021 16:22:08 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-armhf-armhf-xl
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158232/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot --summary-out=tmp/158254.bisection-summary --basis-template=158134 --blessings=real,real-bisect,real-retry xen-unstable-smoke test-armhf-armhf-xl xen-boot
Searching for failure / basis pass:
 158250 fail [host=cubietruck-braque] / 158134 [host=cubietruck-metzinger] 158123 ok.
Failure / basis pass flights: 158250 / 158123
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 d581cf8839417b73f02d8b6f79cf33e9903933db
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c-d581cf8\
 839417b73f02d8b6f79cf33e9903933db
Loaded 5001 nodes in revision graph
Searching for test results:
 158123 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
 158134 [host=cubietruck-metzinger]
 158142 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
 158151 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c
 158152 [host=cubietruck-picasso]
 158154 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
 158161 [host=cubietruck-picasso]
 158164 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 c992efd06a4c092f6fb3b8ab10d4f8ca35d42bbd
 158166 [host=cubietruck-picasso]
 158169 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 2d66a1f095f716e4bf7e47d61e1d1de13e99167a
 158168 [host=cubietruck-picasso]
 158172 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158174 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 edf5b22022aea0a76eaeb36cc060d984340e1e18
 158176 [host=cubietruck-picasso]
 158180 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158187 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158179 [host=cubietruck-picasso]
 158190 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158191 [host=arndale-metrocentre]
 158193 [host=cubietruck-picasso]
 158196 [host=arndale-metrocentre]
 158195 [host=cubietruck-gleizes]
 158202 [host=arndale-metrocentre]
 158206 [host=cubietruck-gleizes]
 158205 [host=arndale-lakeside]
 158208 [host=cubietruck-gleizes]
 158212 [host=arndale-lakeside]
 158209 [host=cubietruck-metzinger]
 158216 [host=arndale-lakeside]
 158220 [host=cubietruck-metzinger]
 158223 [host=cubietruck-metzinger]
 158218 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 d581cf8839417b73f02d8b6f79cf33e9903933db
 158225 [host=cubietruck-metzinger]
 158230 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
 158228 [host=cubietruck-picasso]
 158232 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
 158236 [host=cubietruck-picasso]
 158237 [host=arndale-lakeside]
 158243 [host=cubietruck-picasso]
 158245 [host=cubietruck-picasso]
 158247 [host=arndale-lakeside]
 158251 [host=cubietruck-picasso]
 158250 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 d581cf8839417b73f02d8b6f79cf33e9903933db
 158254 [host=cubietruck-picasso]
Searching for interesting versions
 Result found: flight 158123 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac, results HASH(0x558b39a112f8) HASH(0x558b39a0e3c8) HASH(0x558b39a163b0) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 62dde2c1eff6d4e5d45883b78bdae5447e7d2d9c, results \
 HASH(0x558b39a02670) HASH(0x558b399fb130) Result found: flight 158142 (fail), for basis failure (at ancestor ~753)
 Repro found: flight 158151 (pass), for basis pass
 Repro found: flight 158218 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 a9f1f03b2710f5ce84f69c1c4516349531053fac
No revisions left to test, checking graph state.
 Result found: flight 158172 (pass), for last pass
 Result found: flight 158180 (fail), for first failure
 Repro found: flight 158187 (pass), for last pass
 Repro found: flight 158190 (fail), for first failure
 Repro found: flight 158230 (pass), for last pass
 Repro found: flight 158232 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
  Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158232/


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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
158254: tolerable ALL FAIL

flight 158254 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158254/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                fail baseline untested


jobs:
 test-armhf-armhf-xl                                          fail    


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


