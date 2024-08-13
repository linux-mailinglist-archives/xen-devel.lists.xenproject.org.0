Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0694FB57
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775851.1186055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgeT-0006C9-MT; Tue, 13 Aug 2024 01:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775851.1186055; Tue, 13 Aug 2024 01:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgeT-0006AR-JD; Tue, 13 Aug 2024 01:48:45 +0000
Received: by outflank-mailman (input) for mailman id 775851;
 Tue, 13 Aug 2024 01:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgeR-0004dr-CZ
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:48:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a5aa4f3-5916-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 03:48:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5DB7561524;
 Tue, 13 Aug 2024 01:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C015EC4AF0E;
 Tue, 13 Aug 2024 01:48:38 +0000 (UTC)
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
X-Inumbo-ID: 2a5aa4f3-5916-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513720;
	bh=G6inMSvY1KniC+SCcLnpUK0HXdFGeYhyTMLJYR3qE7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VjyXlIeV4kQ2WzOXxbxlCYIi6UptcMnZdLkoF3e8r9kG9Ydz9kfLxBg0T+sUZjXsp
	 +gFY6p8zEleJAxF4daY4Thi9wrUbvtKoB1i4cpy+yGyGtS71GK2Xc4v5UjlWfAhdbe
	 IZgsZHbTVJbIwe4ZLarKn+gz6MXKmItENYqdNHeaCNcx/0Bu2JGQY3izVXAsQ0mxde
	 UiChJOKpQ3J5uoYOTID4Co8tygjuhxjYGEyHodpHPFPEEKFqnJaOgVJTBiMLZoMr5T
	 YyFvzWDroSIVEPuoaR/TQrTorGLZK6chHtgsHS119qk8DXjgGyMYzWNX7UAsBCG0j+
	 iqM1M7sYw+VkQ==
Date: Mon, 12 Aug 2024 18:48:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/10] hw/xen: pvh-common: Add support for creating
 PCIe/GPEX
In-Reply-To: <20240812130606.90410-9-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121822370.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-9-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add support for optionally creating a PCIe/GPEX controller.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/xen/xen-pvh-common.c         | 66 +++++++++++++++++++++++++++++++++
>  include/hw/xen/xen-pvh-common.h | 10 ++++-
>  2 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 69a2dbdb6d..b1432e4bd9 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -120,6 +120,59 @@ static void xen_enable_tpm(XenPVHCommonState *s)
>  }
>  #endif
>  
> +static void xen_set_pci_intx_irq(void *opaque, int irq, int level)
> +{
> +    if (xen_set_pci_intx_level(xen_domid, 0, 0, 0, irq, level)) {

Looking at the implementation of XEN_DMOP_set_pci_intx_level in
xen/arch/x86/hvm/dm.c, it looks like the device parameter of
xen_set_pci_intx_level is required?


> +        error_report("xendevicemodel_set_pci_intx_level failed");
> +    }
> +}
> +
> +static inline void xenpvh_gpex_init(XenPVHCommonState *s,
> +                                    MemoryRegion *sysmem,
> +                                    hwaddr ecam_base, hwaddr ecam_size,
> +                                    hwaddr mmio_base, hwaddr mmio_size,
> +                                    hwaddr mmio_high_base,
> +                                    hwaddr mmio_high_size,
> +                                    int intx_irq_base)
> +{
> +    MemoryRegion *ecam_reg;
> +    MemoryRegion *mmio_reg;
> +    DeviceState *dev;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
> +                            TYPE_GPEX_HOST);
> +    dev = DEVICE(&s->pci.gpex);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_add_subregion(sysmem, ecam_base, ecam_reg);

I notice we don't use ecam_size anywhere? Is that because the size is
standard?


> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +
> +    if (mmio_size) {
> +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
> +                                 mmio_reg, mmio_base, mmio_size);
> +        memory_region_add_subregion(sysmem, mmio_base, &s->pci.mmio_alias);
> +    }
> +
> +    if (mmio_high_size) {
> +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> +                "pcie-mmio-high",
> +                mmio_reg, mmio_high_base, mmio_high_size);
> +        memory_region_add_subregion(sysmem, mmio_high_base,
> +                &s->pci.mmio_high_alias);
> +    }
> +
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        qemu_irq irq = qemu_allocate_irq(xen_set_pci_intx_irq, s, i);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, intx_irq_base + i);
> +        xen_set_pci_link_route(i, intx_irq_base + i);

xen_set_pci_link_route is not currently implemented on ARM?

Looking at hw/i386/pc_piix.c:piix_intx_routing_notifier_xen it seems
that the routing is much more complex over there. But looking at other
machines that use GPEX such as hw/arm/virt.c it looks like the routing
is straightforward the same way as in this patch.

I thought that PCI interrupt pin swizzling was required, but maybe not ?

It is totally fine if we do something different, simpler, than
hw/i386/pc_piix.c:piix_intx_routing_notifier_xen. I just want to make
sure that things remain consistent between ARM and x86, and also between
Xen and QEMU view of virtual PCI interrupt routing.



> +    }
> +}
> +
>  static void xen_pvh_realize(DeviceState *dev, Error **errp)
>  {
>      XenPVHCommonState *s = XEN_PVH_COMMON(dev);
> @@ -152,6 +205,14 @@ static void xen_pvh_realize(DeviceState *dev, Error **errp)
>          warn_report("tpm-base-addr is not provided. TPM will not be enabled");
>      }
>  #endif
> +
> +    if (s->cfg.ecam.size) {
> +        xenpvh_gpex_init(s, sysmem,
> +                         s->cfg.ecam.base, s->cfg.ecam.size,
> +                         s->cfg.mmio.base, s->cfg.mmio.size,
> +                         s->cfg.mmio_high.base, s->cfg.mmio_high.size,
> +                         s->cfg.pci_intx_irq_base);
> +    }
>  }
>  
>  #define DEFINE_PROP_MEMMAP(n, f) \
> @@ -165,10 +226,15 @@ static Property xen_pvh_properties[] = {
>      DEFINE_PROP_MEMMAP("ram-high", ram_high),
>      DEFINE_PROP_MEMMAP("virtio-mmio", virtio_mmio),
>      DEFINE_PROP_MEMMAP("tpm", tpm),
> +    DEFINE_PROP_MEMMAP("pci-ecam", ecam),
> +    DEFINE_PROP_MEMMAP("pci-mmio", mmio),
> +    DEFINE_PROP_MEMMAP("pci-mmio-high", mmio_high),
>      DEFINE_PROP_UINT32("virtio-mmio-num", XenPVHCommonState,
>                         cfg.virtio_mmio_num, 0),
>      DEFINE_PROP_UINT32("virtio-mmio-irq-base", XenPVHCommonState,
>                         cfg.virtio_mmio_irq_base, 0),
> +    DEFINE_PROP_UINT32("pci-intx-irq-base", XenPVHCommonState,
> +                       cfg.pci_intx_irq_base, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> index e958b441fd..faacfca70e 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -29,17 +29,25 @@ typedef struct XenPVHCommonState {
>          MemoryRegion high;
>      } ram;
>  
> +    struct {
> +        GPEXHost gpex;
> +        MemoryRegion mmio_alias;
> +        MemoryRegion mmio_high_alias;
> +    } pci;
> +
>      struct {
>          uint64_t ram_size;
>          uint32_t max_cpus;
>          uint32_t virtio_mmio_num;
>          uint32_t virtio_mmio_irq_base;
> +        uint32_t pci_intx_irq_base;
>          struct {
>              uint64_t base;
>              uint64_t size;
>          } ram_low, ram_high,
>            virtio_mmio,
> -          tpm;
> +          tpm,
> +          ecam, mmio, mmio_high;
>      } cfg;
>  } XenPVHCommonState;
>  #endif
> -- 
> 2.43.0
> 

