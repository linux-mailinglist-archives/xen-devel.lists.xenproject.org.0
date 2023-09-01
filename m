Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3A78F97F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 10:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594483.927814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbz9c-0001Lb-Pn; Fri, 01 Sep 2023 08:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594483.927814; Fri, 01 Sep 2023 08:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbz9c-0001Je-Mo; Fri, 01 Sep 2023 08:05:20 +0000
Received: by outflank-mailman (input) for mailman id 594483;
 Fri, 01 Sep 2023 08:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=odZU=ER=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbz9a-0001JY-H8
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 08:05:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f5d454-489e-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 10:05:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-MQulV_cBNAm4d3ZX4whsBA-1; Fri, 01 Sep 2023 04:05:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C3E101A52E;
 Fri,  1 Sep 2023 08:05:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E869740C2063;
 Fri,  1 Sep 2023 08:05:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E578E21E692A; Fri,  1 Sep 2023 10:05:06 +0200 (CEST)
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
X-Inumbo-ID: 48f5d454-489e-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693555515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p9bH8tBHoE1nTGc4E8sU4DeLz2qqkxRJpm4B34MI+Qw=;
	b=gv3cTM7apmnqQIEzAomMauc1u2J+Alov4D59+ZcFCXla9Ri3fRW10zQpdvx2rQhKzcK08o
	uZaj9H1ki4lerif2t9zNyTY+z9E4rGhGzQw15Hf/aTT7a6pSsKGcldb6RN4aq+dKkq0PKM
	ESnqlNKoiL2K5JmrVZ/eBgDKOH2v2eQ=
X-MC-Unique: MQulV_cBNAm4d3ZX4whsBA-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,  hreitz@redhat.com,  eblake@redhat.com,
  vsementsov@yandex-team.ru,  jsnow@redhat.com,  idryomov@gmail.com,
  pl@kamp.de,  sw@weilnetz.de,  sstabellini@kernel.org,
  anthony.perard@citrix.com,  paul@xen.org,  pbonzini@redhat.com,
  marcandre.lureau@redhat.com,  berrange@redhat.com,  thuth@redhat.com,
  philmd@linaro.org,  stefanha@redhat.com,  fam@euphon.net,
  quintela@redhat.com,  peterx@redhat.com,  leobras@redhat.com,
  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org,
  peter.maydell@linaro.org
Subject: Re: [PATCH 0/7] Steps towards enabling -Wshadow=local
References: <20230831132546.3525721-1-armbru@redhat.com>
Date: Fri, 01 Sep 2023 10:05:06 +0200
In-Reply-To: <20230831132546.3525721-1-armbru@redhat.com> (Markus Armbruster's
	message of "Thu, 31 Aug 2023 15:25:39 +0200")
Message-ID: <87cyz2l3nx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Markus Armbruster <armbru@redhat.com> writes:

> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Bugs love to hide in such code.
> Evidence: PATCH 1.
>
> Enabling -Wshadow would prevent bugs like this one.  But we'd have to
> clean up all the offenders first.  We got a lot of them.
>
> Enabling -Wshadow=local should be less work for almost as much gain.
> I took a stab at it.  There's a small, exciting part, and a large,
> boring part.
>
> The exciting part is dark preprocessor sorcery to let us nest macro
> calls without shadowing: PATCH 7.
>
> The boring part is cleaning up all the other warnings.  I did some
> [PATCH 2-6], but ran out of steam long before finishing the job.  Some
> 160 unique warnings remain.
>
> To see them, enable -Wshadow=local like so:
>
> diff --git a/meson.build b/meson.build
> index 98e68ef0b1..9fc4c7ac9d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -466,6 +466,9 @@ warn_flags = [
>    '-Wno-tautological-type-limit-compare',
>    '-Wno-psabi',
>    '-Wno-gnu-variable-sized-type-not-at-end',
> +  '-Wshadow=local',
> +  '-Wno-error=shadow=local',
> +  '-Wno-error=shadow=compatible-local',
>  ]
>  
>  if targetos != 'darwin'
>
> You may want to drop the -Wno-error lines.
>
> Subsystems with -Wshadow=local warnings:
>
>     virtio-gpu
>     virtio
>     Device Tree
>     Overall TCG CPUs

Philippe's "[PATCH 00/11] (few more) Steps towards enabling -Wshadow"
takes care of this one.

>     Overall Audio backends
>     Open Sound System (OSS) Audio backend
>     vhost
>     vhost-user-gpu
>     Cryptography
>     M68K TCG CPUs
>     Dump
>     ACPI/SMBIOS
>     Allwinner-a10

Likewise.

>     ARM TCG CPUs
>     MPS2
>     ASPEED BMCs
>     ARM SMMU
>     Virt
>     Machine core
>     PC Chipset
>     X86 TCG CPUs
>     PC
>     VT-d Emulation
>     IDE

Likewise.

>     ARM cores
>     OpenPIC interrupt controller
>     q800

Likewise.

