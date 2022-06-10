Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958A546FE8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 01:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346813.572750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nznuk-0007ZS-IP; Fri, 10 Jun 2022 23:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346813.572750; Fri, 10 Jun 2022 23:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nznuk-0007Wn-Ea; Fri, 10 Jun 2022 23:19:38 +0000
Received: by outflank-mailman (input) for mailman id 346813;
 Fri, 10 Jun 2022 23:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznui-0007Wd-Pq; Fri, 10 Jun 2022 23:19:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznui-0003Ei-L1; Fri, 10 Jun 2022 23:19:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznui-0006Xx-8y; Fri, 10 Jun 2022 23:19:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nznui-0005IW-8Q; Fri, 10 Jun 2022 23:19:36 +0000
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
	bh=AO9OyvM75a6VG3Z3Wk2by7qqxAEF73GL7HYEwr8ax70=; b=e7vjn7sPzit7rWW8M4IxzSCqXD
	7ig5+Nhwn9RDTkeY5FVkRu36y3P15HjFg0GbhlqrxkTuMyLgMOlQ6vYgQfHf04iYTWUHcH6Gx+er0
	aLiis8ruSDbzWtpGoVAzPOvp0wKRxkLE7n5I7PCbIf7OAFstR0oBBcRfbjtjMgBs0KF8=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
Message-Id: <E1nznui-0005IW-8Q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 23:19:36 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f3185c165d28901c3222becfc8be547263c53745
  Bug not present: 7158e80c887d8b451c8525b7fe32049742814e69
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170958/


  commit f3185c165d28901c3222becfc8be547263c53745
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Jun 8 17:03:32 2022 +0200
  
      IOMMU/x86: perform PV Dom0 mappings in batches
      
      For large page mappings to be easily usable (i.e. in particular without
      un-shattering of smaller page mappings) and for mapping operations to
      then also be more efficient, pass batches of Dom0 memory to iommu_map().
      In dom0_construct_pv() and its helpers (covering strict mode) this
      additionally requires establishing the type of those pages (albeit with
      zero type references).
      
      The earlier establishing of PGT_writable_page | PGT_validated requires
      the existing places where this gets done (through get_page_and_type())
      to be updated: For pages which actually have a mapping, the type
      refcount needs to be 1.
      
      There is actually a related bug that gets fixed here as a side effect:
      Typically the last L1 table would get marked as such only after
      get_page_and_type(..., PGT_writable_page). While this is fine as far as
      refcounting goes, the page did remain mapped in the IOMMU in this case
      (when "iommu=dom0-strict").
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Roger Pau Monné <roger.pau@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.xen-boot --summary-out=tmp/170967.bisection-summary --basis-template=170890 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemut-debianhvm-i386-xsm xen-boot
Searching for failure / basis pass:
 170908 fail [host=himrod0] / 170890 [host=nocera0] 170877 [host=huxelrebe0] 170865 [host=nobling1] 170852 [host=nobling0] 170840 [host=chardonnay0] 170823 [host=albana0] 170813 [host=debina1] 170806 [host=fiano1] 170801 [host=godello0] 170797 [host=albana1] 170792 [host=pinot0] 170780 [host=chardonnay1] 170772 [host=italia0] 170766 [host=italia1] 170758 [host=elbling0] 170751 [host=debina0] 170747 [host=sabro1] 170740 [host=fiano0] 170726 [host=nobling1] 170720 ok.
Failure / basis pass flights: 170908 / 170720
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 ec0cce125b8b9fccde3fa825b8ee963083b5de3b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea235\
 3e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#ec0cce125b8b9fccde3fa825b8ee963083b5de3b-c1c9cae3a9633054b177c5de21ad7268162b2f2c
