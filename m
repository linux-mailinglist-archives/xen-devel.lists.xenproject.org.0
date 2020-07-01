Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE821164C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 00:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqlaM-0001di-6L; Wed, 01 Jul 2020 22:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r09v=AM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jqlaL-0001dd-67
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 22:52:09 +0000
X-Inumbo-ID: 7b670169-bbed-11ea-8793-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b670169-bbed-11ea-8793-12813bfff9fa;
 Wed, 01 Jul 2020 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ykbaOSVCbYwuQfXZIJwan5qjXGK+XStu9v3sYRqBke4=; b=fkVRRElknqYBD+hwXPeyF4EFj5
 rezwuK7jCg8Did1AuFc8Fps9GRVa+QMCpTMFZxIVZ526KYA4OrU9FkZ0T0s0v5xFlKrmaO/8FKiqx
 SqG8lQ9Ps4ao/eQlqeBFEyYc2110KDLDrQW4yRd1dGIYeApSYpNSDg0gWuObetHer/UM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqlaG-0005P3-IJ; Wed, 01 Jul 2020 22:52:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqlaG-0001om-78; Wed, 01 Jul 2020 22:52:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jqlaG-0000C5-6V; Wed, 01 Jul 2020 22:52:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-libvirt-xsm
Message-Id: <E1jqlaG-0000C5-6V@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Jul 2020 22:52:04 +0000
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
job test-amd64-i386-libvirt-xsm
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151514/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start --summary-out=tmp/151514.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-i386-libvirt-xsm guest-start
Searching for failure / basis pass:
 151500 fail [host=huxelrebe0] / 151149 [host=huxelrebe1] 151101 [host=albana0] 151065 [host=albana1] 151047 [host=fiano0] 150970 [host=fiano1] 150930 [host=elbling1] 150916 [host=chardonnay0] 150895 [host=elbling0] 150831 [host=pinot0] 150694 [host=rimava1] 150631 [host=debina1] 150608 [host=pinot1] 150593 [host=italia0] 150585 [host=chardonnay1] 150532 [host=debina0] 150492 [host=fiano0] 150457 ok.
