Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E4432E6D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212735.370721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcikX-0006UB-Eg; Tue, 19 Oct 2021 06:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212735.370721; Tue, 19 Oct 2021 06:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcikX-0006SQ-Am; Tue, 19 Oct 2021 06:37:25 +0000
Received: by outflank-mailman (input) for mailman id 212735;
 Tue, 19 Oct 2021 06:37:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcikW-0006SG-61; Tue, 19 Oct 2021 06:37:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcikW-0001VD-1C; Tue, 19 Oct 2021 06:37:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcikV-00071A-Qh; Tue, 19 Oct 2021 06:37:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcikV-0001GC-QD; Tue, 19 Oct 2021 06:37:23 +0000
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
	bh=NYkYaWXV1kOjPrHpgAV6zSnNbtkkC8K+peaLwfuFu7c=; b=fMiYSBVo5mvd7XH4C72mL+ZrFP
	RvTz3pGHROf5M4c1D3NP56pe9WaKogRNVf2I2Hw1cP0weO/tZrlvTDLGZ3qzoZVO86zEcwzfgSnqX
	GTR6JotVrxsyUbDEyt+mTjZwzOZSd2CZAgMeqz/tw66vmtpl5agX7BcdI8MpB5MKBkjE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-amd64-amd64-xl-qemuu-debianhvm-amd64
Message-Id: <E1mcikV-0001GC-QD@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Oct 2021 06:37:23 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-amd64-amd64-xl-qemuu-debianhvm-amd64
testid leak-check/basis(11)

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f282182af32939107d47943aba242d3189ec6f90
  Bug not present: c11b8d25fbe9c0155e91409594ea6701008409ed
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165662/


  commit f282182af32939107d47943aba242d3189ec6f90
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Oct 12 15:41:47 2021 +0200
  
      tools/xenstore: set oom score for xenstore daemon on Linux
      
      Xenstored is absolutely mandatory for a Xen host and it can't be
      restarted, so being killed by OOM-killer in case of memory shortage is
      to be avoided.
      
      Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
      translates to 50% of dom0 memory size) in order to allow xenstored to
      use large amounts of memory without being killed.
      
      The percentage of dom0 memory above which the oom killer is allowed to
      kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
      xencommons.
      
      Make sure the pid file isn't a left-over from a previous run delete it
      before starting xenstored.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-amd64-amd64-xl-qemuu-debianhvm-amd64.leak-check--basis(11).html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step '--graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-xl-qemuu-debianhvm-amd64.leak-check--basis(11)' --summary-out=tmp/165662.bisection-summary --basis-template=165635 --blessings=real,real-bisect,real-retry xen-unstable-smoke test-amd64-amd64-xl-qemuu-debianhvm-amd64 'leak-check/basis(11)'
Searching for failure / basis pass:
 165651 fail [host=godello0] / 165635 [host=pinot0] 165530 [host=elbling1] 165527 ok.
Failure / basis pass flights: 165651 / 165527
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 3ae80dea4601764818d1e5b84bd1e4479c0d4790
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f791392f82ffe39cc1ea4c4db1d877223754a04a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b6e539830bf45e2d7a6bd86ddfdf003\
 088b173b0-b6e539830bf45e2d7a6bd86ddfdf003088b173b0 git://xenbits.xen.org/xen.git#f791392f82ffe39cc1ea4c4db1d877223754a04a-3ae80dea4601764818d1e5b84bd1e4479c0d4790
Loaded 5001 nodes in revision graph
Searching for test results:
 165527 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f791392f82ffe39cc1ea4c4db1d877223754a04a
 165530 [host=elbling1]
 165635 [host=pinot0]
 165638 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165641 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f791392f82ffe39cc1ea4c4db1d877223754a04a
 165644 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165645 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 52d0847d7c6972baa74156f14ee8544f5aba1d2d
 165646 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 c11b8d25fbe9c0155e91409594ea6701008409ed
 165647 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f282182af32939107d47943aba242d3189ec6f90
 165648 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 c11b8d25fbe9c0155e91409594ea6701008409ed
 165642 [host=chardonnay0]
 165649 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f282182af32939107d47943aba242d3189ec6f90
 165650 [host=chardonnay0]
 165653 [host=chardonnay0]
 165655 [host=chardonnay0]
 165656 [host=chardonnay0]
 165651 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 3ae80dea4601764818d1e5b84bd1e4479c0d4790
 165659 [host=chardonnay0]
 165660 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 c11b8d25fbe9c0155e91409594ea6701008409ed
 165662 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f282182af32939107d47943aba242d3189ec6f90
Searching for interesting versions
 Result found: flight 165527 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 c11b8d25fbe9c0155e91409594ea6701008409ed, results HASH(0x564bc7595060) HASH(0x564bc75a4168) HASH(0x564bc75931d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830\
 bf45e2d7a6bd86ddfdf003088b173b0 52d0847d7c6972baa74156f14ee8544f5aba1d2d, results HASH(0x564bc7598770) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 f791392f82ffe39cc1ea4c4db1d877223754a04a, results HASH(0x564bc75945e0) HASH(0x564bc759b520) Result found: flight 165638 (fail), for basis failure (at ancestor ~90)
 Repro found: flight 165641 (pass), for basis pass
 Repro found: flight 165644 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 c11b8d25fbe9c0155e91409594ea6701008409ed
No revisions left to test, checking graph state.
 Result found: flight 165646 (pass), for last pass
 Result found: flight 165647 (fail), for first failure
 Repro found: flight 165648 (pass), for last pass
 Repro found: flight 165649 (fail), for first failure
 Repro found: flight 165660 (pass), for last pass
 Repro found: flight 165662 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f282182af32939107d47943aba242d3189ec6f90
  Bug not present: c11b8d25fbe9c0155e91409594ea6701008409ed
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/165662/


  commit f282182af32939107d47943aba242d3189ec6f90
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Oct 12 15:41:47 2021 +0200
  
      tools/xenstore: set oom score for xenstore daemon on Linux
      
      Xenstored is absolutely mandatory for a Xen host and it can't be
      restarted, so being killed by OOM-killer in case of memory shortage is
      to be avoided.
      
      Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
      translates to 50% of dom0 memory size) in order to allow xenstored to
      use large amounts of memory without being killed.
      
      The percentage of dom0 memory above which the oom killer is allowed to
      kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
      xencommons.
      
      Make sure the pid file isn't a left-over from a previous run delete it
      before starting xenstored.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-xl-qemuu-debianhvm-amd64.leak-check--basis(11).{dot,ps,png,html,svg}.
----------------------------------------
165662: tolerable ALL FAIL

flight 165662 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/165662/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 11 leak-check/basis(11) fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    


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


