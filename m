Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D05FC469
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 13:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421039.666228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oia8i-0006LV-Sf; Wed, 12 Oct 2022 11:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421039.666228; Wed, 12 Oct 2022 11:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oia8i-0006Ki-PY; Wed, 12 Oct 2022 11:43:08 +0000
Received: by outflank-mailman (input) for mailman id 421039;
 Wed, 12 Oct 2022 11:43:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oia8h-0006KY-LU; Wed, 12 Oct 2022 11:43:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oia8h-00046M-7m; Wed, 12 Oct 2022 11:43:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oia8g-0006AJ-Ud; Wed, 12 Oct 2022 11:43:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oia8g-0007QD-UA; Wed, 12 Oct 2022 11:43:06 +0000
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
	bh=xlfFSOOl2JILQXofqAHur/BhWZu+CAxmOM/ayhxgBLY=; b=sEtosU1AE0fdaWRCQ39OEIg+Z5
	KsXvwmT955U1bc63693wHMldNoBLXHDbI7jxW8Rde86xIS9n3Tn4k62H4/xkovoBVJXYBex46e6pV
	/uGv2JMIxhtmIT03QHRT1EIwjJiyz0bEAkCsK1NTC/uumiLGrEC903tDyqa3QlZPI8hA=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete build-arm64-xsm
Message-Id: <E1oia8g-0007QD-UA@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 11:43:06 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c5215044578e88b401a1296ed6302df05c113c5f
  Bug not present: 45336d8f88725aec65ee177b1b09abf6eef1dc8d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173592/


  commit c5215044578e88b401a1296ed6302df05c113c5f
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:10:16 2022 +0200
  
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/build-arm64-xsm.xen-build --summary-out=tmp/173592.bisection-summary --basis-template=172547 --blessings=real,real-bisect,real-retry xen-4.15-testing build-arm64-xsm xen-build
Searching for failure / basis pass:
 173522 fail [host=rochester0] / 172547 [host=laxton1] 172109 ok.
Failure / basis pass flights: 173522 / 172109
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
Basis pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 df3395f6b2d759aba39fb67a7bc0fe49147c8b39
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-f80580f56b267c96f16f985dbf707b2f96947da4 git://xenbits.xen.org/qemu-xen.git#6503bd6a1b5364ffd346a8a475e1eb91b9f756e5-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#df3395f6b2d759aba39fb67a7bc0fe49147c8b39-9690bb261d5fa\
 09cb281e1fa124d93db7b84fda5
Loaded 10001 nodes in revision graph
Searching for test results:
 172109 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 df3395f6b2d759aba39fb67a7bc0fe49147c8b39
 172547 [host=laxton1]
 173494 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173498 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173522 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173544 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 df3395f6b2d759aba39fb67a7bc0fe49147c8b39
 173549 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173550 pass 917a7e3f347adb0721ff161a68309f51f621eec5 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173554 pass d63242bd69a0e3eaa39afd644b634f60f384b278 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173557 pass 406ad0582a3df7af498ec4f0adee1a95ceeae64f 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173563 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7f055b011a657f8f16b0df242301efb312058eea
 173567 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 d65ebacb78901b695bc5e8a075ad1ad865a78928
 173568 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173571 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7ad38a39f08aadc1578bdb46ccabaad79ed0faee
 173575 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
 173577 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173580 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
 173586 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173592 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
Searching for interesting versions
 Result found: flight 172109 (pass), for basis pass
 For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d, results HASH(0x55c490ded278) HASH(0x55c490df2e10) HASH(0x55c490de8640) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7f055b011a657f8f16b0df242301efb312058eea, results \
 HASH(0x55c490de3408) For basis failure, parent search stopping at 406ad0582a3df7af498ec4f0adee1a95ceeae64f 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x55c490ddea08) For basis failure, parent search stopping at d63242bd69a0e3eaa39afd644b634f60f384b278 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x55c490dd7dc8) F\
 or basis failure, parent search stopping at 917a7e3f347adb0721ff161a68309f51f621eec5 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x55c490dd3a90) For basis failure, parent search stopping at 0dc9b78a46813d61533b2bb0f7ef897a06a273be 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 df3395f6b2d759aba39fb67a7bc0fe49147c8b39, results HASH(0x55c490dbc1c0) HASH(0x55c490dcb748) Re\
 sult found: flight 173494 (fail), for basis failure (at ancestor ~749)
 Repro found: flight 173544 (pass), for basis pass
 Repro found: flight 173549 (fail), for basis failure
 0 revisions at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
No revisions left to test, checking graph state.
 Result found: flight 173568 (pass), for last pass
 Result found: flight 173575 (fail), for first failure
 Repro found: flight 173577 (pass), for last pass
 Repro found: flight 173580 (fail), for first failure
 Repro found: flight 173586 (pass), for last pass
 Repro found: flight 173592 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c5215044578e88b401a1296ed6302df05c113c5f
  Bug not present: 45336d8f88725aec65ee177b1b09abf6eef1dc8d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173592/


  commit c5215044578e88b401a1296ed6302df05c113c5f
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:10:16 2022 +0200
  
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

pnmtopng: 139 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173592: tolerable ALL FAIL

flight 173592 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173592/

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


