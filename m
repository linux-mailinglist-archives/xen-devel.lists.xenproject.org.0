Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A046BC598
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 06:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510304.787737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcg3I-0007DZ-Vo; Thu, 16 Mar 2023 05:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510304.787737; Thu, 16 Mar 2023 05:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcg3I-0007AW-Sw; Thu, 16 Mar 2023 05:21:24 +0000
Received: by outflank-mailman (input) for mailman id 510304;
 Thu, 16 Mar 2023 05:21:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcg3G-0007AM-Ui; Thu, 16 Mar 2023 05:21:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcg3G-000459-QQ; Thu, 16 Mar 2023 05:21:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcg3G-0000TL-AV; Thu, 16 Mar 2023 05:21:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pcg3G-0000NS-9x; Thu, 16 Mar 2023 05:21:22 +0000
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
	bh=i21yezd14GvBsJkO8NzCa1bLrtuhuMuD8EnRsgsmZOI=; b=s21eIOL+FK7qqbpR9mr2vHadZt
	8k1nsJ+4DnOpc/p6i1fQgfWtPRbXmECayMvDU2yXIUxPcgyVE0NL8M+/5nUeGyBEXmrCrWYgTu+XC
	ptDIZ1xGlnNl1/K++m2uo3FBoB0NoSMtp5wcRmxjgUufPHH3dbmCxMPRLT3E2HRX599s=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-libvirt-xsm
Message-Id: <E1pcg3G-0000NS-9x@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Mar 2023 05:21:22 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-xsm
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  b6cacfea0b38300e3ea5fd6d486d5085122554eb
  Bug not present: 831b0db8abda1d837a299893c4e3027942c8ac49
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179663/


  commit b6cacfea0b38300e3ea5fd6d486d5085122554eb
  Author: David Woodhouse <dwmw@amazon.co.uk>
  Date:   Sun Jan 1 17:54:41 2023 +0000
  
      hw/xen: Add evtchn operations to allow redirection to internal emulation
      
      The existing implementation calling into the real libxenevtchn moves to
      a new file hw/xen/xen-operations.c, and is called via a function table
      which in a subsequent commit will also be able to invoke the emulated
      event channel support.
      
      Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
      Reviewed-by: Paul Durrant <paul@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start --summary-out=tmp/179663.bisection-summary --basis-template=179518 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-libvirt-xsm guest-start
Searching for failure / basis pass:
 179644 fail [host=fiano1] / 179518 [host=albana1] 179501 [host=albana0] 179497 [host=italia0] 179449 [host=pinot1] 176449 [host=elbling1] 176423 [host=pinot0] 176407 [host=nobling1] 176392 [host=nobling0] 176367 [host=italia1] 176352 [host=huxelrebe1] 176342 [host=debina1] 176096 [host=huxelrebe0] 176080 [host=debina0] 176069 [host=italia0] 176022 [host=pinot1] 176008 [host=albana0] 175998 [host=fiano0] 175991 [host=italia1] 175977 [host=nobling1] 175962 [host=pinot0] 175743 [host=debina1] 1757\
 35 [host=albana1] 175637 [host=huxelrebe0] 175627 [host=elbling1] 175623 [host=debina0] 175619 [host=nocera1] 175614 [host=debina1] 175603 ok.
Failure / basis pass flights: 179644 / 175603
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c434a7e48faff075ef9e40b483519910c4ee360c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 961792c9d61f7e03e0c1b6b9f93b8b306df94bf9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 652737c8090eb3792f8b4c4b22ab12d7cc32073f ea1b7a0733906b8425d948ae94fba63c32b1d425 be62b1fc2aa7375d553603fca07299da765a89fe
Basis pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#6cd2b4e101cc0b60c6db83f763a08daea67ad6eb-c434a7e48faff075ef9e40b483519910c4ee360c https://gitlab.com/keycodemap/keycodemapdb.git#57ba70da5312170883a3d622cd2aa3fd0e2ec7ae-57ba70da5312170883a3d622cd2aa3fd0e2ec7ae git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8c2357809e2c352c8ba7c35ab50f49deefd3d39e-961792c9d61f7e03e0c1b6b9f93b8b306df94bf9 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#d365cb0b9d14eb562ce85d3acfe36e8aad13df3f-652737c8090eb3792f8b4c4b22ab12d7cc32073f git://xenbits.xen.org/osstest/seabios.git#645a64b4911d7cadf5749d7375544fc2384\
 e70ba-ea1b7a0733906b8425d948ae94fba63c32b1d425 git://xenbits.xen.org/xen.git#671f50ffab3329c5497208da89620322b9721a77-be62b1fc2aa7375d553603fca07299da765a89fe
