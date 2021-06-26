Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2D3B4F76
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jun 2021 18:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147582.272195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxBIi-0002hh-AY; Sat, 26 Jun 2021 16:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147582.272195; Sat, 26 Jun 2021 16:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxBIi-0002fc-6h; Sat, 26 Jun 2021 16:37:00 +0000
Received: by outflank-mailman (input) for mailman id 147582;
 Sat, 26 Jun 2021 16:36:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxBIg-0002fS-3G; Sat, 26 Jun 2021 16:36:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxBIf-00019N-TX; Sat, 26 Jun 2021 16:36:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxBIf-00054k-Gc; Sat, 26 Jun 2021 16:36:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lxBIf-0002WQ-G4; Sat, 26 Jun 2021 16:36:57 +0000
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
	bh=RUCJ/c9TppkcrD0vyXQpRHJvNJwMAI6jjD/gFIU+4xQ=; b=OzYhk9nB/qXJXFNToCHuIsY/kj
	Vi5B31+UGcuZeym7pFyQAbWA1pQkXG8reDQpDAC2IifDa2/iqv7RvX1lGukVIJ5nTTBwitOxRgBjI
	n0YaGDMXwg7wpIMcuJTmNcZI+a7EqW+LVib6nkGGP4adwFup6CarnLLxWJG0/C0YvQiA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-nested-amd
Message-Id: <E1lxBIf-0002WQ-G4@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Jun 2021 16:36:57 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-amd
testid xen-boot/l1

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d5f54009dba11d04bfe2a28eee47b994de66b84a
  Bug not present: 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163123/


  commit d5f54009dba11d04bfe2a28eee47b994de66b84a
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Tue May 11 10:28:03 2021 +0100
  
      libxl: Replace deprecated QMP command by "query-cpus-fast"
      
      We use the deprecated QMP command "query-cpus" which is removed in the
      QEMU 6.0 release. There's a replacement which is "query-cpus-fast",
      and have been available since QEMU 2.12 (April 2018).
      
      This patch try the new command first and when the command isn't
      available, it fall back to the deprecated one so libxl still works
      with older QEMU versions.
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1 --summary-out=tmp/163123.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-qemuu-nested-amd xen-boot/l1
Searching for failure / basis pass:
 163066 fail [host=pinot1] / 163007 ok.
Failure / basis pass flights: 163066 / 163007
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 050cee12315536aba18a73c8dea21116a9c90ffa e3c30795823672eec9bde75187e184f23ed98d70 c7691f5e340f3b579d40c77548f63133cdf5aac7
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#b22726abdfa54592d6ad88f65b0297c0e8b363e2-050cee12315536aba18a73c8dea21116a9c90ffa git://xenbits.xen.org/osstest/seabios.git#e3c30795823672eec9bde75187e184f23ed98d70-e3c30795823672eec9bde75187e184f23ed98d70 git://xenbits.xen.org/xen.git#5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1-c7691f5e340f3b579d40c77548f63133cdf5aac7
Loaded 30169 nodes in revision graph
Searching for test results:
 162996 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163007 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163017 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0ac9a61474cf594d19082bc8976247e984ea9a3 e3c30795823672eec9bde75187e184f23ed98d70 c7691f5e340f3b579d40c77548f63133cdf5aac7
 163025 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163024 [host=pinot0]
 163029 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0ac9a61474cf594d19082bc8976247e984ea9a3 e3c30795823672eec9bde75187e184f23ed98d70 c7691f5e340f3b579d40c77548f63133cdf5aac7
 163034 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d2cad41defe4e0e9987549fbc8ebdf9ae138f90f
 163040 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5d3e4ebb5c71477d74a0c503438545a0126d3863
 163051 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 f3f778c81769075ac0eb93b98d4b2803e7936453
 163060 [host=pinot0]
 163065 [host=pinot0]
 163066 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 050cee12315536aba18a73c8dea21116a9c90ffa e3c30795823672eec9bde75187e184f23ed98d70 c7691f5e340f3b579d40c77548f63133cdf5aac7
 163073 [host=pinot0]
 163082 [host=pinot0]
 163089 [host=pinot0]
 163099 [host=pinot0]
 163105 [host=pinot0]
 163106 [host=pinot0]
 163109 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163112 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 050cee12315536aba18a73c8dea21116a9c90ffa e3c30795823672eec9bde75187e184f23ed98d70 c7691f5e340f3b579d40c77548f63133cdf5aac7
 163113 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 f7079d7ef69f6bf38d6ec3bda294ed5eabcf98ba
 163115 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163117 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
 163118 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163119 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
 163121 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163123 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
Searching for interesting versions
 Result found: flight 162996 (pass), for basis pass
 Result found: flight 163066 (fail), for basis failure
 Repro found: flight 163109 (pass), for basis pass
 Repro found: flight 163112 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
No revisions left to test, checking graph state.
 Result found: flight 163115 (pass), for last pass
 Result found: flight 163117 (fail), for first failure
 Repro found: flight 163118 (pass), for last pass
 Repro found: flight 163119 (fail), for first failure
 Repro found: flight 163121 (pass), for last pass
 Repro found: flight 163123 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d5f54009dba11d04bfe2a28eee47b994de66b84a
  Bug not present: 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163123/


  commit d5f54009dba11d04bfe2a28eee47b994de66b84a
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Tue May 11 10:28:03 2021 +0100
  
      libxl: Replace deprecated QMP command by "query-cpus-fast"
      
      We use the deprecated QMP command "query-cpus" which is removed in the
      QEMU 6.0 release. There's a replacement which is "query-cpus-fast",
      and have been available since QEMU 2.12 (April 2018).
      
      This patch try the new command first and when the command isn't
      available, it fall back to the deprecated one so libxl still works
      with older QEMU versions.
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1.{dot,ps,png,html,svg}.
----------------------------------------
163123: tolerable ALL FAIL

flight 163123 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163123/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 16 xen-boot/l1        fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-amd                            fail    


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


