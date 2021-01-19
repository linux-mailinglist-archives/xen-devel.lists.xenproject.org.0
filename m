Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BE2FBF4C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 19:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71018.127095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1vyt-0006C4-A9; Tue, 19 Jan 2021 18:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71018.127095; Tue, 19 Jan 2021 18:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1vyt-0006Bd-6j; Tue, 19 Jan 2021 18:43:55 +0000
Received: by outflank-mailman (input) for mailman id 71018;
 Tue, 19 Jan 2021 18:43:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1vyr-0006BV-OZ; Tue, 19 Jan 2021 18:43:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1vyr-0007KO-Ho; Tue, 19 Jan 2021 18:43:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1vyr-000384-9B; Tue, 19 Jan 2021 18:43:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1vyr-00074y-8j; Tue, 19 Jan 2021 18:43:53 +0000
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
	bh=pgQdpY9zF9H1wvR/51TsG04M0T9zod2tLoXl6//r32M=; b=Lcu3D6sQXeJgkV6N4In4jEItMT
	5uu4l7ulB3jYigcQM4zsnL/KUlvOxB9b7eNiEi6uBha0JjB5SuypZQiRVvzOpbky6Oc2YWyXrSD+x
	ziir4av9FxRxkom63dweMJ6pWCpVB6EXHdiaHSlXaP5gDKYVCOtXw/hyFKh7FANINaCc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1l1vyr-00074y-8j@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jan 2021 18:43:53 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-dom0pvh-xl-intel
testid xen-boot

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
  Bug not present: 04b090366ca59e8a75837c822df261a8d0bd1a30
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158526/


  commit 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Jan 5 13:18:26 2021 +0100
  
      x86/vPCI: check address in vpci_msi_update()
      
      If the upper address bits don't match the interrupt delivery address
      space window, entirely different behavior would need to be implemented.
      Refuse such requests for the time being.
      
      Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/158526.bisection-summary --basis-template=158387 --blessings=real,real-bisect,real-retry linux-5.4 test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 158500 fail [host=huxelrebe0] / 158387 [host=albana0] 158297 [host=godello1] 158210 [host=chardonnay0] 157984 [host=elbling0] 157976 [host=chardonnay1] 157757 ok.
Failure / basis pass flights: 158500 / 157757
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f214830ce02cf588baba9ae6e7becfd67e5748c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
Basis pass 19d1c763e849fb78ddf2afe0e2625d79ed4c8a11 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6932f4bfe552c1704c5715430de6045c78a5b62f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 357db96a66e47e609c3b14768f1062e13eedbd93
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#19d1c763e849fb78ddf2afe0e2625d79ed4c8a11-ceed81a883dc43e2073ecdcfd273fa179e24df5b git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#6932f4bfe552c1704c5715430de6045c78a5b62f-4f214830ce02cf588baba9ae6e7becfd67e5748c git://xenbits.xen.org/qemu-xen-traditional\
 .git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#748d619be3282fba35f99446098ac2d0579f6063-ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e git://xenbits.xen.org/xen.git#357db96a66e47e609c3b14768f1062e13eedbd93-db9c4ad1b1abaef3c38027b9b2700d9250d13125
From git://cache:9419/git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable
   c110fed0e606..43d555d83c3f  linux-4.19.y -> origin/linux-4.19.y
   7a1519a74f3d..e2d133180bbc  linux-5.10.y -> origin/linux-5.10.y
   ceed81a883dc..d26b3110041a  linux-5.4.y  -> origin/linux-5.4.y
 * [new tag]                   v4.19.169    -> v4.19.169
 * [new tag]                   v5.10.9      -> v5.10.9
 * [new tag]                   v5.4.91      -> v5.4.91
From git://cache:9419/git://xenbits.xen.org/xen
   5e53349960..a59e56b65c  smoke      -> origin/smoke
   a59e56b65c..3487f4cf8b  staging    -> origin/staging
