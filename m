Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A03FF85D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 02:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177719.323352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLx28-0003wv-O1; Fri, 03 Sep 2021 00:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177719.323352; Fri, 03 Sep 2021 00:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLx28-0003uY-KB; Fri, 03 Sep 2021 00:26:16 +0000
Received: by outflank-mailman (input) for mailman id 177719;
 Fri, 03 Sep 2021 00:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLx26-0003uO-NU; Fri, 03 Sep 2021 00:26:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLx26-00011Y-BA; Fri, 03 Sep 2021 00:26:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLx25-0004SC-W2; Fri, 03 Sep 2021 00:26:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLx25-0004oj-VY; Fri, 03 Sep 2021 00:26:13 +0000
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
	bh=nrh3UH/pvC8HUOwb0DowZNjxIh5jbmJJITk0G8tPb1Q=; b=X0SBcsGZkI9MsRr+UA7Q0K1TQQ
	1Sa4AumaMSjvtWweVpC/sIcQOofpfJs+pAx/1/6pV1MFf7A5Vk/eCHRRZknZdd5pfSfVQchSi0SLq
	+yen51vdLMmkDtOJWU7/ejJnS9JCm5NyN8zWtRp7iM25Gj4szBxUdgZAZDgIQVAf4FG0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-i386
Message-Id: <E1mLx25-0004oj-VY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Sep 2021 00:26:13 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164784/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386.xen-build --summary-out=tmp/164784.bisection-summary --basis-template=164674 --blessings=real,real-bisect,real-retry ovmf build-i386 xen-build
Searching for failure / basis pass:
 164778 fail [host=huxelrebe1] / 164674 [host=albana0] 164630 [host=huxelrebe0] 164556 [host=albana1] 164513 [host=albana1] 164461 [host=fiano0] 164406 [host=albana0] 164229 [host=huxelrebe0] 164173 [host=albana0] 164166 [host=albana1] 164160 ok.
Failure / basis pass flights: 164778 / 164160
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b6bc203375b6efb6822ee4fe4a59be4f1918436b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
Basis pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#a776bbabd9e8f370feb089cdc016324b1d6a37c7-b6bc203375b6efb6822ee4fe4a59be4f1918436b git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-b6e539830bf45e2d7a6bd86ddfdf003088b173b0 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b\
 20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe-96607a8e680e7f965ca868d11f8b0636317d2618
Loaded 76351 nodes in revision graph
Searching for test results:
 164160 pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
 164166 [host=albana1]
 164173 [host=albana0]
 164229 [host=huxelrebe0]
 164406 [host=albana0]
 164461 [host=fiano0]
 164513 [host=albana1]
 164556 [host=albana1]
 164630 [host=huxelrebe0]
 164674 [host=albana0]
 164686 fail irrelevant
 164695 fail irrelevant
 164704 [host=fiano1]
 164718 fail irrelevant
 164728 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164733 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164737 fail 12e33dca4c0612a0975265e5ba641c6261a26455 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164740 [host=huxelrebe0]
 164743 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164746 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164754 pass a776bbabd9e8f370feb089cdc016324b1d6a37c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
 164755 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164751 fail e3ee8c8dbd7a9f7d7905abe17be60354c9f5f9a3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164756 pass 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 b1ee10be5625b7d502cef1e6ee3818610ab0d29c
 164759 pass 77d5fa80246e8784f89e109ff9dadfeb7089ff85 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 8064488062641ae505b2a7369611c38057a7788b
 164761 pass 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164762 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164758 [host=huxelrebe0]
 164763 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164765 [host=huxelrebe0]
 164766 [host=huxelrebe0]
 164767 [host=huxelrebe0]
 164768 [host=huxelrebe0]
 164769 [host=huxelrebe0]
 164770 [host=huxelrebe0]
 164764 [host=huxelrebe0]
 164771 [host=huxelrebe0]
 164773 fail b6bc203375b6efb6822ee4fe4a59be4f1918436b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164774 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164775 fail b6bc203375b6efb6822ee4fe4a59be4f1918436b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164776 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164780 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164781 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164778 fail b6bc203375b6efb6822ee4fe4a59be4f1918436b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 96607a8e680e7f965ca868d11f8b0636317d2618
 164782 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
 164784 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
Searching for interesting versions
 Result found: flight 164160 (pass), for basis pass
 For basis failure, parent search stopping at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356, results HASH(0x55576e7a07a0) HASH(0x555773b85a90) HASH(0x555773b87e38) For basis failure, parent search stopping at 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d\
 96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356, results HASH(0x555773b71480) Result found: flight 164728 (fail), for basis failure (at ancestor ~18)
 Repro found: flight 164754 (pass), for basis pass
 Repro found: flight 164773 (fail), for basis failure
 0 revisions at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 54082c81d96028ba8c76fbe6784085cf1df76b20 daaf007eb3467f900a2e20fadbc4c6f3bfcaa356
No revisions left to test, checking graph state.
 Result found: flight 164774 (pass), for last pass
 Result found: flight 164776 (fail), for first failure
 Repro found: flight 164780 (pass), for last pass
 Repro found: flight 164781 (fail), for first failure
 Repro found: flight 164782 (pass), for last pass
 Repro found: flight 164784 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164784/


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

Revision graph left in /home/logs/results/bisect/ovmf/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164784: tolerable ALL FAIL

flight 164784 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164784/

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


