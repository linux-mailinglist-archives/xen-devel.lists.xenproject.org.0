Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA031F43F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 04:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86758.163112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCwfA-0004Xy-Gv; Fri, 19 Feb 2021 03:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86758.163112; Fri, 19 Feb 2021 03:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCwfA-0004XS-AU; Fri, 19 Feb 2021 03:41:04 +0000
Received: by outflank-mailman (input) for mailman id 86758;
 Fri, 19 Feb 2021 03:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lCwf8-0004XK-PA; Fri, 19 Feb 2021 03:41:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lCwf8-0006jA-Gr; Fri, 19 Feb 2021 03:41:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lCwf8-0004Gx-8M; Fri, 19 Feb 2021 03:41:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lCwf8-0001MX-7N; Fri, 19 Feb 2021 03:41:02 +0000
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
	bh=AxJPj6s906IAs2x+dw3xQLtjyPnu63GPqEkw/Yy9KGM=; b=6koQV2E/BaK8B8uo7CIPlfMrKq
	uppp/o/C7V/c3s4A9RbDKOqsEytBJW1BGg+3bh9qnjnaD5NC0bc1ZNYQY7ZMcDenTTmeMnH/Y0jYL
	/ie1jDuNfu0AZjSKHRm54YR1P5f3Q4XqTApS/mvarNYZr3BvJOFDTV7BNLRLwM1dAdao=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete test-armhf-armhf-libvirt
Message-Id: <E1lCwf8-0001MX-7N@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Feb 2021 03:41:02 +0000

branch xen-unstable
xenbranch xen-unstable
job test-armhf-armhf-libvirt
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159469/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/test-armhf-armhf-libvirt.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/test-armhf-armhf-libvirt.guest-start --summary-out=tmp/159469.bisection-summary --basis-template=158387 --blessings=real,real-bisect,real-retry linux-5.4 test-armhf-armhf-libvirt guest-start
Searching for failure / basis pass:
 159431 fail [host=cubietruck-gleizes] / 158681 [host=cubietruck-braque] 158624 [host=cubietruck-picasso] 158616 [host=arndale-bluewater] 158609 [host=arndale-metrocentre] 158603 [host=cubietruck-metzinger] 158593 [host=arndale-westfield] 158583 [host=arndale-lakeside] 158563 ok.
Failure / basis pass flights: 159431 / 158563
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 339371ef78eb3a6f2e9848f8b058379de5e87d39 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e e8adbf680b56a3f4b9600c7bcc04fec1877a6213
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#d26b3110041a9fddc6c6e36398f53f7eab8cff82-5b9a4104c902d7dec14c9e3c5652a638194487c6 git://xenbits.xen.org/osstest/linux-firmware.git#\
 c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#339371ef78eb3a6f2e9848f8b058379de5e87d39-4f4d862c1c7232a18347616d94c343c929657fdb git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e-ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e git://xenbits.xen.org/xen.git#e8adbf680b56a3f4b9600c7bcc\
 04fec1877a6213-04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
Loaded 15001 nodes in revision graph
Searching for test results:
 158552 [host=cubietruck-braque]
 158563 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 339371ef78eb3a6f2e9848f8b058379de5e87d39 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e e8adbf680b56a3f4b9600c7bcc04fec1877a6213
 158583 [host=arndale-lakeside]
 158593 [host=arndale-westfield]
 158603 [host=cubietruck-metzinger]
 158609 [host=arndale-metrocentre]
 158616 [host=arndale-bluewater]
 158624 [host=cubietruck-picasso]
 158681 [host=cubietruck-braque]
 158707 fail irrelevant
 158716 fail irrelevant
 158748 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e f8708b0ed6d549d1d29b8b5cc287f1f2b642bc63
 158765 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 131f8d8a889a5ca66a835eea82bba043ac91a7cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 6677b5a3577c16501fbc51a3341446905bd21c38
 158796 fail irrelevant
 158818 fail irrelevant
 158841 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158863 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158881 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c6be6dab9c4bdf135bc02b61ecc304d5511c3588 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158929 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0fbca6ce4174724f28be5268c5d210f51ed96e31 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea56ebf67dd55483105aa9f9996a48213e78337e 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158962 fail irrelevant
 159023 fail irrelevant
 159129 fail irrelevant
 159200 fail irrelevant
 159238 fail irrelevant
 159295 fail irrelevant
 159324 fail irrelevant
 159339 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e1e8c35f3178df95d79da81ac6deec242da74c2 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159359 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e1e8c35f3178df95d79da81ac6deec242da74c2 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159372 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e1e8c35f3178df95d79da81ac6deec242da74c2 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159399 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e1e8c35f3178df95d79da81ac6deec242da74c2 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159439 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd d26b3110041a9fddc6c6e36398f53f7eab8cff82 c530a75c1e6a472b0eb9558310b518f0dfcd8860 339371ef78eb3a6f2e9848f8b058379de5e87d39 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e e8adbf680b56a3f4b9600c7bcc04fec1877a6213
 159442 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e1e8c35f3178df95d79da81ac6deec242da74c2 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159444 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd e2d69319b713c30ca21428c3955a79f3a7bf6c23 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b769c5110384fb33bcfeddced80f721ec7838cc 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 452ddbe3592b141b05a7e0676f09c8ae07f98fdd
 159447 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 8c3d3b385ed868660c7dff0336da1bd5a9fb134d c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159449 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 4d1cf8eeda5b3f411440d9910a484b1d06484aa7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159451 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 68f99105752d132d411231bfc60cf78eceaac5e0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159452 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159455 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 7eef736858712ab65afea3908f49eb4e7775fa93 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159431 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159456 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159458 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 5b9a4104c902d7dec14c9e3c5652a638194487c6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
 159464 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159466 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159468 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
 159469 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a09d4e7acdbf276b2096661ee82454ae3dd24d2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
Searching for interesting versions
 Result found: flight 158563 (pass), for basis pass
 Result found: flight 159339 (fail), for basis failure (at ancestor ~281)
 Repro found: flight 159439 (pass), for basis pass
 Repro found: flight 159458 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd acc402fa5bf502d471d50e3d495379f093a7f9e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 7ea428895af2840d85c524f0bd11a38aac308308 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 464301737acfa90b46b79659b19d7f456861def3
No revisions left to test, checking graph state.
 Result found: flight 159452 (pass), for last pass
 Result found: flight 159456 (fail), for first failure
 Repro found: flight 159464 (pass), for last pass
 Repro found: flight 159466 (fail), for first failure
 Repro found: flight 159468 (pass), for last pass
 Repro found: flight 159469 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  a09d4e7acdbf276b2096661ee82454ae3dd24d2b
  Bug not present: acc402fa5bf502d471d50e3d495379f093a7f9e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159469/


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

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.910397 to fit
pnmtopng: 105 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/test-armhf-armhf-libvirt.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
159469: tolerable FAIL

flight 159469 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159469/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-libvirt     14 guest-start             fail baseline untested


jobs:
 build-armhf-libvirt                                          pass    
 test-armhf-armhf-libvirt                                     fail    


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


