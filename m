Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCC92826B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 09:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754141.1162473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPcuD-0001D7-9F; Fri, 05 Jul 2024 06:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754141.1162473; Fri, 05 Jul 2024 06:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPcuD-0001Bg-6N; Fri, 05 Jul 2024 06:58:53 +0000
Received: by outflank-mailman (input) for mailman id 754141;
 Fri, 05 Jul 2024 06:58:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPcuC-0001BW-Bx; Fri, 05 Jul 2024 06:58:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPcuC-0001Xs-71; Fri, 05 Jul 2024 06:58:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPcuB-0006hz-UK; Fri, 05 Jul 2024 06:58:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPcuB-0003pv-Tv; Fri, 05 Jul 2024 06:58:51 +0000
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
	bh=2BagZuWdsnkwhwJ+BbLDvM0+coLFgUwKaX6QyiX+aR4=; b=XDaGRWUCsERRH6CVhUbcqMiquR
	7N+yD40utj/3ZOXGk+mR/Q//J8NAKhpeu6/pcMyOEOY0+h6y2CTZbUrq/+dYDYjRl4w/JLw/UFH7S
	vuV2eya6X6zg8bnzWI9sLB2HK0JlMRZCb3qaxMI52s9K0WFpXiQcB/UaKL1WIq6JCySY=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.18-testing bisection] complete build-arm64
Message-Id: <E1sPcuB-0003pv-Tv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 06:58:51 +0000

branch xen-4.18-testing
xenbranch xen-4.18-testing
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c9f50d2c5f29b630603e2b95f29e5b6e416a6187
  Bug not present: 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/186689/


  commit c9f50d2c5f29b630603e2b95f29e5b6e416a6187
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Thu Jul 4 14:11:57 2024 +0200
  
      pirq_cleanup_check() leaks
      
      Its original introduction had two issues: For one the "common" part of
      the checks (carried out in the macro) was inverted. And then after
      removal from the radix tree the structure wasn't scheduled for freeing.
      (All structures still left in the radix tree would be freed upon domain
      destruction, though.)
      
      For the freeing to be safe even if it didn't use RCU (i.e. to avoid use-
      after-free), re-arrange checks/operations in evtchn_close(), such that
      the pointer wouldn't be used anymore after calling pirq_cleanup_check()
      (noting that unmap_domain_pirq_emuirq() itself calls the function in the
      success case).
      
      Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
      Fixes: 79858fee307c ("xen: fix hvm_domain_use_pirq's behavior")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      master commit: daa90dfea9175c07f13d1a2d901857b2dd14d080
      master date: 2024-07-02 08:35:56 +0200


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.18-testing/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.18-testing/build-arm64.xen-build --summary-out=tmp/186689.bisection-summary --basis-template=186514 --blessings=real,real-bisect,real-retry xen-4.18-testing build-arm64 xen-build
Searching for failure / basis pass:
 186655 fail [host=rochester1] / 186514 ok.
Failure / basis pass flights: 186655 / 186514
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 7e636b8a16412d4f0d94b2b24d7ebcd2c749afff
Basis pass dc002d4f2d76bdd826359a3dd608d9bc621fcb47 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#dc002d4f2d76bdd826359a3dd608d9bc621fcb47-592725d2291b9844cfd9187111e904c6383e2000 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#e5f2e4c69643bc3cd385306a9e5d29e11578148c-e5f2e4c69643bc3cd385306a9e5d29e11578148c git://xenbits.xen.org/xen.git#e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10-7e636b8a16412\
 d4f0d94b2b24d7ebcd2c749afff
