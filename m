Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16E495896
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 04:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259233.447293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAklP-00030V-B8; Fri, 21 Jan 2022 03:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259233.447293; Fri, 21 Jan 2022 03:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAklP-0002xk-7F; Fri, 21 Jan 2022 03:38:59 +0000
Received: by outflank-mailman (input) for mailman id 259233;
 Fri, 21 Jan 2022 03:38:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAklO-0002xY-G7; Fri, 21 Jan 2022 03:38:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAklO-0002EI-Ct; Fri, 21 Jan 2022 03:38:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAklO-0004Uh-3i; Fri, 21 Jan 2022 03:38:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nAklO-0000wM-3M; Fri, 21 Jan 2022 03:38:58 +0000
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
	bh=aFxlimYUiYOO9Cnm+LmL5UhdsLc2B0rzI0GpLAj/hVg=; b=2wY827XTwpzFjdu17o1ReabFaj
	ayE2olAf0ce4s6Q1nEWLRJ+WAjxaEnYUbHuoQoGhZG6Iqo+38e0Fv5FMkjWf2B+EelT+U9Z6TxkT2
	JvZEDmB7eYWrZCO53FAAWRBuaqI+oVrXUWW5SuM7zgVaAIB8qNGzk1zVVv5eMPXkgKsU=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1nAklO-0000wM-3M@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jan 2022 03:38:58 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6536688439dbca1d08fd6db5be29c39e3917fb2f
  Bug not present: 88d3ff7ab15da277a85b39735797293fb541c718
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167778/


  commit 6536688439dbca1d08fd6db5be29c39e3917fb2f
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Wed Jan 12 13:52:47 2022 +0000
  
      x86/msr: Split MSR_SPEC_CTRL handling
      
      In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
      MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
      
      Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
      The SVM path is currently unreachable because of the CPUID policy.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/167778.bisection-summary --basis-template=167761 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 167764 fail [host=himrod2] / 167761 ok.
Failure / basis pass flights: 167764 / 167761
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 0626219dcc6a4376c1a4b04209d6c15d06e23875
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 4e1df69cc9f51b2e017af1da3ed5b45917642115
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#4e1df69cc9f51b2e017af1da3ed5b45917642115-0626219dcc6a4376c1a4b04209d6c15d06e23875
Loaded 5001 nodes in revision graph
Searching for test results:
 167761 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 4e1df69cc9f51b2e017af1da3ed5b45917642115
 167764 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 0626219dcc6a4376c1a4b04209d6c15d06e23875
 167768 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 4e1df69cc9f51b2e017af1da3ed5b45917642115
 167770 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 0626219dcc6a4376c1a4b04209d6c15d06e23875
 167771 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 6536688439dbca1d08fd6db5be29c39e3917fb2f
 167772 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 88d3ff7ab15da277a85b39735797293fb541c718
 167773 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 6536688439dbca1d08fd6db5be29c39e3917fb2f
 167774 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 88d3ff7ab15da277a85b39735797293fb541c718
 167776 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 6536688439dbca1d08fd6db5be29c39e3917fb2f
 167777 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 88d3ff7ab15da277a85b39735797293fb541c718
 167778 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 6536688439dbca1d08fd6db5be29c39e3917fb2f
Searching for interesting versions
 Result found: flight 167761 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 88d3ff7ab15da277a85b39735797293fb541c718, results HASH(0x5577149a3678) HASH(0x5577149a76b0) HASH(0x5577149ab240) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 4e1df69cc9f51b2e017af1da3ed5b45917642115, results HASH(0x5577149985a8) HASH(0x55771499cd38) Result found: flight 167764 (fail), for \
 basis failure (at ancestor ~9)
 Repro found: flight 167768 (pass), for basis pass
 Repro found: flight 167770 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 88d3ff7ab15da277a85b39735797293fb541c718
No revisions left to test, checking graph state.
 Result found: flight 167772 (pass), for last pass
 Result found: flight 167773 (fail), for first failure
 Repro found: flight 167774 (pass), for last pass
 Repro found: flight 167776 (fail), for first failure
 Repro found: flight 167777 (pass), for last pass
 Repro found: flight 167778 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6536688439dbca1d08fd6db5be29c39e3917fb2f
  Bug not present: 88d3ff7ab15da277a85b39735797293fb541c718
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167778/


  commit 6536688439dbca1d08fd6db5be29c39e3917fb2f
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Wed Jan 12 13:52:47 2022 +0000
  
      x86/msr: Split MSR_SPEC_CTRL handling
      
      In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
      MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
      
      Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
      The SVM path is currently unreachable because of the CPUID policy.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
167778: tolerable ALL FAIL

flight 167778 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/167778/

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


