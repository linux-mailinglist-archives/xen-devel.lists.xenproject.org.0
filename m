Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D03FDDDA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176509.321172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRJm-0005BE-96; Wed, 01 Sep 2021 14:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176509.321172; Wed, 01 Sep 2021 14:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRJm-00059B-5f; Wed, 01 Sep 2021 14:34:22 +0000
Received: by outflank-mailman (input) for mailman id 176509;
 Wed, 01 Sep 2021 14:34:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLRJl-000591-6m; Wed, 01 Sep 2021 14:34:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLRJk-00041t-WA; Wed, 01 Sep 2021 14:34:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLRJk-0008Ry-PU; Wed, 01 Sep 2021 14:34:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLRJk-0002Fk-P1; Wed, 01 Sep 2021 14:34:20 +0000
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
	bh=EJjEFxAXfiM72/PLrvPX3UAZ6GtaE4crts9y9ZHbeqY=; b=cBtgGRiRAAfyYYjwqWHuYbqWk2
	Vcy7kNDiCCTLTDSMFwkAK4lY+uMUv7wvca1QS3tX6bXpRccAXe8llCMFHoIpnZfIsO/WrgwHsTAJA
	4TQ11We5TETV/VBzsIFHrphZKbrPf04Z2ATOwf3I883slf+jB0CXfI2jiy3Fnrih36zQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-amd64
Message-Id: <E1mLRJk-0002Fk-P1@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 14:34:20 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164710/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-amd64.xen-build --summary-out=tmp/164710.bisection-summary --basis-template=164674 --blessings=real,real-bisect,real-retry ovmf build-amd64 xen-build
Searching for failure / basis pass:
 164695 fail [host=himrod1] / 164674 [host=himrod2] 164630 [host=himrod2] 164556 ok.
Failure / basis pass flights: 164695 / 164556
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Basis pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#a82bad9730178a1e3a67c9bfc83412b87a8ad734-b170806518c1e414939c8b085866544814e1ce8e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b\
 20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#a931e8e64af07bd333a31f3b71a3f8f3e7910857-a931e8e64af07bd333a31f3b71a3f8f3e7910857
Loaded 5001 nodes in revision graph
Searching for test results:
 164556 pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164630 [host=himrod2]
 164674 [host=himrod2]
 164686 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164694 pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164697 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164699 pass b04453d36bd87735aadd29adbefce8d147f18a35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164700 pass cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164701 pass 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164695 fail b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164702 pass 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164703 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164705 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164706 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164707 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164708 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164710 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Searching for interesting versions
 Result found: flight 164556 (pass), for basis pass
 For basis failure, parent search stopping at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27d4058) HASH(0x561ed27e6cf0) HASH(0x561ed2848548) For basis failure, parent search stopping at 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d\
 96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27dc0a0) For basis failure, parent search stopping at 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27db5f8) For basis failure, parent search stopping at cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27d95f0) For basis failure, parent search stopping at b04453d36bd87735aadd29adbefce8d147f18a35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27cf120) For basis failure, parent search stopping at a82bad973017\
 8a1e3a67c9bfc83412b87a8ad734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561ed27cd298) HASH(0x561ed27c4440) Result found: flight 164686 (fail), for basis failure (at ancestor ~5000)
 Repro found: flight 164694 (pass), for basis pass
 Repro found: flight 164695 (fail), for basis failure
 0 revisions at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
No revisions left to test, checking graph state.
 Result found: flight 164703 (pass), for last pass
 Result found: flight 164705 (fail), for first failure
 Repro found: flight 164706 (pass), for last pass
 Repro found: flight 164707 (fail), for first failure
 Repro found: flight 164708 (pass), for last pass
 Repro found: flight 164710 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164710/


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

Revision graph left in /home/logs/results/bisect/ovmf/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164710: tolerable ALL FAIL

flight 164710 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164710/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


