Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D76564F763
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 04:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465164.723782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6O14-0000gz-GK; Sat, 17 Dec 2022 03:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465164.723782; Sat, 17 Dec 2022 03:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6O14-0000eZ-D7; Sat, 17 Dec 2022 03:37:38 +0000
Received: by outflank-mailman (input) for mailman id 465164;
 Sat, 17 Dec 2022 03:37:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6O13-0000eP-1A; Sat, 17 Dec 2022 03:37:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6O12-0007hx-UB; Sat, 17 Dec 2022 03:37:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6O12-0006qZ-Hz; Sat, 17 Dec 2022 03:37:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p6O12-0006Pc-HW; Sat, 17 Dec 2022 03:37:36 +0000
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
	bh=oZODUz1wiHHS4r4xCf1xzfXK70ftRemQGVnPa/RCODA=; b=dZkKidr0ZBwmC+5f/IwLIHd+nM
	wb7LzzkZ8lNC4IcHXmJzoK1iQxGVMpXXjQxbJHsF6F8nKlVHe6JwzRayx4HVg+F9UruGHgqUGOR7E
	lBqe3D2daRBE93H+8WbbntuO0TeEac244RJkoeFCC5n9SVKfiB/MN8EI9prnMD9xo9xY=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1p6O12-0006Pc-HW@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Dec 2022 03:37:36 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-ovmf-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175348/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/175348.bisection-summary --basis-template=175202 --blessings=real,real-bisect,real-retry ovmf test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 175338 fail [host=fiano1] / 175202 [host=sabro0] 175187 [host=debina0] 175182 [host=huxelrebe1] 175176 [host=fiano0] 175172 [host=pinot0] 175151 [host=pinot1] 175149 [host=italia0] 175142 [host=godello0] 175124 [host=debina1] 175119 [host=elbling0] 175101 [host=sabro1] 175093 [host=nobling0] 175090 [host=nobling1] 175085 [host=huxelrebe0] 175064 [host=albana1] 175059 [host=chardonnay1] 175047 [host=nocera1] 175045 [host=albana0] 175033 [host=chardonnay0] 175026 [host=godello1] 175017 [host=himr\
 od0] 175014 [host=nocera0] 175003 [host=elbling1] 175001 [host=italia1] 174992 [host=debina0] 174990 [host=sabro0] 174987 ok.
Failure / basis pass flights: 175338 / 174987
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 316e6df435af81f8281150bb04b3dd5a304d9c92 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b92e0495221a3b298b069d9fb01e48fd2a0469f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 345135942bf9632eba1409ba432cfcae3b7649c7
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#b92e0495221a3b298b069d9fb01e48fd2a0469f6-316e6df435af81f8281150bb04b3dd5a304d9c92 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-1cf02b05b27c48775a25699e61b93b814b9ae042 git://xenbits.xen.org/osstest/seabios.git#645a64b4911d7cadf5749d7375544fc2384e70ba-645a64b4911d7cadf5749d7375544fc2384e70ba git://xenbits.xen.org/xen.git#345135942bf9632eba1409ba432cfcae3b7649c7-f86d0a1ff200264aaf80b65d7d200a3ba19c7845
Loaded 35030 nodes in revision graph
Searching for test results:
 174987 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b92e0495221a3b298b069d9fb01e48fd2a0469f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 345135942bf9632eba1409ba432cfcae3b7649c7
 174990 [host=sabro0]
 174992 [host=debina0]
 175001 [host=italia1]
 175003 [host=elbling1]
 175014 [host=nocera0]
 175017 [host=himrod0]
 175026 [host=godello1]
 175033 [host=chardonnay0]
 175045 [host=albana0]
 175047 [host=nocera1]
 175059 [host=chardonnay1]
 175064 [host=albana1]
 175090 [host=nobling1]
 175085 [host=huxelrebe0]
 175093 [host=nobling0]
 175101 [host=sabro1]
 175119 [host=elbling0]
 175124 [host=debina1]
 175142 [host=godello0]
 175149 [host=italia0]
 175151 [host=pinot1]
 175172 [host=pinot0]
 175176 [host=fiano0]
 175182 [host=huxelrebe1]
 175187 [host=debina0]
 175202 [host=sabro0]
 175214 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175221 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175225 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175244 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175235 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 44fc90eb0ea7299abc79577db55aa6257b46b7ae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175257 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175263 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3e3f5bb21c0a2c1368c43713cf7f4b51097259af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175286 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b92e0495221a3b298b069d9fb01e48fd2a0469f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 345135942bf9632eba1409ba432cfcae3b7649c7
 175290 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3e3f5bb21c0a2c1368c43713cf7f4b51097259af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175293 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7bee2498910a9034faaf90802c49188afb7582dc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 3ea18e9e263778e0ef5c654d5a0a69c272b476b8
 175273 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3e3f5bb21c0a2c1368c43713cf7f4b51097259af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175298 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 127e2c531556b968a51e8e2191d6e4580281856a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba d7669c101427c1504517418e832fb760ae89e6bc
 175300 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1fd8d08970a9ee7d350c7dd42bffb0cb96426041 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175305 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00743d144bc5b643e9323ad66f16cb48cf338705 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175307 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4bc2c748516e5c4a8bb86093cd5e1b80a9f35c0f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175303 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0adc35fccd59c8c5171273319ec899aa48fc2c35 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175310 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6a196c7eb34affff0cfe1864e126953096885e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175312 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e59747bd8246135faeecc18879d62db66a6acfc2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175311 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e254c71e9eaee6b14eba65e89e906576f3f1abc7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175317 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175320 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b92e0495221a3b298b069d9fb01e48fd2a0469f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba 345135942bf9632eba1409ba432cfcae3b7649c7
 175319 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e254c71e9eaee6b14eba65e89e906576f3f1abc7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175324 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e254c71e9eaee6b14eba65e89e906576f3f1abc7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175328 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175331 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175327 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e254c71e9eaee6b14eba65e89e906576f3f1abc7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175336 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175340 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175338 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 316e6df435af81f8281150bb04b3dd5a304d9c92 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cf02b05b27c48775a25699e61b93b814b9ae042 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
 175348 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cda98df16228970dcf9a4ce2af5368219711b4b0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
Searching for interesting versions
 Result found: flight 174987 (pass), for basis pass
 Result found: flight 175311 (fail), for basis failure (at ancestor ~9)
 Repro found: flight 175320 (pass), for basis pass
 Repro found: flight 175338 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 81bbc1452c972218f071cd4a8f5899df974b1dae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 645a64b4911d7cadf5749d7375544fc2384e70ba f86d0a1ff200264aaf80b65d7d200a3ba19c7845
No revisions left to test, checking graph state.
 Result found: flight 175317 (pass), for last pass
 Result found: flight 175328 (fail), for first failure
 Repro found: flight 175331 (pass), for last pass
 Repro found: flight 175336 (fail), for first failure
 Repro found: flight 175340 (pass), for last pass
 Repro found: flight 175348 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  cda98df16228970dcf9a4ce2af5368219711b4b0
  Bug not present: 81bbc1452c972218f071cd4a8f5899df974b1dae
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175348/


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

Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
175348: tolerable ALL FAIL

flight 175348 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175348/

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


