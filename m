Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9544EE801
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 08:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297243.506294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naAJb-0004Pp-8a; Fri, 01 Apr 2022 05:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297243.506294; Fri, 01 Apr 2022 05:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naAJb-0004N6-5h; Fri, 01 Apr 2022 05:59:19 +0000
Received: by outflank-mailman (input) for mailman id 297243;
 Fri, 01 Apr 2022 05:59:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naAJZ-0004Mw-BX; Fri, 01 Apr 2022 05:59:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naAJZ-0005pA-40; Fri, 01 Apr 2022 05:59:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naAJY-0005Qc-Sr; Fri, 01 Apr 2022 05:59:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1naAJY-00055D-SN; Fri, 01 Apr 2022 05:59:16 +0000
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
	bh=E0lMVnGx6Xuh9uMnbSJ8/5wTuSggloYpothrjgSADL8=; b=tC4UE0qs7n+MKKASpnMSJNzVpz
	SsQQpOz5L5GiXBUGCePLmhNa+/OFFDkrghiOCytuccME9IKRTq3cRkrpgXJGPDozheTyZe4V2051W
	no4zJdxmJrw+0frw+0GPu0S071HLJcpZpkeYFriKGQahDhruJPP3Dh6hWB2eAAxUg/S4=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-amd64-livepatch
Message-Id: <E1naAJY-00055D-SN@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Apr 2022 05:59:16 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-amd64-livepatch
testid livepatch-run

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
  Bug not present: 27dc916a39e8be9de331a580a43f10ef85633133
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169099/


  commit dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
  Author: Bjoern Doebel <doebel@amazon.de>
  Date:   Thu Mar 10 07:35:36 2022 +0000
  
      xen/x86: Livepatch: support patching CET-enhanced functions
      
      Xen enabled CET for supporting architectures. The control flow aspect of
      CET require functions that can be called indirectly (i.e., via function
      pointers) to start with an ENDBR64 instruction. Otherwise a control flow
      exception is raised.
      
      This expectation breaks livepatching flows because we patch functions by
      overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
      ENDBR64. We fix this by checking the start of a patched function for
      being ENDBR64. In the positive case we move the livepatch JMP to start
      behind the ENDBR64 instruction.
      
      To avoid having to guess the ENDBR64 offset again on patch reversal
      (which might race with other mechanisms adding/removing ENDBR
      dynamically), use the livepatch metadata to store the computed offset
      along with the saved bytes of the overwritten function.
      
      Signed-off-by: Bjoern Doebel <doebel@amazon.de>
      Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      (cherry picked from commit 6974c75180f1aad44e5428eabf2396b2b50fb0e4)
      
      Note: For backports to 4.14 thru 4.16, there is no endbr-clobbering, hence no
            is_endbr64_poison() logic.


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-amd64-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-livepatch.livepatch-run --summary-out=tmp/169099.bisection-summary --basis-template=168513 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-amd64-livepatch livepatch-run
Searching for failure / basis pass:
 169048 fail [host=himrod0] / 168513 [host=elbling0] 168503 [host=albana0] 168484 [host=godello1] 168136 [host=pinot0] 168063 [host=chardonnay0] 168015 [host=elbling0] 167997 [host=godello1] 167894 [host=godello0] 167620 [host=chardonnay1] 167401 [host=elbling0] 167218 [host=godello1] 166959 [host=pinot1] 166394 [host=fiano0] 166322 [host=godello0] template as basis? using template as basis.
