Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B13F38F1
	for <lists+xen-devel@lfdr.de>; Sat, 21 Aug 2021 08:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169697.310028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHKLD-0003xo-4z; Sat, 21 Aug 2021 06:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169697.310028; Sat, 21 Aug 2021 06:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHKLC-0003vi-RT; Sat, 21 Aug 2021 06:18:50 +0000
Received: by outflank-mailman (input) for mailman id 169697;
 Sat, 21 Aug 2021 06:18:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHKLB-0003vY-IF; Sat, 21 Aug 2021 06:18:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHKLB-0006oN-8R; Sat, 21 Aug 2021 06:18:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHKLA-0000YM-Uc; Sat, 21 Aug 2021 06:18:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mHKLA-0004VC-U7; Sat, 21 Aug 2021 06:18:48 +0000
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
	bh=lOv1VVT3Rq46mwm4Pw8LhjDwDBm1QaceUkdRh+Y57Wk=; b=KgxHhQXTE22gE4TzDcmrhtuPPv
	CARE6UWW90GmdrVxTvlzW3sa4COlDqT829OpB7gRCH4MT4OCBG4+HXWoQ1d4N4mpvTW6MTlGOAMir
	h7NGbXM7tjRoCAbg5FYdk9dLkZlOZzYVSJA/mzWTyKHfKLIJ1W4va7hqlq7WsMBWAQZ4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-examine
Message-Id: <E1mHKLA-0004VC-U7@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 21 Aug 2021 06:18:48 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-examine
testid reboot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6b1ca51b1a91d002636518afe4a8a50ba7212495
  Bug not present: 4c0a19991465fc19c5afa9bc3f304bae6044314e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164290/


  commit 6b1ca51b1a91d002636518afe4a8a50ba7212495
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 18 09:40:08 2021 +0200
  
      x86/PV: assert page state in mark_pv_pt_pages_rdonly()
      
      About every time I look at dom0_construct_pv()'s "calculation" of
      nr_pt_pages I question (myself) whether the result is precise or merely
      an upper bound. I think it is meant to be precise, but I think we would
      be better off having some checking in place. Hence add ASSERT()s to
      verify that
      - all pages have a valid L1...Ln (currently L4) page table type and
      - no other bits are set, in particular the type refcount is still zero.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-examine.reboot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-examine.reboot --summary-out=tmp/164290.bisection-summary --basis-template=164178 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-examine reboot
Searching for failure / basis pass:
 164248 fail [host=huxelrebe1] / 164237 [host=elbling1] 164230 [host=albana1] 164171 [host=elbling1] 164154 [host=pinot1] 164149 [host=chardonnay0] 164145 [host=fiano1] 164129 [host=albana0] 164123 [host=pinot0] 164119 [host=albana1] 164116 [host=fiano0] 164106 [host=elbling1] 164097 ok.
Failure / basis pass flights: 164248 / 164097
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54\
 ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928-517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
Loaded 5001 nodes in revision graph
Searching for test results:
 164094 [host=albana0]
 164097 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
 164106 [host=elbling1]
 164116 [host=fiano0]
 164119 [host=albana1]
 164123 [host=pinot0]
 164129 [host=albana0]
 164145 [host=fiano1]
 164149 [host=chardonnay0]
 164154 [host=pinot1]
 164171 [host=elbling1]
 164230 [host=albana1]
 164237 [host=elbling1]
 164248 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
 164280 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
 164281 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
 164282 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5c34b9af05b9e5abd25d88efc4fb783136547810
 164283 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6928bc511399fd8f593fe49a3241212860a6a1b5
 164284 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54c9736382e0d558a6acd820e44185e020131c48
 164285 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164286 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
 164287 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164288 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
 164289 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164290 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
Searching for interesting versions
 Result found: flight 164097 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e, results HASH(0x556daeba1e78) HASH(0x556daeb818d0) HASH(0x556daeba1ff8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9b\
 c4179dc64b15b2bb5f0c54ca4ddf823 54c9736382e0d558a6acd820e44185e020131c48, results HASH(0x556daeb9fe70) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6928bc511399fd8f593fe49a3241212860a6a1b5, results HASH(0x556daeb9ec48) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5c34b9af05b9e5abd25d88efc4fb783136547810, results HASH(0x556daeb9cc40) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928, results HASH(0x556daeb91cc8) HASH(0x556daeb8c130) Result found: flight 164248 (fail), \
 for basis failure (at ancestor ~677)
 Repro found: flight 164280 (pass), for basis pass
 Repro found: flight 164281 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
No revisions left to test, checking graph state.
 Result found: flight 164285 (pass), for last pass
 Result found: flight 164286 (fail), for first failure
 Repro found: flight 164287 (pass), for last pass
 Repro found: flight 164288 (fail), for first failure
 Repro found: flight 164289 (pass), for last pass
 Repro found: flight 164290 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6b1ca51b1a91d002636518afe4a8a50ba7212495
  Bug not present: 4c0a19991465fc19c5afa9bc3f304bae6044314e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164290/


  commit 6b1ca51b1a91d002636518afe4a8a50ba7212495
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 18 09:40:08 2021 +0200
  
      x86/PV: assert page state in mark_pv_pt_pages_rdonly()
      
      About every time I look at dom0_construct_pv()'s "calculation" of
      nr_pt_pages I question (myself) whether the result is precise or merely
      an upper bound. I think it is meant to be precise, but I think we would
      be better off having some checking in place. Hence add ASSERT()s to
      verify that
      - all pages have a valid L1...Ln (currently L4) page table type and
      - no other bits are set, in particular the type refcount is still zero.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-examine.reboot.{dot,ps,png,html,svg}.
----------------------------------------
164290: tolerable ALL FAIL

flight 164290 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164290/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-examine       8 reboot                  fail baseline untested


jobs:
 test-amd64-i386-examine                                      fail    


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


