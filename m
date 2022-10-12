Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54E5FC593
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 14:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421106.666287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oib6X-000698-Er; Wed, 12 Oct 2022 12:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421106.666287; Wed, 12 Oct 2022 12:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oib6X-00065s-BK; Wed, 12 Oct 2022 12:44:57 +0000
Received: by outflank-mailman (input) for mailman id 421106;
 Wed, 12 Oct 2022 12:44:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib6W-00065i-3D; Wed, 12 Oct 2022 12:44:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib6W-0005AB-1M; Wed, 12 Oct 2022 12:44:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib6V-0000kb-Lf; Wed, 12 Oct 2022 12:44:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oib6V-0008Vy-L9; Wed, 12 Oct 2022 12:44:55 +0000
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
	bh=NBHvEVjdczA/XXDWP7aNhiLfL9Xq4qybvHfXLQQGIF8=; b=aZj0n9FqZJ4hmcGMGUX+nIMjUs
	HDuh1pD8aoLFkxJTRDLltyWnv82DAIByHD8HvyZTxSUayoZkGoK/5VWh61TRTGE4ovbU3ZBUYc1SV
	Tbd1IJk6vIqwhvNimXz7GIKs9GWkSf0fw/oBYG+lFQDhltwpSske4I1Gi0sVl5d9vpqQ=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.13-testing bisection] complete build-arm64-xsm
Message-Id: <E1oib6V-0008Vy-L9@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 12:44:55 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e6b1e3892b685346490eded1f6b6f5392b1020b0
  Bug not present: 2ae9bbef0f84a025719382ffcf44882b76316d62
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173595/


  commit e6b1e3892b685346490eded1f6b6f5392b1020b0
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:52:02 2022 +0200
  
      xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm
      
      This commit implements the `XEN_DOMCTL_shadow_op` support in Xen
      for Arm. The p2m pages pool size for xl guests is supposed to be
      determined by `XEN_DOMCTL_shadow_op`. Hence, this commit:
      
      - Introduces a function `p2m_domctl` and implements the subops
      `XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION` and
      `XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION` of `XEN_DOMCTL_shadow_op`.
      
      - Adds the `XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION` support in libxl.
      
      Therefore enabling the setting of shadow memory pool size
      when creating a guest from xl and getting shadow memory pool size
      from Xen.
      
      Note that the `XEN_DOMCTL_shadow_op` added in this commit is only
      a dummy op, and the functionality of setting/getting p2m memory pool
      size for xl guests will be added in following commits.
      
      This is part of CVE-2022-33747 / XSA-409.
      
      Signed-off-by: Henry Wang <Henry.Wang@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      master commit: cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
      master date: 2022-10-11 14:28:42 +0200


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/build-arm64-xsm.xen-build --summary-out=tmp/173595.bisection-summary --basis-template=172549 --blessings=real,real-bisect,real-retry xen-4.13-testing build-arm64-xsm xen-build
Searching for failure / basis pass:
 173521 fail [host=rochester0] / 172549 [host=rochester1] 172113 ok.
Failure / basis pass flights: 173521 / 172113
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 042de0843936b690acbc6dbcf57d26f6adccfc06
Basis pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 d8a693019845caa4e216bcac10f9501a814c99ae
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-f80580f56b267c96f16f985dbf707b2f96947da4 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#d8a693019845caa4e216bcac10f9501a814c99ae-042de0843936b\
 690acbc6dbcf57d26f6adccfc06
Loaded 10001 nodes in revision graph
Searching for test results:
 172113 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 d8a693019845caa4e216bcac10f9501a814c99ae
 172549 [host=rochester1]
 173495 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 042de0843936b690acbc6dbcf57d26f6adccfc06
 173519 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 d8a693019845caa4e216bcac10f9501a814c99ae
 173527 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 042de0843936b690acbc6dbcf57d26f6adccfc06
 173529 pass d82ec90f51f61c914396271d86e64a74121dde24 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22
 173530 pass d97ee3244d806d324a22ea530215a9f10d2b23e2 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22
 173541 pass 710f83b79d6eab641401c054b2f40f6c630f8cd5 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22
 173548 pass 8db4e9f9a0c2ec992e28259ceb7a8eb316716b05 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22
 173552 pass f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 08eec20dc0550316dad64cdc63fee2371702f31f
 173556 pass f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 9992c089de1fbb4d3217d2421ca60295998645d7
 173558 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 e6b1e3892b685346490eded1f6b6f5392b1020b0
 173561 pass f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 2ae9bbef0f84a025719382ffcf44882b76316d62
 173565 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 e6b1e3892b685346490eded1f6b6f5392b1020b0
 173569 pass f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 2ae9bbef0f84a025719382ffcf44882b76316d62
 173578 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 e6b1e3892b685346490eded1f6b6f5392b1020b0
 173521 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 042de0843936b690acbc6dbcf57d26f6adccfc06
 173581 pass f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 2ae9bbef0f84a025719382ffcf44882b76316d62
 173595 fail f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 e6b1e3892b685346490eded1f6b6f5392b1020b0
