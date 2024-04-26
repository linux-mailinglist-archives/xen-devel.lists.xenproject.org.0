Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E298B401F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713095.1114100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0RDg-0006hI-Kw; Fri, 26 Apr 2024 19:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713095.1114100; Fri, 26 Apr 2024 19:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0RDg-0006fS-GS; Fri, 26 Apr 2024 19:26:52 +0000
Received: by outflank-mailman (input) for mailman id 713095;
 Fri, 26 Apr 2024 19:26:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0RDf-0006fI-H5; Fri, 26 Apr 2024 19:26:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0RDf-0006fR-BS; Fri, 26 Apr 2024 19:26:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0RDf-0002vl-3K; Fri, 26 Apr 2024 19:26:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s0RDf-0008MU-2q; Fri, 26 Apr 2024 19:26:51 +0000
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
	bh=AOwiWhVxDGR4PrAjciEEZiT0iIodm6J+DJYkzhJcJKA=; b=3g8ksDY4e3BSCYzBvKpDyWajRQ
	1YHp/mQt6Azcdh7bTbEFLLumvU641yLqId9nQlUMa6YrlNrn7JKLVhhA29M67KIO4jjW4H+6FZ9WG
	nFDPgTis78xSQ2Jrvd399CKmiN1/Q9Al6FHTPMOneykGdwGPwrRMxUUekPWeSEn2EyVE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-livepatch
Message-Id: <E1s0RDf-0008MU-2q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Apr 2024 19:26:51 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-livepatch
testid livepatch-run

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  62a72092a51792ab74d64ad7454c11e0c22629a2
  Bug not present: fb2716a19190201ffb8d1b20cd9002f166000478
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185825/


  commit 62a72092a51792ab74d64ad7454c11e0c22629a2
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Apr 25 09:52:16 2024 +0200
  
      livepatch: introduce --force option
      
      Introduce a xen-livepatch tool --force option, that's propagated into the
      hyerpvisor for livepatch operations.  The intention is for the option to be
      used to bypass some checks that would otherwise prevent the patch from being
      loaded.
      
      Re purpose the pad field in xen_sysctl_livepatch_op to be a flags field that
      applies to all livepatch operations.  The flag is currently only set by the
      hypercall wrappers for the XEN_SYSCTL_LIVEPATCH_UPLOAD operation, as that's so
      far the only one where it will be used initially.  Other uses can be added as
      required.
      
      Note that helpers would set the .pad field to 0, that's been removed since the
      structure is already zero initialized at definition.
      
      No functional usages of the new flag introduced in this patch.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run --summary-out=tmp/185825.bisection-summary --basis-template=185794 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-livepatch livepatch-run
Searching for failure / basis pass:
 185806 fail [host=fiano1] / 185794 [host=debina1] 185786 [host=italia1] 185780 [host=rimava0] 185767 [host=albana0] 185762 [host=nobling1] 185754 [host=sabro1] 185748 [host=septiner1] 185744 [host=rimava1] 185742 [host=nobling0] 185741 [host=godello0] 185737 [host=huxelrebe1] 185731 [host=albana1] 185712 [host=italia0] 185674 [host=godello1] 185635 [host=fiano0] 185622 [host=septiner0] 185457 [host=debina0] 185386 [host=himrod0] 185310 [host=huxelrebe0] 185294 [host=sabro0] 185281 [host=italia1\
 ] 185277 [host=debina1] 185274 [host=albana0] 185271 [host=pinot1] 185268 ok.
