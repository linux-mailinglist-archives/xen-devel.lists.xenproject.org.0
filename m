Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26493FE17D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 19:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176591.321340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLUOa-0008Eg-E3; Wed, 01 Sep 2021 17:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176591.321340; Wed, 01 Sep 2021 17:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLUOa-0008C1-A5; Wed, 01 Sep 2021 17:51:32 +0000
Received: by outflank-mailman (input) for mailman id 176591;
 Wed, 01 Sep 2021 17:51:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLUOY-0008Bo-G6; Wed, 01 Sep 2021 17:51:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLUOY-0007q7-AT; Wed, 01 Sep 2021 17:51:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLUOY-0001lK-39; Wed, 01 Sep 2021 17:51:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLUOY-0004yd-2f; Wed, 01 Sep 2021 17:51:30 +0000
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
	bh=gVoODzvwTLgF6rGhJdmnqDDgXPX/Bg3PyRE+sZLd31s=; b=V2mJHWxwXFV48lJvuqa0bB2/Kg
	8/1tM9Lxr/zNaUBCluYVUCrcAlJkq+8oWf1mu4BntOMWxgPQ9X7l6i/T4v0F0YjJE1u1UL2Qt9xSv
	Okw0N6StTWhi3T5StKBHk+Hc6p57Hx6sqte9ac0Pj0f9D3vTA7bJbs8DEe8pwgmLXaiY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-amd64-xsm
Message-Id: <E1mLUOY-0004yd-2f@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 17:51:30 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164722/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build --summary-out=tmp/164722.bisection-summary --basis-template=164674 --blessings=real,real-bisect,real-retry ovmf build-amd64-xsm xen-build
Searching for failure / basis pass:
 164704 fail [host=himrod2] / 164674 ok.
Failure / basis pass flights: 164704 / 164674
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Basis pass cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#cae735f61328d64e2e8991036707b9e78c0f5f63-b170806518c1e414939c8b085866544814e1ce8e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b\
 20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#a931e8e64af07bd333a31f3b71a3f8f3e7910857-a931e8e64af07bd333a31f3b71a3f8f3e7910857
Loaded 5001 nodes in revision graph
Searching for test results:
 164674 pass cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164686 [host=himrod1]
 164695 fail b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164711 pass cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164712 fail b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164713 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164714 pass 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164715 pass 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164704 fail b170806518c1e414939c8b085866544814e1ce8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164716 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164717 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164719 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164720 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164721 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
 164722 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
Searching for interesting versions
 Result found: flight 164674 (pass), for basis pass
 For basis failure, parent search stopping at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561910c2bd50) HASH(0x561910c2f580) HASH(0x561910c33110) For basis failure, parent search stopping at 52e2dabc0f8d3af09c213072ce8ba734302f585d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d\
 96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561910c27ec0) For basis failure, parent search stopping at 28152333bccb778b62e6e97446b28bfa0e92ef82 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561910c26c98) For basis failure, parent search stopping at cae735f61328d64e2e8991036707b9e78c0f5f63 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857, results HASH(0x561910c19838) HASH(0x561910c20178) Result found: flight 164695 (fail), for basis failure (at ancestor ~5000)
 Repro found: flight 164711 (pass), for basis pass
 Repro found: flight 164712 (fail), for basis failure
 0 revisions at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54082c81d96028ba8c76fbe6784085cf1df76b20 a931e8e64af07bd333a31f3b71a3f8f3e7910857
No revisions left to test, checking graph state.
 Result found: flight 164716 (pass), for last pass
 Result found: flight 164717 (fail), for first failure
 Repro found: flight 164719 (pass), for last pass
 Repro found: flight 164720 (fail), for first failure
 Repro found: flight 164721 (pass), for last pass
 Repro found: flight 164722 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164722/


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

Revision graph left in /home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164722: tolerable ALL FAIL

flight 164722 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164722/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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


