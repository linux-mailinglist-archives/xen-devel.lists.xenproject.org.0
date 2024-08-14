Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91201951E80
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777445.1187593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFt7-00018Q-5y; Wed, 14 Aug 2024 15:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777445.1187593; Wed, 14 Aug 2024 15:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFt7-00015U-2J; Wed, 14 Aug 2024 15:26:13 +0000
Received: by outflank-mailman (input) for mailman id 777445;
 Wed, 14 Aug 2024 15:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lR0F=PN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1seFt6-00015O-9m
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:26:12 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 893fb369-5a51-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 17:26:11 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso9049762e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:26:11 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f42734sm1303062e87.290.2024.08.14.08.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 08:26:09 -0700 (PDT)
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
X-Inumbo-ID: 893fb369-5a51-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723649171; x=1724253971; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYmZmpJgLLQrHUQazIqEoQJSKSP9xtHfcufNHThOFxA=;
        b=Xd1/qYc77Z/SPZfvm2foeM6XhNai7qGCxki7jw+KZnVZQh0TB+BRj4vX8uZQHsVIqf
         DrtFsrxw9Qljg24f3vjuR6R6vIuGd62zMJAYKsm5PFDnPjI23Oa6V5/KQs+L/LbwYqzD
         W1Gei6L72VV3WIv2nzZsEpzEhJXRx2R1CY7N1YO7A9CxSKqmXotUb40O8lSyMtECClfi
         Yzsb8TsHf7UmARu9sf41lf34iLDVJXNZe/0K5tQuXR5EucFlHAhyJFDlhWEnBvKwrrrC
         zB/O79csU/Vt9TgF4kIwe36no3Gq4m9rHLTozZlAEbFDT6v5ppWuSilUOJ7tAcD+9tB4
         tTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723649171; x=1724253971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmZmpJgLLQrHUQazIqEoQJSKSP9xtHfcufNHThOFxA=;
        b=sMOL3f5eEzBKlnPcvIXF0Ql2goc/jwLu/+NBaP+yBfqsF7l4WYQNHSWTlYURSqeZmI
         eykCSggcXwyuMi6P0/rb2kJFag+NWTwmcLFIKM3q4eQLIpiJkGMuOuH/hf7I8f2wId5I
         zGqPxVfy/zYc+Ol8ViOSKYMhlAxdKKf8c/l3f51PgOYveu0x3YoWBggVRxLN1TjVB14p
         RvrPYIkAx0HvYENzFoAQnsPpvaD3jr/ZlrQ71D26N0Q9GjFutI1FB/FfmBDyXLM4iqSy
         EF4IM+H64gFG9VaE2MH3wkBY66MTQKYkhvL0v/59GjTc3bmlIayqVdg9XOf24m2k5XQ/
         M4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjVqfEdPTvPRNZGawh8sn+RkRSCjeYkDt8Yn9o2EpoeF+kMoro9ahjOY8p+k+hpOlY6uqVWMchOzJSEJQnuKdd5tyvtoow9pA8zYsETKw=
X-Gm-Message-State: AOJu0YwvwzF4z5MhFB01aSW4MNvIwjGzsAlt+04y5T11Dth5QTYojhZx
	2huZ9FVHla16fLHGpFHEJnSm9Xu2peziqy/GXiqRspVHOZ6IA61p
X-Google-Smtp-Source: AGHT+IG1Tnr3tLyBrgc/O5GzweCTeGDL9nfPEC8VxaJ8ErG8oekcC7nHueShqJcul+pp0L8HwsIUhw==
X-Received: by 2002:a05:6512:33cf:b0:52e:9619:e26a with SMTP id 2adb3069b0e04-532eda81a21mr2049698e87.26.1723649169776;
        Wed, 14 Aug 2024 08:26:09 -0700 (PDT)
Date: Wed, 14 Aug 2024 17:26:08 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/10] hw/xen: pvh-common: Add support for creating
 PCIe/GPEX
Message-ID: <ZrzMkI5jGUtXU2qA@zapote>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-9-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121822370.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2408121822370.298534@ubuntu-linux-20-04-desktop>

