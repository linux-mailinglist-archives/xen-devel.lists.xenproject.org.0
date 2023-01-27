Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B267EF8C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 21:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485955.753431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLVKN-0006p1-8g; Fri, 27 Jan 2023 20:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485955.753431; Fri, 27 Jan 2023 20:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLVKN-0006nC-5T; Fri, 27 Jan 2023 20:28:03 +0000
Received: by outflank-mailman (input) for mailman id 485955;
 Fri, 27 Jan 2023 20:28:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLVKL-0006n2-C7; Fri, 27 Jan 2023 20:28:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLVKL-000828-7U; Fri, 27 Jan 2023 20:28:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLVKK-00038W-Th; Fri, 27 Jan 2023 20:28:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLVKK-0006Dg-TF; Fri, 27 Jan 2023 20:28:00 +0000
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
	bh=AGD61jE/0SAPXM+EJxLmHdCaUDCNfdAABkLpXeO8BJ4=; b=ipkE+zE0G7z5dcXi6JEGh2IVO0
	swy/3Jw2L8WZQc+e2eWppFE1qclcbyfvk4e4AGtWFwwU/FKjZsr0ghv1GpHwwSiYNitMnOUVi6IoG
	iMY4oGp27IypitzdXOJ5Gp8J5hF2c+fQL7xWagBc2svj+84oIciSZDkllPk9jtLb6ReU=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
Message-Id: <E1pLVKK-0006Dg-TF@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 20:28:00 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-shadow
testid guest-localmigrate

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176257/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-localmigrate.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-localmigrate --summary-out=tmp/176257.bisection-summary --basis-template=175994 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-shadow guest-localmigrate
Searching for failure / basis pass:
 176140 fail [host=nobling0] / 175994 [host=pinot0] 175987 [host=nobling1] 175965 [host=albana1] 175734 [host=huxelrebe1] 175726 [host=debina1] 175720 [host=huxelrebe0] 175714 [host=debina0] 175694 [host=pinot1] 175671 [host=elbling1] 175651 [host=elbling0] 175635 [host=albana0] 175624 [host=nocera1] 175601 [host=nocera0] 175592 [host=fiano1] 175573 [host=nobling1] 175569 [host=albana1] 175562 ok.
Failure / basis pass flights: 176140 / 175562
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 3b760245f74ab2022b1aa4da842c4545228c2e83
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#1cf02b05b27c48775a25699e61b93b8\
 14b9ae042-625eb5e96dc96aa7fddef59a08edae215527f19c git://xenbits.xen.org/xen.git#7eef80e06ed2282bbcec3619d860c6aacb0515d8-3b760245f74ab2022b1aa4da842c4545228c2e83
Loaded 10003 nodes in revision graph
Searching for test results:
 175592 [host=fiano1]
 175601 [host=nocera0]
 175612 [host=nocera1]
 175624 [host=nocera1]
 175635 [host=albana0]
 175651 [host=elbling0]
 175671 [host=elbling1]
 175694 [host=pinot1]
 175714 [host=debina0]
 175720 [host=huxelrebe0]
 175726 [host=debina1]
 175734 [host=huxelrebe1]
 175834 []
 175861 []
 175890 []
 175907 []
 175931 []
 175956 []
 175965 [host=albana1]
 175987 [host=nobling1]
 175994 [host=pinot0]
 176003 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 176011 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176025 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176035 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176042 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176048 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176056 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176062 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176076 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c d60324d8af9404014cfcc37bba09e9facfd02fcf
 176091 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c d60324d8af9404014cfcc37bba09e9facfd02fcf
 176110 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 352c89f72ddb67b8d9d4e492203f8c77f85c8df1
 176121 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 3b760245f74ab2022b1aa4da842c4545228c2e83
 176132 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 3b760245f74ab2022b1aa4da842c4545228c2e83
 176140 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 3b760245f74ab2022b1aa4da842c4545228c2e83
 176229 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
 176231 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 3b760245f74ab2022b1aa4da842c4545228c2e83
 176234 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 3edca52ce736297d7fcf293860cd94ef62638052
 176235 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 38525f6f73f906699f77a1af86c16b4eaad48e04
 176236 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d4994ac79ed96550f8e8c9a682d468e83db4dfe
 176237 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 83d9679db057d5736c7b5a56db06bb6bb66c3914
 176239 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d99732f2b092173d8600fa818aee3fa51046bb0
 176243 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 661489874e87c0f6e21ac298b039aab9379f6ee0
 176244 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176246 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176247 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176249 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176253 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176254 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176255 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176257 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 175517 [host=huxelrebe0]
 175520 [host=italia0]
 175526 [host=pinot0]
 175534 [host=pinot0]
 175541 [host=italia1]
 175554 [host=fiano0]
 175562 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8
 175569 [host=albana1]
 175573 [host=nobling1]
Searching for interesting versions
 Result found: flight 175562 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f, results HASH(0x562d9d2f4e88) HASH(0x562d9d2f80b8) HASH(0x562d9d2fbc48) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96\
 dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x562d9d2efbf0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 3edca52ce736297d7fcf293860cd94ef62638052, results HASH(0x562d9d2d9998) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 661489874e87c0f6e21ac298b039aab9379f6ee0, results HASH(0x562d9d2ee9c8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 83d9679db057d5736c7b5a56db06bb6bb66c3914, results HASH(0x562d9d2e7e40) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 38525f6f73f906699f77a1af86c16b4eaad48e04, results HASH(0x562d9d2cb1b8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 7eef80e06ed2282bbcec3619d860c6aacb0515d8, results HASH(0x562d9d2e0c0\
 0) HASH(0x562d9d2fee78) Result found: flight 176003 (fail), for basis failure (at ancestor ~1002)
 Repro found: flight 176229 (pass), for basis pass
 Repro found: flight 176231 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
No revisions left to test, checking graph state.
 Result found: flight 176247 (pass), for last pass
 Result found: flight 176249 (fail), for first failure
 Repro found: flight 176253 (pass), for last pass
 Repro found: flight 176254 (fail), for first failure
 Repro found: flight 176255 (pass), for last pass
 Repro found: flight 176257 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176257/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-localmigrate.{dot,ps,png,html,svg}.
----------------------------------------
176257: tolerable ALL FAIL

flight 176257 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/176257/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-shadow    18 guest-localmigrate      fail baseline untested


jobs:
 test-amd64-i386-xl-shadow                                    fail    


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


