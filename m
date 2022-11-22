Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15950633FDE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447209.703157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxUv3-0005t6-7p; Tue, 22 Nov 2022 15:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447209.703157; Tue, 22 Nov 2022 15:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxUv3-0005qv-46; Tue, 22 Nov 2022 15:10:41 +0000
Received: by outflank-mailman (input) for mailman id 447209;
 Tue, 22 Nov 2022 15:10:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxUv1-0005ql-Ff; Tue, 22 Nov 2022 15:10:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxUv1-0008O8-BW; Tue, 22 Nov 2022 15:10:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oxUv0-0005Jt-VD; Tue, 22 Nov 2022 15:10:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oxUv0-0008Qe-Si; Tue, 22 Nov 2022 15:10:38 +0000
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
	bh=nWRIFH3lSR546WDaYBBsPXEZpPQhFEqF/3TQCDAiElw=; b=b/6imIKpHJyOcnIbM8GvcFhLB7
	4wP0ba7ZPKDTrwsRtoxlYrMlBVVoqB70p9JwFQLJ9Bhj8/XQvo2iKjLNmzMNjuFjXqheX6ET11zzM
	HEAZYL5LHGgctTVr3tWi3CEqeUC+4qEQd0TiDvMePvVE7253NdFaTClXEC3tldk6B/Lc=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
Message-Id: <E1oxUv0-0008Qe-Si@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Nov 2022 15:10:38 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174919/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/174919.bisection-summary --basis-template=174797 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 174881 fail [host=nobling1] / 174797 [host=godello1] 174791 [host=chardonnay0] 174773 [host=elbling1] 174769 [host=italia1] 174762 [host=albana1] 174753 [host=italia0] 174747 [host=nocera1] 174742 [host=debina1] 174733 [host=nobling0] 174724 [host=sabro0] 174701 [host=elbling0] 174682 [host=pinot0] 174670 [host=fiano0] 174663 [host=huxelrebe0] 174652 [host=sabro1] 174641 [host=albana0] 174636 [host=godello0] 174629 [host=debina0] 174607 ok.
Failure / basis pass flights: 174881 / 174607
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
Basis pass a607baf65a66491d5bcbca1e3fa4e672a9ec8611 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#a607baf65a66491d5bcbca1e3fa4e672a9ec8611-0b17b1b0a48de6d19404014ff5f0303ab9782028 https://gitlab.com/keycodemap/keycodemapdb.git#57ba70da5312170883a3d622cd2aa3fd0e2ec7ae-57ba70da5312170883a3d622cd2aa3fd0e2ec7ae git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#2d9b3699136d20e354a94daefebbeefa9ceec7b6-db8fa01c61db0317a9ee947925226234c65d48e8
Loaded 10001 nodes in revision graph
Searching for test results:
 174607 pass a607baf65a66491d5bcbca1e3fa4e672a9ec8611 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
 174629 [host=debina0]
 174636 [host=godello0]
 174641 [host=albana0]
 174652 [host=sabro1]
 174663 [host=huxelrebe0]
 174670 [host=fiano0]
 174682 [host=pinot0]
 174701 [host=elbling0]
 174724 [host=sabro0]
 174733 [host=nobling0]
 174742 [host=debina1]
 174747 [host=nocera1]
 174753 [host=italia0]
 174762 [host=albana1]
 174769 [host=italia1]
 174773 [host=elbling1]
 174791 [host=chardonnay0]
 174797 [host=godello1]
 174814 fail irrelevant
 174819 fail irrelevant
 174826 fail irrelevant
 174843 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174854 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174865 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174874 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174881 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174901 pass a607baf65a66491d5bcbca1e3fa4e672a9ec8611 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
 174902 fail 0b17b1b0a48de6d19404014ff5f0303ab9782028 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174904 pass e864f3b50a3ca57b0ebb33677b94e1da638147d9 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2b27967fb89d7904a1571a2fb963b1c9cac548db
 174905 pass e5d86975857f1ca5431a84c460adc5bd4a260795 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2
 174908 pass cd94d891fb4b5cdda229f58b1dee261d5514082b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b2030e6730a2b727dbfa7ecc5b9f1deb5f50d3fb
 174909 pass d5ae0cd17827e8d2b26b0165a46ab0ebe6d7ce21 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf
 174910 pass 0e39be85708ccc372b7d9bf81970d27fc42b4cc3 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5
 174911 pass 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7
 174912 fail 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174913 pass 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174914 fail 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174915 pass 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174916 fail 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174917 pass 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174919 fail 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
Searching for interesting versions
 Result found: flight 174607 (pass), for basis pass
 For basis failure, parent search stopping at 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999, results HASH(0x55fb38067110) HASH(0x55fb380a3418) HASH(0x55fb3808fc70) For basis failure, parent search stopping at 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5\
 312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7, results HASH(0x55fb375e47e0) For basis failure, parent search stopping at 0e39be85708ccc372b7d9bf81970d27fc42b4cc3 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5, results HASH(0x55fb375dd010) For basis failure, parent search stopping at d5ae0cd17827e8d2b26b0165a46ab0ebe6d7ce21 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 97abc04e387bb070f9c917269be0ff4e5a813bcf, results HASH(0x55fb368492c8) For basis\
  failure, parent search stopping at cd94d891fb4b5cdda229f58b1dee261d5514082b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b2030e6730a2b727dbfa7ecc5b9f1deb5f50d3fb, results HASH(0x55fb375dc6e0) For basis failure, parent search stopping at e5d86975857f1ca5431a84c460adc5bd4a260795 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b\
 1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2, results HASH(0x55fb3806c348) For basis failure, parent search stopping at e864f3b50a3ca57b0ebb33677b94e1da638147d9 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0be\
 dfaa6 2b27967fb89d7904a1571a2fb963b1c9cac548db, results HASH(0x55fb3806c648) For basis failure, parent search stopping at a607baf65a66491d5bcbca1e3fa4e672a9ec8611 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6, results HASH(0x55fb38087f50) HASH(0x55fb3808e568) Result found: flight 174843 (fail), for \
 basis failure (at ancestor ~910)
 Repro found: flight 174901 (pass), for basis pass
 Repro found: flight 174902 (fail), for basis failure
 0 revisions at 8f1a8b26c3dcc6e74048ca15f4a55b24cd7f160c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
No revisions left to test, checking graph state.
 Result found: flight 174913 (pass), for last pass
 Result found: flight 174914 (fail), for first failure
 Repro found: flight 174915 (pass), for last pass
 Repro found: flight 174916 (fail), for first failure
 Repro found: flight 174917 (pass), for last pass
 Repro found: flight 174919 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174919/


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

pnmtopng: 214 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
174919: tolerable FAIL

flight 174919 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174919/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    


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


