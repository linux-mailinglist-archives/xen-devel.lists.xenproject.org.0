Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49CC6B95D1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509592.785625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4XG-00083S-Bm; Tue, 14 Mar 2023 13:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509592.785625; Tue, 14 Mar 2023 13:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4XG-00080I-7z; Tue, 14 Mar 2023 13:17:50 +0000
Received: by outflank-mailman (input) for mailman id 509592;
 Tue, 14 Mar 2023 13:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E33=7G=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pc4XE-0007uj-EP
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 13:17:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bc670a8-c26a-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 14:17:46 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-GV9iIB9oOG6AJpdsU-QAPA-1; Tue, 14 Mar 2023 09:17:43 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 es16-20020a056402381000b004fa3e04c882so12885618edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 06:17:43 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 pw13-20020a17090720ad00b008e40853a712sm1141538ejb.97.2023.03.14.06.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:17:40 -0700 (PDT)
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
X-Inumbo-ID: 9bc670a8-c26a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dD/eOO+0pKgceKKM8fKsW/OzC3zlL3h1c8nutUJKDEY=;
	b=hol5zFOO0trKwLApTWBAnQAq0fYeOgQbg/kIPHeAZho9Ce3KoP6PBzxZMlqYXvRzGEpDUN
	XMkHbI9UKnfQMUbIEtVwCa3yfVKQaLSGVRuWJUC2zvhxAJCrXzE3c0BpuhdBIC+qbJ0wH3
	BeVcQOCCGUsGskJsD5WJ489FA/1jQY4=
X-MC-Unique: GV9iIB9oOG6AJpdsU-QAPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD/eOO+0pKgceKKM8fKsW/OzC3zlL3h1c8nutUJKDEY=;
        b=jpVx1P2hTv6Z0CC7pWHwYFn5jmhpSRPmm50Wi7qp1HK7jdfQCwmpDwKjN/tQjUUgjS
         Xjqm8uIKO1hjEGHjKY73PJij2cuCAQkuZ2rKC1C9YiXh5YAqPAa6FVl2ayVCA3bMdRtZ
         2J17BVzZc+/bTTlUn1wR+jbqBqcgZVcGE6iEFe/MouxHzoDWKDQVZrKQOBkNG1Duz51A
         HSW4wPQG2ENhNuV0zL4F1UML0gYjSVDsMZeY2evdw6nlEEuZsQYL1pA3eKjZ+Y9QdiIV
         6CsWWg49IPO7KduJ3LQpOBsnqUJQ/AC9X+vS5dg3DmZsICJyL0jrsa9ZNDGDoahnbNlz
         ykZQ==
X-Gm-Message-State: AO0yUKW26Ef/ojs9ySy8z5iRsFxMavrug+WHzEVdKxNndPv6JuqSXXzj
	Vj1gYzJnzerJIsDF/CkAHUd2b16oYiYvqVokGPIXlJfD5A+6rLnnpAHiNDX3WoOI+ZaRodF2T7f
	kuuID13UC8xm2jYyGLxU8Fcgx4pA=
X-Received: by 2002:a17:907:38b:b0:8af:4dab:cf6c with SMTP id ss11-20020a170907038b00b008af4dabcf6cmr2412330ejb.23.1678799861870;
        Tue, 14 Mar 2023 06:17:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MDTm40yB+Pzm6DCiPh/E20GuTxTMZPad0cHHH7en8k2Mp/TdF69qzViD9IdRrt222xSVGFw==
X-Received: by 2002:a17:907:38b:b0:8af:4dab:cf6c with SMTP id ss11-20020a170907038b00b008af4dabcf6cmr2412304ejb.23.1678799861554;
        Tue, 14 Mar 2023 06:17:41 -0700 (PDT)
