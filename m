Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476296F58C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 15:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791844.1201855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZBy-00035F-Kq; Fri, 06 Sep 2024 13:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791844.1201855; Fri, 06 Sep 2024 13:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZBy-000314-HW; Fri, 06 Sep 2024 13:40:02 +0000
Received: by outflank-mailman (input) for mailman id 791844;
 Fri, 06 Sep 2024 13:40:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smZBw-0002vo-W7; Fri, 06 Sep 2024 13:40:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smZBw-0003I6-Qp; Fri, 06 Sep 2024 13:40:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smZBw-0003BU-HU; Fri, 06 Sep 2024 13:40:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smZBw-0001Jz-EQ; Fri, 06 Sep 2024 13:40:00 +0000
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
	bh=gn4hY68QUCXOBl8PPzEqgHV/paEq2F+gw/yH8bg14Aw=; b=UbyT4N1o1+zphfGAUDStRQYSik
	oixKUeyvj38xIktBzrNf6RyTUmnnqBJP9YuVxlel3LLR+n4N9RDg1JsfvtDRrmjXTk9+NvjJQMXy0
	zjdkY0AGMlsrHRsNhIX//fuene2FXv6sEGV20V25xG6Vro6TSAhECpZLBmPyUtIUZVsk=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete build-i386
Message-Id: <E1smZBw-0001Jz-EQ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 13:40:00 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
  Bug not present: 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187542/


  commit b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Sep 4 16:06:42 2024 +0200
  
      x86emul: introduce a struct cpu_policy * local in x86_emulate()
      
      While of little effect right here, future patches (AVX10, AMX,
      KeyLocker) will benefit more significantly.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/build-i386.xen-build --summary-out=tmp/187542.bisection-summary --basis-template=187498 --blessings=real,real-bisect,real-retry xen-unstable build-i386 xen-build
Searching for failure / basis pass:
 187507 fail [host=nobling0] / 187498 [host=nobling1] 187488 ok.
Failure / basis pass flights: 187507 / 187488
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 a2de7dc4d845738e734b10fce6550c89c6b1092c
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 57c8f93fc163a4a4a744aa6ee0301222a44bac4f
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#57c8f93fc163a4a4a744aa6ee0301222a44bac4f-a2de7dc4d845738e734b10fce6550c89c6b1092c
Loaded 5001 nodes in revision graph
Searching for test results:
 187488 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 57c8f93fc163a4a4a744aa6ee0301222a44bac4f
 187498 [host=nobling1]
 187507 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 a2de7dc4d845738e734b10fce6550c89c6b1092c
 187531 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 57c8f93fc163a4a4a744aa6ee0301222a44bac4f
 187532 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 a2de7dc4d845738e734b10fce6550c89c6b1092c
 187534 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d7c18b8720824d7efc39ffa7296751e1812865a9
 187535 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
 187537 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
 187538 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
 187539 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
 187540 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
 187541 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
 187542 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
Searching for interesting versions
 Result found: flight 187488 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc, results HASH(0x561149647258) HASH(0x561149645cd0) HASH(0x56114965d720) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d7c18b8720824d7efc39ffa7296751e1812865a9, results HASH(0x56114964db98) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 57c8f93fc163a4a4a744aa6ee0301222a44bac4f, results HASH(0x561149648900) HASH(0x561149648d80) Result found: flight 187507 (fail), for basis failure (at ancestor ~3750)
 Repro found: flight 187531 (pass), for basis pass
 Repro found: flight 187532 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
No revisions left to test, checking graph state.
 Result found: flight 187537 (pass), for last pass
 Result found: flight 187538 (fail), for first failure
 Repro found: flight 187539 (pass), for last pass
 Repro found: flight 187540 (fail), for first failure
 Repro found: flight 187541 (pass), for last pass
 Repro found: flight 187542 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
  Bug not present: 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/187542/


  commit b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Sep 4 16:06:42 2024 +0200
  
      x86emul: introduce a struct cpu_policy * local in x86_emulate()
      
      While of little effect right here, future patches (AVX10, AMX,
      KeyLocker) will benefit more significantly.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
187542: tolerable ALL FAIL

flight 187542 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/187542/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386                    6 xen-build               fail baseline untested


jobs:
 build-i386                                                   fail    


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


