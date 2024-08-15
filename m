Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DD9526E5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 02:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777764.1187841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seOMf-00025z-IA; Thu, 15 Aug 2024 00:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777764.1187841; Thu, 15 Aug 2024 00:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seOMf-00024V-FU; Thu, 15 Aug 2024 00:29:17 +0000
Received: by outflank-mailman (input) for mailman id 777764;
 Thu, 15 Aug 2024 00:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1seOMe-00024P-UQ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 00:29:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65a082fe-5a9d-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 02:29:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEDD261291;
 Thu, 15 Aug 2024 00:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AB3C116B1;
 Thu, 15 Aug 2024 00:29:10 +0000 (UTC)
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
X-Inumbo-ID: 65a082fe-5a9d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723681752;
	bh=h9FXGgG9EJcZD/S0va3nNedGjOMTJFMu5BAD+EEQ1jI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EIdtPxXvMVu3OPwhWOlXrPnJP6qsS7qYf/M87i08dFyo4izAf8uiLShZsoL/oXLpw
	 Es0Z9SSdXpC0/X6q3kx92tdl+ZkZguEcGZlE/UYmjwKuw16EzRWsdIj1KaXfwSFsFK
	 al9+lzRx8dgRhlQONee93rsV7uQeC6Z6YToQL4CnLK6RujgjzEBk7XnV/H7Dc9xK34
	 X9LEgvLDtYKP1fhJ3+14jl1HNDWCWS4VO8ZJv/c9kCUsqKfolzpOhEzO4gAuf8MosJ
	 /R9/YKfnfyC5u7mFEOfF1OpkGFrFdMu4YQ/dFsGW3tI5NpS0HJT2f2QKbl4QLus+8E
	 puiEK8DgFs4Xw==
Date: Wed, 14 Aug 2024 17:29:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org, 
    alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/10] hw/xen: pvh-common: Add support for creating
 PCIe/GPEX
In-Reply-To: <ZrzMkI5jGUtXU2qA@zapote>
Message-ID: <alpine.DEB.2.22.394.2408141717300.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-9-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121822370.298534@ubuntu-linux-20-04-desktop> <ZrzMkI5jGUtXU2qA@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Aug 2024, Edgar E. Iglesias wrote:
> On Mon, Aug 12, 2024 at 06:48:37PM -0700, Stefano Stabellini wrote:
> > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > Add support for optionally creating a PCIe/GPEX controller.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > ---
> > >  hw/xen/xen-pvh-common.c         | 66 +++++++++++++++++++++++++++++++++
> > >  include/hw/xen/xen-pvh-common.h | 10 ++++-
> > >  2 files changed, 75 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > > index 69a2dbdb6d..b1432e4bd9 100644
> > > --- a/hw/xen/xen-pvh-common.c
> > > +++ b/hw/xen/xen-pvh-common.c
> > > @@ -120,6 +120,59 @@ static void xen_enable_tpm(XenPVHCommonState *s)
> > >  }
> > >  #endif
> > >  
> > > +static void xen_set_pci_intx_irq(void *opaque, int irq, int level)
> > > +{
> > > +    if (xen_set_pci_intx_level(xen_domid, 0, 0, 0, irq, level)) {
> > 
> > Looking at the implementation of XEN_DMOP_set_pci_intx_level in
> > xen/arch/x86/hvm/dm.c, it looks like the device parameter of
> > xen_set_pci_intx_level is required?
> 
> Yes, by setting device = 0, we're bypassing the irq swizzling in Xen.
> I'll try to clarify below.
> 
> 
> > 
> > 
> > > +        error_report("xendevicemodel_set_pci_intx_level failed");
> > > +    }
> > > +}
> > > +
> > > +static inline void xenpvh_gpex_init(XenPVHCommonState *s,
> > > +                                    MemoryRegion *sysmem,
> > > +                                    hwaddr ecam_base, hwaddr ecam_size,
> > > +                                    hwaddr mmio_base, hwaddr mmio_size,
> > > +                                    hwaddr mmio_high_base,
> > > +                                    hwaddr mmio_high_size,
> > > +                                    int intx_irq_base)
> > > +{
> > > +    MemoryRegion *ecam_reg;
> > > +    MemoryRegion *mmio_reg;
> > > +    DeviceState *dev;
> > > +    int i;
> > > +
> > > +    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
> > > +                            TYPE_GPEX_HOST);
> > > +    dev = DEVICE(&s->pci.gpex);
> > > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > +
> > > +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > > +    memory_region_add_subregion(sysmem, ecam_base, ecam_reg);
> > 
> > I notice we don't use ecam_size anywhere? Is that because the size is
> > standard?
> 
> Yes. we could remove the size property, having it slightly simplifies the
> prop setting code (keeping these memmap prop-pairs alike) but it's not a big deal.

