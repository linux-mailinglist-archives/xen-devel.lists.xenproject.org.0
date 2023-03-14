Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB16B93D8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509577.785582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3q8-0001Vs-0D; Tue, 14 Mar 2023 12:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509577.785582; Tue, 14 Mar 2023 12:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3q7-0001Se-TB; Tue, 14 Mar 2023 12:33:15 +0000
Received: by outflank-mailman (input) for mailman id 509577;
 Tue, 14 Mar 2023 12:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pc3q6-0001SV-0P
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:33:14 +0000
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600c8895-c264-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 13:33:10 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 12:33:07 +0000
Received: by hermes--production-ne1-759c9b8c64-5jgz9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2645b62b6a81f73ea69fa13b0f6e7b67; 
 Tue, 14 Mar 2023 12:33:03 +0000 (UTC)
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
X-Inumbo-ID: 600c8895-c264-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678797187; bh=Xk0i0xuEOZ/9eGX/krGBJKqMkDa5Rm5nVPV9GA3OwMA=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=c3bZcP+UqSWxQrU8mQxN2gwV9k3HuYNV8JNw1c7UBKQmkPeOv5MR/N2y/R/A5/mXFKxNdKD7DMNeMsbNDAClyRb+FHkmyczHsm7e+u9QbQYlujcOpKrw2RzKwK6fhQZJOnkQ0HZ27l96N0jqU4jDp5rj45lyMU0vPeze9TBGoqyuvaQFNZBysnEt5LNxFy7pYBGc13DWY6NfqAwG882tUwWr0+LPQTKgmPQHIxLtHScrVmC2ODGB1nc6IdVYOk3/s9RhNIJW2HNFjYrvnuRgoXE1IerOB4cpuTgYF1RDZbPYuKij0cLlD1VAigGPLj80Q4fkGH+YrGZ1vfrBRa60hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678797187; bh=nZTim33Ly0Js4zEeEaAiMi8ZyNt6Rl2qZvCTzDSrsFm=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=KCLhs0Qr0h63GdCt7ETCgtAgkfTxP9k34TSJWe3GawwxGPvgpRM4hoNwBnDX1g6kTkL+xg1CunpiFstGJe1FVJjwNzbPwegVmM1Z0h8GfukT9mSOGas4OwzoswJouFFewUfNihkPPzytAMiWb9o+Km/Eu5P01gMm17bvD4mRrQTGBIUQLHQlMjZaGPag2YO9T7Sy279xOvarpXFqG/Umb2jcMs42Aw8M5FsV0TPjhqiKEfQBfpolYQ1XMx5jrCbT4egRs4m8jx3oKfoptdAMnUO76de52RKmyHMGEic8ii7F0ORM659uKElez3HysV3ambJ9irdMq4oojPjletWlOw==
X-YMail-OSG: 0vPLba0VM1l0TfHSyg0AiYN7SxFyxWzCHEV9yt1kc1oNfqZuJotTQPbFnDyAZ79
 iw4wqS_ceiOyT_cdht9F2_Fuo7MlLMS4Iz65Rf6OLqi1dcXbpKVCfMeVxikCov5adGqXseyaujij
 U4uhGx02KbHnbOyUoekbh7vkwXLB4qdvY8HZY1HQffK3s_5PTf3z7cL0OFkI4hWP_qKD9lEyqNce
 1E67FTwjlrIhChVFUCE4G4y6YTJjQ7tH3q67GZePQ5OezNgA6MK2MHhsNlMDNl.t4ESI6HQNx1dP
 dNpXFHLtXnQnj9gvoiH7aFoo_UodjmXYjlBLW9VRxEdjTG.NEHGxv7NMLXapxXelkw6Xwt9Ql_SS
 v02gUcZhruG5e0L8ka7sPTLFXiX2Qd7VE3NoAjpMFWsicuHYW9tfyA5ZcnS.Tvxd7M7MT7y.hzAU
 PRebgY9KC9m1cizK8m.PSdoDnSszJueu7e72FM4mAKcXHqZ_b4dUlWelym3BMXrLnXMSmeGgCkA8
 jwFMZzjrGYg0OtXF5CqEnnJZdbHQfDeo4xaRhPRRKIm.DVbunmX7NfhVMHQm6BpzOPRTU7ob2AP3
 AljRjZCUpEIwKkR1UfSWc.EgkZ.5mFJ2H2ecCvF0zlaLuBTaIrNW64L21IfbHLfTKrBuj.OE5rEo
 d5xsxMI.4mLGmvRVqEQwDqESQfbJfSe_usja0ivLkKVLjJ4zhgUrDv7Cj0x3mCfQLiSeuj7d3DnU
 g82hErigfpk5bgisgbyAunjnZT2JiliTvRTKQtbkufDCBmi0Z_4y.huZ6jE.qBhsACaVXBIoz89E
 N3hPB5p9Sf0jhLuQ.Z_LVjnUNc5fzJ8OPQ1YzADPJfg6fzQ52JeulL6Z6soBdEArPfiuxT2wI_2A
 R0Q29XW7HfxWVvTU9g3cc5fImrkJYkvywbgnrUCWrCUbjMVW6XAgigf63PebtBLJHORmQpoHkXNt
 suzuuWxpYFGFCaAjSe0Vl_o0qwohWDmjq4AN2FKMEaeV6IVE9E03jA4cSRkrGoSVBcRjzyXrUD2Z
 6hVQqcABXQk_vgiWyj0rmO9cjGdPHWW5K1bpTJCTp.olgjFkCYPRCd9Pc4.DtdXp7EP6o.Toa767
 15QWdAdhia80apKmRbynL7AF9IevrFO9_90r1fI5_i8PkfOkFRKF50UkSyGMgivSrtMBNeRetQxT
 fTZXCcf7dX3xy9Ado53X_2IwqlwNdg.6N_5DANHB8mRBLX6S4QWzh1WX2RdkSpkWeO54AmjRyD0t
 DOhKrTWC6khaLSOrGA1PgrBu33EHf2U5T9EaIQzEodjy7iBgRU6JhupxsDQbuURrrR0RXxkZotyb
 1.VNhobFJSCbqijYlUAU_8AJXL2YeeEfh_m8STXjvdMHDzSp9KeWUOUnU3.GQ2456p06WZu4V68O
 nuwQahp4clbRr2EObi88VKui5uqh2jXbDs1y6S0bfh1yjEhuIMynr5HZ.kLXRVJ56udj.9ffqSSP
 RLg6eq2T4Q5GN9nKCtO8Pa4xqrcGX0klDwmt6PLsAn_BVkAqb.F.8vRLP5e1eopyUaVLYrA.NCze
 jvfMEC0RjbprdZ5rV5GhLTazWGy_XSHIQA1.WBW4_A0tKOvShX8Y5s97ew1CJMcO.pe6whScsIzi
 fgsieh0NRvf0IScXYYyEWiR0kW05rIGcBSWzGQ4RzPiRsdUjDKPRMWpIi1a3oy68PTsWxny7Vssh
 ttZkYL7aLw0KB.974sdTQGbSUzhKnyy6lEX8OLqKyWjoeQPIgB6rFSESbRzy4_epiN7li53gqHH0
 U7YFzfQyWvVC_MoZ_cKwqesKcgLuPGFMs3ilqdu7oFC_1s7Ngnc4.GHAN7X8HIUVKwgRLeoLMhP0
 FHim_zQRlQLkZtnmHXUHi1V_KTaeJAj1hbnJXnMB_VCo6QTLQOkL8cheyOeo8dU0c9F_sb3Ja1m5
 .FikrXxphEZXDR9DZRJ1w_zngRvzMLcwTus96PyE4hcA.QYJc1eEW5xX8WefK2_uov.C2As8JVEo
 .elHy6d2.PQvXLXCXwq_PBDDEnEk2ty4hcvLmI9jlQH6REvcnoeFtFx5a_RtLsE9oe8NnXjuIJ2p
 a8O5RA990_rFongMMHzpUh21AtA3OK0.V.NuuOOxT1S8p6NHwcDYvETY0sEDzwmMwV.P0gS.ZQyk
 nQ5EtxDgtWmh5Vemcnz8KkUtTIWxPGXS0dJO6egE2wYFY7g87nx.tpIOvmTjkRaryxcP83xlycBD
 SEygsF_NCPhw-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: c34583c0-6709-408b-ba06-0ca1c1786e29
