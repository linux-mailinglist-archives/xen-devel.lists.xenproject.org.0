Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8974590FDC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 13:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385571.621250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSP6-000787-Pd; Fri, 12 Aug 2022 11:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385571.621250; Fri, 12 Aug 2022 11:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSP6-00075o-Mh; Fri, 12 Aug 2022 11:00:36 +0000
Received: by outflank-mailman (input) for mailman id 385571;
 Fri, 12 Aug 2022 11:00:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMSP5-00075e-A4; Fri, 12 Aug 2022 11:00:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMSP5-00006r-5k; Fri, 12 Aug 2022 11:00:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMSP4-0001w6-Ui; Fri, 12 Aug 2022 11:00:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oMSP4-0007so-UF; Fri, 12 Aug 2022 11:00:34 +0000
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
	bh=hgpq0s9ekKk4f2UjjZVyNuachu84Jks4VRG3YXc37FE=; b=3xbkGeryzeXYM02Y2ZYG8VQVPo
	Gze40bbcKRrGF8QtWTnYTD2W7CHLiwLatdcUEMlw7qJZLH7yWYCCxl1agawxJ1kE2RxaKeOYsyuTn
	bSMiB4u1DZb2jga7x6bwNvxardkDr4Nl2FR9e/APkbqNdX8nM3jjhxy/ZvePjnG3jpJE=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-armhf-libvirt
Message-Id: <E1oMSP4-0007so-UF@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Aug 2022 11:00:34 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf-libvirt
testid libvirt-build

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172352/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf-libvirt.libvirt-build --summary-out=tmp/172418.bisection-summary --basis-template=172123 --blessings=real,real-bisect,real-retry qemu-mainline build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 172389 fail [host=cubietruck-gleizes] / 172123 [host=cubietruck-braque] 172103 ok.
Failure / basis pass flights: 172389 / 172103
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-444260d45ec2a84e8f8c192b3539a3cd5591d009 git://git.qemu.org/qemu.git#d2656dd577754129f86328f95e6ee4a241913d6f-a6b1c53e79d\
 08a99a28cc3e67a3e1a7c34102d6b git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#f732240fd3bac25116151db5ddeb7203b62e85ce-d7c3c845c44e097d6c980001e108da0bb84ed16f
Loaded 64885 nodes in revision graph
Searching for test results:
 172103 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172123 [host=cubietruck-braque]
 172148 [host=cubietruck-picasso]
 172164 [host=cubietruck-picasso]
 172197 [host=cubietruck-picasso]
 172217 [host=cubietruck-braque]
 172241 [host=cubietruck-braque]
 172252 [host=cubietruck-braque]
 172258 [host=cubietruck-braque]
 172261 [host=cubietruck-braque]
 172267 [host=cubietruck-braque]
 172260 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172269 [host=cubietruck-braque]
 172273 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172276 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172272 [host=cubietruck-braque]
 172277 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 e3fdb13e8851be570db41a50589ce82d11d61c12 46de2eec93bffa0706e6229c0da2919763c8eb04 a0aeab27ee0e1e221181a3083908dc2d4e1553ee
 172280 [host=cubietruck-braque]
 172284 [host=cubietruck-braque]
 172281 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172288 [host=cubietruck-braque]
 172295 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9 46de2eec93bffa0706e6229c0da2919763c8eb04 7c5b25c3038abc2dc8353f56ed67d2c4fcd43d79
 172290 [host=cubietruck-picasso]
 172297 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 7451fdeb696df1fec33d7e5d6de8fa6676afee27
 172300 [host=cubietruck-picasso]
 172303 [host=cubietruck-picasso]
 172298 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172304 [host=cubietruck-picasso]
 172308 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 5b04fe78646a8222626996113c9d1e598cb84831
 172312 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 37339ba9ef46cf55e077ca50235279f058b01779
 172307 [host=cubietruck-picasso]
 172317 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 2128143c114c52c7536e37c32935fdd77f23edc1
 172321 [host=cubietruck-picasso]
 172323 [host=cubietruck-picasso]
 172319 fail irrelevant
 172328 [host=cubietruck-picasso]
 172333 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172334 fail irrelevant
 172340 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172332 fail irrelevant
 172344 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172349 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172350 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172345 [host=cubietruck-picasso]
 172352 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172357 [host=cubietruck-picasso]
 172358 [host=cubietruck-picasso]
 172360 [host=cubietruck-picasso]
 172355 [host=cubietruck-picasso]
 172364 [host=cubietruck-picasso]
 172367 [host=cubietruck-picasso]
 172372 [host=cubietruck-picasso]
 172366 fail irrelevant
 172377 [host=cubietruck-picasso]
 172380 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172379 [host=cubietruck-braque]
 172383 fail irrelevant
 172388 [host=cubietruck-braque]
 172392 [host=cubietruck-braque]
 172393 [host=cubietruck-braque]
 172389 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
 172397 [host=cubietruck-braque]
 172411 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172418 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b 46de2eec93bffa0706e6229c0da2919763c8eb04 d7c3c845c44e097d6c980001e108da0bb84ed16f
Searching for interesting versions
 Result found: flight 172103 (pass), for basis pass
 Result found: flight 172389 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 172411 (pass), for basis pass
 Repro found: flight 172418 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
No revisions left to test, checking graph state.
 Result found: flight 172103 (pass), for last pass
 Result found: flight 172340 (fail), for first failure
 Repro found: flight 172344 (pass), for last pass
 Repro found: flight 172349 (fail), for first failure
 Repro found: flight 172350 (pass), for last pass
 Repro found: flight 172352 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172352/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
172418: tolerable FAIL

flight 172418 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/172418/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf                                                  pass    
 build-armhf-libvirt                                          fail    


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