Loaded 10001 nodes in revision graph
Searching for test results:
 186514 pass dc002d4f2d76bdd826359a3dd608d9bc621fcb47 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10
 186655 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 7e636b8a16412d4f0d94b2b24d7ebcd2c749afff
 186663 pass dc002d4f2d76bdd826359a3dd608d9bc621fcb47 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10
 186668 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 7e636b8a16412d4f0d94b2b24d7ebcd2c749afff
 186672 pass ff1c4fa1680d3f9a5f2be3e0048d2de15a5846fb 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10
 186673 pass 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 77cf215157d267a7776f3c4ec32e89064dcd84cd
 186675 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 8e51c8f1d45fad242a315fa17ba3582c02e66840
 186676 pass 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 0dc5fbee17cd2bcb1aa6a1cf420dd80381587de8
 186677 pass 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
 186679 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c c9f50d2c5f29b630603e2b95f29e5b6e416a6187
 186681 pass 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
 186686 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c c9f50d2c5f29b630603e2b95f29e5b6e416a6187
 186687 pass 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
 186689 fail 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c c9f50d2c5f29b630603e2b95f29e5b6e416a6187
Searching for interesting versions
 Result found: flight 186514 (pass), for basis pass
 For basis failure, parent search stopping at 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87, results HASH(0x557dfbd64f70) HASH(0x557dfbd6beb0) HASH(0x557dfbd6fa40) For basis failure, parent search stopping at 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 0dc5fbee17cd2bcb1aa6a1cf420dd80381587de8, results \
 HASH(0x557dfbd64df0) For basis failure, parent search stopping at 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 77cf215157d267a7776f3c4ec32e89064dcd84cd, results HASH(0x557dfbd5fd38) For basis failure, parent search stopping at ff1c4fa1680d3f9a5f2be3e0048d2de15a5846fb 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10, results HASH(0x557dfbd5cc28) F\
 or basis failure, parent search stopping at dc002d4f2d76bdd826359a3dd608d9bc621fcb47 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c e95d30f9e5eed0c5d9dbf72d4cc3ae373152ab10, results HASH(0x557dfbd556e8) HASH(0x557dfbd5c7a8) Result found: flight 186655 (fail), for basis failure (at ancestor ~2458)
 Repro found: flight 186663 (pass), for basis pass
 Repro found: flight 186668 (fail), for basis failure
 0 revisions at 592725d2291b9844cfd9187111e904c6383e2000 0df9387c8983e1b1e72d8c574356f572342c03e6 e5f2e4c69643bc3cd385306a9e5d29e11578148c 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
No revisions left to test, checking graph state.
 Result found: flight 186677 (pass), for last pass
 Result found: flight 186679 (fail), for first failure
 Repro found: flight 186681 (pass), for last pass
 Repro found: flight 186686 (fail), for first failure
 Repro found: flight 186687 (pass), for last pass
 Repro found: flight 186689 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c9f50d2c5f29b630603e2b95f29e5b6e416a6187
  Bug not present: 2b3bf02c4f5e44d7d7bd3636530c9ebc837dea87
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/186689/


  commit c9f50d2c5f29b630603e2b95f29e5b6e416a6187
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Thu Jul 4 14:11:57 2024 +0200
  
      pirq_cleanup_check() leaks
      
      Its original introduction had two issues: For one the "common" part of
      the checks (carried out in the macro) was inverted. And then after
      removal from the radix tree the structure wasn't scheduled for freeing.
      (All structures still left in the radix tree would be freed upon domain
      destruction, though.)
      
      For the freeing to be safe even if it didn't use RCU (i.e. to avoid use-
      after-free), re-arrange checks/operations in evtchn_close(), such that
      the pointer wouldn't be used anymore after calling pirq_cleanup_check()
      (noting that unmap_domain_pirq_emuirq() itself calls the function in the
      success case).
      
      Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
      Fixes: 79858fee307c ("xen: fix hvm_domain_use_pirq's behavior")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      master commit: daa90dfea9175c07f13d1a2d901857b2dd14d080
      master date: 2024-07-02 08:35:56 +0200

Revision graph left in /home/logs/results/bisect/xen-4.18-testing/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
186689: tolerable ALL FAIL

flight 186689 xen-4.18-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/186689/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64                   6 xen-build               fail baseline untested


jobs:
 build-arm64                                                  fail    


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


