Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841307265CB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 18:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544919.851028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vxA-00012b-Dr; Wed, 07 Jun 2023 16:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544919.851028; Wed, 07 Jun 2023 16:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vxA-00010Q-Ap; Wed, 07 Jun 2023 16:24:08 +0000
Received: by outflank-mailman (input) for mailman id 544919;
 Wed, 07 Jun 2023 16:24:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6vx8-00010F-Sh; Wed, 07 Jun 2023 16:24:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6vx8-0000ju-Hv; Wed, 07 Jun 2023 16:24:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6vx8-00010h-08; Wed, 07 Jun 2023 16:24:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6vx7-00040z-Vy; Wed, 07 Jun 2023 16:24:05 +0000
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
	bh=sJU+rH8aVFoHKmSzkWfNsV56DfqY/rvyauore6LzF0M=; b=XSGs9C+twwmtnXco6q0Ht6SG13
	/uuclFgpoFTkzFaKEKAh7DjoI7cq4k9zluGPrkqcZRlQzROrQKFFaZmoWZQeZdMhJ+XU/Xnnyj8ST
	1CYQZOBt4Gf1ZoWvADiyVo428jrUzNeZ9tzam0vDqk0jW0RIAPP39my2WYHkCeeNSyVA=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1q6vx7-00040z-Vy@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 16:24:05 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b46e8207d0aedad7bb23d14c055d95e625d366b0
  Bug not present: 56a7aaa16bfe43945a0031319c60c7f323c46254
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181258/


  commit b46e8207d0aedad7bb23d14c055d95e625d366b0
  Author: Luca Fancellu <luca.fancellu@arm.com>
  Date:   Wed May 31 08:24:11 2023 +0100
  
      xen/tools: add sve parameter in XL configuration
      
      Add sve parameter in XL configuration to allow guests to use
      SVE feature.
      
      Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/181258.bisection-summary --basis-template=181233 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 181248 fail [host=himrod2] / 181233 ok.
Failure / basis pass flights: 181248 / 181233
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 685048441e1cd935b622bba47d3ca612e75b4ef6
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 64a647f8d817c6989edc000613b5afae19f03f99
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#8c51cd970509b97d8378d175646ec32889828158-8c51cd970509b97d8378d175646ec32889828158 git://xenbits.xen.org/xen.git#64a647f8d817c6989edc000613b5afae19f03f99-685048441e1cd935b622bba47d3ca612e75b4ef6
Loaded 5001 nodes in revision graph
Searching for test results:
 181233 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 64a647f8d817c6989edc000613b5afae19f03f99
 181246 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 cb8b18d49ad804108ead8667179794b0ead66f2a
 181247 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 64a647f8d817c6989edc000613b5afae19f03f99
 181249 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 cb8b18d49ad804108ead8667179794b0ead66f2a
 181250 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f2095a51ac53d2da97f724d49ec3aedbb290080e
 181251 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
 181248 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 685048441e1cd935b622bba47d3ca612e75b4ef6
 181252 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 b46e8207d0aedad7bb23d14c055d95e625d366b0
 181253 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
 181255 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 b46e8207d0aedad7bb23d14c055d95e625d366b0
 181256 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
 181258 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 b46e8207d0aedad7bb23d14c055d95e625d366b0
Searching for interesting versions
 Result found: flight 181233 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254, results HASH(0x5578f6ae9c48) HASH(0x5578f6ae6838) HASH(0x5578f6ae4cb0) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f2095a51ac53d2da97f724d49ec3aedbb290080e, results HASH(0x5578f6ae6e38) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 64a647f8d817c6989edc000613b5afae19f03f99, results HASH(0x5578f6adcb48) HASH(0x5578f6ae1780) Result found: flight 181246 (fail), for basis failure (at ancestor ~1551)
 Repro found: flight 181247 (pass), for basis pass
 Repro found: flight 181248 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
No revisions left to test, checking graph state.
 Result found: flight 181251 (pass), for last pass
 Result found: flight 181252 (fail), for first failure
 Repro found: flight 181253 (pass), for last pass
 Repro found: flight 181255 (fail), for first failure
 Repro found: flight 181256 (pass), for last pass
 Repro found: flight 181258 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b46e8207d0aedad7bb23d14c055d95e625d366b0
  Bug not present: 56a7aaa16bfe43945a0031319c60c7f323c46254
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181258/


  commit b46e8207d0aedad7bb23d14c055d95e625d366b0
  Author: Luca Fancellu <luca.fancellu@arm.com>
  Date:   Wed May 31 08:24:11 2023 +0100
  
      xen/tools: add sve parameter in XL configuration
      
      Add sve parameter in XL configuration to allow guests to use
      SVE feature.
      
      Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
181258: tolerable ALL FAIL

flight 181258 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/181258/

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


