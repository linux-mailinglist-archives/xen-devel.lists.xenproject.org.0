Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1738A3A0C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Apr 2024 03:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704987.1101590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvRtd-0004BY-03; Sat, 13 Apr 2024 01:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704987.1101590; Sat, 13 Apr 2024 01:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvRtc-0004A1-Sx; Sat, 13 Apr 2024 01:09:32 +0000
Received: by outflank-mailman (input) for mailman id 704987;
 Sat, 13 Apr 2024 01:09:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvRtc-00049r-4l; Sat, 13 Apr 2024 01:09:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvRtc-0000yJ-0a; Sat, 13 Apr 2024 01:09:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvRtb-0004U1-Ok; Sat, 13 Apr 2024 01:09:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvRtb-0003BZ-OI; Sat, 13 Apr 2024 01:09:31 +0000
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
	bh=gdzbpMAVtSqliTLnEKc8e79yoinulNNtJ6mKvDLjtEA=; b=tpfEo48UaFUDsET5H+9vhyK58n
	f6NTlefLoHjqVqF0if204ibO2VJHZoQkNVtNuOZ9n+k3QT35YJltvo5+7Ur4DyGoFN+FFCqU6g+bp
	nE+uz9JqbOWseXKaqe6ZjS5ZU46pNj1Mb8QooFT23IXm46h2iYqCLx7fsVZ5OFUmX1kE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-amd64-xl-pvshim
Message-Id: <E1rvRtb-0003BZ-OI@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Apr 2024 01:09:31 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-amd64-xl-pvshim
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  28f5ceb0b19b13a7c0ebd125c587e469490ab872
  Bug not present: 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185404/


  commit 28f5ceb0b19b13a7c0ebd125c587e469490ab872
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-pvshim.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-pvshim.guest-start --summary-out=tmp/185404.bisection-summary --basis-template=185283 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-amd64-xl-pvshim guest-start
Searching for failure / basis pass:
 185297 fail [host=rimava0] / 185283 [host=huxelrebe0] 185007 [host=septiner0] 184804 [host=pinot1] 184530 [host=himrod0] 184108 [host=pinot1] 183752 [host=huxelrebe0] 183357 [host=huxelrebe1] 183350 [host=huxelrebe0] 183341 [host=nocera1] 183082 [host=godello1] 182634 [host=godello1] 182236 [host=himrod0] 182166 [host=huxelrebe0] 182107 [host=italia0] 182094 [host=godello1] 181998 [host=albana1] 181882 [host=huxelrebe0] 181851 [host=nocera0] 181831 [host=pinot1] 180918 [host=rimava1] 180478 [ho\
 st=sabro0] 180464 [host=italia0] 180445 [host=godello0] 180407 [host=pinot1] 180397 [host=debina0] 180219 [host=rimava1] 180086 ok.
