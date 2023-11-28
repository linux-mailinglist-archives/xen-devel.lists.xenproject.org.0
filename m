Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C37FBFEC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643334.1003419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81TY-00039Z-1D; Tue, 28 Nov 2023 17:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643334.1003419; Tue, 28 Nov 2023 17:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81TX-00037k-UE; Tue, 28 Nov 2023 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 643334;
 Tue, 28 Nov 2023 17:02:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r81TW-00037Y-A7; Tue, 28 Nov 2023 17:02:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r81TW-0005Fw-5P; Tue, 28 Nov 2023 17:02:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r81TV-00060X-VR; Tue, 28 Nov 2023 17:02:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r81TV-0002fV-Uv; Tue, 28 Nov 2023 17:02:17 +0000
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
	bh=OXPVYWT/7VYeAKEI90aBr3/kbHe2U8rgb4BQim7PN1Y=; b=2oQF+PvNiQBR9g9vqEvO8fvm2H
	HFqnjnyTUWPWHQ9H3qj4WPgfS4amHT+uqvIAccZvQG1uv+iEXWBEPjuW/W5SPXim1J+gsNOF8RhNG
	Ntx1bJODwTrmYg0s00ZHpihxkYeYe5I+2ZIJmiYNk5FbV+08g0t01XICAz4waTLcOdH0=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1r81TV-0002fV-Uv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 17:02:17 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build/dist-test

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
  Bug not present: 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183905/


  commit 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Mon Nov 27 15:16:01 2023 +0100
  
      livepatch: do not use .livepatch.funcs section to store internal state
      
      Currently the livepatch logic inside of Xen will use fields of struct
      livepatch_func in order to cache internal state of patched functions.  Note
      this is a field that is part of the payload, and is loaded as an ELF section
      (.livepatch.funcs), taking into account the SHF_* flags in the section
      header.
      
      The flags for the .livepatch.funcs section, as set by livepatch-build-tools,
      are SHF_ALLOC, which leads to its contents (the array of livepatch_func
      structures) being placed in read-only memory:
      
      Section Headers:
        [Nr] Name              Type             Address           Offset
             Size              EntSize          Flags  Link  Info  Align
      [...]
        [ 4] .livepatch.funcs  PROGBITS         0000000000000000  00000080
             0000000000000068  0000000000000000   A       0     0     8
      
      This previously went unnoticed, as all writes to the fields of livepatch_func
      happen in the critical region that had WP disabled in CR0.  After 8676092a0f16
      however WP is no longer toggled in CR0 for patch application, and only the
      hypervisor .text mappings are made write-accessible.  That leads to the
      following page fault when attempting to apply a livepatch:
      
      ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
      CPU:    4
      RIP:    e008:[<ffff82d040221e81>] common/livepatch.c#apply_payload+0x45/0x1e1
      [...]
      Xen call trace:
         [<ffff82d040221e81>] R common/livepatch.c#apply_payload+0x45/0x1e1
         [<ffff82d0402235b2>] F check_for_livepatch_work+0x385/0xaa5
         [<ffff82d04032508f>] F arch/x86/domain.c#idle_loop+0x92/0xee
      
      Pagetable walk from ffff82d040625079:
       L4[0x105] = 000000008c6c9063 ffffffffffffffff
       L3[0x141] = 000000008c6c6063 ffffffffffffffff
       L2[0x003] = 000000086a1e7063 ffffffffffffffff
       L1[0x025] = 800000086ca5d121 ffffffffffffffff
      
      ****************************************
      Panic on CPU 4:
      FATAL PAGE FAULT
      [error_code=0003]
      Faulting linear address: ffff82d040625079
      ****************************************
      
      Fix this by moving the internal Xen function patching state out of
      livepatch_func into an area not allocated as part of the ELF payload.  While
      there also constify the array of livepatch_func structures in order to prevent
      further surprises.
      
      Note there's still one field (old_addr) that gets set during livepatch load.  I
      consider this fine since the field is read-only after load, and at the point
      the field gets set the underlying mapping hasn't been made read-only yet.
      
      Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build--dist-test.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build--dist-test --summary-out=tmp/183905.bisection-summary --basis-template=183851 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build/dist-test
Searching for failure / basis pass:
 183891 fail [host=godello1] / 183851 [host=himrod2] 183846 [host=himrod2] 183844 [host=himrod2] 183840 [host=albana0] 183826 [host=himrod0] 183817 [host=nobling1] 183814 [host=godello0] 183809 [host=nobling1] 183802 [host=godello0] 183798 [host=godello0] 183786 [host=himrod2] 183784 [host=himrod2] 183774 [host=himrod2] 183770 [host=nobling1] 183767 [host=himrod2] 183762 ok.