On Mon, Aug 12, 2024 at 06:48:37PM -0700, Stefano Stabellini wrote:
> On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add support for optionally creating a PCIe/GPEX controller.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/xen/xen-pvh-common.c         | 66 +++++++++++++++++++++++++++++++++
> >  include/hw/xen/xen-pvh-common.h | 10 ++++-
> >  2 files changed, 75 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index 69a2dbdb6d..b1432e4bd9 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -120,6 +120,59 @@ static void xen_enable_tpm(XenPVHCommonState *s)
> >  }
> >  #endif
> >  
> > +static void xen_set_pci_intx_irq(void *opaque, int irq, int level)
> > +{
> > +    if (xen_set_pci_intx_level(xen_domid, 0, 0, 0, irq, level)) {
> 
> Looking at the implementation of XEN_DMOP_set_pci_intx_level in
> xen/arch/x86/hvm/dm.c, it looks like the device parameter of
> xen_set_pci_intx_level is required?

Yes, by setting device = 0, we're bypassing the irq swizzling in Xen.
I'll try to clarify below.


> 
> 
> > +        error_report("xendevicemodel_set_pci_intx_level failed");
> > +    }
> > +}
> > +
> > +static inline void xenpvh_gpex_init(XenPVHCommonState *s,
> > +                                    MemoryRegion *sysmem,
> > +                                    hwaddr ecam_base, hwaddr ecam_size,
> > +                                    hwaddr mmio_base, hwaddr mmio_size,
> > +                                    hwaddr mmio_high_base,
> > +                                    hwaddr mmio_high_size,
> > +                                    int intx_irq_base)
> > +{
> > +    MemoryRegion *ecam_reg;
> > +    MemoryRegion *mmio_reg;
> > +    DeviceState *dev;
> > +    int i;
> > +
> > +    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
> > +                            TYPE_GPEX_HOST);
> > +    dev = DEVICE(&s->pci.gpex);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +
> > +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > +    memory_region_add_subregion(sysmem, ecam_base, ecam_reg);
> 
> I notice we don't use ecam_size anywhere? Is that because the size is
> standard?

Yes. we could remove the size property, having it slightly simplifies the
prop setting code (keeping these memmap prop-pairs alike) but it's not a big deal.

> 
> 
> > +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > +
> > +    if (mmio_size) {
> > +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
> > +                                 mmio_reg, mmio_base, mmio_size);
> > +        memory_region_add_subregion(sysmem, mmio_base, &s->pci.mmio_alias);
> > +    }
> > +
> > +    if (mmio_high_size) {
> > +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> > +                "pcie-mmio-high",
> > +                mmio_reg, mmio_high_base, mmio_high_size);
> > +        memory_region_add_subregion(sysmem, mmio_high_base,
> > +                &s->pci.mmio_high_alias);
> > +    }
> > +
> > +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> > +        qemu_irq irq = qemu_allocate_irq(xen_set_pci_intx_irq, s, i);
> > +
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> > +        gpex_set_irq_num(GPEX_HOST(dev), i, intx_irq_base + i);
> > +        xen_set_pci_link_route(i, intx_irq_base + i);
> 
> xen_set_pci_link_route is not currently implemented on ARM?
> 
> Looking at hw/i386/pc_piix.c:piix_intx_routing_notifier_xen it seems
> that the routing is much more complex over there. But looking at other
> machines that use GPEX such as hw/arm/virt.c it looks like the routing
> is straightforward the same way as in this patch.
> 
> I thought that PCI interrupt pin swizzling was required, but maybe not ?
> 
> It is totally fine if we do something different, simpler, than
> hw/i386/pc_piix.c:piix_intx_routing_notifier_xen. I just want to make
> sure that things remain consistent between ARM and x86, and also between
> Xen and QEMU view of virtual PCI interrupt routing.
>

Good questions. The following is the way I understand things but I may
ofcourse be wrong.

Yes, we're doing things differently than hw/i386/pc_piix.c mainly
because we're using the GPEX PCIe host bridge with it's internal
standard swizzling down to 4 INTX interrupts. Similar to microvm and
the ARM virt machine.

The swizzling for the GPEX is done inside the GPEX model and it's
described by xl in the ACPI tables for PVH guests. We don't want
Xen to do any additional swizzling in xen_set_pci_intx_level(), hence
device=0.

I haven't plumbed the GPEX connectinos for ARM yet but I think we could
simply call xendevicemodel_set_irq_level() and not use the pci_intx
calls that aren't implement (we wouldn't need them).

For x86/pvh, I wonder if we should be using xen_set_pci_intx_level() /
xen_set_pci_link_route() or some other API? since we're basically
bypassing things?
In one of the first implementations we used set_isa_irq_level() but
that call only reaches into irqs < 16 so it messed things up.

Does any one have any better ideas or suggestions?

Cheers,
Edgar

