Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8C438A85
	for <lists+xen-devel@lfdr.de>; Sun, 24 Oct 2021 17:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215542.374813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meftJ-0005f4-Sh; Sun, 24 Oct 2021 15:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215542.374813; Sun, 24 Oct 2021 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meftJ-0005cB-N1; Sun, 24 Oct 2021 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 215542;
 Sun, 24 Oct 2021 15:58:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meftH-0005c1-TV; Sun, 24 Oct 2021 15:58:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meftH-0004gQ-ON; Sun, 24 Oct 2021 15:58:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meftH-00083T-EC; Sun, 24 Oct 2021 15:58:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1meftH-0007YN-Dh; Sun, 24 Oct 2021 15:58:31 +0000
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
	bh=o/nWDUZGoH5wmcDp84FhVHH5PKQF+w7CvKNsLqQXCuw=; b=feL7fi42dpjkQy3yhtGfKlqL1t
	+56UlAMDA8HA8UDDqkGVVdPyFhDhTXDPGkZxLF4yl0CYzkF4Vc2GcMgSnbWeZEGPdkBh3y7+Smll1
	zgmkQ3qSiSpprWv+15g/G7XZ0xtKBbzuPXIb7B8xDzf4xdTF8AO36yUIt6Wf1l2ecpNU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete build-i386-xsm
Message-Id: <E1meftH-0007YN-Dh@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Oct 2021 15:58:31 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165839/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build --summary-out=tmp/165839.bisection-summary --basis-template=165682 --blessings=real,real-bisect,real-retry qemu-mainline build-i386-xsm xen-build
Searching for failure / basis pass:
 165823 fail [host=fiano0] / 165682 [host=huxelrebe0] 165670 [host=albana0] 165640 [host=huxelrebe0] 165576 [host=albana1] 165536 [host=huxelrebe0] 165529 [host=albana1] 165514 [host=fiano1] 165506 [host=fiano1] 165498 [host=huxelrebe0] 165488 [host=albana1] 165477 [host=albana1] 165468 [host=fiano1] 165442 [host=albana1] 165429 ok.
Failure / basis pass flights: 165823 / 165429
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 62540372230ecb5318a9c8a40580a14beeb9ded0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
Basis pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#b4da6c29f1d36031e04212f53277ce0dcba309f1-62540372230ecb5318a9c8a40580a14beeb9ded0 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#14f12119aa675e9e28207a48b0728a2daa5b88d6-c5b2f559814104f4145f8bc310f4d33c7ead8f49 git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c43-64f\
 37cc530f144e53c190c9e8209a51b58fd5c43 git://xenbits.xen.org/xen.git#192aaf7e146c0b41dbdd35ccdb13eb33ced13633-23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
