Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A36352E7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 09:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447431.703633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlHz-0007Vp-OH; Wed, 23 Nov 2022 08:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447431.703633; Wed, 23 Nov 2022 08:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlHz-0007TG-L5; Wed, 23 Nov 2022 08:39:27 +0000
Received: by outflank-mailman (input) for mailman id 447431;
 Wed, 23 Nov 2022 08:39:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxlHy-0007T6-47; Wed, 23 Nov 2022 08:39:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxlHy-0007Ne-14; Wed, 23 Nov 2022 08:39:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxlHx-00035P-QM; Wed, 23 Nov 2022 08:39:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oxlHx-0000Ew-Pv; Wed, 23 Nov 2022 08:39:25 +0000
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
	bh=hDILsS9Dys6ONGHgMXu10KIZyr8M30gE1WbEIAGZ7RM=; b=Dri1pxUukcz2Ot7nPm+SYGUuXd
	sLLKdHSDSA0CjUmYLVB6cW0PW1X1WGQhBm6DC6WBmm/Nusf+YOWMg8Fvvhu5XinzWz+2+ISlIpTCG
	mgBey6dRB7Wm3HVvpzE5Y4GbvTgBsHE3dih8R8B3S8paXJm5IbJfsfjw9vcbzG1dZ4yI=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
Message-Id: <E1oxlHx-0000Ew-Pv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Nov 2022 08:39:25 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174941/


  commit 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Oct 25 15:27:05 2022 +0100
  
      xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
      
      This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
      of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
      
      First of all, with ARM borrowing x86's implementation, the logic to set the
      pool size should have been common, not duplicated.  Introduce
      libxl__domain_set_paging_mempool_size() as a shared implementation, and use it
      from the ARM and x86 paths.  It is left as an exercise to the reader to judge
      how libxl/xl can reasonably function without the ability to query the pool
      size...
      
      Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
      replaced with a working and unit tested interface.
      
      This is part of XSA-409 / CVE-2022-33747.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.guest-saverestore --summary-out=tmp/174941.bisection-summary --basis-template=174797 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemut-debianhvm-i386-xsm guest-saverestore
Searching for failure / basis pass:
 174881 fail [host=nocera1] / 174797 [host=fiano0] 174791 [host=debina0] 174773 [host=pinot1] 174769 [host=huxelrebe1] 174762 [host=albana1] 174753 [host=debina1] 174747 [host=sabro1] 174742 [host=elbling0] 174733 [host=huxelrebe0] 174724 [host=himrod0] 174701 [host=italia1] 174682 [host=nobling1] 174670 [host=italia0] 174663 [host=nobling0] 174652 [host=godello0] 174641 [host=godello1] 174636 [host=fiano1] 174629 [host=chardonnay1] 174607 [host=chardonnay0] 174597 [host=albana0] 174586 [host=de\
 bina0] 174574 [host=elbling1] 174563 [host=pinot1] 174547 [host=fiano0] 174542 [host=debina1] 174538 [host=pinot0] 174534 [host=sabro1] 174526 [host=albana1] 174499 [host=nocera0] 174435 [host=himrod0] 174367 [host=nobling0] 174285 [host=italia0] 174252 [host=godello1] 174210 [host=fiano1] 174165 [host=sabro0] 174057 [host=huxelrebe0] 173920 [host=chardonnay1] 173812 [host=nobling1] 173738 [host=sabro1] 173663 [host=fiano0] 173488 [host=albana1] 173482 [host=himrod0] 173466 [host=nobling0] 17345\
 9 [host=pinot0] 173452 [host=nocera0] 173436 [host=italia0] 173430 [host=sabro0] 173422 [host=debina0] 173416 [host=italia1] 173412 [host=debina1] 173402 [host=elbling0] 173398 [host=chardonnay1] 173394 ok.
