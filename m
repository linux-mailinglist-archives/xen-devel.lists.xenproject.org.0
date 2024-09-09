Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE589725CE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 01:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794915.1203957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sno2U-0000N9-Bl; Mon, 09 Sep 2024 23:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794915.1203957; Mon, 09 Sep 2024 23:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sno2U-0000L7-90; Mon, 09 Sep 2024 23:43:22 +0000
Received: by outflank-mailman (input) for mailman id 794915;
 Mon, 09 Sep 2024 23:43:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sno2S-0000Kx-T4; Mon, 09 Sep 2024 23:43:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sno2S-0001o1-PZ; Mon, 09 Sep 2024 23:43:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sno2S-0001Wz-H8; Mon, 09 Sep 2024 23:43:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sno2S-0007GY-Gc; Mon, 09 Sep 2024 23:43:20 +0000
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
	bh=dAe0kwI362gK3x6FrgZubLZjPcwAOE0J+61MohsHsLI=; b=Z0wyqSFWZXj1zeHO79LmXEwyJ9
	LyPWOFPMAz5UP5l1kdLpHB/+iOkPDGYDV3zvvQMHRGOnSBSPzhftJaZ1ibTCtbhaJidQP4UtXX/4Z
	DjhWk36Xjw0PBU9USOjZrFddyIRrOwYF+NSJc+IpMWez5e+nD7whq1GIH02tTiOFTbp8=;
To: xen-devel@lists.xenproject.org
Subject: [libvirt bisection] complete test-amd64-amd64-libvirt
Message-Id: <E1sno2S-0007GY-Gc@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 23:43:20 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187625/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-amd64-libvirt.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt.guest-start --summary-out=tmp/187625.bisection-summary --basis-template=187513 --blessings=real,real-bisect,real-retry libvirt test-amd64-amd64-libvirt guest-start
Searching for failure / basis pass:
 187594 fail [host=fiano1] / 187513 [host=pinot0] 187501 [host=godello0] 187489 [host=sabro1] 187414 [host=debina0] 187395 [host=fiano0] 187374 [host=italia0] 187357 [host=pinot1] 187318 [host=godello1] 187308 [host=pinot0] 187298 [host=godello0] 187290 [host=albana1] 187265 ok.
Failure / basis pass flights: 187594 / 187265
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
Latest ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
Basis pass b1524a3efce306338f3435188c0c682d6f439e9c 22b8996dba9041874845c7446ce89ec4ae2b713d 117ac406ba904da738fb79a3b2c96d4a385292c1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad cbe73b848286f1e6b855c0ba328d56e0014d19e6
Generating revisions with ./adhoc-revtuple-generator  https://gitlab.com/libvirt/libvirt.git#b1524a3efce306338f3435188c0c682d6f439e9c-ecffc91d0232ce7a5ee98b8026f2e41926dffe83 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#117ac406ba904da738fb79a3b2c96d4a385292c1-5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b\
 518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b158dad150bf02879668f72ce306445250838201-b437b5ca4c1a6725897dfd0740de6ef20cacd226 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#ec0bc256ae0ea08a32d3e854e329cfbc141f\
 07ad-2424e4c04aa30d90e85073ea41d18a7845460783 git://xenbits.xen.org/xen.git#cbe73b848286f1e6b855c0ba328d56e0014d19e6-65e4bc585c28b50ec76f679e1001a81fea9d690b
