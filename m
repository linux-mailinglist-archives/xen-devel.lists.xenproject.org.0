Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D73FB30E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 11:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174924.318821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKdSZ-000434-OZ; Mon, 30 Aug 2021 09:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174924.318821; Mon, 30 Aug 2021 09:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKdSZ-00040r-HY; Mon, 30 Aug 2021 09:20:07 +0000
Received: by outflank-mailman (input) for mailman id 174924;
 Mon, 30 Aug 2021 09:20:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKdSY-0003wf-Co; Mon, 30 Aug 2021 09:20:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKdSY-0002Mv-5x; Mon, 30 Aug 2021 09:20:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKdSX-00031c-Ue; Mon, 30 Aug 2021 09:20:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKdSX-0006hZ-U9; Mon, 30 Aug 2021 09:20:05 +0000
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
	bh=6QBAZH7wTPfH1zz7HOv7Y1XrynEWgkixp1qcszOy3HY=; b=zwc140740MlbPYvoeRSD8/xIpZ
	SXwBdn60d6qL8KdxkQzxMxS6YfUvI4EQZkwo678s37se5ZO8X263dAQxJdqXRpAhh+NtoPPee0yrH
	YcED2tiAQHekGwc11t4UjVzcPHJCG60duJrYipqGMZXkiYfcFOU9Qwptvmx2QB3yj9EQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1mKdSX-0006hZ-U9@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Aug 2021 09:20:05 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164639/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164639.bisection-summary --basis-template=162548 --blessings=real,real-bisect,real-retry xen-4.11-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164535 fail [host=huxelrebe0] / 162548 ok.
Failure / basis pass flights: 164535 / 162548
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bb\
 a25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#cf8d15e2819784ed2360b7b557f72db8f8db5ff6-cf8d15e2819784ed2360b7b557f72db8f8db5ff6 git://xenbits.xen.org/osstest/seabios.git#7292e4a0a8f58333ccbd2d0d47242f9865083c9c-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#ef32c7afa2731b758226d6e10a1e489b1a15fc41-ec4654ce64d87f14567008cfb42568fd434f1bed
Loaded 7857 nodes in revision graph
Searching for test results:
 164486 fail irrelevant
 164503 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
 164535 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
 164605 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164610 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
 164616 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb33c27fbed6c1ed39d243bedd407e8e93a2b3a9 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 e3c30795823672eec9bde75187e184f23ed98d70 ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164619 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 11b1c1d4b98bc1b5eaaaf9eaa94ecd34eeaba5f9 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 e3c30795823672eec9bde75187e184f23ed98d70 ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164621 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32fef03563abb58c439488836cf7884ceb1d7901 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164624 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164626 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164627 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2833589ad054ee51fadc5c408de4f028ddf485e3 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164628 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164629 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164632 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164633 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164637 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164639 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
 162548 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
Searching for interesting versions
 Result found: flight 162548 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41, results HASH(0x563fda336070) HASH(0x563fda30b4e0) HASH(0x563fda41dc90) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41, results HASH(0x563fda403c90) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b5\
 57f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41, results HASH(0x563fda410ba8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41, results HASH(0x563fda320aa8) HASH(0x56\
 3fda32a018) Result found: flight 164503 (fail), for basis failure (at ancestor ~874)
 Repro found: flight 164605 (pass), for basis pass
 Repro found: flight 164610 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef32c7afa2731b758226d6e10a1e489b1a15fc41
No revisions left to test, checking graph state.
 Result found: flight 164629 (pass), for last pass
 Result found: flight 164632 (fail), for first failure
 Repro found: flight 164633 (pass), for last pass
 Repro found: flight 164634 (fail), for first failure
 Repro found: flight 164637 (pass), for last pass
 Repro found: flight 164639 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164639/


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

pnmtopng: 171 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164639: tolerable ALL FAIL

flight 164639 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164639/

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


