Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF19A4FED
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 19:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822612.1236576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2D0y-0003Oq-Ia; Sat, 19 Oct 2024 17:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822612.1236576; Sat, 19 Oct 2024 17:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2D0y-0003ME-FP; Sat, 19 Oct 2024 17:13:20 +0000
Received: by outflank-mailman (input) for mailman id 822612;
 Sat, 19 Oct 2024 17:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2D0w-0003M4-GW; Sat, 19 Oct 2024 17:13:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2D0w-0002f4-CW; Sat, 19 Oct 2024 17:13:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2D0w-0007uZ-4Y; Sat, 19 Oct 2024 17:13:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t2D0w-0005rF-45; Sat, 19 Oct 2024 17:13:18 +0000
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
	bh=4cvpDsYXO8+y0WzHYCoo67nIPR18LGizZ8IBpw2SNFo=; b=GvrDbgplRrPzi5t7Zey/E1JKLU
	dkVes5vusGG1JlElcF45yIJNai5v4IaM/SFuXv5h6Oa+BsgJKTf/t2FW+Rx/nsowNTDw95HGnaGAx
	+NJRsZC1VkMI0xdQBBGPnO5Mdb+R9jGKKK/64hIuKFov9V9Lbdl5q/paKZzvKSliDxjE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-pvshim
Message-Id: <E1t2D0w-0005rF-45@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Oct 2024 17:13:18 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-pvshim
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  038826b61e852469b1a54690dba6d142aceb1f20
  Bug not present: 081683ea578da56dd20b9dc22a64d03c893b47ba
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188306/


  commit 038826b61e852469b1a54690dba6d142aceb1f20
  Author: Christopher Clark <christopher.w.clark@gmail.com>
  Date:   Thu Oct 17 13:02:41 2024 -0400
  
      x86/boot: move x86 boot module counting into a new boot_info struct
      
      An initial step towards a non-multiboot internal representation of boot
      modules for common code, starting with x86 setup and converting the fields
      that are accessed for the startup calculations.
      
      Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
      structure initially containing a count of the number of boot modules.
      
      No functional change intended.
      
      Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
      Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
      Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-pvshim.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-pvshim.guest-start --summary-out=tmp/188306.bisection-summary --basis-template=188153 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-pvshim guest-start
Searching for failure / basis pass:
 188282 fail [host=nobling0] / 188193 [host=italia0] 188153 [host=fiano0] 188128 [host=albana0] 188110 [host=rimava0] 188095 [host=pinot0] 188088 [host=sabro1] 188085 [host=sabro0] 188079 [host=godello1] 188071 [host=italia1] 188067 [host=septiner1] 188061 [host=godello0] 188052 [host=rimava1] 188045 [host=septiner0] 188034 [host=debina1] 188018 [host=huxelrebe1] 188009 [host=fiano1] 188000 [host=huxelrebe0] 187991 [host=pinot1] 187986 [host=albana1] 187979 [host=italia0] 187968 [host=nobling1] \
 187955 ok.
