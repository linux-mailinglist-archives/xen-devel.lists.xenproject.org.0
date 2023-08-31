Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB478EE87
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593903.927086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgP-0002RM-VX; Thu, 31 Aug 2023 13:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593903.927086; Thu, 31 Aug 2023 13:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgP-0002JA-Lt; Thu, 31 Aug 2023 13:26:01 +0000
Received: by outflank-mailman (input) for mailman id 593903;
 Thu, 31 Aug 2023 13:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=smM9=EQ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbhgN-00011r-PC
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:25:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea80c338-4801-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 15:25:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-7l0Kjf4tPbm-G8T1mwim1w-1; Thu, 31 Aug 2023 09:25:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFC401C0726F;
 Thu, 31 Aug 2023 13:25:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDEBAC15BAE;
 Thu, 31 Aug 2023 13:25:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B418921E690D; Thu, 31 Aug 2023 15:25:46 +0200 (CEST)
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
X-Inumbo-ID: ea80c338-4801-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693488356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ChPjbICG22oISTLdoZBu20p3DiMRw4EY8JI0c9BFGJs=;
	b=IeiZyQUUlxh17ZIg0+KrCRlRMmdvc+Vm5tGbZjQkzIAA9UJbcDF32iuTK42ZLhebL2ryQz
	2pFzGMbOc30zgWKUwYG+qVUAtJJQ2e5FbPZifci8HcfI7+IRFGtYBrOW96G1N6nTaPXrNy
	pJoD9jnLQ5CqAzGldki8D8gaRcGMPT4=
X-MC-Unique: 7l0Kjf4tPbm-G8T1mwim1w-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/7] Steps towards enabling -Wshadow=local
Date: Thu, 31 Aug 2023 15:25:39 +0200
Message-ID: <20230831132546.3525721-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: PATCH 1.

Enabling -Wshadow would prevent bugs like this one.  But we'd have to
clean up all the offenders first.  We got a lot of them.

Enabling -Wshadow=local should be less work for almost as much gain.
I took a stab at it.  There's a small, exciting part, and a large,
boring part.

The exciting part is dark preprocessor sorcery to let us nest macro
calls without shadowing: PATCH 7.

The boring part is cleaning up all the other warnings.  I did some
[PATCH 2-6], but ran out of steam long before finishing the job.  Some
160 unique warnings remain.

To see them, enable -Wshadow=local like so:

diff --git a/meson.build b/meson.build
index 98e68ef0b1..9fc4c7ac9d 100644
--- a/meson.build
+++ b/meson.build
@@ -466,6 +466,9 @@ warn_flags = [
   '-Wno-tautological-type-limit-compare',
   '-Wno-psabi',
   '-Wno-gnu-variable-sized-type-not-at-end',
+  '-Wshadow=local',
+  '-Wno-error=shadow=local',
+  '-Wno-error=shadow=compatible-local',
 ]
 
 if targetos != 'darwin'

You may want to drop the -Wno-error lines.

Subsystems with -Wshadow=local warnings:

    virtio-gpu
    virtio
    Device Tree
    Overall TCG CPUs
    Overall Audio backends
    Open Sound System (OSS) Audio backend
    vhost
    vhost-user-gpu
    Cryptography
    M68K TCG CPUs
    Dump
    ACPI/SMBIOS
    Allwinner-a10
    ARM TCG CPUs
    MPS2
    ASPEED BMCs
    ARM SMMU
    Virt
    Machine core
    PC Chipset
    X86 TCG CPUs
    PC
    VT-d Emulation
    IDE
    ARM cores
    OpenPIC interrupt controller
    q800
    petalogix_ml605
    MicroBlaze TCG CPUs
    Versatile PB
    Network devices
    NiosII TCG CPUs
    nvme
    PowerNV (Non-Virtualized)
    sPAPR (pseries)
    OpenTitan
    RISC-V TCG CPUs
    SCSI
    USB
    Linux user
    Network packet abstractions
    Network device backends
    Network Block Device (NBD)
    Semihosting
    Memory API
    Seccomp
    Main loop
    Hexagon TCG CPUs
    X86 KVM CPUs
    MIPS TCG CPUs
    PowerPC TCG CPUs
    TriCore TCG CPUs
    Common TCG code
    qtest
    Throttling infrastructure
    Vhost-user block device backend server

