Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD735B125
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 04:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108348.206810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVPaD-0002mK-3V; Sun, 11 Apr 2021 02:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108348.206810; Sun, 11 Apr 2021 02:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVPaC-0002lk-TV; Sun, 11 Apr 2021 02:12:16 +0000
Received: by outflank-mailman (input) for mailman id 108348;
 Sun, 11 Apr 2021 02:12:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVPaC-0002lc-4j; Sun, 11 Apr 2021 02:12:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVPaB-0003DK-R3; Sun, 11 Apr 2021 02:12:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVPaB-0001pw-Ic; Sun, 11 Apr 2021 02:12:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lVPaB-0007ue-Ho; Sun, 11 Apr 2021 02:12:15 +0000
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
	bh=Eg+pw5tvI92Jjgc2xfLI6ypz9krKcELNqS0cE/PcoPw=; b=fb4uscInkajSund6yWlA8KUvfU
	fWV5tdtijB8vDIhD9PsGhN4mko8P77h29QIWDrmgA4mkyXtB4ekVUvuGEkDFbCBIbQ9imeK7IbNpq
	UMGtoG6DNlm1Zeb0ssamUfJlXncHdsyYCQFvmYHpMnKxw0FubSIobOaM4iv1Ug+Bl8/w=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-armhf-armhf-xl-multivcpu
Message-Id: <E1lVPaB-0007ue-Ho@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Apr 2021 02:12:15 +0000

branch xen-unstable
xenbranch xen-unstable
job test-armhf-armhf-xl-multivcpu
testid guest-start/debian.repeat

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
  Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160931/


  commit 9617d5f9c19d1d157629e1e436791509526e0ce5
  Author: Julien Grall <jgrall@amazon.com>
  Date:   Sat Feb 20 17:54:13 2021 +0000
  
      xen/arm: mm: flush_page_to_ram() only need to clean to PoC
      
      At the moment, flush_page_to_ram() is both cleaning and invalidate to
      PoC the page.
      
      The goal of flush_page_to_ram() is to prevent corruption when the guest
      has disabled the cache (the cache line may be dirty) and the guest to
      read previous content.
      
      Per this definition, the invalidating the line is not necessary. So
      invalidating the cache is unnecessary. In fact, it may be counter-
      productive as the line may be (speculatively) accessed a bit after.
      So this will incurr an expensive access to the memory.
      
      More generally, we should avoid interferring too much with cache.
      Therefore, flush_page_to_ram() is updated to only clean to PoC the page.
      
      The performance impact of this change will depend on your
      workload/processor.
      
      Signed-off-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Stefano Stabellini <sstabellini@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-armhf-armhf-xl-multivcpu.guest-start--debian.repeat.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-multivcpu.guest-start--debian.repeat --summary-out=tmp/160931.bisection-summary --basis-template=160646 --blessings=real,real-bisect,real-retry xen-unstable test-armhf-armhf-xl-multivcpu guest-start/debian.repeat
Searching for failure / basis pass:
 160878 fail [host=arndale-bluewater] / 160646 [host=cubietruck-gleizes] 160630 [host=cubietruck-braque] 160581 [host=cubietruck-picasso] 160559 [host=arndale-metrocentre] 160537 [host=arndale-lakeside] 160517 ok.
Failure / basis pass flights: 160878 / 160517
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 e680cc48b7184d3489873d6776f84ba1fc238ced
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#e680cc48b7184d3489873d6776f84ba1fc238ced-935d501\
 ccbf5b8c4db1f6d0730a4a4c998e9e76a
Loaded 5001 nodes in revision graph
Searching for test results:
 160471 [host=cubietruck-braque]
 160492 [host=arndale-westfield]
 160517 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 e680cc48b7184d3489873d6776f84ba1fc238ced
 160537 [host=arndale-lakeside]
 160559 [host=arndale-metrocentre]
 160581 [host=cubietruck-picasso]
 160630 [host=cubietruck-braque]
 160646 [host=cubietruck-gleizes]
 160733 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
 160745 blocked a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
 160758 blocked a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
 160776 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
 160796 blocked a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 625faf9f002bd6ff4b6457a016b8ff338223b659
 160820 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 025eacc13f6147ffa99da5ecee4ed96e7fe8e887
 160850 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 025eacc13f6147ffa99da5ecee4ed96e7fe8e887
 160899 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 e680cc48b7184d3489873d6776f84ba1fc238ced
 160901 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 025eacc13f6147ffa99da5ecee4ed96e7fe8e887
 160903 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 c58fbc38d208f2046e077833fe2b071ff479d7e6
 160878 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 160906 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 00948dcd6a5412695b42c6d5045b0d3075b14114
 160909 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 160913 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0dc28066e9f0339ad8f4aea233cc5912139c5f79
 160915 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 160918 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
 160919 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 160921 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
 160925 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 160931 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
Searching for interesting versions
 Result found: flight 160517 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 625faf9f002bd6ff4b6457a016b8ff338223b659, results HASH(0x564fb28b8210) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0435784cc75dcfef3b5f59c29deb1dbb84265ddb, results HASH(0x564fb28af148) HASH(0x564fb28b0b50) \
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7, results HASH(0x564fb2935120) HASH(0x564fb28a2df0) HASH(0x564fb28aa510) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 0dc28066e9f0339ad8f4aea233cc5912139c5f79, results H\
 ASH(0x564fb2941b08) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 c58fbc38d208f2046e077833fe2b071ff479d7e6, results HASH(0x564fb2937188) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 e680cc48b7184d3489873d6776f84ba1fc238ced, results HASH(0x564fb28a6800) HA\
 SH(0x564fb28a2af0) Result found: flight 160733 (fail), for basis failure (at ancestor ~234)
 Repro found: flight 160899 (pass), for basis pass
 Repro found: flight 160909 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
No revisions left to test, checking graph state.
 Result found: flight 160915 (pass), for last pass
 Result found: flight 160918 (fail), for first failure
 Repro found: flight 160919 (pass), for last pass
 Repro found: flight 160921 (fail), for first failure
 Repro found: flight 160925 (pass), for last pass
 Repro found: flight 160931 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
  Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160931/


  commit 9617d5f9c19d1d157629e1e436791509526e0ce5
  Author: Julien Grall <jgrall@amazon.com>
  Date:   Sat Feb 20 17:54:13 2021 +0000
  
      xen/arm: mm: flush_page_to_ram() only need to clean to PoC
      
      At the moment, flush_page_to_ram() is both cleaning and invalidate to
      PoC the page.
      
      The goal of flush_page_to_ram() is to prevent corruption when the guest
      has disabled the cache (the cache line may be dirty) and the guest to
      read previous content.
      
      Per this definition, the invalidating the line is not necessary. So
      invalidating the cache is unnecessary. In fact, it may be counter-
      productive as the line may be (speculatively) accessed a bit after.
      So this will incurr an expensive access to the memory.
      
      More generally, we should avoid interferring too much with cache.
      Therefore, flush_page_to_ram() is updated to only clean to PoC the page.
      
      The performance impact of this change will depend on your
      workload/processor.
      
      Signed-off-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-multivcpu.guest-start--debian.repeat.{dot,ps,png,html,svg}.
----------------------------------------
160931: tolerable ALL FAIL

flight 160931 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/160931/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail baseline untested
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass


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


