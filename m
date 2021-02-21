Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E226320BDC
	for <lists+xen-devel@lfdr.de>; Sun, 21 Feb 2021 17:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87630.164771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDrzu-0008Mo-PD; Sun, 21 Feb 2021 16:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87630.164771; Sun, 21 Feb 2021 16:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDrzu-0008MC-JF; Sun, 21 Feb 2021 16:54:18 +0000
Received: by outflank-mailman (input) for mailman id 87630;
 Sun, 21 Feb 2021 16:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDrzs-0008M4-Qd; Sun, 21 Feb 2021 16:54:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDrzs-00017N-Fs; Sun, 21 Feb 2021 16:54:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDrzs-00030t-9p; Sun, 21 Feb 2021 16:54:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lDrzs-0005YN-9I; Sun, 21 Feb 2021 16:54:16 +0000
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
	bh=iNBXypuHgI9SL+AChZ59/RvtbTeZGJLxKkEZt1HOC6M=; b=g4+YpQ8kZ8R07LlfeYdMW4Nx5J
	gK5ZrInzxi1oXokoLzdHYBzpz8wS9Xz3PwcgyKwBySiqXuBfItoienyPi63kiOEZN3V5qdg58+iFG
	bFYc49zTv7aBAmFtoWiqJCj+e3cfJMIL+yxBN3SsB3Y/nhskaqfVnKN9YwpP4AqVchzk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-5
Message-Id: <E1lDrzs-0005YN-9I@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Feb 2021 16:54:16 +0000

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-5
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159524/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-5.xtf--test-pv32pae-selftest.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-5.xtf--test-pv32pae-selftest --summary-out=tmp/159524.bisection-summary --basis-template=159475 --blessings=real,real-bisect,real-retry xen-unstable test-xtf-amd64-amd64-5 xtf/test-pv32pae-selftest
Searching for failure / basis pass:
 159491 fail [host=albana0] / 159475 [host=godello0] 159453 [host=fiano1] 159424 [host=albana1] 159396 [host=chardonnay1] 159362 [host=albana1] 159335 [host=chardonnay1] 159315 [host=godello1] 159202 [host=huxelrebe1] 159134 [host=fiano1] 159036 [host=elbling1] 159013 [host=pinot0] 158957 [host=godello1] 158922 ok.
Failure / basis pass flights: 159491 / 158922
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38\
 aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#9dc687f155a57216b83b17f9cde55dd43e06b0cd-87a067fd8f4d4f7c6be02c3d38145115ac542017 git://xenbits.xen.org/xtf.git#8ab15139728a8efd3ebbb60beb16a958a6a93fa1-8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Loaded 5001 nodes in revision graph
Searching for test results:
 158811 [host=pinot1]
 158835 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 158873 [host=chardonnay1]
 158922 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 158957 [host=godello1]
 159013 [host=pinot0]
 159036 [host=elbling1]
 159134 [host=fiano1]
 159202 [host=huxelrebe1]
 159315 [host=godello1]
 159335 [host=chardonnay1]
 159362 [host=albana1]
 159396 [host=chardonnay1]
 159424 [host=albana1]
 159453 [host=fiano1]
 159475 [host=godello0]
 159496 [host=godello1]
 159487 [host=godello1]
 159492 [host=godello1]
 159494 [host=godello1]
 159497 [host=godello1]
 159499 [host=godello1]
 159500 [host=godello1]
 159502 [host=godello1]
 159503 [host=godello1]
 159504 [host=godello1]
 159505 [host=godello1]
 159491 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159506 [host=godello1]
 159509 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159510 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 87a067fd8f4d4f7c6be02c3d38145115ac542017 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159511 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 52280d9492ee486be735859ef496220534c71905 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159513 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d670ef3401b91d04c58d72cd8ce5579b4fa900d8 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159516 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 336fbbdf61562e5ae1112f24bc90c1164adf2144 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159519 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 f954a1bf5f74ad6edce361d1bf1a29137ff374e8 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159520 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159521 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159522 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159523 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
 159524 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4dc1815991420b809ce18dddfdf9c0af48944204 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
Searching for interesting versions
 Result found: flight 158835 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x56076a7b42f8) HASH(0x56076a7ad3b8) HASH(0x56076a7a9380) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d670ef3401b91d04c58d72cd8ce5579b4fa900d8 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x56076a7a8f00) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 52280d9492ee486be735859ef496220534c71905 8ab15139728a8efd3ebbb60beb16a958a6a93fa1, results HASH(0x56076a7a\
 9080) Result found: flight 159491 (fail), for basis failure (at ancestor ~75)
 Repro found: flight 159509 (pass), for basis pass
 Repro found: flight 159510 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2d824791504f4119f04f95bafffec2e37d319c25 8ab15139728a8efd3ebbb60beb16a958a6a93fa1
No revisions left to test, checking graph state.
 Result found: flight 159516 (pass), for last pass
 Result found: flight 159520 (fail), for first failure
 Repro found: flight 159521 (pass), for last pass
 Repro found: flight 159522 (fail), for first failure
 Repro found: flight 159523 (pass), for last pass
 Repro found: flight 159524 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4dc1815991420b809ce18dddfdf9c0af48944204
  Bug not present: 2d824791504f4119f04f95bafffec2e37d319c25
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159524/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-5.xtf--test-pv32pae-selftest.{dot,ps,png,html,svg}.
----------------------------------------
159524: tolerable all pass

flight 159524 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159524/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-5     19 xtf/test-pv32pae-selftest fail baseline untested


jobs:
 test-xtf-amd64-amd64-5                                       pass    


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


