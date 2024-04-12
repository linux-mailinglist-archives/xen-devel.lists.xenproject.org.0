Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC18A3027
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704706.1101213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHYI-0001tX-JW; Fri, 12 Apr 2024 14:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704706.1101213; Fri, 12 Apr 2024 14:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHYI-0001rJ-Gf; Fri, 12 Apr 2024 14:06:50 +0000
Received: by outflank-mailman (input) for mailman id 704706;
 Fri, 12 Apr 2024 14:06:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvHYG-0001pV-Si; Fri, 12 Apr 2024 14:06:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvHYG-0005rt-ME; Fri, 12 Apr 2024 14:06:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvHYG-0001Gu-Ei; Fri, 12 Apr 2024 14:06:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvHYG-0000HB-EH; Fri, 12 Apr 2024 14:06:48 +0000
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
	bh=B3J0muQuJz150mHc8KpfXJLfopGU+i6jPXCN11WEB60=; b=G7+N56Kt9MpFpmkAOykFv96CGt
	kB/YdwHoMGz3Pj7IPtpSXkybLx/WnnfbrDUGA+2UrTsrydLASMD3QnWaksfaoBMR7CueKCyevvB3I
	o95wypEulGfwRgl2lvQjl/9BohnUqx7G+12Uhlib5VZDkIQ2XBZ7pBije5843l8JUz0E=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-amd64-xl-pvshim
Message-Id: <E1rvHYG-0000HB-EH@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Apr 2024 14:06:48 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
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
  Bug introduced:  6672d8ceae4acf0e0ef7dc7002e6146d10507c37
  Bug not present: 65eb8f32b6b82e0268a9d66b49da354bc6698e87
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185372/


  commit 6672d8ceae4acf0e0ef7dc7002e6146d10507c37
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-pvshim.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-pvshim.guest-start --summary-out=tmp/185372.bisection-summary --basis-template=185282 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-amd64-xl-pvshim guest-start
Searching for failure / basis pass:
 185296 fail [host=rimava0] / 185282 [host=nobling1] 185006 [host=pinot0] 184784 ok.
Failure / basis pass flights: 185296 / 184784
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 4e55b32a8d66388bddb21e327f134f14b1a9b004
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 74b5309da9fb7a919bec5a8b5a63d1ede5eb6745 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 82faf1d5c8b25375b9029f2d6668135e62455a8c 2484803074fc1f93942912a82e4906f9e441bf4e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-347385861c50adc8d4801d4b899eded38a2f04cd git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#74b5309da9fb7a919bec5a8b5a63d1ede5eb6745-963671d3801a6992d1aa06f05d86e32efa6b205e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#6503bd6a1b5364ffd346a8a475e1eb91b9f756e5-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#82faf1d5c8b25375b9029f2d6668135e62455a8c-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#2484803074fc1f93942912a82e4906f9e441bf4e-4e55b32a8d66388bddb21e327f134f14b1a9b004
adhoc-revtuple-generator: tree discontiguous: linux-pvops
Loaded 12695 nodes in revision graph
Searching for test results:
 184784 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 74b5309da9fb7a919bec5a8b5a63d1ede5eb6745 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 82faf1d5c8b25375b9029f2d6668135e62455a8c 2484803074fc1f93942912a82e4906f9e441bf4e
 185006 [host=pinot0]
 185282 [host=nobling1]
 185315 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 74b5309da9fb7a919bec5a8b5a63d1ede5eb6745 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 82faf1d5c8b25375b9029f2d6668135e62455a8c 2484803074fc1f93942912a82e4906f9e441bf4e
 185296 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 4e55b32a8d66388bddb21e327f134f14b1a9b004
 185324 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 4e55b32a8d66388bddb21e327f134f14b1a9b004
 185328 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bf8f16f771d48c7cb4c0dfa548d296972513efe2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 3722c21de19ba64de56495502c0c025b913a9b15 0fb100a94d0127910fe1dfa253cb759f6bc11174
 185330 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 8707f835ae355832965508b6be96765660fb1861 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 aa94925d296dc31a38360056227ffb0eea749572 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185333 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 13e7c5a9f1b4a6fab563a5994487fc60778073d5
 185340 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ddfbeb0d6b76d787c8d6d05232ef04da6a9cdfc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185345 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 2a33c31e4affbca0651599e3b204a01ce7b48a3e
 185349 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185354 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185357 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 6672d8ceae4acf0e0ef7dc7002e6146d10507c37
 185363 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185365 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 6672d8ceae4acf0e0ef7dc7002e6146d10507c37
 185368 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
 185372 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 6672d8ceae4acf0e0ef7dc7002e6146d10507c37
Searching for interesting versions
 Result found: flight 184784 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87, results HASH(0x55ecb1236150) HASH(0x55ecb123a5e0) HASH(0x55ecb1224950) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87, results HASH(0x55ecb1239b60) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ddfbeb0d6b76d787c8d6d05232ef04da6a9cdfc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a4\
 75e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87, results HASH(0x55ecb1231218) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 8707f835ae355832965508b6be96765660fb1861 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 aa94925d296dc31a38360056227ffb0eea749572 65eb8f32b6b82e0268a9d66b49da354bc6698e87, results HASH(0x55ecb122c398) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bf8f16f771d48c7cb4c0dfa548d296972513efe2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 3722c21de19ba64de56495502c0c025b913a9b15 0fb100a94d0127910fe1dfa253cb759f6bc11174, results HASH(0x55ecb122a368) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 74b5309da9fb7a919bec\
 5a8b5a63d1ede5eb6745 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 82faf1d5c8b25375b9029f2d6668135e62455a8c 2484803074fc1f93942912a82e4906f9e441bf4e, results HASH(0x55ecb1217250) HASH(0x55ecb121de90) Result found: flight 185296 (fail), for basis failure (at ancestor ~857)
 Repro found: flight 185315 (pass), for basis pass
 Repro found: flight 185324 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 c5a361c09a19e3b1a83557b01f11f04b27181a11 65eb8f32b6b82e0268a9d66b49da354bc6698e87
No revisions left to test, checking graph state.
 Result found: flight 185354 (pass), for last pass
 Result found: flight 185357 (fail), for first failure
 Repro found: flight 185363 (pass), for last pass
 Repro found: flight 185365 (fail), for first failure
 Repro found: flight 185368 (pass), for last pass
 Repro found: flight 185372 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6672d8ceae4acf0e0ef7dc7002e6146d10507c37
  Bug not present: 65eb8f32b6b82e0268a9d66b49da354bc6698e87
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185372/


  commit 6672d8ceae4acf0e0ef7dc7002e6146d10507c37
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

pnmtopng: 251 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-pvshim.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
185372: tolerable ALL FAIL

flight 185372 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185372/

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


