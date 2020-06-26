Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E920AA9C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 05:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joem0-0007uR-9r; Fri, 26 Jun 2020 03:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eduV=AH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1joelz-0007uM-EE
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 03:11:27 +0000
X-Inumbo-ID: b751d6fe-b75a-11ea-8273-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b751d6fe-b75a-11ea-8273-12813bfff9fa;
 Fri, 26 Jun 2020 03:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pgWpzwVbMMCYNIbsbfRIZWGpSGG/MuIgXQWW0OTka20=; b=EW9LW6x90oxy3HIrstZW7nD6DP
 F8751OWUaLQ0vA7phnhzU0Tw553Fle+THF0eAJAQLR0Bjx0RDlVXkrHNTfuc7L/iaND2C5i6Vt1FV
 CRYP9d4bA+AdL76UiXHOU9VNCJxz7u9ABBvl4xoyR3zlVNeCRw1veE+az/quroqySI/0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joelv-0000P3-JO; Fri, 26 Jun 2020 03:11:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joelv-00059q-8U; Fri, 26 Jun 2020 03:11:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1joelv-000198-7p; Fri, 26 Jun 2020 03:11:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-libvirt-pair
Message-Id: <E1joelv-000198-7p@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jun 2020 03:11:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-pair
testid guest-start/debian

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151366/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-libvirt-pair.guest-start--debian.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-pair.guest-start--debian --summary-out=tmp/151366.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-i386-libvirt-pair guest-start/debian
Searching for failure / basis pass:
 151328 fail [dst_host=albana1,src_host=albana0] / 151149 [dst_host=huxelrebe0,src_host=huxelrebe1] 151101 [dst_host=fiano1,src_host=fiano0] 151065 [dst_host=pinot0,src_host=pinot1] 151047 [dst_host=chardonnay0,src_host=chardonnay1] 150970 [dst_host=pinot1,src_host=pinot0] 150930 [dst_host=albana0,src_host=albana1] 150916 [dst_host=huxelrebe1,src_host=huxelrebe0] 150909 [dst_host=elbling1,src_host=elbling0] 150895 [dst_host=huxelrebe0,src_host=huxelrebe1] 150831 [dst_host=chardonnay1,src_host=ch\
 ardonnay0] 150694 [dst_host=fiano0,src_host=fiano1] 150631 ok.
