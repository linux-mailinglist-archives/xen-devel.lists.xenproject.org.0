Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A23FAC07
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 15:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174701.318489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKL6K-0002Fh-GM; Sun, 29 Aug 2021 13:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174701.318489; Sun, 29 Aug 2021 13:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKL6K-0002Cq-C1; Sun, 29 Aug 2021 13:43:56 +0000
Received: by outflank-mailman (input) for mailman id 174701;
 Sun, 29 Aug 2021 13:43:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKL6J-0002Cg-2w; Sun, 29 Aug 2021 13:43:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKL6I-0006bQ-Te; Sun, 29 Aug 2021 13:43:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKL6I-0002WA-ML; Sun, 29 Aug 2021 13:43:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKL6I-0008VW-Lq; Sun, 29 Aug 2021 13:43:54 +0000
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
	bh=/ScI4RYuTCE/eqSt8lOUXCg36UKBdm8Y6BlXYYHbsaU=; b=vU3JaQkH0gN/NaZVNiXIFdXfdd
	hXKpZDdHfvqGAvLuAd5AeKtn57EYIDBvxD/OtGBUeOuK8AW52+ymruQPhiWQR4ObUZDbshn0FRVdx
	w2Cuo7OnSilcY90eHqpdhseRvBzZW6PW2aVtsqdhV88+DTkduKLlbgh2UY2tiAT3XAuI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1mKL6I-0008VW-Lq@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Aug 2021 13:43:54 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job test-amd64-amd64-dom0pvh-xl-intel
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
  Bug introduced:  7850fe53a59f73fbb0a61c36141c6a6563e3eeca
  Bug not present: 9f44ed133f303f73a40b2447a9e39d39f879e96f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164606/


  commit 7850fe53a59f73fbb0a61c36141c6a6563e3eeca
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 14:43:45 2021 +0200
  
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/164606.bisection-summary --basis-template=163759 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 164511 fail [host=chardonnay0] / 164455 [host=albana1] 164390 [host=huxelrebe1] 164304 [host=godello0] 164262 [host=godello1] 163759 ok.
Failure / basis pass flights: 164511 / 163759
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 91bb9e9b0c0e2af926ab08958f3d65f07a105cb6
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#e2af2d050338c99e8436e251ad67aafb3ebbd501-e2af2d050338c99e8436e251ad67aafb3ebbd501 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#dba774896f7dd74773c14d537643b7d7477fefcd-91bb9e9b0c0e2af926ab08958f3d65f07a105cb6
Loaded 10001 nodes in revision graph
Searching for test results:
 163759 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd
 164262 [host=godello1]
 164304 [host=godello0]
 164390 [host=huxelrebe1]
 164455 [host=albana1]
 164495 fail irrelevant
 164512 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd
 164511 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 91bb9e9b0c0e2af926ab08958f3d65f07a105cb6
 164541 fail irrelevant
 164545 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c28fc8ab3bc1376484cc8cd1dc959e288741a4d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd
 164548 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9abc60f9f722d891b3cedb0205fd6c9c0e2af54b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd
 164552 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 da659f61c79f3adb7a4ab23e64fd21d2d9f801c1
 164554 pass irrelevant
 164558 fail irrelevant
 164561 pass irrelevant
 164567 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 91bb9e9b0c0e2af926ab08958f3d65f07a105cb6
 164571 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 34d141e27eea77d0ec8f2d19789bba314d24144a
 164574 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 8a8b16c44e3e4cae097224511b72dfd7b059152b
 164580 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 9f44ed133f303f73a40b2447a9e39d39f879e96f
 164584 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 d40287a000ec20252006d92c51a69f14be808fd5
 164585 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 7850fe53a59f73fbb0a61c36141c6a6563e3eeca
 164591 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 9f44ed133f303f73a40b2447a9e39d39f879e96f
 164593 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 7850fe53a59f73fbb0a61c36141c6a6563e3eeca
 164599 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 9f44ed133f303f73a40b2447a9e39d39f879e96f
 164606 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 7850fe53a59f73fbb0a61c36141c6a6563e3eeca
Searching for interesting versions
 Result found: flight 163759 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 9f44ed133f303f73a40b2447a9e39d39f879e96f, results HASH(0x556ae2711250) HASH(0x556ae270ac10) HASH(0x556ae2718b80) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 34d141e27eea77d0ec8f2d19789bba314d24144a, results HASH(0x556ae2727688) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251\
 ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 da659f61c79f3adb7a4ab23e64fd21d2d9f801c1, results HASH(0x556ae0ecf3d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9abc60f9f722d891b3cedb0205fd6c9c0e2af54b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd, results HASH(0x556ae26e1188) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c28fc8ab3bc1376484cc8cd1dc959e288741a4d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd, results HASH(0x556ae26ec400) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3\
 d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 dba774896f7dd74773c14d537643b7d7477fefcd, results HASH(0x556ae26e4898) HASH(0x556ae270e620) Result found: flight 164511 (fail), for basis failure (at ancestor ~518)
 Repro found: flight 164512 (pass), for basis pass
 Repro found: flight 164567 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 9f44ed133f303f73a40b2447a9e39d39f879e96f
No revisions left to test, checking graph state.
 Result found: flight 164580 (pass), for last pass
 Result found: flight 164585 (fail), for first failure
 Repro found: flight 164591 (pass), for last pass
 Repro found: flight 164593 (fail), for first failure
 Repro found: flight 164599 (pass), for last pass
 Repro found: flight 164606 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7850fe53a59f73fbb0a61c36141c6a6563e3eeca
  Bug not present: 9f44ed133f303f73a40b2447a9e39d39f879e96f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164606/


  commit 7850fe53a59f73fbb0a61c36141c6a6563e3eeca
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 14:43:45 2021 +0200
  
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

pnmtopng: 152 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164606: tolerable ALL FAIL

flight 164606 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164606/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot           fail baseline untested


jobs:
 test-amd64-amd64-dom0pvh-xl-intel                            fail    


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


