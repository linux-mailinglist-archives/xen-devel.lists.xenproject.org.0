Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AA36773B6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 02:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482603.748204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJlGn-0003OJ-H4; Mon, 23 Jan 2023 01:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482603.748204; Mon, 23 Jan 2023 01:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJlGn-0003NF-DK; Mon, 23 Jan 2023 01:05:09 +0000
Received: by outflank-mailman (input) for mailman id 482603;
 Mon, 23 Jan 2023 01:05:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJlGm-0003N5-OZ; Mon, 23 Jan 2023 01:05:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJlGm-0005sn-LK; Mon, 23 Jan 2023 01:05:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJlGm-0003ji-6U; Mon, 23 Jan 2023 01:05:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pJlGm-0001PY-5w; Mon, 23 Jan 2023 01:05:08 +0000
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
	bh=f1+c+WWD8MootUzbZGZyxjBEw6TdIN43s73V59UAPrE=; b=DP7ml70aYYPioloC1+PU9NHARo
	8fKMufMFbGjKBRO0EWFWJUj74jzJVR6JXibC0oQrnGBN6axJQ8B5VgeN+yAubXyIS/ULO6o37QVBV
	d+iy+9p+fXt8JfAG2TNG7nUpWCzPd1eynESvopGGrRudPREchi3+ZQXSc/QkgQiLsIE8=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-libvirt-pair
Message-Id: <E1pJlGm-0001PY-5w@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Jan 2023 01:05:08 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-pair
testid guest-migrate/src_host/dst_host

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176054/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-libvirt-pair.guest-migrate--src_host--dst_host.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-libvirt-pair.guest-migrate--src_host--dst_host --summary-out=tmp/176054.bisection-summary --basis-template=175994 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-libvirt-pair guest-migrate/src_host/dst_host
Searching for failure / basis pass:
 176042 fail [dst_host=debina1,src_host=debina0] / 175994 [dst_host=albana0,src_host=albana1] 175987 [dst_host=pinot1,src_host=pinot0] 175965 [dst_host=italia0,src_host=italia1] 175734 [dst_host=elbling1,src_host=elbling0] 175726 [dst_host=elbling0,src_host=elbling1] 175720 [dst_host=fiano0,src_host=fiano1] 175714 [dst_host=huxelrebe0,src_host=huxelrebe1] 175694 [dst_host=fiano1,src_host=fiano0] 175671 [dst_host=albana1,src_host=albana0] 175651 [dst_host=debina0,src_host=debina1] 175635 [dst_hos\
 t=italia1,src_host=italia0] 175624 [dst_host=nobling1,src_host=nobling0] 175612 [dst_host=nobling0,src_host=nobling1] 175601 [dst_host=albana0,src_host=albana1] 175592 [dst_host=nocera0,src_host=nocera1] 175573 [dst_host=italia0,src_host=italia1] 175569 [dst_host=nocera1,src_host=nocera0] 175541 [dst_host=pinot1,src_host=pinot0] 175534 [dst_host=pinot0,src_host=pinot1] 175526 ok.
