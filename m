Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159414D928E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 03:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290593.492890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTwsk-0007ya-F5; Tue, 15 Mar 2022 02:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290593.492890; Tue, 15 Mar 2022 02:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTwsk-0007wj-AG; Tue, 15 Mar 2022 02:25:54 +0000
Received: by outflank-mailman (input) for mailman id 290593;
 Tue, 15 Mar 2022 02:25:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTwsi-0007wE-O2; Tue, 15 Mar 2022 02:25:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTwsi-0008MB-MN; Tue, 15 Mar 2022 02:25:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTwsi-0001uy-A4; Tue, 15 Mar 2022 02:25:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nTwsi-0000FL-9b; Tue, 15 Mar 2022 02:25:52 +0000
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
	bh=ANzwJuF3/XDajjEVF2Jur/vuQ6m3Pu3fqrEyv4CiBHc=; b=UExBaQrxvOzKTEp5u9vI4sO+bo
	V2cF/2hWnRQdy4xhobVCBjRekvTkr+DcbvvUNJFAp8yjbWsGEa3m2feooTs0jp9Usdw0RtHrJ+6/a
	xiSq150mk6P6tRJKVm/g5XFoSxSoTzT5bEeaRt0eK/1xy1fJHSbjFjKqyO173k7NbgPg=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1nTwsi-0000FL-9b@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Mar 2022 02:25:52 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
  Bug not present: f9dd8436e3b826e4ca2284effa4c0285527ea763
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168603/


  commit 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
  Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Date:   Thu Mar 10 17:44:59 2022 +0000
  
      xen/arm64: io: Support instructions (for which ISS is not valid) on emulated MMIO region using MMIO/ioreq handler
      
      When an instruction is trapped in Xen due to translation fault, Xen
      checks if the ISS is invalid (for data abort) or it is an instruction
      abort. If so, Xen tries to resolve the translation fault using p2m page
      tables. In case of data abort, Xen will try to map the mmio region to
      the guest (ie tries to emulate the mmio region).
      
      If the ISS is not valid and it is a data abort, then Xen tries to
      decode the instruction. In case of ioreq, Xen  saves the decoding state,
      rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
      it will read the decoding state to determine if the instruction decoded
      was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
      uses these details to post increment rn.
      
      In case of mmio handler, if the mmio operation was successful, then Xen
      retrives the decoding state, rn and imm9. For state ==
      INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
      
      If there is an error encountered while decoding/executing the instruction,
      Xen will forward the abort to the guest.
      
      Also, the logic to infer the type of instruction has been moved from
      try_handle_mmio() to try_decode_instruction() which is called before.
      try_handle_mmio() is solely responsible for handling the mmio operation.
      
      Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
      Acked-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/168603.bisection-summary --basis-template=168580 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 168591 fail [host=himrod1] / 168580 [host=himrod2] 168509 [host=himrod2] 168495 ok.
Failure / basis pass flights: 168591 / 168495
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fef5531fd8f311b347970568d77e7bf4feffd7fb
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 5142dc5c25e317c208e3dc16d16b664b9f05dab5
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/xen.git#5142dc5c25e317c208e3dc16d16b664b9f05dab5-fef5531fd8f311b347970568d77e7bf4feffd7fb
From git://cache:9419/git://xenbits.xen.org/xen
   6ff9a7e62b..dedb0aa42c  master     -> origin/master
Loaded 5001 nodes in revision graph
Searching for test results:
 168495 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 5142dc5c25e317c208e3dc16d16b664b9f05dab5
 168509 [host=himrod2]
 168580 [host=himrod2]
 168589 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fef5531fd8f311b347970568d77e7bf4feffd7fb
 168590 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 5142dc5c25e317c208e3dc16d16b664b9f05dab5
 168593 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fef5531fd8f311b347970568d77e7bf4feffd7fb
 168594 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f809886988767fff46f440f4fc6d252fb586ace
 168595 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dedb0aa42c6d1ee31805dfc61630db2c41117330
 168596 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f9dd8436e3b826e4ca2284effa4c0285527ea763
 168597 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
 168598 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f9dd8436e3b826e4ca2284effa4c0285527ea763
 168599 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
 168600 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f9dd8436e3b826e4ca2284effa4c0285527ea763
 168591 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 fef5531fd8f311b347970568d77e7bf4feffd7fb
 168603 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
Searching for interesting versions
 Result found: flight 168495 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f9dd8436e3b826e4ca2284effa4c0285527ea763, results HASH(0x55566074f348) HASH(0x55566074e8a0) HASH(0x555660756588) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dedb0aa42c6d1ee31805dfc61630db2c41117330, results HASH(0x55566074d318) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 3f809886988767fff46f440f4fc6d252fb586ace, results HASH(0x55566074b310) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 5142dc5c25e317c208e3dc16d16b664b9f05dab5, results HASH(0x555660741920) HASH(0x555660748a08) Result found: flight 168589 (fail), for basis failure (at ancestor ~307)
 Repro found: flight 168590 (pass), for basis pass
 Repro found: flight 168591 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 f9dd8436e3b826e4ca2284effa4c0285527ea763
No revisions left to test, checking graph state.
 Result found: flight 168596 (pass), for last pass
 Result found: flight 168597 (fail), for first failure
 Repro found: flight 168598 (pass), for last pass
 Repro found: flight 168599 (fail), for first failure
 Repro found: flight 168600 (pass), for last pass
 Repro found: flight 168603 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
  Bug not present: f9dd8436e3b826e4ca2284effa4c0285527ea763
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168603/


  commit 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
  Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Date:   Thu Mar 10 17:44:59 2022 +0000
  
      xen/arm64: io: Support instructions (for which ISS is not valid) on emulated MMIO region using MMIO/ioreq handler
      
      When an instruction is trapped in Xen due to translation fault, Xen
      checks if the ISS is invalid (for data abort) or it is an instruction
      abort. If so, Xen tries to resolve the translation fault using p2m page
      tables. In case of data abort, Xen will try to map the mmio region to
      the guest (ie tries to emulate the mmio region).
      
      If the ISS is not valid and it is a data abort, then Xen tries to
      decode the instruction. In case of ioreq, Xen  saves the decoding state,
      rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
      it will read the decoding state to determine if the instruction decoded
      was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
      uses these details to post increment rn.
      
      In case of mmio handler, if the mmio operation was successful, then Xen
      retrives the decoding state, rn and imm9. For state ==
      INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
      
      If there is an error encountered while decoding/executing the instruction,
      Xen will forward the abort to the guest.
      
      Also, the logic to infer the type of instruction has been moved from
      try_handle_mmio() to try_decode_instruction() which is called before.
      try_handle_mmio() is solely responsible for handling the mmio operation.
      
      Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
      Acked-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
168603: tolerable ALL FAIL

flight 168603 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/168603/

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


