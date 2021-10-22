Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C776D437E78
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 21:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215232.374290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me02S-00034P-Kf; Fri, 22 Oct 2021 19:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215232.374290; Fri, 22 Oct 2021 19:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me02S-00032M-FI; Fri, 22 Oct 2021 19:17:12 +0000
Received: by outflank-mailman (input) for mailman id 215232;
 Fri, 22 Oct 2021 19:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1me02Q-00032C-4a; Fri, 22 Oct 2021 19:17:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1me02P-00033X-Kq; Fri, 22 Oct 2021 19:17:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1me02P-0007Vo-C4; Fri, 22 Oct 2021 19:17:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1me02P-0004W2-Bb; Fri, 22 Oct 2021 19:17:09 +0000
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
	bh=7AXSAnZk33ZIVaNshCS1EJ/bdh1+aiv0ehWAE0BvQjY=; b=Shn77QSQv4g2iyBH2Ems2ZrJCV
	ygHbzGXOz53FRA6kN9pEEfKrm4Ibxrh39yyHgRUY3Y08Oay9NmxsEjHiF32rco6wwVnMjh5qo84e6
	sVnk86t8dVlFsq9JXHON9dSMvprzRyrJDXXXCga453NcUYspLtx1IjgCmdVJJ6yHN/Gw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete build-i386
Message-Id: <E1me02P-0004W2-Bb@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Oct 2021 19:17:09 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  e741aff0f43343d6d91242fee1072fee376d5cce
  Bug not present: 685db13a38f7599fabd353382ff65d3c244ea641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165788/


  commit e741aff0f43343d6d91242fee1072fee376d5cce
  Author: Igor Mammedov <imammedo@redhat.com>
  Date:   Thu Sep 2 07:35:38 2021 -0400
  
      tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
      
      Currently it is not possible to create tests that have KVM as a hard
      requirement on a host that doesn't support KVM for tested target
      binary (modulo going through the trouble of compiling out
      the offending test case).
      
      Following scenario makes test fail when it's run on non x86 host:
        qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288
      
      This patch introduces qtest_has_accel() to let users check if accel is
      available in advance and avoid executing non run-able test-cases.
      
      It implements detection of TCG and KVM only, the rest could be
      added later on, when we actually start testing them in qtest.
      
      Signed-off-by: Igor Mammedov <imammedo@redhat.com>
      Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386.xen-build --summary-out=tmp/165788.bisection-summary --basis-template=165682 --blessings=real,real-bisect,real-retry qemu-mainline build-i386 xen-build
Searching for failure / basis pass:
 165726 fail [host=fiano0] / 165682 [host=huxelrebe0] 165670 [host=albana0] 165640 [host=huxelrebe0] 165576 [host=albana1] 165536 [host=huxelrebe0] 165529 [host=albana1] 165514 [host=fiano1] 165506 [host=fiano1] 165498 [host=huxelrebe0] 165488 [host=albana1] 165477 [host=huxelrebe0] 165468 [host=fiano1] 165442 [host=albana1] 165429 ok.
Failure / basis pass flights: 165726 / 165429
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2f286930a8280f4d817460020110009938f695b6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0 64f37cc530f144e53c190c9e8209a51b58fd5c43 118da371d1ff5d8432fa299544b1ea5e7e3710f0
Basis pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#b4da6c29f1d36031e04212f53277ce0dcba309f1-2f286930a8280f4d817460020110009938f695b6 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#14f12119aa675e9e28207a48b0728a2daa5b88d6-4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0 git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c43-64f\
 37cc530f144e53c190c9e8209a51b58fd5c43 git://xenbits.xen.org/xen.git#192aaf7e146c0b41dbdd35ccdb13eb33ced13633-118da371d1ff5d8432fa299544b1ea5e7e3710f0
From git://cache:9419/git://git.qemu.org/qemu
   eb8f1d57bd..2c64ff92ec  master     -> origin/master
   2c64ff92ec..660efed8b3  staging    -> origin/staging
