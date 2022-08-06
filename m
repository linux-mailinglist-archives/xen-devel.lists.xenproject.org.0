Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B685558B893
	for <lists+xen-devel@lfdr.de>; Sun,  7 Aug 2022 00:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381959.616818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKS8q-00055t-1V; Sat, 06 Aug 2022 22:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381959.616818; Sat, 06 Aug 2022 22:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKS8p-00053K-Un; Sat, 06 Aug 2022 22:19:31 +0000
Received: by outflank-mailman (input) for mailman id 381959;
 Sat, 06 Aug 2022 22:19:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKS8o-00053A-Ek; Sat, 06 Aug 2022 22:19:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKS8o-0006dI-4q; Sat, 06 Aug 2022 22:19:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKS8n-0004U4-Pm; Sat, 06 Aug 2022 22:19:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oKS8n-00056g-PG; Sat, 06 Aug 2022 22:19:29 +0000
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
	bh=vHm8nc8GP0+aqRhRO2XF5lMXhzmUCzxWkb6dFZOG2YQ=; b=mZaJAMCM4njURj2q8dcigD+wTp
	3OhabqRjIRZuwSXecnBo0dXiBUfqaIctupNbEeqEq7Nm9jj3qlcLWv/Dtkij7XapLRRqDGONYZWPI
	aTEF/P9tz1Yy6HM3+1EWYsQTHfUgaKoMhpaQ7S2wLqJBmkDo6Z73EzbsTU56wA8tQU+E=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-arm64-libvirt
Message-Id: <E1oKS8n-00056g-PG@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Aug 2022 22:19:29 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172257/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64-libvirt.libvirt-build --summary-out=tmp/172257.bisection-summary --basis-template=172123 --blessings=real,real-bisect,real-retry qemu-mainline build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 172241 fail [host=laxton1] / 172123 ok.
Failure / basis pass flights: 172241 / 172123
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#0dc9b78a46813d61533b2bb0f7ef897a06a273be-444260d45ec2a84e8f8c192b3539a3cd5591d009 git://git.qemu.org/qemu.git#2480f3bbd03814b0651a1f74959f5c6631ee5819-c669f22f1a4\
 7897e8d1d595d6b8a59a572f9158c git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8eb04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#f732240fd3bac25116151db5ddeb7203b62e85ce-6d6aee437e37fced0c49be97e08c30da873690fc
Loaded 64808 nodes in revision graph
Searching for test results:
 172123 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172148 fail irrelevant
 172164 fail irrelevant
 172197 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 09ed077d7fae5f825e18ff9a2004dcdd1b165edb 46de2eec93bffa0706e6229c0da2919763c8eb04 1f7543c039f6b9eb182f0395965b9d414ac774c4
 172235 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172237 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 09ed077d7fae5f825e18ff9a2004dcdd1b165edb 46de2eec93bffa0706e6229c0da2919763c8eb04 1f7543c039f6b9eb182f0395965b9d414ac774c4
 172217 fail irrelevant
 172239 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 ed021daf2d6c19499ae406055156dc19c073228f 46de2eec93bffa0706e6229c0da2919763c8eb04 7c5b25c3038abc2dc8353f56ed67d2c4fcd43d79
 172240 fail irrelevant
 172243 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 68b01ef0b3c182d207bff01dd3e20d287668c855
 172244 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 8a3b89e4307da260675483bb86fc06cc62ed7c08
 172245 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 ca45d3cb4586372909f350e54482246f994e1bc7
 172248 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172249 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172241 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172251 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
 172253 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 444260d45ec2a84e8f8c192b3539a3cd5591d009 c669f22f1a47897e8d1d595d6b8a59a572f9158c 46de2eec93bffa0706e6229c0da2919763c8eb04 6d6aee437e37fced0c49be97e08c30da873690fc
 172256 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
 172257 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
Searching for interesting versions
 Result found: flight 172123 (pass), for basis pass
 Result found: flight 172241 (fail), for basis failure
 Repro found: flight 172249 (pass), for basis pass
 Repro found: flight 172253 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 0dc9b78a46813d61533b2bb0f7ef897a06a273be 2480f3bbd03814b0651a1f74959f5c6631ee5819 46de2eec93bffa0706e6229c0da2919763c8eb04 f732240fd3bac25116151db5ddeb7203b62e85ce
No revisions left to test, checking graph state.
 Result found: flight 172123 (pass), for last pass
 Result found: flight 172248 (fail), for first failure
 Repro found: flight 172249 (pass), for last pass
 Repro found: flight 172251 (fail), for first failure
 Repro found: flight 172256 (pass), for last pass
 Repro found: flight 172257 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
  Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/172257/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
172257: tolerable ALL FAIL

flight 172257 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/172257/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


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