Failure / basis pass flights: 185297 / 180086
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 4b33780de790bd438dd7cbb6143b410d94f0f049
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b08a19eae28e76fb5a296a604c27d06fab29b08a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 62dd49f2172fb7dfe8d4223bfa45aede05155328 ea1b7a0733906b8425d948ae94fba63c32b1d425 06264af090ac69a95cdadbc261cc82d964dcb568
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-347385861c50adc8d4801d4b899eded38a2f04cd git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b08a19eae28e76fb5a296a604c27d06fab29b08a-963671d3801a6992d1aa06f05d86e32efa6b205e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#62dd49f2172fb7dfe8d4223bfa45aede05155328-c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63c32b1d425-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#06264af090ac69a95cdadbc261cc82d964dcb568-4b33780de790bd438dd7cbb6143b410d94f0f049
adhoc-revtuple-generator: tree discontiguous: linux-pvops
Loaded 12700 nodes in revision graph
Searching for test results:
 180086 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b08a19eae28e76fb5a296a604c27d06fab29b08a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 62dd49f2172fb7dfe8d4223bfa45aede05155328 ea1b7a0733906b8425d948ae94fba63c32b1d425 06264af090ac69a95cdadbc261cc82d964dcb568
 180219 [host=rimava1]
 180397 [host=debina0]
 180407 [host=pinot1]
 180445 [host=godello0]
 180464 [host=italia0]
 180478 [host=sabro0]
 180918 [host=rimava1]
 181831 [host=pinot1]
 181851 [host=nocera0]
 181882 [host=huxelrebe0]
 181998 [host=albana1]
 182094 [host=godello1]
 182107 [host=italia0]
 182166 [host=huxelrebe0]
 182236 [host=himrod0]
 182634 [host=godello1]
 183082 [host=godello1]
 183341 [host=nocera1]
 183350 [host=huxelrebe0]
 183357 [host=huxelrebe1]
 183752 [host=huxelrebe0]
 184108 [host=pinot1]
 184530 [host=himrod0]
 184804 [host=pinot1]
 185007 [host=septiner0]
 185283 [host=huxelrebe0]
 185297 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 4b33780de790bd438dd7cbb6143b410d94f0f049
 185323 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b08a19eae28e76fb5a296a604c27d06fab29b08a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 62dd49f2172fb7dfe8d4223bfa45aede05155328 ea1b7a0733906b8425d948ae94fba63c32b1d425 06264af090ac69a95cdadbc261cc82d964dcb568
 185331 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 4b33780de790bd438dd7cbb6143b410d94f0f049
 185335 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82191f8a0e57f674657c7461189e194b6f863e26 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 29efce0f8f10e381417a61f2f9988b40d4f6bcf0
 185341 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b1ddbddeee64cee5aba4f0170fbf5e4781d4879 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588
 185346 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6bb39cfd003df1ea39e521aa125d819e5088d917 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 82faf1d5c8b25375b9029f2d6668135e62455a8c e481fc9f32339ebf9ddd171a3995a3e44527d148
 185351 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ccf91b518f22102d446f26320110d30ea0fc1fa9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 3722c21de19ba64de56495502c0c025b913a9b15 41d93be76611704bdc73e8fe71c251a6f1da114c
 185356 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 8707f835ae355832965508b6be96765660fb1861 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 913680885350f92965d70122f6fd54406c49af7d 8d6efd087b34127ef9865afc36093617f15080b6
 185361 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 24178feda5e90085d34a5b2c70ff66c7671518d1
 185364 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 89ff5da9f9787be29c173ad5d5c0beb0c262e3cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185367 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185370 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 c5d815f0dd830b24be8a088e286a166f79f8bb73
 185378 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185385 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 28f5ceb0b19b13a7c0ebd125c587e469490ab872
 185390 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185395 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 28f5ceb0b19b13a7c0ebd125c587e469490ab872
 185398 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185404 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 28f5ceb0b19b13a7c0ebd125c587e469490ab872
Searching for interesting versions
 Result found: flight 180086 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2, results HASH(0x556e3005a800) HASH(0x556e30027a40) HASH(0x556e3002e680) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2, results HASH(0x556e30023108) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 89ff5da9f9787be29c173ad5d5c0beb0c262e3cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641c\
 c35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2, results HASH(0x556e30026938) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 8707f835ae355832965508b6be96765660fb1861 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 913680885350f92965d70122f6fd54406c49af7d 8d6efd087b34127ef9865afc36093617f15080b6, results HASH(0x556e30030988) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ccf91b518f22102d446f26320110d30ea0fc1fa9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 3722c21de19ba64de56495502c0c025b913a9b15 41d93be76611704bdc73e8fe71c251a6f1da114c, results HASH(0x556e2f380038) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6bb39cfd003df1ea39e5\
 21aa125d819e5088d917 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 82faf1d5c8b25375b9029f2d6668135e62455a8c e481fc9f32339ebf9ddd171a3995a3e44527d148, results HASH(0x556e3003d608) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b1ddbddeee64cee5aba4f0170fbf5e4781d4879 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6e\
 c3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588, results HASH(0x556e3001b3c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82191f8a0e57f674657c7461189e194b6f863e26 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 29efce0f8f10e381417a61f2f9988b40d4f6bcf0, results HASH(0x556e3001fcf8) For basis failure, parent search stopping at c3038e718a19fc59\
 6f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b08a19eae28e76fb5a296a604c27d06fab29b08a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 62dd49f2172fb7dfe8d4223bfa45aede05155328 ea1b7a0733906b8425d948ae94fba63c32b1d425 06264af090ac69a95cdadbc261cc82d964dcb568, results HASH(0x556e30025d38) HASH(0x556e3003b2d8) Result found: flight 185297 (fail), for basis failure (at ancestor ~2005)
 Repro found: flight 185323 (pass), for basis pass
 Repro found: flight 185331 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
No revisions left to test, checking graph state.
 Result found: flight 185378 (pass), for last pass
 Result found: flight 185385 (fail), for first failure
 Repro found: flight 185390 (pass), for last pass
 Repro found: flight 185395 (fail), for first failure
 Repro found: flight 185398 (pass), for last pass
 Repro found: flight 185404 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  28f5ceb0b19b13a7c0ebd125c587e469490ab872
  Bug not present: 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185404/


  commit 28f5ceb0b19b13a7c0ebd125c587e469490ab872
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.376749 to fit
pnmtopng: 29 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-pvshim.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
185404: tolerable ALL FAIL

flight 185404 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185404/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-pvshim   14 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-xl-pvshim                                   fail    


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


