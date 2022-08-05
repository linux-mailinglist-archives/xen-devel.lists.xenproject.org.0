Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6658ACF1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381348.615993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJz1D-0005Jl-JJ; Fri, 05 Aug 2022 15:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381348.615993; Fri, 05 Aug 2022 15:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJz1D-0005HW-FO; Fri, 05 Aug 2022 15:13:43 +0000
Received: by outflank-mailman (input) for mailman id 381348;
 Fri, 05 Aug 2022 15:13:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJz1C-0005HM-6G; Fri, 05 Aug 2022 15:13:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJz1C-0002iX-1x; Fri, 05 Aug 2022 15:13:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJz1B-0001RV-MP; Fri, 05 Aug 2022 15:13:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJz1B-00044p-M0; Fri, 05 Aug 2022 15:13:41 +0000
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
	bh=JQ32aFc7cgWzfoNjtWy0ZZ2WWT4n49E/D1broP8GxU0=; b=CBB+z/Fvlz54UL2qDtUhLAUxl4
	tBFmajHlIFsALipZ9iq9b2mfsoTlIuNM+8N7m7+72dlEoTaApWHKKKb7CdfaKgT3B9rMpvuts2ivV
	1zLbXAvyobqPUhRjBfcombfAbfPEW10hCDDhgxDkLuF2FqYKCiDhBKRrL8mOwJfKU7jE=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-amd64-libvirt
Message-Id: <E1oJz1B-00044p-M0@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Aug 2022 15:13:41 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172189/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64-libvirt.libvirt-build --summary-out=tmp/172189.bisection-summary --basis-template=172123 --blessings=real,real-bisect,real-retry qemu-mainline build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 172148 fail [host=himrod1] / 172123 [host=himrod2] 172103 ok.
Failure / basis pass flights: 172148 / 172103
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9 46de2eec93bffa0706e6229c0da2919763c8eb04 01ca29f0b17a50a94b0e232ba276c32e95d80ae3
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-444260d45ec2a84e8f8c192b3539a3cd5591d009 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84\
 e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#d2656dd577754129f86328f95e6ee4a241913d6f-0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#f732240fd3bac25116151db5ddeb7203b62e85ce-01ca29f0b17a50a94b0e232ba276c32e95d80ae3
Loaded 64891 nodes in revision graph
Searching for test results:
 172103 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172123 [host=himrod2]
 172148 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9 46de2eec93bffa0706e6229c0da2919763c8eb04 01ca29f0b17a50a94b0e232ba276c32e95d80ae3
 172168 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9 46de2eec93bffa0706e6229c0da2919763c8eb04 01ca29f0b17a50a94b0e232ba276c32e95d80ae3
 172171 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 68b01ef0b3c182d207bff01dd3e20d287668c855
 172173 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 8a3b89e4307da260675483bb86fc06cc62ed7c08
 172165 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172176 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 ca45d3cb4586372909f350e54482246f994e1bc7
 172181 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172183 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172186 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172187 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172189 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
Searching for interesting versions
 Result found: flight 172103 (pass), for basis pass
 Result found: flight 172148 (fail), for basis failure
 Repro found: flight 172165 (pass), for basis pass
 Repro found: flight 172168 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d2656dd577754129f86328f95e6ee4a241913d6f 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
No revisions left to test, checking graph state.
 Result found: flight 172103 (pass), for last pass
 Result found: flight 172181 (fail), for first failure
 Repro found: flight 172183 (pass), for last pass
 Repro found: flight 172186 (fail), for first failure
 Repro found: flight 172187 (pass), for last pass
 Repro found: flight 172189 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172189/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
172189: tolerable ALL FAIL

flight 172189 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/172189/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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