Failure / basis pass flights: 188282 / 187955
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 e9f227685e7204cb2293576ee5b745b828cb3cd7
Basis pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 444cb9350f2c1cc202b6b86176ddd8e57525e2d9
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#aa4cd140bba57b7064b4c7a7141bebd336d32087-54d90d17e8cee20b163d395829162cec92b583f4 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-3fdb3cd3a27a22a050c7d27126a24807a7a45745 git://xenbits.xen.org/xen.git#444cb9350f2c1cc202b6b86176ddd8e57525e2d9-e9f227685e7204cb2293576ee5b745b828cb3cd7
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 10002 nodes in revision graph
Searching for test results:
 188248 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 a285d2ac2e524c808091062c67142cf5924b56f6
 188282 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 e9f227685e7204cb2293576ee5b745b828cb3cd7
 188283 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 444cb9350f2c1cc202b6b86176ddd8e57525e2d9
 188284 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 a285d2ac2e524c808091062c67142cf5924b56f6
 188286 pass 3ff50bc627aa309e256f30ae17ac7c69cbc2e94d c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188287 pass bc2cbf7525ac288e07d465f5a1d8cb8fb9599254 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188290 pass ec5b06acbe9371c7c89fe9dbee46e6030d408c89 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188291 pass 9a9747288ba0a9ad4f5c9877f18dd245770ad64e c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188293 pass 1132e01090016277431454417a2649d3921cd6ea c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188294 pass 9c4198dfdca818c5ce19c764d90eabd156bbc6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188295 pass 2da76b4d08aed3cd3bbaccc9d18cf7f1d4f58994 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
 188297 pass 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 081683ea578da56dd20b9dc22a64d03c893b47ba
 188298 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b438c5fbf4c02145f6ecc8642290d46bf1957388
 188299 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 038826b61e852469b1a54690dba6d142aceb1f20
 188300 pass 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 081683ea578da56dd20b9dc22a64d03c893b47ba
 188301 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 038826b61e852469b1a54690dba6d142aceb1f20
 188302 pass 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 081683ea578da56dd20b9dc22a64d03c893b47ba
 188304 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 e9f227685e7204cb2293576ee5b745b828cb3cd7
 188306 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 038826b61e852469b1a54690dba6d142aceb1f20
 187955 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 444cb9350f2c1cc202b6b86176ddd8e57525e2d9
 187968 [host=nobling1]
 187979 [host=italia0]
 187986 [host=albana1]
 187991 [host=pinot1]
 188000 [host=huxelrebe0]
 188009 [host=fiano1]
 188018 [host=huxelrebe1]
 188034 [host=debina1]
 188045 [host=septiner0]
 188052 [host=rimava1]
 188061 [host=godello0]
 188067 [host=septiner1]
 188071 [host=italia1]
 188079 [host=godello1]
 188085 [host=sabro0]
 188088 [host=sabro1]
 188095 [host=pinot0]
 188110 [host=rimava0]
 188128 [host=albana0]
 188193 [host=italia0]
 188153 [host=fiano0]
Searching for interesting versions
 Result found: flight 187955 (pass), for basis pass
 For basis failure, parent search stopping at 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 081683ea578da56dd20b9dc22a64d03c893b47ba, results HASH(0x55e0ff7751f0) HASH(0x55e0ff769978) HASH(0x55e0ff76c280) For basis failure, parent search stopping at 2da76b4d08aed3cd3bbaccc9d18cf7f1d4f58994 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a\
 27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff74bd68) For basis failure, parent search stopping at 9c4198dfdca818c5ce19c764d90eabd156bbc6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff793df0) For basis failure, parent search stopping at 1132e01090016277431454417a2649d3921cd6ea c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff78fdb8) For basis failure, parent search stopping at 9a9747288ba0a9ad4f5c9877f18dd245770ad64e c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff78bda8) For basis failure, parent search stopping at ec5b06acbe93\
 71c7c89fe9dbee46e6030d408c89 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff75a6f0) For basis failure, parent search stopping at bc2cbf7525ac288e07d465f5a1d8cb8fb9599254 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff784b6\
 8) For basis failure, parent search stopping at 3ff50bc627aa309e256f30ae17ac7c69cbc2e94d c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d, results HASH(0x55e0ff753db0) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 444cb935\
 0f2c1cc202b6b86176ddd8e57525e2d9, results HASH(0x55e0ff7529a8) HASH(0x55e0ff799628) Result found: flight 188248 (fail), for basis failure (at ancestor ~4766)
 Repro found: flight 188283 (pass), for basis pass
 Repro found: flight 188304 (fail), for basis failure
 0 revisions at 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 081683ea578da56dd20b9dc22a64d03c893b47ba
No revisions left to test, checking graph state.
 Result found: flight 188297 (pass), for last pass
 Result found: flight 188299 (fail), for first failure
 Repro found: flight 188300 (pass), for last pass
 Repro found: flight 188301 (fail), for first failure
 Repro found: flight 188302 (pass), for last pass
 Repro found: flight 188306 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  038826b61e852469b1a54690dba6d142aceb1f20
  Bug not present: 081683ea578da56dd20b9dc22a64d03c893b47ba
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188306/


  commit 038826b61e852469b1a54690dba6d142aceb1f20
  Author: Christopher Clark <christopher.w.clark@gmail.com>
  Date:   Thu Oct 17 13:02:41 2024 -0400
  
      x86/boot: move x86 boot module counting into a new boot_info struct
      
      An initial step towards a non-multiboot internal representation of boot
      modules for common code, starting with x86 setup and converting the fields
      that are accessed for the startup calculations.
      
      Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
      structure initially containing a count of the number of boot modules.
      
      No functional change intended.
      
      Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
      Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
      Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.632177 to fit
pnmtopng: 39 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-pvshim.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
188306: tolerable ALL FAIL

flight 188306 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/188306/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-pvshim   14 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-xl-pvshim                                   fail    


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


