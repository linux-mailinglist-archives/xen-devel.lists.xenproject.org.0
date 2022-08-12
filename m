Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4759143A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 18:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385781.621531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMXsh-0007ba-3J; Fri, 12 Aug 2022 16:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385781.621531; Fri, 12 Aug 2022 16:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMXsh-0007YW-0P; Fri, 12 Aug 2022 16:51:31 +0000
Received: by outflank-mailman (input) for mailman id 385781;
 Fri, 12 Aug 2022 16:51:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMXsg-0007YM-01; Fri, 12 Aug 2022 16:51:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMXsf-0006gW-O3; Fri, 12 Aug 2022 16:51:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMXsf-0003PF-Cn; Fri, 12 Aug 2022 16:51:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oMXsf-00035C-CO; Fri, 12 Aug 2022 16:51:29 +0000
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
	bh=L79nog6u7cMJ1VfjUBt0JDyvgnTmVdr/4ppoB55YAUA=; b=ulU9vTJ7k+5/YB1m3aab8pDmme
	y29WsPbKwU8AwCzYwQOqAQv4TXMC28jK+fPtXaQIlutvLdJMo71mbQzojCEtSFFku+w+1rDRPH3LB
	twk4eAPjPPeO2+8tuz73PkeRqHYDeC5pVjo/9Pzz8ZE58bEZrEzaP8caeF+fBOB7cpBg=;
To: xen-devel@lists.xenproject.org
Subject: [linux-5.4 bisection] complete build-i386-libvirt
Message-Id: <E1oMXsf-00035C-CO@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Aug 2022 16:51:29 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
testid libvirt-build

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172441/


  commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Date:   Fri Jul 15 22:20:24 2022 +0300
  
      libxl: Add support for Virtio disk configuration
      
      This patch adds basic support for configuring and assisting virtio-mmio
      based virtio-disk backend (emulator) which is intended to run out of
      Qemu and could be run in any domain.
      Although the Virtio block device is quite different from traditional
      Xen PV block device (vbd) from the toolstack's point of view:
       - as the frontend is virtio-blk which is not a Xenbus driver, nothing
         written to Xenstore are fetched by the frontend currently ("vdev"
         is not passed to the frontend). But this might need to be revised
         in future, so frontend data might be written to Xenstore in order to
         support hotplugging virtio devices or passing the backend domain id
         on arch where the device-tree is not available.
       - the ring-ref/event-channel are not used for the backend<->frontend
         communication, the proposed IPC for Virtio is IOREQ/DM
      it is still a "block device" and ought to be integrated in existing
      "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
      logic to deal with Virtio devices as well.
      
      For the immediate purpose and an ability to extend that support for
      other use-cases in future (Qemu, virtio-pci, etc) perform the following
      actions:
      - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and reflect
        that in the configuration
      - Introduce new disk "specification" and "transport" fields to struct
        libxl_device_disk. Both are written to the Xenstore. The transport
        field is only used for the specification "virtio" and it assumes
        only "mmio" value for now.
      - Introduce new "specification" option with "xen" communication
        protocol being default value.
      - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
        one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
      
      An example of domain configuration for Virtio disk:
      disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=standalone, specification=virtio']
      
      Nothing has changed for default Xen disk configuration.
      
      Please note, this patch is not enough for virtio-disk to work
      on Xen (Arm), as for every Virtio device (including disk) we need
      to allocate Virtio MMIO params (IRQ and memory region) and pass
      them to the backend, also update Guest device-tree. The subsequent
      patch will add these missing bits. For the current patch,
      the default "irq" and "base" are just written to the Xenstore.
      This is not an ideal splitting, but this way we avoid breaking
      the bisectability.
      
      Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/build-i386-libvirt.libvirt-build --summary-out=tmp/172441.bisection-summary --basis-template=172128 --blessings=real,real-bisect,real-retry linux-5.4 build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 172398 fail [host=nobling1] / 172128 [host=italia0] 172108 [host=italia0] 171923 [host=italia0] 171846 ok.
Failure / basis pass flights: 172398 / 171846
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c0b7679aac90ab6c757bbc61ac4ccfa293ab14df 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#c0b7679aac90ab6c757bbc61ac4ccfa293ab14df-444260d45ec2a84e8f8c192b3539a3cd5591d009 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84\
 e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#fcd27b3c759995775afb66be6bb7ba1e85da0506-d7c3c845c44e097d6c980001e108da0bb84ed16f