Failure / basis pass flights: 151328 / 150631
(tree with no url: minios)
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 96a39aad705f8e37950109d11636085b212af790 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b d88d5a3806d78dcfca648c62dae9d88d3e803bd2 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
Basis pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#a1cd25b919509be2645dbe6f952d5263e0d4e4e5-96a39aad705f8e37950109d11636085b212af790 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9-00b8bf7eda00fb6f0197d3968b6078cfdb4870fa git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#5cc7a54c2e91d82cb6a52e4921325c511fd90712-d88d5a3806d78dcfca648c62dae9d88d3e803bd2 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-2e3de62\
 53422112ae43e608661ba94ea6b345694 git://xenbits.xen.org/xen.git#1497e78068421d83956f8e82fb6e1bf1fc3b1199-fde76f895d0aa817a1207d844d793239c6639bc6
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 135201 nodes in revision graph
Searching for test results:
 150631 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 150694 [dst_host=fiano0,src_host=fiano1]
 150831 [dst_host=chardonnay1,src_host=chardonnay0]
 150909 [dst_host=elbling1,src_host=elbling0]
 150930 [dst_host=albana0,src_host=albana1]
 150916 [dst_host=huxelrebe1,src_host=huxelrebe0]
 150895 [dst_host=huxelrebe0,src_host=huxelrebe1]
 150899 []
 150970 [dst_host=pinot1,src_host=pinot0]
 151047 [dst_host=chardonnay0,src_host=chardonnay1]
 151101 [dst_host=fiano1,src_host=fiano0]
 151065 [dst_host=pinot0,src_host=pinot1]
 151149 [dst_host=huxelrebe0,src_host=huxelrebe1]
 151221 fail irrelevant
 151175 fail irrelevant
 151241 fail irrelevant
 151342 blocked 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 3351acaee706b8e238b031a456bf181f97f167c3
 151317 fail 1eabe312ea4fa80922443ad73a950857c1f87786 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 9fc7fc4d3909817555ce0af6bcb69dff1606140d 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151299 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151331 pass b934d5f42f29764277bc6f0f1cae19ada6f85e74 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 86e8c353f705f14f2f2fd7a6195cefa431aa24d9 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151300 fail irrelevant
 151286 fail irrelevant
 151332 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 3575b0aea983ad57804c9af739ed8ff7bc168393 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151301 fail irrelevant
 151269 fail irrelevant
 151319 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9f1f264edbdf5516d6f208497310b3eedbc7b74c 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151343 blocked a03738cee469f05d4059b67bdec3da6b8196da4d 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151333 pass f45735786a3d9bee622f80eab75131b0da485798 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 726c78d14dfe6ec76f5e4c7756821a91f0a04b34
 151328 fail 96a39aad705f8e37950109d11636085b212af790 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b d88d5a3806d78dcfca648c62dae9d88d3e803bd2 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151305 fail irrelevant
 151359 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 9940b2cfbc05cdffdf6b42227a80cb1e6d2a85c2 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151349 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 5e769ecf509089c053bb247ae48a360ef8e87d66 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151309 fail irrelevant
 151344 blocked d3d87e0cefd7144c559dd23fef789e7e37f74e76 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151310 fail 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151322 pass 9170b0ee6f867d2be1165e83c80910b0e0ac952d 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1d24410da356731da70b3334f86343e11e207d2 3c659044118e34603161457db9934a34f816d78b 470dd165d152ff7ceac61c7b71c2b89220b3aad7 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151312 fail 3a58613b0cf6a29960b909e6fd7420639ff794bd 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 6675a653d2e57ab09c32c0ea7b44a1d6c40a7f58 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151335 pass f45735786a3d9bee622f80eab75131b0da485798 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 5d2f557b47dfbf8f23277a5bdd8473d4607c681a 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151313 pass cf9e7726b38bc93a2728638d435199297d2b3aaa 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 53550e81e2cafe7c03a39526b95cd21b5194d9b1 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151304 fail 96a39aad705f8e37950109d11636085b212af790 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 322969adf1fb3d6cfbd613f35121315715aff2ed 3c659044118e34603161457db9934a34f816d78b 171199f56f5f9bdf1e5d670d09ef1351d8f01bae 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151325 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b eea8f5df4ecc607d64f091b8d916fcc11a697541 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151314 pass cf9e7726b38bc93a2728638d435199297d2b3aaa 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 250bc43a406f7d46e319abe87c19548d4f027828 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151345 blocked 8400b6c1983dd1e4504fe19d3421fff0e5866091 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151336 blocked bc85c34ea91c46588423fa24e56e09ca5aab31dd 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 7d2410cea154bf915fb30179ebda3b17ac36e70e 2e3de6253422112ae43e608661ba94ea6b345694 780aba2779b834f19b2a6f0dcdea0e7e0b5e1622
 151326 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151329 fail 96a39aad705f8e37950109d11636085b212af790 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 322969adf1fb3d6cfbd613f35121315715aff2ed 3c659044118e34603161457db9934a34f816d78b 171199f56f5f9bdf1e5d670d09ef1351d8f01bae 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151364 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151355 fail 1eabe312ea4fa80922443ad73a950857c1f87786 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 3e80f6902c13f6edb6675c0f33edcbbf0163ec32 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151338 blocked 611e03127fcc84c7cd64b1da30140ca3b8fa1269 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb78cfbec07eda45118b630a09b0af549b43a135 3c659044118e34603161457db9934a34f816d78b fe0fe4735e798578097758781166cc221319b93d 2e3de6253422112ae43e608661ba94ea6b345694 d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
 151346 pass 2a372a5ad5fab3bf26fb9bea019d38fa04ba8b34 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 835d8d69d96aa7feb52ef7b3dd8ecf43f0807578
 151360 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b dfe8c79c44680e34eac2e8abd0d0c885ce01aa55 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151348 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b f1aeb14b0809e313c74244d838645ed25e85ea63 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151351 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151354 fail 96a39aad705f8e37950109d11636085b212af790 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b d88d5a3806d78dcfca648c62dae9d88d3e803bd2 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151357 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151362 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151361 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151366 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151365 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
Searching for interesting versions
 Result found: flight 150631 (pass), for basis pass
 Result found: flight 151328 (fail), for basis failure
 Repro found: flight 151351 (pass), for basis pass
 Repro found: flight 151354 (fail), for basis failure
 0 revisions at 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
No revisions left to test, checking graph state.
 Result found: flight 151357 (pass), for last pass
 Result found: flight 151361 (fail), for first failure
 Repro found: flight 151362 (pass), for last pass
 Repro found: flight 151364 (fail), for first failure
 Repro found: flight 151365 (pass), for last pass
 Repro found: flight 151366 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151366/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.273455 to fit
pnmtopng: 136 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-pair.guest-start--debian.{dot,ps,png,html,svg}.
----------------------------------------
151366: tolerable FAIL

flight 151366 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151366/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 21 guest-start/debian      fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-pair                                 fail    


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


