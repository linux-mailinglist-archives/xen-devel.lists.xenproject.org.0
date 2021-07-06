Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02A3BDE79
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 22:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151718.280342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0rlx-0006gy-KV; Tue, 06 Jul 2021 20:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151718.280342; Tue, 06 Jul 2021 20:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0rlx-0006eS-Gz; Tue, 06 Jul 2021 20:34:25 +0000
Received: by outflank-mailman (input) for mailman id 151718;
 Tue, 06 Jul 2021 20:34:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0rlw-0006ds-9E; Tue, 06 Jul 2021 20:34:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0rlw-0001Uv-1X; Tue, 06 Jul 2021 20:34:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0rlv-0005cI-Qj; Tue, 06 Jul 2021 20:34:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m0rlv-0002MM-QC; Tue, 06 Jul 2021 20:34:23 +0000
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
	bh=uLkAZxte3POwa/DN8/CFOFu23u2nKz73HTPYNC3vD6g=; b=W3lV7k+BJc7xCkGnBLsiV9/+Bo
	DEDO3q+6L5MSKfbott1Bg25UBpll/Fj+V+LnujaFs1KrIspyTdi0EHmpvgH5cBMktKVz/j5isJT8z
	Qbgz01Q7ed9m1/dbNxEy8dA8ZZJY6lS4dHazQ63S20NBrw0TfH/vCe1OaDHOhLyP/Lcs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1m0rlv-0002MM-QC@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jul 2021 20:34:23 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  918b8842a852e0e7446286f546724b1c63c56c66
  Bug not present: 4473f3601098a2c3cf5ab89d5a29504772985e3a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163364/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/163364.bisection-summary --basis-template=163326 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 163361 fail [host=rochester0] / 163326 [host=laxton0] 163314 [host=laxton0] 163310 [host=laxton0] 163230 [host=laxton0] 163225 [host=laxton0] 163183 [host=laxton1] 163182 ok.
Failure / basis pass flights: 163361 / 163182
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 f8582da0417660269bec69e399f8667f761e886b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#f8582da0417660269bec69e399f8667f761e886b-f17a73b3c0264c62dd6b5dae01ed621c051c3038
Loaded 19968 nodes in revision graph
Searching for test results:
 163182 pass 7ea428895af2840d85c524f0bd11a38aac308308 f8582da0417660269bec69e399f8667f761e886b
 163183 [host=laxton1]
 163225 [host=laxton0]
 163230 [host=laxton0]
 163310 [host=laxton0]
 163314 [host=laxton0]
 163326 [host=laxton0]
 163328 [host=laxton0]
 163332 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163336 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163345 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163348 pass 7ea428895af2840d85c524f0bd11a38aac308308 f8582da0417660269bec69e399f8667f761e886b
 163349 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163350 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 74d044d51b19bb697eac5c3deafa140f6afafec8
 163351 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163353 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 09e2cd69956fe529bfc3d53dae477b44eff217d1
 163354 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 c8f88810db2a25d6aacf65c1c60bc4f5d848a483
 163355 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163356 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
 163357 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163358 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163359 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
 163361 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163360 pass 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163364 fail 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 918b8842a852e0e7446286f546724b1c63c56c66
Searching for interesting versions
 Result found: flight 163182 (pass), for basis pass
 For basis failure, parent search stopping at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a, results HASH(0x5634f81fb840) HASH(0x5634f81f9378) HASH(0x5634f6c65018) For basis failure, parent search stopping at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 09e2cd69956fe529bfc3d53dae477b44eff217d1, results HASH(0x5634f81f9918) For basis failure, parent search stopping at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 74d044d51b19bb697eac5c3deafa140f6afafec8, results HASH(0x\
 5634f81f5780) Result found: flight 163332 (fail), for basis failure (at ancestor ~18)
 Repro found: flight 163348 (pass), for basis pass
 Repro found: flight 163349 (fail), for basis failure
 0 revisions at 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4473f3601098a2c3cf5ab89d5a29504772985e3a
No revisions left to test, checking graph state.
 Result found: flight 163355 (pass), for last pass
 Result found: flight 163356 (fail), for first failure
 Repro found: flight 163358 (pass), for last pass
 Repro found: flight 163359 (fail), for first failure
 Repro found: flight 163360 (pass), for last pass
 Repro found: flight 163364 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  918b8842a852e0e7446286f546724b1c63c56c66
  Bug not present: 4473f3601098a2c3cf5ab89d5a29504772985e3a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163364/


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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
163364: tolerable ALL FAIL

flight 163364 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163364/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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


