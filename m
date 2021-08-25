Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1663F7648
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172372.314481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItG8-0006OL-2h; Wed, 25 Aug 2021 13:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172372.314481; Wed, 25 Aug 2021 13:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItG7-0006Lc-U7; Wed, 25 Aug 2021 13:48:03 +0000
Received: by outflank-mailman (input) for mailman id 172372;
 Wed, 25 Aug 2021 13:48:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mItG6-0006LS-9g; Wed, 25 Aug 2021 13:48:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mItG6-0006FW-3G; Wed, 25 Aug 2021 13:48:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mItG5-0003Y9-LX; Wed, 25 Aug 2021 13:48:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mItG5-0006K6-Kz; Wed, 25 Aug 2021 13:48:01 +0000
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
	bh=D8A66YMFUPOTQB6t0Tv9iSFI7geuxMGVHQD3gowCWI8=; b=LyIiGOyBY7uAIPncv2z5tn0v9f
	46LXW4aV8YJKckI3zd08ra/VVI+93Bh96TcbwhnW4u+FVIcSFXU84N41L+J+Gxq+Ehwx5x2zY2lAS
	tqdnwjcMIhl5Wfa/p2nce8Xe7YYMw1rNgkkA5GA3ndb+cTEeCUxwIb+DL9u61uYDgIDU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1mItG5-0006K6-Kz@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Aug 2021 13:48:01 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job test-amd64-i386-xl-qemuu-ovmf-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164482/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164482.bisection-summary --basis-template=163759 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164390 fail [host=chardonnay0] / 163759 [host=albana1] 163727 [host=huxelrebe0] 163710 [host=elbling0] 162882 [host=albana1] 162561 [host=fiano0] 162546 [host=pinot1] 162366 [host=albana0] 161772 [host=chardonnay1] 161322 [host=chardonnay1] 161049 [host=elbling0] 160774 [host=huxelrebe0] 160455 [host=elbling0] 160422 [host=chardonnay1] 160394 ok.
Failure / basis pass flights: 164390 / 160394
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#0ecdcb6142037dd1cdd08660a2349960bcf0270a-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-e2af2d050338c99e8436e251ad67aafb3ebbd501 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#ecdff2f5a03210119b71806c3f5571d6906dd85e-6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
Loaded 12608 nodes in revision graph
Searching for test results:
 162882 [host=albana1]
 163710 [host=elbling0]
 163727 [host=huxelrebe0]
 163759 [host=albana1]
 164262 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164397 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
 164390 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164433 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164439 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b005f9f1f51c2b0ce680b42b7a743b430d8f2625 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164444 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c75a0720800e934c29aae75e3fb1cb42c0d0728 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee c86d8ec3b816cc1317d9cc2fb0817e59b5bc4cfa
 164448 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cfa6ffb113f2c0d922034cc77c0d6c52eea05497 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 280d472f4fca070a10377e318d90cabfc2540810
 164451 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1636fe18fb240060fdd8956ccf9e9c7c3ac8205 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 280d472f4fca070a10377e318d90cabfc2540810
 164456 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 180f1908b34f9cca0792d442a9deaae7f6e9beab 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164462 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164464 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164468 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8899e3fe6ab2b376bb3eac79ecd04561d55fe7a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164472 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164474 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164476 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164480 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164482 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 160394 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
 160422 [host=chardonnay1]
 160455 [host=elbling0]
 160774 [host=huxelrebe0]
 161049 [host=elbling0]
 161322 [host=chardonnay1]
 161772 [host=chardonnay1]
 162366 [host=albana0]
 162546 [host=pinot1]
 162561 [host=fiano0]
Searching for interesting versions
 Result found: flight 160394 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x5622990281c8) HASH(0x56229ab0dab8) HASH(0x56229ab0d4b8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x56229ac36bc8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 180f1908b34f9cca0792d442a9deaae7f6e9beab 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251\
 ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x56229ab3e248) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1636fe18fb240060fdd8956ccf9e9c7c3ac8205 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 280d472f4fca070a10377e318d90cabfc2540810, results HASH(0x56229ab37008) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cfa6ffb113f2c0d922034cc77c0d6c52eea05497 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 280d472f4fca070a10377e318d90cabfc2540810, results HASH(0x56229ab2efc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c75a0720800e934c29a\
 ae75e3fb1cb42c0d0728 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee c86d8ec3b816cc1317d9cc2fb0817e59b5bc4cfa, results HASH(0x56229ab27d80) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab0\
 6dfee ecdff2f5a03210119b71806c3f5571d6906dd85e, results HASH(0x56229aae6038) HASH(0x56229aaf75c8) Result found: flight 164262 (fail), for basis failure (at ancestor ~5256)
 Repro found: flight 164397 (pass), for basis pass
 Repro found: flight 164433 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
No revisions left to test, checking graph state.
 Result found: flight 164464 (pass), for last pass
 Result found: flight 164472 (fail), for first failure
 Repro found: flight 164474 (pass), for last pass
 Repro found: flight 164476 (fail), for first failure
 Repro found: flight 164480 (pass), for last pass
 Repro found: flight 164482 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164482/


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

pnmtopng: 69 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164482: tolerable ALL FAIL

flight 164482 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164482/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