>     petalogix_ml605
>     MicroBlaze TCG CPUs
>     Versatile PB
>     Network devices
>     NiosII TCG CPUs
>     nvme
>     PowerNV (Non-Virtualized)
>     sPAPR (pseries)
>     OpenTitan
>     RISC-V TCG CPUs
>     SCSI
>     USB
>     Linux user
>     Network packet abstractions

Likewise.

>     Network device backends

Likewise.

>     Network Block Device (NBD)
>     Semihosting
>     Memory API
>     Seccomp
>     Main loop
>     Hexagon TCG CPUs
>     X86 KVM CPUs
>     MIPS TCG CPUs

Likewise.

>     PowerPC TCG CPUs
>     TriCore TCG CPUs
>     Common TCG code

Likewise.

>     qtest
>     Throttling infrastructure
>     Vhost-user block device backend server
>
> Files with -Wshadow=local warnings:
>
>     accel/tcg/tb-maint.c

Likewise.

>     audio/audio.c
>     audio/ossaudio.c
>     contrib/vhost-user-gpu/vhost-user-gpu.c
>     contrib/vhost-user-gpu/vugpu.h
>     crypto/cipher-gnutls.c.inc
>     crypto/tls-cipher-suites.c
>     disas/m68k.c
>     dump/dump.c
>     hw/acpi/cpu_hotplug.c
>     hw/arm/allwinner-r40.c

Likewise.

>     hw/arm/armsse.c
>     hw/arm/armv7m.c
>     hw/arm/aspeed_ast2600.c

Likewise.

>     hw/arm/smmuv3-internal.h
>     hw/arm/smmuv3.c
>     hw/arm/virt.c

Likewise.

>     hw/core/machine.c
>     hw/i2c/aspeed_i2c.c
>     hw/i2c/pm_smbus.c
>     hw/i386/acpi-build.c
>     hw/i386/acpi-microvm.c
>     hw/i386/intel_iommu.c
>     hw/i386/pc.c
>     hw/i386/x86.c
>     hw/ide/ahci.c

Likewise.

>     hw/intc/arm_gicv3_its.c
>     hw/intc/openpic.c
>     hw/loongarch/virt.c
>     hw/m68k/bootinfo.h

Likewise.

>     hw/microblaze/petalogix_ml605_mmu.c
>     hw/misc/arm_sysctl.c
>     hw/misc/aspeed_i3c.c
>     hw/net/vhost_net.c
>     hw/nios2/10m50_devboard.c
>     hw/nvme/ns.c
>     hw/ppc/pnv_psi.c
>     hw/ppc/spapr.c
>     hw/ppc/spapr_drc.c
>     hw/ppc/spapr_pci.c
>     hw/riscv/opentitan.c
>     hw/scsi/mptsas.c
>     hw/smbios/smbios.c
>     hw/usb/desc.c
>     hw/usb/dev-hub.c
>     hw/usb/dev-storage.c
>     hw/usb/hcd-xhci.c
>     hw/usb/host-libusb.c
>     hw/virtio/vhost.c
>     hw/virtio/virtio-pci.c
>     include/hw/cxl/cxl_device.h
>     include/hw/ppc/fdt.h
>     include/hw/virtio/virtio-gpu.h
>     include/sysemu/device_tree.h

Likewise.

>     linux-user/flatload.c
>     linux-user/mmap.c
>     linux-user/strace.c
>     linux-user/syscall.c
>     net/eth.c

Likewise.

>     qemu-nbd.c
>     semihosting/arm-compat-semi.c
>     softmmu/device_tree.c
>     softmmu/memory.c
>     softmmu/physmem.c
>     softmmu/qemu-seccomp.c
>     softmmu/vl.c

      target/arm/hvf/hvf.c

Likewise.

>     target/arm/tcg/mve_helper.c

Likewise.

>     target/arm/tcg/translate-m-nocp.c

Likewise.

>     target/hexagon/helper_funcs_generated.c.inc

This is actually

      target/hexagon/gen_helper_funcs.py

>     target/hexagon/mmvec/macros.h
>     target/hexagon/op_helper.c
>     target/hexagon/translate.c
>     target/i386/cpu.c
>     target/i386/kvm/kvm.c
>     target/i386/tcg/seg_helper.c
>     target/i386/tcg/sysemu/svm_helper.c
>     target/i386/tcg/translate.c
>     target/m68k/translate.c

Likewise.

>     target/mips/tcg/msa_helper.c

Likewise.

>     target/mips/tcg/nanomips_translate.c.inc

Likewise.

>     target/mips/tcg/translate.c

Likewise.

>     target/ppc/int_helper.c
>     target/riscv/cpu.c
>     target/riscv/vector_helper.c
>     target/tricore/translate.c
>     tcg/tcg.c

Likewise.

>     tests/qtest/m48t59-test.c
>     tests/qtest/pflash-cfi02-test.c
>     tests/unit/test-throttle.c
>     util/vhost-user-server.c


