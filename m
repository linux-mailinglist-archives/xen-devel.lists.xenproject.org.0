Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE273C2BFA
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jul 2021 02:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153891.284351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m20iU-00007y-Py; Sat, 10 Jul 2021 00:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153891.284351; Sat, 10 Jul 2021 00:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m20iU-00004y-LT; Sat, 10 Jul 2021 00:19:34 +0000
Received: by outflank-mailman (input) for mailman id 153891;
 Sat, 10 Jul 2021 00:19:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m20iT-0008WT-1M; Sat, 10 Jul 2021 00:19:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m20iS-0004up-TL; Sat, 10 Jul 2021 00:19:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m20iS-00021M-Lm; Sat, 10 Jul 2021 00:19:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m20iS-0008Js-LK; Sat, 10 Jul 2021 00:19:32 +0000
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
	bh=PjFjpTgY2mqXj2Rx945b58hAdsYv8e2vfGBPGvDUc8o=; b=vIotP7j4LsoarfFT7a/MrHVSQJ
	6vytnyJqq0Ydzf2tArffWp0befS94up+ztaB1ZPqW7DIlagZFrK84hgK2CczTQJunFl4PlaHt0C13
	RFbHOd/tV752lZ3UH9C9cBDoq3YwsbuSsZz48KGcUGosOffwTS2ySHdje8/Q1o4rByDo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1m20iS-0008Js-LK@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Jul 2021 00:19:32 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  0dbb4be739c50b8018aeeb285ef290bf7962a28e
  Bug not present: d276e0f3f14f2d46f27989008770eb2b9c678bc4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163499/


  commit 0dbb4be739c50b8018aeeb285ef290bf7962a28e
  Author: Costin Lupu <costin.lupu@cs.pub.ro>
  Date:   Tue Jun 8 15:35:27 2021 +0300
  
      tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
      
      If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
      header) then gcc will trigger a redefinition error because of -Werror. This
      patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
      confusion between control domain page granularity (PAGE_* definitions) and
      guest domain page granularity.
      
      The exception is in osdep_xenforeignmemory_map() where we need the system page
      size to check whether the PFN array should be allocated with mmap() or with
      dynamic allocation.
      
      Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/163499.bisection-summary --basis-template=163474 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 163480 fail [host=himrod2] / 163474 ok.
Failure / basis pass flights: 163480 / 163474
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 e6917412628d11986f0e6fc028851c8181b24fb8
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf-e6917412628d11986f0e6fc028851c8181b24fb8
Loaded 5001 nodes in revision graph
Searching for test results:
 163474 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
 163480 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 e6917412628d11986f0e6fc028851c8181b24fb8
 163487 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
 163488 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 e6917412628d11986f0e6fc028851c8181b24fb8
 163491 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d276e0f3f14f2d46f27989008770eb2b9c678bc4
 163492 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2d1a35f1e6c2113a6322fdb758a198608c90e4bd
 163493 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0dbb4be739c50b8018aeeb285ef290bf7962a28e
 163495 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d276e0f3f14f2d46f27989008770eb2b9c678bc4
 163496 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0dbb4be739c50b8018aeeb285ef290bf7962a28e
 163498 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d276e0f3f14f2d46f27989008770eb2b9c678bc4
 163499 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0dbb4be739c50b8018aeeb285ef290bf7962a28e
Searching for interesting versions
 Result found: flight 163474 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d276e0f3f14f2d46f27989008770eb2b9c678bc4, results HASH(0x5651c08f6828) HASH(0x5651c090bb80) HASH(0x5651c08f4220) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf, results HASH(0x5651c08fed80) HASH(0x5651c08ff080) Result found: flight 163480 (fail), for \
 basis failure (at ancestor ~631)
 Repro found: flight 163487 (pass), for basis pass
 Repro found: flight 163488 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d276e0f3f14f2d46f27989008770eb2b9c678bc4
No revisions left to test, checking graph state.
 Result found: flight 163491 (pass), for last pass
 Result found: flight 163493 (fail), for first failure
 Repro found: flight 163495 (pass), for last pass
 Repro found: flight 163496 (fail), for first failure
 Repro found: flight 163498 (pass), for last pass
 Repro found: flight 163499 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  0dbb4be739c50b8018aeeb285ef290bf7962a28e
  Bug not present: d276e0f3f14f2d46f27989008770eb2b9c678bc4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163499/


  commit 0dbb4be739c50b8018aeeb285ef290bf7962a28e
  Author: Costin Lupu <costin.lupu@cs.pub.ro>
  Date:   Tue Jun 8 15:35:27 2021 +0300
  
      tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
      
      If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
      header) then gcc will trigger a redefinition error because of -Werror. This
      patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
      confusion between control domain page granularity (PAGE_* definitions) and
      guest domain page granularity.
      
      The exception is in osdep_xenforeignmemory_map() where we need the system page
      size to check whether the PFN array should be allocated with mmap() or with
      dynamic allocation.
      
      Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
163499: tolerable ALL FAIL

flight 163499 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163499/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


