Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F498A7B0B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 05:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707227.1104970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwvqI-0004As-VD; Wed, 17 Apr 2024 03:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707227.1104970; Wed, 17 Apr 2024 03:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwvqI-00047d-S4; Wed, 17 Apr 2024 03:20:14 +0000
Received: by outflank-mailman (input) for mailman id 707227;
 Wed, 17 Apr 2024 03:20:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwvqH-00047O-0O; Wed, 17 Apr 2024 03:20:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwvqG-0001P5-UW; Wed, 17 Apr 2024 03:20:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwvqG-0004Z2-IQ; Wed, 17 Apr 2024 03:20:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwvqG-0002df-Hw; Wed, 17 Apr 2024 03:20:12 +0000
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
	bh=iD39hm7MfkH9PmnOnopwXJ43drvAXNbyKWcI62b6LQ0=; b=xRUFqfp0wbUyimndIfMRV43pDd
	L/Fb8p2YHt5Bnxq4krtieCfNUY+VLSGbdXDlZelforsAjnJfrx3mLdITPbNmz29Ttt7Ku4U7Av387
	2BTO9fAz/0o2hF5DAm6oQxLlgaYN2q+Q4ed7mfJheAdiUfYvcAuFDsgCeIj1mRyooImc=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1rwvqG-0002df-Hw@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Apr 2024 03:20:12 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  295bf24af77c0556fe023ce727734fd27226b37c
  Bug not present: ec8f105f9c7744408ddea6b320d55703f9e0f522
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185699/


  commit 295bf24af77c0556fe023ce727734fd27226b37c
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 15 17:46:53 2024 +0100
  
      x86/vmx: Add support for virtualize SPEC_CTRL
      
      The feature is defined in the tertiary exec control, and is available starting
      from Sapphire Rapids and Alder Lake CPUs.
      
      When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
      set in mask are not allowed to be toggled by the guest (either set or clear)
      and the value in the shadow field is the value the guest expects to be in the
      SPEC_CTRL register.
      
      By using it the hypervisor can force the value of SPEC_CTRL bits behind the
      guest back without having to trap all accesses to SPEC_CTRL, note that no bits
      are forced into the guest as part of this patch.  It also allows getting rid of
      SPEC_CTRL in the guest MSR load list, since the value in the shadow field will
      be loaded by the hardware on vmentry.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      (cherry picked from commit 97c5b8b657e41a6645de9d40713b881234417b49)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore --summary-out=tmp/185699.bisection-summary --basis-template=185283 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm guest-saverestore
Searching for failure / basis pass:
 185407 fail [host=albana0] / 185283 [host=septiner1] 185007 [host=sabro1] 184804 [host=fiano0] 184530 [host=debina0] 184108 ok.
Failure / basis pass flights: 185407 / 184108
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee7ba349c0c1ce489001a338a4e28555728b573 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-bf1e3b1cb1e002ed1590c91f1a24433b59322368 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#cee7ba349c0c1ce489001a338a4e28555728b573-98f150a954b35cc74bd87ae355cf35d8c9e1580d git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3-c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 git://xenbits.xen.org/osstest/seabios.git#a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#e7c3d6ceaf73120098f9213fd12f79fd50e8e588-150f6cdbfe079816a0df8b9d57320ca42fc39d12
adhoc-revtuple-generator: tree discontiguous: linux-pvops
From git://cache:9419/git://xenbits.xen.org/xen
   672b26b66e..c0f890cd9d  master     -> origin/master
