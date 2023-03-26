Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DB6C9478
	for <lists+xen-devel@lfdr.de>; Sun, 26 Mar 2023 15:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.514928.797409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgQJm-0005Hm-30; Sun, 26 Mar 2023 13:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514928.797409; Sun, 26 Mar 2023 13:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgQJl-0005FK-W7; Sun, 26 Mar 2023 13:21:54 +0000
Received: by outflank-mailman (input) for mailman id 514928;
 Sun, 26 Mar 2023 13:21:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgQJk-0005FA-93; Sun, 26 Mar 2023 13:21:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgQJk-0003Q3-4l; Sun, 26 Mar 2023 13:21:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgQJj-0006UH-PK; Sun, 26 Mar 2023 13:21:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgQJj-0001W0-Ow; Sun, 26 Mar 2023 13:21:51 +0000
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
	bh=zlMQAG/y6Us9ZvlCaAmk+z6DmEAd7dDTcUxfCCfh1ak=; b=2dymwH2PLzvl96Szdids2+xeTg
	PSQkA8fZQN9Hkl2GgEayaCvuTTUrkxQzGHFt+QFjX1fNgYyk0H/N7WfDvcCmkBhryEXbVTQ1Uxcmy
	ATMzp8MwImjHhaWvTjZwnCXAFKROSsiDKEPjDL6dk3Bv3laJV+eqM3kHLnY7enmFhNvs=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qcow2
Message-Id: <E1pgQJj-0001W0-Ow@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Mar 2023 13:21:51 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qcow2
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  c86422c5549c0983b4b4525b8f56a1c69dd67aa1
  Bug not present: c057960c4e33becb22d4741156203a4b0d4a3088
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179999/


  commit c86422c5549c0983b4b4525b8f56a1c69dd67aa1
  Author: Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Date:   Fri Jan 13 21:42:04 2023 +0100
  
      block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
      
      BlockDriver->bdrv_getlength is categorized as IO callback, and it
      currently doesn't run in a coroutine. We should let it take a graph
      rdlock since the callback traverses the block nodes graph, which however
      is only possible in a coroutine.
      
      Therefore turn it into a co_wrapper to move the actual function into a
      coroutine where the lock can be taken.
      
      Because now this function creates a new coroutine and polls, we need to
      take the AioContext lock where it is missing, for the only reason that
      internally co_wrapper calls AIO_WAIT_WHILE and it expects to release the
      AioContext lock.
      
      This is especially messy when a co_wrapper creates a coroutine and polls
      in bdrv_open_driver, because this function has so many callers in so
      many context that it can easily lead to deadlocks. Therefore the new
      rule for bdrv_open_driver is that the caller must always hold the
      AioContext lock of the given bs (except if it is a coroutine), because
      the function calls bdrv_refresh_total_sectors() which is now a
      co_wrapper.
      
      Once the rwlock is ultimated and placed in every place it needs to be,
      we will poll using AIO_WAIT_WHILE_UNLOCKED and remove the AioContext
      lock.
      
      Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>
      Message-Id: <20230113204212.359076-7-kwolf@redhat.com>
      Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.debian-di-install --summary-out=tmp/179999.bisection-summary --basis-template=179518 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qcow2 debian-di-install
Searching for failure / basis pass:
 179971 fail [host=godello1] / 179518 [host=nobling0] 179501 [host=nocera1] 179497 [host=nocera0] 179449 [host=himrod0] 176342 [host=nocera0] 176096 [host=sabro1] 176080 [host=albana0] 176069 [host=pinot0] 176022 [host=huxelrebe1] 176008 [host=huxelrebe1] 175998 [host=fiano0] 175991 [host=fiano0] 175977 [host=godello0] 175962 [host=fiano0] 175743 [host=elbling1] 175735 [host=nocera1] 175637 ok.