Loaded 17596 nodes in revision graph
Searching for test results:
 157757 pass 19d1c763e849fb78ddf2afe0e2625d79ed4c8a11 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6932f4bfe552c1704c5715430de6045c78a5b62f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 357db96a66e47e609c3b14768f1062e13eedbd93
 157976 [host=chardonnay1]
 157984 [host=elbling0]
 158210 [host=chardonnay0]
 158297 [host=godello1]
 158387 [host=albana0]
 158477 fail ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158487 fail ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158499 pass 19d1c763e849fb78ddf2afe0e2625d79ed4c8a11 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6932f4bfe552c1704c5715430de6045c78a5b62f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 357db96a66e47e609c3b14768f1062e13eedbd93
 158501 fail ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158503 pass c5ae864c148c2b016e56677a39a4c15c24059552 c530a75c1e6a472b0eb9558310b518f0dfcd8860 140674a4601f804302e79d08cb06f91c882ddf28 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc
 158506 fail b3f656a592f3ade657d14888fd3dc92a14975890 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7e6776deaf87e73fb283ab6ea6fb08ef3a097bcf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6721f01ba1ccb7a32778e485d15e58d2eb6184f2
 158508 fail 3a83e289e4b7890a046d3ee2e7a59f3ec19f5dc1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 67e0e4caa5bacdd65327d8b302eace2d9ebd209f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e d581cf8839417b73f02d8b6f79cf33e9903933db
 158510 pass dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 42fe8ca453f1ab19d03d8dc945398997b00b0777 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 1516ecd6f55fe3608f374f4f2548491472d1c9a1
 158512 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e c7115531ea8ede5c6ab27f972c1be6ecad388f55
 158513 pass dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
 158515 pass dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04b090366ca59e8a75837c822df261a8d0bd1a30
 158516 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e fa679ef8b429cf2906318a845ba90f0568fa531d
 158500 fail ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f214830ce02cf588baba9ae6e7becfd67e5748c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158517 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 4bac861340cf6551cfdac308621a984464701405
 158519 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
 158521 pass dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04b090366ca59e8a75837c822df261a8d0bd1a30
 158523 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
 158525 pass dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04b090366ca59e8a75837c822df261a8d0bd1a30
 158526 fail dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
Searching for interesting versions
 Result found: flight 157757 (pass), for basis pass
 For basis failure, parent search stopping at dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04b090366ca59e8a75837c822df261a8d0bd1a30, results HASH(0x5579146e94e8) HASH(0x5579148f4568) HASH(0x5579147201f0) For basis failure, parent search stopping at dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0, results HASH(0x5579148d9cb0) For basis failure, parent search stopping at dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 42fe8ca453f1ab19d03d8dc945398997b00b0777 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 1516ecd6f55fe3608f374f4f2548491472d1c9a1, results HASH(0x5579146cb2d8) For basis failure, parent search stopping at c5ae864c148c2b016e56677a39a4c15c24059552 c530a75c1e6a472b0eb9558310b518f0dfcd8860 140674a4601f804302e79d08cb06f91c882ddf28 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc, results HASH(0x5579146ed820) For basis\
  failure, parent search stopping at 19d1c763e849fb78ddf2afe0e2625d79ed4c8a11 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6932f4bfe552c1704c5715430de6045c78a5b62f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 748d619be3282fba35f99446098ac2d0579f6063 357db96a66e47e609c3b14768f1062e13eedbd93, results HASH(0x5579146d6250) HASH(0x5579146e11a0) Result found: flight 158477 (fail), for basis failure (at ancestor ~10811)
 Repro found: flight 158499 (pass), for basis pass
 Repro found: flight 158500 (fail), for basis failure
 0 revisions at dfce803cd87dc139cfe4da1a68a5b3585e9e47e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4e511554872c318f8bce196f1cddf69432886bfa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04b090366ca59e8a75837c822df261a8d0bd1a30
No revisions left to test, checking graph state.
 Result found: flight 158515 (pass), for last pass
 Result found: flight 158519 (fail), for first failure
 Repro found: flight 158521 (pass), for last pass
 Repro found: flight 158523 (fail), for first failure
 Repro found: flight 158525 (pass), for last pass
 Repro found: flight 158526 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
  Bug not present: 04b090366ca59e8a75837c822df261a8d0bd1a30
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158526/


  commit 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Jan 5 13:18:26 2021 +0100
  
      x86/vPCI: check address in vpci_msi_update()
      
      If the upper address bits don't match the interrupt delivery address
      space window, entirely different behavior would need to be implemented.
      Refuse such requests for the time being.
      
      Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.586382 to fit
pnmtopng: 58 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
158526: tolerable ALL FAIL

flight 158526 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158526/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot           fail baseline untested


jobs:
 test-amd64-amd64-dom0pvh-xl-intel                            fail    


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