Loaded 5001 nodes in revision graph
Searching for test results:
 170606 [host=nocera0]
 170647 [host=huxelrebe0]
 170657 [host=nocera1]
 170712 [host=sabro0]
 170720 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 ec0cce125b8b9fccde3fa825b8ee963083b5de3b
 170726 [host=nobling1]
 170740 [host=fiano0]
 170747 [host=sabro1]
 170751 [host=debina0]
 170758 [host=elbling0]
 170766 [host=italia1]
 170772 [host=italia0]
 170780 [host=chardonnay1]
 170792 [host=pinot0]
 170797 [host=albana1]
 170801 [host=godello0]
 170806 [host=fiano1]
 170813 [host=debina1]
 170823 [host=albana0]
 170840 [host=chardonnay0]
 170852 [host=nobling0]
 170865 [host=nobling1]
 170877 [host=huxelrebe0]
 170890 [host=nocera0]
 170897 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170909 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 ec0cce125b8b9fccde3fa825b8ee963083b5de3b
 170910 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170912 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 cea9ae06229577cd5b77019ce122f9cdd1568106
 170916 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f8c818848fa64b1957411faea7cee22d677cebcc
 170918 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 e7f144f80839168e632ea4405ad114e991beecdf
 170927 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 be464973e4565fd9b4999a6eb9db9f469616f07b
 170931 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 28e13c7f4382f5dce6b2fb2ccef2098f22c04694
 170934 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 7158e80c887d8b451c8525b7fe32049742814e69
 170939 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170945 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 7158e80c887d8b451c8525b7fe32049742814e69
 170947 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170954 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 7158e80c887d8b451c8525b7fe32049742814e69
 170908 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
 170958 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170967 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
Searching for interesting versions
 Result found: flight 170720 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 7158e80c887d8b451c8525b7fe32049742814e69, results HASH(0x55e6d96a0958) HASH(0x55e6d96ad8e0) HASH(0x55e6d96a0748) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311\
 c2d1fd9d2fa9a0768ea2353e8a79b42 28e13c7f4382f5dce6b2fb2ccef2098f22c04694, results HASH(0x55e6d9c89990) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 be464973e4565fd9b4999a6eb9db9f469616f07b, results HASH(0x55e6d9c88768) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 e7f144f80839168e632ea4405ad114e991beecdf, results HASH(0x55e6d9c0c518) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f8c818848fa64b1957411faea7cee22d677cebcc, results HASH(0x55e6d9c0a510) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 cea9ae06229577cd5b77019ce122f9cdd1568106, results HASH(0x55e6d9c092e8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 ec0cce125b8b9fccde3fa825b8ee963083b5de3b, results HASH(0x55e6d9bfac6\
 0) HASH(0x55e6d9c044d0) Result found: flight 170897 (fail), for basis failure (at ancestor ~164)
 Repro found: flight 170909 (pass), for basis pass
 Repro found: flight 170967 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 7158e80c887d8b451c8525b7fe32049742814e69
No revisions left to test, checking graph state.
 Result found: flight 170934 (pass), for last pass
 Result found: flight 170939 (fail), for first failure
 Repro found: flight 170945 (pass), for last pass
 Repro found: flight 170947 (fail), for first failure
 Repro found: flight 170954 (pass), for last pass
 Repro found: flight 170958 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f3185c165d28901c3222becfc8be547263c53745
  Bug not present: 7158e80c887d8b451c8525b7fe32049742814e69
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170958/


  commit f3185c165d28901c3222becfc8be547263c53745
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Jun 8 17:03:32 2022 +0200
  
      IOMMU/x86: perform PV Dom0 mappings in batches
      
      For large page mappings to be easily usable (i.e. in particular without
      un-shattering of smaller page mappings) and for mapping operations to
      then also be more efficient, pass batches of Dom0 memory to iommu_map().
      In dom0_construct_pv() and its helpers (covering strict mode) this
      additionally requires establishing the type of those pages (albeit with
      zero type references).
      
      The earlier establishing of PGT_writable_page | PGT_validated requires
      the existing places where this gets done (through get_page_and_type())
      to be updated: For pages which actually have a mapping, the type
      refcount needs to be 1.
      
      There is actually a related bug that gets fixed here as a side effect:
      Typically the last L1 table would get marked as such only after
      get_page_and_type(..., PGT_writable_page). While this is fine as far as
      refcounting goes, the page did remain mapped in the IOMMU in this case
      (when "iommu=dom0-strict").
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
170967: tolerable FAIL

flight 170967 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/170967/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 8 xen-boot fail baseline untested


jobs:
 build-amd64-xsm                                              pass    
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