Failure / basis pass flights: 176042 / 175526
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 57b0678590708de081e4498e164b86d5c8c85024 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
Basis pass 0f2396751fccdc9f742230763880f70dbd977f3b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#0f2396751fccdc9f742230763880f70dbd977f3b-57b0678590708de081e4498e164b86d5c8c85024 https://gitlab.com/keycodemap/keycodemapdb.git#57ba70da5312170883a3d622cd2aa3fd0e2ec7ae-57ba70da5312170883a3d622cd2aa3fd0e2ec7ae git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#1cf02b05b27c48775a25699e61b93b814b9ae042-625eb5e96dc96aa7fddef59a08edae215527f19c git://xenbits.xen.org/xen.git#7eef80e06ed2282bbcec3619d860c6aacb0515d8-1d60c20260c7e82fe5344d06c20d718e0cc03b8b
Loaded 15003 nodes in revision graph
Searching for test results:
 175592 [dst_host=nocera0,src_host=nocera1]
 175601 [dst_host=albana0,src_host=albana1]
 175612 [dst_host=nobling0,src_host=nobling1]
 175624 [dst_host=nobling1,src_host=nobling0]
 175635 [dst_host=italia1,src_host=italia0]
 175651 [dst_host=debina0,src_host=debina1]
 175671 [dst_host=albana1,src_host=albana0]
 175694 [dst_host=fiano1,src_host=fiano0]
 175714 [dst_host=huxelrebe0,src_host=huxelrebe1]
 175720 [dst_host=fiano0,src_host=fiano1]
 175726 [dst_host=elbling0,src_host=elbling1]
 175734 [dst_host=elbling1,src_host=elbling0]
 175834 []
 175861 []
 175890 []
 175907 []
 175931 []
 175956 []
 175965 [dst_host=italia0,src_host=italia1]
 175987 [dst_host=pinot1,src_host=pinot0]
 175994 [dst_host=albana0,src_host=albana1]
 176003 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 176011 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176033 pass 0f2396751fccdc9f742230763880f70dbd977f3b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
 176025 fail 57b0678590708de081e4498e164b86d5c8c85024 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176034 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176036 fail 57b0678590708de081e4498e164b86d5c8c85024 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176037 pass 0fcdb512d4aed9730f082f2da7cd5b9c3694d271 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 38525f6f73f906699f77a1af86c16b4eaad48e04
 176038 pass e8871a9ce03c75925f7ad315e7efb9277e366aa3 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176039 pass cba964b145515e998a370cda6594d6d8c6d90ba2 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176035 fail 57b0678590708de081e4498e164b86d5c8c85024 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176041 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d4994ac79ed96550f8e8c9a682d468e83db4dfe
 176043 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d99732f2b092173d8600fa818aee3fa51046bb0
 176044 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176045 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176042 fail 57b0678590708de081e4498e164b86d5c8c85024 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176047 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176049 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176050 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176051 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176052 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176054 fail 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 175517 [dst_host=elbling1,src_host=elbling0]
 175520 [dst_host=albana1,src_host=albana0]
 175526 pass 0f2396751fccdc9f742230763880f70dbd977f3b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
 175534 [dst_host=pinot0,src_host=pinot1]
 175541 [dst_host=pinot1,src_host=pinot0]
 175554 [dst_host=nocera1,src_host=nocera0]
 175562 [dst_host=nocera1,src_host=nocera0]
 175569 [dst_host=nocera1,src_host=nocera0]
 175573 [dst_host=italia0,src_host=italia1]
Searching for interesting versions
 Result found: flight 175526 (pass), for basis pass
 For basis failure, parent search stopping at 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f, results HASH(0x556d3f995a18) HASH(0x556d3f9a60a8) HASH(0x556d3f9b3928) For basis failure, parent search stopping at 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5\
 312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x556d3f99c658) For basis failure, parent search stopping at cba964b145515e998a370cda6594d6d8c6d90ba2 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x556d3f996b20) For basis failure, parent search stopping at e8871a9ce03c75925f7ad315e7efb9277e366aa3 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x556d3f997120) For basis\
  failure, parent search stopping at 0fcdb512d4aed9730f082f2da7cd5b9c3694d271 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 38525f6f73f906699f77a1af86c16b4eaad48e04, results HASH(0x556d3f9ac9e8) For basis failure, parent search stopping at 0f2396751fccdc9f742230763880f70dbd977f3b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b\
 1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8, results HASH(0x556d3f99e360) HASH(0x556d3e9e82d8) Result found: flight 176003 (fail), for basis failure (at ancestor ~1186)
 Repro found: flight 176033 (pass), for basis pass
 Repro found: flight 176035 (fail), for basis failure
 0 revisions at 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
No revisions left to test, checking graph state.
 Result found: flight 176047 (pass), for last pass
 Result found: flight 176049 (fail), for first failure
 Repro found: flight 176050 (pass), for last pass
 Repro found: flight 176051 (fail), for first failure
 Repro found: flight 176052 (pass), for last pass
 Repro found: flight 176054 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176054/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

pnmtopng: 191 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-libvirt-pair.guest-migrate--src_host--dst_host.{dot,ps,png,html,svg}.
----------------------------------------
176054: tolerable FAIL

flight 176054 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/176054/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 26 guest-migrate/src_host/dst_host fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-pair                                 fail    


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


