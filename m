Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A29710F7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 10:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794011.1202668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snZLR-0001iV-50; Mon, 09 Sep 2024 08:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794011.1202668; Mon, 09 Sep 2024 08:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snZLR-0001hM-1Y; Mon, 09 Sep 2024 08:01:57 +0000
Received: by outflank-mailman (input) for mailman id 794011;
 Mon, 09 Sep 2024 08:01:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snZLP-0001hC-F4; Mon, 09 Sep 2024 08:01:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snZLP-0005by-5k; Mon, 09 Sep 2024 08:01:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snZLO-0006GT-L2; Mon, 09 Sep 2024 08:01:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snZLO-0000an-KT; Mon, 09 Sep 2024 08:01:54 +0000
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
	bh=RiCqckq789jlL2wBGofq5UJc5sj4KwScWbssIt0cVfk=; b=yOQ+JswfoqR31qXb5+1UAecrfC
	Wd6oKsPD3UA3Iui3Yxqt2SXL0AOmPr8mw5iiRib+puS81G/FAVMN661AFgZC17nYMPPZsQ0MG3U9Q
	31MA82i8kLt76r06dOOJNRha4wWdRKxbU1nyIXNpCpubd2MnxF1866YXT+beSYLnG2w8=;
To: xen-devel@lists.xenproject.org
Subject: [libvirt bisection] complete test-amd64-amd64-libvirt-pair
Message-Id: <E1snZLO-0000an-KT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 08:01:54 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-pair
testid guest-start/debian

Tree: libvirt https://gitlab.com/libvirt/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt https://gitlab.com/libvirt/libvirt.git
  Bug introduced:  3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Bug not present: 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187599/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-start--debian.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-start--debian --summary-out=tmp/187599.bisection-summary --basis-template=187513 --blessings=real,real-bisect,real-retry libvirt test-amd64-amd64-libvirt-pair guest-start/debian
Searching for failure / basis pass:
 187564 fail [dst_host=sabro1,src_host=sabro0] / 187513 [dst_host=debina1,src_host=debina0] 187501 [dst_host=italia1,src_host=italia0] 187489 [dst_host=godello0,src_host=godello1] 187414 [dst_host=albana1,src_host=albana0] 187395 [dst_host=pinot0,src_host=pinot1] 187374 [dst_host=fiano1,src_host=fiano0] 187357 [dst_host=godello1,src_host=godello0] 187318 [dst_host=pinot1,src_host=pinot0] 187308 [dst_host=debina1,src_host=debina0] 187298 ok.
Failure / basis pass flights: 187564 / 187298
(tree with no url: minios)
Tree: libvirt https://gitlab.com/libvirt/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
Basis pass 85e07fb1ceee7943879f8a374cabfa8ab858a3c6 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a30d438ce58b70c5955f5d37f776086ab8f88623
Generating revisions with ./adhoc-revtuple-generator  https://gitlab.com/libvirt/libvirt.git#85e07fb1ceee7943879f8a374cabfa8ab858a3c6-ecffc91d0232ce7a5ee98b8026f2e41926dffe83 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#ee5e09825b810498caeaaa3d46a3410768471053-69950617349402d1c952a54a5edc9a323a7c36b4 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b\
 518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b158dad150bf02879668f72ce306445250838201-b437b5ca4c1a6725897dfd0740de6ef20cacd226 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#ec0bc256ae0ea08a32d3e854e329cfbc141f\
 07ad-2424e4c04aa30d90e85073ea41d18a7845460783 git://xenbits.xen.org/xen.git#a30d438ce58b70c5955f5d37f776086ab8f88623-65e4bc585c28b50ec76f679e1001a81fea9d690b
From git://cache:9419/https://gitlab.com/libvirt/libvirt
   b7a133f200..2feeefc0b4  master     -> origin/master