Not a big deal either way, up to you


> > > +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > > +
> > > +    if (mmio_size) {
> > > +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
> > > +                                 mmio_reg, mmio_base, mmio_size);
> > > +        memory_region_add_subregion(sysmem, mmio_base, &s->pci.mmio_alias);
> > > +    }
> > > +
> > > +    if (mmio_high_size) {
> > > +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> > > +                "pcie-mmio-high",
> > > +                mmio_reg, mmio_high_base, mmio_high_size);
> > > +        memory_region_add_subregion(sysmem, mmio_high_base,
> > > +                &s->pci.mmio_high_alias);
> > > +    }
> > > +
> > > +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> > > +        qemu_irq irq = qemu_allocate_irq(xen_set_pci_intx_irq, s, i);
> > > +
> > > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> > > +        gpex_set_irq_num(GPEX_HOST(dev), i, intx_irq_base + i);
> > > +        xen_set_pci_link_route(i, intx_irq_base + i);
> > 
> > xen_set_pci_link_route is not currently implemented on ARM?
> > 
> > Looking at hw/i386/pc_piix.c:piix_intx_routing_notifier_xen it seems
> > that the routing is much more complex over there. But looking at other
> > machines that use GPEX such as hw/arm/virt.c it looks like the routing
> > is straightforward the same way as in this patch.
> > 
> > I thought that PCI interrupt pin swizzling was required, but maybe not ?
> > 
> > It is totally fine if we do something different, simpler, than
> > hw/i386/pc_piix.c:piix_intx_routing_notifier_xen. I just want to make
> > sure that things remain consistent between ARM and x86, and also between
> > Xen and QEMU view of virtual PCI interrupt routing.
> >
> 
> Good questions. The following is the way I understand things but I may
> ofcourse be wrong.
> 
> Yes, we're doing things differently than hw/i386/pc_piix.c mainly
> because we're using the GPEX PCIe host bridge with it's internal
> standard swizzling down to 4 INTX interrupts. Similar to microvm and
> the ARM virt machine.
> 
> The swizzling for the GPEX is done inside the GPEX model and it's
> described by xl in the ACPI tables for PVH guests. We don't want
> Xen to do any additional swizzling in xen_set_pci_intx_level(), hence
> device=0.

OK


> I haven't plumbed the GPEX connectinos for ARM yet but I think we could
> simply call xendevicemodel_set_irq_level() and not use the pci_intx
> calls that aren't implement (we wouldn't need them).
> 
> For x86/pvh, I wonder if we should be using xen_set_pci_intx_level() /
> xen_set_pci_link_route() or some other API? since we're basically
> bypassing things?
> In one of the first implementations we used set_isa_irq_level() but
> that call only reaches into irqs < 16 so it messed things up.
> 
> Does any one have any better ideas or suggestions?

I think QEMU is free to call or not call any API at setup time. Given
that the PVH interrupt controller is emulated by Xen, the important
thing is that when QEMU raises an interrupt or an MSI with
xen_set_isa_irq_level, xen_inject_msi and xen_set_pci_intx_level, Xen
injects it into the guest as expected and the guest receives it
appropriately.

To oversimplify things, I was worried that QEMU tries to inject INTA but
the guest receives INTD instead. Or QEMU tries to raise a level
interrupt and Xen injects an edge interrupt instead.

Also I think we should try to do things the same way between the PVH
machine on ARM and X86. But we can (should?) do things differently from
hw/i386/pc_piix.c.

