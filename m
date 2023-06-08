Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4CC727871
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 09:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545148.851419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q79pT-0000Zv-FD; Thu, 08 Jun 2023 07:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545148.851419; Thu, 08 Jun 2023 07:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q79pT-0000Xc-BY; Thu, 08 Jun 2023 07:13:07 +0000
Received: by outflank-mailman (input) for mailman id 545148;
 Thu, 08 Jun 2023 07:13:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q79pR-0000XS-Nl; Thu, 08 Jun 2023 07:13:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q79pR-00040z-GY; Thu, 08 Jun 2023 07:13:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q79pR-0008Cd-5l; Thu, 08 Jun 2023 07:13:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q79pR-0000vl-5I; Thu, 08 Jun 2023 07:13:05 +0000
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
	bh=dlBe7+VKw1FtTVMteHPNu7C0ibMLk2jLW0dVPriQdKc=; b=d6U4yFcLy+/vh3MSyorFQtUYXh
	LiZUWnoM5/vXQmyOohEh42xYnjWE5JhZX7X3LCmDQf4GS89/yLvonYi6sMb5FyJaRFdaa7WT3tLHF
	xgUHWSqIixyOeQecyBqAdMVn4B1JoXMPTKFSs1lcVLg1V/mP3IGiXaRfFqCFIW1FqEcs=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1q79pR-0000vl-5I@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jun 2023 07:13:05 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  56a7aaa16bfe43945a0031319c60c7f323c46254
  Bug not present: 9392bf6a3a44978373f2c54a4c69d739f437b3bc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181294/


  commit 56a7aaa16bfe43945a0031319c60c7f323c46254
  Author: Luca Fancellu <luca.fancellu@arm.com>
  Date:   Wed May 31 08:24:10 2023 +0100
  
      tools: add physinfo arch_capabilities handling for Arm
      
      On Arm, the SVE vector length is encoded in arch_capabilities field
      of struct xen_sysctl_physinfo, make use of this field in the tools
      when building for arm.
      
      Create header arm-arch-capabilities.h to handle the arch_capabilities
      field of physinfo for Arm.
      
      Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Acked-by: Christian Lindig <christian.lindig@cloud.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/181294.bisection-summary --basis-template=181233 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 181292 fail [host=rochester1] / 181233 [host=rochester0] 181195 ok.
Failure / basis pass flights: 181292 / 181195
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
Basis pass 8c51cd970509b97d8378d175646ec32889828158 b35b22acb887f682efe8385b3df165220bc84c86
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#8c51cd970509b97d8378d175646ec32889828158-8c51cd970509b97d8378d175646ec32889828158 git://xenbits.xen.org/xen.git#b35b22acb887f682efe8385b3df165220bc84c86-0c2d0d32b341eb79bb095fd3f35b9a2672333d64
Loaded 5001 nodes in revision graph
Searching for test results:
 181195 pass 8c51cd970509b97d8378d175646ec32889828158 b35b22acb887f682efe8385b3df165220bc84c86
 181233 [host=rochester0]
 181246 fail 8c51cd970509b97d8378d175646ec32889828158 cb8b18d49ad804108ead8667179794b0ead66f2a
 181248 fail 8c51cd970509b97d8378d175646ec32889828158 685048441e1cd935b622bba47d3ca612e75b4ef6
 181254 [host=rochester0]
 181260 pass 8c51cd970509b97d8378d175646ec32889828158 b35b22acb887f682efe8385b3df165220bc84c86
 181265 [host=rochester0]
 181269 [host=rochester0]
 181266 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181270 [host=rochester0]
 181274 pass 8c51cd970509b97d8378d175646ec32889828158 3c6e7262410fe95f96aae32765531de41a6f392f
 181273 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181275 pass 8c51cd970509b97d8378d175646ec32889828158 9392bf6a3a44978373f2c54a4c69d739f437b3bc
 181277 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181278 fail 8c51cd970509b97d8378d175646ec32889828158 b46e8207d0aedad7bb23d14c055d95e625d366b0
 181280 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181282 fail 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
 181286 pass 8c51cd970509b97d8378d175646ec32889828158 9392bf6a3a44978373f2c54a4c69d739f437b3bc
 181285 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181289 fail 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
 181291 pass 8c51cd970509b97d8378d175646ec32889828158 9392bf6a3a44978373f2c54a4c69d739f437b3bc
 181292 fail 8c51cd970509b97d8378d175646ec32889828158 0c2d0d32b341eb79bb095fd3f35b9a2672333d64
 181294 fail 8c51cd970509b97d8378d175646ec32889828158 56a7aaa16bfe43945a0031319c60c7f323c46254
Searching for interesting versions
 Result found: flight 181195 (pass), for basis pass
 For basis failure, parent search stopping at 8c51cd970509b97d8378d175646ec32889828158 9392bf6a3a44978373f2c54a4c69d739f437b3bc, results HASH(0x564c8a0a8208) HASH(0x564c8a119640) HASH(0x564c8a139018) For basis failure, parent search stopping at 8c51cd970509b97d8378d175646ec32889828158 3c6e7262410fe95f96aae32765531de41a6f392f, results HASH(0x564c8a0932f8) For basis failure, parent search stopping at 8c51cd970509b97d8378d175646ec32889828158 b35b22acb887f682efe8385b3df165220bc84c86, results HASH(0x\
 564c8a099100) HASH(0x564c8a0a8508) Result found: flight 181246 (fail), for basis failure (at ancestor ~1552)
 Repro found: flight 181260 (pass), for basis pass
 Repro found: flight 181266 (fail), for basis failure
 0 revisions at 8c51cd970509b97d8378d175646ec32889828158 9392bf6a3a44978373f2c54a4c69d739f437b3bc
No revisions left to test, checking graph state.
 Result found: flight 181275 (pass), for last pass
 Result found: flight 181282 (fail), for first failure
 Repro found: flight 181286 (pass), for last pass
 Repro found: flight 181289 (fail), for first failure
 Repro found: flight 181291 (pass), for last pass
 Repro found: flight 181294 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  56a7aaa16bfe43945a0031319c60c7f323c46254
  Bug not present: 9392bf6a3a44978373f2c54a4c69d739f437b3bc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181294/


  commit 56a7aaa16bfe43945a0031319c60c7f323c46254
  Author: Luca Fancellu <luca.fancellu@arm.com>
  Date:   Wed May 31 08:24:10 2023 +0100
  
      tools: add physinfo arch_capabilities handling for Arm
      
      On Arm, the SVE vector length is encoded in arch_capabilities field
      of struct xen_sysctl_physinfo, make use of this field in the tools
      when building for arm.
      
      Create header arm-arch-capabilities.h to handle the arch_capabilities
      field of physinfo for Arm.
      
      Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Acked-by: Christian Lindig <christian.lindig@cloud.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
181294: tolerable ALL FAIL

flight 181294 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/181294/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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


