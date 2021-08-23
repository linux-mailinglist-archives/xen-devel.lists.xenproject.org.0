Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA23F4400
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 05:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170154.310787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI0wz-00027w-Ar; Mon, 23 Aug 2021 03:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170154.310787; Mon, 23 Aug 2021 03:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI0wz-000264-6T; Mon, 23 Aug 2021 03:48:41 +0000
Received: by outflank-mailman (input) for mailman id 170154;
 Mon, 23 Aug 2021 03:48:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI0wx-00025u-RL; Mon, 23 Aug 2021 03:48:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI0wx-0007yY-HM; Mon, 23 Aug 2021 03:48:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI0wx-0000Vz-Ah; Mon, 23 Aug 2021 03:48:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mI0wx-0006BW-AE; Mon, 23 Aug 2021 03:48:39 +0000
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
	bh=u9jUka+tPfSAHhV1LS4rV6fBqd6lyro/JrZale7KtM8=; b=KrkFz8pmeMqTZJ6Va124atTAjl
	AzFAgtSIjIWJQLAqqJCDtHpk08KynradrzJIjvlCh+8voHzbwpmSh9WQ2wFi0PP85kUtKVv4mQq6Q
	fleXGTe62BrkdKroguXz1Er/AAqEkBy/wKr8b3rsmmGrj6AiJcwbauNR8BHrpRFxLc90=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.15-testing bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1mI0wx-0006BW-AE@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Aug 2021 03:48:39 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164393/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164393.bisection-summary --basis-template=163759 --blessings=real,real-bisect,real-retry xen-4.15-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164304 fail [host=fiano0] / 163759 [host=godello1] 163727 [host=chardonnay0] 163710 [host=fiano1] 162882 [host=chardonnay0] 162561 [host=godello0] 162546 [host=elbling0] 162366 [host=chardonnay1] 161772 [host=fiano1] 161322 [host=godello0] 161049 [host=godello1] 160774 [host=huxelrebe1] 160455 ok.
Failure / basis pass flights: 164304 / 160455
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f037af6ecbc3b55042c998a59ed8df8548e64b99 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7fa14f3f525b4a2d660794424fd787cfdf9c904b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#f037af6ecbc3b55042c998a59ed8df8548e64b99-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-e2af2d050338c99e8436e251ad67aafb3ebbd501 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#7fa14f3f525b4a2d660794424fd787cfdf9c904b-6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
Loaded 12608 nodes in revision graph
Searching for test results:
 162882 [host=chardonnay0]
 163710 [host=fiano1]
 163727 [host=chardonnay0]
 163759 [host=godello1]
 164262 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164305 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f037af6ecbc3b55042c998a59ed8df8548e64b99 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7fa14f3f525b4a2d660794424fd787cfdf9c904b
 164325 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 54082c81d96028ba8c76fbe6784085cf1df76b20 6bbdcefd205903b2181b3b4fdc9503709ecdb7c4
 164330 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2f24ba3218ae91a8d5a1a31c31dad3417850d0c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164339 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 34e16ff883f0e047fb9c0ac5c179f1b084ffbf98 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 280d472f4fca070a10377e318d90cabfc2540810
 164343 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ee2b1d616e8dda8edf1946c403c781983d1888b7
 164348 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4115840c282660b071dbd53c08516e437df1ad0b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164352 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164358 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164361 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164335 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0bbc20727598421c4e47d46b982246217df8c6bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 5788a7e61145d0ad4f93d3ff22f7d6b5dfef7478
 164365 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164369 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164376 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164380 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164386 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 164393 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
 160455 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f037af6ecbc3b55042c998a59ed8df8548e64b99 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7fa14f3f525b4a2d660794424fd787cfdf9c904b
 160774 [host=huxelrebe1]
 161049 [host=godello1]
 161322 [host=godello0]
 161772 [host=fiano1]
 162366 [host=chardonnay1]
 162546 [host=elbling0]
 162561 [host=godello0]
Searching for interesting versions
 Result found: flight 160455 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x55f78eeaef00) HASH(0x55f78ed754d0) HASH(0x55f78ed21ef8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x55f78ed33188) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251\
 ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x55f78ed5d600) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4115840c282660b071dbd53c08516e437df1ad0b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0, results HASH(0x55f78ed828d0) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ee2b1d616e8dda8edf1946c403c781983d1888b7, results HASH(0x55f78ed7b510) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 34e16ff883f0e047fb9c\
 0ac5c179f1b084ffbf98 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 280d472f4fca070a10377e318d90cabfc2540810, results HASH(0x55f78ed64240) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0bbc20727598421c4e47d46b982246217df8c6bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 b0d61ecef66eb05bd7a4eb7ada88ec5dab0\
 6dfee 5788a7e61145d0ad4f93d3ff22f7d6b5dfef7478, results HASH(0x55f78eea6ea8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f037af6ecbc3b55042c998a59ed8df8548e64b99 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7fa14f3f525b4a2d660794424fd787cfdf9c904b, results HASH(0x55f78ed48a50) HASH(0x55f78ed7dc98) Result found: flight 164262 (fail), for \
 basis failure (at ancestor ~695)
 Repro found: flight 164305 (pass), for basis pass
 Repro found: flight 164325 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e2af2d050338c99e8436e251ad67aafb3ebbd501 7292e4a0a8f58333ccbd2d0d47242f9865083c9c eae0dfac891f521ceb6c4733e22a0cd718f336c0
No revisions left to test, checking graph state.
 Result found: flight 164365 (pass), for last pass
 Result found: flight 164369 (fail), for first failure
 Repro found: flight 164376 (pass), for last pass
 Repro found: flight 164380 (fail), for first failure
 Repro found: flight 164386 (pass), for last pass
 Repro found: flight 164393 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164393/


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

pnmtopng: 77 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164393: tolerable ALL FAIL

flight 164393 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164393/

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