Searching for interesting versions
 Result found: flight 172113 (pass), for basis pass
 For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 2ae9bbef0f84a025719382ffcf44882b76316d62, results HASH(0x55f9631c7400) HASH(0x55f9631cba38) HASH(0x55f9631d0670) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 9992c089de1fbb4d3217d2421ca60295998645d7, results \
 HASH(0x55f9631b5900) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 08eec20dc0550316dad64cdc63fee2371702f31f, results HASH(0x55f9631b9f38) For basis failure, parent search stopping at 8db4e9f9a0c2ec992e28259ceb7a8eb316716b05 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22, results HASH(0x55f9631b6a08) F\
 or basis failure, parent search stopping at 710f83b79d6eab641401c054b2f40f6c630f8cd5 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22, results HASH(0x55f9631aecc0) For basis failure, parent search stopping at d97ee3244d806d324a22ea530215a9f10d2b23e2 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22, results HASH(0x55f9631b00c8) For basis failure, pare\
 nt search stopping at d82ec90f51f61c914396271d86e64a74121dde24 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 bde3b13043e31fd757c44bcec182b0ff1fe36d22, results HASH(0x55f9631aa9b0) For basis failure, parent search stopping at 0dc9b78a46813d61533b2bb0f7ef897a06a273be 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 d8a693019845caa4e216bcac10f9501a814c99ae, results HASH(0x55f963198978) HASH(0x55f9631a64f8) Result found: flight 173\
 495 (fail), for basis failure (at ancestor ~321)
 Repro found: flight 173519 (pass), for basis pass
 Repro found: flight 173521 (fail), for basis failure
 0 revisions at f80580f56b267c96f16f985dbf707b2f96947da4 7269466a5b0c0e89b36dc9a7db0554ae404aa230 46de2eec93bffa0706e6229c0da2919763c8eb04 2ae9bbef0f84a025719382ffcf44882b76316d62
No revisions left to test, checking graph state.
 Result found: flight 173561 (pass), for last pass
 Result found: flight 173565 (fail), for first failure
 Repro found: flight 173569 (pass), for last pass
 Repro found: flight 173578 (fail), for first failure
 Repro found: flight 173581 (pass), for last pass
 Repro found: flight 173595 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e6b1e3892b685346490eded1f6b6f5392b1020b0
  Bug not present: 2ae9bbef0f84a025719382ffcf44882b76316d62
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173595/


  commit e6b1e3892b685346490eded1f6b6f5392b1020b0
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:52:02 2022 +0200
  
      xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm
      
      This commit implements the `XEN_DOMCTL_shadow_op` support in Xen
      for Arm. The p2m pages pool size for xl guests is supposed to be
      determined by `XEN_DOMCTL_shadow_op`. Hence, this commit:
      
      - Introduces a function `p2m_domctl` and implements the subops
      `XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION` and
      `XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION` of `XEN_DOMCTL_shadow_op`.
      
      - Adds the `XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION` support in libxl.
      
      Therefore enabling the setting of shadow memory pool size
      when creating a guest from xl and getting shadow memory pool size
      from Xen.
      
      Note that the `XEN_DOMCTL_shadow_op` added in this commit is only
      a dummy op, and the functionality of setting/getting p2m memory pool
      size for xl guests will be added in following commits.
      
      This is part of CVE-2022-33747 / XSA-409.
      
      Signed-off-by: Henry Wang <Henry.Wang@arm.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      master commit: cf2a68d2ffbc3ce95e01449d46180bddb10d24a0
      master date: 2022-10-11 14:28:42 +0200

pnmtopng: 160 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173595: tolerable ALL FAIL

flight 173595 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173595/

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


