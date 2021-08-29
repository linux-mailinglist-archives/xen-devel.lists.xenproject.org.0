Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48A3FA96C
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 08:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174546.318271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKDro-0008Gn-Ja; Sun, 29 Aug 2021 06:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174546.318271; Sun, 29 Aug 2021 06:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKDro-0008EE-FX; Sun, 29 Aug 2021 06:00:28 +0000
Received: by outflank-mailman (input) for mailman id 174546;
 Sun, 29 Aug 2021 06:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKDrm-0008E4-9x; Sun, 29 Aug 2021 06:00:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKDrm-0006eN-0G; Sun, 29 Aug 2021 06:00:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKDrl-0006jb-Om; Sun, 29 Aug 2021 06:00:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKDrl-0001u9-OF; Sun, 29 Aug 2021 06:00:25 +0000
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
	bh=YQnaR+gH8qVRgZQufyW3lAOVhd5qdQRkKOIg2yQifhg=; b=5kfoKfQ/Li9APkWvqU15818kCl
	6m9zehOFnPfiBZesaj7a9RA8K4UK1+Fc8a6j/1a3XuBjmDhtRG0j8XnlBPrzXyuQUjc8RVTKuSdW7
	dpLq+k/RzPoBAxjnZcY4yZt2EDPVafpySMAEt/d2200pGKck8WrOlFoMlTbPa2N1bhXo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1mKDrl-0001u9-OF@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Aug 2021 06:00:25 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
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
  Bug introduced:  6f4c2146893c10ec17e854242613428f96e86757
  Bug not present: 968526568c5519e32298b5cef8f05a6caee5f721
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164582/


  commit 6f4c2146893c10ec17e854242613428f96e86757
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 15:06:51 2021 +0200
  
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/164582.bisection-summary --basis-template=163750 --blessings=real,real-bisect,real-retry xen-4.14-testing test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 164507 fail [host=elbling0] / 164426 [host=huxelrebe1] 164353 [host=godello1] 164300 [host=godello0] 164261 [host=elbling1] 163750 [host=fiano0] 163726 [host=elbling1] 163709 [host=fiano1] 162891 [host=huxelrebe1] 162881 [host=godello0] 162547 [host=albana0] 162365 ok.
Failure / basis pass flights: 164507 / 162365
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 74e93071826fe3aaab32e469280a3253a39147f6
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 81433aa8a19b36f9e3d50697608c93d8a28bf772 b046e05736deecbd8254540c5e45444115fb1c98
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#75e9154f818a58ffc3a28db9f8c97279e723f02d-7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#d7d6a60e73ee21e82f0bac2036153ccccf996e6c-d7d6a60e73ee21e82f0bac2036153ccccf996e6c git://xenbits.xen.org/osstest/seabios.git#81433aa8a19b36f9e3d50697608c93d8a28bf772-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#b046e05736deecbd8254540c5e45444115fb1c98-74e93071826fe3aaab32e469280a3253a39147f6
Loaded 12607 nodes in revision graph
Searching for test results:
 162881 [host=godello0]
 162891 [host=huxelrebe1]
 163709 [host=fiano1]
 163726 [host=elbling1]
 163750 [host=fiano0]
 164261 [host=elbling1]
 164300 [host=godello0]
 164353 [host=godello1]
 164426 [host=huxelrebe1]
 164493 fail irrelevant
 164508 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 81433aa8a19b36f9e3d50697608c93d8a28bf772 b046e05736deecbd8254540c5e45444115fb1c98
 164507 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 74e93071826fe3aaab32e469280a3253a39147f6
 164534 fail irrelevant
 164536 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8697dc60cc28b2673aed4998fb6b21b9bf54a76d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 b6a8c4f72def4d1135ff42660a86276ce2565c8c
 164538 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0deeab36d179e79de7b93bb930b4d6eb24185416 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 49299c4813b7847d29df07bf790f5489060f2a9c
 164540 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c82d6dd4a353d3314b7eb7dffd8321204a1c217b 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 49299c4813b7847d29df07bf790f5489060f2a9c
 164542 pass irrelevant
 164546 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 74e93071826fe3aaab32e469280a3253a39147f6
 164549 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 f7a973031675e0be4a31178bfae28ab4a305dbdf
 164551 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 29aeeda345168a70facfd7c7ef16fbea6d447061
 164562 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 968526568c5519e32298b5cef8f05a6caee5f721
 164566 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 6f4c2146893c10ec17e854242613428f96e86757
 164557 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 19587584f2f780547a8216b1b9d5cdf3dde29131
 164570 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 968526568c5519e32298b5cef8f05a6caee5f721
 164573 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 6f4c2146893c10ec17e854242613428f96e86757
 164578 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 968526568c5519e32298b5cef8f05a6caee5f721
 164582 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 6f4c2146893c10ec17e854242613428f96e86757
 162365 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 81433aa8a19b36f9e3d50697608c93d8a28bf772 b046e05736deecbd8254540c5e45444115fb1c98
 162547 [host=albana0]
Searching for interesting versions
 Result found: flight 162365 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 968526568c5519e32298b5cef8f05a6caee5f721, results HASH(0x5629a5e486f0) HASH(0x5629a5e060a8) HASH(0x5629a5e44ce0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 19587584f2f780547a8216b1b9d5cdf3dde29131, results HASH(0x5629a5e0eff0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac20\
 36153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 f7a973031675e0be4a31178bfae28ab4a305dbdf, results HASH(0x5629a5e242b8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c82d6dd4a353d3314b7eb7dffd8321204a1c217b 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 49299c4813b7847d29df07bf790f5489060f2a9c, results HASH(0x5629a5df8828) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0deeab36d179e79de7b93bb930b4d6eb24185416 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 49299c4813b7847d29df07bf790f5489060f2a9c, results HASH(0x5629a5e26be8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8697dc60cc28b2673aed\
 4998fb6b21b9bf54a76d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 b6a8c4f72def4d1135ff42660a86276ce2565c8c, results HASH(0x5629a5e11620) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 81433aa8a19b36f9e3d50697608c93d8a28\
 bf772 b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x5629a5e13328) HASH(0x5629a5e13628) Result found: flight 164507 (fail), for basis failure (at ancestor ~601)
 Repro found: flight 164508 (pass), for basis pass
 Repro found: flight 164546 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 968526568c5519e32298b5cef8f05a6caee5f721
No revisions left to test, checking graph state.
 Result found: flight 164562 (pass), for last pass
 Result found: flight 164566 (fail), for first failure
 Repro found: flight 164570 (pass), for last pass
 Repro found: flight 164573 (fail), for first failure
 Repro found: flight 164578 (pass), for last pass
 Repro found: flight 164582 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6f4c2146893c10ec17e854242613428f96e86757
  Bug not present: 968526568c5519e32298b5cef8f05a6caee5f721
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164582/


  commit 6f4c2146893c10ec17e854242613428f96e86757
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 15:06:51 2021 +0200
  
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

pnmtopng: 137 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164582: tolerable ALL FAIL

flight 164582 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164582/

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


