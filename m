Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFF3F3CC2
	for <lists+xen-devel@lfdr.de>; Sun, 22 Aug 2021 01:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169873.310244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHaR7-0005Fa-RL; Sat, 21 Aug 2021 23:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169873.310244; Sat, 21 Aug 2021 23:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHaR7-0005BC-Nc; Sat, 21 Aug 2021 23:30:01 +0000
Received: by outflank-mailman (input) for mailman id 169873;
 Sat, 21 Aug 2021 23:29:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHaR5-0005Ak-Fd; Sat, 21 Aug 2021 23:29:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHaR5-0005S5-6T; Sat, 21 Aug 2021 23:29:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHaR4-00035r-UK; Sat, 21 Aug 2021 23:29:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mHaR4-0004Qo-Tq; Sat, 21 Aug 2021 23:29:58 +0000
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
	bh=Orp19uPE0lUzTvT1f10J+UJWNYp/AIQrv9PXEn+7hvE=; b=JxhCD+B3diLWFET8AkdKSML49H
	oe9b7hEdWIFoSKSAyzhKRVV4kqtRfFKB+QYCZ+ROJ3PMeZ11wk4RK618vu7cmiJS9T6zHtYzrT+J4
	xxpSdTa2UYRE2eWQzNNDvEyiZY4q6tE7dMRkb5oh/nefpg/v4Y3ZosvO5/OrjRZDol90=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1mHaR4-0004Qo-Tq@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 21 Aug 2021 23:29:58 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6b1ca51b1a91d002636518afe4a8a50ba7212495
  Bug not present: 4c0a19991465fc19c5afa9bc3f304bae6044314e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164318/


  commit 6b1ca51b1a91d002636518afe4a8a50ba7212495
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 18 09:40:08 2021 +0200
  
      x86/PV: assert page state in mark_pv_pt_pages_rdonly()
      
      About every time I look at dom0_construct_pv()'s "calculation" of
      nr_pt_pages I question (myself) whether the result is precise or merely
      an upper bound. I think it is meant to be precise, but I think we would
      be better off having some checking in place. Hence add ASSERT()s to
      verify that
      - all pages have a valid L1...Ln (currently L4) page table type and
      - no other bits are set, in particular the type refcount is still zero.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.xen-boot --summary-out=tmp/164318.bisection-summary --basis-template=164237 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm xen-boot
Searching for failure / basis pass:
 164264 fail [host=huxelrebe1] / 164237 [host=chardonnay0] 164230 [host=huxelrebe0] 164171 [host=pinot1] 164154 [host=albana0] 164149 [host=elbling1] 164145 [host=albana1] 164129 [host=chardonnay0] 164123 [host=elbling0] 164119 ok.
Failure / basis pass flights: 164264 / 164119
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5293470a77ad980dce2af9b7e6c3f11eeebf1b64
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2b45ff60301a988badec526846e77b538383ae63
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54\
 ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#2b45ff60301a988badec526846e77b538383ae63-5293470a77ad980dce2af9b7e6c3f11eeebf1b64
Loaded 5001 nodes in revision graph
Searching for test results:
 164116 [host=albana1]
 164119 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2b45ff60301a988badec526846e77b538383ae63
 164123 [host=elbling0]
 164129 [host=chardonnay0]
 164145 [host=albana1]
 164149 [host=elbling1]
 164154 [host=albana0]
 164171 [host=pinot1]
 164230 [host=huxelrebe0]
 164237 [host=chardonnay0]
 164248 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
 164264 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5293470a77ad980dce2af9b7e6c3f11eeebf1b64
 164294 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2b45ff60301a988badec526846e77b538383ae63
 164296 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
 164303 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 60a9d8d2fc9c4a524c7342499580a88aaa3a2b55
 164306 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
 164307 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 54c9736382e0d558a6acd820e44185e020131c48
 164308 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164310 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5293470a77ad980dce2af9b7e6c3f11eeebf1b64
 164313 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
 164314 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164315 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
 164317 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
 164318 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 6b1ca51b1a91d002636518afe4a8a50ba7212495
Searching for interesting versions
 Result found: flight 164119 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e, results HASH(0x55db81533920) HASH(0x55db81541048) HASH(0x55db8153d190) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9b\
 c4179dc64b15b2bb5f0c54ca4ddf823 54c9736382e0d558a6acd820e44185e020131c48, results HASH(0x55db8152ab58) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b, results HASH(0x55db8153aa08) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 60a9d8d2fc9c4a524c7342499580a88aaa3a2b55, results HASH(0x55db81535ad0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 2b45ff60301a988badec526846e77b538383ae63, results HASH(0x55db81531018) HASH(0x55db815295d0) Result found: flight 164248 (fail), \
 for basis failure (at ancestor ~680)
 Repro found: flight 164294 (pass), for basis pass
 Repro found: flight 164310 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 4c0a19991465fc19c5afa9bc3f304bae6044314e
No revisions left to test, checking graph state.
 Result found: flight 164308 (pass), for last pass
 Result found: flight 164313 (fail), for first failure
 Repro found: flight 164314 (pass), for last pass
 Repro found: flight 164315 (fail), for first failure
 Repro found: flight 164317 (pass), for last pass
 Repro found: flight 164318 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  6b1ca51b1a91d002636518afe4a8a50ba7212495
  Bug not present: 4c0a19991465fc19c5afa9bc3f304bae6044314e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164318/


  commit 6b1ca51b1a91d002636518afe4a8a50ba7212495
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 18 09:40:08 2021 +0200
  
      x86/PV: assert page state in mark_pv_pt_pages_rdonly()
      
      About every time I look at dom0_construct_pv()'s "calculation" of
      nr_pt_pages I question (myself) whether the result is precise or merely
      an upper bound. I think it is meant to be precise, but I think we would
      be better off having some checking in place. Hence add ASSERT()s to
      verify that
      - all pages have a valid L1...Ln (currently L4) page table type and
      - no other bits are set, in particular the type refcount is still zero.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164318: tolerable ALL FAIL

flight 164318 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164318/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    


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


