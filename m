Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC523247FE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 01:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89555.168755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF4jJ-0004fX-QI; Thu, 25 Feb 2021 00:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89555.168755; Thu, 25 Feb 2021 00:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF4jJ-0004f6-M6; Thu, 25 Feb 2021 00:42:09 +0000
Received: by outflank-mailman (input) for mailman id 89555;
 Thu, 25 Feb 2021 00:42:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF4jI-0004ey-Ij; Thu, 25 Feb 2021 00:42:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF4jI-00025V-BT; Thu, 25 Feb 2021 00:42:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF4jI-0007Wy-1w; Thu, 25 Feb 2021 00:42:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lF4jI-0007cW-1R; Thu, 25 Feb 2021 00:42:08 +0000
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
	bh=+VH2TMBN2TzfQewLlrkOv+rorq4O1IMNfGtM3hkEdeU=; b=PC1IJELFiLDbNj0ahZqF7+ilfF
	1QeE7z6kIYJBFqTHDMYXvycXnfQu1ipmWRaC5h7g0AfEllJsFoFXDq3WDDQ3S+eVFXe94lwvKhbEA
	f3EAa+BZeb//9+WerPCNEFIXIrM6LqQRA4Wf1UOx4EXJbpGvN6EBXwVZ0UnxneblRDgQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-qemut-rhel6hvm-intel
Message-Id: <E1lF4jI-0007cW-1R@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Feb 2021 00:42:08 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-qemut-rhel6hvm-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159650/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-qemut-rhel6hvm-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-qemut-rhel6hvm-intel.xen-boot --summary-out=tmp/159650.bisection-summary --basis-template=159475 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-qemut-rhel6hvm-intel xen-boot
Searching for failure / basis pass:
 159602 fail [host=huxelrebe1] / 159475 [host=chardonnay0] 159453 [host=fiano1] 159424 [host=elbling0] 159396 [host=fiano0] 159362 [host=chardonnay1] 159335 [host=elbling1] 159315 [host=albana0] 159202 [host=albana1] 159134 [host=fiano1] 159036 [host=chardonnay0] 159013 [host=fiano0] 158957 [host=elbling0] 158922 [host=elbling1] 158873 [host=chardonnay1] 158835 [host=chardonnay0] 158811 [host=fiano1] 158787 [host=albana1] 158755 [host=elbling1] 158719 [host=chardonnay1] 158711 [host=fiano0] 1586\
 99 [host=chardonnay1] 158628 [host=elbling1] 158617 [host=chardonnay1] 158607 [host=chardonnay1] 158601 [host=albana0] 158591 [host=elbling1] 158581 ok.
Failure / basis pass flights: 159602 / 158581
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5e317896342d553f0b55f72948bbf93a0f1147d3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#5e317896342d553f0b55f72948bbf93a0f1147d3-f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
Loaded 5001 nodes in revision graph
Searching for test results:
 158581 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5e317896342d553f0b55f72948bbf93a0f1147d3
 158591 [host=elbling1]
 158601 [host=albana0]
 158607 [host=chardonnay1]
 158617 [host=chardonnay1]
 158628 [host=elbling1]
 158699 [host=chardonnay1]
 158711 [host=fiano0]
 158719 [host=chardonnay1]
 158755 [host=elbling1]
 158787 [host=albana1]
 158811 [host=fiano1]
 158835 [host=chardonnay0]
 158873 [host=chardonnay1]
 158922 [host=elbling1]
 158957 [host=elbling0]
 159013 [host=fiano0]
 159036 [host=chardonnay0]
 159134 [host=fiano1]
 159202 [host=albana1]
 159315 [host=albana0]
 159335 [host=elbling1]
 159362 [host=chardonnay1]
 159396 [host=fiano0]
 159424 [host=elbling0]
 159453 [host=fiano1]
 159475 [host=chardonnay0]
 159487 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159491 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159508 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159526 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159540 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017
 159559 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
 159576 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
 159618 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5e317896342d553f0b55f72948bbf93a0f1147d3
 159621 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
 159622 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 119c98972c4e737508df827bbbc8453cc93292c7
 159623 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 82ed3155fe72a7e15ab28f86a3c1eb970a92d2f6
 159602 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
 159625 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ca82d3fecc93745ee17850a609ac7772bd7c8bf7
 159628 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2dd2cd0f16aae2cad2227f9aae9469fd6cdd8cd3
 159633 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6a1d72d3739e330caf728ea07d656d7bf568824b
 159635 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 336fbbdf61562e5ae1112f24bc90c1164adf2144
 159641 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f954a1bf5f74ad6edce361d1bf1a29137ff374e8
 159643 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
 159647 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159648 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
 159649 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
 159650 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204
Searching for interesting versions
 Result found: flight 158581 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25, results HASH(0x55cd07744898) HASH(0x55cd0775c348) HASH(0x55cd07783648) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895\
 af2840d85c524f0bd11a38aac308308 6a1d72d3739e330caf728ea07d656d7bf568824b, results HASH(0x55cd076d81e8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2dd2cd0f16aae2cad2227f9aae9469fd6cdd8cd3, results HASH(0x55cd0718ecf0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ca82d3fecc93745ee17850a609ac7772bd7c8bf7, results HASH(0x55cd07781ee0) Result found: flight 159487 (fail), for basis failure (at ancestor ~76)
 Repro found: flight 159618 (pass), for basis pass
 Repro found: flight 159621 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25
No revisions left to test, checking graph state.
 Result found: flight 159643 (pass), for last pass
 Result found: flight 159645 (fail), for first failure
 Repro found: flight 159647 (pass), for last pass
 Repro found: flight 159648 (fail), for first failure
 Repro found: flight 159649 (pass), for last pass
 Repro found: flight 159650 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159650/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-qemut-rhel6hvm-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
159650: tolerable ALL FAIL

flight 159650 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159650/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-intel  8 xen-boot        fail baseline untested


jobs:
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    


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


