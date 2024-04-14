Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7A8A407A
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 08:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705393.1102144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvsxW-00027l-S4; Sun, 14 Apr 2024 06:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705393.1102144; Sun, 14 Apr 2024 06:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvsxW-00025t-PG; Sun, 14 Apr 2024 06:03:22 +0000
Received: by outflank-mailman (input) for mailman id 705393;
 Sun, 14 Apr 2024 06:03:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvsxV-00025j-Dp; Sun, 14 Apr 2024 06:03:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvsxV-0000BP-Az; Sun, 14 Apr 2024 06:03:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvsxV-0006zH-3R; Sun, 14 Apr 2024 06:03:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvsxV-0000wj-2x; Sun, 14 Apr 2024 06:03:21 +0000
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
	bh=b/QSLK7LI5YYgG94eo5EUfES4KqswdCMaOAD1srv9Cw=; b=jObxKP9gKaObw0dlHFbs/Zr+4I
	YHXH6N3c35jbXw0M3ELGt4AoU4gFtI5/E7JrWAeBds2JJgX1k5tAViRSRanMQNFmWT9FE6yEhzp9u
	/HIRouJlv1OUtSmMBinr+U2xL6sW5oM83soKfjfFZ+GojTR8D3UPOOte/raGXKJbm0VE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.18-testing bisection] complete test-amd64-amd64-xl-vhd
Message-Id: <E1rvsxV-0000wj-2x@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2024 06:03:21 +0000

branch xen-4.18-testing
xenbranch xen-4.18-testing
job test-amd64-amd64-xl-vhd
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
  Bug not present: 1166467ed300d605529aaf7a7d26c8c92defe36a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185484/


  commit 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.18-testing/test-amd64-amd64-xl-vhd.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.18-testing/test-amd64-amd64-xl-vhd.debian-di-install --summary-out=tmp/185484.bisection-summary --basis-template=185285 --blessings=real,real-bisect,real-retry xen-4.18-testing test-amd64-amd64-xl-vhd debian-di-install
Searching for failure / basis pass:
 185427 fail [host=rimava0] / 185285 [host=debina1] 185218 [host=pinot0] 185183 [host=himrod0] 185172 [host=fiano0] template as basis? using template as basis.
Failure / basis pass flights: 185427 / 185285
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 2d38302c33b117aa9a417056db241aefc840c2f0
Basis pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1588fd1437960d94cadc30c42243671e8c0f1281 1166467ed300d605529aaf7a7d26c8c92defe36a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#347385861c50adc8d4801d4b899eded38a2f04cd-bf1e3b1cb1e002ed1590c91f1a24433b59322368 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#932db9df0caa26daca4edf133fb2aed7b4a9193e-98f150a954b35cc74bd87ae355cf35d8c9e1580d git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#1588fd1437960d94cadc30c42243671e8c0f1281-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#1166467ed300d605529aaf7a7d26c8c92defe36a-2d38302c33b117aa9a417056db241aefc840c2f0
Loaded 25239 nodes in revision graph
Searching for test results:
 185285 [host=debina1]
 185303 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 d152a0424677d8b78e00ed1270a583c5dafff16f
 185359 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1588fd1437960d94cadc30c42243671e8c0f1281 1166467ed300d605529aaf7a7d26c8c92defe36a
 185374 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 d152a0424677d8b78e00ed1270a583c5dafff16f
 185383 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1588fd1437960d94cadc30c42243671e8c0f1281 1166467ed300d605529aaf7a7d26c8c92defe36a
 185389 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 d152a0424677d8b78e00ed1270a583c5dafff16f
 185394 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 4c2208d06cd03e54f97b98b4449dc717fc1dcee5
 185402 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 a44c2c9f89e53e6691b42217fb34d985b28f3cf0
 185410 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa94925d296dc31a38360056227ffb0eea749572 1166467ed300d605529aaf7a7d26c8c92defe36a
 185337 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 2d38302c33b117aa9a417056db241aefc840c2f0
 185416 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 22c91412600b7fabd75ef68d2d4d3e63e9e27f9f 1166467ed300d605529aaf7a7d26c8c92defe36a
 185423 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 2d38302c33b117aa9a417056db241aefc840c2f0
 185432 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
 185441 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 1166467ed300d605529aaf7a7d26c8c92defe36a
 185447 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
 185454 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 1166467ed300d605529aaf7a7d26c8c92defe36a
 185459 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
 185427 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 2d38302c33b117aa9a417056db241aefc840c2f0
 185470 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 1166467ed300d605529aaf7a7d26c8c92defe36a
 185484 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
Searching for interesting versions
 Result found: flight 185359 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 1166467ed300d605529aaf7a7d26c8c92defe36a, results HASH(0x564ad266c4a8) HASH(0x564ad266f6d8) HASH(0x564ad2650120) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 22c91412600b7fabd75ef68d2d4d3e63e9e27f9f 1166467ed300d605529aaf7a7d26c8c92defe36a, results HASH(0x564ad2666f70) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c57\
 4356f572342c03e6 aa94925d296dc31a38360056227ffb0eea749572 1166467ed300d605529aaf7a7d26c8c92defe36a, results HASH(0x564ad2661fd8) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1588fd1437960d94cadc30c42243671e8c0f1281 1166467ed300d605529aaf7a7d26c8c92defe36a, results HASH(0x564ad2647ad8) HASH(0x56\
 4ad261e350) Result found: flight 185374 (fail), for basis failure (at ancestor ~7533)
 Repro found: flight 185383 (pass), for basis pass
 Repro found: flight 185423 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c5a361c09a19e3b1a83557b01f11f04b27181a11 1166467ed300d605529aaf7a7d26c8c92defe36a
No revisions left to test, checking graph state.
 Result found: flight 185441 (pass), for last pass
 Result found: flight 185447 (fail), for first failure
 Repro found: flight 185454 (pass), for last pass
 Repro found: flight 185459 (fail), for first failure
 Repro found: flight 185470 (pass), for last pass
 Repro found: flight 185484 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
  Bug not present: 1166467ed300d605529aaf7a7d26c8c92defe36a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185484/


  commit 6d4055b9a5d1d800d7f0e5584b9a0213bf25cd8b
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

pnmtopng: 215 colors found
Revision graph left in /home/logs/results/bisect/xen-4.18-testing/test-amd64-amd64-xl-vhd.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
185484: tolerable ALL FAIL

flight 185484 xen-4.18-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185484/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-vhd      12 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-xl-vhd                                      fail    


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


