Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C364CFFC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 20:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462576.720725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5XFB-000168-TW; Wed, 14 Dec 2022 19:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462576.720725; Wed, 14 Dec 2022 19:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5XFB-00014w-PL; Wed, 14 Dec 2022 19:16:41 +0000
Received: by outflank-mailman (input) for mailman id 462576;
 Wed, 14 Dec 2022 19:16:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5XFA-00014i-Cf; Wed, 14 Dec 2022 19:16:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5XFA-0001uV-9K; Wed, 14 Dec 2022 19:16:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5XFA-00013z-1Q; Wed, 14 Dec 2022 19:16:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5XFA-00044C-0z; Wed, 14 Dec 2022 19:16:40 +0000
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
	bh=RqLsJySH19uF6dsMZTCbD7dSI15hhpYsadvSHcr1S6w=; b=NLhhsMrS7P9eZCQiWdkDOLC/ui
	DqdOKzSoFvUtmwGAlo3PT01rBfvbVMAy5AKXnjYPg33yElfZUNDUCjSy8zKVonJ99AzkMlv3Z5jH4
	1gTnzE2PCrACCbo3vuU62ZAH0lmt7jyYPhf3Guzf59vABHWj5KmUueWH4tqyd0NhzRjY=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1p5XFA-00044C-0z@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Dec 2022 19:16:40 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-dom0pvh-xl-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175207/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/175207.bisection-summary --basis-template=175148 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 175189 fail [host=sabro0] / 175154 [host=fiano1] 175148 [host=himrod0] 175144 [host=chardonnay1] 175141 [host=elbling1] 175135 [host=chardonnay0] 175126 [host=fiano0] 175104 [host=italia0] 175091 [host=albana1] 175083 [host=godello0] 175071 [host=elbling0] 175066 [host=debina1] 175062 [host=sabro1] 175058 [host=albana0] 175055 [host=nobling1] 175050 [host=huxelrebe0] 175044 [host=nobling0] 175040 [host=fiano1] 175037 [host=godello1] 175031 [host=italia1] 175029 [host=huxelrebe1] 175021 ok.
Failure / basis pass flights: 175189 / 175021
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8b3c06a3e545204515e50733669ad6f5c7bddfd8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#8b3c06a3e545204515e50733669ad6f5c7bddfd8-630dc3798e1d0d1b95f7be8b176563eb40e866e5
Loaded 5001 nodes in revision graph
Searching for test results:
 175021 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8b3c06a3e545204515e50733669ad6f5c7bddfd8
 175029 [host=huxelrebe1]
 175031 [host=italia1]
 175037 [host=godello1]
 175040 [host=fiano1]
 175044 [host=nobling0]
 175050 [host=huxelrebe0]
 175055 [host=nobling1]
 175058 [host=albana0]
 175062 [host=sabro1]
 175066 [host=debina1]
 175071 [host=elbling0]
 175083 [host=godello0]
 175091 [host=albana1]
 175104 [host=italia0]
 175126 [host=fiano0]
 175135 [host=chardonnay0]
 175141 [host=elbling1]
 175144 [host=chardonnay1]
 175148 [host=himrod0]
 175154 [host=fiano1]
 175168 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175179 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8b3c06a3e545204515e50733669ad6f5c7bddfd8
 175181 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175183 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3
 175184 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 72cfe1c3ad1fae95f4f0ac51dbdd6838264fdd7f
 175180 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175185 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c243c0bb2a77e1328842436ca654f808701161c6
 175190 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175192 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175193 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9bbfd7b14c4ad3774d88fe6430ab8726720633ec
 175195 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175196 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175198 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175200 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175189 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175204 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175207 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
Searching for interesting versions
 Result found: flight 175021 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d, results HASH(0x564727457030) HASH(0x56472745b040) HASH(0x56472745daf0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 9bbfd7b14c4ad3774d88fe6430ab8726720633ec, results HASH(0x564727458a38) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x564727450270) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 72cfe1c3ad1fae95f4f0ac51dbdd6838264fdd7f, results HASH(0x564727443470) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3, results HASH(0x56472745b4c0) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8b3c06a3e545204515e50733669ad6f5c7bddfd8, results HASH(0x56472744ee68) HASH(0x56472745b340) Result found: flight 175168 (fail), for basis failure (at ancestor ~845)
 Repro found: flight 175179 (pass), for basis pass
 Repro found: flight 175189 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
No revisions left to test, checking graph state.
 Result found: flight 175195 (pass), for last pass
 Result found: flight 175196 (fail), for first failure
 Repro found: flight 175198 (pass), for last pass
 Repro found: flight 175200 (fail), for first failure
 Repro found: flight 175204 (pass), for last pass
 Repro found: flight 175207 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175207/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
175207: tolerable ALL FAIL

flight 175207 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175207/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot           fail baseline untested


jobs:
 test-amd64-amd64-dom0pvh-xl-intel                            fail    


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


