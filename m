Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D63F6FBA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 08:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171811.313512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImcQ-0002xE-7G; Wed, 25 Aug 2021 06:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171811.313512; Wed, 25 Aug 2021 06:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImcQ-0002uy-4I; Wed, 25 Aug 2021 06:42:38 +0000
Received: by outflank-mailman (input) for mailman id 171811;
 Wed, 25 Aug 2021 06:42:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mImcP-0002uo-1u; Wed, 25 Aug 2021 06:42:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mImcO-0005qy-Q5; Wed, 25 Aug 2021 06:42:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mImcO-0000jy-Fp; Wed, 25 Aug 2021 06:42:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mImcO-00053z-FL; Wed, 25 Aug 2021 06:42:36 +0000
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
	bh=fM+QicO1S/4qIIezNqBswbzvXKCujzI5cNGlrG+x+wg=; b=YbZo/aA23ximqMN7g1ohPD1cb2
	oQnnDkIk7I7KcMErdD0GexH2NA5mmxJRCok5Wm+FWJKUHN3H4PQJg3w64BovaTlCyBJ6fSpK7BPiw
	70Hnm8T7hmSEeodU7DKGezyB/1rdx10p1a3GPr4/YuBRmrYetWvmLYR1/kKURqTsIox4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1mImcO-00053z-FL@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Aug 2021 06:42:36 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-amd64-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164473/


  commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Author: Laszlo Ersek <lersek@redhat.com>
  Date:   Wed May 26 22:14:24 2021 +0200
  
      OvmfPkg/PlatformPei: remove Xen support
      
      The "OvmfPkg/PlatformPei/PlatformPei.inf" module is used by the following
      platform DSCs:
      
        OvmfPkg/AmdSev/AmdSevX64.dsc
        OvmfPkg/OvmfPkgIa32.dsc
        OvmfPkg/OvmfPkgIa32X64.dsc
        OvmfPkg/OvmfPkgX64.dsc
      
      Remove Xen support from "OvmfPkg/PlatformPei", including any dependencies
      that now become unused. The basic idea is to substitute FALSE for "mXen".
      
      Remove "OvmfPkg/PlatformPei" from the "OvmfPkg: Xen-related modules"
      section of "Maintainers.txt".
      
      This patch is best reviewed with "git show -b -W".
      
      Cc: Andrew Fish <afish@apple.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Leif Lindholm <leif@nuviainc.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
      Signed-off-by: Laszlo Ersek <lersek@redhat.com>
      Message-Id: <20210526201446.12554-22-lersek@redhat.com>
      Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Leif Lindholm <leif@nuviainc.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164473.bisection-summary --basis-template=163750 --blessings=real,real-bisect,real-retry xen-4.14-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164353 fail [host=elbling1] / 163750 [host=fiano1] 163726 [host=huxelrebe1] 163709 [host=huxelrebe0] 162891 [host=godello1] 162881 [host=huxelrebe1] 162547 [host=godello0] 162365 [host=huxelrebe0] 161771 [host=fiano0] 161484 [host=godello1] 161324 [host=albana0] 161048 [host=godello1] 160156 [host=fiano0] 160143 [host=albana0] 160127 [host=albana1] 159840 [host=fiano1] 159450 [host=huxelrebe1] 159420 [host=godello1] 158558 [host=rimava1] 157673 [host=fiano1] 157564 [host=huxelrebe1] 157133 [hos\
 t=albana0] 156989 [host=fiano0] 156716 [host=fiano1] 156670 [host=albana1] 156617 [host=albana0] 156594 ok.
