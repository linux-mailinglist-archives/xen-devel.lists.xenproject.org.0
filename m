Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E37DA8E0
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 21:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624799.973480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwoqt-00006e-4b; Sat, 28 Oct 2023 19:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624799.973480; Sat, 28 Oct 2023 19:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwoqt-0008U9-0z; Sat, 28 Oct 2023 19:20:07 +0000
Received: by outflank-mailman (input) for mailman id 624799;
 Sat, 28 Oct 2023 19:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwoqr-0008QI-DH; Sat, 28 Oct 2023 19:20:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwoqr-0008ML-7M; Sat, 28 Oct 2023 19:20:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwoqq-0008J7-QR; Sat, 28 Oct 2023 19:20:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwoqq-0008Lx-Q3; Sat, 28 Oct 2023 19:20:04 +0000
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
	bh=ydh94nZR7q5HSjRmjW0nobUsb5LEmGxEdatP48E++Sk=; b=tta8o3NYeAlVQrsJkEd4ulKtPa
	rKUAFX3Ytjm0d5ftU4N/NE39NFbJEOTdfBxefawM/aTmGl+aNp/jLNPbVW/Sa+t27KVju584thzbA
	ett43EFbN4MqbkRedFYImXe6WsM3ljOHcLWiMNLfLm51lcIq9Oe8hA//PFJQjz+0ihcM=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.18-testing bisection] complete build-amd64-xsm
Message-Id: <E1qwoqq-0008Lx-Q3@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Oct 2023 19:20:04 +0000

branch xen-4.18-testing
xenbranch xen-4.18-testing
job build-amd64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Bug not present: 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183581/


  commit f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Author: Julien Grall <julien@xen.org>
  Date:   Fri Oct 27 14:07:09 2023 +0100
  
      Config.mk: switch to named tags (for stable branch)
      
      Signed-off-by: Julien Grall <julien@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.18-testing/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.18-testing/build-amd64-xsm.xen-build --summary-out=tmp/183581.bisection-summary --basis-template=183555 --blessings=real,real-bisect,real-retry xen-4.18-testing build-amd64-xsm xen-build
Searching for failure / basis pass:
 183564 fail [host=nobling1] / 183555 [host=godello0] template as basis? using template as basis.
Failure / basis pass flights: 183564 / 183555
(tree in basispass but not in latest: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
Basis pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad-7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#1e1da7a963007d03a4e0e9a9e0ff17990bb16\
 08d-1e1da7a963007d03a4e0e9a9e0ff17990bb1608d git://xenbits.xen.org/xen.git#5415b2b2118bd78d8a04f276a8312f7f0cb1a466-b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
Loaded 5001 nodes in revision graph
Searching for test results:
 183573 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183555 [host=godello0]
 183564 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183574 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183575 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183576 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183577 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
 183578 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183579 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
 183580 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183581 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
Searching for interesting versions
 Result found: flight 183573 (pass), for basis pass
 For basis failure, parent search stopping at 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466, results HASH(0x5561873387f0) HASH(0x556187342540) HASH(0x5561873475f8) HASH(0x55618734b188) Result found: flight 183574 (fail), for basis failure (at ancestor ~2236)
 Repro found: flight 183575 (pass), for basis pass
 Repro found: flight 183576 (fail), for basis failure
 0 revisions at 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
No revisions left to test, checking graph state.
 Result found: flight 183573 (pass), for last pass
 Result found: flight 183577 (fail), for first failure
 Repro found: flight 183578 (pass), for last pass
 Repro found: flight 183579 (fail), for first failure
 Repro found: flight 183580 (pass), for last pass
 Repro found: flight 183581 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Bug not present: 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183581/


  commit f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Author: Julien Grall <julien@xen.org>
  Date:   Fri Oct 27 14:07:09 2023 +0100
  
      Config.mk: switch to named tags (for stable branch)
      
      Signed-off-by: Julien Grall <julien@xen.org>

Revision graph left in /home/logs/results/bisect/xen-4.18-testing/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
183581: tolerable ALL FAIL

flight 183581 xen-4.18-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/183581/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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


