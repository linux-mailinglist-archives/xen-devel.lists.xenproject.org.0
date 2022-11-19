Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B778631142
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 23:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446161.701680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owWQG-0002Lh-VZ; Sat, 19 Nov 2022 22:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446161.701680; Sat, 19 Nov 2022 22:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owWQG-0002IF-S3; Sat, 19 Nov 2022 22:34:52 +0000
Received: by outflank-mailman (input) for mailman id 446161;
 Sat, 19 Nov 2022 22:34:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWQF-0002I5-Gp; Sat, 19 Nov 2022 22:34:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWQF-0004RF-DL; Sat, 19 Nov 2022 22:34:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWQF-0002oH-1u; Sat, 19 Nov 2022 22:34:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1owWQF-000434-1S; Sat, 19 Nov 2022 22:34:51 +0000
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
	bh=8KxZv8l3tP9Ei2k/JG2RY4a2FSeno4zP8VXRGWwUQF0=; b=UwU0k2lfmEFfRPLFnNzfPNZ5zt
	OW7PzJFzQYk+3WnVu1RoOrzd+C7jS6vAeVo1hZMFWJIdAfvkJcg8bC/xJMspIGF/H7upo4so9p1q0
	ynOZK/aevzcx5UiFx66iglbewJFZQZ6mX4WkoucwHGWJAKOEBI+320V9a081MNiC7soU=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1owWQF-000434-1S@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Nov 2022 22:34:51 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174840/


  commit 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Oct 25 15:27:05 2022 +0100
  
      xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
      
      This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
      of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
      
      First of all, with ARM borrowing x86's implementation, the logic to set the
      pool size should have been common, not duplicated.  Introduce
      libxl__domain_set_paging_mempool_size() as a shared implementation, and use it
      from the ARM and x86 paths.  It is left as an exercise to the reader to judge
      how libxl/xl can reasonably function without the ability to query the pool
      size...
      
      Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
      replaced with a working and unit tested interface.
      
      This is part of XSA-409 / CVE-2022-33747.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore --summary-out=tmp/174840.bisection-summary --basis-template=174797 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm guest-saverestore
Searching for failure / basis pass:
 174826 fail [host=nocera1] / 174797 [host=fiano0] 174791 [host=debina1] 174773 [host=pinot1] 174769 [host=albana1] 174762 [host=sabro1] 174753 [host=godello1] 174747 [host=huxelrebe0] 174742 [host=elbling0] 174733 [host=himrod0] 174724 [host=pinot0] 174701 [host=italia1] 174682 [host=nobling1] 174670 [host=nocera0] 174663 [host=nobling0] 174652 [host=godello0] 174641 [host=italia0] 174636 [host=elbling1] 174629 [host=chardonnay1] 174607 [host=chardonnay0] 174597 [host=albana0] 174586 [host=debi\
 na0] 174574 ok.
Failure / basis pass flights: 174826 / 174574
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2dd823ca7237e7fb90c890642d6a3b357a26fcff
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#2dd823ca7237e7fb90c890642d6a3b357a26fcff-db8fa01c61db0317a9ee947925226234c65d48e8
Loaded 5001 nodes in revision graph
Searching for test results:
 174574 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2dd823ca7237e7fb90c890642d6a3b357a26fcff
 174586 [host=debina0]
 174597 [host=albana0]
 174607 [host=chardonnay0]
 174629 [host=chardonnay1]
 174636 [host=elbling1]
 174641 [host=italia0]
 174652 [host=godello0]
 174663 [host=nobling0]
 174670 [host=nocera0]
 174682 [host=nobling1]
 174701 [host=italia1]
 174724 [host=pinot0]
 174733 [host=himrod0]
 174742 [host=elbling0]
 174747 [host=huxelrebe0]
 174753 [host=godello1]
 174762 [host=sabro1]
 174769 [host=albana1]
 174773 [host=pinot1]
 174791 [host=debina1]
 174797 [host=fiano0]
 174814 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174819 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174827 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2dd823ca7237e7fb90c890642d6a3b357a26fcff
 174828 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174829 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7b068ac89024308862c4f448dd248645d2b8e882
 174830 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 224dab941629f9cfb793999bcece4c31776b7827
 174831 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5
 174826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174832 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7
 174834 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174836 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174837 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174838 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174839 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174840 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
Searching for interesting versions
 Result found: flight 174574 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999, results HASH(0x5607598e4080) HASH(0x5607598e4b00) HASH(0x56075939b360) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 22b20bd98c025e06525410e3ab3494d5e63489f7, results HASH(0x560759392c18) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f5d56f4b253072264efc0fece698a91779e362f5, results HASH(0x5607598f9f48) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 224dab941629f9cfb793999bcece4c31776b7827, results HASH(0x5607598f7f40) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7b068ac89024308862c4f448dd248645d2b8e882, results HASH(0x5607598ea218) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2dd823ca7237e7fb90c890642d6a3b357a26fcff, results HASH(0x5607598e7c10) HASH(0x5607598f1f00) Result found: flight 174814 (fail), for basis failure (at ancestor ~732)
 Repro found: flight 174827 (pass), for basis pass
 Repro found: flight 174828 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
No revisions left to test, checking graph state.
 Result found: flight 174834 (pass), for last pass
 Result found: flight 174836 (fail), for first failure
 Repro found: flight 174837 (pass), for last pass
 Repro found: flight 174838 (fail), for first failure
 Repro found: flight 174839 (pass), for last pass
 Repro found: flight 174840 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174840/


  commit 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Oct 25 15:27:05 2022 +0100
  
      xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
      
      This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
      of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
      
      First of all, with ARM borrowing x86's implementation, the logic to set the
      pool size should have been common, not duplicated.  Introduce
      libxl__domain_set_paging_mempool_size() as a shared implementation, and use it
      from the ARM and x86 paths.  It is left as an exercise to the reader to judge
      how libxl/xl can reasonably function without the ability to query the pool
      size...
      
      Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
      replaced with a working and unit tested interface.
      
      This is part of XSA-409 / CVE-2022-33747.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
174840: tolerable ALL FAIL

flight 174840 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174840/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    


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


