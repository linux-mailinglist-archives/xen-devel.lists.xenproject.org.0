Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B664F754
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 04:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465150.723766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Nl4-0007Sr-TY; Sat, 17 Dec 2022 03:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465150.723766; Sat, 17 Dec 2022 03:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Nl4-0007Qm-P8; Sat, 17 Dec 2022 03:21:06 +0000
Received: by outflank-mailman (input) for mailman id 465150;
 Sat, 17 Dec 2022 03:21:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6Nl2-0007Qa-Cu; Sat, 17 Dec 2022 03:21:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6Nl2-0007Q7-5s; Sat, 17 Dec 2022 03:21:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6Nl1-0005ub-RG; Sat, 17 Dec 2022 03:21:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p6Nl1-0006FT-Qj; Sat, 17 Dec 2022 03:21:03 +0000
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
	bh=au6PbPoHgP9MNj9KsO/ZZgfZDdAW8LLOPMi61koLgiY=; b=xYgsdd0nAtG1UtmBXHQ74MUktE
	EbL+EIpyCWnaLecDxkKrqjlo951s8teqLabtaVcHK8n0LcOULzv+PY2NZtXI5NaLcBF3XlWY5NqWo
	2a6YB5iot8EfwMoKnEmAfOIZ8sGxpzjiUl4abOhmKcUU1Stq0dcF5vd1i+lR+VXgNmt8=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1p6Nl1-0006FT-Qj@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Dec 2022 03:21:03 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175346/


  commit e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Author: Wei Chen <wei.chen@arm.com>
  Date:   Mon Dec 12 12:13:26 2022 +0100
  
      xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
      
      VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
      results in two lines of error-checking code in phys_to_nid
      that is not actually working and causing two compilation
      errors:
      1. error: "MAX_NUMNODES" undeclared (first use in this function).
         This is because in the common header file, "MAX_NUMNODES" is
         defined after the common header file includes the ARCH header
         file, where phys_to_nid has attempted to use "MAX_NUMNODES".
         This error was resolved after we moved the phys_to_nid from
         x86 ARCH header file to common header file.
      2. error: wrong type argument to unary exclamation mark.
         This is because, the error-checking code contains !node_data[nid].
         But node_data is a data structure variable, it's not a pointer.
      
      So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
      enable the two lines of error-checking code. And fix the left
      compilation errors by replacing !node_data[nid] to
      !node_data[nid].node_spanned_pages. Although NUMA allows one node
      can only have CPUs but without any memory. And node with 0 bytes
      of memory might have an entry in memnodemap[] theoretically. But
      that doesn't mean phys_to_nid can find any valid address from a
      node with 0 bytes memory.
      
      Signed-off-by: Wei Chen <wei.chen@arm.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.xen-boot --summary-out=tmp/175346.bisection-summary --basis-template=175148 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-xsm xen-boot
Searching for failure / basis pass:
 175266 fail [host=himrod0] / 175154 [host=fiano1] 175148 [host=elbling1] 175144 [host=fiano0] 175141 [host=italia0] 175135 [host=pinot1] 175126 [host=godello1] 175104 [host=huxelrebe0] 175091 [host=chardonnay1] 175083 [host=chardonnay0] 175071 [host=huxelrebe1] 175066 [host=godello0] 175062 [host=elbling0] 175058 [host=nocera1] 175055 [host=pinot0] 175050 [host=sabro1] 175044 [host=nocera0] 175040 [host=debina1] 175037 [host=sabro0] 175031 [host=albana1] 175029 [host=nobling0] 175021 [host=ital\
 ia1] 175009 [host=albana0] 174999 ok.