Loaded 12695 nodes in revision graph
Searching for test results:
 184108 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee7ba349c0c1ce489001a338a4e28555728b573 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588
 184530 [host=debina0]
 184804 [host=fiano0]
 185007 [host=sabro1]
 185283 [host=septiner1]
 185297 fail irrelevant
 185322 fail irrelevant
 185407 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
 185462 []
 185518 []
 185556 []
 185663 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee7ba349c0c1ce489001a338a4e28555728b573 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588
 185665 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
 185667 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e32b58ab5a12d37c82327f28376e7d12cccc8b3a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 82faf1d5c8b25375b9029f2d6668135e62455a8c e481fc9f32339ebf9ddd171a3995a3e44527d148
 185670 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ccf91b518f22102d446f26320110d30ea0fc1fa9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 163fd9f0872f95366cfe34eb11568934c2d2fe29 ffd75b161de76e43fd54d751ab70d2fdf6e2e87d
 185675 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8f56800fd3a280b1ce9ff6da7f9581304b6a40d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 913680885350f92965d70122f6fd54406c49af7d ea1da2ba8ea7c76a8a3a08d11f7de5acb8b17801
 185676 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 40d05ac943b8102ac32ee85912a89f9eaf46e850
 185679 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 25a496fd22b7ef3b808c0dda35c4610ef41ef632
 185682 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 a8bb8926fd046cd7fa880a057b2675f33c1bfe77
 185685 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7efe5a0eee0e4f593c064b7f1b106acc74d8c7f9
 185688 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185689 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185691 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185693 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185696 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185697 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185699 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
Searching for interesting versions
 Result found: flight 184108 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522, results HASH(0x55f7841d0a58) HASH(0x55f7841b2848) HASH(0x55f784172b08) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7efe5a0eee0e4f593c064b7f1b106acc74d8c7f9, results HASH(0x55f7841c8110) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641c\
 c35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 a8bb8926fd046cd7fa880a057b2675f33c1bfe77, results HASH(0x55f7841c40d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 40d05ac943b8102ac32ee85912a89f9eaf46e850, results HASH(0x55f7841b7780) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8f56800fd3a280b1ce9ff6da7f9581304b6a40d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 913680885350f92965d70122f6fd54406c49af7d ea1da2ba8ea7c76a8a3a08d11f7de5acb8b17801, results HASH(0x55f7841b4550) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ccf91b518f22102d446f\
 26320110d30ea0fc1fa9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 163fd9f0872f95366cfe34eb11568934c2d2fe29 ffd75b161de76e43fd54d751ab70d2fdf6e2e87d, results HASH(0x55f7841b0518) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e32b58ab5a12d37c82327f28376e7d12cccc8b3a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 82faf1d5c8b25375b9029f2d6668135e624\
 55a8c e481fc9f32339ebf9ddd171a3995a3e44527d148, results HASH(0x55f7841ac508) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee7ba349c0c1ce489001a338a4e28555728b573 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8 e7c3d6ceaf73120098f9213fd12f79fd50e8e588, results HASH(0x55f784193648) HASH(0x55f7841843c0) Result found: flight 185407 (fail), for \
 basis failure (at ancestor ~1092)
 Repro found: flight 185663 (pass), for basis pass
 Repro found: flight 185665 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
No revisions left to test, checking graph state.
 Result found: flight 185689 (pass), for last pass
 Result found: flight 185691 (fail), for first failure
 Repro found: flight 185693 (pass), for last pass
 Repro found: flight 185696 (fail), for first failure
 Repro found: flight 185697 (pass), for last pass
 Repro found: flight 185699 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  295bf24af77c0556fe023ce727734fd27226b37c
  Bug not present: ec8f105f9c7744408ddea6b320d55703f9e0f522
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185699/


  commit 295bf24af77c0556fe023ce727734fd27226b37c
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 15 17:46:53 2024 +0100
  
      x86/vmx: Add support for virtualize SPEC_CTRL
      
      The feature is defined in the tertiary exec control, and is available starting
      from Sapphire Rapids and Alder Lake CPUs.
      
      When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
      set in mask are not allowed to be toggled by the guest (either set or clear)
      and the value in the shadow field is the value the guest expects to be in the
      SPEC_CTRL register.
      
      By using it the hypervisor can force the value of SPEC_CTRL bits behind the
      guest back without having to trap all accesses to SPEC_CTRL, note that no bits
      are forced into the guest as part of this patch.  It also allows getting rid of
      SPEC_CTRL in the guest MSR load list, since the value in the shadow field will
      be loaded by the hardware on vmentry.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      (cherry picked from commit 97c5b8b657e41a6645de9d40713b881234417b49)

pnmtopng: 111 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
185699: tolerable ALL FAIL

flight 185699 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185699/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    


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