From git://cache:9419/git://xenbits.xen.org/libvirt
 - [deleted]               (none)     -> origin/master
 - [deleted]               (none)     -> origin/v0.10.2-maint
 - [deleted]               (none)     -> origin/v0.8.3-maint
 - [deleted]               (none)     -> origin/v0.9.11-maint
 - [deleted]               (none)     -> origin/v0.9.12-maint
 - [deleted]               (none)     -> origin/v0.9.6-maint
 - [deleted]               (none)     -> origin/v1.0.0-maint
 - [deleted]               (none)     -> origin/v1.0.1-maint
 - [deleted]               (none)     -> origin/v1.0.2-maint
 - [deleted]               (none)     -> origin/v1.0.3-maint
 - [deleted]               (none)     -> origin/v1.0.4-maint
 - [deleted]               (none)     -> origin/v1.0.5-maint
 - [deleted]               (none)     -> origin/v1.0.6-maint
 - [deleted]               (none)     -> origin/v1.1.0-maint
 - [deleted]               (none)     -> origin/v1.1.1-maint
 - [deleted]               (none)     -> origin/v1.1.2-maint
 - [deleted]               (none)     -> origin/v1.1.3-maint
 - [deleted]               (none)     -> origin/v1.1.4-maint
 - [deleted]               (none)     -> origin/v1.2.0-maint
 - [deleted]               (none)     -> origin/v1.2.1-maint
 - [deleted]               (none)     -> origin/v1.2.10-maint
 - [deleted]               (none)     -> origin/v1.2.11-maint
 - [deleted]               (none)     -> origin/v1.2.12-maint
 - [deleted]               (none)     -> origin/v1.2.13-maint
 - [deleted]               (none)     -> origin/v1.2.14-maint
 - [deleted]               (none)     -> origin/v1.2.15-maint
 - [deleted]               (none)     -> origin/v1.2.16-maint
 - [deleted]               (none)     -> origin/v1.2.17-maint
 - [deleted]               (none)     -> origin/v1.2.18-maint
 - [deleted]               (none)     -> origin/v1.2.19-maint
 - [deleted]               (none)     -> origin/v1.2.2-maint
 - [deleted]               (none)     -> origin/v1.2.20-maint
 - [deleted]               (none)     -> origin/v1.2.21-maint
 - [deleted]               (none)     -> origin/v1.2.3-maint
 - [deleted]               (none)     -> origin/v1.2.4-maint
 - [deleted]               (none)     -> origin/v1.2.5-maint
 - [deleted]               (none)     -> origin/v1.2.6-maint
 - [deleted]               (none)     -> origin/v1.2.7-maint
 - [deleted]               (none)     -> origin/v1.2.8-maint
 - [deleted]               (none)     -> origin/v1.2.9-maint
 - [deleted]               (none)     -> origin/v1.3.0-maint
 - [deleted]               (none)     -> origin/v1.3.1-maint
 - [deleted]               (none)     -> origin/v1.3.2-maint
 - [deleted]               (none)     -> origin/v1.3.3-maint
 - [deleted]               (none)     -> origin/v1.3.4-maint
 - [deleted]               (none)     -> origin/v1.3.5-maint
 - [deleted]               (none)     -> origin/v2.0-maint
 - [deleted]               (none)     -> origin/v2.1-maint
 - [deleted]               (none)     -> origin/v2.2-maint
 - [deleted]               (none)     -> origin/v3.0-maint
 - [deleted]               (none)     -> origin/v3.2-maint
 - [deleted]               (none)     -> origin/v3.7-maint
 - [deleted]               (none)     -> origin/v4.1-maint
 - [deleted]               (none)     -> origin/v4.10-maint
 - [deleted]               (none)     -> origin/v4.2-maint
 - [deleted]               (none)     -> origin/v4.3-maint
 - [deleted]               (none)     -> origin/v4.4-maint
 - [deleted]               (none)     -> origin/v4.5-maint
 - [deleted]               (none)     -> origin/v4.6-maint
 - [deleted]               (none)     -> origin/v4.7-maint
 - [deleted]               (none)     -> origin/v4.8-maint
 - [deleted]               (none)     -> origin/v4.9-maint
 - [deleted]               (none)     -> origin/v5.0-maint
 - [deleted]               (none)     -> origin/v5.1-maint
 - [deleted]               (none)     -> origin/v5.1.0-maint
 - [deleted]               (none)     -> origin/v5.2-maint
 - [deleted]               (none)     -> origin/v5.3-maint
 * [new branch]            osstest/frozen/xen-4.0-testing -> origin/osstest/frozen/xen-4.0-testing
 * [new branch]            osstest/frozen/xen-4.1-testing -> origin/osstest/frozen/xen-4.1-testing
 * [new branch]            osstest/frozen/xen-4.10-testing -> origin/osstest/frozen/xen-4.10-testing
 * [new branch]            osstest/frozen/xen-4.11-testing -> origin/osstest/frozen/xen-4.11-testing
 * [new branch]            osstest/frozen/xen-4.12-testing -> origin/osstest/frozen/xen-4.12-testing
 * [new branch]            osstest/frozen/xen-4.13-testing -> origin/osstest/frozen/xen-4.13-testing
 * [new branch]            osstest/frozen/xen-4.14-testing -> origin/osstest/frozen/xen-4.14-testing
 * [new branch]            osstest/frozen/xen-4.15-testing -> origin/osstest/frozen/xen-4.15-testing
 * [new branch]            osstest/frozen/xen-4.16-testing -> origin/osstest/frozen/xen-4.16-testing
 * [new branch]            osstest/frozen/xen-4.17-testing -> origin/osstest/frozen/xen-4.17-testing
 * [new branch]            osstest/frozen/xen-4.2-testing -> origin/osstest/frozen/xen-4.2-testing
 * [new branch]            osstest/frozen/xen-4.3-testing -> origin/osstest/frozen/xen-4.3-testing
 * [new branch]            osstest/frozen/xen-4.4-testing -> origin/osstest/frozen/xen-4.4-testing
 * [new branch]            osstest/frozen/xen-4.5-testing -> origin/osstest/frozen/xen-4.5-testing
 * [new branch]            osstest/frozen/xen-4.6-testing -> origin/osstest/frozen/xen-4.6-testing
 * [new branch]            osstest/frozen/xen-4.7-testing -> origin/osstest/frozen/xen-4.7-testing
 * [new branch]            osstest/frozen/xen-4.8-testing -> origin/osstest/frozen/xen-4.8-testing
 * [new branch]            osstest/frozen/xen-4.9-testing -> origin/osstest/frozen/xen-4.9-testing
 * [new branch]            xen-tested-master -> origin/xen-tested-master
