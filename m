Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FF3A4826
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 19:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140608.259754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrlN6-0003FV-Eg; Fri, 11 Jun 2021 17:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140608.259754; Fri, 11 Jun 2021 17:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrlN6-0003DV-BU; Fri, 11 Jun 2021 17:55:08 +0000
Received: by outflank-mailman (input) for mailman id 140608;
 Fri, 11 Jun 2021 17:55:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrlN4-0003DL-0F; Fri, 11 Jun 2021 17:55:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrlN3-00031b-SH; Fri, 11 Jun 2021 17:55:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrlN3-0001da-Kx; Fri, 11 Jun 2021 17:55:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lrlN3-0003hS-KQ; Fri, 11 Jun 2021 17:55:05 +0000
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
	bh=BVGZEIFyMa4IJlFRs1jPazcuZplxJwd9UCya3u2/xLM=; b=J5elnF6RcPlwqldhq6hSdViRX3
	jEDvTosJyf4BXsNIrubiJJ0VoH5lUtaG0zNzpGu4BJqCnw3eP0TYOWKceU/4aomPXnRB5VVPtxLD1
	6eyq8WoP6H72mZqVqxanmcuMZxJec6VvaZXuRz/hSh634SUF/WUtI55i0bWZH//63I6M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-examine
Message-Id: <E1lrlN3-0003hS-KQ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Jun 2021 17:55:05 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-examine
testid reboot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Bug not present: 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162653/


  commit 1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Author: George Dunlap <george.dunlap@citrix.com>
  Date:   Thu May 6 13:38:02 2021 +0100
  
      SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
      
      The support status of 32-bit guests doesn't seem particularly useful.
      
      With it changed to fully unsupported outside of PV-shim, adjust the PV32
      Kconfig default accordingly.
      
      Reported-by: Jann Horn <jannh@google.com>
      Signed-off-by: George Dunlap <george.dunlap@citrix.com>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-examine.reboot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-examine.reboot --summary-out=tmp/162653.bisection-summary --basis-template=162533 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-examine reboot
Searching for failure / basis pass:
 162600 fail [host=huxelrebe1] / 162533 [host=albana1] 162475 [host=elbling0] 162422 [host=chardonnay0] 162385 [host=fiano1] 162343 [host=huxelrebe0] 162337 [host=elbling0] 162330 [host=chardonnay1] 162325 [host=pinot1] 162282 ok.
Failure / basis pass flights: 162600 / 162282
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3e09045991cde360432bc7437103f8f8a6699359
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#57f68dfd2d111a2ad381df740543c901b41f2299-3e09045991cde360432bc7437103f8f8a6699359
Loaded 5001 nodes in revision graph
Searching for test results:
 162276 [host=elbling1]
 162282 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299
 162325 [host=pinot1]
 162330 [host=chardonnay1]
 162337 [host=elbling0]
 162343 [host=huxelrebe0]
 162385 [host=fiano1]
 162422 [host=chardonnay0]
 162475 [host=elbling0]
 162533 [host=albana1]
 162556 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e4fee66043120c954fc309bbb37813604c1c0eb7
 162649 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13
 162629 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299
 162600 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3e09045991cde360432bc7437103f8f8a6699359
 162631 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e4fee66043120c954fc309bbb37813604c1c0eb7
 162635 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 3e09045991cde360432bc7437103f8f8a6699359
 162638 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d21121685fac829c988e432407fb0e4ef9b19331
 162639 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 455790573d3bbad6d5a1bb7e9d28b6dd71075693
 162641 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7bd8989ab77b6ade3b7a5f4b640a55248d1791a3
 162644 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13
 162648 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162651 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162653 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13
Searching for interesting versions
 Result found: flight 162282 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d21121685fac829c988e432407fb0e4ef9b19331, results HASH(0x55a1e988f0c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7\
 e5342c8a51ceb4bed3e7740c69f5c1, results HASH(0x55a1e988cc10) HASH(0x55a1e987bb00) HASH(0x55a1e99103d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299, results HASH(0x55a1e987d388) HASH(0x55a1e9885fd0) Result found: flight 162556 (fail), for basis failure (at ancestor ~504)
 Repro found: flight 162629 (pass), for basis pass
 Repro found: flight 162635 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
No revisions left to test, checking graph state.
 Result found: flight 162644 (pass), for last pass
 Result found: flight 162645 (fail), for first failure
 Repro found: flight 162648 (pass), for last pass
 Repro found: flight 162649 (fail), for first failure
 Repro found: flight 162651 (pass), for last pass
 Repro found: flight 162653 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Bug not present: 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162653/


  commit 1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Author: George Dunlap <george.dunlap@citrix.com>
  Date:   Thu May 6 13:38:02 2021 +0100
  
      SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
      
      The support status of 32-bit guests doesn't seem particularly useful.
      
      With it changed to fully unsupported outside of PV-shim, adjust the PV32
      Kconfig default accordingly.
      
      Reported-by: Jann Horn <jannh@google.com>
      Signed-off-by: George Dunlap <george.dunlap@citrix.com>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-examine.reboot.{dot,ps,png,html,svg}.
----------------------------------------
162653: tolerable ALL FAIL

flight 162653 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162653/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-examine       8 reboot                  fail baseline untested


jobs:
 test-amd64-i386-examine                                      fail    


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


