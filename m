Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A4515163
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 19:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317567.536952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkU8c-0001x3-FR; Fri, 29 Apr 2022 17:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317567.536952; Fri, 29 Apr 2022 17:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkU8c-0001uM-BR; Fri, 29 Apr 2022 17:10:38 +0000
Received: by outflank-mailman (input) for mailman id 317567;
 Fri, 29 Apr 2022 17:10:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkU8a-0001tt-I5; Fri, 29 Apr 2022 17:10:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkU8a-0004td-FZ; Fri, 29 Apr 2022 17:10:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkU8a-0002rK-4t; Fri, 29 Apr 2022 17:10:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkU8a-00008s-4P; Fri, 29 Apr 2022 17:10:36 +0000
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
	bh=I05VGxE7Wzk+9HGMCMUFxBZ2jonm0V0MJWRcgJWQBbo=; b=uLkBfyZ+9x6nRbBU5RstdsIFeF
	mIf9nYpQWKgppS3MVxU3R9A+uzfLLm1WmZPZbnw1pNTaKvFQ9RDbsn4T/NHbfMvUH9Isy+mYslWwW
	xL4G0SiepnlwLqcODjKmYFDBeotXzEQxrU+Je1PJEWQQJg4Cw46aEnQb3pk568aWswyU=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-arm64-arm64-libvirt-raw
Message-Id: <E1nkU8a-00008s-4P@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Apr 2022 17:10:36 +0000

branch xen-unstable
xenbranch xen-unstable
job test-arm64-arm64-libvirt-raw
testid xen-boot

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Bug not present: fbd2445558beff90eb9607308f0845b18a7a2b5a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169871/


  commit fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Author: David Vrabel <dvrabel@amazon.co.uk>
  Date:   Tue Apr 26 10:33:01 2022 +0200
  
      page_alloc: assert IRQs are enabled in heap alloc/free
      
      Heap pages can only be safely allocated and freed with interrupts
      enabled as they may require a TLB flush which may send IPIs (on x86).
      
      Normally spinlock debugging would catch calls from the incorrect
      context, but not from stop_machine_run() action functions as these are
      called with spin lock debugging disabled.
      
      Enhance the assertions in alloc_xenheap_pages() and
      alloc_domheap_pages() to check interrupts are enabled. For consistency
      the same asserts are used when freeing heap pages.
      
      As an exception, when only 1 PCPU is online, allocations are permitted
      with interrupts disabled as any TLB flushes would be local only. This
      is necessary during early boot.
      
      Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-libvirt-raw.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-arm64-arm64-libvirt-raw.xen-boot --summary-out=tmp/169871.bisection-summary --basis-template=169775 --blessings=real,real-bisect,real-retry xen-unstable test-arm64-arm64-libvirt-raw xen-boot
Searching for failure / basis pass:
 169819 fail [host=rochester0] / 169775 [host=rochester1] 169756 [host=laxton1] 169723 [host=laxton1] 169694 [host=rochester1] 169666 ok.
Failure / basis pass flights: 169819 / 169666
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 da28439ba55b8a571032b3358af567cff749f612
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#2419a159fb943c24a6f2439604b9fdb1478fcd08-da28439ba55b8a571032b3358af567cff749f612
Loaded 5001 nodes in revision graph
Searching for test results:
 169635 [host=laxton1]
 169666 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169694 [host=rochester1]
 169723 [host=laxton1]
 169756 [host=laxton1]
 169775 [host=rochester1]
 169798 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 53b705d02cec03861044e673536586bd1b2443bd
 169823 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169829 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 53b705d02cec03861044e673536586bd1b2443bd
 169834 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169819 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 da28439ba55b8a571032b3358af567cff749f612
 169838 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 163071b1800304c962756789b4ef0ddb978059ba
 169844 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 da28439ba55b8a571032b3358af567cff749f612
 169852 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169860 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
 169863 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169867 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
 169870 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169871 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
Searching for interesting versions
 Result found: flight 169666 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a, results HASH(0x5597e5c33e70) HASH(0x5597e5c38da8) HASH(0x5597e5c3e968) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f\
 7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 163071b1800304c962756789b4ef0ddb978059ba, results HASH(0x5597e5c2b6a8) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f5d61466345ed2213de2d7e391b6cd6d4b86015, results HASH(0x5597e5c3\
 56f8) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08, results HASH(0x5597e5c2b9a8) HASH(0x5597e5c2d0b0) Result found: flight 169798 (fail), for basis failure (at ancestor ~57)
 Repro found: flight 169823 (pass), for basis pass
 Repro found: flight 169844 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
No revisions left to test, checking graph state.
 Result found: flight 169852 (pass), for last pass
 Result found: flight 169860 (fail), for first failure
 Repro found: flight 169863 (pass), for last pass
 Repro found: flight 169867 (fail), for first failure
 Repro found: flight 169870 (pass), for last pass
 Repro found: flight 169871 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Bug not present: fbd2445558beff90eb9607308f0845b18a7a2b5a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169871/


  commit fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Author: David Vrabel <dvrabel@amazon.co.uk>
  Date:   Tue Apr 26 10:33:01 2022 +0200
  
      page_alloc: assert IRQs are enabled in heap alloc/free
      
      Heap pages can only be safely allocated and freed with interrupts
      enabled as they may require a TLB flush which may send IPIs (on x86).
      
      Normally spinlock debugging would catch calls from the incorrect
      context, but not from stop_machine_run() action functions as these are
      called with spin lock debugging disabled.
      
      Enhance the assertions in alloc_xenheap_pages() and
      alloc_domheap_pages() to check interrupts are enabled. For consistency
      the same asserts are used when freeing heap pages.
      
      As an exception, when only 1 PCPU is online, allocations are permitted
      with interrupts disabled as any TLB flushes would be local only. This
      is necessary during early boot.
      
      Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-arm64-arm64-libvirt-raw.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
169871: tolerable FAIL

flight 169871 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169871/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-libvirt-raw  8 xen-boot                fail baseline untested


jobs:
 build-arm64-libvirt                                          pass    
 test-arm64-arm64-libvirt-raw                                 fail    


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


