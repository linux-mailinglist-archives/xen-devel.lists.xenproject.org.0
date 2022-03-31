Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE94ED1FC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 05:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296618.504956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZlGJ-0005ZT-2S; Thu, 31 Mar 2022 03:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296618.504956; Thu, 31 Mar 2022 03:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZlGI-0005Xo-Vo; Thu, 31 Mar 2022 03:14:14 +0000
Received: by outflank-mailman (input) for mailman id 296618;
 Thu, 31 Mar 2022 03:14:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZlGI-0005Xe-0F; Thu, 31 Mar 2022 03:14:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZlGH-0002wp-Qi; Thu, 31 Mar 2022 03:14:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZlGH-0002KS-G7; Thu, 31 Mar 2022 03:14:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nZlGH-0001qO-Fd; Thu, 31 Mar 2022 03:14:13 +0000
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
	bh=pQP36fTe+zUbApBpXPE0iFCeXiVYFpzH5wdW0Pikzc0=; b=aM3TTvMn+nZxqDeddgETXwganM
	kwyenyKVjJowNo5mMZG8H31pG3a4ZSg8E8LG46J8951bLnq7kyRfeS0FCA5YhVJa8sEseTFcGA8YB
	w9jpCG8L5cD9rTcClCROhLJgkM/J/b9rld6igSZDfSe+6J+n1d2kV51bW8dZHawKBOQg=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-amd64-livepatch
Message-Id: <E1nZlGH-0001qO-Fd@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Mar 2022 03:14:13 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
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
  Bug introduced:  be9facf323b40b5a18c5e3f70fce5b245818c42f
  Bug not present: 74aeb555745b27575c3f82051a83942ee05bd842
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169054/


  commit be9facf323b40b5a18c5e3f70fce5b245818c42f
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-amd64-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-livepatch.livepatch-run --summary-out=tmp/169054.bisection-summary --basis-template=168502 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-amd64-livepatch livepatch-run
Searching for failure / basis pass:
 168992 fail [host=himrod0] / 168502 [host=albana1] 168483 ok.
Failure / basis pass flights: 168992 / 168483
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db 1b50f41b3bd800eb72064063da0c64b86d629f3a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b1b89f9009f2390652e0061bd7b24fc40732bc70-b1b89f9009f2390652e0061bd7b24fc40732bc70 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#e2af2d050338c99e8436e251ad67aafb3ebbd501-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#d239552ce7220e448ae81f41515138f7b9e3c4db-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#1b50f41b3bd800eb72064063da0c64b86d629f3a-bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
Loaded 10007 nodes in revision graph
Searching for test results:
 168483 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db 1b50f41b3bd800eb72064063da0c64b86d629f3a
 168502 [host=albana1]
 168863 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 3c8e7395e2d01140c862c78fa9483e46c0dbd343
 168970 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
 169024 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db 1b50f41b3bd800eb72064063da0c64b86d629f3a
 169029 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
 169031 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db ddeebb5f09b7a0c168395e919078c616a0965a49
 169033 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 82fc15285634bb56125a5b321402d7d52c440646
 168992 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
 169035 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3407c77a02eb9077ce2360df6240a9b0e9cb7db
 169038 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169041 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
 169044 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169049 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
 169052 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169054 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
Searching for interesting versions
 Result found: flight 168483 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842, results HASH(0x5643176a6c78) HASH(0x5643176af2c0) HASH(0x5643176b9490) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3407c77a02eb9077ce2360df6240a9b0e9cb7db, results HASH(0x5643176aefc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a4\
 75e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 82fc15285634bb56125a5b321402d7d52c440646, results HASH(0x5643176ac690) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db ddeebb5f09b7a0c168395e919078c616a0965a49, results HASH(0x5643176993f8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db 1b50f41b3bd800eb72064063da0c64b86d629f3a, results HASH(0x5643176a18c0) HASH(0x5643176990f8) Result found: flight 168863 (fail), for basis failure (at ancestor ~394)
 Repro found: flight 169024 (pass), for basis pass
 Repro found: flight 169029 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
No revisions left to test, checking graph state.
 Result found: flight 169038 (pass), for last pass
 Result found: flight 169041 (fail), for first failure
 Repro found: flight 169044 (pass), for last pass
 Repro found: flight 169049 (fail), for first failure
 Repro found: flight 169052 (pass), for last pass
 Repro found: flight 169054 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  be9facf323b40b5a18c5e3f70fce5b245818c42f
  Bug not present: 74aeb555745b27575c3f82051a83942ee05bd842
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169054/


  commit be9facf323b40b5a18c5e3f70fce5b245818c42f
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

Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
169054: tolerable ALL FAIL

flight 169054 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169054/

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