Loaded 99743 nodes in revision graph
Searching for test results:
 175603 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 175614 [host=debina1]
 175619 [host=nocera1]
 175623 [host=debina0]
 175627 [host=elbling1]
 175637 [host=huxelrebe0]
 175643 []
 175647 []
 175654 []
 175664 []
 175672 []
 175681 []
 175691 []
 175703 []
 175709 []
 175716 []
 175719 []
 175722 []
 175725 []
 175727 []
 175729 []
 175733 []
 175735 [host=albana1]
 175743 [host=debina1]
 175750 []
 175835 []
 175858 []
 175911 []
 175908 []
 175952 []
 175962 [host=pinot0]
 175977 [host=nobling1]
 175991 [host=italia1]
 175998 [host=fiano0]
 176008 [host=albana0]
 176022 [host=pinot1]
 176069 [host=italia0]
 176080 [host=debina0]
 176096 [host=huxelrebe0]
 176342 [host=debina1]
 176352 [host=huxelrebe1]
 176367 [host=italia1]
 176392 [host=nobling0]
 176407 [host=nobling1]
 176423 [host=pinot0]
 176449 [host=elbling1]
 179449 [host=pinot1]
 179497 [host=italia0]
 179501 [host=albana0]
 179518 [host=albana1]
 179526 fail irrelevant
 179533 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179535 fail irrelevant
 179534 fail irrelevant
 179538 pass irrelevant
 179539 fail irrelevant
 179540 pass 9fecdaf1c80f8fb4390c77b4d353ad07ba77c87a 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 67128074c9bd39f607548b27d2d51c3f0ca9d35e ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179541 pass 9fecdaf1c80f8fb4390c77b4d353ad07ba77c87a 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2ddc45954f97cd1d7ee5cbca0def05e980d1da9f ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179542 pass cea8402e1c322a25ec944d1c36e902fac31d4331 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a1d595fc9c049874b972a371fe6090738a176f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6611d8d5c265c138a4a0cc36a2c02d84a768976 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179543 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa1cd447b346e8cc8141df2fe2d321b032c08acb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 47fc340010335bc2549bc1f07e5fd85d86a2b9f9 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179544 pass cea8402e1c322a25ec944d1c36e902fac31d4331 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 43b79f3b86c343a8973dc98278ad7f7921bf248d ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179547 pass cf01bbb9926a3289e75d8c59dac24d091f85ab06 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37151032989ecf6e7ce8b65bc7bcb400d0318b2c ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179550 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179551 fail irrelevant
 179553 pass 3138e204b2e3f4d765af66faf1fc9b566de370dd 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a0f9628705e35c981ae95376f9ebedf877d09111 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ba44caac0741482d2c1921f7f974c205d2d4222b ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179555 fail irrelevant
 179556 pass cea8402e1c322a25ec944d1c36e902fac31d4331 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 76116e28e1491a06966fd594fefdaacb084ada10 ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179557 pass 6ecd2181097d2614f5c7ee202ac16db6034b37ae 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ccf919d742e387a6e533cf41d422a26d89f0d99 ea1b7a0733906b8425d948ae94fba63c32b1d425 b84fdf521b306cce64388fe57ee6c7c00f9d3e76
 179548 fail irrelevant
 179559 pass cea8402e1c322a25ec944d1c36e902fac31d4331 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22a2d409b1acfdf0d63d1bb3595194ceb3d94da ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179560 fail irrelevant
 179562 fail 61d51c9c418dd3c77794519a5f66a02118b11326 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a0f9628705e35c981ae95376f9ebedf877d09111 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b1224d8395de9be79c8cddbc2f60d29d9f1c10fe ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179563 fail bc77182ea40457381222f472a37c2a2f38991de0 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a0f9628705e35c981ae95376f9ebedf877d09111 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 15002921e878e6cf485f655d580733b5319ea015 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179564 pass cea8402e1c322a25ec944d1c36e902fac31d4331 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ddf0676f1ade90026483a91823d86db4096a40ef ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179566 pass f5966651e7c37f5501de29303a6defb13efdbed9 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e1f9f73ba15e0356ce1aa3317d7bd294f587ab58 ea1b7a0733906b8425d948ae94fba63c32b1d425 49b1cb27413034c81023d1faf7af43690e87291a
 179569 pass e66469095d4a6dafc7e482894321e1e10c734e54 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3f21065f0983d37c5d4a11a3c59bab5201a9f499 ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179561 fail irrelevant
 179572 pass e66469095d4a6dafc7e482894321e1e10c734e54 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 569346ad0a85b370fe28282656da18bddd291ed6 ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179576 pass e66469095d4a6dafc7e482894321e1e10c734e54 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0f385a2420d2c3f8ae7ed65fbe2712027664059e ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179578 pass 91431db94b126cbb9dc3276da6a8fd0216008298 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d89cb1fe5c778f51b5fdc6878adacdb0d908949 ea1b7a0733906b8425d948ae94fba63c32b1d425 406cea1970535cd7b9d6bcf09bc164ef9bb64bac
 179580 pass da6277d8e9ef64f4a033b1bfb6dd43ccdd9e59b6 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9b0699ab801405fe5bdf1adea83bceac9ec62f97 ea1b7a0733906b8425d948ae94fba63c32b1d425 a90a0018f605e3bb0588816e5a1f957d6e4562eb
 179581 pass da6277d8e9ef64f4a033b1bfb6dd43ccdd9e59b6 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4919d0c44afd58e16a8a369ca359de7f0114e04c ea1b7a0733906b8425d948ae94fba63c32b1d425 a90a0018f605e3bb0588816e5a1f957d6e4562eb
 179582 pass 598a73335d70b4ef70b84f9730d708c116f88b15 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 38da9606f77842cdcdc231210c0369a6180c51a0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 36debafddd788066be10b33c5f11b984a08e5c85 ea1b7a0733906b8425d948ae94fba63c32b1d425 5b9bb91abba7c983def3b4bef71ab08ad360a242
 179584 pass 15e5eb8a7684992d1a885038d28781462a727bf2 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c551d6d912967ada3084033acea8acf37256043 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0dd47dc5470629ae3ad8830a0b44aea82a6dd8ae ea1b7a0733906b8425d948ae94fba63c32b1d425 2e52dcc853a7183784cd9bdfb1e78ff366035209
 179585 pass b61c66d1dea2525290b7fa1f41ba6958bc39d63c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 540522fec06b87bf11ad5624abe23b515f282d60 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b1d1d468cabfa800950e1ecb6006df619687c269 ea1b7a0733906b8425d948ae94fba63c32b1d425 9b70bc6d9678142a40e6c1c6934a32c7a0966e38
 179586 pass 3820a0ce41694eb8b8ae62cfdfd08eb06fb352d4 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 93a21b465bda44cecdd6347ad481ca6f55286547 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b548761e5d084f2fc0fc4badebab227b51a8a84 ea1b7a0733906b8425d948ae94fba63c32b1d425 f4f498d08d50259b9f25c274fd7b1e8ccf5693af
 179574 fail 8419dd3b69cfada783a2e6df315e45dd294b0d18 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 674acdd17808052519aafcbee1583ad89b66181a ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179587 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179589 fail 8419dd3b69cfada783a2e6df315e45dd294b0d18 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 674acdd17808052519aafcbee1583ad89b66181a ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179590 pass 15e5eb8a7684992d1a885038d28781462a727bf2 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c551d6d912967ada3084033acea8acf37256043 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 003ba52a8b327180e284630b289c6ece5a3e08b9 ea1b7a0733906b8425d948ae94fba63c32b1d425 2e52dcc853a7183784cd9bdfb1e78ff366035209
 179592 pass 0c4e716835eaf2a575bd063fde074c0fc7c4e4d4 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6ce1a5cd8932844ec24701d158254ccf75b6159 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 acbc8aee5b09222dc6a5cb88306b67bcbe37e30b ea1b7a0733906b8425d948ae94fba63c32b1d425 4e0b4ccfc504f26187939068796295340ffd0e2f
 179594 pass 5155ab4b2a704285505dfea6ffee8b980fdaa29e 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6b433719eabf0abc74cff0cfd5687f0137c4198a ea1b7a0733906b8425d948ae94fba63c32b1d425 b9adcb5ab910b61e5332728bd248906e68a45900
 179588 fail 8419dd3b69cfada783a2e6df315e45dd294b0d18 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179595 pass 5155ab4b2a704285505dfea6ffee8b980fdaa29e 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ae2b5d8381a73b27f35f19c988d45c78bb4d5768 ea1b7a0733906b8425d948ae94fba63c32b1d425 b9adcb5ab910b61e5332728bd248906e68a45900
 179597 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179599 fail 8419dd3b69cfada783a2e6df315e45dd294b0d18 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179600 pass 5c4007ddc6c29632b5cc96ab4ef81ebb7797d1bb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 285ee77f5b58237c972bbe82aa0e1dc489c147d6 ea1b7a0733906b8425d948ae94fba63c32b1d425 c0e202194bfcb413d7cf662b333550ed444c469b
 179602 pass 5c4007ddc6c29632b5cc96ab4ef81ebb7797d1bb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5474aa4f3e0a3e9c171db7c55b5baf15f2e2778c ea1b7a0733906b8425d948ae94fba63c32b1d425 c0e202194bfcb413d7cf662b333550ed444c469b
 179603 pass c3f16cea3bef578c498c720aa90c677ee9511e2f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5c71a911267f742a71e2c7725dd3164347c61738 ea1b7a0733906b8425d948ae94fba63c32b1d425 c0e202194bfcb413d7cf662b333550ed444c469b
 179605 pass 0f350a4d070e952b0ecc7631708478ddfd43ba3f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d669016d968b0f3e17ce7df16ae51d85b0adfcf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ceabf6e500570ecfb311d8896c4ba9da8cf21f2a ea1b7a0733906b8425d948ae94fba63c32b1d425 a21c9e6ddfee6d21dff1f18c299cb94a47b32c9e
 179606 pass f2d379e7cb802f922409c35e4831ee52a2162486 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 13b97736c876919b9786055829caaa4fa46984b7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5736527050cfcc5b92521d79fe87b4883059d864 ea1b7a0733906b8425d948ae94fba63c32b1d425 a21c9e6ddfee6d21dff1f18c299cb94a47b32c9e
 179596 fail 8419dd3b69cfada783a2e6df315e45dd294b0d18 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179608 pass f2d379e7cb802f922409c35e4831ee52a2162486 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 387b2b52558bbb44ad74634415e1ab488d3c62a7 ea1b7a0733906b8425d948ae94fba63c32b1d425 78e93e6e57c218eead498a664785f414bcb12460
 179611 pass 4ad60f9b29b9548e1c65cd63a699e5f00eaaf6b1 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 026817fb69414c9d3909d8b1a209f90180d777d6 ea1b7a0733906b8425d948ae94fba63c32b1d425 78e93e6e57c218eead498a664785f414bcb12460
 179614 pass 2a690fc1729242a749c50b29ad804b51f5ffa5a3 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 37d3eb026a766b2405daae47e02094c2ec248646 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4f01a9bb0461e8c11ee0c94d90a504cb7d580a85 645a64b4911d7cadf5749d7375544fc2384e70ba d60324d8af9404014cfcc37bba09e9facfd02fcf
 179615 pass 0f350a4d070e952b0ecc7631708478ddfd43ba3f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4d37059d8e1eeda124270a158416795605327cbd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0730eab4d38f74589da4a7d55814773260491f89 ea1b7a0733906b8425d948ae94fba63c32b1d425 a21c9e6ddfee6d21dff1f18c299cb94a47b32c9e
 179617 pass 1c7476c8797b7f0d6e8d607f6a42c5bf43441677 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 37d3eb026a766b2405daae47e02094c2ec248646 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b07a936d3bfe97b07ddffcfbb532985a88033dd 645a64b4911d7cadf5749d7375544fc2384e70ba 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 179618 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51411435d559c55eaf38c02baf5d76da78bb658d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 70d17c3eedefe36b0f423575b57dc9708c4a9d57 645a64b4911d7cadf5749d7375544fc2384e70ba 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 179620 blocked 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51411435d559c55eaf38c02baf5d76da78bb658d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 701ed34833f53880ba38bde09b0846d01fc16d66 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179622 pass 16bfbc8cd2b4a039d3e846dceca807a9cc15849b 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bf5678b5802685e07583e3c7ec56d883cbdd5da3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b748352c555b42d497fe8ee00ee2e44eb8627660 645a64b4911d7cadf5749d7375544fc2384e70ba 93017efd7c441420318e46443a06e40fa6f1b6d4
 179623 pass ead6e1b00285cbd98e0f0727efb8adcb29ebc1ba 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d05739a3ff88457ae3ce90db3e91e9d2a11949c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2f8d6a88e44928e1afaab5fd37fafefc94bf395c 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179609 fail irrelevant
 179626 pass ead6e1b00285cbd98e0f0727efb8adcb29ebc1ba 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a107ad0f623669c72997443dc0431eeb732f81a0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7c9236d6d61f30583d5d860097d88dbf0fe487bf 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179629 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179630 fail irrelevant
 179631 pass 666bc8ee4fc2287732be9f90b33895d96f821b38 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 47ab397011b6d1ce4d5805117dc87d9e35f378db 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 886fb67020e32ce6a2cf7049c6f017acf1f0d69a 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179632 pass 46aee2a9255adf842ab44a9292acb46189a726f7 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba08910df1071bf5ade987529d9becb38d14a14a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ba97c48a64d059ddfa5400330dfaf5982f5f2c8 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179634 pass 03f76e577d66f8eea6aa7cc513e75026527b4cda 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 93a21b465bda44cecdd6347ad481ca6f55286547 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b33ae48ec28e1e0d1bc28a85c7423724bcb1a2c ea1b7a0733906b8425d948ae94fba63c32b1d425 01e7477d1b081cff4288ff9f51ec59ee94c03ee0
 179635 pass f5966651e7c37f5501de29303a6defb13efdbed9 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 33dc95d032a86dd007073d72cf006f663c614de2 ea1b7a0733906b8425d948ae94fba63c32b1d425 976ae57b30d0e9432b51ca2ff408d8e52f40f280
 179637 pass 1a6469e81fd0ece5447ecb7db89667e6220fd1c6 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d588c4f999699a430b32c563fe9ccc1710b8fd7 ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179638 pass f7fa1d4e11cbc7358c7023438bcfa53354544a7a 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a1d595fc9c049874b972a371fe6090738a176f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 73064edfb864743cde2c08f319609344af02aeb3 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179639 fail c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6cacfea0b38300e3ea5fd6d486d5085122554eb ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179642 pass 9fecdaf1c80f8fb4390c77b4d353ad07ba77c87a 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa1cd447b346e8cc8141df2fe2d321b032c08acb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c29a2f40cd5d1fdad4632b48343cd968db041a44 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179628 fail irrelevant
 179643 pass e30387b3408e8e75ac4326238bfda619ed69aec0 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa1cd447b346e8cc8141df2fe2d321b032c08acb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c29a2f40cd5d1fdad4632b48343cd968db041a44 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179645 fail irrelevant
 179646 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3ef7ff83caa27d8b3bfc76805cd47bc97d23b7d7 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179648 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cabbdb70df64fc7b0ed05f3e6aa4e1990eadc77 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179650 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 766804b101d7e452ad85995c231a5c3454f4e25b ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179652 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 831b0db8abda1d837a299893c4e3027942c8ac49 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179654 fail c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6cacfea0b38300e3ea5fd6d486d5085122554eb ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179644 fail c434a7e48faff075ef9e40b483519910c4ee360c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 961792c9d61f7e03e0c1b6b9f93b8b306df94bf9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 652737c8090eb3792f8b4c4b22ab12d7cc32073f ea1b7a0733906b8425d948ae94fba63c32b1d425 be62b1fc2aa7375d553603fca07299da765a89fe
 179655 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 831b0db8abda1d837a299893c4e3027942c8ac49 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179658 pass 6cd2b4e101cc0b60c6db83f763a08daea67ad6eb 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8c2357809e2c352c8ba7c35ab50f49deefd3d39e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d365cb0b9d14eb562ce85d3acfe36e8aad13df3f 645a64b4911d7cadf5749d7375544fc2384e70ba 671f50ffab3329c5497208da89620322b9721a77
 179659 fail c434a7e48faff075ef9e40b483519910c4ee360c 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 961792c9d61f7e03e0c1b6b9f93b8b306df94bf9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 652737c8090eb3792f8b4c4b22ab12d7cc32073f ea1b7a0733906b8425d948ae94fba63c32b1d425 be62b1fc2aa7375d553603fca07299da765a89fe
 179661 fail c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6cacfea0b38300e3ea5fd6d486d5085122554eb ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179662 pass c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 831b0db8abda1d837a299893c4e3027942c8ac49 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179663 fail c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6cacfea0b38300e3ea5fd6d486d5085122554eb ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
