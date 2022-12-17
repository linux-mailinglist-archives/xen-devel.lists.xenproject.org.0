Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF464FBFA
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 20:03:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465360.724015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6cRd-0005n5-74; Sat, 17 Dec 2022 19:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465360.724015; Sat, 17 Dec 2022 19:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6cRd-0005kH-4T; Sat, 17 Dec 2022 19:02:01 +0000
Received: by outflank-mailman (input) for mailman id 465360;
 Sat, 17 Dec 2022 19:01:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6cRb-0005k5-LN; Sat, 17 Dec 2022 19:01:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6cRb-00066y-Ij; Sat, 17 Dec 2022 19:01:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6cRb-0000Lg-4c; Sat, 17 Dec 2022 19:01:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p6cRb-0008FQ-4D; Sat, 17 Dec 2022 19:01:59 +0000
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
	bh=fF6DLMhq7jeEOhb3K8XeWuiiOiK5DpJVL7SyjgTuaso=; b=K0efywyek60/mvCrayrYBDQRot
	8vW9Q9bMJ8YvsdIreUJF8/MuinF+oFVWO6gpru7+3ZEpBqaLjVvDXqKw8LwylsOVhITMu5Sg6IbCD
	U879HlAynVXOcFFVKpuDcy9fWyF3pxaaunyop4qh0pg9wpTzMzmOFdrJdp8OAhOpzpx8=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-credit1
Message-Id: <E1p6cRb-0008FQ-4D@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Dec 2022 19:01:59 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-credit1
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175370/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-credit1.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-credit1.xen-boot --summary-out=tmp/175370.bisection-summary --basis-template=175148 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-credit1 xen-boot
Searching for failure / basis pass:
 175332 fail [host=nocera0] / 175180 [host=elbling1] 175168 [host=huxelrebe0] 175154 [host=huxelrebe1] 175148 [host=pinot1] 175144 [host=italia1] 175141 [host=nocera1] 175135 [host=albana0] 175126 [host=debina0] 175104 [host=pinot0] 175091 [host=chardonnay1] 175083 [host=nobling1] 175071 [host=himrod0] 175066 [host=italia0] 175062 [host=chardonnay0] 175058 [host=godello1] 175055 [host=godello0] 175050 [host=fiano1] 175044 [host=sabro1] 175040 [host=sabro1] 175037 [host=albana1] 175031 [host=elbl\
 ing0] 175029 [host=debina1] 175021 [host=fiano0] 175009 [host=nobling0] 174999 [host=sabro0] 174994 [host=huxelrebe0] 174984 ok.
Failure / basis pass flights: 175332 / 174984
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-1cf02b05b27c48775a25699e61b93b814b9ae042 git://xenbits.xen.org/xen.git#345135942bf9632eba1409ba432cfcae3b7649c7-c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
Loaded 20034 nodes in revision graph
Searching for test results:
 174930 [host=nobling1]
 174944 [host=himrod0]
 174950 [host=italia1]
 174966 [host=nocera1]
 174972 [host=elbling1]
 174984 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
 174994 [host=huxelrebe0]
 174999 [host=sabro0]
 175009 [host=nobling0]
 175021 [host=fiano0]
 175029 [host=debina1]
 175031 [host=elbling0]
 175037 [host=albana1]
 175040 [host=sabro1]
 175044 [host=sabro1]
 175050 [host=fiano1]
 175055 [host=godello0]
 175058 [host=godello1]
 175062 [host=chardonnay0]
 175066 [host=italia0]
 175071 [host=himrod0]
 175083 [host=nobling1]
 175091 [host=chardonnay1]
 175104 [host=pinot0]
 175126 [host=debina0]
 175135 [host=albana0]
 175141 [host=nocera1]
 175144 [host=italia1]
 175148 [host=pinot1]
 175154 [host=huxelrebe1]
 175168 [host=huxelrebe0]
 175180 [host=elbling1]
 175189 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175208 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175266 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175332 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
 175350 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 345135942bf9632eba1409ba432cfcae3b7649c7
 175351 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175352 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 32ae027f81aed2812ac4025c403f0b32ecfac7f7
 175353 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db92cb450dd7ad5eb103819d26b737cdc054ce4a
 175356 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
 175357 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cfee463c112b8ac261f6ca1d32e4c70e4821ba7a
 175358 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 8a6bce7c76f142b3028495bdb54680b6f517ab12
 175360 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175362 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175363 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175365 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175366 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175368 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175370 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
Searching for interesting versions
 Result found: flight 174984 (pass), for basis pass
 Result found: flight 175332 (fail), for basis failure (at ancestor ~4)
 Repro found: flight 175350 (pass), for basis pass
 Repro found: flight 175356 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
No revisions left to test, checking graph state.
 Result found: flight 175362 (pass), for last pass
 Result found: flight 175363 (fail), for first failure
 Repro found: flight 175365 (pass), for last pass
 Repro found: flight 175366 (fail), for first failure
 Repro found: flight 175368 (pass), for last pass
 Repro found: flight 175370 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175370/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-credit1.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
175370: tolerable ALL FAIL

flight 175370 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175370/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-credit1   8 xen-boot                fail baseline untested


jobs:
 test-amd64-amd64-xl-credit1                                  fail    


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


