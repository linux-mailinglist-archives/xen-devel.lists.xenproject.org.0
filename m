Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB409706DF
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2024 13:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792531.1202449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snG3C-0003ck-Eq; Sun, 08 Sep 2024 11:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792531.1202449; Sun, 08 Sep 2024 11:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snG3C-0003b8-BS; Sun, 08 Sep 2024 11:25:50 +0000
Received: by outflank-mailman (input) for mailman id 792531;
 Sun, 08 Sep 2024 11:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snG3A-0003ay-FT; Sun, 08 Sep 2024 11:25:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snG3A-0007Pu-0Z; Sun, 08 Sep 2024 11:25:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snG39-0006mp-Oz; Sun, 08 Sep 2024 11:25:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snG39-0006rM-OT; Sun, 08 Sep 2024 11:25:47 +0000
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
	bh=KnphnEvwiqT1jmyvAXMdZJ6wy9h7izsHm8ZIuZ5L6J8=; b=1m4+jE01oJGvktFLE4BXWIXwnE
	Uz2hINAN7SWDTMVJmG7lFJnzM7rx8yP6m5upj9bxOXFh5zXotENnkHfN4JStzrcs9zXQA8HDLE8RS
	gGSv+a79n4JemnhfDcI7AJ29lCQzJP6VIfjY6AW4e0WUtCP5gV+CbX9PP9Llwiq3Y/yM=;
To: xen-devel@lists.xenproject.org
Subject: [libvirt bisection] complete test-amd64-amd64-libvirt-xsm
Message-Id: <E1snG39-0006rM-OT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Sep 2024 11:25:47 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187574/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start --summary-out=tmp/187574.bisection-summary --basis-template=187513 --blessings=real,real-bisect,real-retry libvirt test-amd64-amd64-libvirt-xsm guest-start
Searching for failure / basis pass:
 187547 fail [host=debina1] / 187513 [host=albana1] 187501 [host=fiano0] 187489 [host=septiner1] 187414 [host=pinot0] 187395 [host=albana0] 187374 [host=godello1] 187357 [host=huxelrebe0] 187318 [host=godello0] 187308 [host=nobling0] 187298 [host=albana1] 187290 ok.
Failure / basis pass flights: 187547 / 187290
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
Latest ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
Basis pass ab7f877f27caa7249f42e93678dbdb1a2ef2cc4e 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1e2a5f991f86979b89aa9a60ca3ba8106ee7d987
Generating revisions with ./adhoc-revtuple-generator  https://gitlab.com/libvirt/libvirt.git#ab7f877f27caa7249f42e93678dbdb1a2ef2cc4e-ecffc91d0232ce7a5ee98b8026f2e41926dffe83 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#ee5e09825b810498caeaaa3d46a3410768471053-69950617349402d1c952a54a5edc9a323a7c36b4 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b\
 518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b158dad150bf02879668f72ce306445250838201-b437b5ca4c1a6725897dfd0740de6ef20cacd226 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#ec0bc256ae0ea08a32d3e854e329cfbc141f\
 07ad-2424e4c04aa30d90e85073ea41d18a7845460783 git://xenbits.xen.org/xen.git#1e2a5f991f86979b89aa9a60ca3ba8106ee7d987-6471badeeec92db1cb8155066551f7509cd82efd
Loaded 22698 nodes in revision graph
Searching for test results:
 187290 pass ab7f877f27caa7249f42e93678dbdb1a2ef2cc4e 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1e2a5f991f86979b89aa9a60ca3ba8106ee7d987
 187298 [host=albana1]
 187308 [host=nobling0]
 187318 [host=godello0]
 187357 [host=huxelrebe0]
 187374 [host=godello1]
 187395 [host=albana0]
 187414 [host=pinot0]
 187489 [host=septiner1]
 187501 [host=fiano0]
 187513 [host=albana1]
 187547 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187553 pass ab7f877f27caa7249f42e93678dbdb1a2ef2cc4e 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1e2a5f991f86979b89aa9a60ca3ba8106ee7d987
 187554 fail ecffc91d0232ce7a5ee98b8026f2e41926dffe83 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187555 pass 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d 1f19860ad22c164e7bef443b2ac9fcf10558caea c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e928ef3592
 187556 pass 3a4a26f53e7b81bfa096ef03cd89f47e92844ae1 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1436593d5f8f7f700478e307d5198535ba69f88d
 187557 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d f6627c69a303754d79b132e797a19b605c68044f c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187559 pass f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 4c6735299540f3c82a5033d35be76a5c42e0fb18 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187560 pass a35a355b09cb9cbb2ba960116303b05dc3b5fb49 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3151798123e1419e74ebef1df73e9d651f1fcd3e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187561 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c047353a1244121f7d5b1780dbef2e2b30f762e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187563 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4820f2d6591357d7e6f35b5e5340300d3be790f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187565 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187567 pass 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187568 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187569 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187571 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187572 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187573 pass 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
 187574 fail 3afbb1644c4f9d5237459bd544d0f511ff99eb80 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
