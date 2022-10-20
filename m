Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86647606348
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 16:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426864.675597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWfx-00012q-JF; Thu, 20 Oct 2022 14:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426864.675597; Thu, 20 Oct 2022 14:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWfx-00010x-GF; Thu, 20 Oct 2022 14:37:37 +0000
Received: by outflank-mailman (input) for mailman id 426864;
 Thu, 20 Oct 2022 14:37:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olWfw-00010l-A7; Thu, 20 Oct 2022 14:37:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olWfw-0001Ok-3r; Thu, 20 Oct 2022 14:37:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olWfv-0001KN-Oy; Thu, 20 Oct 2022 14:37:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1olWfv-0006B4-OW; Thu, 20 Oct 2022 14:37:35 +0000
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
	bh=rGOgom4+lhhkua9qLBGgc2MkhKI/rZsGvjFo3d3LwOU=; b=OFKlBOUr5NbPK1CsV/I8IUu6DV
	77Fhihfm1u9VNAPLETtu2kkkcaTDptqY4+q4Kx6UNvSaDzyE6VHYFnRMnd/iXRQsmq20+DUC7LyzH
	5cQ7b1Jdu9jByR0WbOdWAYmnRNP1st2LACnELuByLyKwlMoyTB2XmvTKcUmHxUlkrBYI=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-armhf-armhf-libvirt-raw
Message-Id: <E1olWfv-0006B4-OW@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Oct 2022 14:37:35 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-armhf-armhf-libvirt-raw
testid debian-di-install

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Bug not present: 3a16da801e14b8ff996b6f7408391ce488abd925
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174127/


  commit 44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 14:55:53 2022 +0200
  
      xen/arm: Allocate and free P2M pages from the P2M pool
      
      This commit sets/tearsdown of p2m pages pool for non-privileged Arm
      guests by calling `p2m_set_allocation` and `p2m_teardown_allocation`.
      
      - For dom0, P2M pages should come from heap directly instead of p2m
      pool, so that the kernel may take advantage of the extended regions.
      
      - For xl guests, the setting of the p2m pool is called in
      `XEN_DOMCTL_shadow_op` and the p2m pool is destroyed in
      `domain_relinquish_resources`. Note that domctl->u.shadow_op.mb is
      updated with the new size when setting the p2m pool.
      
      - For dom0less domUs, the setting of the p2m pool is called before
      allocating memory during domain creation. Users can specify the p2m
      pool size by `xen,domain-p2m-mem-mb` dts property.
      
      To actually allocate/free pages from the p2m pool, this commit adds
      two helper functions namely `p2m_alloc_page` and `p2m_free_page` to
      `struct p2m_domain`. By replacing the `alloc_domheap_page` and
      `free_domheap_page` with these two helper functions, p2m pages can
      be added/removed from the list of p2m pool rather than from the heap.
      
      Since page from `p2m_alloc_page` is cleaned, take the opportunity
      to remove the redundant `clean_page` in `p2m_create_table`.
      
      This is part of CVE-2022-33747 / XSA-409.
      
      Signed-off-by: Henry Wang <Henry.Wang@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      master commit: cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
      master date: 2022-10-11 14:28:44 +0200


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-armhf-armhf-libvirt-raw.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-libvirt-raw.debian-di-install --summary-out=tmp/174127.bisection-summary --basis-template=172623 --blessings=real,real-bisect,real-retry xen-4.16-testing test-armhf-armhf-libvirt-raw debian-di-install
Searching for failure / basis pass:
 173986 fail [host=arndale-westfield] / 172623 [host=cubietruck-picasso] 172548 [host=arndale-metrocentre] 172130 [host=arndale-lakeside] 172110 ok.
Failure / basis pass flights: 173986 / 172110
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d618fe05bf93a8884619e9362bfc5636da55e347 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 89fe6d0edea841d1d2690cf3f5173e334c687823
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-d618fe05bf93a8884619e9362bfc5636da55e347 git://xenbits.xen.org/qemu-xen.git#107951211a8d17658e1aaa0c23a8cf29f8806ad8-107951211a8d17658e1aaa0c23a8cf29f8806ad8 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#89fe6d0edea841d1d2690cf3f5173e334c687823-1bce7fb1f702da4f7\
 a749c6f1457ecb20bf74fca
From git://cache:9419/git://xenbits.xen.org/xen
   9029bc265c..c7cff11888  smoke      -> origin/smoke