Message-ID: <ad2741b3-1f5f-8704-d51b-426d3d496811@aol.com>
Date: Tue, 14 Mar 2023 08:33:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230314023148-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21284 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/14/2023 2:33 AM, Michael S. Tsirkin wrote:
> On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> > Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> > uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> > xenfv machine when the guest is configured for igd-passthru.
> > 
> > A desired extension to that commit is to allow use of the reserved slot
> > if the administrator manually configures a device to use the reserved
> > slot. Currently, slot_reserved_mask is enforced unconditionally. With
> > this patch, the pci bus can be configured so the slot is only reserved
> > if the pci device to be added to the bus is configured for automatic
> > slot assignment.
> > 
> > To enable the desired behavior of slot_reserved_mask machine, add a
> > boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> > add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> > called to change the default behavior of always enforcing
> > slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> > when the pci device being added is configured for automatic slot
> > assignment.
> > 
> > Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> > creating the pci bus for the pc/i440fx/xenfv machine type to implement
> > the desired behavior of causing slot_reserved_mask to only apply when
> > the pci device to be added to a pc/i440fx/xenfv machine is configured
> > for automatic slot assignment.
> > 
> > Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> I really dislike this. 
> It seems that xen should not have used slot_reserved_mask,
> and instead needs something new like slot_manual_mask.
> No?

