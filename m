Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070193FC02D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 02:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175365.319544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs3a-0002UW-F7; Tue, 31 Aug 2021 00:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175365.319544; Tue, 31 Aug 2021 00:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs3a-0002RD-9h; Tue, 31 Aug 2021 00:55:18 +0000
Received: by outflank-mailman (input) for mailman id 175365;
 Tue, 31 Aug 2021 00:55:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKs3Y-0002R1-86; Tue, 31 Aug 2021 00:55:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKs3Y-0002lB-1t; Tue, 31 Aug 2021 00:55:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKs3X-00072O-Ru; Tue, 31 Aug 2021 00:55:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKs3X-0008GT-RT; Tue, 31 Aug 2021 00:55:15 +0000
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
	bh=BbiHFWACpXmuTZQyZ093lIYBNHycAWepkbLFaxCIR3M=; b=CmiXRHu0CE/ZkuOVW1lecuaNjo
	NkutHho5ta70UnSlfcesPLzSFvG0KifB2bvuion6d3VEN8ipKnhwFo/C8rF+lX+QUDNMHXtoeB0RX
	B0ajuz6VGkbG0UPJ5NxGzgGxhOmhZVoAPd8foPHW4hPSHzsGNG/4MxtX+q8S0YQqmQuA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1mKs3X-0008GT-RT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Aug 2021 00:55:15 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
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
  Bug introduced:  89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Bug not present: f762403ed349df1b04468100dbffd0a6b6fe3303
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164672/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/164672.bisection-summary --basis-template=163761 --blessings=real,real-bisect,real-retry xen-4.13-testing test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 164577 fail [host=chardonnay0] / 164454 [host=fiano1] 164371 [host=godello1] 164301 [host=godello0] 164260 [host=huxelrebe1] 163761 [host=godello1] 163730 [host=godello0] 163711 [host=elbling0] 162550 [host=huxelrebe0] 162367 [host=godello1] 161770 [host=huxelrebe0] 161323 [host=elbling0] 160326 [host=fiano1] 160154 [host=godello1] 160142 [host=chardonnay1] 160129 [host=albana0] 159839 [host=godello1] 159448 [host=chardonnay1] 159419 [host=huxelrebe1] 158557 [host=elbling1] 157733 [host=huxelre\
 be1] 157716 [host=huxelrebe0] 157664 [host=godello1] 157629 ok.
Failure / basis pass flights: 164577 / 157629
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82f7e315d612399f65a3bedd3b2c0364b43b6929 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#f95e80d832e923046c92cd6f0b8208cec147138e-82f7e315d612399f65a3bedd3b2c0364b43b6929 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#748d619be3282fba35f99446098ac2d0579f6063-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#10c7c213bef26274684798deb3e351a6756046d2-dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Loaded 12607 nodes in revision graph
Searching for test results:
 163711 [host=elbling0]
 163730 [host=godello0]
 163761 [host=godello1]
 157563 [host=albana1]
 157597 [host=godello0]
 157629 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
 157664 [host=godello1]
 157716 [host=huxelrebe0]
 157733 [host=huxelrebe1]
 158557 [host=elbling1]
 164260 [host=huxelrebe1]
 164301 [host=godello0]
 164371 [host=godello1]
 164454 [host=fiano1]
 159419 [host=huxelrebe1]
 159448 [host=chardonnay1]
 164496 fail irrelevant
 164518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 159839 [host=godello1]
 164577 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82f7e315d612399f65a3bedd3b2c0364b43b6929 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164635 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164615 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
 164638 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4ab7201f29a182f31facc093b674d475e518f32 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 57a60c1f2779ce6d6ab5c2f677c4d0c66b09b08b
 160129 [host=albana0]
 160142 [host=chardonnay1]
 164640 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c f7993297b3469f4396af8ed14ba376982cabd64b
 164642 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 be282b14938846960cce30825a9fe762e14ca8c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 2c9da5f73c3a2378036c982bf0b189b34befc403
 164643 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19107590b6ca31d855885845a1f5615bac141b35 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82f7e315d612399f65a3bedd3b2c0364b43b6929 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164648 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca1773878d2626ee70823d52d594910c4b95dfe9 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164651 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 18fe877620e428c1d12b3ec4b3385dace07f686f
 164652 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 985b3e50cda925fb2755b49b3c4a1c7a339d8ae4
 164654 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 160154 [host=godello1]
 164656 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 ebeb9ec0ad4dd63ec3b5d5d092ea56bc6fe0170f
 164659 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164661 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 164666 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164668 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 164670 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
 164672 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 89d40f0682f9ad37091cc53685f3ecf63a44bb72
 160326 [host=fiano1]
 161323 [host=elbling0]
 161770 [host=huxelrebe0]
 162367 [host=godello1]
 162550 [host=huxelrebe0]
Searching for interesting versions
 Result found: flight 157629 (pass), for basis pass
 Result found: flight 164518 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 164615 (pass), for basis pass
 Repro found: flight 164645 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 f762403ed349df1b04468100dbffd0a6b6fe3303
No revisions left to test, checking graph state.
 Result found: flight 164659 (pass), for last pass
 Result found: flight 164661 (fail), for first failure
 Repro found: flight 164666 (pass), for last pass
 Repro found: flight 164668 (fail), for first failure
 Repro found: flight 164670 (pass), for last pass
 Repro found: flight 164672 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  89d40f0682f9ad37091cc53685f3ecf63a44bb72
  Bug not present: f762403ed349df1b04468100dbffd0a6b6fe3303
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164672/


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

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.556023 to fit
pnmtopng: 71 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164672: tolerable ALL FAIL

flight 164672 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164672/

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


