Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E830AF1C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 19:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80072.146169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6dsP-0001j3-Ai; Mon, 01 Feb 2021 18:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80072.146169; Mon, 01 Feb 2021 18:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6dsP-0001iY-6d; Mon, 01 Feb 2021 18:24:41 +0000
Received: by outflank-mailman (input) for mailman id 80072;
 Mon, 01 Feb 2021 18:24:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6dsO-0001iP-7X; Mon, 01 Feb 2021 18:24:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6dsN-00005X-Ue; Mon, 01 Feb 2021 18:24:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6dsN-0002cN-KB; Mon, 01 Feb 2021 18:24:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l6dsN-0001WU-Jh; Mon, 01 Feb 2021 18:24:39 +0000
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
	bh=83cLAWfZmRY0/DtxBsgN+vm8chzd+cdXTGGfXvoM/RI=; b=YV/uBNt25tFOLef2oryaenh/JR
	Gt0D0/5sAQiLpJm5S5mdRROtj6jVgRq6xkcQewOY0HMMGGK+Ko+QqGuJzLIg7f7vBo+tjFao1DVpI
	blsx00y96s2a5xfoIuEl10lkT0ojZu4whSnocLPcYaTFlTgKsTK2h7ipjxaaA6jFKK4k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete test-amd64-amd64-qemuu-freebsd12-amd64
Message-Id: <E1l6dsN-0001WU-Jh@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Feb 2021 18:24:39 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-freebsd12-amd64
testid guest-start

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158894/


  commit a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Author: David Woodhouse <dwmw@amazon.co.uk>
  Date:   Wed Jan 13 13:26:02 2021 +0000
  
      xen: Fix event channel callback via INTX/GSI
      
      [ Upstream commit 3499ba8198cad47b731792e5e56b9ec2a78a83a2 ]
      
      For a while, event channel notification via the PCI platform device
      has been broken, because we attempt to communicate with xenstore before
      we even have notifications working, with the xs_reset_watches() call
      in xs_init().
      
      We tend to get away with this on Xen versions below 4.0 because we avoid
      calling xs_reset_watches() anyway, because xenstore might not cope with
      reading a non-existent key. And newer Xen *does* have the vector
      callback support, so we rarely fall back to INTX/GSI delivery.
      
      To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
      startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
      case, deferring it to be called from xenbus_probe() in the XS_HVM case
      instead.
      
      Then fix up the invocation of xenbus_probe() to happen either from its
      device_initcall if the callback is available early enough, or when the
      callback is finally set up. This means that the hack of calling
      xenbus_probe() from a workqueue after the first interrupt, or directly
      from the PCI platform device setup, is no longer needed.
      
      Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Link: https://lore.kernel.org/r/20210113132606.422794-2-dwmw2@infradead.org
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Sasha Levin <sashal@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/test-amd64-amd64-qemuu-freebsd12-amd64.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/test-amd64-amd64-qemuu-freebsd12-amd64.guest-start --summary-out=tmp/158894.bisection-summary --basis-template=158387 --blessings=real,real-bisect,real-retry linux-5.4 test-amd64-amd64-qemuu-freebsd12-amd64 guest-start
Searching for failure / basis pass:
 158863 fail [host=pinot1] / 158681 [host=chardonnay1] 158624 [host=huxelrebe1] 158616 [host=fiano0] 158609 [host=godello1] 158603 [host=albana0] 158593 [host=rimava1] 158583 [host=elbling0] 158563 [host=elbling1] 158552 [host=fiano1] 158544 [host=chardonnay0] 158533 [host=huxelrebe1] 158520 [host=albana0] 158500 [host=godello1] 158487 ok.
Failure / basis pass flights: 158863 / 158487
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
Basis pass ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#ceed81a883dc43e2073ecdcfd273fa179e24df5b-0fbca6ce4174724f28be5268c5d210f51ed96e31 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c88736f8605eab3b0877d9301f8e845291c6fdd9-c6be6dab9c4bdf135bc02b61ecc304d5511c3588 git://xenbits.xen.org/qemu-xen-traditional\
 .git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e-ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e git://xenbits.xen.org/xen.git#db9c4ad1b1abaef3c38027b9b2700d9250d13125-9dc687f155a57216b83b17f9cde55dd43e06b0cd
