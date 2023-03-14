Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4576B9C6B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 18:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509764.786196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc82T-0006qQ-9L; Tue, 14 Mar 2023 17:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509764.786196; Tue, 14 Mar 2023 17:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc82T-0006no-6N; Tue, 14 Mar 2023 17:02:17 +0000
Received: by outflank-mailman (input) for mailman id 509764;
 Tue, 14 Mar 2023 17:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pc82R-0006ni-Bx
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 17:02:15 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5940de4-c289-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 18:02:11 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 17:02:09 +0000
Received: by hermes--production-bf1-777648578f-pgmvp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 70d6441b4f412abd251a2fd1cbdb7763; 
 Tue, 14 Mar 2023 17:02:04 +0000 (UTC)
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
X-Inumbo-ID: f5940de4-c289-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678813329; bh=OKYq/F/8DdojmmxizWqZYA3xp5uBMCQE9e0reLMfoDw=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Zcw2T+Lzlwi4jYbO0oHwne1+ATehdeNp6kUdcwfSkEYl3qrNVY7otH69tJf9Z401A+iLKLQ1VL5jbIRHEM/Iqo0QxfLi4l+dNpwrC6sH1UJN9l+5scMtE9FmvkAWnU8eznlM37oElv/Jl7MkI3P05UV9SVFQzsXj/LrOLxStTyxRpdXmRcBCVCwMte3t6+7xp2ne1gdWvOX//OznTw3i+HSI/bKWiayYtWnf6EpLuZCC0qb2Yurl1DWsE+l3o96/+Knjdt87B43ud5evCyN2o+LDqE7oclv2x3Yem/HTe07REcDRzt/YEWd9IJm8rUyHIDR5xP1oJC1T96onBuHNvw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678813329; bh=hFb5I54dmCyElOH3uvJ27VcHVGpXNZX+HGwm4hV2+dH=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=XnsMiCga4gVNbnR7OBUQR1szUVowd9rfDD7iwU96LFjm8MDI3XnRhvIO/y+L1Qr8d/mFBmqoEDL304kh/aaSCWCDWnzuExweRSuDPS9W2qHQJRDt8TpwlqoSXKK5rGzUBosciXCL5LBy2nsXP9hnYWmHmDe4UcM2mDTvRZFogS+4XeqLznuNBPhQEF/Z9fCtJTU9o+7uEJwHdv3ULCuVeopsRzUzLL640gVeOgjk5ybNPoIHUKL/53wGXVzBJ9y1b6P5hiyijZwFKv1H5SB9wzcSKRH80Jc69iYQNwroRXOmPClineoFj4dkTzDJWV7ZZ3GEjvpBgGdKGB24pm73TA==
X-YMail-OSG: QsgS3D8VM1kcXht_fPCfad5goOgp52YV7vOM9sxx5cO9Tf8_OX4PM1G9_4J8ANh
 kwSEYqlkAgvnjm6MCwcci_TfGM_NHhKjE1D338LGd7f1O..ng4bgNh3Gzubiy__CynUcpybMN6SD
 RTUn5FYnZZOKnl.j42Td6jzVB0hLkwxvLy1OzoJQ0nJ6XSXTPayN6ur6_nq02fbcEFj5q3oJ5KY.
 ceTn7qgrUYxczJnxikpULhHouAuJmXXGO954t2ZpQ6ymkCsJ6WDPPJMn9syA_AuCyZuCS6S14F.s
 N2QFdEOWgzMv7IaSOdCOPHhp7NDLqInnJDqzEWrzHQN4WP4xpghGiiF9Sv4IE7m7BTZ0M1ze5PpE
 mdJadoN4DUk1vx3KGBbpPrS566zpZPFICmdcisN48B_isazfwimwBulbMlvg6VlDB2LcFf7X27wa
 zVLK8EqRGu5fdqlmfJfZY44DAZ9b_yy7kUhQuY6dC8edHGtSdM.SqGf8PdEs0vM5NsiPK9BN1w1s
 5UrwcjwU6xILt2.MLz7XGS_5eQ60L7mWPyAMjGlwEu8DHk90aPnSfN.ISZGIW6VFi.J8N3g1lgN5
 UCvSPqBl_hwHGGYC306T5XRsdqDxgwNVycr4XYrMa7UalFHblCjoOyawMSsbw61.5jte2F0p717F
 TsxH042Gq5fGuYpWo03cg4H2_rD1Ic.WA6vSDvnl7.MT.TDfm.IybH_yyJUtjaGxrHLNnZZ.LgrH
 xah1ZdJPvYlkDmLxZXRXx0rYVLKD3Zzmyh7iR57ONUPvViypCXaytlw13dM0lEmo_LKqAvMaTCKc
 gb6wlBEaazDpkCO7PJgcjVF.Ytvi8itilmEpIxThPejAeKYo.L7ko8wYFbegvs51tzN4o7i4aJ0D
 ZDN5GF7APVedzlyre_14wTbmXuFFlIiMLOxxywuEyHWj9jY3dvHjP47C_91BPPXyc2bu5pSJK8h4
 tGreq_WbhimIBKXGhFTtNTCw5o_IWJU4VTUFbmHM2t5FWXSv4nUjzAbBoAd47bObezu_LaVYxml2
 V.XbjCacMPi2.0D4e18PhWjcTb2vcus2NvQThe.ZQAz7yxy7CuoSaFXEDUU3UdLHb.k.mCbdKwD5
 jWVvpfJHKWBX2JPp5w9SB75uPI8Pen2GjAp3PwIqfaw5AELEnT9l9jFqBXwZfZx2uhpYuGiNZ8go
 LCLpry3.uqe9MwL.raDbmmEJ3wyvVP7zB_vE0Hh3nWLKEDR4N.fXnosnyoNg27t1MsUlbarFDygy
 q.pbD2q3StDuBM1YY5NYCQE0oTCSdzprkyu8AzsWkhyHMuA0vOM9NcDZjKwW9K1z8fZ0Cu18tcaV
 Z4LQGz3zKZH8n7tR6KqIUGB8tnyneODvD_MjkWopmUQBiSNvKFU30RyKU4F8vbx64QZOSCvQjtOo
 BvezYE9lnPdKQgtED1RulRHdBgR_KFfid7Dvf9BQGvPXqfwHESD52BaV3zCsaCSlZUXxJYf2ZIv7
 b9uI.Zpb3gjXHeRaQve7OxXbcEzIlzGYZTEEVVDLmsewgCi0gHTta5kejsyi9zK7JjJXMs7UfS2j
 SVSA96j5v8tcTHumgpDYxi0B6CPk8RIQwG5rNjcPsmxNPZClwSF5seqD0WBN58UN0cJonoiU32DC
 2N33vakg6eeOXzTZIOU6gTi0kMkDrc.KJeHXdG8OuOx70Vdsm2Ftl0uzbL47WyUmPl5SityPBYNC
 XL_yB7B3ug2HjocW7XPvhRDDXd.obeUSEsa3OMnHMjEm29yp.IX2McdkTJmDxg_r03.N.XF_e5Qq
 oamdK0N9lL40ZeMJfS.nPEs.HdbpEEqNdxl9tNzNV6GIuCt8dbMzJN8_7ZuapEIZscvmTlRCbxcX
 9tUg8GIMAeIrrQme6ynF0zpfV_wz470DXjDZ9oxP7bbnL8P..LE4xaOqaeJaRsoN06Fmzo.O4q07
 AdMUsifZFUnavNA7SYISeOnNSwnHWb82NSpE4Fx3TQHagfO3jpF6PY3HMN5ZXEEERPGUvODV_AOE
 6WydxLk8cD9Ajmp_oBj1e0KETrwFRu5xH4pPugu9iaimGghgXABUmnK0867JCkosks2iit4Y41zo
 f4VnXq2YflOmMbANvnK2nF.M0kWcr5TUW1d1O.WlrtYpCegMzpJXR2J99.S27tyXK2eQr9t66uOz
 6Kw1_CiShSuO78XpvDUvq1rdESdxI3r7qya3FL3Wx1qDC1fNwV9AhENU6o1k.hF1ThfRLNxN5xM4
 VCnRUJG23HrLKOsT.nCdbuNc-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 958ea7cd-396a-41e7-ad83-3d1ae00bd1aa
