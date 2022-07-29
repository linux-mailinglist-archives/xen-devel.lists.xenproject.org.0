Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A828A584938
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 03:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377248.610382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHEQR-00058H-Rw; Fri, 29 Jul 2022 01:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377248.610382; Fri, 29 Jul 2022 01:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHEQR-00054o-On; Fri, 29 Jul 2022 01:04:23 +0000
Received: by outflank-mailman (input) for mailman id 377248;
 Fri, 29 Jul 2022 01:04:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHEQP-00054e-PH; Fri, 29 Jul 2022 01:04:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHEQP-00054V-99; Fri, 29 Jul 2022 01:04:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHEQO-0004XF-VM; Fri, 29 Jul 2022 01:04:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHEQO-0008GA-Uo; Fri, 29 Jul 2022 01:04:20 +0000
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
	bh=X35vZrCvJlE2cvCYMC7CnjEMdhMw6gZMzCexTQmVKsg=; b=ZgBap6xunoOReH+sxPUuiPpUK8
	1a5TAIScc89GgL9cGJOf2aJ9Mdq1ALQexwEw+BpDpmPJ5y5dkrsGjGbSaxfBpm8YaZIK4sG7BcmOG
	QWK7m/H4HTnI8dB3GkHlor6OniMAaja7HwZ06KSLzPAbxbQGaSVBslVN5RIX9bseUZEw=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Message-Id: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jul 2022 01:04:20 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build --summary-out=tmp/171909.bisection-summary --basis-template=171884 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 171899 fail [host=himrod1] / 171884 ok.
Failure / basis pass flights: 171899 / 171884
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 ca45d3cb4586372909f350e54482246f994e1bc7
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedf\
 aa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#f732240fd3bac25116151db5ddeb7203b62e85ce-ca45d3cb4586372909f350e54482246f994e1bc7
Loaded 5001 nodes in revision graph
Searching for test results:
 171884 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
 171909 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 171899 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 ca45d3cb4586372909f350e54482246f994e1bc7
 171902 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
 171904 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 ca45d3cb4586372909f350e54482246f994e1bc7
 171905 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 171906 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
 171907 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 171908 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
Searching for interesting versions
 Result found: flight 171884 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce, results HASH(0x557af26f7d68) HASH(0x557af2703340) HASH(0x557af2707f78) HASH(0x557af270bb08) Result found: flight 171899 (fail), for basis failure (at ancestor ~368)
 Repro found: flight 171902 (pass), for basis pass
 Repro found: flight 171904 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 f732240fd3bac25116151db5ddeb7203b62e85ce
No revisions left to test, checking graph state.
 Result found: flight 171884 (pass), for last pass
 Result found: flight 171905 (fail), for first failure
 Repro found: flight 171906 (pass), for last pass
 Repro found: flight 171907 (fail), for first failure
 Repro found: flight 171908 (pass), for last pass
 Repro found: flight 171909 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/


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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
171909: tolerable ALL FAIL

flight 171909 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171909/

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


