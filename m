Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE717941AA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 18:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596749.930767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdvfQ-0007Ki-6e; Wed, 06 Sep 2023 16:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596749.930767; Wed, 06 Sep 2023 16:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdvfQ-0007I1-3f; Wed, 06 Sep 2023 16:46:12 +0000
Received: by outflank-mailman (input) for mailman id 596749;
 Wed, 06 Sep 2023 16:46:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvfO-0007Hr-K2; Wed, 06 Sep 2023 16:46:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvfO-0003mt-IQ; Wed, 06 Sep 2023 16:46:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvfO-0003eT-1Z; Wed, 06 Sep 2023 16:46:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvfO-0006jE-19; Wed, 06 Sep 2023 16:46:10 +0000
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
	bh=cUdcZxSUxv9PZJgxcjvSe3ExxGw12WyBfbTRQH833Kg=; b=Xt+frmaiguKKZqtIPypstt+3Rp
	N8r9ypkNo4FH5EESZaSGJzLe+w7Ytb5WLIMBD6K+2rTi1TDMzOp0iRDWP2TN48xiAdTOMSCVlIuaJ
	C54zjlUaUaytURI9k+zxAWOooBdEviOlTqqpkDJ0NmM3C9XU03GnZvFdtjqiZSto5cjY=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1qdvfO-0006jE-19@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Sep 2023 16:46:10 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Bug not present: aa7354beb1238e68126815e060f7d5ccda48fcb8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182682/


  commit 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Author: Vikram Garhwal <vikram.garhwal@amd.com>
  Date:   Tue Sep 5 18:16:30 2023 -0700
  
      tools/xl: Add new xl command overlay for device tree overlay support
      
      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/182682.bisection-summary --basis-template=182635 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 182661 fail [host=himrod0] / 182635 [host=godello0] 182631 [host=himrod2] 182596 [host=himrod2] 182577 [host=himrod2] 182565 ok.
Failure / basis pass flights: 182661 / 182565
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e5522c71beaa83f2f5d2118724ace9f90c22e583
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#e5522c71beaa83f2f5d2118724ace9f90c22e583-61765a07e3d8a4dabbb8323b55f13ee75c80e54a
Loaded 5001 nodes in revision graph
Searching for test results:
 182565 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182577 [host=himrod2]
 182596 [host=himrod2]
 182631 [host=himrod2]
 182635 [host=godello0]
 182641 [host=himrod2]
 182644 [host=himrod2]
 182645 [host=himrod2]
 182647 [host=himrod2]
 182648 [host=himrod2]
 182649 [host=himrod2]
 182651 [host=himrod2]
 182652 [host=himrod2]
 182653 [host=himrod2]
 182655 [host=himrod2]
 182646 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182656 [host=himrod2]
 182657 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182659 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182662 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 427b6a571cd275015c201abd5b6a7843452d95a0
 182663 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3b27fff436394762b9bc71fbddf075d276fcceb5
 182666 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7e5c4a8b86f12942de0566b1d61f71d15774364b
 182668 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f61243530e2a1e10f9414653d37d99df61fd88ad
 182670 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182661 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182672 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182676 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182678 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182680 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182682 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
Searching for interesting versions
 Result found: flight 182565 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa7354beb1238e68126815e060f7d5ccda48fcb8, results HASH(0x55e77971b6f0) HASH(0x55e7797221b0) HASH(0x55e779781658) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f61243530e2a1e10f9414653d37d99df61fd88ad, results HASH(0x55e7796fd478) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7e5c4a8b86f12942de0566b1d61f71d15774364b, results HASH(0x55e7797184c0) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3b27fff436394762b9bc71fbddf075d276fcceb5, results HASH(0x55e7797164b8) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 427b6a571cd275015c201abd5b6a7843452d95\
 a0, results HASH(0x55e779712000) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e5522c71beaa83f2f5d2118724ace9f90c22e583, results HASH(0x55e7797090b8) HASH(0x55e7797124a8) Result found: flight 182646 (fail), for basis failure (at ancestor ~2059)
 Repro found: flight 182657 (pass), for basis pass
 Repro found: flight 182659 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 aa7354beb1238e68126815e060f7d5ccda48fcb8
No revisions left to test, checking graph state.
 Result found: flight 182670 (pass), for last pass
 Result found: flight 182672 (fail), for first failure
 Repro found: flight 182676 (pass), for last pass
 Repro found: flight 182678 (fail), for first failure
 Repro found: flight 182680 (pass), for last pass
 Repro found: flight 182682 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Bug not present: aa7354beb1238e68126815e060f7d5ccda48fcb8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182682/


  commit 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Author: Vikram Garhwal <vikram.garhwal@amd.com>
  Date:   Tue Sep 5 18:16:30 2023 -0700
  
      tools/xl: Add new xl command overlay for device tree overlay support
      
      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182682: tolerable ALL FAIL

flight 182682 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182682/

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


