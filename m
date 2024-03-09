Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA0876ED0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 03:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690477.1076511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rimYM-0007Tw-DQ; Sat, 09 Mar 2024 02:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690477.1076511; Sat, 09 Mar 2024 02:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rimYM-0007Ri-Ak; Sat, 09 Mar 2024 02:35:14 +0000
Received: by outflank-mailman (input) for mailman id 690477;
 Sat, 09 Mar 2024 02:35:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rimYL-0007RY-MO; Sat, 09 Mar 2024 02:35:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rimYL-00071d-Jv; Sat, 09 Mar 2024 02:35:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rimYL-0001Uk-By; Sat, 09 Mar 2024 02:35:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rimYL-0003so-BR; Sat, 09 Mar 2024 02:35:13 +0000
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
	bh=DxGPJnoNMKAMxiLBFZQNXj8/zAd7zRM+f4Wy5CT2sec=; b=XJMkSKgarU9st5TBsAiVCNhAaJ
	SML2pseKzloroiwBs9XoWYbn3gBJZUSXP29ytJLXebk72zSoMKEwIcG021Qy7PP+ENHFbhuojuM6L
	+JJZU1Y0FCSEHKXD2e9AXAaT+A5j1JuzVpGkk+Q2bagq2TjZ+k83HUix8Ibp/Z8/RLPY=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-livepatch
Message-Id: <E1rimYL-0003so-BR@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Mar 2024 02:35:13 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-livepatch
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184963/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run --summary-out=tmp/184963.bisection-summary --basis-template=184927 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-livepatch livepatch-run
Searching for failure / basis pass:
 184940 fail [host=rimava0] / 184927 [host=pinot0] 184919 [host=septiner0] 184914 [host=elbling0] 184907 [host=albana0] 184905 [host=huxelrebe1] 184882 [host=debina0] 184875 [host=albana1] 184852 [host=huxelrebe0] 184833 [host=nobling1] 184828 [host=sabro1] 184820 [host=italia0] 184811 [host=rimava1] 184796 [host=italia1] 184780 [host=fiano1] 184776 [host=fiano0] 184767 [host=elbling1] 184763 [host=sabro0] 184756 [host=pinot1] 184752 [host=godello1] 184746 [host=himrod0] 184732 [host=debina1] 18\
 4729 ok.
Failure / basis pass flights: 184940 / 184729
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9ee7dc877b8754ce2fc82500feea52c04d4e6409
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#9ee7dc877b8754ce2fc82500feea52c04d4e6409-90173fc5a2a826bbcabde22af405d0a617818b70
From git://cache:9419/git://xenbits.xen.org/xen
   90173fc5a2..ef31ffbc3d  staging    -> origin/staging
Loaded 5001 nodes in revision graph
Searching for test results:
 184729 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9ee7dc877b8754ce2fc82500feea52c04d4e6409
 184732 [host=debina1]
 184746 [host=himrod0]
 184752 [host=godello1]
 184756 [host=pinot1]
 184763 [host=sabro0]
 184767 [host=elbling1]
 184776 [host=fiano0]
 184780 [host=fiano1]
 184796 [host=italia1]
 184811 [host=rimava1]
 184820 [host=italia0]
 184828 [host=sabro1]
 184833 [host=nobling1]
 184852 [host=huxelrebe0]
 184875 [host=albana1]
 184882 [host=debina0]
 184905 [host=huxelrebe1]
 184907 [host=albana0]
 184914 [host=elbling0]
 184919 [host=septiner0]
 184948 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
 184927 [host=pinot0]
 184950 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 52ebde3cfae240e708571742eb7b6942efbd42a2
 184940 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 90173fc5a2a826bbcabde22af405d0a617818b70
 184947 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9ee7dc877b8754ce2fc82500feea52c04d4e6409
 184951 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 efad36f1ba18946acecc030166b1a6bebeb88ea2
 184952 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e7b62fcfd9dd66398dd0d3c79b3bae216db64e97
 184953 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9249a441c98ff063c0c065538b419a3bf1dac24a
 184954 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 989556c6f8ca080f5f202417af97d1188b9ba52a
 184955 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
 184956 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184957 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
 184959 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184960 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
 184962 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
 184963 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b083b1c393dc8961acf0959b1d2e0ad459985ae3
Searching for interesting versions
 Result found: flight 184729 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb, results HASH(0x5591d618a750) HASH(0x5591d60ef270) HASH(0x5591d5baf750) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 989556c6f8ca080f5f202417af97d1188b9ba52a, results HASH(0x5591d60fa1e8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9249a441c98ff063c0c065538b419a3bf1dac24a, results HASH(0x5591d6110530) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e7b62fcfd9dd66398dd0d3c79b3bae216db64e97, results HASH(0x5591d610ba78) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 efad36f1ba18946acecc030166b1a6bebeb88ea2, results HASH(0x5591d60e7c40) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 52ebde3cfae240e708571742eb7b6942efbd42a2, results HASH(0x5591d6101428) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 9ee7dc877b8754ce2fc82500feea52c04d4e6409, results HASH(0x5591d61055e\
 0) HASH(0x5591d610b478) Result found: flight 184940 (fail), for basis failure (at ancestor ~2910)
 Repro found: flight 184947 (pass), for basis pass
 Repro found: flight 184948 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ef969144a425e39f5b214a875b5713d0ea8575fb
No revisions left to test, checking graph state.
 Result found: flight 184956 (pass), for last pass
 Result found: flight 184957 (fail), for first failure
 Repro found: flight 184959 (pass), for last pass
 Repro found: flight 184960 (fail), for first failure
 Repro found: flight 184962 (pass), for last pass
 Repro found: flight 184963 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b083b1c393dc8961acf0959b1d2e0ad459985ae3
  Bug not present: ef969144a425e39f5b214a875b5713d0ea8575fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184963/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
184963: tolerable ALL FAIL

flight 184963 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/184963/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-livepatch   13 livepatch-run           fail baseline untested


jobs:
 test-amd64-amd64-livepatch                                   fail    


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