Message-ID: <01f4002e-b6b3-f2a0-4927-a39b997ddf57@aol.com>
Date: Tue, 14 Mar 2023 13:02:01 -0400
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
 <7b822b6c-a0dc-63c9-722e-e1e0361a8d9d@aol.com>
 <850cf67e-151a-b1c3-7265-1428659e3a6a@ilande.co.uk>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <850cf67e-151a-b1c3-7265-1428659e3a6a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21284 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/14/2023 10:39 AM, Mark Cave-Ayland wrote:
> On 14/03/2023 14:21, Chuck Zmudzinski wrote:
>
> > On 3/14/2023 9:41 AM, Mark Cave-Ayland wrote:
> >> On 14/03/2023 13:26, Chuck Zmudzinski wrote:
> >>
> >>> On 3/14/2023 9:17 AM, Michael S. Tsirkin wrote:
> >>>> On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
> >>>>> On 14/03/2023 06:33, Michael S. Tsirkin wrote:
> >>>>>
> >>>>>> On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> >>>>>>> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> >>>>>>> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> >>>>>>> xenfv machine when the guest is configured for igd-passthru.
> >>>>>>>
> >>>>>>> A desired extension to that commit is to allow use of the reserved slot
> >>>>>>> if the administrator manually configures a device to use the reserved
> >>>>>>> slot. Currently, slot_reserved_mask is enforced unconditionally. With
> >>>>>>> this patch, the pci bus can be configured so the slot is only reserved
> >>>>>>> if the pci device to be added to the bus is configured for automatic
> >>>>>>> slot assignment.
> >>>>>>>
> >>>>>>> To enable the desired behavior of slot_reserved_mask machine, add a
> >>>>>>> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> >>>>>>> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> >>>>>>> called to change the default behavior of always enforcing
> >>>>>>> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> >>>>>>> when the pci device being added is configured for automatic slot
> >>>>>>> assignment.
> >>>>>>>
> >>>>>>> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> >>>>>>> creating the pci bus for the pc/i440fx/xenfv machine type to implement
> >>>>>>> the desired behavior of causing slot_reserved_mask to only apply when
> >>>>>>> the pci device to be added to a pc/i440fx/xenfv machine is configured
> >>>>>>> for automatic slot assignment.
> >>>>>>>
> >>>>>>> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> >>>>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >>>>>>
> >>>>>> I really dislike this.
> >>>>>> It seems that xen should not have used slot_reserved_mask,
> >>>>>> and instead needs something new like slot_manual_mask.
> >>>>>> No?
> >>>>>
> >>>>> My suggestion was to move the validation logic to a separate callback
> >>>>> function in PCIBus (see
> >>>>> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
> >>>>> perhaps I wasn't clear enough in pointing out that I was thinking this could
> >>>>> *replace* the existing slot_reserved_mask mechanism, rather than providing a
> >>>>> hook to allow it to be manipulated.
> >>>>>
> >>>>> Here's a very rough patch put together over lunch that attempts this for
> >>>>> pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
> >>>>> pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
> >>>>> implementation, and slot_reserved_mask gets removed completely i.e.:
> >>>>>
> >>>>>
> >>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>>> index def5000e7b..30b856499a 100644
> >>>>> --- a/hw/pci/pci.c
> >>>>> +++ b/hw/pci/pci.c
> >>>>> @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
> >>>>>        return host_bridge->bypass_iommu;
> >>>>>    }
> >>>>>
> >>>>> +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
> >>>>> +                                          int devfn)
> >>>>> +{
> >>>>> +    /* All slots accessible by default */
> >>>>> +    return false;
> >>>>> +}
> >>>>> +
> >>>>>    static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >>>>>                                           MemoryRegion *address_space_mem,
> >>>>>                                           MemoryRegion *address_space_io,
> >>>>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> >>>>> DeviceState *parent,
> >>>>>    {
> >>>>>        assert(PCI_FUNC(devfn_min) == 0);
> >>>>>        bus->devfn_min = devfn_min;
> >>>>> -    bus->slot_reserved_mask = 0x0;
> >>>>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >>>>>        bus->address_space_mem = address_space_mem;
> >>>>>        bus->address_space_io = address_space_io;
> >>>>>        bus->flags |= PCI_BUS_IS_ROOT;
> >>>>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >>>>>        return !(bus->devices[devfn]);
> >>>>>    }
> >>>>>
> >>>>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >>>>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> >>>>> +                                   PCISlotReservationType restype)
> >>>>> +{
> >>>>> +    return bus->slot_reserved_fn(restype, devfn);
> >>>>> +}
> >>>>> +
> >>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >>>>>    {
> >>>>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >>>>> +    bus->slot_reserved_fn = fn;
> >>>>>    }
> >>>>>
> >>>>>    /* -1 for devfn means auto assign */
> >>>>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>>>            for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >>>>>                devfn += PCI_FUNC_MAX) {
> >>>>>                if (pci_bus_devfn_available(bus, devfn) &&
> >>>>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> >>>>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >>>>>                    goto found;
> >>>>>                }
> >>>>>            }
> >>>>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>>>                       "or reserved", name);
> >>>>>            return NULL;
> >>>>>        found: ;
> >>>>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> >>>>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >>>>>            error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >>>>>                                           MemoryRegion *address_space_io,
> >>>>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> >>>>> DeviceState *parent,
> >>>>>    {
> >>>>>        assert(PCI_FUNC(devfn_min) == 0);
> >>>>>        bus->devfn_min = devfn_min;
> >>>>> -    bus->slot_reserved_mask = 0x0;
> >>>>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >>>>>        bus->address_space_mem = address_space_mem;
> >>>>>        bus->address_space_io = address_space_io;
> >>>>>        bus->flags |= PCI_BUS_IS_ROOT;
> >>>>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >>>>>        return !(bus->devices[devfn]);
> >>>>>    }
> >>>>>
> >>>>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >>>>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> >>>>> +                                   PCISlotReservationType restype)
> >>>>> +{
> >>>>> +    return bus->slot_reserved_fn(restype, devfn);
> >>>>> +}
> >>>>> +
> >>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >>>>>    {
> >>>>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >>>>> +    bus->slot_reserved_fn = fn;
> >>>>>    }
> >>>>>
> >>>>>    /* -1 for devfn means auto assign */
> >>>>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>>>            for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >>>>>                devfn += PCI_FUNC_MAX) {
> >>>>>                if (pci_bus_devfn_available(bus, devfn) &&
> >>>>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> >>>>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >>>>>                    goto found;
> >>>>>                }
> >>>>>            }
> >>>>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >>>>>                       "or reserved", name);
> >>>>>            return NULL;
> >>>>>        found: ;
> >>>>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> >>>>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >>>>>            error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >>>>>                       " reserved",
> >>>>>                       PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> >>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>>>> index d5a40cd058..8a949f7ae1 100644
> >>>>> --- a/include/hw/pci/pci.h
> >>>>> +++ b/include/hw/pci/pci.h
> >>>>> @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >>>>>     */
> >>>>>    int pci_bar(PCIDevice *d, int reg);
> >>>>>
> >>>>> +typedef enum PCISlotReservationType {
> >>>>> +    PCI_SLOT_RESERVATION_AUTO,
> >>>>> +    PCI_SLOT_RESERVATION_MANUAL
> >>>>> +} PCISlotReservationType;
> >>>>> +
> >>>>> +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
> >>>>>    typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
> >>>>>    typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
> >>>>>    typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> >>>>>
> >>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
> >>>>> +
> >>>>>    #define TYPE_PCI_BUS "PCI"
> >>>>>    OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >>>>>    #define TYPE_PCIE_BUS "PCIE"
> >>>>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> >>>>> index 5653175957..d68ea1418d 100644
> >>>>> --- a/include/hw/pci/pci_bus.h
> >>>>> +++ b/include/hw/pci/pci_bus.h
> >>>>> @@ -36,7 +36,7 @@ struct PCIBus {
> >>>>>        PCIIOMMUFunc iommu_fn;
> >>>>>        void *iommu_opaque;
> >>>>>        uint8_t devfn_min;
> >>>>> -    uint32_t slot_reserved_mask;
> >>>>> +    pci_slot_reserved_fn slot_reserved_fn;
> >>>>>        pci_set_irq_fn set_irq;
> >>>>>        pci_map_irq_fn map_irq;
> >>>>>        pci_route_irq_fn route_intx_to_irq;
> >>>>>
> >>>>>
> >>>>> If this approach seems reasonable, I'm happy for someone else to take this
> >>>>> over and turn it into a proper series.
> >>>>>
> >>>>>
> >>>>> ATB,
> >>>>>
> >>>>> Mark.
> >>>>
> >>>> It's ok too though I think I like chuck's proposal better:
> >>>> less callbacks to chase.
> >>>>
> >>>
> >>> I would be willing to pursue this if there were more use cases for
> >>> slot_reserved_mask than just the two cases we have now: xen and sun4u.
> >>> Until there is a clear demand for a more general way to manipulate the
> >>> mask, I agree with Michael that the KISS principle should apply here.
> >>
> >> No worries. The thinking behind this idea was that it feel like the Xen case is
> >> special in that it has separate requirements for auto slot allocation and manual slot
> >> allocation: if slot reservation were used in more places, I'd expect the sun4u case
> >> to be more common, in which case it seems a bit more work for the common case to have
> >> to set both slot_reserved_mask_auto and slot_reserved_mask_manual separately. Perhaps
> >> a single accessor function can be used to set both mask values together for a PCIBus?
> > 
> > My immediate thought as a way to avoid needing to set both masks in the
> > sun4u machine would be to add an initialization function that defines the
> > relationship between the two masks. The sun4u machine would use a default
> > function that simply sets the manual mask equal to the auto mask. In the
> > special case of xen, the manual mask would be set to 0.
>
> I must admit I wasn't too concerned about having two separate masks, more that in the 
> common case you would have to remember to call two functions. I was thinking that 
> instead of having separate pci_bus_set_slot_reserved_mask_auto() and 
> pci_bus_set_slot_reserved_mask_manual() accessors, you could just have:
>
>    pci_bus_set_slot_reserved_mask(uint32_t auto_mask, uint32_t manual_mask);
>
> since that gives a single function call for all cases, and it seems fairly intuitive 
> what pci_bus_set_slot_reserved_mask(foo, foo) is doing vs. 
> pci_bus_set_slot_reserved_mask(foo, bar).

That looks good to me. I can implement it with the value for each mask
passed as separate arguments of a single function.

I think ultimately, both the sun4u machine and the xenfv machine with
the Intel igd are unique cases, and I don't think one is necessarily more
common that the other. In fact, I agree with Michael that the requirements
of the xenfv machine with Intel igd are different enough from the requirements
of the sun4u machine that it makes sense to use two independent mechanisms
to accommodate each case. For example, in the case of the Intel igd, slot
reservation is not to prevent all pci devices from using the slot but only to
reserve the slot for a particular device: the Intel igd. So, from the point of
view of what is needed for the Intel igd, slot_reserved_mask for
the case of the sun4u machine really means slot_unavailable_mask, not
slot_reserved_mask. Ideally, the kind of mask that the Intel igd needs is
one that releases for the slot for use when the particular device that
is requesting the slot is the actual device the slot is reserved for, which
is more complicated to implement than the single 32-bit mask that works
well for the sun4u machine. Specifically, it needs more information than just
the devfn value to decide whether or not to release the slot for use.

I think that in the long term, it might be best to try to collect all the unique
quirks of the Intel igd into a special pci-host device that both kvm (with legacy
passthrough mode) and xen can use, but that could not be accomplished in
time for the 8.0 release.

I will have v3 ready later today or tomorrow.

Kind regards,

Chuck

