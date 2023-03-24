Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BAC6C8851
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 23:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514479.796770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfptH-000065-3f; Fri, 24 Mar 2023 22:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514479.796770; Fri, 24 Mar 2023 22:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfptH-0008Vu-01; Fri, 24 Mar 2023 22:28:07 +0000
Received: by outflank-mailman (input) for mailman id 514479;
 Fri, 24 Mar 2023 22:28:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfptG-0008Vk-Bc; Fri, 24 Mar 2023 22:28:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfptG-00070x-73; Fri, 24 Mar 2023 22:28:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfptF-0006Ra-UR; Fri, 24 Mar 2023 22:28:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pfptF-0004HF-Tz; Fri, 24 Mar 2023 22:28:05 +0000
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
	bh=fhpWf/3AUM9bIdjs+f36Jbo3UPDCjxHvm4JLEV6nSSw=; b=b1jTlUGE3OCTJ5dWwkR1SnhyxS
	x01c4uMPmNy1fBFggUekYGAgMRx9Q1/Cocf1K44gUvR3ecam7azuC+e3zT7sVHsvHx6/qPpjwgkfy
	6klraeeAZx7sQJtsxy8lAaGXyhRopM0aT41hWz9t3daJfULu2mDJaQXj5+99+40mj2ek=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1pfptF-0004HF-Tz@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Mar 2023 22:28:05 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e1d75084443f676be681fdaf47585cc9a5f5b820
  Bug not present: eb23eef476bf44f933fcff42e55119473a1d6e19
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179945/


  commit e1d75084443f676be681fdaf47585cc9a5f5b820
  Author: Demi Marie Obenour <demi@invisiblethingslab.com>
  Date:   Tue Mar 21 13:33:36 2023 -0400
  
      build: Change remaining xenbits.xen.org link to HTTPS
      
      Obtaining code over an insecure transport is a terrible idea for
      blatently obvious reasons.  Even for non-executable data, insecure
      transports are considered deprecated.
      
      This patch enforces the use of secure transports for all xenbits.xen.org
      URLs.  All altered links have been tested and are known to work.
      
      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/179945.bisection-summary --basis-template=179926 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 179931 fail [host=himrod2] / 179926 ok.
Failure / basis pass flights: 179931 / 179926
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 715b92ba30f792e326bdd37b5a4969da9c5d4a6c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#625eb5e96dc96aa7fddef59a08edae215527f19c-625eb5e96dc96aa7fddef59a08edae215527f19c git://xenbits.xen.org/xen.git#715b92ba30f792e326bdd37b5a4969da9c5d4a6c-054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
Loaded 5001 nodes in revision graph
Searching for test results:
 179926 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 715b92ba30f792e326bdd37b5a4969da9c5d4a6c
 179929 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
 179932 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 715b92ba30f792e326bdd37b5a4969da9c5d4a6c
 179934 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
 179935 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 79493f2b33eeeccc78db25435181a03f5c46b3e6
 179936 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c e1d75084443f676be681fdaf47585cc9a5f5b820
 179931 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
 179937 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c eb23eef476bf44f933fcff42e55119473a1d6e19
 179939 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c e1d75084443f676be681fdaf47585cc9a5f5b820
 179941 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c eb23eef476bf44f933fcff42e55119473a1d6e19
 179942 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c e1d75084443f676be681fdaf47585cc9a5f5b820
 179944 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c eb23eef476bf44f933fcff42e55119473a1d6e19
 179945 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c e1d75084443f676be681fdaf47585cc9a5f5b820
Searching for interesting versions
 Result found: flight 179926 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c eb23eef476bf44f933fcff42e55119473a1d6e19, results HASH(0x55d01057b648) HASH(0x55d00f2f2d70) HASH(0x55d0105888c8) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 79493f2b33eeeccc78db25435181a03f5c46b3e6, results HASH(0x55d010082898) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 715b92ba30f792e326bdd37b5a4969da9c5d4a6c, results HASH(0x55d01056e848) HASH(0x55d010577c38) Result found: flight 179929 (fail), for basis failure (at ancestor ~1253)
 Repro found: flight 179932 (pass), for basis pass
 Repro found: flight 179934 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c eb23eef476bf44f933fcff42e55119473a1d6e19
No revisions left to test, checking graph state.
 Result found: flight 179937 (pass), for last pass
 Result found: flight 179939 (fail), for first failure
 Repro found: flight 179941 (pass), for last pass
 Repro found: flight 179942 (fail), for first failure
 Repro found: flight 179944 (pass), for last pass
 Repro found: flight 179945 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e1d75084443f676be681fdaf47585cc9a5f5b820
  Bug not present: eb23eef476bf44f933fcff42e55119473a1d6e19
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179945/


  commit e1d75084443f676be681fdaf47585cc9a5f5b820
  Author: Demi Marie Obenour <demi@invisiblethingslab.com>
  Date:   Tue Mar 21 13:33:36 2023 -0400
  
      build: Change remaining xenbits.xen.org link to HTTPS
      
      Obtaining code over an insecure transport is a terrible idea for
      blatently obvious reasons.  Even for non-executable data, insecure
      transports are considered deprecated.
      
      This patch enforces the use of secure transports for all xenbits.xen.org
      URLs.  All altered links have been tested and are known to work.
      
      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
179945: tolerable ALL FAIL

flight 179945 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/179945/

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


