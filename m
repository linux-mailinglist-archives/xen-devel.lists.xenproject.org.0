Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906E3FEA1A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177085.322291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhGo-0004gH-7Y; Thu, 02 Sep 2021 07:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177085.322291; Thu, 02 Sep 2021 07:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhGo-0004e9-2Z; Thu, 02 Sep 2021 07:36:22 +0000
Received: by outflank-mailman (input) for mailman id 177085;
 Thu, 02 Sep 2021 07:36:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLhGm-0004dx-F3; Thu, 02 Sep 2021 07:36:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLhGm-0007B8-9S; Thu, 02 Sep 2021 07:36:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLhGm-0008LC-13; Thu, 02 Sep 2021 07:36:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLhGm-0007oK-0W; Thu, 02 Sep 2021 07:36:20 +0000
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
	bh=t3gwX6ivxTbp46ew6HRNNt4ACR+5Slw7ptLrr4N2toM=; b=tXV+dnD0TSMasm62gfFZ1ar6qs
	uq/fLlUa+q+96IryyDmezZ7iDk1FuIqA1a20pXPf23WgM98W38yKKrCg5AqMggTTTeFeqled1sOFu
	I267Ij/Ol2PcHIpK1x09V0d0j25RESymlv+1GKtxCzikDKtmVPbta+hVDNZsoKmIh0EQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-i386-xsm
Message-Id: <E1mLhGm-0007oK-0W@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Sep 2021 07:36:20 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164753/


  commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
  Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Date:   Tue Aug 31 09:29:48 2021 +0800
  
      OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
      
      Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
      the kernel, initrd, and kernel command line from QEMU's fw_cfg.
      
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
      Signed-off-by: Gary Lin <gary.lin@hpe.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
      Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Jim Fehlig <jfehlig@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386-xsm.xen-build --summary-out=tmp/164753.bisection-summary --basis-template=164674 --blessings=real,real-bisect,real-retry ovmf build-i386-xsm xen-build
Searching for failure / basis pass:
 164746 fail [host=huxelrebe1] / 164674 [host=fiano1] 164630 [host=albana0] 164556 [host=elbling1] 164513 [host=albana1] 164461 [host=huxelrebe0] 164406 [host=albana0] 164229 [host=huxelrebe0] 164173 [host=albana0] 164166 [host=albana1] 164160 ok.
Failure / basis pass flights: 164746 / 164160
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
Basis pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#a776bbabd9e8f370feb089cdc016324b1d6a37c7-e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-b6e539830bf45e2d7a6bd86ddfdf003088b173b0 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b\
 20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe-96607a8e680e7f965ca868d11f8b0636317d2618
Loaded 76357 nodes in revision graph
Searching for test results:
 164160 pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
 164166 [host=albana1]
 164173 [host=albana0]
 164229 [host=huxelrebe0]
 164406 [host=albana0]
 164461 [host=huxelrebe0]
 164513 [host=albana1]
 164556 [host=elbling1]
 164630 [host=albana0]
 164674 [host=fiano1]
 164686 [host=huxelrebe0]
 164695 fail irrelevant
 164704 fail irrelevant
 164723 pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
 164726 fail irrelevant
 164718 fail irrelevant
 164727 pass 8dd4fc5be6189666b37e5b00131a4173c6a2b085 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 93713f444b3f29d6848527506db69cf78976b32d
 164729 fail irrelevant
 164728 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164730 pass irrelevant
 164732 pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
 164734 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164733 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164736 pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 8064488062641ae505b2a7369611c38057a7788b
 164737 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164738 pass cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0e95e1df345bce95ac4d6b15c6ed1bf07659fac1 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164741 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 305c2c3abf8228989f7a6f6d8e698ca088c8dc42
 164740 [host=huxelrebe0]
 164742 pass 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164743 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164744 [host=huxelrebe0]
 164747 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164748 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164746 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164749 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164750 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164752 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164753 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
Searching for interesting versions
 Result found: flight 164160 (pass), for basis pass
 For basis failure, parent search stopping at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356, results HASH(0x5635eef165c0) HASH(0x5635f42f0720) HASH(0x5635eef0f138) For basis failure, parent search stopping at 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d\
 96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356, results HASH(0x5635eef0f228) For basis failure, parent search stopping at cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0e95e1df345bce95ac4d6b15c6ed1bf07659fac1 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356, results HASH(0x5635f42f1c88) Result found: flight 164728 (fail), for basis failure (at ancestor ~17)
 Repro found: flight 164732 (pass), for basis pass
 Repro found: flight 164743 (fail), for basis failure
 0 revisions at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
No revisions left to test, checking graph state.
 Result found: flight 164747 (pass), for last pass
 Result found: flight 164748 (fail), for first failure
 Repro found: flight 164749 (pass), for last pass
 Repro found: flight 164750 (fail), for first failure
 Repro found: flight 164752 (pass), for last pass
 Repro found: flight 164753 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164753/


  commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
  Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Date:   Tue Aug 31 09:29:48 2021 +0800
  
      OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
      
      Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
      the kernel, initrd, and kernel command line from QEMU's fw_cfg.
      
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
      Signed-off-by: Gary Lin <gary.lin@hpe.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
      Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Jim Fehlig <jfehlig@suse.com>

Revision graph left in /home/logs/results/bisect/ovmf/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164753: tolerable ALL FAIL

flight 164753 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164753/

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


