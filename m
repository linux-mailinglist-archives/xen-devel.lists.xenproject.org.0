Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAE6B9747
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509626.785724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Kf-0002Td-NT; Tue, 14 Mar 2023 14:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509626.785724; Tue, 14 Mar 2023 14:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Kf-0002Rf-Km; Tue, 14 Mar 2023 14:08:53 +0000
Received: by outflank-mailman (input) for mailman id 509626;
 Tue, 14 Mar 2023 14:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pc5Kd-0002RX-7y
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:08:51 +0000
Received: from sonic303-24.consmr.mail.gq1.yahoo.com
 (sonic303-24.consmr.mail.gq1.yahoo.com [98.137.64.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9600e8-c271-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:08:46 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 14:08:44 +0000
Received: by hermes--production-ne1-759c9b8c64-rg9jt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 38f7483c5dbaf59a571a085480ef55d7; 
 Tue, 14 Mar 2023 14:08:40 +0000 (UTC)
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
X-Inumbo-ID: bb9600e8-c271-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678802924; bh=0LtqezmiTIuF1bLUTi9sCtQOp4N6+Va959+zTiUe6Yk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=BjJxcgXvKWkSdw3I3im5DE3iOXpd2j37677NIkaccqZ2Af030hCrFLeNe5HU163lsqb14LSS+G6qOqA3pLX6+0I/lURGnjQxgTjHmupzyVX2kciZVG83iH4YIDymFM3mk7GC+bfDcFq8cuesGP8T6zE/o2Kz8SlCTI2OYxA9EwrvBMrurc78y3uUD6zym9hnkHnawLXHCphMS4pwZofGEhicEWTaOyVqHIl+l+K/PufH9JABRS08SckaVVPZIiH3YhnhpLIva4YoXr/FAspwSbOOXaFa91jaRZI62mOEtYvl7bMkUGtL5YILIV2/ZOuFXzdgieGv28iey4QTX3qcMw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678802924; bh=9i0sphlhMEan7zFuTdD32Tyo+rFnjj9Cb0ZFf5E3oMj=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ehl/gbqiaikm9QslCePzX0MYKn7ykqPrPQ0yeowmE8u46iiVy2iDMChC4jEFuEaYh778oF4IzAkZ8p9LOpTz97ekaPcAQ0NASP8NbCvZGbVNVFp2KzZgObWOBRLMtVon2u2VhO5wN3I5Q53CrjmUvf/93m488R5ShmjcIkLyIasXFlRRaCvD3YTZNToqBBqZToZrMFSt7595vROJZw7ajyJGStqk9HT2quN+QjIeqMQw0q/wWMp3lN9btvgKb7btxZRV8qhcU1lF2QcVh1d43sMaidMQHhmRh9aDcKAhnI94gZc1CsgdAsMwhGsSVD93IZZdSsWT/cq0wKNim6PC/A==
X-YMail-OSG: 5sFzdeEVM1mAv2uPHa3ln9_24FwZssq02GFih9HFBqDWiCN13nlRRmDSNzU1A6D
 ivfF62BK7cmvW7NOCIvUm52gnKspiDEV2jrlRjkxVHFFoC.2QJMiv9coHnsq1BO26U2nsM_DHiQ_
 5fIwNr3HbFUz0tHItwXEkyRYSIADw9_uK0FwPU0WtYsamMgxLZ5g8DByZNKbEe37Lekg64U0QrIG
 03PuL5yjhjYYKbxpec0z16f2o1dQHJZ8k4pE.__uGZy9_QuSQA_bR3yu7W_NrsNE9O46HpJ07oX_
 GO8iJL33wpEnuLrZ_LPtRxRns6vUfSiLbPOcGe9TPZBYHZMAfn8wTVB61im5YOPC7n1Wqq5ojdYs
 dXB32.OrLsO3wXhTQifagpvMD1E0bw4A_bM6O6ABr49F7ydOK5j2w0yRu3QAJwJWFTeV.NG5kpDd
 QslyDhC2gRhKYVUR1GbrBd.eIP4wspbuwpVPn3h3vA0erUK4x5VPeHlJuzSxyOnF8ZF3hvEMmN5A
 dfl449OQYVvEZOCS0Zsu9vtIQXjDjX02KfMXUYKy7NkVon0m0Ta2AXfYevfFkaVBvQTr8.rdlHC2
 rVecjgiJdWBa8I5fKSdyHqMTwHpAbmigFyWVZBmkPJRoY7ivtr6XZFGcMGjYbijvrO9w50lnirlX
 InDkN8OhREVFeXkfof7Unx5h5hCk3WmbxFZvQyev.fRo4ESlUnLk3Xk5E5qduUEGWbJymcGbhT9d
 YWrAj5e6aE9W8IIIdMhthkuc0chofIl5P8XnmbO.3XOjV3TdA..U_EL2FZ9Cra0S5dlkos_lShVZ
 C507gAX8B5hofWw.gIYGgsWa48sG6n50gD5h7DK_grnTx2N_rkIF4dg05c56I2bx7Ndy0WFbgRg2
 cy2os6nsYtu4R_HTZyYqZLIlttQvvva02WsFZk01B7Um_Cld7vsGdrqioNwTO7jI.6Ch1wa4G4NQ
 hzRh2RF5Ni0ELjX2I1lv.SXcgOxcNxEMLVxDyiIPxuTAAsICOXGT4g4dMCT2pAtj.ieIub4GHB_o
 iS39MgJyhrprv9UgIA9svw62pzvwdFFBUSOjfpV357DHicaGpiNWlJ7jYhm0kmygrSzn.R5857co
 QLbl0aAxzsPT5qmMNmR4GJoR2cX2CJnGZL7hnX92BObfLSpTqN4UVSJepAb.KmiD78yFk2biix.O
 KM8M.P8GB4hT0fHzsivxAXyICp_4S0EE7d5NvfE1_ao.zeZfzP1Q2gbzL0BYcQPEJkOE8P1yHQqR
 UsDAA9ELWwY8NUQJa51MJeu.J7vaU7dXucQlXPF1krwadoOxg9AxGfMRdtpnULq7fyuOE0LpMYe0
 scXaciyyR4X3CyUb8ioAAzsYXirgDzV5PK4AqO2kXW7qf5f06fuZ1gg7uIexTJdJLyZuJQtXuO0F
 rPjvQi8Lqzc.9d3StC4vET6kSmtcCzjGB1yAd01WhM6D8hjdkk9nvi6jpISb4x29WusDEpSNS8Jt
 Ej7tyG6mRPtn20fajr.KiI_1iKUAGcfuC8k1ozfKGa1DNgC9GbXpBph0cjXJfCHuepZRTBQUQY8s
 WzeAO4LB6C6sh5vYC91bwlNW_neG0IPfASqlZ0nAdNZKSZJjxDqZqK1EzWh6rHqP9trUZQHab4FP
 YFSo4aZhJ72hj8XV3csU5U8gglHfIpchC7QCytyyddgDG6r76y9ORjpA2tbTBfSTAmgQKNW86Dqm
 GbNajGkYcOdVyYphRT1URW9o6hsiuL.6719qZFCbEZwRusx5spe2LhC2nzuMPGNlb6GZXq6FowcQ
 vhCaia.FNuRORhP2.ZSGLRVhx6.Cy7PqzkQQFxsOUi09BnREOAzATS7c9K66njKGPoMaom3Cx_kY
 _jvqabRnjRYFqXUxPnyzlY4ueJV3vvOz8JBV4B6fC4rlis3YFSODHF54HmBbkUw0NK36aQacN4ST
 dYdzo35CeumwoK6GYK.1NgiZAda1d1LI4Wejs3jN9HaXOPdnqoruevAFLQr8SJkbs_pG93homz8T
 LQcLEwGxCoCmoiMlx4pELQD5IL.m_zZjEToXl6z1KtaI16aP6.085cHfNT6b24crmWD77tvP_zU0
 FxUijaf9G_d1Au50q3uDwXOP5XZiHUo2wInqhw8OBdzzRyV8cNh3SN4.3MTnWT_OWj_x2G2MzGLU
 DtU0IpqIhhcyTQyRR8CKxoLJYStdgECfpO72JEDbTLJVsxDV6N4abUJIvnjL.lYh7WoRhIRD5LeS
 qtX9rHKWrKJ2f6xUqtfqP31qH
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: ff59ccee-9918-48da-8d9e-5f9b2f42ed7f
Message-ID: <c44a3666-43b6-5287-dfc1-c6e61798fa9d@aol.com>
Date: Tue, 14 Mar 2023 10:08:40 -0400
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
>
> Regardless, I'll take step back and leave you and Michael to come up with a solution 
> that you're both happy with. Let me know if you need me to test anything on sun4u.

I will give this a little time to see if anyone else has any ideas here,
and to also more carefully consider Mark's proposal, before posting
v3.

Kind regards,

Chuck

