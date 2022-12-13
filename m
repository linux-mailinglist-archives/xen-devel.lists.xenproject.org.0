Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B915B64BAE9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460961.718988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58ya-0001GL-IP; Tue, 13 Dec 2022 17:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460961.718988; Tue, 13 Dec 2022 17:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58ya-0001E9-E1; Tue, 13 Dec 2022 17:21:56 +0000
Received: by outflank-mailman (input) for mailman id 460961;
 Tue, 13 Dec 2022 17:21:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58yY-0001CP-TO; Tue, 13 Dec 2022 17:21:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58yY-0006Vc-Rl; Tue, 13 Dec 2022 17:21:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58yY-0001cA-Dr; Tue, 13 Dec 2022 17:21:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p58yY-0006X2-DM; Tue, 13 Dec 2022 17:21:54 +0000
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
	bh=G4DuUAiW9DSvJ7Hk2tLOMMy1W82/PZX68mt2aOAcELY=; b=xAuHaRq92dWwVYCsbb9bWauOJf
	56ohyVTHTjECaa3G36YnNr+ac69RNwCSZAqrDUFl13TehAznea7ymzca+c678uob7mipjAKxdTlp9
	vwHbfyca8DxTnRtNalUP7lu2yFdvTLSzoL7xAnKtZer9MNuuIYs4GnAaIYmKT0r+nxIs=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1p58yY-0006X2-DM@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Dec 2022 17:21:54 +0000

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-4
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175175/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xen-boot --summary-out=tmp/175175.bisection-summary --basis-template=175148 --blessings=real,real-bisect,real-retry xen-unstable test-xtf-amd64-amd64-4 xen-boot
Searching for failure / basis pass:
 175154 fail [host=himrod0] / 175148 [host=italia1] 175144 [host=debina1] 175141 [host=pinot1] 175135 [host=godello0] 175126 [host=nocera1] 175104 [host=pinot0] 175091 [host=godello1] 175083 [host=sabro0] 175071 [host=huxelrebe0] 175066 [host=elbling0] 175062 ok.
Failure / basis pass flights: 175154 / 175062
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 96993519424c3fef49fd00d80a271d986767a3cd 5e770502e81e6bde08f55db6b0f66fbc1013850d
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3 5e770502e81e6bde08f55db6b0f66fbc1013850d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#a6da84524ceaf24ff997d03407b93f60c12857f3-96993519424c3fef49fd00d80a271d986767a3cd git://xenbits.xen.org/xtf.git#5e770502e81e6bde08f55db6b0f66fbc1013850d-5e770502e81e6bde08f55db6b0f66fbc1013850d
Loaded 5001 nodes in revision graph
Searching for test results:
 175062 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175066 [host=elbling0]
 175071 [host=huxelrebe0]
 175083 [host=sabro0]
 175091 [host=godello1]
 175104 [host=pinot0]
 175126 [host=nocera1]
 175135 [host=godello0]
 175141 [host=pinot1]
 175144 [host=debina1]
 175148 [host=italia1]
 175154 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 96993519424c3fef49fd00d80a271d986767a3cd 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175158 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175161 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 96993519424c3fef49fd00d80a271d986767a3cd 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175163 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 54073350bad16b6045522df40a90be79d970aa0e 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175164 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175165 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f00ad745cfa774a269b28e88951b56b7001d4fe0 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175167 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cfee463c112b8ac261f6ca1d32e4c70e4821ba7a 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175169 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175170 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175171 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175174 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d 5e770502e81e6bde08f55db6b0f66fbc1013850d
 175175 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f 5e770502e81e6bde08f55db6b0f66fbc1013850d
Searching for interesting versions
 Result found: flight 175062 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d 5e770502e81e6bde08f55db6b0f66fbc1013850d, results HASH(0x55cfcc3fe308) HASH(0x55cfcc481480) HASH(0x55cfcc484410) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 54073350bad16b6045522df40a90be79d970aa0e 5e770502e81e6bde08f55db6b0f66fbc1013850d, results HASH(0x55cfcc3fc300) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 a6da84524ceaf24ff997d03407b93f60c12857f3 5e770502e81e6bde08f55db6b0f66fbc1013850d, results HASH(0x55cfcc3f\
 2310) HASH(0x55cfcc3f9cf8) Result found: flight 175154 (fail), for basis failure (at ancestor ~839)
 Repro found: flight 175158 (pass), for basis pass
 Repro found: flight 175161 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d 5e770502e81e6bde08f55db6b0f66fbc1013850d
No revisions left to test, checking graph state.
 Result found: flight 175164 (pass), for last pass
 Result found: flight 175169 (fail), for first failure
 Repro found: flight 175170 (pass), for last pass
 Repro found: flight 175171 (fail), for first failure
 Repro found: flight 175174 (pass), for last pass
 Repro found: flight 175175 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175175/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
175175: tolerable ALL FAIL

flight 175175 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175175/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-4        8 xen-boot                fail baseline untested


jobs:
 test-xtf-amd64-amd64-4                                       fail    


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


