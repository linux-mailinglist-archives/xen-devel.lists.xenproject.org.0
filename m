Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954A64DEBD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 17:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463595.721810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rCd-0000fK-SR; Thu, 15 Dec 2022 16:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463595.721810; Thu, 15 Dec 2022 16:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rCd-0000cy-Os; Thu, 15 Dec 2022 16:35:23 +0000
Received: by outflank-mailman (input) for mailman id 463595;
 Thu, 15 Dec 2022 16:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5rCc-0000co-Rt; Thu, 15 Dec 2022 16:35:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5rCc-0007uJ-PE; Thu, 15 Dec 2022 16:35:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5rCc-0004hz-Af; Thu, 15 Dec 2022 16:35:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5rCc-0007uK-AJ; Thu, 15 Dec 2022 16:35:22 +0000
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
	bh=VuaSO68xT5CtnaAAgxG7ahJ9TJYmfX7LjWnYz6PG0nU=; b=0dwFhgkxOw0h6jYAzai/O5QH3O
	O9YkxdjVHSQHJpwF1RmgXSFZ5rBDtat2aHc0llPQ3lb37JfnuFdDwFNEejo5S4fvH6tSIFt3oMhsD
	xE44xHec1XhZlWEju3Cydrgjj2JSx6vavAgaYwa2J/W6d+MqMEvZDD2JXr2l543h5nX4=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1p5rCc-0007uK-AJ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 16:35:22 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cda98df16228970dcf9a4ce2af5368219711b4b0
  Bug not present: 81bbc1452c972218f071cd4a8f5899df974b1dae
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175281/


  commit cda98df16228970dcf9a4ce2af5368219711b4b0
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Fri Dec 2 14:10:09 2022 +0100
  
      OvmfPkg/QemuFwCfgLib: remove mQemuFwCfgSupported + mQemuFwCfgDmaSupported
      
      Remove global variables, store the state in PlatformInfoHob instead.
      Probing for fw_cfg happens on first use, at library initialization
      time the Hob might not be present yet.
      
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
      Acked-by: Ard Biesheuvel <ardb@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/175281.bisection-summary --basis-template=175202 --blessings=real,real-bisect,real-retry ovmf test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 175263 fail [host=huxelrebe0] / 175202 [host=nocera0] 175187 [host=chardonnay1] 175182 [host=debina1] 175176 [host=huxelrebe1] 175172 [host=pinot1] 175151 [host=chardonnay0] 175149 [host=albana1] 175142 [host=albana0] 175124 [host=fiano0] 175119 [host=elbling1] 175101 [host=pinot0] 175093 [host=nocera1] 175090 [host=italia0] 175085 [host=italia1] 175064 [host=nobling1] 175059 [host=nobling0] 175047 [host=elbling0] 175045 ok.
Failure / basis pass flights: 175263 / 175045
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3e3f5bb21c0a2c1368c43713cf7f4b51097259af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 735a7496cb35e48ccad51aad0934844a475e3fef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 68f551ec5fa9ad96397a62cd463a7ff7e4db72d0
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#735a7496cb35e48ccad51aad0934844a475e3fef-3e3f5bb21c0a2c1368c43713cf7f4b51097259af git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/osstest/seabios.git#645a64b4911d7cadf5749d7375544fc2384e70ba-645a64b4911d7cadf5749d7375544fc2384e70ba git://xenbits.xen.org/xen.git#68f551ec5fa9ad96397a62cd463a7ff7e4db72d0-f86d0a1ff200264aaf80b65d7d200a3ba19c7845
From git://cache:9419/git://xenbits.xen.org/xen
   88168c418c..32b61bcafc  staging    -> origin/staging