Loaded 25020 nodes in revision graph
Searching for test results:
 165429 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165442 [host=albana1]
 165468 [host=fiano1]
 165477 [host=huxelrebe0]
 165488 [host=albana1]
 165498 [host=huxelrebe0]
 165506 [host=fiano1]
 165514 [host=fiano1]
 165529 [host=albana1]
 165536 [host=huxelrebe0]
 165576 [host=albana1]
 165640 [host=huxelrebe0]
 165670 [host=albana0]
 165682 [host=huxelrebe0]
 165694 fail irrelevant
 165704 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165705 fail irrelevant
 165706 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 911965ace9386e35ca022a65bb45a32fd421af3e 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165707 pass 210869834639c1150b1f016e2022472a55cdd884 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2792cf20ca7eed0e354a0ed731422411faca4908 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165709 pass 210869834639c1150b1f016e2022472a55cdd884 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5abfac277d25feb5f12332422c03ea1cb21c6aa1 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165711 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 995b87dedc78b0467f5f18bbc3546072ba97516a 64f37cc530f144e53c190c9e8209a51b58fd5c43 52d0847d7c6972baa74156f14ee8544f5aba1d2d
 165713 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bec4042baefc1bfeae05b161aa17d2f57d526b60 64f37cc530f144e53c190c9e8209a51b58fd5c43 52d0847d7c6972baa74156f14ee8544f5aba1d2d
 165703 fail 6893865b3010bb6192f732643c4b8ba026726d07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 afc9fcde55296b83f659de9da3cdf044812a6eeb 64f37cc530f144e53c190c9e8209a51b58fd5c43 c12731493ae39640c4e44d9fe2029c3165f9f429
 165716 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4d1a525dfafe995a98bb486e702da09e31b68b9c 64f37cc530f144e53c190c9e8209a51b58fd5c43 f791392f82ffe39cc1ea4c4db1d877223754a04a
 165717 pass 785cfd33053f506d4a1c17100356a63f24e98f45 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b4da13293482134b81d71be656ec76beff73a76 64f37cc530f144e53c190c9e8209a51b58fd5c43 b75838ad6c4f42c93efee83fc2508c78641e1b57
 165718 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 946de558354c99e1989621abe053f2ab87dc8de9 64f37cc530f144e53c190c9e8209a51b58fd5c43 9e319e5258d0274c15da2ea9355dc1569a0fa832
 165720 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 76e366e728549b3324cc2dee6745d6a4f1af18e6 64f37cc530f144e53c190c9e8209a51b58fd5c43 a0ffee6b145933f411b1c33daa2cdd54e77b2b15
 165722 fail 6893865b3010bb6192f732643c4b8ba026726d07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 afc9fcde55296b83f659de9da3cdf044812a6eeb 64f37cc530f144e53c190c9e8209a51b58fd5c43 c12731493ae39640c4e44d9fe2029c3165f9f429
 165723 pass ba4ae92234b1985a89b3abed221d825b8d9ef9e2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8be1d4ed9838f807c63695753b30865f6edc4a5c 64f37cc530f144e53c190c9e8209a51b58fd5c43 f9294486926c865a3ef11cacd7cb6b26cce6f4a4
 165724 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5dacda5167560b3af8eadbce5814f60ba44b467e 64f37cc530f144e53c190c9e8209a51b58fd5c43 be4eefbce6cada21b8a17354c1f11d7865d9a603
 165721 [host=fiano1]
 165725 pass ba4ae92234b1985a89b3abed221d825b8d9ef9e2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81d8537cb297d57b0897797f1329e4d755a0eaf4 64f37cc530f144e53c190c9e8209a51b58fd5c43 d3b05f9b16d6ba9c550c3a35ac11ed292bf87f68
 165733 [host=fiano1]
 165740 [host=fiano1]
 165726 fail 2f286930a8280f4d817460020110009938f695b6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0 64f37cc530f144e53c190c9e8209a51b58fd5c43 118da371d1ff5d8432fa299544b1ea5e7e3710f0
 165748 [host=fiano1]
 165752 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165761 fail 2f286930a8280f4d817460020110009938f695b6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0 64f37cc530f144e53c190c9e8209a51b58fd5c43 118da371d1ff5d8432fa299544b1ea5e7e3710f0
 165765 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 afe5c8c5c14aff25fab6ae83957e87c717415be3 64f37cc530f144e53c190c9e8209a51b58fd5c43 4cfab4425d39f76660b4e76ba6ee4cbf0f92e7e5
 165776 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 362534a643b4a34bcb223996538ce9de5cdab946 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165777 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 19d20e910a586f503994acf590d5f41c314fa4c3 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165778 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b59a898458aea328618521be7dc180d2396c0bf4 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165779 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 362534a643b4a34bcb223996538ce9de5cdab946 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165781 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165783 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c306cdb0cc5327f336fbf9a7411f319f0717ee75 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165784 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165785 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165786 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165787 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165788 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
Searching for interesting versions
 Result found: flight 165429 (pass), for basis pass
 Result found: flight 165726 (fail), for basis failure
 Repro found: flight 165752 (pass), for basis pass
 Repro found: flight 165761 (fail), for basis failure
 0 revisions at 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
No revisions left to test, checking graph state.
 Result found: flight 165781 (pass), for last pass
 Result found: flight 165784 (fail), for first failure
 Repro found: flight 165785 (pass), for last pass
 Repro found: flight 165786 (fail), for first failure
 Repro found: flight 165787 (pass), for last pass
 Repro found: flight 165788 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  e741aff0f43343d6d91242fee1072fee376d5cce
  Bug not present: 685db13a38f7599fabd353382ff65d3c244ea641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165788/


  commit e741aff0f43343d6d91242fee1072fee376d5cce
  Author: Igor Mammedov <imammedo@redhat.com>
  Date:   Thu Sep 2 07:35:38 2021 -0400
  
      tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
      
      Currently it is not possible to create tests that have KVM as a hard
      requirement on a host that doesn't support KVM for tested target
      binary (modulo going through the trouble of compiling out
      the offending test case).
      
      Following scenario makes test fail when it's run on non x86 host:
        qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288
      
      This patch introduces qtest_has_accel() to let users check if accel is
      available in advance and avoid executing non run-able test-cases.
      
      It implements detection of TCG and KVM only, the rest could be
      added later on, when we actually start testing them in qtest.
      
      Signed-off-by: Igor Mammedov <imammedo@redhat.com>
      Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
165788: tolerable ALL FAIL

flight 165788 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/165788/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386                    6 xen-build               fail baseline untested


jobs:
 build-i386                                                   fail    


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


