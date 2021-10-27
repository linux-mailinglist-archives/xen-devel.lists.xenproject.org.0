Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8E43D085
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 20:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217185.377080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnUO-0008GS-Kw; Wed, 27 Oct 2021 18:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217185.377080; Wed, 27 Oct 2021 18:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnUO-0008Dj-F4; Wed, 27 Oct 2021 18:17:28 +0000
Received: by outflank-mailman (input) for mailman id 217185;
 Wed, 27 Oct 2021 18:17:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnUN-0008DZ-ID; Wed, 27 Oct 2021 18:17:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnUN-0001Um-AS; Wed, 27 Oct 2021 18:17:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnUN-0005YI-2Z; Wed, 27 Oct 2021 18:17:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnUN-0005YU-27; Wed, 27 Oct 2021 18:17:27 +0000
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
	bh=5glbjRsyfWyGz8pLj3ECLGnoUzFFuYHmOEd/dqY5bNU=; b=mA8l+13Eh8ey/8/y/Sfo2nPRO1
	zv6zTEVp800S1cIxE5PBMfJBCA0gmeRDN5KtttYp4qCdyHw6DW1OXBALUiIG8rhLZvsxmdjg0E6iE
	STfc3tzyxqm1Bynv0yF2FrzQYu6K5xxlIdbprT9g5wMQ5Uib6x/VluA5lPGqDPUKRBiw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete build-armhf
Message-Id: <E1mfnUN-0005YU-27@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Oct 2021 18:17:27 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  e741aff0f43343d6d91242fee1072fee376d5cce
  Bug not present: 685db13a38f7599fabd353382ff65d3c244ea641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165902/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/165902.bisection-summary --basis-template=165682 --blessings=real,real-bisect,real-retry qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 165889 fail [host=cubietruck-braque] / 165682 ok.
Failure / basis pass flights: 165889 / 165682
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2f6f3329add328103cb0654b71d7b814dc0c9759 931ce30859176f0f7daac6bac255dae5eb21284e 64f37cc530f144e53c190c9e8209a51b58fd5c43 b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
Basis pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 c11b8d25fbe9c0155e91409594ea6701008409ed
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#90246a6d9f6fda3536d042d02867123caabe3aaa-2f6f3329add328103cb0654b71d7b814dc0c9759 git://git.qemu.org/qemu.git#50352cce138ef3b30c1cda28a4df68fff5da3202-931ce30859176f0f7daac6bac255dae5eb21284e git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c43-64f37cc530f144e53c190c9e8209a51b58fd5c43 git://xenbits.xen.org/xen.git#c11b8d25fbe9c0155e91409594ea6701008409ed-b0fce57a6a491c120f25\
 54ad7cc9a0c43ee5defa
From git://cache:9419/git://xenbits.xen.org/osstest/ovmf
   2f6f3329ad..9a95d11023  xen-tested-master -> origin/xen-tested-master
From git://cache:9419/git://git.qemu.org/qemu
 + 66b095c4fe...5c49c6c241 staging    -> origin/staging  (forced update)
Loaded 34953 nodes in revision graph
Searching for test results:
 165682 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 c11b8d25fbe9c0155e91409594ea6701008409ed
 165694 [host=cubietruck-gleizes]
 165703 [host=cubietruck-picasso]
 165721 fail irrelevant
 165726 fail irrelevant
 165753 fail irrelevant
 165790 [host=cubietruck-gleizes]
 165799 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 660efed8b37aedec9b5fcc555da1f88f7d12c98a 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165817 [host=cubietruck-gleizes]
 165823 [host=cubietruck-gleizes]
 165834 [host=cubietruck-gleizes]
 165844 [host=cubietruck-gleizes]
 165846 [host=cubietruck-gleizes]
 165847 [host=cubietruck-gleizes]
 165849 [host=cubietruck-gleizes]
 165851 [host=cubietruck-gleizes]
 165845 [host=cubietruck-gleizes]
 165854 [host=cubietruck-gleizes]
 165856 [host=cubietruck-gleizes]
 165859 [host=cubietruck-gleizes]
 165860 [host=cubietruck-gleizes]
 165855 fail 8b76f235340922a6d293bff05978ba57d3b498e1 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165865 [host=cubietruck-gleizes]
 165867 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 c11b8d25fbe9c0155e91409594ea6701008409ed
 165869 fail 8b76f235340922a6d293bff05978ba57d3b498e1 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165870 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 1dafe7656a9c2770065e91208edd4c073f5f98a9 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165872 fail 2f286930a8280f4d817460020110009938f695b6 6f9e8515c106650fbba7222c8f66234c8546c025 64f37cc530f144e53c190c9e8209a51b58fd5c43 98f60e5de00baf650c574c9352bb19aedb082dea
 165874 fail 4fdf843c75d297fe892f989009b3d3e397ccfd55 402378407dbdce79ce745a13f5c84815f929cfdd 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165866 fail 8b76f235340922a6d293bff05978ba57d3b498e1 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165876 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 220ffd949bf2c157665905f7744bdbf201333e1f 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165878 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165879 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 5e97b97bc254b0ee23f701a4d5a317853136d288
 165881 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 b7635526acffbe4ad8ad16fd92812c57742e54c2
 165877 fail b80c17b62d989ec00e528c6307c726ce6800bcc4 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
 165882 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165884 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165886 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165883 fail 2f6f3329add328103cb0654b71d7b814dc0c9759 931ce30859176f0f7daac6bac255dae5eb21284e 64f37cc530f144e53c190c9e8209a51b58fd5c43 b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
 165888 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165892 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 50352cce138ef3b30c1cda28a4df68fff5da3202 64f37cc530f144e53c190c9e8209a51b58fd5c43 c11b8d25fbe9c0155e91409594ea6701008409ed
 165894 fail 2f6f3329add328103cb0654b71d7b814dc0c9759 931ce30859176f0f7daac6bac255dae5eb21284e 64f37cc530f144e53c190c9e8209a51b58fd5c43 b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
 165898 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165889 fail 2f6f3329add328103cb0654b71d7b814dc0c9759 931ce30859176f0f7daac6bac255dae5eb21284e 64f37cc530f144e53c190c9e8209a51b58fd5c43 b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
 165900 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165902 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
Searching for interesting versions
 Result found: flight 165682 (pass), for basis pass
 Result found: flight 165883 (fail), for basis failure
 Repro found: flight 165892 (pass), for basis pass
 Repro found: flight 165894 (fail), for basis failure
 0 revisions at 37a33f02aa1ab89f392da7d06ec3578fda1b6182 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
No revisions left to test, checking graph state.
 Result found: flight 165884 (pass), for last pass
 Result found: flight 165886 (fail), for first failure
 Repro found: flight 165888 (pass), for last pass
 Repro found: flight 165898 (fail), for first failure
 Repro found: flight 165900 (pass), for last pass
 Repro found: flight 165902 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  e741aff0f43343d6d91242fee1072fee376d5cce
  Bug not present: 685db13a38f7599fabd353382ff65d3c244ea641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165902/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
165902: tolerable ALL FAIL

flight 165902 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/165902/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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


