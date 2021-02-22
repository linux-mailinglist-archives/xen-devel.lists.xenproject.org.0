Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F83210CA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 07:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87770.164960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE4Y5-0001rR-5c; Mon, 22 Feb 2021 06:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87770.164960; Mon, 22 Feb 2021 06:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE4Y5-0001r0-1Q; Mon, 22 Feb 2021 06:18:25 +0000
Received: by outflank-mailman (input) for mailman id 87770;
 Mon, 22 Feb 2021 06:18:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lE4Y3-0001qs-Hu; Mon, 22 Feb 2021 06:18:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lE4Y3-0001Eg-6c; Mon, 22 Feb 2021 06:18:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lE4Y3-0002je-0J; Mon, 22 Feb 2021 06:18:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lE4Y2-00011M-W0; Mon, 22 Feb 2021 06:18:22 +0000
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
	bh=viPa5N8oQA+J8OERnHB5dAsGhTSJpI198pa1FLJwC5A=; b=0HNZ23w2nslUUmTC/j4BZnOTDS
	ym0Gt7emYegcU1fYEftUpjilMEuzQ1sFWHS77/DqGTA+W5oVvzgJ1UyXqPeGvtUPZPnwGF36GGolA
	cLZEJHJwM4dNHsg7/vFwAxYMwGTu/gKg/t4chiTv8K0KNubL/KbIYFpf1niqa8+f3a3M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemut-ws16-amd64
Message-Id: <E1lE4Y2-00011M-W0@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Feb 2021 06:18:22 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-ws16-amd64
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159539/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot --summary-out=tmp/159539.bisection-summary --basis-template=159475 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemut-ws16-amd64 xen-boot
Searching for failure / basis pass:
 159526 fail [host=huxelrebe1] / 159475 ok.
Failure / basis pass flights: 159526 / 159475
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca-87a067fd8f4d4f7c6be02c3d38145115ac542017
Loaded 5001 nodes in revision graph
Searching for test results:
 159475 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca
 159487 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159491 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159508 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159525 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca
 159527 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159528 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 76aff7f6336b0ce19559700717537449972531be
 159531 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159532 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f954a1bf5f74ad6edce361d1bf1a29137ff374e8
 159534 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
 159535 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159536 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
 159538 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159526 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159539 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
Searching for interesting versions
 Result found: flight 159475 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25, results HASH(0x56365ad9db60) HASH(0x56365ad7e7e0) HASH(0x56365ada2918) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895\
 af2840d85c524f0bd11a38aac308308 e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca, results HASH(0x56365ad86890) HASH(0x56365ad81890) Result found: flight 159487 (fail), for basis failure (at ancestor ~75)
 Repro found: flight 159525 (pass), for basis pass
 Repro found: flight 159526 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
No revisions left to test, checking graph state.
 Result found: flight 159531 (pass), for last pass
 Result found: flight 159534 (fail), for first failure
 Repro found: flight 159535 (pass), for last pass
 Repro found: flight 159536 (fail), for first failure
 Repro found: flight 159538 (pass), for last pass
 Repro found: flight 159539 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159539/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-ws16-amd64.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
159539: tolerable ALL FAIL

flight 159539 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159539/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-ws16-amd64  8 xen-boot         fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    


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


