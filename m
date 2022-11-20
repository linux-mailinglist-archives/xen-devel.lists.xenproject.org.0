Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0156312FF
	for <lists+xen-devel@lfdr.de>; Sun, 20 Nov 2022 09:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446253.701791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owfh3-0007g9-CC; Sun, 20 Nov 2022 08:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446253.701791; Sun, 20 Nov 2022 08:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owfh3-0007e6-9F; Sun, 20 Nov 2022 08:28:49 +0000
Received: by outflank-mailman (input) for mailman id 446253;
 Sun, 20 Nov 2022 08:28:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owfh1-0007dw-KJ; Sun, 20 Nov 2022 08:28:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owfh1-0000fL-H1; Sun, 20 Nov 2022 08:28:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owfh1-0002m5-6C; Sun, 20 Nov 2022 08:28:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1owfh1-0006it-5l; Sun, 20 Nov 2022 08:28:47 +0000
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
	bh=5UvD1GpozgHTFkF0VwNJTBHKqeUZ7Zq3K/G7PDtiaEM=; b=IcjoqZxnQnpPqMkqT4QhGWFenq
	4pz1sTCFnLw34QQhbASWnrTV2QaRIrwZrWXn8nD9VELsSQ8Msv7IHxL6H/9R9gT9qpximuI3KrhYy
	fKkZagCXwGHeQ/nTWoZhgbwrAkL/5BBAZ7y8fi11lP+DUQZWmvPt1mU5oFiBPqmuG+ww=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1owfh1-0006it-5l@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Nov 2022 08:28:47 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174855/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/174855.bisection-summary --basis-template=174797 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 174843 fail [host=debina1] / 174797 [host=chardonnay0] 174791 [host=albana1] 174773 [host=albana0] 174769 [host=nocera1] 174762 [host=huxelrebe1] 174753 [host=nobling0] 174747 [host=elbling0] 174742 [host=debina0] 174733 [host=huxelrebe0] 174724 [host=fiano1] 174701 [host=pinot0] 174682 [host=pinot1] 174670 [host=italia1] 174663 [host=nobling1] 174652 [host=chardonnay1] 174641 [host=nocera0] 174636 [host=elbling1] 174629 [host=chardonnay0] 174607 ok.
Failure / basis pass flights: 174843 / 174607
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7\
 a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#2d9b3699136d20e354a94daefebbeefa9ceec7b6-db8fa01c61db0317a9ee947925226234c65d48e8
Loaded 5001 nodes in revision graph
Searching for test results:
 174607 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
 174629 [host=chardonnay0]
 174636 [host=elbling1]
 174641 [host=nocera0]
 174652 [host=chardonnay1]
 174663 [host=nobling1]
 174670 [host=italia1]
 174682 [host=pinot1]
 174701 [host=pinot0]
 174724 [host=fiano1]
 174733 [host=huxelrebe0]
 174742 [host=debina0]
 174747 [host=elbling0]
 174753 [host=nobling0]
 174762 [host=huxelrebe1]
 174769 [host=nocera1]
 174773 [host=albana0]
 174791 [host=albana1]
 174797 [host=chardonnay0]
 174814 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174819 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174842 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6
 174844 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174845 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c805ceb0b26a643c7e47f01f2dbc50555d93cce8
 174846 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c62748312e0adec0cbcf0f8d7d126080e5e43a82
 174847 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e5ac68a0110cb43a3a0bc17d545ae7a0bd746ef9
 174848 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174850 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174851 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
 174843 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db8fa01c61db0317a9ee947925226234c65d48e8
 174853 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
 174855 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
Searching for interesting versions
 Result found: flight 174607 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999, results HASH(0x55b3d7e96a50) HASH(0x55b3d7e93820) HASH(0x55b3d7e860c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1\
 ce1bec85e58b458386f8b7a0bedfaa6 e5ac68a0110cb43a3a0bc17d545ae7a0bd746ef9, results HASH(0x55b3d7e90290) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c62748312e0adec0cbcf0f8d7d126080e5e43a82, results HASH(0x55b3d7e897d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c805ceb0b26a643c7e47f01f2dbc50555d93cce8, results HASH(0x55b3d7e9db10) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 2d9b3699136d20e354a94daefebbeefa9ceec7b6, results HASH(0x55b3d7e894d0) HASH(0x55b3d7e877c8) Result found: flight 174814 (fail), \
 for basis failure (at ancestor ~732)
 Repro found: flight 174842 (pass), for basis pass
 Repro found: flight 174843 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 bd87315a603bf25e869e6293f7db7b1024d67999
No revisions left to test, checking graph state.
 Result found: flight 174848 (pass), for last pass
 Result found: flight 174849 (fail), for first failure
 Repro found: flight 174850 (pass), for last pass
 Repro found: flight 174851 (fail), for first failure
 Repro found: flight 174853 (pass), for last pass
 Repro found: flight 174855 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
  Bug not present: bd87315a603bf25e869e6293f7db7b1024d67999
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/174855/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
174855: tolerable ALL FAIL

flight 174855 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/174855/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    


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


