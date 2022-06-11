Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69A547425
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 13:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347193.573427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzz2V-0004hP-DT; Sat, 11 Jun 2022 11:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347193.573427; Sat, 11 Jun 2022 11:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzz2V-0004fc-Ai; Sat, 11 Jun 2022 11:12:23 +0000
Received: by outflank-mailman (input) for mailman id 347193;
 Sat, 11 Jun 2022 11:12:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzz2U-0004fS-2O; Sat, 11 Jun 2022 11:12:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzz2T-00079p-Ur; Sat, 11 Jun 2022 11:12:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzz2T-00018w-Nr; Sat, 11 Jun 2022 11:12:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzz2T-0001aS-NO; Sat, 11 Jun 2022 11:12:21 +0000
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
	bh=7zXcmSKxaE1C0BB4aDmZFJirbJFwUJyaVxAMKYG3ql0=; b=PHbcQ8DEcfI4WHEjzFwe46uUOG
	PJOClf0bmJyHbCkfSv85EwcdmpbKq9SfyX2l37DCmen0QCneGa/J2IxOz7l1UdTfYhKtJIv8SWJ15
	jszumq6HEYJuq1GARfOCf2T0fxXOaSQ7OnL4htT65S296CdgJwsuwga+GsUVWiHhosts=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemut-ws16-amd64
Message-Id: <E1nzz2T-0001aS-NO@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Jun 2022 11:12:21 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-ws16-amd64
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9186e96b199e4f7e52e033b238f9fe869afb69c7
  Bug not present: 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171076/


  commit 9186e96b199e4f7e52e033b238f9fe869afb69c7
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jun 9 14:20:36 2022 +0200
  
      x86/pv: Clean up _get_page_type()
      
      Various fixes for clarity, ahead of making complicated changes.
      
       * Split the overflow check out of the if/else chain for type handling, as
         it's somewhat unrelated.
       * Comment the main if/else chain to explain what is going on.  Adjust one
         ASSERT() and state the bit layout for validate-locked and partial states.
       * Correct the comment about TLB flushing, as it's backwards.  The problem
         case is when writeable mappings are retained to a page becoming read-only,
         as it allows the guest to bypass Xen's safety checks for updates.
       * Reduce the scope of 'y'.  It is an artefact of the cmpxchg loop and not
         valid for use by subsequent logic.  Switch to using ACCESS_ONCE() to treat
         all reads as explicitly volatile.  The only thing preventing the validated
         wait-loop being infinite is the compiler barrier hidden in cpu_relax().
       * Replace one page_get_owner(page) with the already-calculated 'd' already in
         scope.
      
      No functional change.
      
      This is part of XSA-401 / CVE-2022-26362.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: George Dunlap <george.dunlap@eu.citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: George Dunlap <george.dunlap@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot --summary-out=tmp/171076.bisection-summary --basis-template=170890 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemut-ws16-amd64 xen-boot
Searching for failure / basis pass:
 170908 fail [host=huxelrebe1] / 170897 ok.
Failure / basis pass flights: 170908 / 170897
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea235\
 3e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#f3185c165d28901c3222becfc8be547263c53745-c1c9cae3a9633054b177c5de21ad7268162b2f2c
From git://cache:9419/git://xenbits.xen.org/xen
   fe97133b5d..1575075b2e  stable-4.13 -> origin/stable-4.13
Loaded 5001 nodes in revision graph
Searching for test results:
 170890 pass irrelevant
 170897 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170908 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
 170977 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745
 170982 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 c1c9cae3a9633054b177c5de21ad7268162b2f2c
 170988 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 8cc5036bc385112a82f1faff27a0970e6440dfed
 170992 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 79faa321f2f31d7794604007a290fb6c8fc05035
 170994 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
 171000 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9186e96b199e4f7e52e033b238f9fe869afb69c7
 171037 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
 171038 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9186e96b199e4f7e52e033b238f9fe869afb69c7
 171075 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
 171076 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9186e96b199e4f7e52e033b238f9fe869afb69c7
Searching for interesting versions
 Result found: flight 170897 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8, results HASH(0x56336caaef50) HASH(0x56336caaaf18) HASH(0x56336b7c7ef0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311\
 c2d1fd9d2fa9a0768ea2353e8a79b42 79faa321f2f31d7794604007a290fb6c8fc05035, results HASH(0x56336caac4a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f3185c165d28901c3222becfc8be547263c53745, results HASH(0x56336ca961e8) HASH(0x56336ca98218) Result found: flight 170908 (fail), for basis failure (at ancestor ~164)
 Repro found: flight 170977 (pass), for basis pass
 Repro found: flight 170982 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
No revisions left to test, checking graph state.
 Result found: flight 170994 (pass), for last pass
 Result found: flight 171000 (fail), for first failure
 Repro found: flight 171037 (pass), for last pass
 Repro found: flight 171038 (fail), for first failure
 Repro found: flight 171075 (pass), for last pass
 Repro found: flight 171076 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9186e96b199e4f7e52e033b238f9fe869afb69c7
  Bug not present: 59fbdf8a3667ce42c1cf70c94c3bcd0451afd4d8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171076/


  commit 9186e96b199e4f7e52e033b238f9fe869afb69c7
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jun 9 14:20:36 2022 +0200
  
      x86/pv: Clean up _get_page_type()
      
      Various fixes for clarity, ahead of making complicated changes.
      
       * Split the overflow check out of the if/else chain for type handling, as
         it's somewhat unrelated.
       * Comment the main if/else chain to explain what is going on.  Adjust one
         ASSERT() and state the bit layout for validate-locked and partial states.
       * Correct the comment about TLB flushing, as it's backwards.  The problem
         case is when writeable mappings are retained to a page becoming read-only,
         as it allows the guest to bypass Xen's safety checks for updates.
       * Reduce the scope of 'y'.  It is an artefact of the cmpxchg loop and not
         valid for use by subsequent logic.  Switch to using ACCESS_ONCE() to treat
         all reads as explicitly volatile.  The only thing preventing the validated
         wait-loop being infinite is the compiler barrier hidden in cpu_relax().
       * Replace one page_get_owner(page) with the already-calculated 'd' already in
         scope.
      
      No functional change.
      
      This is part of XSA-401 / CVE-2022-26362.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: George Dunlap <george.dunlap@eu.citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
171076: tolerable ALL FAIL

flight 171076 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171076/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-ws16-amd64  8 xen-boot         fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    


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


