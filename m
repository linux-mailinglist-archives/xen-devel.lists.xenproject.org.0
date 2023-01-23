Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE129678943
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483212.749230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK459-0007cE-7n; Mon, 23 Jan 2023 21:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483212.749230; Mon, 23 Jan 2023 21:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK459-0007a9-2t; Mon, 23 Jan 2023 21:10:23 +0000
Received: by outflank-mailman (input) for mailman id 483212;
 Mon, 23 Jan 2023 21:10:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pK457-0007Zy-1u; Mon, 23 Jan 2023 21:10:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pK456-0003VJ-VP; Mon, 23 Jan 2023 21:10:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pK456-0008UX-Je; Mon, 23 Jan 2023 21:10:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pK456-0006Nj-JB; Mon, 23 Jan 2023 21:10:20 +0000
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
	bh=RHsT7JaQFRtNwu+niMifT0cW09SjemPacgblphRvUcg=; b=uXJx6zlJ9Wp5vLIr+ktA0RRYjQ
	0fhq1KJq5odY1FJwJxQsiQS99ji6mmJN6uKkAssZBvvpDTOfDFV5ydHtqhvzy86l/feOV3I5S10cF
	c2BNt5aMryXdrEduB72QzJg9uxKneTvz6WAfeVXoFSF1ohhFrLP1eORyMKeWKWvQEJqQ=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-xsm
Message-Id: <E1pK456-0006Nj-JB@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Jan 2023 21:10:20 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176075/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-xsm.guest-localmigrate.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-xsm.guest-localmigrate --summary-out=tmp/176075.bisection-summary --basis-template=175994 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-xsm guest-localmigrate
Searching for failure / basis pass:
 176062 fail [host=fiano0] / 175994 [host=elbling0] 175987 [host=fiano1] 175965 [host=elbling1] 175734 [host=debina1] 175726 [host=italia0] 175720 [host=pinot1] 175714 [host=nobling0] 175694 [host=albana1] 175671 [host=nobling1] 175651 [host=debina0] 175635 [host=huxelrebe0] 175624 [host=nocera1] 175612 [host=albana0] 175601 [host=italia0] 175592 ok.
Failure / basis pass flights: 176062 / 175592
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 671f50ffab3329c5497208da89620322b9721a77
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#1cf02b05b27c48775a25699e61b93b8\
 14b9ae042-625eb5e96dc96aa7fddef59a08edae215527f19c git://xenbits.xen.org/xen.git#671f50ffab3329c5497208da89620322b9721a77-1d60c20260c7e82fe5344d06c20d718e0cc03b8b
Loaded 10003 nodes in revision graph
Searching for test results:
 175592 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 671f50ffab3329c5497208da89620322b9721a77
 175601 [host=italia0]
 175612 [host=albana0]
 175624 [host=nocera1]
 175635 [host=huxelrebe0]
 175651 [host=debina0]
 175671 [host=nobling1]
 175694 [host=albana1]
 175714 [host=nobling0]
 175720 [host=pinot1]
 175726 [host=italia0]
 175734 [host=debina1]
 175834 []
 175861 []
 175890 []
 175907 []
 175931 []
 175956 []
 175965 [host=elbling1]
 175987 [host=fiano1]
 175994 [host=elbling0]
 176003 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 176011 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176025 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176035 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176042 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176048 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176055 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 671f50ffab3329c5497208da89620322b9721a77
 176057 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176058 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 176056 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176061 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c a1a618208bf53469f5e3eaa14202ba777d33f442
 176063 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 41dbbfb5966f2517916333d1885ee68018161f48
 176064 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 321b1b5eb351a5836d26817d7db48052e623b411
 176065 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176067 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176062 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 176070 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176071 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
 176074 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
 176075 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 1894049fa283308d5f90446370be1ade7afe8975
Searching for interesting versions
 Result found: flight 175592 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f, results HASH(0x55831ca44980) HASH(0x55831ca597c8) HASH(0x55831c072b98) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96\
 dc96aa7fddef59a08edae215527f19c f588e7b7cb70800533aaa8a2a9d7a4b32d10b363, results HASH(0x55831ca6a5d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 671f50ffab3329c5497208da89620322b9721a77, results HASH(0x55831ca51900) HASH(0x55831ca62a10) Result found: flight 176003 (fail), for basis failure (at ancestor ~988)
 Repro found: flight 176055 (pass), for basis pass
 Repro found: flight 176056 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625eb5e96dc96aa7fddef59a08edae215527f19c 20279afd732371dd2534380d27aa6d1863d82d1f
No revisions left to test, checking graph state.
 Result found: flight 176065 (pass), for last pass
 Result found: flight 176067 (fail), for first failure
 Repro found: flight 176070 (pass), for last pass
 Repro found: flight 176071 (fail), for first failure
 Repro found: flight 176074 (pass), for last pass
 Repro found: flight 176075 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1894049fa283308d5f90446370be1ade7afe8975
  Bug not present: 20279afd732371dd2534380d27aa6d1863d82d1f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/176075/


  commit 1894049fa283308d5f90446370be1ade7afe8975
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 20 09:17:33 2023 +0100
  
      x86/shadow: L2H shadow type is PV32-only
      
      Like for the various HVM-only types, save a little bit of code by suitably
      "masking" this type out when !PV32.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-xsm.guest-localmigrate.{dot,ps,png,html,svg}.
----------------------------------------
176075: tolerable ALL FAIL

flight 176075 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/176075/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-xsm       18 guest-localmigrate      fail baseline untested


jobs:
 test-amd64-i386-xl-xsm                                       fail    


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