Loaded 15001 nodes in revision graph
Searching for test results:
 158477 [host=huxelrebe0]
 158487 pass ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158500 [host=godello1]
 158520 [host=albana0]
 158533 [host=huxelrebe1]
 158544 [host=chardonnay0]
 158552 [host=fiano1]
 158563 [host=elbling1]
 158583 [host=elbling0]
 158593 [host=rimava1]
 158603 [host=albana0]
 158609 [host=godello1]
 158616 [host=fiano0]
 158624 [host=huxelrebe1]
 158681 [host=chardonnay1]
 158707 fail irrelevant
 158716 fail irrelevant
 158748 fail 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e f8708b0ed6d549d1d29b8b5cc287f1f2b642bc63
 158765 fail 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6677b5a3577c16501fbc51a3341446905bd21c38
 158796 fail irrelevant
 158818 fail irrelevant
 158841 fail 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158871 pass ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125
 158872 fail 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158891 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158875 pass d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e bb9afb7a465d3b7b438f2e11105409d24400f8f4
 158877 pass 1607adf1ac413927b6fe19963ebdb52cf9664d9f c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158863 fail 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158880 fail 391187744436ec5bf00bab9952d145fc9fb652d1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158882 pass b1b943f5b65e374df982d9d37bfdddcb4870372f c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158883 fail 8c3d3b385ed868660c7dff0336da1bd5a9fb134d c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158885 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158886 pass c074680653e27f19eb584522df06758607277f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158887 pass 8ab3478335ad8fc08f14ec73251b084fe02b3ebb c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158888 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158889 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158890 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158893 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158894 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
Searching for interesting versions
 Result found: flight 158487 (pass), for basis pass
 For basis failure, parent search stopping at acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x562b4a4ce6f0) HASH(0x562b4a489778) HASH(0x562b4a462f20) For basis failure, parent search stopping at 8ab3478335ad8fc08f14ec73251b084fe02b3ebb c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x562b4a4b14f8) For basis failure, parent search stopping at c074680653e27f19eb584522df06758607277f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x562b4a4c70c0) For basis failure, parent search stopping at b1b943f5b65e374df982d9d37bfdddcb4870372f c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x562b494e5488) For basis\
  failure, parent search stopping at 1607adf1ac413927b6fe19963ebdb52cf9664d9f c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x562b4875ac50) For basis failure, parent search stopping at d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcf\
 eddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e bb9afb7a465d3b7b438f2e11105409d24400f8f4, results HASH(0x562b4a4d9040) For basis failure, parent search stopping at ceed81a883dc43e2073ecdcfd273fa179e24df5b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c88736f8605eab3b0877d9301f8e845291c6fdd9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcf\
 fa45e db9c4ad1b1abaef3c38027b9b2700d9250d13125, results HASH(0x562b4a480028) HASH(0x562b4a49b008) Result found: flight 158748 (fail), for basis failure (at ancestor ~10985)
 Repro found: flight 158871 (pass), for basis pass
 Repro found: flight 158872 (fail), for basis failure
 0 revisions at acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
No revisions left to test, checking graph state.
 Result found: flight 158888 (pass), for last pass
 Result found: flight 158889 (fail), for first failure
 Repro found: flight 158890 (pass), for last pass
 Repro found: flight 158891 (fail), for first failure
 Repro found: flight 158893 (pass), for last pass
 Repro found: flight 158894 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158894/


  commit a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Author: David Woodhouse <dwmw@amazon.co.uk>
  Date:   Wed Jan 13 13:26:02 2021 +0000
  
      xen: Fix event channel callback via INTX/GSI
      
      [ Upstream commit 3499ba8198cad47b731792e5e56b9ec2a78a83a2 ]
      
      For a while, event channel notification via the PCI platform device
      has been broken, because we attempt to communicate with xenstore before
      we even have notifications working, with the xs_reset_watches() call
      in xs_init().
      
      We tend to get away with this on Xen versions below 4.0 because we avoid
      calling xs_reset_watches() anyway, because xenstore might not cope with
      reading a non-existent key. And newer Xen *does* have the vector
      callback support, so we rarely fall back to INTX/GSI delivery.
      
      To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
      startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
      case, deferring it to be called from xenbus_probe() in the XS_HVM case
      instead.
      
      Then fix up the invocation of xenbus_probe() to happen either from its
      device_initcall if the callback is available early enough, or when the
      callback is finally set up. This means that the hack of calling
      xenbus_probe() from a workqueue after the first interrupt, or directly
      from the PCI platform device setup, is no longer needed.
      
      Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Link: https://lore.kernel.org/r/20210113132606.422794-2-dwmw2@infradead.org
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Sasha Levin <sashal@kernel.org>

pnmtopng: 134 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/test-amd64-amd64-qemuu-freebsd12-amd64.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
158894: tolerable ALL FAIL

flight 158894 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158894/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd12-amd64 13 guest-start   fail baseline untested


jobs:
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    


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


