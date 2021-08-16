Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95D3EE065
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 01:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167525.305811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFlwn-0005Fd-8z; Mon, 16 Aug 2021 23:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167525.305811; Mon, 16 Aug 2021 23:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFlwn-0005D1-55; Mon, 16 Aug 2021 23:23:13 +0000
Received: by outflank-mailman (input) for mailman id 167525;
 Mon, 16 Aug 2021 23:23:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFlwm-0005Cr-6U; Mon, 16 Aug 2021 23:23:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFlwl-0008MQ-RP; Mon, 16 Aug 2021 23:23:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFlwl-00025z-Js; Mon, 16 Aug 2021 23:23:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mFlwl-0006Js-JN; Mon, 16 Aug 2021 23:23:11 +0000
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
	bh=+ugavvksN2ml2fZpKGcsUGpTanGkaV0NSkZqEVh+QIM=; b=PXN7HYswyfUwUSvocfdxV6IMgv
	1n9Dag23zrcoRIrTW4kNwqqEpjJnA/AOSTn82CxPkfvM4lvZ9UcVallBQsqMMbHoQO2acFHFmbEeS
	eavjRdKI4ap6gUM7TyM1OgHX2njjDB834AeTqnc13VEzTVzw970OYeRMr4i7WhcJ3gLo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1mFlwl-0006Js-JN@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Aug 2021 23:23:11 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  35727551c0703493a2240e967cffc3063b13d49c
  Bug not present: bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164220/


  commit 35727551c0703493a2240e967cffc3063b13d49c
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Aug 12 17:39:16 2021 +0100
  
      x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}
      
      This was a clear oversight in the original CET work.  The BUGFRAME_run_fn and
      BUGFRAME_warn paths update regs->rip without an equivalent adjustment to the
      shadow stack, causing IRET to suffer #CP because of the mismatch.
      
      One subtle, and therefore fragile, aspect of extable_shstk_fixup() was that it
      required regs->rip to have its old value as a cross-check that the right word
      in the shadow stack was being edited.
      
      Rework extable_shstk_fixup() into fixup_exception_return() which takes
      ownership of the update to both the regular and shadow stacks, ensuring that
      the regs->rip update is ordered correctly.
      
      Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_warn to
      ensure that the shadow stack is updated too.
      
      Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow stack compatible")
      Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/164220.bisection-summary --basis-template=164206 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 164207 fail [host=himrod1] / 164206 ok.
Failure / basis pass flights: 164207 / 164206
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 274c5e79c792ce0331d0d8cd9a01545dea5a48fd
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#274c5e79c792ce0331d0d8cd9a01545dea5a48fd-35727551c0703493a2240e967cffc3063b13d49c
Loaded 5001 nodes in revision graph
Searching for test results:
 164206 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 274c5e79c792ce0331d0d8cd9a01545dea5a48fd
 164207 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
 164209 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 274c5e79c792ce0331d0d8cd9a01545dea5a48fd
 164210 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
 164212 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6928bc511399fd8f593fe49a3241212860a6a1b5
 164213 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
 164215 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
 164216 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
 164217 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
 164218 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
 164220 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 35727551c0703493a2240e967cffc3063b13d49c
Searching for interesting versions
 Result found: flight 164206 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b, results HASH(0x5562743e7900) HASH(0x5562743ea830) HASH(0x556273169110) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6928bc511399fd8f593fe49a3241212860a6a1b5, results HASH(0x5562743e58f8) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 274c5e79c792ce0331d0d8cd9a01545dea5a48fd, results HASH(0x5562743dcb08) HASH(0x5562743d37d0) Result found: flight 164207 (fail), for basis failure (at ancestor ~673)
 Repro found: flight 164209 (pass), for basis pass
 Repro found: flight 164210 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
No revisions left to test, checking graph state.
 Result found: flight 164213 (pass), for last pass
 Result found: flight 164215 (fail), for first failure
 Repro found: flight 164216 (pass), for last pass
 Repro found: flight 164217 (fail), for first failure
 Repro found: flight 164218 (pass), for last pass
 Repro found: flight 164220 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  35727551c0703493a2240e967cffc3063b13d49c
  Bug not present: bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164220/


  commit 35727551c0703493a2240e967cffc3063b13d49c
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Aug 12 17:39:16 2021 +0100
  
      x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}
      
      This was a clear oversight in the original CET work.  The BUGFRAME_run_fn and
      BUGFRAME_warn paths update regs->rip without an equivalent adjustment to the
      shadow stack, causing IRET to suffer #CP because of the mismatch.
      
      One subtle, and therefore fragile, aspect of extable_shstk_fixup() was that it
      required regs->rip to have its old value as a cross-check that the right word
      in the shadow stack was being edited.
      
      Rework extable_shstk_fixup() into fixup_exception_return() which takes
      ownership of the update to both the regular and shadow stacks, ensuring that
      the regs->rip update is ordered correctly.
      
      Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_warn to
      ensure that the shadow stack is updated too.
      
      Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow stack compatible")
      Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164220: tolerable ALL FAIL

flight 164220 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164220/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


