Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE33BDC51
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 19:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151588.280148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ot9-0001V1-5Y; Tue, 06 Jul 2021 17:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151588.280148; Tue, 06 Jul 2021 17:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ot9-0001T9-1n; Tue, 06 Jul 2021 17:29:39 +0000
Received: by outflank-mailman (input) for mailman id 151588;
 Tue, 06 Jul 2021 17:29:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0ot6-0001Sg-T9; Tue, 06 Jul 2021 17:29:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0ot6-0006g2-Nt; Tue, 06 Jul 2021 17:29:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0ot6-0000mB-GK; Tue, 06 Jul 2021 17:29:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m0ot6-0002s0-Fp; Tue, 06 Jul 2021 17:29:36 +0000
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
	bh=ph2CJF0y4Okl2a2K90xgu8lnqwNEXQWId9Blo+SUl58=; b=Q4wal13ClKBYy1Pl5GZphHuKjX
	4p+ww4PWins77pb0r0QDAzGpmjw3emSf/mY6JoLWuTtKZwMlUPNhbWEnYEst9ciNyuQ95xz9SwLie
	ix06UHRJPfBKcUwYu20Yhu3K4q0gqgxoH3b6MAsJKPB8B9gujDoj497Qj9ZWK+aJGDok=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1m0ot6-0002s0-Fp@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jul 2021 17:29:36 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  918b8842a852e0e7446286f546724b1c63c56c66
  Bug not present: 4473f3601098a2c3cf5ab89d5a29504772985e3a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163347/


  commit 918b8842a852e0e7446286f546724b1c63c56c66
  Author: Michal Orzel <michal.orzel@arm.com>
  Date:   Mon Jul 5 08:39:52 2021 +0200
  
      arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
      
      AArch64 registers are 64bit whereas AArch32 registers
      are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
      we should get rid of helpers READ/WRITE_SYSREG32
      in favour of using READ/WRITE_SYSREG.
      We should also use register_t type when reading sysregs
      which can correspond to uint64_t or uint32_t.
      Even though many AArch64 registers have upper 32bit reserved
      it does not mean that they can't be widen in the future.
      
      Modify type of hsr, cpsr, spsr_el1 to uint64_t.
      Previously we relied on the padding after spsr_el1.
      As we removed the padding, modify the union to be 64bit so we don't corrupt spsr_fiq.
      No need to modify the assembly code because the accesses were based on 64bit
      registers as there was a 32bit padding after spsr_el1.
      
      Remove 32bit padding in cpu_user_regs before spsr_fiq
      as it is no longer needed due to upper union being 64bit now.
      Add 64bit padding in cpu_user_regs before spsr_el1
      because the kernel frame should be 16-byte aligned.
      
      Change type of cpsr to uint64_t in the public outside interface
      "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
      Increment XEN_DOMCTL_INTERFACE_VERSION.
      
      Change type of cpsr to uint64_t in the public outside interface
      "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
      
      Signed-off-by: Michal Orzel <michal.orzel@arm.com>
      Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/163347.bisection-summary --basis-template=163326 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 163336 fail [host=himrod1] / 163326 [host=himrod2] 163314 ok.
Failure / basis pass flights: 163336 / 163314
(tree with no url: minios)
(tree in basispass but not in latest: ovmf)
(tree in basispass but not in latest: qemu)
(tree in basispass but not in latest: seabios)
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#44e8904ebfbc57ba0950c40b9d3a28507b553e4e-f17a73b3c0264c62dd6b5dae01ed621c051c3038
Loaded 19986 nodes in revision graph
Searching for test results:
 163314 pass 7ea428895af2840d85c524f0bd11a38aac308308 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163326 [host=himrod2]
 163328 [host=himrod2]
 163329 [host=himrod2]
 163330 [host=himrod2]
 163331 [host=himrod2]
 163333 [host=himrod2]
 163332 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163334 [host=himrod2]
 163335 pass 7ea428895af2840d85c524f0bd11a38aac308308 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163337 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163338 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 09e2cd69956fe529bfc3d53dae477b44eff217d1
 163336 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163339 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 c8f88810db2a25d6aacf65c1c60bc4f5d848a483
 163341 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163342 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
 163343 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163344 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
 163346 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163347 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
Searching for interesting versions
 Result found: flight 163314 (pass), for basis pass
 For basis failure, parent search stopping at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a, results HASH(0x55bb9f7ae1a0) HASH(0x55bb9f7af0c8) HASH(0x55bb9f7b08d0) For basis failure, parent search stopping at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 09e2cd69956fe529bfc3d53dae477b44eff217d1, results HASH(0x55bb9f7abd98) Result found: flight 163332 (fail), for basis failure (at ancestor ~13)
 Repro found: flight 163335 (pass), for basis pass
 Repro found: flight 163336 (fail), for basis failure
 0 revisions at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
No revisions left to test, checking graph state.
 Result found: flight 163341 (pass), for last pass
 Result found: flight 163342 (fail), for first failure
 Repro found: flight 163343 (pass), for last pass
 Repro found: flight 163344 (fail), for first failure
 Repro found: flight 163346 (pass), for last pass
 Repro found: flight 163347 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  918b8842a852e0e7446286f546724b1c63c56c66
  Bug not present: 4473f3601098a2c3cf5ab89d5a29504772985e3a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163347/


  commit 918b8842a852e0e7446286f546724b1c63c56c66
  Author: Michal Orzel <michal.orzel@arm.com>
  Date:   Mon Jul 5 08:39:52 2021 +0200
  
      arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
      
      AArch64 registers are 64bit whereas AArch32 registers
      are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
      we should get rid of helpers READ/WRITE_SYSREG32
      in favour of using READ/WRITE_SYSREG.
      We should also use register_t type when reading sysregs
      which can correspond to uint64_t or uint32_t.
      Even though many AArch64 registers have upper 32bit reserved
      it does not mean that they can't be widen in the future.
      
      Modify type of hsr, cpsr, spsr_el1 to uint64_t.
      Previously we relied on the padding after spsr_el1.
      As we removed the padding, modify the union to be 64bit so we don't corrupt spsr_fiq.
      No need to modify the assembly code because the accesses were based on 64bit
      registers as there was a 32bit padding after spsr_el1.
      
      Remove 32bit padding in cpu_user_regs before spsr_fiq
      as it is no longer needed due to upper union being 64bit now.
      Add 64bit padding in cpu_user_regs before spsr_el1
      because the kernel frame should be 16-byte aligned.
      
      Change type of cpsr to uint64_t in the public outside interface
      "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
      Increment XEN_DOMCTL_INTERFACE_VERSION.
      
      Change type of cpsr to uint64_t in the public outside interface
      "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
      
      Signed-off-by: Michal Orzel <michal.orzel@arm.com>
      Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
163347: tolerable ALL FAIL

flight 163347 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163347/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