Failure / basis pass flights: 175266 / 174999
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#345135942bf9632eba1409ba432cfcae3b7649c7-630dc3798e1d0d1b95f7be8b176563eb40e866e5
Loaded 5001 nodes in revision graph
Searching for test results:
 174930 [host=godello0]
 174944 [host=pinot1]
 174950 [host=chardonnay1]
 174966 [host=italia0]
 174972 [host=chardonnay0]
 174984 [host=debina0]
 174994 [host=nobling1]
 174999 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
 175009 [host=albana0]
 175021 [host=italia1]
 175029 [host=nobling0]
 175031 [host=albana1]
 175037 [host=sabro0]
 175040 [host=debina1]
 175044 [host=nocera0]
 175050 [host=sabro1]
 175055 [host=pinot0]
 175058 [host=nocera1]
 175062 [host=elbling0]
 175066 [host=godello0]
 175071 [host=huxelrebe1]
 175083 [host=chardonnay0]
 175091 [host=chardonnay1]
 175104 [host=huxelrebe0]
 175126 [host=godello1]
 175135 [host=pinot1]
 175141 [host=italia0]
 175144 [host=fiano0]
 175148 [host=elbling1]
 175154 [host=fiano1]
 175168 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175180 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175189 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175208 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175266 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175308 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
 175309 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175313 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 32ae027f81aed2812ac4025c403f0b32ecfac7f7
 175315 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db92cb450dd7ad5eb103819d26b737cdc054ce4a
 175318 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175322 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 d25aeb176e6c771cbe2b75f51a35031f93703603
 175325 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 15dccc881d0636991955162a11a202023e13a313
 175326 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9bbfd7b14c4ad3774d88fe6430ab8726720633ec
 175329 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175330 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175334 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175337 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175341 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175346 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
Searching for interesting versions
 Result found: flight 174999 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d, results HASH(0x55ef405f72f0) HASH(0x55ef405ffe98) HASH(0x55ef40602080) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 9bbfd7b14c4ad3774d88fe6430ab8726720633ec, results HASH(0x55ef40012a88) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 15dccc881d0636991955162a11a202023e13a313, results HASH(0x55ef400ace70) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 d25aeb176e6c771cbe2b75f51a35031f93703603, results HASH(0x55ef405fcfb8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db92cb450dd7ad5eb103819d26b737cdc054ce4a, results HASH(0x55ef3ff21ed8) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 32ae027f81aed2812ac4025c403f0b32ecfac7f7, results HASH(0x55ef4055a558) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7, results HASH(0x55ef40569b0\
 8) HASH(0x55ef405fd2b8) Result found: flight 175168 (fail), for basis failure (at ancestor ~845)
 Repro found: flight 175308 (pass), for basis pass
 Repro found: flight 175309 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
No revisions left to test, checking graph state.
 Result found: flight 175329 (pass), for last pass
 Result found: flight 175330 (fail), for first failure
 Repro found: flight 175334 (pass), for last pass
 Repro found: flight 175337 (fail), for first failure
 Repro found: flight 175341 (pass), for last pass
 Repro found: flight 175346 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175346/


  commit e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Author: Wei Chen <wei.chen@arm.com>
  Date:   Mon Dec 12 12:13:26 2022 +0100
  
      xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
      
      VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
      results in two lines of error-checking code in phys_to_nid
      that is not actually working and causing two compilation
      errors:
      1. error: "MAX_NUMNODES" undeclared (first use in this function).
         This is because in the common header file, "MAX_NUMNODES" is
         defined after the common header file includes the ARCH header
         file, where phys_to_nid has attempted to use "MAX_NUMNODES".
         This error was resolved after we moved the phys_to_nid from
         x86 ARCH header file to common header file.
      2. error: wrong type argument to unary exclamation mark.
         This is because, the error-checking code contains !node_data[nid].
         But node_data is a data structure variable, it's not a pointer.
      
      So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
      enable the two lines of error-checking code. And fix the left
      compilation errors by replacing !node_data[nid] to
      !node_data[nid].node_spanned_pages. Although NUMA allows one node
      can only have CPUs but without any memory. And node with 0 bytes
      of memory might have an entry in memnodemap[] theoretically. But
      that doesn't mean phys_to_nid can find any valid address from a
      node with 0 bytes memory.
      
      Signed-off-by: Wei Chen <wei.chen@arm.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
175346: tolerable ALL FAIL

flight 175346 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175346/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-xsm       8 xen-boot                fail baseline untested


jobs:
 test-amd64-amd64-xl-xsm                                      fail    


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


