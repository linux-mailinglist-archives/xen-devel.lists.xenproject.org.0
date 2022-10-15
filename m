Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B175FFC7A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 00:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423595.670415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojpIz-0003Y6-Dt; Sat, 15 Oct 2022 22:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423595.670415; Sat, 15 Oct 2022 22:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojpIz-0003VJ-Al; Sat, 15 Oct 2022 22:06:53 +0000
Received: by outflank-mailman (input) for mailman id 423595;
 Sat, 15 Oct 2022 22:06:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojpIy-0003V9-OP; Sat, 15 Oct 2022 22:06:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojpIy-0002um-Md; Sat, 15 Oct 2022 22:06:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojpIy-0000Ki-9O; Sat, 15 Oct 2022 22:06:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ojpIy-0006Oe-8p; Sat, 15 Oct 2022 22:06:52 +0000
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
	bh=zIK1k/lNoeoINVS8MXCuhre9ydx0LyQ52eiNzaUlSKQ=; b=cTXjJKCAOAGcPX8KJUKAm8Wv2H
	KEHOJryZtl4JMpwAP+ITIu3/2VonpLj4XfjSOCmrL4LoeAqNIwoY3ko11uijs267O7nQe45Zjxi/o
	uGTQgFBaR7hedif2Ddw+3+0kRq/kGNGNTm2NyMHQ0aOVluAbZBA954ifVM8370H55TZM=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-armhf-armhf-xl
Message-Id: <E1ojpIy-0006Oe-8p@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Oct 2022 22:06:52 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-armhf-armhf-xl
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
  Bug not present: cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173859/


  commit cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Mon Jun 6 06:17:30 2022 +0000
  
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


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.guest-start --summary-out=tmp/173859.bisection-summary --basis-template=173457 --blessings=real,real-bisect,real-retry xen-unstable-smoke test-armhf-armhf-xl guest-start
Searching for failure / basis pass:
 173835 fail [host=cubietruck-braque] / 173457 ok.
Failure / basis pass flights: 173835 / 173457
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
Basis pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#9029bc265cdf2bd63376dde9fdd91db4ce9c0586-5310a3a\
 a5026fb27d6834306d920d6207a1e0898
Loaded 5001 nodes in revision graph
Searching for test results:
 173757 [host=arndale-metrocentre]
 173760 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 197f612b77c5afe04e60df2100a855370d720ad7
 173765 [host=arndale-metrocentre]
 173772 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
 173776 [host=cubietruck-picasso]
 173777 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
 173784 [host=cubietruck-picasso]
 173787 [host=cubietruck-picasso]
 173786 [host=arndale-lakeside]
 173789 [host=cubietruck-picasso]
 173791 [host=cubietruck-picasso]
 173795 [host=cubietruck-picasso]
 173800 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173801 [host=arndale-lakeside]
 173804 [host=arndale-lakeside]
 173809 [host=arndale-lakeside]
 173810 [host=cubietruck-picasso]
 173815 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
 173819 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
 173822 [host=arndale-metrocentre]
 173826 [host=cubietruck-picasso]
 173831 [host=cubietruck-picasso]
 173835 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173834 [host=arndale-metrocentre]
 173842 [host=arndale-metrocentre]
 173852 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
 173859 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
 173457 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
 173492 [host=cubietruck-gleizes]
 173501 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 87a20c98d9f0f422727fe9b4b9e22c2c43a5cd9c
 173504 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586
 173506 [host=cubietruck-gleizes]
 173518 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 87a20c98d9f0f422727fe9b4b9e22c2c43a5cd9c
 173538 [host=cubietruck-picasso]
 173545 [host=cubietruck-gleizes]
 173574 [host=cubietruck-picasso]
 173583 [host=arndale-lakeside]
 173600 [host=cubietruck-picasso]
 173602 [host=arndale-lakeside]
 173604 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 87a20c98d9f0f422727fe9b4b9e22c2c43a5cd9c
 173609 [host=arndale-lakeside]
 173615 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f50a2c0e1d057c00d6061f40ae24d068226052ad
 173619 [host=arndale-lakeside]
 173630 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 55914f7fc91a468649b8a3ec3f53ae1c4aca6670
 173649 [host=cubietruck-gleizes]
 173660 [host=arndale-lakeside]
 173670 [host=cubietruck-picasso]
 173672 [host=cubietruck-gleizes]
 173688 [host=arndale-metrocentre]
 173695 [host=cubietruck-picasso]
 173701 [host=arndale-westfield]
 173707 [host=arndale-metrocentre]
 173754 [host=arndale-metrocentre]
 173751 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
 173709 [host=arndale-westfield]
 173710 [host=cubietruck-picasso]
 173721 [host=arndale-lakeside]
 173718 [host=arndale-westfield]
 173728 [host=arndale-lakeside]
 173730 [host=arndale-lakeside]
 173734 [host=cubietruck-picasso]
 173736 [host=arndale-lakeside]
 173741 [host=cubietruck-picasso]
 173743 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 171d4d24f829075cac83b6fafe7a4ed7c93935a6
 173746 [host=cubietruck-picasso]
 173749 [host=arndale-westfield]
Searching for interesting versions
 Result found: flight 173457 (pass), for basis pass
 For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, results HASH(0x55ce5fdcbfb8) HASH(0x55ce5fdd4900) HASH(0x55ce5fdd1670) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 55914f7fc91a468649b8a3ec3f53ae1c4aca6670, results \
 HASH(0x55ce5fdcbcb8) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f50a2c0e1d057c00d6061f40ae24d068226052ad, results HASH(0x55ce5fdc51f8) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9029bc265cdf2bd63376dde9fdd91db4ce9c0586, results HASH(0x55ce5fdd90b8) H\
 ASH(0x55ce5fddb0c0) Result found: flight 173501 (fail), for basis failure (at ancestor ~623)
 Repro found: flight 173504 (pass), for basis pass
 Repro found: flight 173800 (fail), for basis failure
 0 revisions at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
No revisions left to test, checking graph state.
 Result found: flight 173772 (pass), for last pass
 Result found: flight 173777 (fail), for first failure
 Repro found: flight 173815 (pass), for last pass
 Repro found: flight 173819 (fail), for first failure
 Repro found: flight 173852 (pass), for last pass
 Repro found: flight 173859 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
  Bug not present: cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173859/


  commit cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Mon Jun 6 06:17:30 2022 +0000
  
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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
173859: tolerable ALL FAIL

flight 173859 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173859/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl          14 guest-start             fail baseline untested


jobs:
 test-armhf-armhf-xl                                          fail    


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


