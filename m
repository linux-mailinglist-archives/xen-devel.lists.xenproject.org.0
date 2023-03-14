Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2EA6B95CD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 14:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509590.785615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4WL-0007ZG-0c; Tue, 14 Mar 2023 13:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509590.785615; Tue, 14 Mar 2023 13:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4WK-0007WC-Tu; Tue, 14 Mar 2023 13:16:52 +0000
Received: by outflank-mailman (input) for mailman id 509590;
 Tue, 14 Mar 2023 13:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E33=7G=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pc4WJ-0007W4-IK
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 13:16:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 793455f9-c26a-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 14:16:49 +0100 (CET)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-mcfBmHJ9PrOvMrkb81M5ng-1; Tue, 14 Mar 2023 09:16:46 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso21742557edd.8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 06:16:45 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170906c28800b00928e0ea53e5sm1138289ejz.84.2023.03.14.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:16:42 -0700 (PDT)
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
X-Inumbo-ID: 793455f9-c26a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIAXseRKi4A6hgBwN93vaPfaXQdoWyfyU0Q1ZAsvdyE=;
	b=GV9b9xfCzHHlET54GemQxQj8R2yuonHA2HWNEgw5ZFKUjW8WYqOeX0Tixsb5tvRZViKnn6
	sCHFJ0SFUYRusjrfrN+FllXywReG7v+M/7tAOPIcqy1br6GiWD+4w+AsYcIhOzVSbC4EJq
	6dVPoxO6rTS+7r0VrWqcVD7RqwNc3kw=
X-MC-Unique: mcfBmHJ9PrOvMrkb81M5ng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIAXseRKi4A6hgBwN93vaPfaXQdoWyfyU0Q1ZAsvdyE=;
        b=1alC9XDPQb1w1S7zsJLC/vae/GY0dWm5iVS/GN2W03tiLWOvD1f4VIe4rhlajWM9hN
         r05LZL1zTLkusrrqo6Xm8apy6NoDGXly7tBH2El1ywOsihu5GlPpWbq0dH++RmiLc+9i
         f5NXZsm4FozSxfmSVdHqvP2fdyeKkeeHeXV4WhNroqFRxAP6NRzok1+Vr4ZSwh5/Y4rU
         Oz/55wUWZWBSmkJxv+2GsmfMYXnVoIMVpmM8RaUprT27fiVl5u3EXsoqMh4bN31SBtar
         JtGNo9X6DAO3D4v2lNQrHrbmT+wn1rSpOL0+ZitpaUMr7ScPPxhehhJtJapeftVVQFT9
         undg==
X-Gm-Message-State: AO0yUKW2bzkNEtOVtjpn/L87ooZwvUVXWcwOmlZ8RcmUkXcZXI7RlI7m
	oB60ik8C5UwU1eG4sLuN4n2esKZvlYHZ1ARRJ9hKKi9lthNXQvmXi9UVgM5K9fe6lylAEc78udI
	/OlBhH+l/N5rlpXO55Cg6WeYO4Hc=
X-Received: by 2002:a17:907:d13:b0:8f4:809e:faee with SMTP id gn19-20020a1709070d1300b008f4809efaeemr2766641ejc.19.1678799803059;
        Tue, 14 Mar 2023 06:16:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bTtWokPnmCG+Y9HcT9FaE2j2zBWfT9dGSuyKJ37cXmbtLNdihy9mpTH9ckpsrrBBKuM8Gcw==
X-Received: by 2002:a17:907:d13:b0:8f4:809e:faee with SMTP id gn19-20020a1709070d1300b008f4809efaeemr2766612ejc.19.1678799802743;
        Tue, 14 Mar 2023 06:16:42 -0700 (PDT)
Date: Tue, 14 Mar 2023 09:16:36 -0400
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
Message-ID: <20230314091342-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <ad2741b3-1f5f-8704-d51b-426d3d496811@aol.com>
MIME-Version: 1.0
In-Reply-To: <ad2741b3-1f5f-8704-d51b-426d3d496811@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 14, 2023 at 08:33:02AM -0400, Chuck Zmudzinski wrote:
> On 3/14/2023 2:33 AM, Michael S. Tsirkin wrote:
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
> Actually, xen would use something like slot_auto_mask, and
> sun4u would use both slot_auto_mask and slot_manual_mask.
> 
> Is it just that this patch touches hw/pci-host/i440fx.c that you
> don't like or is it that you don't like adding slot_reserved_mask_manual
> and pci_bus_ignore_slot_reserved_mask_manual, or is it both
> that you don't like?