Searching for interesting versions
 Result found: flight 175603 (pass), for basis pass
 Result found: flight 179644 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 179658 (pass), for basis pass
 Repro found: flight 179659 (fail), for basis failure
 0 revisions at c0e60063c93362e8be5914c63d2f1c3a0f4bae8f 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 831b0db8abda1d837a299893c4e3027942c8ac49 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
No revisions left to test, checking graph state.
 Result found: flight 179652 (pass), for last pass
 Result found: flight 179654 (fail), for first failure
 Repro found: flight 179655 (pass), for last pass
 Repro found: flight 179661 (fail), for first failure
 Repro found: flight 179662 (pass), for last pass
 Repro found: flight 179663 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  b6cacfea0b38300e3ea5fd6d486d5085122554eb
  Bug not present: 831b0db8abda1d837a299893c4e3027942c8ac49
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179663/


  commit b6cacfea0b38300e3ea5fd6d486d5085122554eb
  Author: David Woodhouse <dwmw@amazon.co.uk>
  Date:   Sun Jan 1 17:54:41 2023 +0000
  
      hw/xen: Add evtchn operations to allow redirection to internal emulation
      
      The existing implementation calling into the real libxenevtchn moves to
      a new file hw/xen/xen-operations.c, and is called via a function table
      which in a subsequent commit will also be able to invoke the emulated
      event channel support.
      
      Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
      Reviewed-by: Paul Durrant <paul@xen.org>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.258758 to fit
pnmtopng: 203 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
179663: tolerable FAIL

flight 179663 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/179663/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-xsm  14 guest-start             fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-xsm                                  fail    


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


