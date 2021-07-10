Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7503C36FC
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jul 2021 23:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154107.284773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Kv6-000477-Hg; Sat, 10 Jul 2021 21:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154107.284773; Sat, 10 Jul 2021 21:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Kv6-00044K-DH; Sat, 10 Jul 2021 21:53:56 +0000
Received: by outflank-mailman (input) for mailman id 154107;
 Sat, 10 Jul 2021 21:53:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Kv4-00044A-Pk; Sat, 10 Jul 2021 21:53:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Kv4-0003ry-Kn; Sat, 10 Jul 2021 21:53:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Kv4-000611-7K; Sat, 10 Jul 2021 21:53:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Kv4-0004Ly-6o; Sat, 10 Jul 2021 21:53:54 +0000
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
	bh=ZV/0kz48hZNz3r12x9v68EXI/qoI4OO76ADqTEA24eE=; b=kVV82eB0xGhvzOI6vIoKPdYhMe
	NuX9jIgNM/kTgQB919aQ01P+oDoY6SL/ENvZXrYNQoAT17TQPZ/2NIGGz3xTw53qNc5mCD9UZjy/M
	bIG4aQlj5xk26ovZFADSjzq99iwe5HuJfYtf7O/pHcSEoB865wk0i7U8yeKZHjtodujs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-qemuu-nested-amd
Message-Id: <E1m2Kv4-0004Ly-6o@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Jul 2021 21:53:54 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-amd
testid xen-boot/l1

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bfcdaae9c210bd7984d7691285aaf43deb1b0604
  Bug not present: 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163542/


  commit bfcdaae9c210bd7984d7691285aaf43deb1b0604
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jul 9 08:28:14 2021 +0200
  
      x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
      
      Sufficiently old Linux (3.12-ish) accesses these MSRs (with the
      exception of IORRs) in an unguarded manner. Furthermore these same MSRs,
      at least on Fam11 and older CPUs, are also consulted by modern Linux,
      and their (bogus) built-in zapping of #GP faults from MSR accesses leads
      to it effectively reading zero instead of the intended values, which are
      relevant for PCI BAR placement (which ought to all live in MMIO-type
      space, not in DRAM-type one).
      
      For SYSCFG, only certain bits get exposed. Since MtrrVarDramEn also
      covers the IORRs, expose them as well. Introduce (consistently named)
      constants for the bits we're interested in and use them in pre-existing
      code as well. While there also drop the unused and somewhat questionable
      K8_MTRR_RDMEM_WRMEM_MASK. To complete the set of memory type and DRAM vs
      MMIO controlling MSRs, also expose TSEG_{BASE,MASK} (the former also
      gets read by Linux, dealing with which was already the subject of
      6eef0a99262c ["x86/PV: conditionally avoid raising #GP for early guest
      MSR reads"]).
      
      As a welcome side effect, verbosity on/of debug builds gets (perhaps
      significantly) reduced.
      
      Note that at least as far as those MSR accesses by Linux are concerned,
      there's no similar issue for DomU-s, as the accesses sit behind PCI
      device matching logic. The checked for devices would never be exposed to
      DomU-s in the first place. Nevertheless I think that at least for HVM we
      should return sensible values, not 0 (as svm_msr_read_intercept() does
      right now). The intended values may, however, need to be determined by
      hvmloader, and then get made known to Xen.
      
      Fixes: 322ec7c89f66 ("x86/pv: disallow access to unknown MSRs")
      Reported-by: Olaf Hering <olaf@aepfle.de>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1 --summary-out=tmp/163542.bisection-summary --basis-template=163458 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-qemuu-nested-amd xen-boot/l1
Searching for failure / basis pass:
 163506 fail [host=pinot0] / 163458 ok.
Failure / basis pass flights: 163506 / 163458
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54\
 ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#0f435e2b58543f5baae96e17a10ae20d3dbc28fa-6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
Loaded 5001 nodes in revision graph
Searching for test results:
 163458 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163478 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
 163508 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
 163521 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 836314747b0fd1688fc9526f7c73fd9313ba82f3
 163506 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
 163523 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
 163528 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bfcdaae9c210bd7984d7691285aaf43deb1b0604
 163534 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
 163537 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bfcdaae9c210bd7984d7691285aaf43deb1b0604
 163539 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
 163542 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bfcdaae9c210bd7984d7691285aaf43deb1b0604
Searching for interesting versions
 Result found: flight 163458 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111, results HASH(0x5587144c06f0) HASH(0x5587144d0c00) HASH(0x5587144cd070) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9b\
 c4179dc64b15b2bb5f0c54ca4ddf823 0f435e2b58543f5baae96e17a10ae20d3dbc28fa, results HASH(0x5587144c8738) HASH(0x5587144c3980) Result found: flight 163478 (fail), for basis failure (at ancestor ~620)
 Repro found: flight 163508 (pass), for basis pass
 Repro found: flight 163518 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
No revisions left to test, checking graph state.
 Result found: flight 163523 (pass), for last pass
 Result found: flight 163528 (fail), for first failure
 Repro found: flight 163534 (pass), for last pass
 Repro found: flight 163537 (fail), for first failure
 Repro found: flight 163539 (pass), for last pass
 Repro found: flight 163542 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bfcdaae9c210bd7984d7691285aaf43deb1b0604
  Bug not present: 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163542/


  commit bfcdaae9c210bd7984d7691285aaf43deb1b0604
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jul 9 08:28:14 2021 +0200
  
      x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
      
      Sufficiently old Linux (3.12-ish) accesses these MSRs (with the
      exception of IORRs) in an unguarded manner. Furthermore these same MSRs,
      at least on Fam11 and older CPUs, are also consulted by modern Linux,
      and their (bogus) built-in zapping of #GP faults from MSR accesses leads
      to it effectively reading zero instead of the intended values, which are
      relevant for PCI BAR placement (which ought to all live in MMIO-type
      space, not in DRAM-type one).
      
      For SYSCFG, only certain bits get exposed. Since MtrrVarDramEn also
      covers the IORRs, expose them as well. Introduce (consistently named)
      constants for the bits we're interested in and use them in pre-existing
      code as well. While there also drop the unused and somewhat questionable
      K8_MTRR_RDMEM_WRMEM_MASK. To complete the set of memory type and DRAM vs
      MMIO controlling MSRs, also expose TSEG_{BASE,MASK} (the former also
      gets read by Linux, dealing with which was already the subject of
      6eef0a99262c ["x86/PV: conditionally avoid raising #GP for early guest
      MSR reads"]).
      
      As a welcome side effect, verbosity on/of debug builds gets (perhaps
      significantly) reduced.
      
      Note that at least as far as those MSR accesses by Linux are concerned,
      there's no similar issue for DomU-s, as the accesses sit behind PCI
      device matching logic. The checked for devices would never be exposed to
      DomU-s in the first place. Nevertheless I think that at least for HVM we
      should return sensible values, not 0 (as svm_msr_read_intercept() does
      right now). The intended values may, however, need to be determined by
      hvmloader, and then get made known to Xen.
      
      Fixes: 322ec7c89f66 ("x86/pv: disallow access to unknown MSRs")
      Reported-by: Olaf Hering <olaf@aepfle.de>
      Signed-off-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-amd.xen-boot--l1.{dot,ps,png,html,svg}.
----------------------------------------
163542: tolerable ALL FAIL

flight 163542 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163542/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 16 xen-boot/l1        fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-amd                            fail    


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


