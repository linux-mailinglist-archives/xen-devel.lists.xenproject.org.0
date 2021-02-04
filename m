Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194B30F021
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81205.149623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bVn-0002S0-UG; Thu, 04 Feb 2021 10:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81205.149623; Thu, 04 Feb 2021 10:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bVn-0002RQ-Mm; Thu, 04 Feb 2021 10:05:19 +0000
Received: by outflank-mailman (input) for mailman id 81205;
 Thu, 04 Feb 2021 10:05:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7bVm-0002RI-6Y; Thu, 04 Feb 2021 10:05:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7bVl-0008Uo-UT; Thu, 04 Feb 2021 10:05:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7bVl-0003oD-Jb; Thu, 04 Feb 2021 10:05:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7bVl-00078k-J7; Thu, 04 Feb 2021 10:05:17 +0000
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
	bh=YbmSeTl7B1iVBDmdpCgf1IssVhi7+APiBtcRrvo+cEQ=; b=S0pnD+JPZWwM9p9hofrWI8uXZH
	SetO00NcWf0dnayLCE+enOM7qTFTU70pRejONbJbiP2jOqKb3+9xyKBupCXJyh7R1wXpkfzkGwBGI
	Ke2ngnDh3RrxBHCL+PNkXG7JYHDuWbvVld5IMMxoPn3/2WnqARG1SpFz0yVD25gGY8vo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete test-amd64-amd64-libvirt
Message-Id: <E1l7bVl-00078k-J7@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Feb 2021 10:05:17 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159010/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/test-amd64-amd64-libvirt.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/test-amd64-amd64-libvirt.guest-start --summary-out=tmp/159010.bisection-summary --basis-template=158387 --blessings=real,real-bisect,real-retry linux-5.4 test-amd64-amd64-libvirt guest-start
Searching for failure / basis pass:
 158962 fail [host=albana1] / 158681 [host=chardonnay0] 158624 [host=godello1] 158616 [host=albana0] 158609 [host=rimava1] 158603 [host=huxelrebe1] 158593 [host=pinot1] 158583 [host=fiano1] 158563 [host=godello1] 158552 [host=fiano0] 158544 ok.
Failure / basis pass flights: 158962 / 158544
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b468095cd3dfcd1aa4ae63bc623f534bc2390d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e5586863148773c15399ead249711143a74d2d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 3487f4cf8bf5cef47a4c3918c13a502afc9891f6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#d26b3110041a9fddc6c6e36398f53f7eab8cff82-0fbca6ce4174724f28be5268c5d210f51ed96e31 git://xenbits.xen.org/osstest/linux-firmware.git#\
 c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#6e5586863148773c15399ead249711143a74d2d0-3b468095cd3dfcd1aa4ae63bc623f534bc2390d2 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf0\
 52c8a7d28c5f85e790c5e45bcffa45e-ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e git://xenbits.xen.org/xen.git#3487f4cf8bf5cef47a4c3918c13a502afc9891f6-9dc687f155a57216b83b17f9cde55dd43e06b0cd
Loaded 15001 nodes in revision graph
Searching for test results:
 158533 [host=elbling0]
 158544 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e5586863148773c15399ead249711143a74d2d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 3487f4cf8bf5cef47a4c3918c13a502afc9891f6
 158552 [host=fiano0]
 158563 [host=godello1]
 158583 [host=fiano1]
 158593 [host=pinot1]
 158603 [host=huxelrebe1]
 158609 [host=rimava1]
 158616 [host=albana0]
 158624 [host=godello1]
 158681 [host=chardonnay0]
 158707 fail irrelevant
 158716 fail irrelevant
 158748 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e f8708b0ed6d549d1d29b8b5cc287f1f2b642bc63
 158765 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6677b5a3577c16501fbc51a3341446905bd21c38
 158796 fail irrelevant
 158818 fail irrelevant
 158841 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158863 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158881 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158929 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea56ebf67dd55483105aa9f9996a48213e78337e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158962 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b468095cd3dfcd1aa4ae63bc623f534bc2390d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158984 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e5586863148773c15399ead249711143a74d2d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 3487f4cf8bf5cef47a4c3918c13a502afc9891f6
 158988 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b468095cd3dfcd1aa4ae63bc623f534bc2390d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158991 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 6d57b582fb35d321ea42fe6a75f7251451a55569 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd
 158992 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5fa6987258a757a9fae70ff28188dff07f01bf50 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158994 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 60066d5181be6448def7e97b9ad0fc2741f6c1bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158995 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 6b59bd9eea08dea84df61bfa847579f14213684c c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 158999 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5a1d7bb7d333849eb7d3ab5ebfbf9805b2cd46c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159001 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c074680653e27f19eb584522df06758607277f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159002 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159003 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159006 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159007 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159008 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159010 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
Searching for interesting versions
 Result found: flight 158544 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x558ead726168) HASH(0x558eac618dc0) HASH(0x558ead720128) For basis fai\
 lure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c074680653e27f19eb584522df06758607277f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x558ead729098) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a\
 22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5a1d7bb7d333849eb7d3ab5ebfbf9805b2cd46c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x558ead6cdb40) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbd\
 d 6b59bd9eea08dea84df61bfa847579f14213684c c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x558ead729698) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 60066d5181be6448def7e97b9ad0fc2741f6c1bb c530a75c1e6a4\
 72b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3, results HASH(0x558eac619180) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 6d57b582fb35d321ea42fe6a75f7251451a55569 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80\
 f721ec7838cc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd, results HASH(0x558eac5064a0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e5586863148773c15399ead249711143a74d2d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7e\
 a428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 3487f4cf8bf5cef47a4c3918c13a502afc9891f6, results HASH(0x558ead6e7718) HASH(0x558eab893bd8) Result found: flight 158748 (fail), for basis failure (at ancestor ~6126)
 Repro found: flight 158984 (pass), for basis pass
 Repro found: flight 158988 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
No revisions left to test, checking graph state.
 Result found: flight 159002 (pass), for last pass
 Result found: flight 159003 (fail), for first failure
 Repro found: flight 159006 (pass), for last pass
 Repro found: flight 159007 (fail), for first failure
 Repro found: flight 159008 (pass), for last pass
 Repro found: flight 159010 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159010/


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

pnmtopng: 180 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/test-amd64-amd64-libvirt.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
159010: tolerable FAIL

flight 159010 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159010/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt     14 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt                                     fail    


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


