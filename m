Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E670B309B54
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 11:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79237.144295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6A5k-0004dV-62; Sun, 31 Jan 2021 10:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79237.144295; Sun, 31 Jan 2021 10:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6A5k-0004d2-1k; Sun, 31 Jan 2021 10:36:28 +0000
Received: by outflank-mailman (input) for mailman id 79237;
 Sun, 31 Jan 2021 10:36:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6A5j-0004cu-0Y; Sun, 31 Jan 2021 10:36:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6A5i-00041Q-Le; Sun, 31 Jan 2021 10:36:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6A5i-0007KB-Ch; Sun, 31 Jan 2021 10:36:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l6A5i-00077B-CD; Sun, 31 Jan 2021 10:36:26 +0000
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
	bh=1gYtzwD8/YkJom+0hkJcwBsAbRGX14PEl0CwW4fDg8w=; b=0N6MC9NU2aMo+uPjQ5tOuLdpaC
	SqJw/nO9/n8e5YUxHNSdifYqVHWKMM6l9yK0gNxo1XyoSKNZwm+VhY5QlGkyQs7pDS2OKdAeW6obe
	dIZUqyD3wXjywhmSU/F8hwUHD13u90fY/IiD+4EpDDCLkQT384yFno/WwhkkTA52aEKM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete test-amd64-amd64-xl-multivcpu
Message-Id: <E1l6A5i-00077B-CD@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Jan 2021 10:36:26 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-multivcpu
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158850/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/test-amd64-amd64-xl-multivcpu.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/test-amd64-amd64-xl-multivcpu.guest-start --summary-out=tmp/158850.bisection-summary --basis-template=158387 --blessings=real,real-bisect,real-retry linux-5.4 test-amd64-amd64-xl-multivcpu guest-start
Searching for failure / basis pass:
 158818 fail [host=godello1] / 158681 [host=chardonnay1] 158624 [host=fiano1] 158616 [host=huxelrebe1] 158609 ok.
Failure / basis pass flights: 158818 / 158609
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e fbb3bf002b42803ef289ea2a649ebd5f25d22236
Basis pass 09f983f0c7fc0db79a5f6c883ec3510d424c369c c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#09f983f0c7fc0db79a5f6c883ec3510d424c369c-0fbca6ce4174724f28be5268c5d210f51ed96e31 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#3b769c5110384fb33bcfeddced80f721ec7838cc-c6be6dab9c4bdf135bc02b61ecc304d5511c3588 git://xenbits.xen.org/qemu-xen-traditional\
 .git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e-ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e git://xenbits.xen.org/xen.git#452ddbe3592b141b05a7e0676f09c8ae07f98fdd-fbb3bf002b42803ef289ea2a649ebd5f25d22236
From git://cache:9419/git://xenbits.xen.org/xen
   07edcd17fa..9dc687f155  coverity-tested/smoke -> origin/coverity-tested/smoke
Loaded 15001 nodes in revision graph
Searching for test results:
 158593 [host=rimava1]
 158603 [host=pinot0]
 158609 pass 09f983f0c7fc0db79a5f6c883ec3510d424c369c c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd
 158616 [host=huxelrebe1]
 158624 [host=fiano1]
 158681 [host=chardonnay1]
 158707 fail irrelevant
 158716 fail irrelevant
 158748 fail 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e f8708b0ed6d549d1d29b8b5cc287f1f2b642bc63
 158765 fail 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6677b5a3577c16501fbc51a3341446905bd21c38
 158796 fail irrelevant
 158829 pass 09f983f0c7fc0db79a5f6c883ec3510d424c369c c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd
 158830 fail irrelevant
 158831 fail 38f35023fd301abeb01cfd81e73caa2e4e7ec0b1 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158832 pass d8a487e673abf46c69c901bb25da54e9bc7ba45e c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158833 pass 5a1d7bb7d333849eb7d3ab5ebfbf9805b2cd46c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158834 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158837 pass 9cec63a3aacbcaee8d09aecac2ca2f8820efcc70 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158838 pass 8ab3478335ad8fc08f14ec73251b084fe02b3ebb c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158818 fail 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e fbb3bf002b42803ef289ea2a649ebd5f25d22236
 158840 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158843 fail 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e fbb3bf002b42803ef289ea2a649ebd5f25d22236
 158844 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158845 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158846 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158847 pass acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158850 fail a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
Searching for interesting versions
 Result found: flight 158609 (pass), for basis pass
 For basis failure, parent search stopping at acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x56300d0c51d0) HASH(0x56300c1043a0) HASH(0x56300d0b1610) For basis failure, parent search stopping at 8ab3478335ad8fc08f14ec73251b084fe02b3ebb c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x56300d088330) For basis failure, parent search stopping at 9cec63a3aacbcaee8d09aecac2ca2f8820efcc70 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x56300d0cb810) For basis failure, parent search stopping at 5a1d7bb7d333849eb7d3ab5ebfbf9805b2cd46c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x56300d09def8) For basis\
  failure, parent search stopping at d8a487e673abf46c69c901bb25da54e9bc7ba45e c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x56300d0c4bd0) For basis failure, parent search stopping at 09f983f0c7fc0db79a5f6c883ec3510d424c369c c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcf\
 eddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd, results HASH(0x56300d0a6e40) HASH(0x56300d0b7dd0) Result found: flight 158748 (fail), for basis failure (at ancestor ~5941)
 Repro found: flight 158829 (pass), for basis pass
 Repro found: flight 158843 (fail), for basis failure
 0 revisions at acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
No revisions left to test, checking graph state.
 Result found: flight 158840 (pass), for last pass
 Result found: flight 158844 (fail), for first failure
 Repro found: flight 158845 (pass), for last pass
 Repro found: flight 158846 (fail), for first failure
 Repro found: flight 158847 (pass), for last pass
 Repro found: flight 158850 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158850/


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

Revision graph left in /home/logs/results/bisect/linux-5.4/test-amd64-amd64-xl-multivcpu.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
158850: tolerable ALL FAIL

flight 158850 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158850/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-multivcpu 14 guest-start            fail baseline untested


jobs:
 test-amd64-amd64-xl-multivcpu                                fail    


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


