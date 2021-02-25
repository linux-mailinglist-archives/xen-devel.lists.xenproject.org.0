Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE94325A2B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 00:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90006.170149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFQ2I-0000wI-3n; Thu, 25 Feb 2021 23:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90006.170149; Thu, 25 Feb 2021 23:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFQ2H-0000vr-Uo; Thu, 25 Feb 2021 23:27:09 +0000
Received: by outflank-mailman (input) for mailman id 90006;
 Thu, 25 Feb 2021 23:27:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFQ2G-0000vj-D8; Thu, 25 Feb 2021 23:27:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFQ2G-0003K2-2D; Thu, 25 Feb 2021 23:27:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFQ2F-00069J-RI; Thu, 25 Feb 2021 23:27:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFQ2F-0002kJ-Qo; Thu, 25 Feb 2021 23:27:07 +0000
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
	bh=GtFElcf/2M1VptzTQoQGqkw2tnw82vc2vRXINCr4i1g=; b=LOxOhDNab5YI/80M7cB0tiKlTq
	20wFX6HL3xARfsA40kp8zLzWjPYxM0Tjtb4soF1BpDFTHnFIaO7pNnVmWxnR4fHt8Hl5sLWV4oGDS
	bG+B2XcKhoNvd2KGnW4gQzMnYsxOtHyRebiNlg1SSZ7S+dNjZKfWfBIqsGBpy4R5Bp4U=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1lFQ2F-0002kJ-Qo@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Feb 2021 23:27:07 +0000

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
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159687/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest --summary-out=tmp/159687.bisection-summary --basis-template=159475 --blessings=real,real-bisect,real-retry xen-unstable test-xtf-amd64-amd64-4 xtf/test-pv32pae-selftest
Searching for failure / basis pass:
 159652 fail [host=godello0] / 159475 ok.
Failure / basis pass flights: 159652 / 159475
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 60390ccb8b9b2dbf85010f8b47779bb231aa2533 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca-60390ccb8b9b2dbf85010f8b47779bb231aa2533 git://xenbits.xen.org/xtf.git#8ab15139728a8efd3ebbb60beb16a958a6a93fa1-8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Loaded 5001 nodes in revision graph
Searching for test results:
 159475 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159487 [host=godello1]
 159491 [host=albana0]
 159508 [host=albana1]
 159526 [host=huxelrebe1]
 159540 [host=elbling0]
 159559 [host=fiano1]
 159576 [host=chardonnay0]
 159602 [host=elbling1]
 159626 [host=chardonnay1]
 159669 [host=chardonnay1]
 159652 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 60390ccb8b9b2dbf85010f8b47779bb231aa2533 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159670 [host=chardonnay1]
 159672 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159673 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 60390ccb8b9b2dbf85010f8b47779bb231aa2533 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159675 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2ff2adc61fcfa09118b76b4b64cbf8a78f7f2882 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159678 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159679 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6a1d72d3739e330caf728ea07d656d7bf568824b 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159680 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159682 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159683 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159684 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159686 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159687 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Searching for interesting versions
 Result found: flight 159475 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x562dd310a750) HASH(0x562dd3120f40) HASH(0x562dd311ec38) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6a1d72d3739e330caf728ea07d656d7bf568824b 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x562dd3120940) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x562dd310\
 f088) HASH(0x562dd3113840) Result found: flight 159652 (fail), for basis failure (at ancestor ~80)
 Repro found: flight 159672 (pass), for basis pass
 Repro found: flight 159673 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
No revisions left to test, checking graph state.
 Result found: flight 159680 (pass), for last pass
 Result found: flight 159682 (fail), for first failure
 Repro found: flight 159683 (pass), for last pass
 Repro found: flight 159684 (fail), for first failure
 Repro found: flight 159686 (pass), for last pass
 Repro found: flight 159687 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159687/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-pv32pae-selftest.{dot,ps,png,html,svg}.
----------------------------------------
159687: tolerable all pass

flight 159687 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159687/

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