Loaded 10001 nodes in revision graph
Searching for test results:
 173759 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173882 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173977 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 89fe6d0edea841d1d2690cf3f5173e334c687823
 173993 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174011 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 11a04bb4a68bc670bd7619c910d55a78221f3d38 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174026 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3c0d567c3719675b9d8ecf07c31706d96467e31b 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 173986 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d618fe05bf93a8884619e9362bfc5636da55e347 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174042 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 336133660715a08d2b8b1660ea86ef003d6854c4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174058 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 745e0b300dc3f5000e6d48c273b405d4bcc29ba7
 174068 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 e85e2a3c17b6cd38de041cdaf14d9efdcdabad1a
 174077 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 755a9b52844de3e1e47aa1fc9991a4240ccfbf35
 174097 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174104 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174110 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174117 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174122 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174127 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 172130 [host=arndale-lakeside]
 172110 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 89fe6d0edea841d1d2690cf3f5173e334c687823
 172548 [host=arndale-metrocentre]
 172623 [host=cubietruck-picasso]
 173493 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173511 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173702 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7d7f02c8e157e936855a091948757f78c7d0298 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173603 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Searching for interesting versions
 Result found: flight 172110 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925, results HASH(0x5599369674d8) HASH(0x559936a74438) HASH(0x5599369a6ef0) For basis failure, parent search stopping at 2c846fa6b\
 cc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 755a9b52844de3e1e47aa1fc9991a4240ccfbf35, results HASH(0x559936969de0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9b\
 e763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 745e0b300dc3f5000e6d48c273b405d4bcc29ba7, results HASH(0x559936983fe0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 336133660715a08d2b8b1660ea86ef003d6854c\
 4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559936990c60) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3c0d567c3719675b9d8ecf07c31706d96467e31b 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb571\
 6698a11312a3f38bc8865cd1e67, results HASH(0x55993698c928) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 11a04bb4a68bc670bd7619c910d55a78221f3d38 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559936972128) For basis failure, parent search stoppi\
 ng at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 89fe6d0edea841d1d2690cf3f5173e334c687823, results HASH(0x55993697a770) HASH(0x559936967ad8) Result found: flight 173493 (fail), for basis failure (at ancestor ~655)
 Repro found: flight 173977 (pass), for basis pass
 Repro found: flight 173986 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
No revisions left to test, checking graph state.
 Result found: flight 174097 (pass), for last pass
 Result found: flight 174104 (fail), for first failure
 Repro found: flight 174110 (pass), for last pass
 Repro found: flight 174117 (fail), for first failure
 Repro found: flight 174122 (pass), for last pass
 Repro found: flight 174127 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Bug not present: 3a16da801e14b8ff996b6f7408391ce488abd925
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174127/


  commit 44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 14:55:53 2022 +0200
  
      xen/arm: Allocate and free P2M pages from the P2M pool
      
      This commit sets/tearsdown of p2m pages pool for non-privileged Arm
      guests by calling `p2m_set_allocation` and `p2m_teardown_allocation`.
      
      - For dom0, P2M pages should come from heap directly instead of p2m
      pool, so that the kernel may take advantage of the extended regions.
      
      - For xl guests, the setting of the p2m pool is called in
      `XEN_DOMCTL_shadow_op` and the p2m pool is destroyed in
      `domain_relinquish_resources`. Note that domctl->u.shadow_op.mb is
      updated with the new size when setting the p2m pool.
      
      - For dom0less domUs, the setting of the p2m pool is called before
      allocating memory during domain creation. Users can specify the p2m
      pool size by `xen,domain-p2m-mem-mb` dts property.
      
      To actually allocate/free pages from the p2m pool, this commit adds
      two helper functions namely `p2m_alloc_page` and `p2m_free_page` to
      `struct p2m_domain`. By replacing the `alloc_domheap_page` and
      `free_domheap_page` with these two helper functions, p2m pages can
      be added/removed from the list of p2m pool rather than from the heap.
      
      Since page from `p2m_alloc_page` is cleaned, take the opportunity
      to remove the redundant `clean_page` in `p2m_create_table`.
      
      This is part of CVE-2022-33747 / XSA-409.
      
      Signed-off-by: Henry Wang <Henry.Wang@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      master commit: cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
      master date: 2022-10-11 14:28:44 +0200

pnmtopng: 164 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-libvirt-raw.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
174127: tolerable FAIL

flight 174127 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174127/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw 12 debian-di-install       fail baseline untested


jobs:
 build-armhf-libvirt                                          pass    
 test-armhf-armhf-libvirt-raw                                 fail    


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


