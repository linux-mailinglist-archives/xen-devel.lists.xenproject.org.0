Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967F5F01AD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 02:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413956.657962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe3Xk-0005Xs-SQ; Fri, 30 Sep 2022 00:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413956.657962; Fri, 30 Sep 2022 00:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe3Xk-0005UN-OJ; Fri, 30 Sep 2022 00:06:16 +0000
Received: by outflank-mailman (input) for mailman id 413956;
 Fri, 30 Sep 2022 00:06:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe3Xi-0005UD-Oq; Fri, 30 Sep 2022 00:06:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe3Xi-0004Ic-MJ; Fri, 30 Sep 2022 00:06:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe3Xi-0007tW-Dk; Fri, 30 Sep 2022 00:06:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oe3Xi-00030R-DA; Fri, 30 Sep 2022 00:06:14 +0000
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
	bh=yy+dUFVMF/t5TsC8QgU58o0M7+ZireSy+nHw5HA/Rl8=; b=JWCRKiAoSB+dhWAisLjkzrkJik
	2oUJGnghV8gnZ03el/L2miJv7F7QZ0C1Hb6FIYtMd9e2IdsL2Jnx225S2q1kdfv1nQ85xDOBTP70Y
	tyJEPAfvFjJ65h2Do3oRFsNyJJoM/FcHgOaFQlOyxu70zGEOEtnIFfTQdHfJS22f/43Y=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1oe3Xi-00030R-DA@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Sep 2022 00:06:14 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c4e5cc2ccc5b8274d02f7855c4769839989bb349
  Bug not present: 9982fe275ba4ee1a749b6dde5602a5a79e42b543
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173377/


  commit c4e5cc2ccc5b8274d02f7855c4769839989bb349
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Sep 29 14:44:10 2022 +0200
  
      x86/ept: limit calls to memory_type_changed()
      
      memory_type_changed() is currently only implemented for Intel EPT, and
      results in the invalidation of EMT attributes on all the entries in
      the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
      when the guest tries to access any gfns for the first time, which
      results in the recalculation of the EMT for the accessed page.  The
      vmexit and the recalculations are expensive, and as such should be
      avoided when possible.
      
      Remove the call to memory_type_changed() from
      XEN_DOMCTL_memory_mapping: there are no modifications of the
      iomem_caps ranges anymore that could alter the return of
      cache_flush_permitted() from that domctl.
      
      Encapsulate calls to memory_type_changed() resulting from changes to
      the domain iomem_caps or ioport_caps ranges in the helpers themselves
      (io{ports,mem}_{permit,deny}_access()), and add a note in
      epte_get_entry_emt() to remind that changes to the logic there likely
      need to be propagaed to the IO capabilities helpers.
      
      Note changes to the IO ports or memory ranges are not very common
      during guest runtime, but Citrix Hypervisor has an use case for them
      related to device passthrough.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/173377.bisection-summary --basis-template=173347 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 173370 fail [host=rochester0] / 173347 [host=rochester1] 173342 [host=rochester1] 173333 ok.
Failure / basis pass flights: 173370 / 173333
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
Basis pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5e936d11b171793c174686268c9c1df8a4fa974c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#5e936d11b171793c174686268c9c1df8a4fa974c-fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
Loaded 5001 nodes in revision graph
Searching for test results:
 173373 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9982fe275ba4ee1a749b6dde5602a5a79e42b543
 173362 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b726541d94bd0a80b5864d17a2cd2e6d73a3fe0a
 173365 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5e936d11b171793c174686268c9c1df8a4fa974c
 173366 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 b726541d94bd0a80b5864d17a2cd2e6d73a3fe0a
 173368 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e1de23b7c1bfa02447a79733e64184b3635e0587
 173367 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
 173369 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9982fe275ba4ee1a749b6dde5602a5a79e42b543
 173372 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c4e5cc2ccc5b8274d02f7855c4769839989bb349
 173370 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
 173374 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c4e5cc2ccc5b8274d02f7855c4769839989bb349
 173376 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9982fe275ba4ee1a749b6dde5602a5a79e42b543
 173377 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 c4e5cc2ccc5b8274d02f7855c4769839989bb349
 173333 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5e936d11b171793c174686268c9c1df8a4fa974c
 173342 [host=rochester1]
 173347 [host=rochester1]
Searching for interesting versions
 Result found: flight 173333 (pass), for basis pass
 For basis failure, parent search stopping at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9982fe275ba4ee1a749b6dde5602a5a79e42b543, results HASH(0x55d736404278) HASH(0x55d736414c98) HASH(0x55d7364189a8) For basis failure, parent search stopping at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e1de23b7c1bfa02447a79733e64184b3635e0587, results HASH(0x55d73640b428) For basis failure, parent search stopping at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5e936d11b171793c174686268c9c1df8a4fa974c, results HASH(0x\
 55d73640c950) HASH(0x55d736421170) Result found: flight 173362 (fail), for basis failure (at ancestor ~575)
 Repro found: flight 173365 (pass), for basis pass
 Repro found: flight 173367 (fail), for basis failure
 0 revisions at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 9982fe275ba4ee1a749b6dde5602a5a79e42b543
No revisions left to test, checking graph state.
 Result found: flight 173369 (pass), for last pass
 Result found: flight 173372 (fail), for first failure
 Repro found: flight 173373 (pass), for last pass
 Repro found: flight 173374 (fail), for first failure
 Repro found: flight 173376 (pass), for last pass
 Repro found: flight 173377 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c4e5cc2ccc5b8274d02f7855c4769839989bb349
  Bug not present: 9982fe275ba4ee1a749b6dde5602a5a79e42b543
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173377/


  commit c4e5cc2ccc5b8274d02f7855c4769839989bb349
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Sep 29 14:44:10 2022 +0200
  
      x86/ept: limit calls to memory_type_changed()
      
      memory_type_changed() is currently only implemented for Intel EPT, and
      results in the invalidation of EMT attributes on all the entries in
      the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
      when the guest tries to access any gfns for the first time, which
      results in the recalculation of the EMT for the accessed page.  The
      vmexit and the recalculations are expensive, and as such should be
      avoided when possible.
      
      Remove the call to memory_type_changed() from
      XEN_DOMCTL_memory_mapping: there are no modifications of the
      iomem_caps ranges anymore that could alter the return of
      cache_flush_permitted() from that domctl.
      
      Encapsulate calls to memory_type_changed() resulting from changes to
      the domain iomem_caps or ioport_caps ranges in the helpers themselves
      (io{ports,mem}_{permit,deny}_access()), and add a note in
      epte_get_entry_emt() to remind that changes to the logic there likely
      need to be propagaed to the IO capabilities helpers.
      
      Note changes to the IO ports or memory ranges are not very common
      during guest runtime, but Citrix Hypervisor has an use case for them
      related to device passthrough.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173377: tolerable ALL FAIL

flight 173377 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173377/

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


