Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8215FC58F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 14:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421096.666272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oib4E-0005YF-06; Wed, 12 Oct 2022 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421096.666272; Wed, 12 Oct 2022 12:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oib4D-0005W2-Th; Wed, 12 Oct 2022 12:42:33 +0000
Received: by outflank-mailman (input) for mailman id 421096;
 Wed, 12 Oct 2022 12:42:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib4C-0005Vs-Bj; Wed, 12 Oct 2022 12:42:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib4C-00058Y-9E; Wed, 12 Oct 2022 12:42:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oib4B-0000cj-UK; Wed, 12 Oct 2022 12:42:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oib4B-0006f4-Tp; Wed, 12 Oct 2022 12:42:31 +0000
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
	bh=RgCDb237SiAEX5WxeJGQ46L4emwy2y2ZtjURvsevlmo=; b=ZxVJkTjtOO8r9dDFzqFSQxPwnA
	EMh7ixfNn0eCo/xsf1csM24NOAgcj5avs2/1kTIB/jahYbnliMfA/Zbt0c0bXYYuHY+ZbZQ1S2Z1y
	08QfaSDSZqCvJ43cqqMRdypgmsNXTR5JDyB96Yns+LuemuROIeci3/YqE74sbFZ3imA0=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.14-testing bisection] complete build-arm64-xsm
Message-Id: <E1oib4B-0006f4-Tp@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 12:42:31 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4220eac3799f46ba84316513606a33e1ea33fb4e
  Bug not present: fd688b06a57a327dc5dbda106a104a2af5e1aa2b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173596/


  commit 4220eac3799f46ba84316513606a33e1ea33fb4e
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:42:00 2022 +0200
  
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/build-arm64-xsm.xen-build --summary-out=tmp/173596.bisection-summary --basis-template=172550 --blessings=real,real-bisect,real-retry xen-4.14-testing build-arm64-xsm xen-build
Searching for failure / basis pass:
 173517 fail [host=rochester0] / 172550 [host=rochester1] 172114 ok.
Failure / basis pass flights: 173517 / 172114
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 6e5608d1c50e0f91ed3226489d9591c70fa37c30
Basis pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 261b882f7704515a01f74589f57f0c1303e3b701
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-f80580f56b267c96f16f985dbf707b2f96947da4 git://xenbits.xen.org/qemu-xen.git#83aebe33dc76760f911162f9e7a4b98a4929776b-83aebe33dc76760f911162f9e7a4b98a4929776b git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#261b882f7704515a01f74589f57f0c1303e3b701-6e5608d1c50e0\
 f91ed3226489d9591c70fa37c30
Loaded 10001 nodes in revision graph
Searching for test results:
 172114 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 261b882f7704515a01f74589f57f0c1303e3b701
 172550 [host=rochester1]
 173496 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 6e5608d1c50e0f91ed3226489d9591c70fa37c30
 173535 pass 0dc9b78a46813d61533b2bb0f7ef897a06a273be 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 261b882f7704515a01f74589f57f0c1303e3b701
 173540 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 6e5608d1c50e0f91ed3226489d9591c70fa37c30
 173547 pass d82ec90f51f61c914396271d86e64a74121dde24 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d
 173551 pass d97ee3244d806d324a22ea530215a9f10d2b23e2 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d
 173555 pass 710f83b79d6eab641401c054b2f40f6c630f8cd5 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d
 173559 pass 8db4e9f9a0c2ec992e28259ceb7a8eb316716b05 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d
 173562 pass f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 9b5a7fd916a74295886a7d473c311e3c7e254e54
 173566 pass f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 e3b66e5cba89fc0b59c9a116e7414388d45e04a0
 173517 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 6e5608d1c50e0f91ed3226489d9591c70fa37c30
 173570 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4220eac3799f46ba84316513606a33e1ea33fb4e
 173576 pass f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 fd688b06a57a327dc5dbda106a104a2af5e1aa2b
 173579 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4220eac3799f46ba84316513606a33e1ea33fb4e
 173582 pass f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 fd688b06a57a327dc5dbda106a104a2af5e1aa2b
 173591 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4220eac3799f46ba84316513606a33e1ea33fb4e
 173593 pass f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 fd688b06a57a327dc5dbda106a104a2af5e1aa2b
 173596 fail f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4220eac3799f46ba84316513606a33e1ea33fb4e
Searching for interesting versions
 Result found: flight 172114 (pass), for basis pass
 For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 fd688b06a57a327dc5dbda106a104a2af5e1aa2b, results HASH(0x55bb3b04dd18) HASH(0x55bb3b058668) HASH(0x55bb3b05c1f8) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 e3b66e5cba89fc0b59c9a116e7414388d45e04a0, results \
 HASH(0x55bb3b04b3e8) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 9b5a7fd916a74295886a7d473c311e3c7e254e54, results HASH(0x55bb3b01f568) For basis failure, parent search stopping at 8db4e9f9a0c2ec992e28259ceb7a8eb316716b05 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d, results HASH(0x55bb3b014c18) F\
 or basis failure, parent search stopping at 710f83b79d6eab641401c054b2f40f6c630f8cd5 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d, results HASH(0x55bb3b039768) For basis failure, parent search stopping at d97ee3244d806d324a22ea530215a9f10d2b23e2 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d, results HASH(0x55bb3b01f268) For basis failure, pare\
 nt search stopping at d82ec90f51f61c914396271d86e64a74121dde24 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 4ed063a71bf9ec291a1b71d0b7b36c0416ca544d, results HASH(0x55bb3b0301f8) For basis failure, parent search stopping at 0dc9b78a46813d61533b2bb0f7ef897a06a273be 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 261b882f7704515a01f74589f57f0c1303e3b701, results HASH(0x55bb3b023ba0) HASH(0x55bb3b030820) Result found: flight 173\
 496 (fail), for basis failure (at ancestor ~759)
 Repro found: flight 173535 (pass), for basis pass
 Repro found: flight 173540 (fail), for basis failure
 0 revisions at f80580f56b267c96f16f985dbf707b2f96947da4 83aebe33dc76760f911162f9e7a4b98a4929776b 46de2eec93bffa0706e6229c0da2919763c8eb04 fd688b06a57a327dc5dbda106a104a2af5e1aa2b
No revisions left to test, checking graph state.
 Result found: flight 173576 (pass), for last pass
 Result found: flight 173579 (fail), for first failure
 Repro found: flight 173582 (pass), for last pass
 Repro found: flight 173591 (fail), for first failure
 Repro found: flight 173593 (pass), for last pass
 Repro found: flight 173596 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4220eac3799f46ba84316513606a33e1ea33fb4e
  Bug not present: fd688b06a57a327dc5dbda106a104a2af5e1aa2b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173596/


  commit 4220eac3799f46ba84316513606a33e1ea33fb4e
  Author: Henry Wang <Henry.Wang@arm.com>
  Date:   Tue Oct 11 15:42:00 2022 +0200
  
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

pnmtopng: 161 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173596: tolerable ALL FAIL

flight 173596 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173596/

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