Loaded 22698 nodes in revision graph
Searching for test results:
 187298 pass 85e07fb1ceee7943879f8a374cabfa8ab858a3c6 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a30d438ce58b70c5955f5d37f776086ab8f88623
 187308 [dst_host=debina1,src_host=debina0]
 187318 [dst_host=pinot1,src_host=pinot0]
 187357 [dst_host=godello1,src_host=godello0]
 187374 [dst_host=fiano1,src_host=fiano0]
 187395 [dst_host=pinot0,src_host=pinot1]
 187414 [dst_host=albana1,src_host=albana0]
 187489 [dst_host=godello0,src_host=godello1]
 187501 [dst_host=italia1,src_host=italia0]
 187513 [dst_host=debina1,src_host=debina0]
 187547 fail irrelevant
 187575 pass 85e07fb1ceee7943879f8a374cabfa8ab858a3c6 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a30d438ce58b70c5955f5d37f776086ab8f88623
 187577 fail irrelevant
 187579 pass 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d c5384273ce2155a5db054a9f5c60b59e374d4bc0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e928ef3592
 187580 pass 3a4a26f53e7b81bfa096ef03cd89f47e92844ae1 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a8a74261681b5010a6f29e18b30739528c8f310c
 187581 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d c923fe32afae37cf27d28ba739c78951db4d658e c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187564 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187582 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 4c6735299540f3c82a5033d35be76a5c42e0fb18 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187583 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187584 pass 008214842011d77fa4feda8d1ff586d29791f8ab 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3151798123e1419e74ebef1df73e9d651f1fcd3e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 a2de7dc4d845738e734b10fce6550c89c6b1092c
 187585 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6eb069e1719a6203814846bd953d85518bc4f21 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 3c09288298af881ea1bb568740deb2d2a06bcd41
 187586 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 8c3ab4ffa953b5ea4724e825ffa7356532814093
 187587 fail 5d77061d7e65e9cb7de4e9f28c2b7a69822da82f 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187588 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187590 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187591 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187596 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187597 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187599 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
Searching for interesting versions
 Result found: flight 187298 (pass), for basis pass
 For basis failure, parent search stopping at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b, results HASH(0x557bf8899c38) HASH(0x557bf88ca000) HASH(0x557bf88b1b30) For basis fai\
 lure, parent search stopping at 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 8c3ab4ffa953b5ea4724e825ffa7356532814093, results HASH(0x557bf88dfbc8) For basis failure, parent search stopping at 4d3a2c61a39f7ca88b930a9e\
 7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6eb069e1719a6203814846bd953d85518bc4f21 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 3c09288298af881ea1bb568740deb2d2a06bcd41, results HASH(0x557bf88af200) For basis failure, parent search stopping at 008214842011d77fa4feda8d1ff586d29791f8ab 22b8996dba9041874845c7446ce89ec4ae2b713\
 d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3151798123e1419e74ebef1df73e9d651f1fcd3e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 a2de7dc4d845738e734b10fce6550c89c6b1092c, results HASH(0x557bf889e570) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 4c6735299540f3c82a5033d35be76a5c42e0fb18 c530a75c1e6a4\
 72b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x557bf88bca80) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d c923fe32afae37cf27d28ba739c78951db4d658e c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab4087\
 6fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x557bf88aabc8) For basis failure, parent search stopping at 3a4a26f53e7b81bfa096ef03cd89f47e92844ae1 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d\
 f9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a8a74261681b5010a6f29e18b30739528c8f310c, results HASH(0x557bf88c0790) For basis failure, parent search stopping at 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d c5384273ce2155a5db054a9f5c60b59e374d4bc0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a3\
 2d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e928ef3592, results HASH(0x557bf88af800) For basis failure, parent search stopping at 85e07fb1ceee7943879f8a374cabfa8ab858a3c6 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad a30d438ce58b70c5955f5d37f776086a\
 b8f88623, results HASH(0x557bf88b2730) HASH(0x557bf88a1f80) Result found: flight 187564 (fail), for basis failure (at ancestor ~9372)
 Repro found: flight 187575 (pass), for basis pass
 Repro found: flight 187583 (fail), for basis failure
 0 revisions at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
No revisions left to test, checking graph state.
 Result found: flight 187588 (pass), for last pass
 Result found: flight 187590 (fail), for first failure
 Repro found: flight 187591 (pass), for last pass
 Repro found: flight 187596 (fail), for first failure
 Repro found: flight 187597 (pass), for last pass
 Repro found: flight 187599 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt https://gitlab.com/libvirt/libvirt.git
  Bug introduced:  3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Bug not present: 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187599/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.721152 to fit
pnmtopng: 64 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-start--debian.{dot,ps,png,html,svg}.
----------------------------------------
187599: tolerable FAIL

flight 187599 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/187599/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 25 guest-start/debian     fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-pair                                fail    


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