Loaded 10001 nodes in revision graph
Searching for test results:
 175045 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 735a7496cb35e48ccad51aad0934844a475e3fef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 68f551ec5fa9ad96397a62cd463a7ff7e4db72d0
 175047 [host=elbling0]
 175059 [host=nobling0]
 175064 [host=nobling1]
 175090 [host=italia0]
 175085 [host=italia1]
 175093 [host=nocera1]
 175101 [host=pinot0]
 175119 [host=elbling1]
 175124 [host=fiano0]
 175142 [host=albana0]
 175149 [host=albana1]
 175151 [host=chardonnay0]
 175172 [host=pinot1]
 175176 [host=huxelrebe1]
 175182 [host=debina1]
 175187 [host=chardonnay1]
 175202 [host=nocera0]
 175214 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175220 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 735a7496cb35e48ccad51aad0934844a475e3fef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 68f551ec5fa9ad96397a62cd463a7ff7e4db72d0
 175221 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175223 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175225 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175228 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2c284027b23ca63cc459411df9d1fcbfc47a5126 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba af50d9be4358f26c459459eeaa3f6a1a66821738
 175231 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5890a18409a0e67a491c600b930e6c904ad3b3fd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175238 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 78c373f2a5273af00b23b55d3e8c41583310cfb6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175246 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7dbb8a24d1a3403f85d959bc1234b9f4a92bfbf0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175250 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6a196c7eb34affff0cfe1864e126953096885e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175244 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175254 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e59747bd8246135faeecc18879d62db66a6acfc2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175235 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 44fc90eb0ea7299abc79577db55aa6257b46b7ae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175257 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175259 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175264 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175263 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3e3f5bb21c0a2c1368c43713cf7f4b51097259af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175268 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175274 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175278 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175281 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
Searching for interesting versions
 Result found: flight 175045 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae04c28c8) HASH(0x55eae0f686f0) HASH(0x55eae0f4c968) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e59747bd8246135faeecc18879d62db66a6acfc2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae0f552b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6a196c7eb34affff0cfe1864e126953096885e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458\
 386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae0f680f0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7dbb8a24d1a3403f85d959bc1234b9f4a92bfbf0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae0f546b0) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 78c373f2a5273af00b23b55d3e8c41583310cfb6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae0f65dc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5890a18409a0e67a491c\
 600b930e6c904ad3b3fd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845, results HASH(0x55eae0f52b28) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2c284027b23ca63cc459411df9d1fcbfc47a5126 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384\
 e70ba af50d9be4358f26c459459eeaa3f6a1a66821738, results HASH(0x55eae0f5cb78) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 735a7496cb35e48ccad51aad0934844a475e3fef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 68f551ec5fa9ad96397a62cd463a7ff7e4db72d0, results HASH(0x55eae0f52080) HASH(0x55eae0f620b0) Result found: flight 175214 (fail), for \
 basis failure (at ancestor ~5827)
 Repro found: flight 175220 (pass), for basis pass
 Repro found: flight 175263 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
No revisions left to test, checking graph state.
 Result found: flight 175259 (pass), for last pass
 Result found: flight 175264 (fail), for first failure
 Repro found: flight 175268 (pass), for last pass
 Repro found: flight 175274 (fail), for first failure
 Repro found: flight 175278 (pass), for last pass
 Repro found: flight 175281 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cda98df16228970dcf9a4ce2af5368219711b4b0
  Bug not present: 81bbc1452c972218f071cd4a8f5899df974b1dae
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175281/


  commit cda98df16228970dcf9a4ce2af5368219711b4b0
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Fri Dec 2 14:10:09 2022 +0100
  
      OvmfPkg/QemuFwCfgLib: remove mQemuFwCfgSupported + mQemuFwCfgDmaSupported
      
      Remove global variables, store the state in PlatformInfoHob instead.
      Probing for fw_cfg happens on first use, at library initialization
      time the Hob might not be present yet.
      
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
      Acked-by: Ard Biesheuvel <ardb@kernel.org>

Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
175281: tolerable ALL FAIL

flight 175281 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175281/

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


