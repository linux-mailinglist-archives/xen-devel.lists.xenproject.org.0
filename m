Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67230877195
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 15:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690940.1076648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rixNv-0007aO-0Y; Sat, 09 Mar 2024 14:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690940.1076648; Sat, 09 Mar 2024 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rixNu-0007XZ-Tm; Sat, 09 Mar 2024 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 690940;
 Sat, 09 Mar 2024 14:09:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rixNt-0007XP-38; Sat, 09 Mar 2024 14:09:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rixNs-0004Hn-UM; Sat, 09 Mar 2024 14:09:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rixNs-0001iI-JM; Sat, 09 Mar 2024 14:09:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rixNs-00064H-Iy; Sat, 09 Mar 2024 14:09:08 +0000
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
	bh=5FiXmiKJDZQTWUlKmQRfF+CrJoSRajSm1i5ZgYzFC3c=; b=5sxfq0ZvmKQMSaDTIEAnKQkOeG
	aPF/rGUA2tV6Q2PIy5ZVAV0nvTC/quYgBzlmqBvWaW6OHBf/4U8lEsPXpyMOy9R+Zz/IgON/ZA6jE
	t1lXvsatYSk15gzaxJKcQr3eKLJseVLzU9XXrYErP0nJTIVA2ONdHi/imJT/kXABcUC4=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-livepatch
Message-Id: <E1rixNs-00064H-Iy@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Mar 2024 14:09:08 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-livepatch
testid livepatch-run

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b083b1c393dc8961acf0959b1d2e0ad459985ae3
  Bug not present: ef969144a425e39f5b214a875b5713d0ea8575fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184979/


  commit b083b1c393dc8961acf0959b1d2e0ad459985ae3
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 5 11:39:19 2024 +0000
  
      x86/livepatch: Relax permissions on rodata too
      
      This reinstates the capability to patch .rodata in load/unload hooks, which
      was lost when we stopped using CR0.WP=0 to patch.
      
      This turns out to be rather less of a large TODO than I thought at the time.
      
      Fixes: 8676092a0f16 ("x86/livepatch: Fix livepatch application when CET is active")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-livepatch.livepatch-run --summary-out=tmp/184979.bisection-summary --basis-template=184927 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-livepatch livepatch-run
Searching for failure / basis pass:
 184946 fail [host=albana1] / 184927 [host=italia0] 184919 [host=huxelrebe0] 184914 [host=nobling0] 184907 [host=huxelrebe1] 184905 [host=albana0] 184882 ok.
Failure / basis pass flights: 184946 / 184882
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 856664f774bd5b66301c5f9022126b61b8cb492d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#856664f774bd5b66301c5f9022126b61b8cb492d-90173fc5a2a826bbcabde22af405d0a617818b70
Loaded 5001 nodes in revision graph
Searching for test results:
 184852 [host=elbling0]
 184875 [host=debina1]
 184882 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 856664f774bd5b66301c5f9022126b61b8cb492d
 184905 [host=albana0]
 184907 [host=huxelrebe1]
 184914 [host=nobling0]
 184919 [host=huxelrebe0]
 184927 [host=italia0]
 184940 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
 184964 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 856664f774bd5b66301c5f9022126b61b8cb492d
 184966 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
 184968 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f4900d6d69b534a00a2d6f8981a3bd5dc22a7c0b
 184946 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
 184969 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 49b664f5bffa3a86734c66491d7dcdebbdecfb26
 184973 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184975 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
 184976 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184977 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
 184978 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184979 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
Searching for interesting versions
 Result found: flight 184882 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb, results HASH(0x55db160eb820) HASH(0x55db16100c68) HASH(0x55db1610c4e0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 49b664f5bffa3a86734c66491d7dcdebbdecfb26, results HASH(0x55db161081a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f4900d6d69b534a00a2d6f8981a3bd5dc22a7c0b, results HASH(0x55db161050f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 856664f774bd5b66301c5f9022126b61b8cb492d, results HASH(0x55db160faaa8) HASH(0x55db160f45e8) Result found: flight 184940 (fail), for basis failure (at ancestor ~2910)
 Repro found: flight 184964 (pass), for basis pass
 Repro found: flight 184966 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
No revisions left to test, checking graph state.
 Result found: flight 184973 (pass), for last pass
 Result found: flight 184975 (fail), for first failure
 Repro found: flight 184976 (pass), for last pass
 Repro found: flight 184977 (fail), for first failure
 Repro found: flight 184978 (pass), for last pass
 Repro found: flight 184979 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b083b1c393dc8961acf0959b1d2e0ad459985ae3
  Bug not present: ef969144a425e39f5b214a875b5713d0ea8575fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184979/


  commit b083b1c393dc8961acf0959b1d2e0ad459985ae3
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 5 11:39:19 2024 +0000
  
      x86/livepatch: Relax permissions on rodata too
      
      This reinstates the capability to patch .rodata in load/unload hooks, which
      was lost when we stopped using CR0.WP=0 to patch.
      
      This turns out to be rather less of a large TODO than I thought at the time.
      
      Fixes: 8676092a0f16 ("x86/livepatch: Fix livepatch application when CET is active")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
184979: tolerable ALL FAIL

flight 184979 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/184979/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-livepatch    13 livepatch-run           fail baseline untested


jobs:
 test-amd64-i386-livepatch                                    fail    


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


