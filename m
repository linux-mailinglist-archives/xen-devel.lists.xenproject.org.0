Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199C32501E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89722.169266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGKv-0007Hu-97; Thu, 25 Feb 2021 13:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89722.169266; Thu, 25 Feb 2021 13:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGKv-0007HN-3c; Thu, 25 Feb 2021 13:05:45 +0000
Received: by outflank-mailman (input) for mailman id 89722;
 Thu, 25 Feb 2021 13:05:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFGKt-0007HF-4B; Thu, 25 Feb 2021 13:05:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFGKs-0000XD-UY; Thu, 25 Feb 2021 13:05:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFGKs-00058W-Nk; Thu, 25 Feb 2021 13:05:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFGKs-0007BM-NH; Thu, 25 Feb 2021 13:05:42 +0000
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
	bh=DnT6WBDeiKjCYm6K5+xpOV4QsEV2Jfv8USQSytDkQY4=; b=LAk8YiVdzkxceTQ8Hu6DDBszAI
	O5N6CAnskTPKjD5wosaSNNTiTlmzPzASQYmE/P9EgsGw8GMVljy4KcNSUKitgVt/3TvhriJwWOR08
	6hB0XcqFqJO/XcgdQ8xl+z+UqZzmG0vJE5TEr/y1tGUY2Nq+HCgY/Qj6MXpjR1fHtXz0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-3
Message-Id: <E1lFGKs-0007BM-NH@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Feb 2021 13:05:42 +0000

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-3
testid xtf/test-pv32pae-selftest

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159667/


  commit 4dc1815991420b809ce18dddfdf9c0af48944204
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Feb 19 17:19:56 2021 +0100
  
      x86/PV: harden guest memory accesses against speculative abuse
      
      Inspired by
      https://lore.kernel.org/lkml/f12e7d3cecf41b2c29734ea45a393be21d4a8058.1597848273.git.jpoimboe@redhat.com/
      and prior work in that area of x86 Linux, suppress speculation with
      guest specified pointer values by suitably masking the addresses to
      non-canonical space in case they fall into Xen's virtual address range.
      
      Introduce a new Kconfig control.
      
      Note that it is necessary in such code to avoid using "m" kind operands:
      If we didn't, there would be no guarantee that the register passed to
      guest_access_mask_ptr is also the (base) one used for the memory access.
      
      As a minor unrelated change in get_unsafe_asm() the unnecessary "itype"
      parameter gets dropped and the XOR on the fixup path gets changed to be
      a 32-bit one in all cases: This way we avoid pointless REX.W or operand
      size overrides, or writes to partial registers.
      
      Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-3.xtf--test-pv32pae-selftest.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-3.xtf--test-pv32pae-selftest --summary-out=tmp/159667.bisection-summary --basis-template=159475 --blessings=real,real-bisect,real-retry xen-unstable test-xtf-amd64-amd64-3 xtf/test-pv32pae-selftest
Searching for failure / basis pass:
 159626 fail [host=chardonnay0] / 159475 [host=godello1] 159453 [host=fiano0] 159424 [host=albana0] 159396 [host=fiano1] 159362 [host=godello0] 159335 [host=albana0] 159315 [host=huxelrebe1] 159202 ok.
Failure / basis pass flights: 159626 / 159202
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#687121f8a0e7c1ea1c4fa3d056637e5819342f14-5d94433a66df29ce314696a13bdd324ec0e342fe git://xenbits.xen.org/xtf.git#8ab15139728a8efd3ebbb60beb16a958a6a93fa1-8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Loaded 5001 nodes in revision graph
Searching for test results:
 159202 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159315 [host=huxelrebe1]
 159335 [host=albana0]
 159362 [host=godello0]
 159396 [host=fiano1]
 159424 [host=albana0]
 159453 [host=fiano0]
 159475 [host=godello1]
 159487 [host=elbling0]
 159491 [host=chardonnay1]
 159508 [host=godello0]
 159526 [host=elbling1]
 159540 [host=albana1]
 159559 [host=albana0]
 159576 [host=fiano1]
 159602 [host=godello0]
 159626 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159651 [host=godello0]
 159653 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159654 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159655 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7a4133feaf42000923eb9d84badb6b171625f137 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159657 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 a2639824e8458a8f3826e184081a13bfa27ea884 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159659 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6794cdd08ea8b3512c53b8f162cb3f88fef54d0d 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159661 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159664 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159665 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159666 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159667 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Searching for interesting versions
 Result found: flight 159202 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x560b6daca558) HASH(0x560b6daccb88) HASH(0x560b6dac6848) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6794cdd08ea8b3512c53b8f162cb3f88fef54d0d 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x560b6daca3d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7a4133feaf42000923eb9d84badb6b171625f137 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x560b6daa\
 b748) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x560b6dab8e48) HASH(0x560b6daac1c8) Result found: flight 159626 (fail), for basis failure (at ancestor ~77)
 Repro found: flight 159653 (pass), for basis pass
 Repro found: flight 159654 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
No revisions left to test, checking graph state.
 Result found: flight 159661 (pass), for last pass
 Result found: flight 159663 (fail), for first failure
 Repro found: flight 159664 (pass), for last pass
 Repro found: flight 159665 (fail), for first failure
 Repro found: flight 159666 (pass), for last pass
 Repro found: flight 159667 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159667/


  commit 4dc1815991420b809ce18dddfdf9c0af48944204
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Feb 19 17:19:56 2021 +0100
  
      x86/PV: harden guest memory accesses against speculative abuse
      
      Inspired by
      https://lore.kernel.org/lkml/f12e7d3cecf41b2c29734ea45a393be21d4a8058.1597848273.git.jpoimboe@redhat.com/
      and prior work in that area of x86 Linux, suppress speculation with
      guest specified pointer values by suitably masking the addresses to
      non-canonical space in case they fall into Xen's virtual address range.
      
      Introduce a new Kconfig control.
      
      Note that it is necessary in such code to avoid using "m" kind operands:
      If we didn't, there would be no guarantee that the register passed to
      guest_access_mask_ptr is also the (base) one used for the memory access.
      
      As a minor unrelated change in get_unsafe_asm() the unnecessary "itype"
      parameter gets dropped and the XOR on the fixup path gets changed to be
      a 32-bit one in all cases: This way we avoid pointless REX.W or operand
      size overrides, or writes to partial registers.
      
      Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-3.xtf--test-pv32pae-selftest.{dot,ps,png,html,svg}.
----------------------------------------
159667: tolerable all pass

flight 159667 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159667/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-3     19 xtf/test-pv32pae-selftest fail baseline untested


jobs:
 test-xtf-amd64-amd64-3                                       pass    


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