Loaded 22698 nodes in revision graph
Searching for test results:
 187265 pass b1524a3efce306338f3435188c0c682d6f439e9c 22b8996dba9041874845c7446ce89ec4ae2b713d 117ac406ba904da738fb79a3b2c96d4a385292c1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad cbe73b848286f1e6b855c0ba328d56e0014d19e6
 187290 [host=albana1]
 187298 [host=godello0]
 187308 [host=pinot0]
 187318 [host=godello1]
 187357 [host=pinot1]
 187374 [host=italia0]
 187395 [host=fiano0]
 187414 [host=debina0]
 187489 [host=sabro1]
 187501 [host=godello0]
 187513 [host=pinot0]
 187547 fail irrelevant
 187564 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187600 pass b1524a3efce306338f3435188c0c682d6f439e9c 22b8996dba9041874845c7446ce89ec4ae2b713d 117ac406ba904da738fb79a3b2c96d4a385292c1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad cbe73b848286f1e6b855c0ba328d56e0014d19e6
 187602 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187603 pass 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d 06ee04a907d64ee3910fecedd05d7f1be4b1b70e c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e928ef3592
 187605 pass 7d72b18017a8173b7d359025d7aeff4f4e527099 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1436593d5f8f7f700478e307d5198535ba69f88d
 187606 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 0f0d37c154bb108730c90a91aa31e3170e827962 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187609 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187610 pass be183218ed09bd77c6f0b9d2d81cd5e6ba8c56e6 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 013d51771a67ff87e6cb17a57e156ef4b6f4ec54 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 a2de7dc4d845738e734b10fce6550c89c6b1092c
 187611 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4820f2d6591357d7e6f35b5e5340300d3be790f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 3c09288298af881ea1bb568740deb2d2a06bcd41
 187594 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187612 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187615 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 65e4bc585c28b50ec76f679e1001a81fea9d690b
 187616 fail 5d77061d7e65e9cb7de4e9f28c2b7a69822da82f 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187618 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187619 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187621 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187622 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187624 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
 187625 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
Searching for interesting versions
 Result found: flight 187265 (pass), for basis pass
 For basis failure, parent search stopping at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b, results HASH(0x55f86caf4b28) HASH(0x55f86e3eab00) HASH(0x55f86e3d4010) For basis fai\
 lure, parent search stopping at 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b, results HASH(0x55f86e3d2308) For basis failure, parent search stopping at 4d3a2c61a39f7ca88b930a9e\
 7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4820f2d6591357d7e6f35b5e5340300d3be790f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 3c09288298af881ea1bb568740deb2d2a06bcd41, results HASH(0x55f86e3c4a88) For basis failure, parent search stopping at be183218ed09bd77c6f0b9d2d81cd5e6ba8c56e6 22b8996dba9041874845c7446ce89ec4ae2b713\
 d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 013d51771a67ff87e6cb17a57e156ef4b6f4ec54 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 a2de7dc4d845738e734b10fce6550c89c6b1092c, results HASH(0x55f86e3d4938) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a4\
 72b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x55f86e37edf8) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 0f0d37c154bb108730c90a91aa31e3170e827962 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab4087\
 6fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x55f86e374aa8) For basis failure, parent search stopping at 7d72b18017a8173b7d359025d7aeff4f4e527099 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d\
 f9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1436593d5f8f7f700478e307d5198535ba69f88d, results HASH(0x55f86e3761b0) For basis failure, parent search stopping at 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d 06ee04a907d64ee3910fecedd05d7f1be4b1b70e c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a3\
 2d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e928ef3592, results HASH(0x55f86e3aabb0) For basis failure, parent search stopping at b1524a3efce306338f3435188c0c682d6f439e9c 22b8996dba9041874845c7446ce89ec4ae2b713d 117ac406ba904da738fb79a3b2c96d4a385292c1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad cbe73b848286f1e6b855c0ba328d56e0\
 014d19e6, results HASH(0x55f86e395be8) HASH(0x55f86e3b5200) Result found: flight 187564 (fail), for basis failure (at ancestor ~9515)
 Repro found: flight 187600 (pass), for basis pass
 Repro found: flight 187615 (fail), for basis failure
 0 revisions at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 81d48d857efa451ca3ed46e3d0633f54084b6f5b
No revisions left to test, checking graph state.
 Result found: flight 187618 (pass), for last pass
 Result found: flight 187619 (fail), for first failure
 Repro found: flight 187621 (pass), for last pass
 Repro found: flight 187622 (fail), for first failure
 Repro found: flight 187624 (pass), for last pass
 Repro found: flight 187625 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt https://gitlab.com/libvirt/libvirt.git
  Bug introduced:  3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Bug not present: 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187625/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.598954 to fit
pnmtopng: 52 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
187625: tolerable FAIL

flight 187625 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/187625/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt     14 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt                                     fail    


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