Failure / basis pass flights: 151500 / 150457
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
Latest 4268e187531eb370bc6fbac4496018bb7fef6716 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b fc1bff958998910ec8d25db86cd2f53ff125f7ab 88ab0c15525ced2eefe39220742efe4769089ad8 da53345dd5ff7d3a34e83587fd375c0b7722f46c
Basis pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#a1cd25b919509be2645dbe6f952d5263e0d4e4e5-4268e187531eb370bc6fbac4496018bb7fef6716 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3-00217f1919270007d7a911f89b32e39b9dcaa907 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#a20ab81d22300cca80325c284f21eefee99aa740-fc1bff958998910ec8d25db86cd2f53ff125f7ab git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-88ab0c1\
 5525ced2eefe39220742efe4769089ad8 git://xenbits.xen.org/xen.git#9f3e9139fa6c3d620eb08dff927518fc88200b8d-da53345dd5ff7d3a34e83587fd375c0b7722f46c
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
Loaded 65572 nodes in revision graph
Searching for test results:
 150457 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 150492 [host=fiano0]
 150532 [host=debina0]
 150585 [host=chardonnay1]
 150593 [host=italia0]
 150631 [host=debina1]
 150608 [host=pinot1]
 150694 [host=rimava1]
 150831 [host=pinot0]
 150909 []
 150930 [host=elbling1]
 150916 [host=chardonnay0]
 150895 [host=elbling0]
 150899 []
 150970 [host=fiano1]
 151047 [host=fiano0]
 151101 [host=albana0]
 151065 [host=albana1]
 151149 [host=huxelrebe1]
 151221 fail irrelevant
 151175 fail irrelevant
 151241 fail irrelevant
 151286 fail irrelevant
 151269 fail irrelevant
 151328 fail irrelevant
 151304 fail irrelevant
 151377 fail irrelevant
 151353 fail c5815b31976f3982d18c7f6c1367ab6e403eb7eb 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b d4b78317b7cf8c0c635b70086503813f79ff21ec 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151399 fail irrelevant
 151414 fail irrelevant
 151462 pass f45735786a3d9bee622f80eab75131b0da485798 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 726c78d14dfe6ec76f5e4c7756821a91f0a04b34
 151443 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151432 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151446 fail irrelevant
 151433 fail irrelevant
 151455 pass 9170b0ee6f867d2be1165e83c80910b0e0ac952d 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1d24410da356731da70b3334f86343e11e207d2 3c659044118e34603161457db9934a34f816d78b 470dd165d152ff7ceac61c7b71c2b89220b3aad7 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151434 fail 36b1e8669d85f5dbde4e40a6625df9a78085c2a0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b 61fee7f45955cd0bf9b79be9fa9c7ebabb5e6a85 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151463 pass f45735786a3d9bee622f80eab75131b0da485798 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 5d2f557b47dfbf8f23277a5bdd8473d4607c681a 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151436 fail f57a8cd3df0167d72b87fdd868a287608a741b73 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 322969adf1fb3d6cfbd613f35121315715aff2ed 3c659044118e34603161457db9934a34f816d78b bae31bfa48b9caecee25da3d5333901a126a06b4 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151447 pass cf9e7726b38bc93a2728638d435199297d2b3aaa 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 53550e81e2cafe7c03a39526b95cd21b5194d9b1 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151438 fail ea3320048897f5279bc49cb49d26f8099706a834 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b eefe34ea4b82c2b47abe28af4cc7247d51553626 2e3de6253422112ae43e608661ba94ea6b345694 25636ed707cf1211ce846c7ec58f8643e435d7a7
 151449 pass cf9e7726b38bc93a2728638d435199297d2b3aaa 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 250bc43a406f7d46e319abe87c19548d4f027828 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151439 fail 07e1a18accee37a2850f3825c85cb29b1599b1e0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 3f429a3400822141651486193d6af625eeab05a5 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151468 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151440 fail 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151456 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b eea8f5df4ecc607d64f091b8d916fcc11a697541 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151435 fail irrelevant
 151442 fail 3a58613b0cf6a29960b909e6fd7420639ff794bd 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 6675a653d2e57ab09c32c0ea7b44a1d6c40a7f58 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151464 blocked bc85c34ea91c46588423fa24e56e09ca5aab31dd 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 7d2410cea154bf915fb30179ebda3b17ac36e70e 2e3de6253422112ae43e608661ba94ea6b345694 780aba2779b834f19b2a6f0dcdea0e7e0b5e1622
 151450 fail 1eabe312ea4fa80922443ad73a950857c1f87786 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 9fc7fc4d3909817555ce0af6bcb69dff1606140d 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151488 blocked 0137bf0dab2738d5443e2f407239856e2aa25bb3 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151484 blocked 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b b8bee16e94df0fcd03bdad9969c30894418b0e6e 2e3de6253422112ae43e608661ba94ea6b345694 fced27b002c73c47c6c24ece2fe32b78157ad6b6
 151458 pass b934d5f42f29764277bc6f0f1cae19ada6f85e74 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 86e8c353f705f14f2f2fd7a6195cefa431aa24d9 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151453 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9f1f264edbdf5516d6f208497310b3eedbc7b74c 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151474 blocked a5a297f387fee9e9aa4cbc2df6788c330fd33ad1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 71b04329c4f7d5824a289ca5225e1883a278cf3b 2e3de6253422112ae43e608661ba94ea6b345694 e181db8ba4e0797b8f9b55996adfa71ffb5b4081
 151460 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 3575b0aea983ad57804c9af739ed8ff7bc168393 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151482 blocked 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b cf2d1203dcfc2bf964453d83a2302231ce77f2dc 2e3de6253422112ae43e608661ba94ea6b345694 3351acaee706b8e238b031a456bf181f97f167c3
 151470 fail d482cf6bef484e697f1dbb99f2504e7d67b149e7 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b e7651153a8801dad6805d450ea8bef9b46c1adf5 88ab0c15525ced2eefe39220742efe4769089ad8 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
 151459 fail d482cf6bef484e697f1dbb99f2504e7d67b149e7 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b e7651153a8801dad6805d450ea8bef9b46c1adf5 88ab0c15525ced2eefe39220742efe4769089ad8 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
 151466 blocked 611e03127fcc84c7cd64b1da30140ca3b8fa1269 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb78cfbec07eda45118b630a09b0af549b43a135 3c659044118e34603161457db9934a34f816d78b fe0fe4735e798578097758781166cc221319b93d 2e3de6253422112ae43e608661ba94ea6b345694 d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
 151477 blocked ab55a8a0871207de5fe194f55cbbcecae7a3cfe9 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 773861274ad75a62c7ecf70ecc8e4ba31ed62190 2e3de6253422112ae43e608661ba94ea6b345694 ad33a573c009d72466432b41ba0591c64e819c19
 151472 blocked a5a297f387fee9e9aa4cbc2df6788c330fd33ad1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 250b1da35d579f42319af234f36207902ca4baa4 2e3de6253422112ae43e608661ba94ea6b345694 dde6174ada5280cd9a6396e3b12606360a0d29a3
 151471 fail irrelevant
 151493 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 210d18674a34bb43bd05cdd68d24fd03e161ff3d 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151475 blocked ab55a8a0871207de5fe194f55cbbcecae7a3cfe9 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b d127de3baa64d1cabc8e1994e658688abb577ba9 2e3de6253422112ae43e608661ba94ea6b345694 ad33a573c009d72466432b41ba0591c64e819c19
 151481 blocked 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b b8bee16e94df0fcd03bdad9969c30894418b0e6e 2e3de6253422112ae43e608661ba94ea6b345694 3351acaee706b8e238b031a456bf181f97f167c3
 151478 blocked f6c79ca2af3607eb1cbbb7208c194f7cbf7a6abd 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 ad33a573c009d72466432b41ba0591c64e819c19
 151479 blocked 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b cf2d1203dcfc2bf964453d83a2302231ce77f2dc 2e3de6253422112ae43e608661ba94ea6b345694 422ec8fcf34cf961e81fbccd7d236fa2c1e678a8
 151486 blocked 4ccc69707e9e4a16d66c1bc7b5de55bc3943e3dd 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151483 blocked 6297560761adf660497ab0053af18bab159f6b2f 317d3eeb963a515e15a63fa356d8ebcda7041a51 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151487 blocked d901fd6092414417ee59a4567d2c62f853a62d5c 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b a20ab81d22300cca80325c284f21eefee99aa740 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 151485 fail 4268e187531eb370bc6fbac4496018bb7fef6716 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b fc1bff958998910ec8d25db86cd2f53ff125f7ab 88ab0c15525ced2eefe39220742efe4769089ad8 da53345dd5ff7d3a34e83587fd375c0b7722f46c
 151489 pass 21597d3caad8c94996de05e5d426178966a17860 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 16c36d27f2644737c34d4a0fc1de525d0ee185ad
 151492 pass 63d08bec0b2dace2fcefffb23a1fa5b14c473d67 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4cfb842fca9693a330cb5435284c1ee8bfbbace 3c659044118e34603161457db9934a34f816d78b 23374a84c5f08e20ec2506a6322330d51f9134c5 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151495 fail 257aba2dafee0fec97f3f0a2d06fb82587aaf1a0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 3e80f6902c13f6edb6675c0f33edcbbf0163ec32 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151498 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 589b1be07c060e583d9f758ff0cb10e0f1ff242f 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151501 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b da9630c57ee386f8beb571ba6bb4a98d546c42ca 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151505 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 007d1dbf72536ec1b847a944832e4de1546af2ac 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151507 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151508 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151509 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151510 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151500 fail 4268e187531eb370bc6fbac4496018bb7fef6716 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b fc1bff958998910ec8d25db86cd2f53ff125f7ab 88ab0c15525ced2eefe39220742efe4769089ad8 da53345dd5ff7d3a34e83587fd375c0b7722f46c
 151512 pass 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151514 fail 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
Searching for interesting versions
 Result found: flight 150457 (pass), for basis pass
 Result found: flight 151459 (fail), for basis failure (at ancestor ~22)
 Repro found: flight 151468 (pass), for basis pass
 Repro found: flight 151485 (fail), for basis failure
 0 revisions at 8a4f331e8cb662d787a310df07fefd080879abde 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
No revisions left to test, checking graph state.
 Result found: flight 151507 (pass), for last pass
 Result found: flight 151508 (fail), for first failure
 Repro found: flight 151509 (pass), for last pass
 Repro found: flight 151510 (fail), for first failure
 Repro found: flight 151512 (pass), for last pass
 Repro found: flight 151514 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151514/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.231324 to fit
pnmtopng: 164 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
151514: tolerable FAIL

flight 151514 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151514/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-xsm  12 guest-start             fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-xsm                                  fail    


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


