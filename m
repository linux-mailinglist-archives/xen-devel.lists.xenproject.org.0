Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CD3B5504
	for <lists+xen-devel@lfdr.de>; Sun, 27 Jun 2021 21:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147692.272507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxaXT-0001aB-08; Sun, 27 Jun 2021 19:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147692.272507; Sun, 27 Jun 2021 19:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxaXS-0001XW-QB; Sun, 27 Jun 2021 19:33:54 +0000
Received: by outflank-mailman (input) for mailman id 147692;
 Sun, 27 Jun 2021 19:33:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxaXR-0001XM-OS; Sun, 27 Jun 2021 19:33:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxaXR-00060M-F7; Sun, 27 Jun 2021 19:33:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxaXR-0004ij-6S; Sun, 27 Jun 2021 19:33:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lxaXR-0004Ui-61; Sun, 27 Jun 2021 19:33:53 +0000
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
	bh=7undsRYXY+nBMS+/G7GvkBNEqt2ZSI9WptvK+FGXtss=; b=joat+NW5ZgYb14oAzMzawM3Nda
	3rSb1O2mcdvSBF6HktdSxxcS68VX8Oajb5IMPTEbBRMwMQQui7E68PJMUJsf5lGrLivWOmhcB+W8b
	qNnlGU5bFKVk2foD6OQ2cmH1hR40lSQfwRg+0IaHCQ809s6PiqW3Q090K3+6R5tpZhhA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-nested-intel
Message-Id: <E1lxaXR-0004Ui-61@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Jun 2021 19:33:53 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163155/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.xen-boot--l1.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.xen-boot--l1 --summary-out=tmp/163155.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-qemuu-nested-intel xen-boot/l1
Searching for failure / basis pass:
 163142 fail [host=fiano1] / 163007 ok.
Failure / basis pass flights: 163142 / 163007
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#b22726abdfa54592d6ad88f65b0297c0e8b363e2-e3955ae93f5151ad2e982440b7c8d3776a9afee2 git://xenbits.xen.org/osstest/seabios.git#e3c30795823672eec9bde75187e184f23ed98d70-e3c30795823672eec9bde75187e184f23ed98d70 git://xenbits.xen.org/xen.git#5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1-bb11edcec1a953ce590da797b0d005cd60f21e83
Loaded 39943 nodes in revision graph
Searching for test results:
 162996 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163007 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163017 fail irrelevant
 163024 fail irrelevant
 163066 fail irrelevant
 163110 fail irrelevant
 163125 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163127 fail irrelevant
 163129 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e0da9171e02f4534124b9a9e07333382b38376c6 e3c30795823672eec9bde75187e184f23ed98d70 e87d8f60fa9b6eaa6a2357545a96e4fff05dbef0
 163131 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 6d622f3a96bbd76ce8422c6e3805e6609417ec76
 163133 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 45f59ed8865318bb0356954bad067f329677ce9e
 163135 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 4f1858763b7b1aeb79fa7c818eca98c96943aa69
 163137 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 f3f778c81769075ac0eb93b98d4b2803e7936453
 163128 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 f591755823a7e94fc6b4b8ddce71f0421a94fa09
 163138 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 163f47c14737cfa9dfb3240deea356b08caf7614
 163141 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 163144 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 f591755823a7e94fc6b4b8ddce71f0421a94fa09
 163142 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163146 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163148 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
 163151 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163152 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
 163153 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
 163155 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 d5f54009dba11d04bfe2a28eee47b994de66b84a
Searching for interesting versions
 Result found: flight 162996 (pass), for basis pass
 Result found: flight 163128 (fail), for basis failure (at ancestor ~2)
 Repro found: flight 163141 (pass), for basis pass
 Repro found: flight 163142 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22726abdfa54592d6ad88f65b0297c0e8b363e2 e3c30795823672eec9bde75187e184f23ed98d70 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
No revisions left to test, checking graph state.
 Result found: flight 163146 (pass), for last pass
 Result found: flight 163148 (fail), for first failure
 Repro found: flight 163151 (pass), for last pass
 Repro found: flight 163152 (fail), for first failure
 Repro found: flight 163153 (pass), for last pass
 Repro found: flight 163155 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d5f54009dba11d04bfe2a28eee47b994de66b84a
  Bug not present: 8c9ed863738ff9e8b91975d6aa4464e7e8324eb7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163155/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.xen-boot--l1.{dot,ps,png,html,svg}.
----------------------------------------
163155: tolerable ALL FAIL

flight 163155 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163155/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 16 xen-boot/l1      fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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


