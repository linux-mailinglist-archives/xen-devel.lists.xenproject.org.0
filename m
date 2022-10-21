Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F37607BC6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 18:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427822.677256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oluYa-0004OF-7K; Fri, 21 Oct 2022 16:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427822.677256; Fri, 21 Oct 2022 16:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oluYa-0004MP-4Q; Fri, 21 Oct 2022 16:07:36 +0000
Received: by outflank-mailman (input) for mailman id 427822;
 Fri, 21 Oct 2022 16:07:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluYY-0004MF-MQ; Fri, 21 Oct 2022 16:07:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluYY-0006aH-HC; Fri, 21 Oct 2022 16:07:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluYY-00085x-5u; Fri, 21 Oct 2022 16:07:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oluYY-0005p5-5P; Fri, 21 Oct 2022 16:07:34 +0000
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
	bh=q4OnwKACVOeERfGmdkKtsR8b5WMbiESQkZuXyMnQl9Q=; b=bcsGLuU47LFMrtxQN/swv5yPxD
	ZOMrkviksu3yhzDS6TJM2WOBVqLadES6cfQBu6eUap99OeCgFqdpjxoIzPHZqU1ydyaMANmcawEPj
	Ko0uV2VKW23C6TFzjzlfblIpy6vDslszOpsLTwOEIJW2wI1TErH1O2v9ekssmR40iCZM=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-armhf-armhf-xl-multivcpu
Message-Id: <E1oluYY-0005p5-5P@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Oct 2022 16:07:34 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-armhf-armhf-xl-multivcpu
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174207/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-multivcpu.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-multivcpu.guest-start --summary-out=tmp/174207.bisection-summary --basis-template=172623 --blessings=real,real-bisect,real-retry xen-4.16-testing test-armhf-armhf-xl-multivcpu guest-start
Searching for failure / basis pass:
 174070 fail [host=arndale-metrocentre] / 172623 [host=arndale-lakeside] 172548 [host=arndale-westfield] 172130 ok.
Failure / basis pass flights: 174070 / 172130
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d6915ca91519271a79bc6190a31f0af89e339b2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Basis pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 48b67651746f3124b0d5d30147180f1238d2e9c6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-9d6915ca91519271a79bc6190a31f0af89e339b2 git://xenbits.xen.org/qemu-xen.git#107951211a8d17658e1aaa0c23a8cf29f8806ad\
 8-107951211a8d17658e1aaa0c23a8cf29f8806ad8 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#48b67651746f3124b0d5d30147180f1238d2e9c6-1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Loaded 10001 nodes in revision graph
Searching for test results:
 173759 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173882 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8fc06b6e19e3df93cc989b4f85877d8a7783e5bf 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173986 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d618fe05bf93a8884619e9362bfc5636da55e347 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174070 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d6915ca91519271a79bc6190a31f0af89e339b2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174137 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 48b67651746f3124b0d5d30147180f1238d2e9c6
 174141 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d6915ca91519271a79bc6190a31f0af89e339b2 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 174158 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 917a7e3f347adb0721ff161a68309f51f621eec5 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174161 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d63242bd69a0e3eaa39afd644b634f60f384b278 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174163 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 406ad0582a3df7af498ec4f0adee1a95ceeae64f 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67
 174169 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 943635d8f8486209e4e48966507ad57963e96284
 174171 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 e85e2a3c17b6cd38de041cdaf14d9efdcdabad1a
 174176 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 914fc8e8b4cc003e90d51bee0aef54687358530a
 174181 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174186 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174194 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174198 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174199 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 174204 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
 174207 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 44e9dcc48b81bca202a5b31926125a6a59a4c72e
 172130 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 48b67651746f3124b0d5d30147180f1238d2e9c6
 172548 [host=arndale-westfield]
 172623 [host=arndale-lakeside]
 173493 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173511 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173702 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7d7f02c8e157e936855a091948757f78c7d0298 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
 173603 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 1bce7fb1f702da4f7a749c6f1457ecb20bf74fca
Searching for interesting versions
 Result found: flight 172130 (pass), for basis pass
 For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925, results HASH(0x555cc6dbbfd8) HASH(0x555cc6ca5f00) HASH(0x555cc6cc1300) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56\
 b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 914fc8e8b4cc003e90d51bee0aef54687358530a, results HASH(0x555cc6dac280) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 943635d8f8486209e4e48966507ad57963e96284, results HASH(0x555cc6cd\
 78b8) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 406ad0582a3df7af498ec4f0adee1a95ceeae64f 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x555cc6cd4688) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d63242bd69a0e3eaa39afd644b634f60f384b278 10795\
 1211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x555cc6cd0678) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 917a7e3f347adb0721ff161a68309f51f621eec5 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 cea5ed49bb5716698a11312a3f38bc8865cd1e67, results HASH(0x555cc6ccc640) For basis failure, parent searc\
 h stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0dc9b78a46813d61533b2bb0f7ef897a06a273be 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 48b67651746f3124b0d5d30147180f1238d2e9c6, results HASH(0x555cc6cc4710) HASH(0x555cc6ce1c08) Result found: flight 173493 (fail), for basis failure (at ancestor ~662)
 Repro found: flight 174137 (pass), for basis pass
 Repro found: flight 174141 (fail), for basis failure
 0 revisions at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80580f56b267c96f16f985dbf707b2f96947da4 107951211a8d17658e1aaa0c23a8cf29f8806ad8 46de2eec93bffa0706e6229c0da2919763c8eb04 3a16da801e14b8ff996b6f7408391ce488abd925
No revisions left to test, checking graph state.
 Result found: flight 174186 (pass), for last pass
 Result found: flight 174194 (fail), for first failure
 Repro found: flight 174198 (pass), for last pass
 Repro found: flight 174199 (fail), for first failure
 Repro found: flight 174204 (pass), for last pass
 Repro found: flight 174207 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  44e9dcc48b81bca202a5b31926125a6a59a4c72e
  Bug not present: 3a16da801e14b8ff996b6f7408391ce488abd925
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174207/


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
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-armhf-armhf-xl-multivcpu.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
174207: tolerable ALL FAIL

flight 174207 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174207/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu 14 guest-start            fail baseline untested


jobs:
 test-armhf-armhf-xl-multivcpu                                fail    


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