Failure / basis pass flights: 183891 / 183762
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 72d51813d631fe27d37736b7a55eeec08f246983
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7ad0c774e474f6d95dfda868d876af507d399657
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#7ad0c774e474f6d95dfda868d876af507d399657-72d51813d631fe27d37736b7a55eeec08f246983
Loaded 5001 nodes in revision graph
Searching for test results:
 183762 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7ad0c774e474f6d95dfda868d876af507d399657
 183767 [host=himrod2]
 183770 [host=nobling1]
 183774 [host=himrod2]
 183784 [host=himrod2]
 183786 [host=himrod2]
 183798 [host=godello0]
 183802 [host=godello0]
 183809 [host=nobling1]
 183814 [host=godello0]
 183817 [host=nobling1]
 183826 [host=himrod0]
 183840 [host=albana0]
 183844 [host=himrod2]
 183846 [host=himrod2]
 183851 [host=himrod2]
 183878 [host=albana0]
 183881 [host=albana0]
 183883 [host=albana0]
 183885 [host=albana0]
 183886 [host=albana0]
 183887 [host=albana0]
 183882 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 72d51813d631fe27d37736b7a55eeec08f246983
 183888 [host=albana0]
 183889 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7ad0c774e474f6d95dfda868d876af507d399657
 183892 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 72d51813d631fe27d37736b7a55eeec08f246983
 183893 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 625f2cc66f53c7f1bf56562bf96c06510087d484
 183894 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0dd323133022933dfb03de984c50eadd697cdd71
 183891 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 72d51813d631fe27d37736b7a55eeec08f246983
 183896 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f02829592efe4f55f6d95bb9e2359717109e8ebc
 183897 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fbcec32d6d3ea0ac329301925b317478316209ed
 183898 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 09c2fe438da1dfc83f70d921b52240bea576615f
 183900 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
 183901 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
 183902 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
 183903 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
 183904 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
 183905 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
Searching for interesting versions
 Result found: flight 183762 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55, results HASH(0x557f0ca6be10) HASH(0x557f0c579850) HASH(0x557f0c581f50) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fbcec32d6d3ea0ac329301925b317478316209ed, results HASH(0x557f0cae6e98) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f02829592efe4f55f6d95bb9e2359717109e8ebc, results HASH(0x557f0cae4bb0) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0dd323133022933dfb03de984c50eadd697cdd71, results HASH(0x557f0cadfb78) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 625f2cc66f53c7f1bf56562bf96c06510087d4\
 84, results HASH(0x557f0cade140) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7ad0c774e474f6d95dfda868d876af507d399657, results HASH(0x557f0ca75680) HASH(0x557f0ca7ef50) Result found: flight 183882 (fail), for basis failure (at ancestor ~2433)
 Repro found: flight 183889 (pass), for basis pass
 Repro found: flight 183891 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
No revisions left to test, checking graph state.
 Result found: flight 183900 (pass), for last pass
 Result found: flight 183901 (fail), for first failure
 Repro found: flight 183902 (pass), for last pass
 Repro found: flight 183903 (fail), for first failure
 Repro found: flight 183904 (pass), for last pass
 Repro found: flight 183905 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
  Bug not present: 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183905/


  commit 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Mon Nov 27 15:16:01 2023 +0100
  
      livepatch: do not use .livepatch.funcs section to store internal state
      
      Currently the livepatch logic inside of Xen will use fields of struct
      livepatch_func in order to cache internal state of patched functions.  Note
      this is a field that is part of the payload, and is loaded as an ELF section
      (.livepatch.funcs), taking into account the SHF_* flags in the section
      header.
      
      The flags for the .livepatch.funcs section, as set by livepatch-build-tools,
      are SHF_ALLOC, which leads to its contents (the array of livepatch_func
      structures) being placed in read-only memory:
      
      Section Headers:
        [Nr] Name              Type             Address           Offset
             Size              EntSize          Flags  Link  Info  Align
      [...]
        [ 4] .livepatch.funcs  PROGBITS         0000000000000000  00000080
             0000000000000068  0000000000000000   A       0     0     8
      
      This previously went unnoticed, as all writes to the fields of livepatch_func
      happen in the critical region that had WP disabled in CR0.  After 8676092a0f16
      however WP is no longer toggled in CR0 for patch application, and only the
      hypervisor .text mappings are made write-accessible.  That leads to the
      following page fault when attempting to apply a livepatch:
      
      ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
      CPU:    4
      RIP:    e008:[<ffff82d040221e81>] common/livepatch.c#apply_payload+0x45/0x1e1
      [...]
      Xen call trace:
         [<ffff82d040221e81>] R common/livepatch.c#apply_payload+0x45/0x1e1
         [<ffff82d0402235b2>] F check_for_livepatch_work+0x385/0xaa5
         [<ffff82d04032508f>] F arch/x86/domain.c#idle_loop+0x92/0xee
      
      Pagetable walk from ffff82d040625079:
       L4[0x105] = 000000008c6c9063 ffffffffffffffff
       L3[0x141] = 000000008c6c6063 ffffffffffffffff
       L2[0x003] = 000000086a1e7063 ffffffffffffffff
       L1[0x025] = 800000086ca5d121 ffffffffffffffff
      
      ****************************************
      Panic on CPU 4:
      FATAL PAGE FAULT
      [error_code=0003]
      Faulting linear address: ffff82d040625079
      ****************************************
      
      Fix this by moving the internal Xen function patching state out of
      livepatch_func into an area not allocated as part of the ELF payload.  While
      there also constify the array of livepatch_func structures in order to prevent
      further surprises.
      
      Note there's still one field (old_addr) that gets set during livepatch load.  I
      consider this fine since the field is read-only after load, and at the point
      the field gets set the underlying mapping hasn't been made read-only yet.
      
      Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

pnmtopng: 243 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build--dist-test.{dot,ps,png,html,svg}.
----------------------------------------
183905: tolerable all pass

flight 183905 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/183905/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   7 xen-build/dist-test     fail baseline untested


jobs:
 build-amd64                                                  pass    


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