Failure / basis pass flights: 169048 / 168513
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 4dcddbba664cc91e2c1952498e80d8025891b9ad
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29a2f95d36d2a01bcacc0f3136801b2d9197f4d7 d239552ce7220e448ae81f41515138f7b9e3c4db cfd29b83a26f35f49f074f06169ce4cadfdebf0d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b1b89f9009f2390652e0061bd7b24fc40732bc70-b1b89f9009f2390652e0061bd7b24fc40732bc70 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#29a2f95d36d2a01bcacc0f3136801b2d9197f4d7-107951211a8d17658e1aaa0c23a8cf29f8806ad8 git://xenbits.xen.org/osstest/seabios.git#d239552ce7220e448ae81f41515138f7b9e3c4db-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#cfd29b83a26f35f49f074f06169ce4cadfdebf0d-4dcddbba664cc91e2c1952498e80d8025891b9ad
Loaded 10006 nodes in revision graph
Searching for test results:
 168513 [host=elbling0]
 168993 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 4dcddbba664cc91e2c1952498e80d8025891b9ad
 169047 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29a2f95d36d2a01bcacc0f3136801b2d9197f4d7 d239552ce7220e448ae81f41515138f7b9e3c4db cfd29b83a26f35f49f074f06169ce4cadfdebf0d
 169075 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 4dcddbba664cc91e2c1952498e80d8025891b9ad
 169077 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29a2f95d36d2a01bcacc0f3136801b2d9197f4d7 d239552ce7220e448ae81f41515138f7b9e3c4db cfd29b83a26f35f49f074f06169ce4cadfdebf0d
 169080 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 4dcddbba664cc91e2c1952498e80d8025891b9ad
 169081 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 9cd9650377d564f56126b2974097f54e0318dd27
 169083 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 351428de6feee3769a0ba69fdab3f521be85e891
 169048 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 4dcddbba664cc91e2c1952498e80d8025891b9ad
 169084 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 27dc916a39e8be9de331a580a43f10ef85633133
 169088 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
 169091 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 27dc916a39e8be9de331a580a43f10ef85633133
 169093 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
 169097 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 27dc916a39e8be9de331a580a43f10ef85633133
 169099 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
Searching for interesting versions
 Result found: flight 169047 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 27dc916a39e8be9de331a580a43f10ef85633133, results HASH(0x55c2279caaf0) HASH(0x55c2279a7fd0) HASH(0x55c2279a82d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 351428de6feee3769a0ba69fdab3f521be85e891, results HASH(0x55c2279c6c60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c\
 23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 9cd9650377d564f56126b2974097f54e0318dd27, results HASH(0x55c2279c4c58) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29a2f95d36d2a01bcacc0f3136801b2d9197f4d7 d239552ce7220e448ae81f41515138f7b9e3c4db cfd29b83a26f35f49f074f06169ce4cadfdebf0d, results HASH(0x55c2279bdb98) HASH(0x55\
 c2279bcaf0) Result found: flight 169048 (fail), for basis failure (at ancestor ~242)
 Repro found: flight 169077 (pass), for basis pass
 Repro found: flight 169080 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db 27dc916a39e8be9de331a580a43f10ef85633133
No revisions left to test, checking graph state.
 Result found: flight 169084 (pass), for last pass
 Result found: flight 169088 (fail), for first failure
 Repro found: flight 169091 (pass), for last pass
 Repro found: flight 169093 (fail), for first failure
 Repro found: flight 169097 (pass), for last pass
 Repro found: flight 169099 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
  Bug not present: 27dc916a39e8be9de331a580a43f10ef85633133
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169099/


  commit dcd44e3b9ad2f0491bd7f4751232a389e4ee57e7
  Author: Bjoern Doebel <doebel@amazon.de>
  Date:   Thu Mar 10 07:35:36 2022 +0000
  
      xen/x86: Livepatch: support patching CET-enhanced functions
      
      Xen enabled CET for supporting architectures. The control flow aspect of
      CET require functions that can be called indirectly (i.e., via function
      pointers) to start with an ENDBR64 instruction. Otherwise a control flow
      exception is raised.
      
      This expectation breaks livepatching flows because we patch functions by
      overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
      ENDBR64. We fix this by checking the start of a patched function for
      being ENDBR64. In the positive case we move the livepatch JMP to start
      behind the ENDBR64 instruction.
      
      To avoid having to guess the ENDBR64 offset again on patch reversal
      (which might race with other mechanisms adding/removing ENDBR
      dynamically), use the livepatch metadata to store the computed offset
      along with the saved bytes of the overwritten function.
      
      Signed-off-by: Bjoern Doebel <doebel@amazon.de>
      Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      (cherry picked from commit 6974c75180f1aad44e5428eabf2396b2b50fb0e4)
      
      Note: For backports to 4.14 thru 4.16, there is no endbr-clobbering, hence no
            is_endbr64_poison() logic.

Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
169099: tolerable ALL FAIL

flight 169099 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169099/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-livepatch   13 livepatch-run           fail baseline untested


jobs:
 test-amd64-amd64-livepatch                                   fail    


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