Failure / basis pass flights: 179971 / 175637
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 60ca584b8af0de525656f959991a440f8c191f12 ea1b7a0733906b8425d948ae94fba63c32b1d425 b5cc3c25a242ddb9c5b108884061b17f35c3084b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#d8d829b89dababf763ab33b8cdd852b2830db3cf-f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#528d9f33cad5245c1099d77084c78bb2244d5143-60ca584b8af0de525656f959991a440f8c191f12 git://xenbits.xen.org/osstest/seabios.git#645a64b4911d7cadf5749d7375544fc2384e70ba-ea1b7a0733906b8425d948ae94fba63c32b1d425 git://xenbits.xen.org/xen.git#2b21cbbb339fb14414f357a6683b1df74c36fda2-b5cc3c25a242ddb9c5b108884061b17f35c3084b
Loaded 79425 nodes in revision graph
Searching for test results:
 175627 [host=nobling0]
 175637 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
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
 175735 [host=nocera1]
 175743 [host=elbling1]
 175750 []
 175835 []
 175858 []
 175911 []
 175908 []
 175952 []
 175962 [host=fiano0]
 175977 [host=godello0]
 175991 [host=fiano0]
 175998 [host=fiano0]
 176008 [host=huxelrebe1]
 176022 [host=huxelrebe1]
 176069 [host=pinot0]
 176080 [host=albana0]
 176096 [host=sabro1]
 176342 [host=nocera0]
 176352 [host=himrod0]
 176368 [host=himrod0]
 176369 [host=himrod0]
 176372 [host=himrod0]
 176374 [host=himrod0]
 176377 [host=himrod0]
 176367 [host=himrod0]
 176379 [host=himrod0]
 176380 [host=himrod0]
 176381 [host=himrod0]
 176382 [host=himrod0]
 176383 [host=himrod0]
 176384 [host=himrod0]
 176389 [host=himrod0]
 176391 [host=himrod0]
 176393 [host=himrod0]
 176394 [host=himrod0]
 176396 [host=himrod0]
 176397 [host=himrod0]
 176398 [host=himrod0]
 176399 [host=himrod0]
 176400 [host=himrod0]
 176401 [host=himrod0]
 176402 [host=himrod0]
 176392 [host=himrod0]
 176404 [host=himrod0]
 176406 [host=himrod0]
 176408 [host=himrod0]
 176410 [host=himrod0]
 176412 [host=himrod0]
 176415 [host=himrod0]
 176416 [host=himrod0]
 176418 [host=himrod0]
 176419 [host=himrod0]
 176407 [host=himrod0]
 176420 [host=himrod0]
 176425 [host=himrod0]
 176423 [host=himrod0]
 176387 [host=himrod0]
 176427 [host=himrod0]
 176429 [host=himrod0]
 176431 [host=himrod0]
 176432 [host=himrod0]
 176436 [host=himrod0]
 176433 [host=himrod0]
 176440 [host=himrod0]
 176444 [host=himrod0]
 176446 [host=himrod0]
 176450 [host=himrod0]
 176454 [host=himrod0]
 176456 [host=himrod0]
 176449 [host=himrod0]
 179449 [host=himrod0]
 179497 [host=nocera0]
 179501 [host=nocera1]
 179518 [host=nobling0]
 179526 fail irrelevant
 179534 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ee59483267de29056b5b2ee2421ef3844e5c9932 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179548 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9b94ebb0c826ad9a747f93ee351d5d076e920f6e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 674acdd17808052519aafcbee1583ad89b66181a ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179561 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 674acdd17808052519aafcbee1583ad89b66181a ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179574 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 674acdd17808052519aafcbee1583ad89b66181a ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179588 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179596 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2bfe289668e32940cca5da12bc201bf9b6c84d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179609 fail irrelevant
 179628 fail irrelevant
 179644 fail irrelevant
 179657 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 961792c9d61f7e03e0c1b6b9f93b8b306df94bf9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 652737c8090eb3792f8b4c4b22ab12d7cc32073f ea1b7a0733906b8425d948ae94fba63c32b1d425 de819c96c863467b6e625cd7197d17682f6c6122
 179682 fail irrelevant
 179708 fail irrelevant
 179733 fail irrelevant
 179756 fail irrelevant
 179776 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b17a3a133b18fb41493fba7d86e9b5804ea6a8cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 74c581b6452394e591f13beba9fea2ec0688e2f5 ea1b7a0733906b8425d948ae94fba63c32b1d425 9bf21fcaef07f68ab52d0382ff554616a1cf66d8
 179795 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b17a3a133b18fb41493fba7d86e9b5804ea6a8cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 74c581b6452394e591f13beba9fea2ec0688e2f5 ea1b7a0733906b8425d948ae94fba63c32b1d425 9bf21fcaef07f68ab52d0382ff554616a1cf66d8
 179802 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b17a3a133b18fb41493fba7d86e9b5804ea6a8cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 74c581b6452394e591f13beba9fea2ec0688e2f5 ea1b7a0733906b8425d948ae94fba63c32b1d425 9bf21fcaef07f68ab52d0382ff554616a1cf66d8
 179816 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7a8264ae4704f781e70cc44dafdf07e4e5e690a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 74c581b6452394e591f13beba9fea2ec0688e2f5 ea1b7a0733906b8425d948ae94fba63c32b1d425 9bf21fcaef07f68ab52d0382ff554616a1cf66d8
 179824 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7a8264ae4704f781e70cc44dafdf07e4e5e690a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa9e7fa4689d1becb2faf67f65aafcbcf664f1ce ea1b7a0733906b8425d948ae94fba63c32b1d425 9bf21fcaef07f68ab52d0382ff554616a1cf66d8
 179847 fail irrelevant
 179881 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 179883 fail irrelevant
 179884 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a0f9628705e35c981ae95376f9ebedf877d09111 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 15002921e878e6cf485f655d580733b5319ea015 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179885 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a0f9628705e35c981ae95376f9ebedf877d09111 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b0f0aa55fd292fa3489755a3a896e496c51ea86 ea1b7a0733906b8425d948ae94fba63c32b1d425 7a59096258fb9e9679538da8851fe00656841980
 179886 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c1feaf76833f5b29f887fd64371512731cbf7086 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179887 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75fb0cfc82376906243386514be0e4067d702117 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 38200011319b5819ff268dadb1b175faa6b0764a ea1b7a0733906b8425d948ae94fba63c32b1d425 dd0f000aafd91ff674a11d6d5623d345fa8f91a6
 179888 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a1d595fc9c049874b972a371fe6090738a176f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6611d8d5c265c138a4a0cc36a2c02d84a768976 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179891 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa1cd447b346e8cc8141df2fe2d321b032c08acb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c29a2f40cd5d1fdad4632b48343cd968db041a44 ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179893 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a1d595fc9c049874b972a371fe6090738a176f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2f886a34bb7e6f6fcf39d64829f4499476f26dba ea1b7a0733906b8425d948ae94fba63c32b1d425 31270f11a96ebb875cd70661e2df9e5c6edd7564
 179894 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 43b79f3b86c343a8973dc98278ad7f7921bf248d ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179896 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37151032989ecf6e7ce8b65bc7bcb400d0318b2c ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179897 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 76116e28e1491a06966fd594fefdaacb084ada10 ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179898 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ccf919d742e387a6e533cf41d422a26d89f0d99 ea1b7a0733906b8425d948ae94fba63c32b1d425 b84fdf521b306cce64388fe57ee6c7c00f9d3e76
 179900 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b22a2d409b1acfdf0d63d1bb3595194ceb3d94da ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179902 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f80f052277c88a67c55e107b550f504eeea947d3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ddf0676f1ade90026483a91823d86db4096a40ef ea1b7a0733906b8425d948ae94fba63c32b1d425 380a8c0c65bfb84dab54ab4641cca1387cc41edb
 179905 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e1f9f73ba15e0356ce1aa3317d7bd294f587ab58 ea1b7a0733906b8425d948ae94fba63c32b1d425 49b1cb27413034c81023d1faf7af43690e87291a
 179906 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3f21065f0983d37c5d4a11a3c59bab5201a9f499 ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179908 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 569346ad0a85b370fe28282656da18bddd291ed6 ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179909 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1eeca0750af5af2f0e78437bf791ac2de74bde74 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0f385a2420d2c3f8ae7ed65fbe2712027664059e ea1b7a0733906b8425d948ae94fba63c32b1d425 91d4d9506a4e8906253d1280bd5a1f39668fad64
 179910 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d89cb1fe5c778f51b5fdc6878adacdb0d908949 ea1b7a0733906b8425d948ae94fba63c32b1d425 406cea1970535cd7b9d6bcf09bc164ef9bb64bac
 179911 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9b0699ab801405fe5bdf1adea83bceac9ec62f97 ea1b7a0733906b8425d948ae94fba63c32b1d425 a90a0018f605e3bb0588816e5a1f957d6e4562eb
 179912 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 02fcfdce1e5ce86f1951191883e7e30de5aa08be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4919d0c44afd58e16a8a369ca359de7f0114e04c ea1b7a0733906b8425d948ae94fba63c32b1d425 a90a0018f605e3bb0588816e5a1f957d6e4562eb
 179913 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 38da9606f77842cdcdc231210c0369a6180c51a0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 36debafddd788066be10b33c5f11b984a08e5c85 ea1b7a0733906b8425d948ae94fba63c32b1d425 5b9bb91abba7c983def3b4bef71ab08ad360a242
 179874 fail irrelevant
 179914 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 540522fec06b87bf11ad5624abe23b515f282d60 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e0def6d37b624c68875800a3092352d11bd0a91 ea1b7a0733906b8425d948ae94fba63c32b1d425 9b70bc6d9678142a40e6c1c6934a32c7a0966e38
 179916 fail irrelevant
 179917 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 93a21b465bda44cecdd6347ad481ca6f55286547 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b548761e5d084f2fc0fc4badebab227b51a8a84 ea1b7a0733906b8425d948ae94fba63c32b1d425 f4f498d08d50259b9f25c274fd7b1e8ccf5693af
 179918 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6ce1a5cd8932844ec24701d158254ccf75b6159 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 acbc8aee5b09222dc6a5cb88306b67bcbe37e30b ea1b7a0733906b8425d948ae94fba63c32b1d425 4e0b4ccfc504f26187939068796295340ffd0e2f
 179920 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6b433719eabf0abc74cff0cfd5687f0137c4198a ea1b7a0733906b8425d948ae94fba63c32b1d425 b9adcb5ab910b61e5332728bd248906e68a45900
 179921 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5db84c85c3544b92fa236c4d169440d523712ae0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 285ee77f5b58237c972bbe82aa0e1dc489c147d6 ea1b7a0733906b8425d948ae94fba63c32b1d425 c0e202194bfcb413d7cf662b333550ed444c469b
 179925 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8a763b533bb1b10af2831f6c35d6545bdd5c69d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df3eb4d361fd609632281969b101f4f84f1c4d8 ea1b7a0733906b8425d948ae94fba63c32b1d425 6c707d4573f5df2b60503dfeedc10b33cebd60d1
 179928 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9d669016d968b0f3e17ce7df16ae51d85b0adfcf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ceabf6e500570ecfb311d8896c4ba9da8cf21f2a ea1b7a0733906b8425d948ae94fba63c32b1d425 a21c9e6ddfee6d21dff1f18c299cb94a47b32c9e
 179930 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 13b97736c876919b9786055829caaa4fa46984b7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5736527050cfcc5b92521d79fe87b4883059d864 ea1b7a0733906b8425d948ae94fba63c32b1d425 a21c9e6ddfee6d21dff1f18c299cb94a47b32c9e
 179933 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 deabea6e88f7c4c3c12a36ee30051c6209561165 ea1b7a0733906b8425d948ae94fba63c32b1d425 78e93e6e57c218eead498a664785f414bcb12460
 179938 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bd4c0ef409140bd1be393407c04005ac077d4574 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179943 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b3ca9646b9a5c44dfd110c5db9b4a8b8497de34e ea1b7a0733906b8425d948ae94fba63c32b1d425 78e93e6e57c218eead498a664785f414bcb12460
 179946 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 37d3eb026a766b2405daae47e02094c2ec248646 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4f01a9bb0461e8c11ee0c94d90a504cb7d580a85 645a64b4911d7cadf5749d7375544fc2384e70ba d60324d8af9404014cfcc37bba09e9facfd02fcf
 179948 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e030d08c2fc02743dd37e3d2e6e28fdd739590b9 ea1b7a0733906b8425d948ae94fba63c32b1d425 78e93e6e57c218eead498a664785f414bcb12460
 179952 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 37d3eb026a766b2405daae47e02094c2ec248646 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b07a936d3bfe97b07ddffcfbb532985a88033dd 645a64b4911d7cadf5749d7375544fc2384e70ba 1d60c20260c7e82fe5344d06c20d718e0cc03b8b
 179915 fail irrelevant
 179954 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51411435d559c55eaf38c02baf5d76da78bb658d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 70d17c3eedefe36b0f423575b57dc9708c4a9d57 645a64b4911d7cadf5749d7375544fc2384e70ba 89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
 179956 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 179957 fail irrelevant
 179958 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51411435d559c55eaf38c02baf5d76da78bb658d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 701ed34833f53880ba38bde09b0846d01fc16d66 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179959 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bf5678b5802685e07583e3c7ec56d883cbdd5da3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b748352c555b42d497fe8ee00ee2e44eb8627660 645a64b4911d7cadf5749d7375544fc2384e70ba 93017efd7c441420318e46443a06e40fa6f1b6d4
 179961 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d05739a3ff88457ae3ce90db3e91e9d2a11949c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2f8d6a88e44928e1afaab5fd37fafefc94bf395c 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179963 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a107ad0f623669c72997443dc0431eeb732f81a0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7c9236d6d61f30583d5d860097d88dbf0fe487bf 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179964 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 47ab397011b6d1ce4d5805117dc87d9e35f378db 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 886fb67020e32ce6a2cf7049c6f017acf1f0d69a 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179965 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba08910df1071bf5ade987529d9becb38d14a14a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eb66dac46da958c0ba20a2803344b20c8f79c48b 645a64b4911d7cadf5749d7375544fc2384e70ba f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
 179967 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bf5678b5802685e07583e3c7ec56d883cbdd5da3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fcb7e040f5c69ca1f0678f991ab5354488a9e192 645a64b4911d7cadf5749d7375544fc2384e70ba b2220f85256a9209560586c25e37d7ad860fa1e2
 179968 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5e477110dcb8ef4642dce399777c3dee68fa96c 645a64b4911d7cadf5749d7375544fc2384e70ba 10b80ee5588e8928b266dea02a5e99d098bd227a
 179955 fail irrelevant
 179970 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 37d3eb026a766b2405daae47e02094c2ec248646 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 709bcd7da3f6b4655d910634a0d520fa1439df38 645a64b4911d7cadf5749d7375544fc2384e70ba 87ee7a817d1800dc41e118f4035917b80498433a
 179972 fail irrelevant
 179973 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 82618d7bc341cb93b9ce9c206d7ec84cebe83d00 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179974 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 620cddb1e0e92e16407d4f2354cf85f49b7306c7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5e477110dcb8ef4642dce399777c3dee68fa96c 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179975 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8f4974543203bd1e3a77f198ebb2c60d177b1c40 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179977 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c057960c4e33becb22d4741156203a4b0d4a3088 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179980 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d886257d84dd7c3d3f04c3b1e2e4749b47541ee5 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179982 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c86422c5549c0983b4b4525b8f56a1c69dd67aa1 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179988 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c057960c4e33becb22d4741156203a4b0d4a3088 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179971 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 60ca584b8af0de525656f959991a440f8c191f12 ea1b7a0733906b8425d948ae94fba63c32b1d425 b5cc3c25a242ddb9c5b108884061b17f35c3084b
 179990 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c86422c5549c0983b4b4525b8f56a1c69dd67aa1 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179994 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 179996 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 60ca584b8af0de525656f959991a440f8c191f12 ea1b7a0733906b8425d948ae94fba63c32b1d425 b5cc3c25a242ddb9c5b108884061b17f35c3084b
 179997 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c057960c4e33becb22d4741156203a4b0d4a3088 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
 179999 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c86422c5549c0983b4b4525b8f56a1c69dd67aa1 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
