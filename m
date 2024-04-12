Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED588A3487
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 19:13:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704825.1101420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKSX-000747-4Y; Fri, 12 Apr 2024 17:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704825.1101420; Fri, 12 Apr 2024 17:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKSX-00071b-0e; Fri, 12 Apr 2024 17:13:05 +0000
Received: by outflank-mailman (input) for mailman id 704825;
 Fri, 12 Apr 2024 17:13:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvKSV-00071R-Ln; Fri, 12 Apr 2024 17:13:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvKSV-0001CE-IA; Fri, 12 Apr 2024 17:13:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvKSV-0002JK-9q; Fri, 12 Apr 2024 17:13:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvKSV-0001nk-9L; Fri, 12 Apr 2024 17:13:03 +0000
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
	bh=jdBp+Ph9mfAdK6QFSDWGkIKOYh9X5FP6qKTKHY2lO6Y=; b=sQukcoB4w/Pp2jkakQvH/mecBH
	QfS3WArOYgZHUErCjZNQNl5/9hq2Qc3sFpuUHy2NkLwmLjZIcHpWKfnjFtQPN3ty828P9emUZpMXP
	G9MM/punmLDSz40tQEQWTaYVFBoQ/vgS24coHzVyRa0dF/D9Ny3OPJsYNKyK0NARnAOM=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.17-testing bisection] complete test-amd64-amd64-xl-qcow2
Message-Id: <E1rvKSV-0001nk-9L@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Apr 2024 17:13:03 +0000

branch xen-4.17-testing
xenbranch xen-4.17-testing
job test-amd64-amd64-xl-qcow2
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  19887194865cff7d87650c323d5c6b185dfe3ddc
  Bug not present: b8f39fd4d024ea72c586f1afd233f379c6f6230b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185382/


  commit 19887194865cff7d87650c323d5c6b185dfe3ddc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-qcow2.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-qcow2.debian-di-install --summary-out=tmp/185382.bisection-summary --basis-template=185284 --blessings=real,real-bisect,real-retry xen-4.17-testing test-amd64-amd64-xl-qcow2 debian-di-install
Searching for failure / basis pass:
 185300 fail [host=rimava1] / 185284 [host=fiano1] 185217 [host=fiano0] 185180 [host=elbling0] 185171 [host=rimava0] 185012 [host=himrod0] 185002 [host=debina0] 184909 [host=pinot0] 184838 ok.
Failure / basis pass flights: 185300 / 184838
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 d530627aaa9b6e03c7f911434bb342fca3d13300
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 82faf1d5c8b25375b9029f2d6668135e62455a8c 6cbccc4071ef49a8c591ecaddfdcb1cc26d28411
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-347385861c50adc8d4801d4b899eded38a2f04cd git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8-963671d3801a6992d1aa06f05d86e32efa6b205e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ffb451126550b22b43b62fb8731a0d78e3376c03-ffb451126550b22b43b62fb8731a0d78e3376c03 git://xenbits.xen.org/osstest/seabios.git#82faf1d5c8b25375b9029f2d6668135e62455a8c-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#6cbccc4071ef49a8c591ecaddfdcb1cc26d28411-d530627aaa9b6e03c7f911434bb342fca3d13300
adhoc-revtuple-generator: tree discontiguous: linux-pvops
Loaded 12695 nodes in revision graph
Searching for test results:
 184838 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 82faf1d5c8b25375b9029f2d6668135e62455a8c 6cbccc4071ef49a8c591ecaddfdcb1cc26d28411
 184909 [host=pinot0]
 185002 [host=debina0]
 185012 [host=himrod0]
 185180 [host=elbling0]
 185171 [host=rimava0]
 185217 [host=fiano0]
 185284 [host=fiano1]
 185300 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 d530627aaa9b6e03c7f911434bb342fca3d13300
 185319 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 82faf1d5c8b25375b9029f2d6668135e62455a8c 6cbccc4071ef49a8c591ecaddfdcb1cc26d28411
 185321 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 d530627aaa9b6e03c7f911434bb342fca3d13300
 185327 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 f38a815a54000ca51ff5165b2863d60b6bbea49c
 185329 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 185334 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 a0bd738f9cd158306e046c7a6f3726128219e4eb
 185338 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 aed8192f578fb02111f57eca0868c2262ada1341
 185344 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185353 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 653560e02d40c480d08032f3cf1e450db79f5d71
 185358 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
 185371 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185373 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
 185379 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185382 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
Searching for interesting versions
 Result found: flight 184838 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b, results HASH(0x55ac98d14e58) HASH(0x55ac98d129d0) HASH(0x55ac98d11da8) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a, results HASH(0x55ac98d098e0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8\
 731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 f38a815a54000ca51ff5165b2863d60b6bbea49c, results HASH(0x55ac98d068e8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 82faf1d5c8b25375b9029f2d6668135e62455a8c 6cbccc4071ef49a8c591ecaddfdcb1cc26d28411, results HASH(0x55ac98cf5958) HASH(0x55\
 ac98cef318) Result found: flight 185300 (fail), for basis failure (at ancestor ~1229)
 Repro found: flight 185319 (pass), for basis pass
 Repro found: flight 185321 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
No revisions left to test, checking graph state.
 Result found: flight 185344 (pass), for last pass
 Result found: flight 185358 (fail), for first failure
 Repro found: flight 185371 (pass), for last pass
 Repro found: flight 185373 (fail), for first failure
 Repro found: flight 185379 (pass), for last pass
 Repro found: flight 185382 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  19887194865cff7d87650c323d5c6b185dfe3ddc
  Bug not present: b8f39fd4d024ea72c586f1afd233f379c6f6230b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185382/


  commit 19887194865cff7d87650c323d5c6b185dfe3ddc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

pnmtopng: 212 colors found
Revision graph left in /home/logs/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-qcow2.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
185382: tolerable ALL FAIL

flight 185382 xen-4.17-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185382/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    12 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-xl-qcow2                                    fail    


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