Actually, xen would use something like slot_auto_mask, and
sun4u would use both slot_auto_mask and slot_manual_mask.

Is it just that this patch touches hw/pci-host/i440fx.c that you
don't like or is it that you don't like adding slot_reserved_mask_manual
and pci_bus_ignore_slot_reserved_mask_manual, or is it both
that you don't like?

If it's the former that you don't like, the call to
pci_bus_ignore_slot_reserved_mask_manual can be moved to
xen_igd_reserve_slot in hw/xen/xen_pt.c and this would
avoid touching hw/pci-host/i440fx.c.

If it's the latter that you don't like, both slot_reserved_mask_manual
and pci_bus_ignore_slot_reserved_mask_manual can be removed
and this can be implemented with two independent slot masks:

rename slot_reserved_mask as slot_auto_mask - used by both xen and sun4u
slot_manual_mask - new mask, used only by sun4u.

We would also need to have two sets of accessor functions in this case, one
set to access slot_auto_mask, and the other to access slot_manual_mask.
Since the sun4u machine does not need to either get the value of
slot_manual_mask or clear the slot_manual_mask, slot_manual_mask
would only need to have one accessor function to set the value of the
mask. slot_auto_mask would have all three accessor functions that xen
needs to use.

Would that be OK?

>
> > ---
> > Changelog
> > 
> > v2: Change Subject of patch from
> >     "pci: add enforce_slot_reserved_mask_manual property" To
> >     "pci: allow slot_reserved_mask to be ignored with manual slot assignment"
> > 
> >     Add pci_bus_ignore_slot_reserved_mask_manual function
> > 
> >     Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
> >     in hw/pci-host/i440fx.c
> > 
> >  hw/pci-host/i440fx.c     |  1 +
> >  hw/pci/pci.c             | 14 +++++++++++++-
> >  include/hw/pci/pci.h     |  1 +
> >  include/hw/pci/pci_bus.h |  1 +
> >  4 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> > index 262f82c303..8e00b88926 100644
> > --- a/hw/pci-host/i440fx.c
> > +++ b/hw/pci-host/i440fx.c
> > @@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
> >      s = PCI_HOST_BRIDGE(dev);
> >      b = pci_root_bus_new(dev, NULL, pci_address_space,
> >                           address_space_io, 0, TYPE_PCI_BUS);
> > +    pci_bus_ignore_slot_reserved_mask_manual(b);
> >      s->bus = b;
> >      object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
> >      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 8a87ccc8b0..670ecc6986 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >      assert(PCI_FUNC(devfn_min) == 0);
> >      bus->devfn_min = devfn_min;
> >      bus->slot_reserved_mask = 0x0;
> > +    bus->enforce_slot_reserved_mask_manual = true;
> >      bus->address_space_mem = address_space_mem;
> >      bus->address_space_io = address_space_io;
> >      bus->flags |= PCI_BUS_IS_ROOT;
> > @@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >  }
> >  
> > +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> > +{
> > +    return bus->enforce_slot_reserved_mask_manual &&
> > +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> > +}
> > +
> > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
> > +{
> > +    bus->enforce_slot_reserved_mask_manual = false;
> > +}
> > +
> >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
> >  {
> >      return bus->slot_reserved_mask;
> > @@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >                     "or reserved", name);
> >          return NULL;
> >      found: ;
> > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
> >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >                     " reserved",
> >                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index 935b4b91b4..48d29ec234 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
> >  void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
> >  void pci_bus_irqs_cleanup(PCIBus *bus);
> >  int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
> > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
> >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
> >  void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> >  void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > index 5653175957..e0f15ee9be 100644
> > --- a/include/hw/pci/pci_bus.h
> > +++ b/include/hw/pci/pci_bus.h
> > @@ -37,6 +37,7 @@ struct PCIBus {
> >      void *iommu_opaque;
> >      uint8_t devfn_min;
> >      uint32_t slot_reserved_mask;
> > +    bool enforce_slot_reserved_mask_manual;
> >      pci_set_irq_fn set_irq;
> >      pci_map_irq_fn map_irq;
> >      pci_route_irq_fn route_intx_to_irq;
> > -- 
> > 2.39.2
>


