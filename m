Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E919959227
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 03:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780846.1190455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sga3p-0006wr-S5; Wed, 21 Aug 2024 01:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780846.1190455; Wed, 21 Aug 2024 01:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sga3p-0006u3-Oj; Wed, 21 Aug 2024 01:22:53 +0000
Received: by outflank-mailman (input) for mailman id 780846;
 Wed, 21 Aug 2024 01:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sga3o-0006tu-Ca
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 01:22:52 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1ad1479-5f5b-11ef-a507-bb4a2ccca743;
 Wed, 21 Aug 2024 03:22:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45C20A40DA8;
 Wed, 21 Aug 2024 01:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC07C4AF0B;
 Wed, 21 Aug 2024 01:22:46 +0000 (UTC)
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
X-Inumbo-ID: e1ad1479-5f5b-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724203368;
	bh=0Gk5CHnQacQO+KVJ/6YNLAT2y0GWbYzGkbsGsuwtBwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZnCv9/lofL/nIBVeOeN6OkGByXDaTPTS6UI5IWNocUQAOhvvALH1EmLsRCBqLLF51
	 UIhS/uvs+Nk0Z2kbI23eTKBM/jiw6Xm+Hg6MdS65Ph07lo3kDOw/yiDb1xkjnWnCc5
	 qhKhfJLpDoL0bzvwRTPmlMMcpHx8PRQFjozki71UIGqoTTV5Q6vsYf/d6GQRmFWV1M
	 yrbKj+vq2m86jWCTbcODfXJjSxEUnIw/f032PA4+iR45AcOjG7lEbOnQtGakQYy7Ye
	 taB/dl8i/ouT6Gfq8aWYwd9nmhO2OfSKqXRMTX3SUaOpTj5HUBb+DFbQYNVJ2VkWth
	 T0WRwpqaNG6Hg==
Date: Tue, 20 Aug 2024 18:22:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 10/12] hw/xen: pvh-common: Add support for creating
 PCIe/GPEX