Files with -Wshadow=local warnings:

    accel/tcg/tb-maint.c
    audio/audio.c
    audio/ossaudio.c
    contrib/vhost-user-gpu/vhost-user-gpu.c
    contrib/vhost-user-gpu/vugpu.h
    crypto/cipher-gnutls.c.inc
    crypto/tls-cipher-suites.c
    disas/m68k.c
    dump/dump.c
    hw/acpi/cpu_hotplug.c
    hw/arm/allwinner-r40.c
    hw/arm/armsse.c
    hw/arm/armv7m.c
    hw/arm/aspeed_ast2600.c
    hw/arm/smmuv3-internal.h
    hw/arm/smmuv3.c
    hw/arm/virt.c
    hw/core/machine.c
    hw/i2c/aspeed_i2c.c
    hw/i2c/pm_smbus.c
    hw/i386/acpi-build.c
    hw/i386/acpi-microvm.c
    hw/i386/intel_iommu.c
    hw/i386/pc.c
    hw/i386/x86.c
    hw/ide/ahci.c
    hw/intc/arm_gicv3_its.c
    hw/intc/openpic.c
    hw/loongarch/virt.c
    hw/m68k/bootinfo.h
    hw/microblaze/petalogix_ml605_mmu.c
    hw/misc/arm_sysctl.c
    hw/misc/aspeed_i3c.c
    hw/net/vhost_net.c
    hw/nios2/10m50_devboard.c
    hw/nvme/ns.c
    hw/ppc/pnv_psi.c
    hw/ppc/spapr.c
    hw/ppc/spapr_drc.c
    hw/ppc/spapr_pci.c
    hw/riscv/opentitan.c
    hw/scsi/mptsas.c
    hw/smbios/smbios.c
    hw/usb/desc.c
    hw/usb/dev-hub.c
    hw/usb/dev-storage.c
    hw/usb/hcd-xhci.c
    hw/usb/host-libusb.c
    hw/virtio/vhost.c
    hw/virtio/virtio-pci.c
    include/hw/cxl/cxl_device.h
    include/hw/ppc/fdt.h
    include/hw/virtio/virtio-gpu.h
    include/sysemu/device_tree.h
    linux-user/flatload.c
    linux-user/mmap.c
    linux-user/strace.c
    linux-user/syscall.c
    net/eth.c
    qemu-nbd.c
    semihosting/arm-compat-semi.c
    softmmu/device_tree.c
    softmmu/memory.c
    softmmu/physmem.c
    softmmu/qemu-seccomp.c
    softmmu/vl.c
    target/arm/tcg/mve_helper.c
    target/arm/tcg/translate-m-nocp.c
    target/hexagon/helper_funcs_generated.c.inc
    target/hexagon/mmvec/macros.h
    target/hexagon/op_helper.c
    target/hexagon/translate.c
    target/i386/cpu.c
    target/i386/kvm/kvm.c
    target/i386/tcg/seg_helper.c
    target/i386/tcg/sysemu/svm_helper.c
    target/i386/tcg/translate.c
    target/m68k/translate.c
    target/mips/tcg/msa_helper.c
    target/mips/tcg/nanomips_translate.c.inc
    target/mips/tcg/translate.c
    target/ppc/int_helper.c
    target/riscv/cpu.c
    target/riscv/vector_helper.c
    target/tricore/translate.c
    tcg/tcg.c
    tests/qtest/m48t59-test.c
    tests/qtest/pflash-cfi02-test.c
    tests/unit/test-throttle.c
    util/vhost-user-server.c

Markus Armbruster (7):
  migration/rdma: Fix save_page method to fail on polling error
  migration: Clean up local variable shadowing
  ui: Clean up local variable shadowing
  block/dirty-bitmap: Clean up local variable shadowing
  block/vdi: Clean up local variable shadowing
  block: Clean up local variable shadowing
  qobject atomics osdep: Make a few macros more hygienic

 include/qapi/qmp/qobject.h      |  8 +++++---
 include/qemu/atomic.h           | 11 ++++++-----
 include/qemu/osdep.h            | 34 ++++++++++++++++++---------------
 block.c                         |  7 ++++---
 block/monitor/bitmap-qmp-cmds.c |  2 +-
 block/qcow2-bitmap.c            |  3 +--
 block/rbd.c                     |  2 +-
 block/stream.c                  |  1 -
 block/vdi.c                     |  7 +++----
 block/vvfat.c                   | 34 ++++++++++++++++-----------------
 hw/block/xen-block.c            |  6 +++---
 migration/block.c               |  4 ++--
 migration/ram.c                 |  8 +++-----
 migration/rdma.c                | 14 +++++++++-----
 migration/vmstate.c             |  2 +-
 ui/gtk.c                        | 14 +++++++-------
 ui/spice-display.c              |  9 +++++----
 ui/vnc-palette.c                |  2 --
 ui/vnc.c                        | 12 ++++++------
 ui/vnc-enc-zrle.c.inc           |  9 ++++-----
 20 files changed, 97 insertions(+), 92 deletions(-)

-- 
2.41.0


