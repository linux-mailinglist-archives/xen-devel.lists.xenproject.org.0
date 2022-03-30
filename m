Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6E4EC30F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 14:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296287.504293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXJC-0003Ov-Au; Wed, 30 Mar 2022 12:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296287.504293; Wed, 30 Mar 2022 12:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXJC-0003Md-7t; Wed, 30 Mar 2022 12:20:18 +0000
Received: by outflank-mailman (input) for mailman id 296287;
 Wed, 30 Mar 2022 12:20:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZXJA-0003MR-Kl; Wed, 30 Mar 2022 12:20:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZXJA-0001rI-Go; Wed, 30 Mar 2022 12:20:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZXJA-0004lO-4s; Wed, 30 Mar 2022 12:20:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nZXJA-0007yO-4C; Wed, 30 Mar 2022 12:20:16 +0000
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
	bh=5guNy2j65GfvHNFAXGyJLxRI3GVi0bJtgBtYPlgvJR0=; b=wXVSmOWmWQKbFyuhGcG6LG/4Uu
	sxl30JKULwVqe8XeraTmJBP12f6yoXJGg/GwNCGgyfDc3Tdigqpr13q0xMeZ++ky7oaMN5cxdwB+h
	HE3eDMdic8JvASDh9dCUt8N+ge90l71WEdsqNKidSvGKrHNCGD4KbZWyD6fcWLKrMdJY=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-i386-livepatch
Message-Id: <E1nZXJA-0007yO-4C@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Mar 2022 12:20:16 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job test-amd64-i386-livepatch
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169023/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-i386-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-i386-livepatch.livepatch-run --summary-out=tmp/169023.bisection-summary --basis-template=168502 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-i386-livepatch livepatch-run
Searching for failure / basis pass:
 168970 fail [host=huxelrebe0] / 168502 [host=chardonnay0] 168483 [host=huxelrebe1] 168135 [host=albana1] 168062 [host=albana0] 168014 [host=fiano1] 167996 ok.
Failure / basis pass flights: 168970 / 167996
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608ff56e87905bdeacdbd47 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 dc776a2d9ca9e1b857e880ff682668871369b4c3 3a9450fe5eb0fda8b7069f37d21ce2655bb59da6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#33189f05278345eab608ff56e87905bdeacdbd47-b1b89f9009f2390652e0061bd7b24fc40732bc70 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#e2af2d050338c99e8436e251ad67aafb3ebbd501-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#dc776a2d9ca9e1b857e880ff682668871369b4c3-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#3a9450fe5eb0fda8b7069f37d21ce2655bb59da6-bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
Loaded 12651 nodes in revision graph
Searching for test results:
 167996 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608ff56e87905bdeacdbd47 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 dc776a2d9ca9e1b857e880ff682668871369b4c3 3a9450fe5eb0fda8b7069f37d21ce2655bb59da6
 168014 [host=fiano1]
 168062 [host=albana0]
 168135 [host=albana1]
 168483 [host=huxelrebe1]
 168502 [host=chardonnay0]
 168863 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 3c8e7395e2d01140c862c78fa9483e46c0dbd343
 168970 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
 168990 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608ff56e87905bdeacdbd47 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 dc776a2d9ca9e1b857e880ff682668871369b4c3 3a9450fe5eb0fda8b7069f37d21ce2655bb59da6
 168994 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db bb43e0e1ca20dff14536b7c90ff870f3f50bff8f
 168998 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8a576733162bb72afb4d1eb3012b0aef8d265018 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd ef47070bbb918e8786011242e8d94e071c35ed0f
 169000 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db cd751c09a5bab9f3529901fbe4d867ad7d52e89d
 169001 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3fed31049240de3583e0e1bbea2b3b6278afa2a
 169005 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 67fa16fbc29ebc127372450fcb09a022269f556f
 169008 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3407c77a02eb9077ce2360df6240a9b0e9cb7db
 169010 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169012 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
 169018 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169020 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
 169022 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
 169023 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db be9facf323b40b5a18c5e3f70fce5b245818c42f
Searching for interesting versions
 Result found: flight 167996 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842, results HASH(0x5599d0d4c1a8) HASH(0x5599d0d31948) HASH(0x5599d0d4d250) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3407c77a02eb9077ce2360df6240a9b0e9cb7db, results HASH(0x5599d0d49398) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a4\
 75e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 67fa16fbc29ebc127372450fcb09a022269f556f, results HASH(0x5599d0d47390) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db c3fed31049240de3583e0e1bbea2b3b6278afa2a, results HASH(0x5599d0d45388) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 d239552ce7220e448ae81f41515138f7b9e3c4db cd751c09a5bab9f3529901fbe4d867ad7d52e89d, results HASH(0x5599d0d44160) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8a576733162bb72afb4d\
 1eb3012b0aef8d265018 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd ef47070bbb918e8786011242e8d94e071c35ed0f, results HASH(0x5599d0d42158) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608ff56e87905bdeacdbd47 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 dc776a2d9ca9e1b857e880ff68266887136\
 9b4c3 3a9450fe5eb0fda8b7069f37d21ce2655bb59da6, results HASH(0x5599d0d365e0) HASH(0x5599d0d39b10) Result found: flight 168863 (fail), for basis failure (at ancestor ~418)
 Repro found: flight 168990 (pass), for basis pass
 Repro found: flight 168994 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 d239552ce7220e448ae81f41515138f7b9e3c4db 74aeb555745b27575c3f82051a83942ee05bd842
No revisions left to test, checking graph state.
 Result found: flight 169010 (pass), for last pass
 Result found: flight 169012 (fail), for first failure
 Repro found: flight 169018 (pass), for last pass
 Repro found: flight 169020 (fail), for first failure
 Repro found: flight 169022 (pass), for last pass
 Repro found: flight 169023 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  be9facf323b40b5a18c5e3f70fce5b245818c42f
  Bug not present: 74aeb555745b27575c3f82051a83942ee05bd842
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169023/


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

Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-i386-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
169023: tolerable ALL FAIL

flight 169023 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169023/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-livepatch    13 livepatch-run           fail baseline untested


jobs:
 test-amd64-i386-livepatch                                    fail    


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


