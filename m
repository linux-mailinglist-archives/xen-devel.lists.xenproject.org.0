Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0D676A6A
	for <lists+xen-devel@lfdr.de>; Sun, 22 Jan 2023 01:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482419.747921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJNyI-0005gQ-KN; Sun, 22 Jan 2023 00:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482419.747921; Sun, 22 Jan 2023 00:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJNyI-0005ef-HJ; Sun, 22 Jan 2023 00:12:30 +0000
Received: by outflank-mailman (input) for mailman id 482419;
 Sun, 22 Jan 2023 00:12:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJNyG-0005eV-SE; Sun, 22 Jan 2023 00:12:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJNyG-0007Te-Of; Sun, 22 Jan 2023 00:12:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pJNyG-0002ag-8j; Sun, 22 Jan 2023 00:12:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pJNyG-0008P9-8G; Sun, 22 Jan 2023 00:12:28 +0000
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
	bh=k1Hk4HTHPSQ/y1S+zF30lIaoR8gixA4ov6znyXIKDUQ=; b=7GYp9ThLVv6ltIbpiMcilVy16g
	ZpTQeTuNd1zaH4QgB/H9PXmJtolpUWoXBNbpGueZrOT2wEXXWVrPEWsyeksvvAG/LWFQT4n4quvyc
	5rsH31MDr5eFXttg5fV+Ib6RnJWtmCEPRjb3M7bmDl2ZEvDyxXQNKg0IQdIK8hFQsI7s=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-coresched-i386-xl
Message-Id: <E1pJNyG-0008P9-8G@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Jan 2023 00:12:28 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-coresched-i386-xl
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176032/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-coresched-i386-xl.guest-localmigrate.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-coresched-i386-xl.guest-localmigrate --summary-out=tmp/176032.bisection-summary --basis-template=175994 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-coresched-i386-xl guest-localmigrate
Searching for failure / basis pass:
 176011 fail [host=nobling0] / 175994 [host=nobling1] 175987 [host=pinot0] 175965 [host=debina1] 175734 [host=debina0] 175726 [host=debina0] 175720 [host=debina1] 175714 [host=pinot1] 175694 [host=pinot0] 175671 [host=debina0] 175651 [host=nobling1] 175635 [host=debina1] 175624 [host=debina0] 175612 [host=debina0] 175601 [host=nobling1] 175592 [host=pinot0] 175573 ok.
Failure / basis pass flights: 176011 / 175573
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c1df06afe578f698ebe91a1e3817463b9d165123
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#1cf02b05b27c48775a25699e61b93b8\
 14b9ae042-625eb5e96dc96aa7fddef59a08edae215527f19c git://xenbits.xen.org/xen.git#c1df06afe578f698ebe91a1e3817463b9d165123-1d60c20260c7e82fe5344d06c20d718e0cc03b8b
From git://cache:9419/git://xenbits.xen.org/qemu-xen
   fcb7e040f5..65cc5ccf06  upstream-tested -> origin/upstream-tested
Loaded 10003 nodes in revision graph
Searching for test results:
 175592 [host=pinot0]
 175601 [host=nobling1]
 175612 [host=debina0]
 175624 [host=debina0]
 175635 [host=debina1]
 175651 [host=nobling1]
 175671 [host=debina0]
 175694 [host=pinot0]
 175714 [host=pinot1]
 175720 [host=debina1]
 175726 [host=debina0]
 175734 [host=debina0]
 175834 []
 175861 []
 175890 []
 175907 []
 175931 []
 175956 []
 175965 [host=debina1]
 175987 [host=pinot0]
 175994 [host=nobling1]
 176003 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 176012 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c1df06afe578f698ebe91a1e3817463b9d165123
 176013 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 176014 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176015 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c a1a618208bf53469f5e3eaa14202ba777d33f442
 176017 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 686b80c1ae4cc338334eb5df4836df526109377a
 176019 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176011 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176020 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176023 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176024 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176026 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176027 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176028 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176030 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176032 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 175569 [host=nobling1]
 175573 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c1df06afe578f698ebe91a1e3817463b9d165123
Searching for interesting versions
 Result found: flight 175573 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f, results HASH(0x5647c4252b30) HASH(0x5647c426cd30) HASH(0x5647c424e520) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96\
 dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x5647c4265f70) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x5647c4265df0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 c1df06afe578f698ebe91a1e3817463b9d165123, results HASH(0x5647c425e0a8) HASH(0x5647c426d330) Result found: flight 176003 (fail), for basis failure (at ancestor ~988)
 Repro found: flight 176012 (pass), for basis pass
 Repro found: flight 176023 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
No revisions left to test, checking graph state.
 Result found: flight 176024 (pass), for last pass
 Result found: flight 176026 (fail), for first failure
 Repro found: flight 176027 (pass), for last pass
 Repro found: flight 176028 (fail), for first failure
 Repro found: flight 176030 (pass), for last pass
 Repro found: flight 176032 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176032/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-coresched-i386-xl.guest-localmigrate.{dot,ps,png,html,svg}.
----------------------------------------
176032: tolerable ALL FAIL

flight 176032 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/176032/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-coresched-i386-xl 18 guest-localmigrate      fail baseline untested


jobs:
 test-amd64-coresched-i386-xl                                 fail    


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