Date: Tue, 14 Mar 2023 09:17:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Message-ID: <20230314091653-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
> On 14/03/2023 06:33, Michael S. Tsirkin wrote:
> 
> > On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> > > Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> > > uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> > > xenfv machine when the guest is configured for igd-passthru.
> > > 
> > > A desired extension to that commit is to allow use of the reserved slot
> > > if the administrator manually configures a device to use the reserved
> > > slot. Currently, slot_reserved_mask is enforced unconditionally. With
> > > this patch, the pci bus can be configured so the slot is only reserved
> > > if the pci device to be added to the bus is configured for automatic
> > > slot assignment.
> > > 
> > > To enable the desired behavior of slot_reserved_mask machine, add a
> > > boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> > > add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> > > called to change the default behavior of always enforcing
> > > slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> > > when the pci device being added is configured for automatic slot
> > > assignment.
> > > 
> > > Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> > > creating the pci bus for the pc/i440fx/xenfv machine type to implement
> > > the desired behavior of causing slot_reserved_mask to only apply when
> > > the pci device to be added to a pc/i440fx/xenfv machine is configured
> > > for automatic slot assignment.
> > > 
> > > Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > 
> > I really dislike this.
> > It seems that xen should not have used slot_reserved_mask,
> > and instead needs something new like slot_manual_mask.
> > No?
> 
> My suggestion was to move the validation logic to a separate callback
> function in PCIBus (see
> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
> perhaps I wasn't clear enough in pointing out that I was thinking this could
> *replace* the existing slot_reserved_mask mechanism, rather than providing a
> hook to allow it to be manipulated.
> 
> Here's a very rough patch put together over lunch that attempts this for
> pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
> pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
> implementation, and slot_reserved_mask gets removed completely i.e.:
> 
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index def5000e7b..30b856499a 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
>      return host_bridge->bypass_iommu;
>  }
> 
> +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
> +                                          int devfn)
> +{
> +    /* All slots accessible by default */
> +    return false;
> +}
> +
>  static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>                                         MemoryRegion *address_space_mem,
>                                         MemoryRegion *address_space_io,
> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> DeviceState *parent,
>  {
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
> -    bus->slot_reserved_mask = 0x0;
> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>      return !(bus->devices[devfn]);
>  }
> 
> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> +                                   PCISlotReservationType restype)
> +{
> +    return bus->slot_reserved_fn(restype, devfn);
> +}
> +
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>  {
> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> +    bus->slot_reserved_fn = fn;
>  }
> 
>  /* -1 for devfn means auto assign */
> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>              devfn += PCI_FUNC_MAX) {
>              if (pci_bus_devfn_available(bus, devfn) &&
> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>                  goto found;
>              }
>          }
> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                                         MemoryRegion *address_space_io,
> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> DeviceState *parent,
>  {
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
> -    bus->slot_reserved_mask = 0x0;
> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>      return !(bus->devices[devfn]);
>  }
> 
> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> +                                   PCISlotReservationType restype)
> +{
> +    return bus->slot_reserved_fn(restype, devfn);
> +}
> +
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>  {
> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> +    bus->slot_reserved_fn = fn;
>  }
> 
>  /* -1 for devfn means auto assign */
> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>              devfn += PCI_FUNC_MAX) {
>              if (pci_bus_devfn_available(bus, devfn) &&
> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>                  goto found;
>              }
>          }
> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                     " reserved",
>                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d5a40cd058..8a949f7ae1 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
>   */
>  int pci_bar(PCIDevice *d, int reg);
> 
> +typedef enum PCISlotReservationType {
> +    PCI_SLOT_RESERVATION_AUTO,
> +    PCI_SLOT_RESERVATION_MANUAL
> +} PCISlotReservationType;
> +
> +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
>  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> 
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
> +
>  #define TYPE_PCI_BUS "PCI"
>  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 5653175957..d68ea1418d 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -36,7 +36,7 @@ struct PCIBus {
>      PCIIOMMUFunc iommu_fn;
>      void *iommu_opaque;
>      uint8_t devfn_min;
> -    uint32_t slot_reserved_mask;
> +    pci_slot_reserved_fn slot_reserved_fn;
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> 
> 
> If this approach seems reasonable, I'm happy for someone else to take this
> over and turn it into a proper series.
> 
> 
> ATB,
> 
> Mark.

It's ok too though I think I like chuck's proposal better:
less callbacks to chase.

-- 
MST


