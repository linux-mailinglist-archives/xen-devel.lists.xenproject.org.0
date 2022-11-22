Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC1633123
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 01:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446938.702751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxGqo-0006qR-BG; Tue, 22 Nov 2022 00:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446938.702751; Tue, 22 Nov 2022 00:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxGqo-0006ng-7h; Tue, 22 Nov 2022 00:09:22 +0000
Received: by outflank-mailman (input) for mailman id 446938;
 Tue, 22 Nov 2022 00:09:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxGqm-0006nW-IX; Tue, 22 Nov 2022 00:09:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxGqm-0005AQ-Et; Tue, 22 Nov 2022 00:09:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxGql-0007D6-V5; Tue, 22 Nov 2022 00:09:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oxGql-0008D5-Uc; Tue, 22 Nov 2022 00:09:19 +0000
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
	bh=UynXKCZXtNIIZgoKaya0INem9dw2XTsHgj3IbvoO0WA=; b=IvNSe98g3o1Vqt4jDyl8uMnwQK
	+m09Hx4YlY9Runa6gsM+Af0q5RoBdiqsFQJSjlxj6FfDsZ18Q8m6Mg4bG2MZVozmYh3rWYSWx8EEf
	wN0R8b9GX7vS6upTZd6s1BavJX8ziEYw1UcfGxxGbHBRzPVbJQXKmziByn4HZ1a4FW/k=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1oxGql-0008D5-Uc@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Nov 2022 00:09:19 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174900/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/174900.bisection-summary --basis-template=174797 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemuu-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 174881 fail [host=nobling1] / 174797 [host=nocera1] 174773 [host=nobling0] 174769 [host=debina0] 174762 [host=huxelrebe0] 174753 [host=italia1] 174747 [host=albana0] 174742 [host=chardonnay1] 174733 [host=chardonnay0] 174724 [host=fiano0] 174701 [host=fiano1] 174682 [host=italia0] 174663 [host=nocera0] 174652 [host=pinot1] 174641 [host=pinot0] 174636 [host=elbling0] 174629 [host=huxelrebe1] 174607 [host=debina1] 174586 [host=nocera1] 174574 [host=albana1] 174563 [host=nobling0] 174547 [host=hux\
 elrebe0] 174542 [host=debina0] 174538 [host=albana0] 174534 [host=italia1] 174526 [host=chardonnay0] 174499 [host=chardonnay1] 174435 [host=fiano0] 174367 [host=fiano1] 174285 [host=italia0] 174252 [host=pinot0] 174210 [host=nocera0] 174133 ok.
Failure / basis pass flights: 174881 / 174133
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#9029bc265cdf2bd63376dde9fdd91db4ce9c0586-db8fa01c61db0317a9ee947925226234c65d48e8
Loaded 5001 nodes in revision graph
Searching for test results:
 173812 [host=elbling0]
 173920 [host=elbling1]
 174057 [host=albana1]
 174133 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
 174165 [host=nocera0]
 174210 [host=nocera0]
 174252 [host=pinot0]
 174285 [host=italia0]
 174367 [host=fiano1]
 174435 [host=fiano0]
 174499 [host=chardonnay1]
 174526 [host=chardonnay0]
 174534 [host=italia1]
 174538 [host=albana0]
 174542 [host=debina0]
 174547 [host=huxelrebe0]
 174563 [host=nobling0]
 174574 [host=albana1]
 174586 [host=nocera1]
 174597 [host=debina1]
 174607 [host=debina1]
 174629 [host=huxelrebe1]
 174636 [host=elbling0]
 174641 [host=pinot0]
 174652 [host=pinot1]
 174663 [host=nocera0]
 174670 [host=italia0]
 174682 [host=italia0]
 174701 [host=fiano1]
 174724 [host=fiano0]
 174733 [host=chardonnay0]
 174742 [host=chardonnay1]
 174747 [host=albana0]
 174753 [host=italia1]
 174762 [host=huxelrebe0]
 174769 [host=debina0]
 174773 [host=nobling0]
 174791 [host=nocera1]
 174797 [host=nocera1]
 174814 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174819 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174843 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174854 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174865 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174874 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174880 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
 174882 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174884 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9bfde319dbac2a1321898d2f75a3f075c3eb7b32
 174885 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 13ac37f1416cae88d97f7baf6cf2a827edb9a187
 174886 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 63ca22f9207aadebe6aaeab4dc21b1fcd9e7795a
 174887 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf
 174888 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5
 174881 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174891 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7
 174898 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174893 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174894 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174895 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174897 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174900 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 173459 [host=chardonnay1]
 173477 [host=chardonnay0]
 173466 [host=fiano1]
 173482 [host=debina1]
 173488 [host=huxelrebe0]
 173738 [host=albana0]
 173663 [host=nocera1]
Searching for interesting versions
 Result found: flight 174133 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999, results HASH(0x55f37100e750) HASH(0x55f370f86e88) HASH(0x55f370a20b50) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7, results HASH(0x55f370f6f138) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5, results HASH(0x55f37100d408) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf, results HASH(0x55f37100b960) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 63ca22f9207aadebe6aaeab4dc21b1fcd9e7795a, results HASH(0x55f371007b50) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 13ac37f1416cae88d97f7baf6cf2a827edb9a187, results HASH(0x55f370f68af8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9bfde319dbac2a1321898d2f75a3f075c3eb7b32, results HASH(0x55f370a28b3\
 0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586, results HASH(0x55f370f79d88) HASH(0x55f370f6fa38) Result found: flight 174814 (fail), for basis failure (at ancestor ~732)
 Repro found: flight 174880 (pass), for basis pass
 Repro found: flight 174881 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
No revisions left to test, checking graph state.
 Result found: flight 174893 (pass), for last pass
 Result found: flight 174894 (fail), for first failure
 Repro found: flight 174895 (pass), for last pass
 Repro found: flight 174897 (fail), for first failure
 Repro found: flight 174898 (pass), for last pass
 Repro found: flight 174900 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174900/


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

pnmtopng: 249 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
174900: tolerable ALL FAIL

flight 174900 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174900/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    


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


