Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612AA515AE3
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 08:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317998.537547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkgv6-0003Bn-KW; Sat, 30 Apr 2022 06:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317998.537547; Sat, 30 Apr 2022 06:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkgv6-0003A0-He; Sat, 30 Apr 2022 06:49:32 +0000
Received: by outflank-mailman (input) for mailman id 317998;
 Sat, 30 Apr 2022 06:49:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkgv5-00039m-BR; Sat, 30 Apr 2022 06:49:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkgv5-0001v4-9h; Sat, 30 Apr 2022 06:49:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkgv4-0004sD-US; Sat, 30 Apr 2022 06:49:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkgv4-00042V-U2; Sat, 30 Apr 2022 06:49:30 +0000
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
	bh=4lq2+Zgncz/UlLx0it4HEvClD7O0eUgi2w8yoCefifE=; b=GDh/DK5YI1fMgRaAY8CIa9mmA9
	EN9uYbnwBfFl0BzzxwGAUZM1omsm+uWspUoxWBVvMoZguOyuTZB/z6g+fSLm3jJElHZO9hJAn5cyT
	JsWuG/+AxeLXVRfRJZdJu25xXu65Qr+fdKhuXX2veBIOphMzHgPaVICsS2+foW7PYQYE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-arm64-arm64-xl-credit1
Message-Id: <E1nkgv4-00042V-U2@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Apr 2022 06:49:30 +0000

branch xen-unstable
xenbranch xen-unstable
job test-arm64-arm64-xl-credit1
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Bug not present: fbd2445558beff90eb9607308f0845b18a7a2b5a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169899/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-xl-credit1.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-arm64-arm64-xl-credit1.xen-boot --summary-out=tmp/169899.bisection-summary --basis-template=169775 --blessings=real,real-bisect,real-retry xen-unstable test-arm64-arm64-xl-credit1 xen-boot
Searching for failure / basis pass:
 169859 fail [host=rochester1] / 169775 [host=laxton1] 169756 [host=laxton1] 169723 ok.
Failure / basis pass flights: 169859 / 169723
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
Basis pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f0f0e602f7c9781699ecda9be763eac0b03d54f0-f0f0e602f7c9781699ecda9be763eac0b03d54f0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#2419a159fb943c24a6f2439604b9fdb1478fcd08-d711a8e\
 5279d830d2e4f0f55246ed0c6e4a6bbed
Loaded 5001 nodes in revision graph
Searching for test results:
 169635 [host=laxton1]
 169666 [host=rochester0]
 169694 [host=laxton1]
 169723 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169756 [host=laxton1]
 169775 [host=laxton1]
 169798 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 53b705d02cec03861044e673536586bd1b2443bd
 169819 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 da28439ba55b8a571032b3358af567cff749f612
 169895 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
 169859 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
 169875 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169877 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
 169881 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169884 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 163071b1800304c962756789b4ef0ddb978059ba
 169890 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169891 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
 169893 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169896 pass f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
 169899 fail f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
Searching for interesting versions
 Result found: flight 169723 (pass), for basis pass
 For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a, results HASH(0x55dded89b268) HASH(0x55dded916f00) HASH(0x55dded917e00) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 163071b1800304c962756789b4ef0ddb978059ba, results \
 HASH(0x55dded8b03b0) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f5d61466345ed2213de2d7e391b6cd6d4b86015, results HASH(0x55dded8a4058) For basis failure, parent search stopping at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 2419a159fb943c24a6f2439604b9fdb1478fcd08, results HASH(0x55dded89be90) H\
 ASH(0x55dded8ad420) Result found: flight 169798 (fail), for basis failure (at ancestor ~64)
 Repro found: flight 169875 (pass), for basis pass
 Repro found: flight 169877 (fail), for basis failure
 0 revisions at f0f0e602f7c9781699ecda9be763eac0b03d54f0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fbd2445558beff90eb9607308f0845b18a7a2b5a
No revisions left to test, checking graph state.
 Result found: flight 169890 (pass), for last pass
 Result found: flight 169891 (fail), for first failure
 Repro found: flight 169893 (pass), for last pass
 Repro found: flight 169895 (fail), for first failure
 Repro found: flight 169896 (pass), for last pass
 Repro found: flight 169899 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
  Bug not present: fbd2445558beff90eb9607308f0845b18a7a2b5a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169899/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-arm64-arm64-xl-credit1.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
169899: tolerable ALL FAIL

flight 169899 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169899/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-xl-credit1   8 xen-boot                fail baseline untested


jobs:
 test-arm64-arm64-xl-credit1                                  fail    


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


