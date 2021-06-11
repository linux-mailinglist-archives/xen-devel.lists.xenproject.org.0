Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C256C3A39A1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 04:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140127.258984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrWnP-0003Lq-1M; Fri, 11 Jun 2021 02:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140127.258984; Fri, 11 Jun 2021 02:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrWnO-0003JD-Tz; Fri, 11 Jun 2021 02:21:18 +0000
Received: by outflank-mailman (input) for mailman id 140127;
 Fri, 11 Jun 2021 02:21:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrWnN-0003J3-Bv; Fri, 11 Jun 2021 02:21:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrWnN-00021f-5f; Fri, 11 Jun 2021 02:21:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrWnM-0003YN-Qm; Fri, 11 Jun 2021 02:21:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lrWnM-0003Ul-QG; Fri, 11 Jun 2021 02:21:16 +0000
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
	bh=J5QV4Pd9dGls7qGowo77E1k2MZV/5kOo05iFGgWycxw=; b=Gw9/nZ8djNJu+mfiZkUntMtVqq
	cH2vCejc6iRRD9xko/g6r808oL2J/mKVA+r0JUP9bfpa3K3ZGPexKKoQKXQMyahpLqW9ufOohD7eA
	jD3/9WqBdKv9PqonQMXhEXx2e52OQVGc3PR5sMwnQAYFqIN1SItdUd0wkMi184HIoFpM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1lrWnM-0003Ul-QG@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Jun 2021 02:21:16 +0000

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-4
testid xtf/test-pv32pae-selftest

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Bug not present: 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162627/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest --summary-out=tmp/162627.bisection-summary --basis-template=162533 --blessings=real,real-bisect,real-retry xen-unstable test-xtf-amd64-amd64-4 xtf/test-pv32pae-selftest
Searching for failure / basis pass:
 162556 fail [host=huxelrebe0] / 162533 [host=fiano1] 162475 [host=godello0] 162422 [host=huxelrebe1] 162385 [host=godello1] 162343 [host=albana0] 162337 [host=chardonnay0] 162330 [host=godello1] 162325 [host=albana1] 162282 [host=elbling0] 162276 ok.
Failure / basis pass flights: 162556 / 162276
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e4fee66043120c954fc309bbb37813604c1c0eb7 5ead491e36af6cb8681fc1278bd36c756ad62ac2
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299 5ead491e36af6cb8681fc1278bd36c756ad62ac2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#57f68dfd2d111a2ad381df740543c901b41f2299-e4fee66043120c954fc309bbb37813604c1c0eb7 git://xenbits.xen.org/xtf.git#5ead491e36af6cb8681fc1278bd36c756ad62ac2-5ead491e36af6cb8681fc1278bd36c756ad62ac2
Loaded 5001 nodes in revision graph
Searching for test results:
 162276 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162282 [host=elbling0]
 162325 [host=albana1]
 162330 [host=godello1]
 162337 [host=chardonnay0]
 162343 [host=albana0]
 162385 [host=godello1]
 162422 [host=huxelrebe1]
 162475 [host=godello0]
 162533 [host=fiano1]
 162556 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e4fee66043120c954fc309bbb37813604c1c0eb7 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162601 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162617 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7bd8989ab77b6ade3b7a5f4b640a55248d1791a3 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162611 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e4fee66043120c954fc309bbb37813604c1c0eb7 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162614 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d21121685fac829c988e432407fb0e4ef9b19331 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162615 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 455790573d3bbad6d5a1bb7e9d28b6dd71075693 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162619 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162620 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162622 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162624 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162625 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 5ead491e36af6cb8681fc1278bd36c756ad62ac2
 162627 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 1a0f2fe2297d122a08fee2b26de5de995fdeca13 5ead491e36af6cb8681fc1278bd36c756ad62ac2
Searching for interesting versions
 Result found: flight 162276 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d21121685fac829c988e432407fb0e4ef9b19331 5ead491e36af6cb8681fc1278bd36c756ad62ac2, results HASH(0x560960afdb60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895a\
 f2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 5ead491e36af6cb8681fc1278bd36c756ad62ac2, results HASH(0x560960af9cd0) HASH(0x560960b0ee18) HASH(0x560960b0ade0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 57f68dfd2d111a2ad381df740543c901b41f2299 5ead491e36af6cb8681fc1278bd36c756ad62ac2, results HASH(0x560960af\
 5398) HASH(0x560960aeb160) Result found: flight 162556 (fail), for basis failure (at ancestor ~500)
 Repro found: flight 162601 (pass), for basis pass
 Repro found: flight 162611 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 5ead491e36af6cb8681fc1278bd36c756ad62ac2
No revisions left to test, checking graph state.
 Result found: flight 162619 (pass), for last pass
 Result found: flight 162620 (fail), for first failure
 Repro found: flight 162622 (pass), for last pass
 Repro found: flight 162624 (fail), for first failure
 Repro found: flight 162625 (pass), for last pass
 Repro found: flight 162627 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  1a0f2fe2297d122a08fee2b26de5de995fdeca13
  Bug not present: 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162627/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest.{dot,ps,png,html,svg}.
----------------------------------------
162627: tolerable all pass

flight 162627 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162627/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-4     19 xtf/test-pv32pae-selftest fail baseline untested


jobs:
 test-xtf-amd64-amd64-4                                       pass    


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


