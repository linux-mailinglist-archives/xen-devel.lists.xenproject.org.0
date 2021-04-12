Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235235D09C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 20:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109423.208870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW1gE-0001Bt-H7; Mon, 12 Apr 2021 18:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109423.208870; Mon, 12 Apr 2021 18:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW1gE-0001BR-Bt; Mon, 12 Apr 2021 18:53:02 +0000
Received: by outflank-mailman (input) for mailman id 109423;
 Mon, 12 Apr 2021 18:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lW1gD-0001BJ-Bv; Mon, 12 Apr 2021 18:53:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lW1gD-0003S9-3A; Mon, 12 Apr 2021 18:53:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lW1gC-0003Y8-OX; Mon, 12 Apr 2021 18:53:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lW1gC-00086e-O2; Mon, 12 Apr 2021 18:53:00 +0000
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
	bh=unYrmfpLSw7Z9r+XcdJ4hTdUezAKOh+0e0O9YRWLVLk=; b=jDbZY3s93hxwDRuQVravo6+yDr
	0IOEfg4R18QqlhMZwvLws6wBA1ramOk3avddDbazxcTvBArO0mAyRlQopMQmBMbwaK6ABqt+k0jGY
	T4sfi3xD2Cd8ijb9PMwSAW5yM+x1tBLLToh5OkeXbb38KUKA7WtvqHRA6rHX3Bm0MwE4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-armhf-armhf-libvirt
Message-Id: <E1lW1gC-00086e-O2@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Apr 2021 18:53:00 +0000

branch xen-unstable
xenbranch xen-unstable
job test-armhf-armhf-libvirt
testid guest-start/debian.repeat

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
  Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161061/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-armhf-armhf-libvirt.guest-start--debian.repeat.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-armhf-armhf-libvirt.guest-start--debian.repeat --summary-out=tmp/161061.bisection-summary --basis-template=160646 --blessings=real,real-bisect,real-retry xen-unstable test-armhf-armhf-libvirt guest-start/debian.repeat
Searching for failure / basis pass:
 160960 fail [host=arndale-westfield] / 160820 [host=cubietruck-gleizes] 160796 [host=cubietruck-picasso] 160758 [host=arndale-metrocentre] 160646 [host=cubietruck-braque] 160630 ok.
Failure / basis pass flights: 160960 / 160630
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 90629587e16e2efdb61da77f25c25fba3c4a5fd7
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#90629587e16e2efdb61da77f25c25fba3c4a5fd7-935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
Loaded 5001 nodes in revision graph
Searching for test results:
 160581 [host=arndale-metrocentre]
 160630 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160646 [host=cubietruck-braque]
 160733 [host=arndale-metrocentre]
 160745 [host=arndale-metrocentre]
 160758 [host=arndale-metrocentre]
 160776 [host=cubietruck-picasso]
 160796 [host=cubietruck-picasso]
 160820 [host=cubietruck-gleizes]
 160850 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 025eacc13f6147ffa99da5ecee4ed96e7fe8e887
 160878 blocked 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 160912 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 160970 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160988 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 161002 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 06d1f7a278ddf4344efbb28c3360901b5a79ab75
 161024 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 f36179726847a08418a0b4f9c319b24ecb60fe3a
 161032 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 e650311d4ebfd5bdff1f689b237f790ac05e1cab
 160960 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
 161034 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
 161039 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 161042 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
 161046 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 161053 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
 161056 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
 161061 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 9617d5f9c19d1d157629e1e436791509526e0ce5
Searching for interesting versions
 Result found: flight 160630 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7, results HASH(0x55a32b415dc8) HASH(0x55a32b3ffd80) HASH(0x55a32b400c80) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1db\
 affe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 f36179726847a08418a0b4f9c319b24ecb60fe3a, results HASH(0x55a32b410830) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 90629587e16e2efdb61da77f25c25fba3c4a5fd7, results HASH(0x55a32b40\
 1428) HASH(0x55a32b407a68) Result found: flight 160850 (fail), for basis failure (at ancestor ~234)
 Repro found: flight 160970 (pass), for basis pass
 Repro found: flight 160988 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7ea428895af2840d85c524f0bd11a38aac308308 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
No revisions left to test, checking graph state.
 Result found: flight 161039 (pass), for last pass
 Result found: flight 161042 (fail), for first failure
 Repro found: flight 161046 (pass), for last pass
 Repro found: flight 161053 (fail), for first failure
 Repro found: flight 161056 (pass), for last pass
 Repro found: flight 161061 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
  Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161061/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-armhf-armhf-libvirt.guest-start--debian.repeat.{dot,ps,png,html,svg}.
----------------------------------------
161061: tolerable FAIL

flight 161061 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/161061/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail baseline untested
 test-armhf-armhf-libvirt   18 guest-start/debian.repeat fail baseline untested
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass


jobs:
 build-armhf-libvirt                                          pass    
 test-armhf-armhf-libvirt                                     fail    


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