In-Reply-To: <20240820142949.533381-11-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201822390.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-11-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add support for optionally creating a PCIe/GPEX controller.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-pvh-common.c         | 76 +++++++++++++++++++++++++++++++++
>  include/hw/xen/xen-pvh-common.h | 29 +++++++++++++
>  2 files changed, 105 insertions(+)
> 
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 295f920442..28d7168446 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -122,6 +122,64 @@ static void xen_enable_tpm(XenPVHMachineState *s)
>  }
>  #endif
>  
> +/*
> + * We use the GPEX PCIe controller with its internal INTX PCI interrupt
> + * swizzling. This swizzling is emulated in QEMU and routes all INTX
> + * interrupts from endpoints down to only 4 INTX interrupts.
> + * See include/hw/pci/pci.h : pci_swizzle()
> + */
> +static inline void xenpvh_gpex_init(XenPVHMachineState *s,
> +                                    XenPVHMachineClass *xpc,
> +                                    MemoryRegion *sysmem)
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
> +    memory_region_add_subregion(sysmem, s->cfg.pci_ecam.base, ecam_reg);
> +
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +
> +    if (s->cfg.pci_mmio.size) {
> +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
> +                                 mmio_reg,
> +                                 s->cfg.pci_mmio.base, s->cfg.pci_mmio.size);
> +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio.base,
> +                                    &s->pci.mmio_alias);
> +    }
> +
> +    if (s->cfg.pci_mmio_high.size) {
> +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> +                "pcie-mmio-high",
> +                mmio_reg, s->cfg.pci_mmio_high.base, s->cfg.pci_mmio_high.size);
> +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio_high.base,
> +                &s->pci.mmio_high_alias);
> +    }
> +
> +    /*
> +     * PVH implementations with PCI enabled must provide set_pci_intx_irq()
> +     * and optionally an implementation of set_pci_link_route().
> +     */
> +    assert(xpc->set_pci_intx_irq);
> +
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        qemu_irq irq = qemu_allocate_irq(xpc->set_pci_intx_irq, s, i);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, s->cfg.pci_intx_irq_base + i);
> +        if (xpc->set_pci_link_route) {
> +            xpc->set_pci_link_route(i, s->cfg.pci_intx_irq_base + i);
> +        }
> +    }
> +}
> +
>  static void xen_pvh_init(MachineState *ms)
>  {
>      XenPVHMachineState *s = XEN_PVH_MACHINE(ms);
> @@ -152,6 +210,15 @@ static void xen_pvh_init(MachineState *ms)
>      }
>  #endif
>  
> +    /* Non-zero pci-ecam-size enables PCI.  */
> +    if (s->cfg.pci_ecam.size) {
> +        if (s->cfg.pci_ecam.size != 256 * MiB) {
> +            error_report("pci-ecam-size only supports values 0 or 0x10000000");
> +            exit(EXIT_FAILURE);
> +        }
> +        xenpvh_gpex_init(s, xpc, sysmem);
> +    }
> +
>      /* Call the implementation specific init.  */
>      if (xpc->init) {
>          xpc->init(ms);
> @@ -200,6 +267,9 @@ XEN_PVH_PROP_MEMMAP(ram_high)
>  /* TPM only has a base-addr option.  */
>  XEN_PVH_PROP_MEMMAP_BASE(tpm)
>  XEN_PVH_PROP_MEMMAP(virtio_mmio)
> +XEN_PVH_PROP_MEMMAP(pci_ecam)
> +XEN_PVH_PROP_MEMMAP(pci_mmio)
> +XEN_PVH_PROP_MEMMAP(pci_mmio_high)
>  
>  void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
>  {
> @@ -242,6 +312,12 @@ do {                                                                      \
>          OC_MEMMAP_PROP(oc, "virtio-mmio", virtio_mmio);
>      }
>  
> +    if (xpc->has_pci) {
> +        OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
> +        OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
> +        OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
> +    }
> +
>  #ifdef CONFIG_TPM
>      if (xpc->has_tpm) {
>          object_class_property_add(oc, "tpm-base-addr", "uint64_t",
> diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> index 77fd98b9fe..bc09eea936 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -25,10 +25,29 @@ struct XenPVHMachineClass {
>      /* PVH implementation specific init.  */
>      void (*init)(MachineState *state);
>  
> +    /*
> +     * set_pci_intx_irq - Deliver INTX irqs to the guest.
> +     *
> +     * @opaque: pointer to XenPVHMachineState.
> +     * @irq: IRQ after swizzling, between 0-3.
> +     * @level: IRQ level.
> +     */
> +    void (*set_pci_intx_irq)(void *opaque, int irq, int level);
> +
> +    /*
> +     * set_pci_link_route: - optional implementation call to setup
> +     * routing between INTX IRQ (0 - 3) and GSI's.
> +     *
> +     * @line: line the INTx line (0 => A .. 3 => B)
> +     * @irq: GSI
> +     */
> +    int (*set_pci_link_route)(uint8_t line, uint8_t irq);
> +
>      /*
>       * Each implementation can optionally enable features that it
>       * supports and are known to work.
>       */
> +    bool has_pci;
>      bool has_tpm;
>      bool has_virtio_mmio;
>  };
> @@ -44,6 +63,12 @@ struct XenPVHMachineState {
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
>          MemMapEntry ram_low, ram_high;
>          MemMapEntry tpm;
> @@ -52,6 +77,10 @@ struct XenPVHMachineState {
>          MemMapEntry virtio_mmio;
>          uint32_t virtio_mmio_num;
>          uint32_t virtio_mmio_irq_base;
> +
> +        /* PCI */
> +        MemMapEntry pci_ecam, pci_mmio, pci_mmio_high;
> +        uint32_t pci_intx_irq_base;
>      } cfg;
>  };
>  
> -- 
> 2.43.0
> 

