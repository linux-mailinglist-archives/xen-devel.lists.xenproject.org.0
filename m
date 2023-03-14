Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB16B97C2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509659.785841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5X0-0002UV-4W; Tue, 14 Mar 2023 14:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509659.785841; Tue, 14 Mar 2023 14:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5X0-0002RK-1N; Tue, 14 Mar 2023 14:21:38 +0000
Received: by outflank-mailman (input) for mailman id 509659;
 Tue, 14 Mar 2023 14:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pc5Wy-0002RC-0a
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:21:36 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84ec1406-c273-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:21:34 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 14:21:31 +0000
Received: by hermes--production-ne1-759c9b8c64-7lgm5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3ca88b3ab5c2ca17a44595379b04fcc2; 
 Tue, 14 Mar 2023 14:21:25 +0000 (UTC)
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
X-Inumbo-ID: 84ec1406-c273-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678803691; bh=/sCctfPa+8N77SEpv5uUOJ2i+cEhaseBE+7f3Z/dftM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cgBWEI6pv3SuHdPrPN6LzTyRmTNvsdlRTCTY+wghqIO0PFx06zGcIeGJo17uXSYpSLr9Ah6aLHGQGeZ09svk2trUSuik/zARQD9Ldzr/GHC9QYOYD17V5TKXB80mEcXsIa6ggro4Xf/qfmScfa8l9R9bwRa0Svu4J/djwZ/+pHulRWbf343ZeY4CHpDxgng/q8YTQ/moutH7mjmc3gi7CUF5eTOcK4ZSn0613FKsNQayT5iGKQikAImAh9qS+fVBAwKuhOwEstZqTIkhE0MiQNL3V53mfedzj1gTUjwQ6cDwZW6Tq1ussAnnXgCYsV/2YwL7M13Nz/x3D2EBWjZ5SA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678803691; bh=cxR8+ivoOWx3C4TMEJTPjMsZbKQpAUVtORDx9F/xvvF=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=tsYz4e+9yE2UFMMqmFlbV2fre1xDkLluLwoq7+Ho6pRje6x4I58B+1yB5P/GEiCm6fyIseaaEX2IjlXrocF/ULBjVwgqYX0Ov0r0dove4LFb8oZd+Lut2CfFi/8LOCJXQIBxpgczvnjwVSb/DNGsYwBToQ79Fgpd97BX+QaRAUI52xvyOiTmxE8ZdSfQLq77g+Q5ZDR4tcdUi4XSJ30IDWepGXGRTXy6uB5DakDafpn8FrFLhQf4pNR8brQ8+oEdAAYV8EU6AHDhxLQhpeGri1rrRG7tt7wWzOhFjZgS0h2WAiTxP00Aoju4xM/iWdWAJn8PFyH7cII5GXW8ErFLpw==
X-YMail-OSG: rZ0G0ZgVM1kspkbBit1i7dIYV.gc6sfAgtAvcSXoEVaG.0xPPN9JbSEbrE3tWX6
 lN_LAjRPGE8QVJcl713EdjtVHpos.Mnf9eLZRhXv7CE2FnhXx0uDyrWLVnHPClm9MVXD9AEeIZz4
 2CQJn.GNNhygNXaN7C91de14tCStFEW.UlLm6DZWmgSHDbFyqQju2RraYSJZ4jX.nareh2ViJlUu
 UsIKOA1dAjEcbshaNmpwaREdks3ldtiog0XWx9gIQRftNgNeGy.BMXcv1OMfTByYr2Ugjb0aFps0
 m1m1z3SvM6QVEi654fkR_f6B3A7FMHekV2ADXk9xley79r4QKCPliK_ZR2pIyhz84G1WPBU5Yli3
 QIcABNbx8t6bvfMUNTnEU66IJhZnrNTEVWjhCeY1y_FD2_l0C42xC8YUCBIQNGdWrh8utvvrjWtr
 BXmypFKG7SVjAov3067uvEW5Mfs01HJP13tVYsz_UdIYw4QtUxg4CWlTsmrSMfMjbquFZz1PS9wl
 IlNi570Q7ImiqslHj8cokR2v8ulWdm2AgaBZPes4SnvuG8vD9XtIGy1UuYEX6jdFccLG23k6yREK
 QDsWIHhOJThVXjya_XU3HdBsvVK2WFsQnpSxkIM3JXhps4k0FV166pdeWWN_UBPXTmzuvXtzmsJE
 Af16EJTsIPcz.LEHZ6.FA36.kDdzsloFVqv8np2_rN4ZpHhj__Qmix.vNiagYqYOBV6BeWiCl3PI
 RIKHFVrRsFPZlI.0CvtHx9ueGfAIsK.iDvahjGxObvo5GL_QZXBEU.WvANd5KnlDCEeLul.YZr8T
 v9jexg900MOEo.R_i8OOF8BPYLV16vlLNNp4IH18cRkw_C8F3ws0gNkEDWu_j638NZ2gN0IkMTVy
 JC3kFFnj2OAg_YzsOuRgReE9tuFo7fC4FEtWjMrZbjXtsdyV2I7V5Nuvlgyjr9E6GRb3rJQ.jais
 4dmDZTtUDAJeGwnhJTU1YTMVhtELvLM_jOrkZTgEmOdNxpsT0ON8MACsMDpeOoSGgNcMbT_fcv6W
 Mba1pgjEluNpVjXBvfrC850drjFPnCtB2fvoLqLPuF_CZUS.wvVDXrqaEloXLnoJgdGCgGBIzel9
 qqxoPOIiYOwZDd1amqLCO7pkSxo5MhcKqhiC0NvDcNZbRV8QN3RlPMflyJz0oyah6iMw.siwdFpr
 IlujlkiXwOB0lkY4_3mMW3OZ6_5SPgunxp5MvTsInMuVwllkwn2_e6arjW_.tj2.BIJA31yvMmNR
 O.t6t_AXMRck2CmzzT0u5sGnJZWPFTQw7sTDyre6Hc_yNZbZxNFBB6yaKY1SZRSSJBg5qXPdMAu3
 seXD3vASitNHJHwuUbNb9DdiXBx4byn.6WX4euMNFpyGTGyaDqmemQiqUl1ilF2GE17bQhjJiXYk
 cWUIulYpLso2oaEqrRU_8X1K34W0TU0i5QE0Pn_1xO4GDhDHd0SLcHoju4QF2nR5LcHEJhVJ.s.8
 hkAo9r92TJ6B6DduIGNA8OJkKhEjKvZ4epTx4mDG8xQHo.rtJWzr_A9Hq4_j8zxV_ns1RJsaTl.I
 iv2PKB9O2d_3pm3VdLOSiB5CPG8u8PdSQL5iet04xrLwrcCJgfO9X4yqpYV3leTAccybShvUiWVE
 PGYkvGyu6_.LS1JQi1PgC8vXWp2P0XqNqaD_T5IfcwJg_QvkP80qlep9ewk1xBrbEzYsMVdq4ZNK
 mtR0p5jYiaivdaprlbdA.DJ0BzVuMz8Yb639L9qzCcqlHPHQ6ssTy4MdAOcYRJF1FLgxQwNXOghp
 uYh8jtQGWXVBhizkGKg_uagEjOMtk.VWmHZpd6ZGH0pc85OUGAWq_LtzMkggVvP7WvDmlutUijcN
 HrvKMeZd9ExKG29cEXveuMHFohD5.pxz03FHa7EwDAzzu8QaDa9fTX5UfAIszhR3OHFKZITszj4E
 CScFupBfwMqQPlOxxNxCLSD34eavTsZpYsaaO9mWlcKuEOsgTv9W52SOuoSVkroogHLa1HThMVMA
 OQBxh.1de7mOTdeXCQ6UBRfT6MKZu7pmtDrvzQ4lFqkSdxeDojpap1e0RVRyYad.nvOOyrzVmA8e
 Rt.CewFhEsK3e0ZPCfb4VsMXb_s8fmq1Abe5UmQ0GT5wJDT5CnVpRQE1hZAtSa84KL1kTEwUXJkv
 V4Y7W5wmBXEBCnPfBdOKYjAr9ztXLXaMuLjpw6XbEalREt0FX85syDOu_1KsLhmrggBeV8n97X1m
 BJ_SYpubSj3VQ_FTqfm6f
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 14a821b7-ea05-47e6-b905-a366b1dfa563
Message-ID: <7b822b6c-a0dc-63c9-722e-e1e0361a8d9d@aol.com>
Date: Tue, 14 Mar 2023 10:21:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
 <20230314091653-mutt-send-email-mst@kernel.org>
 <34eda0c4-3d90-0e22-7888-81bf18e2a5f0@aol.com>
 <7b79ec08-064c-7940-0285-be8a96e2a144@ilande.co.uk>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <7b79ec08-064c-7940-0285-be8a96e2a144@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21284 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/14/2023 9:41 AM, Mark Cave-Ayland wrote:
> On 14/03/2023 13:26, Chuck Zmudzinski wrote:
>
> > On 3/14/2023 9:17 AM, Michael S. Tsirkin wrote:
> >> On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
> >>> On 14/03/2023 06:33, Michael S. Tsirkin wrote:
> >>>
> >>>> On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> >>>>> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> >>>>> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> >>>>> xenfv machine when the guest is configured for igd-passthru.
> >>>>>
> >>>>> A desired extension to that commit is to allow use of the reserved slot
> >>>>> if the administrator manually configures a device to use the reserved
> >>>>> slot. Currently, slot_reserved_mask is enforced unconditionally. With
> >>>>> this patch, the pci bus can be configured so the slot is only reserved
> >>>>> if the pci device to be added to the bus is configured for automatic
> >>>>> slot assignment.
> >>>>>
> >>>>> To enable the desired behavior of slot_reserved_mask machine, add a
> >>>>> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> >>>>> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> >>>>> called to change the default behavior of always enforcing
> >>>>> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> >>>>> when the pci device being added is configured for automatic slot
> >>>>> assignment.
> >>>>>
> >>>>> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> >>>>> creating the pci bus for the pc/i440fx/xenfv machine type to implement
> >>>>> the desired behavior of causing slot_reserved_mask to only apply when
> >>>>> the pci device to be added to a pc/i440fx/xenfv machine is configured
> >>>>> for automatic slot assignment.
> >>>>>
> >>>>> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> >>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >>>>
> >>>> I really dislike this.
> >>>> It seems that xen should not have used slot_reserved_mask,
> >>>> and instead needs something new like slot_manual_mask.
> >>>> No?
> >>>
> >>> My suggestion was to move the validation logic to a separate callback
> >>> function in PCIBus (see
> >>> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
> >>> perhaps I wasn't clear enough in pointing out that I was thinking this could
> >>> *replace* the existing slot_reserved_mask mechanism, rather than providing a
> >>> hook to allow it to be manipulated.
> >>>
> >>> Here's a very rough patch put together over lunch that attempts this for
> >>> pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
> >>> pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
> >>> implementation, and slot_reserved_mask gets removed completely i.e.:
> >>>
> >>>
> >>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>> index def5000e7b..30b856499a 100644
> >>> --- a/hw/pci/pci.c
> >>> +++ b/hw/pci/pci.c
> >>> @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
> >>>       return host_bridge->bypass_iommu;
> >>>   }
> >>>
> >>> +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
> >>> +                                          int devfn)
> >>> +{
> >>> +    /* All slots accessible by default */
> >>> +    return false;
> >>> +}
> >>> +
> >>>   static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >>>                                          MemoryRegion *address_space_mem,
> >>>                                          MemoryRegion *address_space_io,
> >>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> >>> DeviceState *parent,
> >>>   {
> >>>       assert(PCI_FUNC(devfn_min) == 0);
> >>>       bus->devfn_min = devfn_min;
> >>> -    bus->slot_reserved_mask = 0x0;
> >>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >>>       bus->address_space_mem = address_space_mem;
> >>>       bus->address_space_io = address_space_io;
> >>>       bus->flags |= PCI_BUS_IS_ROOT;
> >>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >>>       return !(bus->devices[devfn]);
> >>>   }
> >>>
> >>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> >>> +                                   PCISlotReservationType restype)
> >>> +{
> >>> +    return bus->slot_reserved_fn(restype, devfn);
> >>> +}
> >>> +
> >>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >>>   {
> >>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >>> +    bus->slot_reserved_fn = fn;
> >>>   }
> >>>
> >>>   /* -1 for devfn means auto assign */
> >>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>           for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >>>               devfn += PCI_FUNC_MAX) {
> >>>               if (pci_bus_devfn_available(bus, devfn) &&
> >>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> >>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >>>                   goto found;
> >>>               }
> >>>           }
> >>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>                      "or reserved", name);
> >>>           return NULL;
> >>>       found: ;
> >>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> >>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >>>           error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >>>                                          MemoryRegion *address_space_io,
> >>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> >>> DeviceState *parent,
> >>>   {
> >>>       assert(PCI_FUNC(devfn_min) == 0);
> >>>       bus->devfn_min = devfn_min;
> >>> -    bus->slot_reserved_mask = 0x0;
> >>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >>>       bus->address_space_mem = address_space_mem;
> >>>       bus->address_space_io = address_space_io;
> >>>       bus->flags |= PCI_BUS_IS_ROOT;
> >>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >>>       return !(bus->devices[devfn]);
> >>>   }
> >>>
> >>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> >>> +                                   PCISlotReservationType restype)
> >>> +{
> >>> +    return bus->slot_reserved_fn(restype, devfn);
> >>> +}
> >>> +
> >>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >>>   {
> >>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >>> +    bus->slot_reserved_fn = fn;
> >>>   }
> >>>
> >>>   /* -1 for devfn means auto assign */
> >>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>           for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >>>               devfn += PCI_FUNC_MAX) {
> >>>               if (pci_bus_devfn_available(bus, devfn) &&
> >>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> >>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >>>                   goto found;
> >>>               }
> >>>           }
> >>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>                      "or reserved", name);
> >>>           return NULL;
> >>>       found: ;
> >>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> >>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >>>           error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >>>                      " reserved",
> >>>                      PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> >>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>> index d5a40cd058..8a949f7ae1 100644
> >>> --- a/include/hw/pci/pci.h
> >>> +++ b/include/hw/pci/pci.h
> >>> @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >>>    */
> >>>   int pci_bar(PCIDevice *d, int reg);
> >>>
> >>> +typedef enum PCISlotReservationType {
> >>> +    PCI_SLOT_RESERVATION_AUTO,
> >>> +    PCI_SLOT_RESERVATION_MANUAL
> >>> +} PCISlotReservationType;
> >>> +
> >>> +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
> >>>   typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
> >>>   typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
> >>>   typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> >>>
> >>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
> >>> +
> >>>   #define TYPE_PCI_BUS "PCI"
> >>>   OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >>>   #define TYPE_PCIE_BUS "PCIE"
> >>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> >>> index 5653175957..d68ea1418d 100644
> >>> --- a/include/hw/pci/pci_bus.h
> >>> +++ b/include/hw/pci/pci_bus.h
> >>> @@ -36,7 +36,7 @@ struct PCIBus {
> >>>       PCIIOMMUFunc iommu_fn;
> >>>       void *iommu_opaque;
> >>>       uint8_t devfn_min;
> >>> -    uint32_t slot_reserved_mask;
> >>> +    pci_slot_reserved_fn slot_reserved_fn;
> >>>       pci_set_irq_fn set_irq;
> >>>       pci_map_irq_fn map_irq;
> >>>       pci_route_irq_fn route_intx_to_irq;
> >>>
> >>>
> >>> If this approach seems reasonable, I'm happy for someone else to take this
> >>> over and turn it into a proper series.
> >>>
> >>>
> >>> ATB,
> >>>
> >>> Mark.
> >>
> >> It's ok too though I think I like chuck's proposal better:
> >> less callbacks to chase.
> >>
> > 
> > I would be willing to pursue this if there were more use cases for
> > slot_reserved_mask than just the two cases we have now: xen and sun4u.
> > Until there is a clear demand for a more general way to manipulate the
> > mask, I agree with Michael that the KISS principle should apply here.
>
> No worries. The thinking behind this idea was that it feel like the Xen case is 
> special in that it has separate requirements for auto slot allocation and manual slot 
> allocation: if slot reservation were used in more places, I'd expect the sun4u case 
> to be more common, in which case it seems a bit more work for the common case to have 
> to set both slot_reserved_mask_auto and slot_reserved_mask_manual separately. Perhaps 
> a single accessor function can be used to set both mask values together for a PCIBus?

My immediate thought as a way to avoid needing to set both masks in the
sun4u machine would be to add an initialization function that defines the
relationship between the two masks. The sun4u machine would use a default
function that simply sets the manual mask equal to the auto mask. In the
special case of xen, the manual mask would be set to 0.

>
> Regardless, I'll take step back and leave you and Michael to come up with a solution 
> that you're both happy with. Let me know if you need me to test anything on sun4u.
>
>
> ATB,
>
> Mark.


