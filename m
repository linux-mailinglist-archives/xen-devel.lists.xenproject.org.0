Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC63FAC96
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 17:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174729.318534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKMkK-0004vH-K4; Sun, 29 Aug 2021 15:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174729.318534; Sun, 29 Aug 2021 15:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKMkK-0004sm-FZ; Sun, 29 Aug 2021 15:29:20 +0000
Received: by outflank-mailman (input) for mailman id 174729;
 Sun, 29 Aug 2021 15:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKMkI-0004s4-Su; Sun, 29 Aug 2021 15:29:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKMkI-00007Y-LI; Sun, 29 Aug 2021 15:29:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKMkI-0006hn-FJ; Sun, 29 Aug 2021 15:29:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKMkI-0007lF-Ej; Sun, 29 Aug 2021 15:29:18 +0000
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
	bh=So6GRsb+NcDpyFBj4hq9Utx2p+RJifF6dzQPlTguH+Y=; b=JHHGeiKYtrC+IWJA3cgnCk+0e2
	DWdLVybsYRjuy0IzeWHTByYzLPAQfBdR7Wq3OnFO8RM61Ub4BFT5gTUld8iLXhygk8wU9XonlAYAO
	Z+oheJzdli6YUKYKiiA5VBR//mQGDFIBe+Ty5MvmpFHUWKuBcv6g7TCLBICn/uzfZOp4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-amd64-dom0pvh-xl-amd
Message-Id: <E1mKMkI-0007lF-Ej@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Aug 2021 15:29:18 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
job test-amd64-amd64-dom0pvh-xl-amd
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Bug not present: f762403ed349df1b04468100dbffd0a6b6fe3303
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164612/


  commit 89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 15:24:37 2021 +0200
  
      x86/p2m: guard (in particular) identity mapping entries
      
      Such entries, created by set_identity_p2m_entry(), should only be
      destroyed by clear_identity_p2m_entry(). However, similarly, entries
      created by set_mmio_p2m_entry() should only be torn down by
      clear_mmio_p2m_entry(), so the logic gets based upon p2m_mmio_direct as
      the entry type (separation between "ordinary" and 1:1 mappings would
      require a further indicator to tell apart the two).
      
      As to the guest_remove_page() change, commit 48dfb297a20a ("x86/PVH:
      allow guest_remove_page to remove p2m_mmio_direct pages"), which
      introduced the call to clear_mmio_p2m_entry(), claimed this was done for
      hwdom only without this actually having been the case. However, this
      code shouldn't be there in the first place, as MMIO entries shouldn't be
      dropped this way. Avoid triggering the warning again that 48dfb297a20a
      silenced by an adjustment to xenmem_add_to_physmap_one() instead.
      
      Note that guest_physmap_mark_populate_on_demand() gets tightened beyond
      the immediate purpose of this change.
      
      Note also that I didn't inspect code which isn't security supported,
      e.g. sharing, paging, or altp2m.
      
      This is CVE-2021-28694 / part of XSA-378.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Paul Durrant <paul@xen.org>
      master commit: 753cb68e653002e89fdcd1c80e52905fdbfb78cb
      master date: 2021-08-25 14:17:32 +0200


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-amd.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-amd.xen-boot --summary-out=tmp/164612.bisection-summary --basis-template=163761 --blessings=real,real-bisect,real-retry xen-4.13-testing test-amd64-amd64-dom0pvh-xl-amd xen-boot
Searching for failure / basis pass:
 164518 fail [host=pinot0] / 164454 [host=pinot1] 164371 ok.
Failure / basis pass flights: 164518 / 164371
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c-7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#3cdc7b6b35106180c9021c1742cafacfa764fdad-dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Loaded 10001 nodes in revision graph
Searching for test results:
 164260 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164301 [host=pinot1]
 164371 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164454 [host=pinot1]
 164496 fail irrelevant
 164519 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164555 fail irrelevant
 164560 pass irrelevant
 164565 fail irrelevant
 164568 fail irrelevant
 164572 fail irrelevant
 164576 pass irrelevant
 164579 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164583 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164587 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 bdb84809402266816449120101fe14a0732d373c
 164589 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 9d954c8c1a3e3cd70cddf9dbf7da7305de9b1173
 164594 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 164600 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164604 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 164608 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164612 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
Searching for interesting versions
 Result found: flight 164260 (pass), for basis pass
 Result found: flight 164518 (fail), for basis failure
 Repro found: flight 164519 (pass), for basis pass
 Repro found: flight 164579 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
No revisions left to test, checking graph state.
 Result found: flight 164583 (pass), for last pass
 Result found: flight 164594 (fail), for first failure
 Repro found: flight 164600 (pass), for last pass
 Repro found: flight 164604 (fail), for first failure
 Repro found: flight 164608 (pass), for last pass
 Repro found: flight 164612 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Bug not present: f762403ed349df1b04468100dbffd0a6b6fe3303
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164612/


  commit 89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 15:24:37 2021 +0200
  
      x86/p2m: guard (in particular) identity mapping entries
      
      Such entries, created by set_identity_p2m_entry(), should only be
      destroyed by clear_identity_p2m_entry(). However, similarly, entries
      created by set_mmio_p2m_entry() should only be torn down by
      clear_mmio_p2m_entry(), so the logic gets based upon p2m_mmio_direct as
      the entry type (separation between "ordinary" and 1:1 mappings would
      require a further indicator to tell apart the two).
      
      As to the guest_remove_page() change, commit 48dfb297a20a ("x86/PVH:
      allow guest_remove_page to remove p2m_mmio_direct pages"), which
      introduced the call to clear_mmio_p2m_entry(), claimed this was done for
      hwdom only without this actually having been the case. However, this
      code shouldn't be there in the first place, as MMIO entries shouldn't be
      dropped this way. Avoid triggering the warning again that 48dfb297a20a
      silenced by an adjustment to xenmem_add_to_physmap_one() instead.
      
      Note that guest_physmap_mark_populate_on_demand() gets tightened beyond
      the immediate purpose of this change.
      
      Note also that I didn't inspect code which isn't security supported,
      e.g. sharing, paging, or altp2m.
      
      This is CVE-2021-28694 / part of XSA-378.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Paul Durrant <paul@xen.org>
      master commit: 753cb68e653002e89fdcd1c80e52905fdbfb78cb
      master date: 2021-08-25 14:17:32 +0200

Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-amd.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164612: tolerable ALL FAIL

flight 164612 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164612/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot             fail baseline untested


jobs:
 test-amd64-amd64-dom0pvh-xl-amd                              fail    


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