Loaded 10001 nodes in revision graph
Searching for test results:
 171846 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c0b7679aac90ab6c757bbc61ac4ccfa293ab14df 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171923 [host=italia0]
 172108 [host=italia0]
 172128 [host=italia0]
 172384 [host=nobling0]
 172400 [host=nobling0]
 172402 [host=nobling0]
 172403 [host=nobling0]
 172404 [host=nobling0]
 172407 [host=nobling0]
 172410 [host=nobling0]
 172412 [host=nobling0]
 172413 [host=nobling0]
 172417 [host=nobling0]
 172419 [host=nobling0]
 172420 [host=nobling0]
 172398 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
 172421 [host=nobling0]
 172423 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c0b7679aac90ab6c757bbc61ac4ccfa293ab14df 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 172425 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
 172426 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0d0bfcb4571caa65b7875003f38e67e2ac7e5560 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 124f138b37d595294b3100349e26ffb3f1df7b13
 172427 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 7f1c89f16790fc2fa8bc88330dc896941b9b40bb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 5707470bf3103ebae43697a7ac2faced6cd35f92
 172428 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 1774a44ad91d01294bace32b0060ce26da2f0140 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172430 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 37339ba9ef46cf55e077ca50235279f058b01779
 172432 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172433 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0e7add1d75fc75762208af84579e6809589ea6e5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172434 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172436 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172437 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172439 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172440 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172441 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172399 [host=nobling0]
Searching for interesting versions
 Result found: flight 171846 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce, results HASH(0x558af0c23378) HASH(0x558af0c2fd60) HASH(0x558af0bf5ee0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef8\
 28bf719b2053ba398b195829413dbdd 0e7add1d75fc75762208af84579e6809589ea6e5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce, results HASH(0x558af0bc06d0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 1774a44ad91d01294bace32b0060ce26da2f0140 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458\
 386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce, results HASH(0x558aeff0b140) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 7f1c89f16790fc2fa8bc88330dc896941b9b40bb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 5707470bf3103ebae43697a7ac2faced6cd35f92, results HASH(0x558af0bf24d0) For basis\
  failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c0b7679aac90ab6c757bbc61ac4ccfa293ab14df 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506, results HASH(0x558af0bfeb28) HASH(0x558af0c12568) Result found: flight 172398 (fail), for basis failure (at ancestor ~5413)
 Repro found: flight 172423 (pass), for basis pass
 Repro found: flight 172425 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3eca64f157c340f9bbf552d89a69698a3090c080 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
No revisions left to test, checking graph state.
 Result found: flight 172434 (pass), for last pass
 Result found: flight 172436 (fail), for first failure
 Repro found: flight 172437 (pass), for last pass
 Repro found: flight 172439 (fail), for first failure
 Repro found: flight 172440 (pass), for last pass
 Repro found: flight 172441 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172441/


  commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Date:   Fri Jul 15 22:20:24 2022 +0300
  
      libxl: Add support for Virtio disk configuration
      
      This patch adds basic support for configuring and assisting virtio-mmio
      based virtio-disk backend (emulator) which is intended to run out of
      Qemu and could be run in any domain.
      Although the Virtio block device is quite different from traditional
      Xen PV block device (vbd) from the toolstack's point of view:
       - as the frontend is virtio-blk which is not a Xenbus driver, nothing
         written to Xenstore are fetched by the frontend currently ("vdev"
         is not passed to the frontend). But this might need to be revised
         in future, so frontend data might be written to Xenstore in order to
         support hotplugging virtio devices or passing the backend domain id
         on arch where the device-tree is not available.
       - the ring-ref/event-channel are not used for the backend<->frontend
         communication, the proposed IPC for Virtio is IOREQ/DM
      it is still a "block device" and ought to be integrated in existing
      "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
      logic to deal with Virtio devices as well.
      
      For the immediate purpose and an ability to extend that support for
      other use-cases in future (Qemu, virtio-pci, etc) perform the following
      actions:
      - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and reflect
        that in the configuration
      - Introduce new disk "specification" and "transport" fields to struct
        libxl_device_disk. Both are written to the Xenstore. The transport
        field is only used for the specification "virtio" and it assumes
        only "mmio" value for now.
      - Introduce new "specification" option with "xen" communication
        protocol being default value.
      - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
        one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
      
      An example of domain configuration for Virtio disk:
      disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=standalone, specification=virtio']
      
      Nothing has changed for default Xen disk configuration.
      
      Please note, this patch is not enough for virtio-disk to work
      on Xen (Arm), as for every Virtio device (including disk) we need
      to allocate Virtio MMIO params (IRQ and memory region) and pass
      them to the backend, also update Guest device-tree. The subsequent
      patch will add these missing bits. For the current patch,
      the default "irq" and "base" are just written to the Xenstore.
      This is not an ideal splitting, but this way we avoid breaking
      the bisectability.
      
      Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>

Revision graph left in /home/logs/results/bisect/linux-5.4/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
172441: tolerable ALL FAIL

flight 172441 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/172441/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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


