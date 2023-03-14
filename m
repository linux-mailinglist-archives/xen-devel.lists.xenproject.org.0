Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC76B8B43
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 07:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509463.785250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyEW-0005sx-8x; Tue, 14 Mar 2023 06:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509463.785250; Tue, 14 Mar 2023 06:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyEW-0005pZ-5i; Tue, 14 Mar 2023 06:34:04 +0000
Received: by outflank-mailman (input) for mailman id 509463;
 Tue, 14 Mar 2023 06:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E33=7G=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pbyEU-0005pR-8A
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 06:34:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325332e9-c232-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 07:33:57 +0100 (CET)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-dDXdu4lbPceft1xCnVkoVQ-1; Tue, 14 Mar 2023 02:33:56 -0400
Received: by mail-ed1-f70.google.com with SMTP id
 i42-20020a0564020f2a00b004fd23c238beso4374977eda.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 23:33:56 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5085cb000000b004bd6e3ed196sm493314edh.86.2023.03.13.23.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 23:33:52 -0700 (PDT)
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
X-Inumbo-ID: 325332e9-c232-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678775637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lq5fRA91Dz76/36Mqq+Q+0pTC3rTPwX5ANXm7UXICR0=;
	b=YD7Ar1myrXHxLoXx4d7noLJaeIK5aloO8HXJDdvNd4NgPa2zmzwfO3c41+abGrAOfQUC9B
	F3oi9HbyQAhvjEoFTbR0no+rETgIiIcQLZWr+ym9v7mSNADxw4+MXcmwLI3gJ8Oq9QmU7B
	ChXEyD08X6CbuB14KJuIoHBKtPWG96I=
X-MC-Unique: dDXdu4lbPceft1xCnVkoVQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678775633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq5fRA91Dz76/36Mqq+Q+0pTC3rTPwX5ANXm7UXICR0=;
        b=J3aN0U6xPA+d9/sfw8ot/tpKs7lL2aetTj0gBS69hAfGkvOXkUolBQtryZyWMNqdr4
         41w1E1SWXDRksNQ94MHrBHDwzBfg/KfViap2Hd+nPS4vw3k252HUujXwPivShCh9tR5m
         iv+j9PfiT+jjc5wVxHaXxDYdXWgR4qifgOZu2VFea+BouKPp7peWHDfQBra7CjfGNgk4
         ACcNtwkoZmW8tc6KltxprIPAhOnWAa0R2abYgpoio2jSGsbvB/1FXxlzN72KjzVg4AH1
         wZsxW7nBPIaMbYsrYfVRFf9m2KWrtS94mPVLRymR37yNYMRCgzkWFDZe1vHQFESsUWdW
         Gt7Q==
X-Gm-Message-State: AO0yUKVmJL78yZYazEAeREFu/72NwrCbo1GItJjv+1uokBZZHhJ8U9uh
	4aKSpiYC7SZ+tiHddRmxUlKntp6js/GlX7TnLAyX1YT3iagaXjvEbXvo24JbfimomYFf69OO1R6
	w4icB53x8IX6ewKtqCb2SLabBlak=
X-Received: by 2002:a50:ee18:0:b0:4a0:e31a:434 with SMTP id g24-20020a50ee18000000b004a0e31a0434mr34907214eds.27.1678775633577;
        Mon, 13 Mar 2023 23:33:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set8XZbrP0FadH8QOrNJ6E83pKOAATpnvma8FvoixrV7d5/Ux9eSRJV3bFA7NXa+cZhau384i3g==
X-Received: by 2002:a50:ee18:0:b0:4a0:e31a:434 with SMTP id g24-20020a50ee18000000b004a0e31a0434mr34907202eds.27.1678775633291;
        Mon, 13 Mar 2023 23:33:53 -0700 (PDT)
Date: Tue, 14 Mar 2023 02:33:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Message-ID: <20230314023148-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
MIME-Version: 1.0
In-Reply-To: <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> xenfv machine when the guest is configured for igd-passthru.
> 
> A desired extension to that commit is to allow use of the reserved slot
> if the administrator manually configures a device to use the reserved
> slot. Currently, slot_reserved_mask is enforced unconditionally. With
> this patch, the pci bus can be configured so the slot is only reserved
> if the pci device to be added to the bus is configured for automatic
> slot assignment.
> 
> To enable the desired behavior of slot_reserved_mask machine, add a
> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> called to change the default behavior of always enforcing
> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> when the pci device being added is configured for automatic slot
> assignment.
> 
> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> creating the pci bus for the pc/i440fx/xenfv machine type to implement
> the desired behavior of causing slot_reserved_mask to only apply when
> the pci device to be added to a pc/i440fx/xenfv machine is configured
> for automatic slot assignment.
> 
> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

I really dislike this. 
It seems that xen should not have used slot_reserved_mask,
and instead needs something new like slot_manual_mask.
No?

> ---
> Changelog
> 
> v2: Change Subject of patch from
>     "pci: add enforce_slot_reserved_mask_manual property" To
>     "pci: allow slot_reserved_mask to be ignored with manual slot assignment"
> 
>     Add pci_bus_ignore_slot_reserved_mask_manual function
> 
>     Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
>     in hw/pci-host/i440fx.c
> 
>  hw/pci-host/i440fx.c     |  1 +
>  hw/pci/pci.c             | 14 +++++++++++++-
>  include/hw/pci/pci.h     |  1 +
>  include/hw/pci/pci_bus.h |  1 +
>  4 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 262f82c303..8e00b88926 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
>      s = PCI_HOST_BRIDGE(dev);
>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>                           address_space_io, 0, TYPE_PCI_BUS);
> +    pci_bus_ignore_slot_reserved_mask_manual(b);
>      s->bus = b;
>      object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 8a87ccc8b0..670ecc6986 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
>      bus->slot_reserved_mask = 0x0;
> +    bus->enforce_slot_reserved_mask_manual = true;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
>      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
>  }
>  
> +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> +{
> +    return bus->enforce_slot_reserved_mask_manual &&
> +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> +}
> +
> +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
> +{
> +    bus->enforce_slot_reserved_mask_manual = false;
> +}
> +
>  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
>  {
>      return bus->slot_reserved_mask;
> @@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                     " reserved",
>                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 935b4b91b4..48d29ec234 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>  void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
>  void pci_bus_irqs_cleanup(PCIBus *bus);
>  int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
> +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
>  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
>  void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
>  void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 5653175957..e0f15ee9be 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -37,6 +37,7 @@ struct PCIBus {
>      void *iommu_opaque;
>      uint8_t devfn_min;
>      uint32_t slot_reserved_mask;
> +    bool enforce_slot_reserved_mask_manual;
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> -- 
> 2.39.2


