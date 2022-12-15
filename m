Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D864D7CA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463141.721284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jf9-0001dk-Pe; Thu, 15 Dec 2022 08:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463141.721284; Thu, 15 Dec 2022 08:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jf9-0001bJ-LY; Thu, 15 Dec 2022 08:32:19 +0000
Received: by outflank-mailman (input) for mailman id 463141;
 Thu, 15 Dec 2022 08:32:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5jf7-0001b9-EA; Thu, 15 Dec 2022 08:32:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5jf7-0004fE-Cb; Thu, 15 Dec 2022 08:32:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5jf6-0008J5-Qq; Thu, 15 Dec 2022 08:32:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5jf6-0004Ep-QR; Thu, 15 Dec 2022 08:32:16 +0000
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
	bh=Yse1gaV6e7HtpbL3lQoJ2QtxxXYzHiIPkWau9TQlLQo=; b=VRlS8wGoI0Hle87q2FtsgfTs+a
	wPUbSjLOKrYHsIxfuIfbmjeazYyEU2v/qlcQNniI2H6kJ9Aiy3WL9Rf7lv2IHbptKPIQ0EBjEXAGz
	Iq3+4+owhqqDZt89mTE5Au5BWhLY2qHrJ+PRPqgL1ZT5abeRSRIRauow7pxp4jbT+eIg=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-pvhv2-intel
Message-Id: <E1p5jf6-0004Ep-QR@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 08:32:16 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-pvhv2-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175255/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-pvhv2-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-pvhv2-intel.xen-boot --summary-out=tmp/175255.bisection-summary --basis-template=175148 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-pvhv2-intel xen-boot
Searching for failure / basis pass:
 175189 fail [host=himrod0] / 175168 [host=chardonnay0] 175154 [host=italia0] 175148 [host=huxelrebe0] 175144 [host=fiano0] 175141 [host=chardonnay1] 175135 [host=elbling0] 175126 [host=elbling1] 175104 [host=debina0] 175091 [host=italia1] 175083 [host=debina1] 175071 [host=albana1] 175066 ok.
Failure / basis pass flights: 175189 / 175066
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b926dbcccaa92831dda37576f768ddab9ec8a701
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#b926dbcccaa92831dda37576f768ddab9ec8a701-630dc3798e1d0d1b95f7be8b176563eb40e866e5
Loaded 5001 nodes in revision graph
Searching for test results:
 175066 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b926dbcccaa92831dda37576f768ddab9ec8a701
 175071 [host=albana1]
 175083 [host=debina1]
 175091 [host=italia1]
 175104 [host=debina0]
 175126 [host=elbling1]
 175135 [host=elbling0]
 175141 [host=chardonnay1]
 175144 [host=fiano0]
 175148 [host=huxelrebe0]
 175154 [host=italia0]
 175168 [host=chardonnay0]
 175180 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bc19af0bd4b8d0bb817defa4470873c80f67b6c2
 175189 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175216 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b926dbcccaa92831dda37576f768ddab9ec8a701
 175217 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175222 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175224 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c44c0dc35889848ee27549ac3455314e236cfc3d
 175229 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 cfee463c112b8ac261f6ca1d32e4c70e4821ba7a
 175237 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175239 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175243 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175249 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
 175252 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
 175255 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e9c72d524fbdb109c45f24acce998f0bd552fb6f
Searching for interesting versions
 Result found: flight 175066 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d, results HASH(0x55bd0b18b310) HASH(0x55bd0b181440) HASH(0x55bd0b18b610) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55bd0b182848) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b926dbcccaa92831dda37576f768ddab9ec8a701, results HASH(0x55bd0b175bc8) HASH(0x55bd0b17dc10) Result found: flight 175180 (fail), for basis failure (at ancestor ~845)
 Repro found: flight 175216 (pass), for basis pass
 Repro found: flight 175217 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 eac84d9d579011f311d502317b74dc56e788463d
No revisions left to test, checking graph state.
 Result found: flight 175237 (pass), for last pass
 Result found: flight 175239 (fail), for first failure
 Repro found: flight 175243 (pass), for last pass
 Repro found: flight 175249 (fail), for first failure
 Repro found: flight 175252 (pass), for last pass
 Repro found: flight 175255 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9c72d524fbdb109c45f24acce998f0bd552fb6f
  Bug not present: eac84d9d579011f311d502317b74dc56e788463d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175255/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-pvhv2-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
175255: tolerable ALL FAIL

flight 175255 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175255/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot             fail baseline untested


jobs:
 test-amd64-amd64-xl-pvhv2-intel                              fail    


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