Loaded 34889 nodes in revision graph
Searching for test results:
 165429 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165442 [host=albana1]
 165468 [host=fiano1]
 165477 [host=albana1]
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
 165703 fail 6893865b3010bb6192f732643c4b8ba026726d07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 afc9fcde55296b83f659de9da3cdf044812a6eeb 64f37cc530f144e53c190c9e8209a51b58fd5c43 c12731493ae39640c4e44d9fe2029c3165f9f429
 165721 [host=fiano1]
 165726 fail irrelevant
 165753 fail irrelevant
 165789 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165792 fail irrelevant
 165794 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 911965ace9386e35ca022a65bb45a32fd421af3e 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165795 pass 210869834639c1150b1f016e2022472a55cdd884 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2792cf20ca7eed0e354a0ed731422411faca4908 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165796 pass 210869834639c1150b1f016e2022472a55cdd884 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5abfac277d25feb5f12332422c03ea1cb21c6aa1 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165790 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2c64ff92ecef4db0169f7238a26f1124268345c8 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165797 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 995b87dedc78b0467f5f18bbc3546072ba97516a 64f37cc530f144e53c190c9e8209a51b58fd5c43 52d0847d7c6972baa74156f14ee8544f5aba1d2d
 165800 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165804 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2c64ff92ecef4db0169f7238a26f1124268345c8 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165805 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bec4042baefc1bfeae05b161aa17d2f57d526b60 64f37cc530f144e53c190c9e8209a51b58fd5c43 52d0847d7c6972baa74156f14ee8544f5aba1d2d
 165806 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4d1a525dfafe995a98bb486e702da09e31b68b9c 64f37cc530f144e53c190c9e8209a51b58fd5c43 f791392f82ffe39cc1ea4c4db1d877223754a04a
 165807 pass 785cfd33053f506d4a1c17100356a63f24e98f45 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b4da13293482134b81d71be656ec76beff73a76 64f37cc530f144e53c190c9e8209a51b58fd5c43 b75838ad6c4f42c93efee83fc2508c78641e1b57
 165810 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 946de558354c99e1989621abe053f2ab87dc8de9 64f37cc530f144e53c190c9e8209a51b58fd5c43 9e319e5258d0274c15da2ea9355dc1569a0fa832
 165811 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 76e366e728549b3324cc2dee6745d6a4f1af18e6 64f37cc530f144e53c190c9e8209a51b58fd5c43 a0ffee6b145933f411b1c33daa2cdd54e77b2b15
 165812 pass ba4ae92234b1985a89b3abed221d825b8d9ef9e2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8be1d4ed9838f807c63695753b30865f6edc4a5c 64f37cc530f144e53c190c9e8209a51b58fd5c43 f9294486926c865a3ef11cacd7cb6b26cce6f4a4
 165813 pass f10a112f08f3fb4a92c3d22f069f6066a12db3be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5dacda5167560b3af8eadbce5814f60ba44b467e 64f37cc530f144e53c190c9e8209a51b58fd5c43 be4eefbce6cada21b8a17354c1f11d7865d9a603
 165815 pass ba4ae92234b1985a89b3abed221d825b8d9ef9e2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81d8537cb297d57b0897797f1329e4d755a0eaf4 64f37cc530f144e53c190c9e8209a51b58fd5c43 d3b05f9b16d6ba9c550c3a35ac11ed292bf87f68
 165799 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 660efed8b37aedec9b5fcc555da1f88f7d12c98a 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165816 pass 6ed6abd6c116e8599876a2876b77e172e800b13e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 afe5c8c5c14aff25fab6ae83957e87c717415be3 64f37cc530f144e53c190c9e8209a51b58fd5c43 4cfab4425d39f76660b4e76ba6ee4cbf0f92e7e5
 165818 fail bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 660efed8b37aedec9b5fcc555da1f88f7d12c98a 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165819 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 362534a643b4a34bcb223996538ce9de5cdab946 64f37cc530f144e53c190c9e8209a51b58fd5c43 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165817 fail 62540372230ecb5318a9c8a40580a14beeb9ded0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 660efed8b37aedec9b5fcc555da1f88f7d12c98a 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165820 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 19d20e910a586f503994acf590d5f41c314fa4c3 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165822 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b59a898458aea328618521be7dc180d2396c0bf4 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165824 pass 90246a6d9f6fda3536d042d02867123caabe3aaa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 362534a643b4a34bcb223996538ce9de5cdab946 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165826 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165828 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c306cdb0cc5327f336fbf9a7411f319f0717ee75 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165830 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165832 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165823 fail 62540372230ecb5318a9c8a40580a14beeb9ded0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165833 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165835 pass b4da6c29f1d36031e04212f53277ce0dcba309f1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 14f12119aa675e9e28207a48b0728a2daa5b88d6 64f37cc530f144e53c190c9e8209a51b58fd5c43 192aaf7e146c0b41dbdd35ccdb13eb33ced13633
 165837 fail 62540372230ecb5318a9c8a40580a14beeb9ded0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5b2f559814104f4145f8bc310f4d33c7ead8f49 64f37cc530f144e53c190c9e8209a51b58fd5c43 23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
 165838 pass 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
 165839 fail 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e741aff0f43343d6d91242fee1072fee376d5cce 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
Searching for interesting versions
 Result found: flight 165429 (pass), for basis pass
 Result found: flight 165823 (fail), for basis failure
 Repro found: flight 165835 (pass), for basis pass
 Repro found: flight 165837 (fail), for basis failure
 0 revisions at 37a33f02aa1ab89f392da7d06ec3578fda1b6182 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 685db13a38f7599fabd353382ff65d3c244ea641 64f37cc530f144e53c190c9e8209a51b58fd5c43 6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
No revisions left to test, checking graph state.
 Result found: flight 165826 (pass), for last pass
 Result found: flight 165830 (fail), for first failure
 Repro found: flight 165832 (pass), for last pass
 Repro found: flight 165833 (fail), for first failure
 Repro found: flight 165838 (pass), for last pass
 Repro found: flight 165839 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  e741aff0f43343d6d91242fee1072fee376d5cce
  Bug not present: 685db13a38f7599fabd353382ff65d3c244ea641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165839/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
165839: tolerable ALL FAIL

flight 165839 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/165839/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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


