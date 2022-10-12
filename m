Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247755FC020
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 07:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420688.665619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiUIc-0002FS-19; Wed, 12 Oct 2022 05:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420688.665619; Wed, 12 Oct 2022 05:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiUIb-0002D9-Uc; Wed, 12 Oct 2022 05:28:57 +0000
Received: by outflank-mailman (input) for mailman id 420688;
 Wed, 12 Oct 2022 05:28:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiUIa-0002Cz-Al; Wed, 12 Oct 2022 05:28:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiUIa-00052d-7F; Wed, 12 Oct 2022 05:28:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiUIZ-0006dE-O5; Wed, 12 Oct 2022 05:28:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oiUIZ-0004vQ-Nd; Wed, 12 Oct 2022 05:28:55 +0000
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
	bh=F0OygkzzGAySaKVvaG3YIJEi9HaoOeEZ+rKiGPPYuKA=; b=cSYSSHP4OwoxK2KAu52Mv4zqtk
	49Put2+YAbWeKa/d3cD+L6Yc9PZvmZGO3A6g1Bsa225EyxIAPAACfjjOVHjo7ZsScHlrJjof1apcD
	TsNYRU12UNnf94f5UOQumtHT6aqWoVjUpWSLlOd+CwiVLkiJmDsX2Qt+7lg/7Tgv5izw=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete build-arm64
Message-Id: <E1oiUIZ-0004vQ-Nd@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 05:28:55 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c5215044578e88b401a1296ed6302df05c113c5f
  Bug not present: 45336d8f88725aec65ee177b1b09abf6eef1dc8d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173543/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/build-arm64.xen-build --summary-out=tmp/173543.bisection-summary --basis-template=172547 --blessings=real,real-bisect,real-retry xen-4.15-testing build-arm64 xen-build
Searching for failure / basis pass:
 173498 fail [host=laxton1] / 172547 ok.
Failure / basis pass flights: 173498 / 172547
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
Basis pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#444260d45ec2a84e8f8c192b3539a3cd5591d009-f80580f56b267c96f16f985dbf707b2f96947da4 git://xenbits.xen.org/qemu-xen.git#6503bd6a1b5364ffd346a8a475e1eb91b9f756e5-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#9acedc3c58c31930737edbe212f2ccf437a0b757-9690bb261d5fa\
 09cb281e1fa124d93db7b84fda5
Loaded 10001 nodes in revision graph
Searching for test results:
 172547 pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173494 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173499 pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173507 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173508 pass e8a537d28d37c092bd03093064264071f2938ca8 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173509 pass 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173512 pass a670f12a741a9511d9cedc7257d3693567f8fc43 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173513 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 686c920fa9389fe2b6b619643024ed98b4b7d51f
 173515 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7923ea47e578bca30a6e45951a9da09e827ff028
 173498 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173516 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
 173524 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 0c0680d6e7953ca4c91699e60060c732f9ead5c1
 173526 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173531 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
 173532 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173533 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
 173539 pass f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
 173543 fail f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 c5215044578e88b401a1296ed6302df05c113c5f
Searching for interesting versions
 Result found: flight 172547 (pass), for basis pass
 For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d, results HASH(0x561c46b799c0) HASH(0x561c46b7de50) HASH(0x561c46b80c00) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 0c0680d6e7953ca4c91699e60060c732f9ead5c1, results \
 HASH(0x561c46b779b8) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 686c920fa9389fe2b6b619643024ed98b4b7d51f, results HASH(0x561c46b60658) For basis failure, parent search stopping at a670f12a741a9511d9cedc7257d3693567f8fc43 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x561c46b61580) F\
 or basis failure, parent search stopping at 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x561c46b5e350) For basis failure, parent search stopping at e8a537d28d37c092bd03093064264071f2938ca8 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x561c46b56008) For basis failure, pare\
 nt search stopping at 444260d45ec2a84e8f8c192b3539a3cd5591d009 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x561c46b42748) HASH(0x561c46b54600) Result found: flight 173494 (fail), for basis failure (at ancestor ~746)
 Repro found: flight 173499 (pass), for basis pass
 Repro found: flight 173507 (fail), for basis failure
 0 revisions at f80580f56b267c96f16f985dbf707b2f96947da4 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 45336d8f88725aec65ee177b1b09abf6eef1dc8d
No revisions left to test, checking graph state.
 Result found: flight 173526 (pass), for last pass
 Result found: flight 173531 (fail), for first failure
 Repro found: flight 173532 (pass), for last pass
 Repro found: flight 173533 (fail), for first failure
 Repro found: flight 173539 (pass), for last pass
 Repro found: flight 173543 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c5215044578e88b401a1296ed6302df05c113c5f
  Bug not present: 45336d8f88725aec65ee177b1b09abf6eef1dc8d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173543/


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

pnmtopng: 152 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173543: tolerable ALL FAIL

flight 173543 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173543/

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