Searching for interesting versions
 Result found: flight 187290 (pass), for basis pass
 For basis failure, parent search stopping at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x557744c24388) HASH(0x557744c1be18) HASH(0x5577464e8358) For basis fai\
 lure, parent search stopping at 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x5577464f69e0) For basis failure, parent search stopping at 4d3a2c61a39f7ca88b930a9e\
 7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4820f2d6591357d7e6f35b5e5340300d3be790f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x5577464edd70) For basis failure, parent search stopping at 4d3a2c61a39f7ca88b930a9e7187289694dfb91e 22b8996dba9041874845c7446ce89ec4ae2b713\
 d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c047353a1244121f7d5b1780dbef2e2b30f762e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x5577464a9008) For basis failure, parent search stopping at a35a355b09cb9cbb2ba960116303b05dc3b5fb49 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a4\
 72b0eb9558310b518f0dfcd8860 3151798123e1419e74ebef1df73e9d651f1fcd3e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x5577464d5ba0) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d 4c6735299540f3c82a5033d35be76a5c42e0fb18 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab4087\
 6fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x5577464e2b20) For basis failure, parent search stopping at f6fb097e11a15e390d989411b2660ead0d1a7c10 22b8996dba9041874845c7446ce89ec4ae2b713d f6627c69a303754d79b132e797a19b605c68044f c530a75c1e6a472b0eb9558310b518f0dfcd8860 99d60cbd3990fe8f5b86eaab40876fbbf9d99084 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d\
 f9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd, results HASH(0x55774649ba88) For basis failure, parent search stopping at 3a4a26f53e7b81bfa096ef03cd89f47e92844ae1 22b8996dba9041874845c7446ce89ec4ae2b713d 311d8503ef9fa25932825c5342de7213738aad8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 50871ee0ecd63bb9885068fb0b3ea1b47f5e2bb4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a3\
 2d3e854e329cfbc141f07ad 1436593d5f8f7f700478e307d5198535ba69f88d, results HASH(0x5577464ade20) For basis failure, parent search stopping at 76f6caee3c60e171e37eaa15772b02291d65011f 22b8996dba9041874845c7446ce89ec4ae2b713d 1f19860ad22c164e7bef443b2ac9fcf10558caea c530a75c1e6a472b0eb9558310b518f0dfcd8860 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 99f942f3d410059dc223ee0a908827e9\
 28ef3592, results HASH(0x5577464d78a8) For basis failure, parent search stopping at ab7f877f27caa7249f42e93678dbdb1a2ef2cc4e 22b8996dba9041874845c7446ce89ec4ae2b713d ee5e09825b810498caeaaa3d46a3410768471053 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b158dad150bf02879668f72ce306445250838201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ec0bc256ae0ea08a32d3e854e329cfbc141f07ad 1e2a5f991f86979b89aa9a60ca3ba8106ee7d987, results HASH(0x5577464c36e8) HASH(0x5577464cf8\
 60) Result found: flight 187547 (fail), for basis failure (at ancestor ~13961)
 Repro found: flight 187553 (pass), for basis pass
 Repro found: flight 187554 (fail), for basis failure
 0 revisions at 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054 22b8996dba9041874845c7446ce89ec4ae2b713d 69950617349402d1c952a54a5edc9a323a7c36b4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b437b5ca4c1a6725897dfd0740de6ef20cacd226 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 6471badeeec92db1cb8155066551f7509cd82efd
No revisions left to test, checking graph state.
 Result found: flight 187568 (pass), for last pass
 Result found: flight 187569 (fail), for first failure
 Repro found: flight 187571 (pass), for last pass
 Repro found: flight 187572 (fail), for first failure
 Repro found: flight 187573 (pass), for last pass
 Repro found: flight 187574 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt https://gitlab.com/libvirt/libvirt.git
  Bug introduced:  3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Bug not present: 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187574/


  commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
  Author: Tim Wiederhake <twiederh@redhat.com>
  Date:   Mon Aug 26 11:58:26 2024 +0200
  
      cpu_map: Add SierraForest CPU model
      
      This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
      
      Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.729631 to fit
pnmtopng: 71 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
187574: tolerable FAIL

flight 187574 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/187574/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 14 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-xsm                                 fail    


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


