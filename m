Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CE6091C7
	for <lists+xen-devel@lfdr.de>; Sun, 23 Oct 2022 10:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428575.678820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omW9z-0005Mx-PB; Sun, 23 Oct 2022 08:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428575.678820; Sun, 23 Oct 2022 08:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omW9z-0005Ke-MS; Sun, 23 Oct 2022 08:16:43 +0000
Received: by outflank-mailman (input) for mailman id 428575;
 Sun, 23 Oct 2022 08:16:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omW9y-0005KU-5x; Sun, 23 Oct 2022 08:16:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omW9y-0006lu-0q; Sun, 23 Oct 2022 08:16:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omW9x-0004sa-Ok; Sun, 23 Oct 2022 08:16:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1omW9x-0003wo-OE; Sun, 23 Oct 2022 08:16:41 +0000
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
	bh=gJw2VNJ8ie2y0bDoyJfRTyAkPKwMmoDI7DzDzjHZ7aI=; b=j9gCFtFbcbkqFMAdvd2FUG99Ih
	jN/CVB1OXahT4KcGPscP6iSMulcjt/eOTLSdYGvNwzSOYGpPIfx5z8z0glkNsM2N+k6gw7U7U/FSz
	oRjaQ1syRsBqyNZ3GdNsr7dQ5cp8FKCpS2ysmavqHL/JP157EpyOAafR1n6zfew0qDsk=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-armhf-armhf-xl-arndale
Message-Id: <E1omW9x-0003wo-OE@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Oct 2022 08:16:41 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-armhf-armhf-xl-arndale
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174296/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-arndale.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-arndale.guest-start --summary-out=tmp/174296.bisection-summary --basis-template=172623 --blessings=real,real-bisect,real-retry xen-4.16-testing test-armhf-armhf-xl-arndale guest-start
Searching for failure / basis pass:
 174212 fail [host=arndale-lakeside] / 172623 ok.
Failure / basis pass flights: 174212 / 172623
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6720db5ddffec747bb0b2830e528511b1a4bfb2 62dd49f2172fb7dfe8d4223bfa45aede05155328 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Basis pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 444260d45ec2a84e8f8c192b3539a3cd5591d009 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#444260d45ec2a84e8f8c192b3539a3cd5591d009-c6720db5ddffec747bb0b2830e528511b1a4bfb2 git://xenbits.xen.org/qemu-xen.git#107951211a8d17658e1aaa0c23a8cf29f8806ad\
 8-62dd49f2172fb7dfe8d4223bfa45aede05155328 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#cea5ed49bb5716698a11312a3f38bc8865cd1e67-1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Loaded 15006 nodes in revision graph
Searching for test results:
 173759 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173882 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173986 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d618fe05bf93a8884619e9362bfc5636da55e347 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174070 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d6915ca91519271a79bc6190a31f0af89e339b2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174140 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6720db5ddffec747bb0b2830e528511b1a4bfb2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174209 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 444260d45ec2a84e8f8c192b3539a3cd5591d009 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174217 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6720db5ddffec747bb0b2830e528511b1a4bfb2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174230 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fdb4de628120a8736ee47522d1941e3ad3bdf8a 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174212 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6720db5ddffec747bb0b2830e528511b1a4bfb2 62dd49f2172fb7dfe8d4223bfa45aede05155328 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174238 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6a2b20ff97e4256970644a07f74a4c5655bf5072 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174251 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4364d661685d4806b8fb66ff76eaece7ea6a4426 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174262 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 f5959ed715e19cf2844656477dbf74c2f576c9d4
 174274 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 e8882bcfe35520e950ba60acd6e67e65f1ce90a8
 174279 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174282 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 32cb81501c8b858fe9a451650804ec3024a8b364
 174289 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174293 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174294 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174296 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174286 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 172623 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 444260d45ec2a84e8f8c192b3539a3cd5591d009 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 173493 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173511 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173702 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7d7f02c8e157e936855a091948757f78c7d0298 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173603 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Searching for interesting versions
 Result found: flight 172623 (pass), for basis pass
 For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925, results HASH(0x559a14fa7e78) HASH(0x559a14f592a0) HASH(0x559a14f86d38) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56\
 b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 f5959ed715e19cf2844656477dbf74c2f576c9d4, results HASH(0x559a14fa9b80) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4364d661685d4806b8fb66ff76eaece7ea6a4426 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559a14f5\
 ccb0) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6a2b20ff97e4256970644a07f74a4c5655bf5072 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559a14fa2940) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fdb4de628120a8736ee47522d1941e3ad3bdf8a 10795\
 1211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559a14f8a148) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 444260d45ec2a84e8f8c192b3539a3cd5591d009 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x559a14f85030) HASH(0x559a14f91088) Result fou\
 nd: flight 173493 (fail), for basis failure (at ancestor ~675)
 Repro found: flight 174209 (pass), for basis pass
 Repro found: flight 174212 (fail), for basis failure
 0 revisions at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
No revisions left to test, checking graph state.
 Result found: flight 174279 (pass), for last pass
 Result found: flight 174286 (fail), for first failure
 Repro found: flight 174289 (pass), for last pass
 Repro found: flight 174293 (fail), for first failure
 Repro found: flight 174294 (pass), for last pass
 Repro found: flight 174296 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Bug not present: 3a16da801e14b8ff996b6f7408391ce488abd925
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174296/


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

pnmtopng: 154 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-arndale.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
174296: tolerable ALL FAIL

flight 174296 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174296/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl-arndale  14 guest-start             fail baseline untested


jobs:
 test-armhf-armhf-xl-arndale                                  fail    


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