Failure / basis pass flights: 174881 / 173394
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 1666086b00442b23e4fd70f4971e3bcf1a16b124
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#1666086b00442b23e4fd70f4971e3bcf1a16b124-db8fa01c61db0317a9ee947925226234c65d48e8
Loaded 5001 nodes in revision graph
Searching for test results:
 173812 [host=nobling1]
 173920 [host=chardonnay1]
 174057 [host=huxelrebe0]
 174133 [host=sabro0]
 174165 [host=sabro0]
 174210 [host=fiano1]
 174252 [host=godello1]
 174285 [host=italia0]
 174367 [host=nobling0]
 174435 [host=himrod0]
 174499 [host=nocera0]
 174526 [host=albana1]
 174534 [host=sabro1]
 174538 [host=pinot0]
 174542 [host=debina1]
 174547 [host=fiano0]
 174563 [host=pinot1]
 174574 [host=elbling1]
 174586 [host=debina0]
 174597 [host=albana0]
 174607 [host=chardonnay0]
 174629 [host=chardonnay1]
 174636 [host=fiano1]
 174641 [host=godello1]
 174652 [host=godello0]
 174663 [host=nobling0]
 174670 [host=italia0]
 174682 [host=nobling1]
 174701 [host=italia1]
 174724 [host=himrod0]
 174733 [host=huxelrebe0]
 174742 [host=elbling0]
 174747 [host=sabro1]
 174753 [host=debina1]
 174762 [host=albana1]
 174769 [host=huxelrebe1]
 174773 [host=pinot1]
 174791 [host=debina0]
 174797 [host=fiano0]
 174814 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174819 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174843 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174854 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174865 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174874 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174881 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174921 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 1666086b00442b23e4fd70f4971e3bcf1a16b124
 174922 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174924 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 3b5beaf49033cddf4b2cc4e4d391b966f4203471
 174926 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db471408edd46af403b8bd44d180a928ad7fbb80
 174927 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 08c6f57cfebad4046dabc05092b4a27c61a39980
 174929 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf
 174931 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5
 174932 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7
 174934 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174936 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174938 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174939 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174940 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174941 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 173394 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 1666086b00442b23e4fd70f4971e3bcf1a16b124
 173398 [host=chardonnay1]
 173402 [host=elbling0]
 173412 [host=debina1]
 173416 [host=italia1]
 173422 [host=debina0]
 173430 [host=sabro0]
 173436 [host=italia0]
 173452 [host=nocera0]
 173459 [host=pinot0]
 173477 [host=himrod0]
 173466 [host=nobling0]
 173482 [host=himrod0]
 173488 [host=albana1]
 173738 [host=sabro1]
 173663 [host=fiano0]
Searching for interesting versions
 Result found: flight 173394 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999, results HASH(0x558bf74c5c58) HASH(0x558bf74cd658) HASH(0x558bf6ee0250) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7, results HASH(0x558bf7438ba8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5, results HASH(0x558bf7430b60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf, results HASH(0x558bf742b928) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 08c6f57cfebad4046dabc05092b4a27c61a39980, results HASH(0x558bf743e3e0) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db471408edd46af403b8bd44d180a928ad7fbb80, results HASH(0x558bf74bd350) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 3b5beaf49033cddf4b2cc4e4d391b966f4203471, results HASH(0x558bf7434e9\
 8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 1666086b00442b23e4fd70f4971e3bcf1a16b124, results HASH(0x558bf742f158) HASH(0x558bf742d150) Result found: flight 174814 (fail), for basis failure (at ancestor ~732)
 Repro found: flight 174921 (pass), for basis pass
 Repro found: flight 174922 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
No revisions left to test, checking graph state.
 Result found: flight 174934 (pass), for last pass
 Result found: flight 174936 (fail), for first failure
 Repro found: flight 174938 (pass), for last pass
 Repro found: flight 174939 (fail), for first failure
 Repro found: flight 174940 (pass), for last pass
 Repro found: flight 174941 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174941/


  commit 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Oct 25 15:27:05 2022 +0100
  
      xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
      
      This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
      of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
      
      First of all, with ARM borrowing x86's implementation, the logic to set the
      pool size should have been common, not duplicated.  Introduce
      libxl__domain_set_paging_mempool_size() as a shared implementation, and use it
      from the ARM and x86 paths.  It is left as an exercise to the reader to judge
      how libxl/xl can reasonably function without the ability to query the pool
      size...
      
      Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
      replaced with a working and unit tested interface.
      
      This is part of XSA-409 / CVE-2022-33747.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>

pnmtopng: 251 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
174941: tolerable ALL FAIL

flight 174941 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174941/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    


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