Failure / basis pass flights: 164353 / 156594
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa 94f0510dc75e910400aad6c169048d672c8c7193 a38060ece699f22cd317219bec53c0d27279155b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#1366cd58cd4459f00b4ecf5abed13e77ac4ad06c-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa-d7d6a60e73ee21e82f0bac2036153ccccf996e6c git://xenbits.xen.org/osstest/seabios.git#94f0510dc75e910400aad6c169048d672c8c7193-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#a38060ece699f22cd317219bec53c0d27279155b-61f28060d5b899c502e2b3bf45a39b1dd2a1224c
Loaded 12608 nodes in revision graph
Searching for test results:
 162881 [host=huxelrebe1]
 162891 [host=godello1]
 163709 [host=huxelrebe0]
 163726 [host=huxelrebe1]
 156594 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa 94f0510dc75e910400aad6c169048d672c8c7193 a38060ece699f22cd317219bec53c0d27279155b
 156617 [host=albana0]
 163750 [host=fiano1]
 156670 [host=albana1]
 156716 [host=fiano1]
 156989 [host=fiano0]
 157133 [host=albana0]
 157564 [host=huxelrebe1]
 157650 []
 157673 [host=fiano1]
 158558 [host=rimava1]
 164261 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164300 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164353 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164408 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa 94f0510dc75e910400aad6c169048d672c8c7193 a38060ece699f22cd317219bec53c0d27279155b
 164416 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164420 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2fba7d4ee4a78c26cf6c3b97a99f38d43f80b3ff 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e a1dab05393ec5654e2a88be296cc973595ffb1d0
 164424 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa7f19f480551b1f19f8798e5b18dbe1d8d32d0c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164429 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 903ce1d8f868e394d5cea477bd568c7d68d109e9 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e3c30795823672eec9bde75187e184f23ed98d70 b6a8c4f72def4d1135ff42660a86276ce2565c8c
 164432 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d58016b768cf82cebbf579e1e5658ef89641d944 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e3c30795823672eec9bde75187e184f23ed98d70 0ff7f9c5aa02cd2469a8fc03f1ed262f18933721
 164437 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 507259373828ca160dea08fff8ffc44572e8be14 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164441 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164445 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32fef03563abb58c439488836cf7884ceb1d7901 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164449 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2833589ad054ee51fadc5c408de4f028ddf485e3 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164453 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164458 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164460 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164463 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 159420 [host=godello1]
 164466 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164469 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164473 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 159450 [host=huxelrebe1]
 159840 [host=fiano1]
 160127 [host=albana1]
 160143 [host=albana0]
 160156 [host=fiano0]
 161048 [host=godello1]
 161324 [host=albana0]
 161484 [host=godello1]
 161771 [host=fiano0]
 162365 [host=huxelrebe0]
 162547 [host=godello0]
Searching for interesting versions
 Result found: flight 156594 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x55d8b7a07a40) HASH(0x55d8b78716b8) HASH(0x55d8b78a3788) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x55d8b78b7738) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa7f19f480551b1f19f8798e5b18dbe1d8d32d0c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac20\
 36153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x55d8b78ba668) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2fba7d4ee4a78c26cf6c3b97a99f38d43f80b3ff 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e a1dab05393ec5654e2a88be296cc973595ffb1d0, results HASH(0x55d8b78b6630) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa 94f0510dc75e910400aad6c169048d672c8c7193 a38060ece699f22cd317219bec53c0d27279155b, results HASH(0x55d8b7898e38) HASH(0x55d8b787cc30) Result found: flight 164261 (fail), for basis failure (at ancestor ~1300)
 Repro found: flight 164408 (pass), for basis pass
 Repro found: flight 164416 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
No revisions left to test, checking graph state.
 Result found: flight 164458 (pass), for last pass
 Result found: flight 164460 (fail), for first failure
 Repro found: flight 164463 (pass), for last pass
 Repro found: flight 164466 (fail), for first failure
 Repro found: flight 164469 (pass), for last pass
 Repro found: flight 164473 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164473/


  commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Author: Laszlo Ersek <lersek@redhat.com>
  Date:   Wed May 26 22:14:24 2021 +0200
  
      OvmfPkg/PlatformPei: remove Xen support
      
      The "OvmfPkg/PlatformPei/PlatformPei.inf" module is used by the following
      platform DSCs:
      
        OvmfPkg/AmdSev/AmdSevX64.dsc
        OvmfPkg/OvmfPkgIa32.dsc
        OvmfPkg/OvmfPkgIa32X64.dsc
        OvmfPkg/OvmfPkgX64.dsc
      
      Remove Xen support from "OvmfPkg/PlatformPei", including any dependencies
      that now become unused. The basic idea is to substitute FALSE for "mXen".
      
      Remove "OvmfPkg/PlatformPei" from the "OvmfPkg: Xen-related modules"
      section of "Maintainers.txt".
      
      This patch is best reviewed with "git show -b -W".
      
      Cc: Andrew Fish <afish@apple.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Leif Lindholm <leif@nuviainc.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
      Signed-off-by: Laszlo Ersek <lersek@redhat.com>
      Message-Id: <20210526201446.12554-22-lersek@redhat.com>
      Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Leif Lindholm <leif@nuviainc.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.495809 to fit
pnmtopng: 46 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164473: tolerable ALL FAIL

flight 164473 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164473/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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