Searching for interesting versions
 Result found: flight 175637 (pass), for basis pass
 Result found: flight 179971 (fail), for basis failure (at ancestor ~40)
 Repro found: flight 179994 (pass), for basis pass
 Repro found: flight 179996 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c057960c4e33becb22d4741156203a4b0d4a3088 645a64b4911d7cadf5749d7375544fc2384e70ba 78e93e6e57c218eead498a664785f414bcb12460
No revisions left to test, checking graph state.
 Result found: flight 179977 (pass), for last pass
 Result found: flight 179982 (fail), for first failure
 Repro found: flight 179988 (pass), for last pass
 Repro found: flight 179990 (fail), for first failure
 Repro found: flight 179997 (pass), for last pass
 Repro found: flight 179999 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  c86422c5549c0983b4b4525b8f56a1c69dd67aa1
  Bug not present: c057960c4e33becb22d4741156203a4b0d4a3088
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/179999/


  commit c86422c5549c0983b4b4525b8f56a1c69dd67aa1
  Author: Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Date:   Fri Jan 13 21:42:04 2023 +0100
  
      block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
      
      BlockDriver->bdrv_getlength is categorized as IO callback, and it
      currently doesn't run in a coroutine. We should let it take a graph
      rdlock since the callback traverses the block nodes graph, which however
      is only possible in a coroutine.
      
      Therefore turn it into a co_wrapper to move the actual function into a
      coroutine where the lock can be taken.
      
      Because now this function creates a new coroutine and polls, we need to
      take the AioContext lock where it is missing, for the only reason that
      internally co_wrapper calls AIO_WAIT_WHILE and it expects to release the
      AioContext lock.
      
      This is especially messy when a co_wrapper creates a coroutine and polls
      in bdrv_open_driver, because this function has so many callers in so
      many context that it can easily lead to deadlocks. Therefore the new
      rule for bdrv_open_driver is that the caller must always hold the
      AioContext lock of the given bs (except if it is a coroutine), because
      the function calls bdrv_refresh_total_sectors() which is now a
      co_wrapper.
      
      Once the rwlock is ultimated and placed in every place it needs to be,
      we will poll using AIO_WAIT_WHILE_UNLOCKED and remove the AioContext
      lock.
      
      Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>
      Message-Id: <20230113204212.359076-7-kwolf@redhat.com>
      Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.325198 to fit
pnmtopng: 231 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
179999: tolerable ALL FAIL

flight 179999 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/179999/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    12 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-xl-qcow2                                    fail    


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