Failure / basis pass flights: 185806 / 185268
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
Basis pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 402c2d3e66a6bc9481dcabfc8697750dc4beabed
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#347385861c50adc8d4801d4b899eded38a2f04cd-6741e066ec7633450d3186946035c1f80c4226b8 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#402c2d3e66a6bc9481dcabfc8697750dc4beabed-232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
Loaded 10001 nodes in revision graph
Searching for test results:
 185253 [host=rimava1]
 185262 [host=italia0]
 185268 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 402c2d3e66a6bc9481dcabfc8697750dc4beabed
 185271 [host=pinot1]
 185274 [host=albana0]
 185277 [host=debina1]
 185281 [host=italia1]
 185294 [host=sabro0]
 185310 [host=huxelrebe0]
 185386 [host=himrod0]
 185457 [host=debina0]
 185508 []
 185528 []
 185564 []
 185597 []
 185622 [host=septiner0]
 185635 [host=fiano0]
 185674 [host=godello1]
 185712 [host=italia0]
 185729 []
 185731 [host=albana1]
 185737 [host=huxelrebe1]
 185741 [host=godello0]
 185742 [host=nobling0]
 185744 [host=rimava1]
 185748 [host=septiner1]
 185754 [host=sabro1]
 185762 [host=nobling1]
 185767 [host=albana0]
 185780 [host=rimava0]
 185786 [host=italia1]
 185794 [host=debina1]
 185800 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 6d5111b10e084d841284a56e962c61ad274f589e
 185807 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 402c2d3e66a6bc9481dcabfc8697750dc4beabed
 185808 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 6d5111b10e084d841284a56e962c61ad274f589e
 185809 pass b510fbe3a7bf26a6b8fcaa23d0275bb383f95dfd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
 185811 pass 2e8dc5cffc844dacfa79f056dea88002312f253f c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ad363fb17d720f1ad047775e1d7b70158f546c46
 185813 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 58798e3f1f0609c773325274b654a8a946413d83
 185814 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b3e66aa1c23db7e70fd67ba110a7c802e2297393
 185815 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0d02b75d7cd3a24989d7982f6a0b0c8da580074e
 185816 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fb2716a19190201ffb8d1b20cd9002f166000478
 185817 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 8c01d0e3361d827b552a8f5323c18a4d4f07e06a
 185818 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 62a72092a51792ab74d64ad7454c11e0c22629a2
 185819 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fb2716a19190201ffb8d1b20cd9002f166000478
 185806 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
 185820 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 62a72092a51792ab74d64ad7454c11e0c22629a2
 185822 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
 185823 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fb2716a19190201ffb8d1b20cd9002f166000478
 185825 fail 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 62a72092a51792ab74d64ad7454c11e0c22629a2
Searching for interesting versions
 Result found: flight 185268 (pass), for basis pass
 For basis failure, parent search stopping at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fb2716a19190201ffb8d1b20cd9002f166000478, results HASH(0x559600269900) HASH(0x559600254d50) HASH(0x55960026b908) For basis failure, parent search stopping at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 0d02b75d7cd3a24989d7982f6a0b0c8da580074e, results HASH(0x559600226f90) For basis failure, parent search stopping at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b3e66aa1c23db7e70fd67ba110a7c802e2297393, results HASH(0x55960022edf8) For basis failure, parent search stopping at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 58798e3f1f0609c773325274b654a8a946413d83, results HASH(0x5596002497d8) For basis failure, parent search stopping at 2e8dc5cffc844dacfa79f056dea88002312f253f c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ad363fb17d720f1ad047775e1d7b70158f546c46, results HASH(0x55960025ef88) For basis failure, parent search stopping at b510fbe3a7bf\
 26a6b8fcaa23d0275bb383f95dfd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429, results HASH(0x559600255350) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 402c2d3e66a6bc9481dcabfc8697750dc4beabed, results HASH(0x55960023dd8\
 0) HASH(0x55960025cc80) Result found: flight 185800 (fail), for basis failure (at ancestor ~3467)
 Repro found: flight 185807 (pass), for basis pass
 Repro found: flight 185822 (fail), for basis failure
 0 revisions at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 fb2716a19190201ffb8d1b20cd9002f166000478
No revisions left to test, checking graph state.
 Result found: flight 185816 (pass), for last pass
 Result found: flight 185818 (fail), for first failure
 Repro found: flight 185819 (pass), for last pass
 Repro found: flight 185820 (fail), for first failure
 Repro found: flight 185823 (pass), for last pass
 Repro found: flight 185825 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  62a72092a51792ab74d64ad7454c11e0c22629a2
  Bug not present: fb2716a19190201ffb8d1b20cd9002f166000478
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185825/


  commit 62a72092a51792ab74d64ad7454c11e0c22629a2
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Apr 25 09:52:16 2024 +0200
  
      livepatch: introduce --force option
      
      Introduce a xen-livepatch tool --force option, that's propagated into the
      hyerpvisor for livepatch operations.  The intention is for the option to be
      used to bypass some checks that would otherwise prevent the patch from being
      loaded.
      
      Re purpose the pad field in xen_sysctl_livepatch_op to be a flags field that
      applies to all livepatch operations.  The flag is currently only set by the
      hypercall wrappers for the XEN_SYSCTL_LIVEPATCH_UPLOAD operation, as that's so
      far the only one where it will be used initially.  Other uses can be added as
      required.
      
      Note that helpers would set the .pad field to 0, that's been removed since the
      structure is already zero initialized at definition.
      
      No functional usages of the new flag introduced in this patch.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>

pnmtopng: 103 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
185825: tolerable ALL FAIL

flight 185825 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185825/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-livepatch   13 livepatch-run           fail baseline untested


jobs:
 test-amd64-amd64-livepatch                                   fail    


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