I don't like the enforce_slot_reserved_mask_manual flag -
I prefer straight forward logic with no branches in
the common code.

> If it's the former that you don't like, the call to
> pci_bus_ignore_slot_reserved_mask_manual can be moved to
> xen_igd_reserve_slot in hw/xen/xen_pt.c and this would
> avoid touching hw/pci-host/i440fx.c.
> 
> If it's the latter that you don't like, both slot_reserved_mask_manual
> and pci_bus_ignore_slot_reserved_mask_manual can be removed
> and this can be implemented with two independent slot masks:
> 
> rename slot_reserved_mask as slot_auto_mask - used by both xen and sun4u
> slot_manual_mask - new mask, used only by sun4u.

Sounds good to me, except let's add "reserved" in here.
slot_reserved_mask_auto, slot_reserved_mask_manual ?

> We would also need to have two sets of accessor functions in this case, one
> set to access slot_auto_mask, and the other to access slot_manual_mask.
> Since the sun4u machine does not need to either get the value of
> slot_manual_mask or clear the slot_manual_mask, slot_manual_mask
> would only need to have one accessor function to set the value of the
> mask. slot_auto_mask would have all three accessor functions that xen
> needs to use.
> 
> Would that be OK?


Sounds good to me.

> >
> > > ---
> > > Changelog
> > > 
> > > v2: Change Subject of patch from
> > >     "pci: add enforce_slot_reserved_mask_manual property" To
> > >     "pci: allow slot_reserved_mask to be ignored with manual slot assignment"
> > > 
> > >     Add pci_bus_ignore_slot_reserved_mask_manual function
> > > 
> > >     Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
> > >     in hw/pci-host/i440fx.c
> > > 
> > >  hw/pci-host/i440fx.c     |  1 +
> > >  hw/pci/pci.c             | 14 +++++++++++++-
> > >  include/hw/pci/pci.h     |  1 +
> > >  include/hw/pci/pci_bus.h |  1 +
> > >  4 files changed, 16 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> > > index 262f82c303..8e00b88926 100644
> > > --- a/hw/pci-host/i440fx.c
> > > +++ b/hw/pci-host/i440fx.c
> > > @@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
> > >      s = PCI_HOST_BRIDGE(dev);
> > >      b = pci_root_bus_new(dev, NULL, pci_address_space,
> > >                           address_space_io, 0, TYPE_PCI_BUS);
> > > +    pci_bus_ignore_slot_reserved_mask_manual(b);
> > >      s->bus = b;
> > >      object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
> > >      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index 8a87ccc8b0..670ecc6986 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> > >      assert(PCI_FUNC(devfn_min) == 0);
> > >      bus->devfn_min = devfn_min;
> > >      bus->slot_reserved_mask = 0x0;
> > > +    bus->enforce_slot_reserved_mask_manual = true;
> > >      bus->address_space_mem = address_space_mem;
> > >      bus->address_space_io = address_space_io;
> > >      bus->flags |= PCI_BUS_IS_ROOT;
> > > @@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> > >      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> > >  }
> > >  
> > > +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> > > +{
> > > +    return bus->enforce_slot_reserved_mask_manual &&
> > > +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> > > +}
> > > +
> > > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
> > > +{
> > > +    bus->enforce_slot_reserved_mask_manual = false;
> > > +}
> > > +
> > >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
> > >  {
> > >      return bus->slot_reserved_mask;
> > > @@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> > >                     "or reserved", name);
> > >          return NULL;
> > >      found: ;
> > > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > > +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
> > >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> > >                     " reserved",
> > >                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index 935b4b91b4..48d29ec234 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
> > >  void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
> > >  void pci_bus_irqs_cleanup(PCIBus *bus);
> > >  int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
> > > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
> > >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
> > >  void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> > >  void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> > > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > > index 5653175957..e0f15ee9be 100644
> > > --- a/include/hw/pci/pci_bus.h
> > > +++ b/include/hw/pci/pci_bus.h
> > > @@ -37,6 +37,7 @@ struct PCIBus {
> > >      void *iommu_opaque;
> > >      uint8_t devfn_min;
> > >      uint32_t slot_reserved_mask;
> > > +    bool enforce_slot_reserved_mask_manual;
> > >      pci_set_irq_fn set_irq;
> > >      pci_map_irq_fn map_irq;
> > >      pci_route_irq_fn route_intx_to_irq;
> > > -- 
> > > 2.39.2
> >


