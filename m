Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206230FB72
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 19:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81403.150430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7jPl-0002oD-KF; Thu, 04 Feb 2021 18:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81403.150430; Thu, 04 Feb 2021 18:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7jPl-0002np-Fg; Thu, 04 Feb 2021 18:31:37 +0000
Received: by outflank-mailman (input) for mailman id 81403;
 Thu, 04 Feb 2021 18:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+ZK=HG=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1l7jPk-0002nk-05
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 18:31:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e56288-507c-4de7-9684-54f967ad26a9;
 Thu, 04 Feb 2021 18:31:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B002464F58
 for <xen-devel@lists.xenproject.org>; Thu,  4 Feb 2021 18:31:33 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z22so5400125edb.9
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 10:31:33 -0800 (PST)
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
X-Inumbo-ID: 79e56288-507c-4de7-9684-54f967ad26a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612463494;
	bh=/bh8XlhA+JNa4dohvJBRDXcaAfqBsnpkGE0rzhB8TAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bM9sM/pVXS9QSTwnD2yjn6N3dmJFrWzVH7itdfQ51i7URmPEDFCeXvEcEbLiJ27zV
	 IjfQoyG0qCTobz/loZJAWCOLto5VKS3Tt1ELgfljYqP/w7R2KZscf+UBTUpEluowzq
	 o09VvuPx/gijSEAe6Mk180yKGCWZlLDYo49F95N5n8FqXJMS2Jakh8kYqsT8b+UAGx
	 J7PFSg6HJk+SOWcIQYC0Bm4+8JKYyS8zWI4zd0sO/P4OUX9059dAWp6OZP477329cq
	 8bmQe5JMScgUVuESpTkETXIi00qJhAy+kpaCYRVMCOMQTOwOVs47/r6uwRR8pIWtQM
	 EWz0G90/Cny9Q==
X-Gm-Message-State: AOAM533Rl9weCtft8vjDfANTB+wQ3/ZG/TbE9Uu21ld8/dQjpcALJmvs
	QJnpSilnqXDwOR4yGq6d54mABQ15xNqgnghUKA==
X-Google-Smtp-Source: ABdhPJyTeTqt3wsKaS/LrOi4IKSEE9n34P3nXMK2EJsB2x4I4qtYzH+lCd1prfobtzo3uz2Ejn8KXs+1hFxMkwUWmt8=
X-Received: by 2002:a50:ee10:: with SMTP id g16mr329305eds.62.1612463492094;
 Thu, 04 Feb 2021 10:31:32 -0800 (PST)
MIME-Version: 1.0
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
 <b6d342f8-c833-db88-9808-cdc946999300@xen.org> <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s>
 <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org> <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
 <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s>
 <9b97789b-5560-0186-642a-0501789830e5@xen.org> <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Feb 2021 12:31:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com>
Message-ID: <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com>
Subject: Re: Question on PCIe Device Tree bindings, Was: [PATCH] xen/arm:
 domain_build: Ignore device nodes with invalid addresses
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>, Elliott Mitchell <ehem+xen@m5p.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, julien@xen.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 11:56 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi Rob,
>
> We have a question on the PCIe device tree bindings. In summary, we have
> come across the Raspberry Pi 4 PCIe description below:
>
>
> pcie0: pcie@7d500000 {
>    compatible = "brcm,bcm2711-pcie";
>    reg = <0x0 0x7d500000  0x0 0x9310>;
>    device_type = "pci";
>    #address-cells = <3>;
>    #interrupt-cells = <1>;
>    #size-cells = <2>;
>    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
>    interrupt-names = "pcie", "msi";
>    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
>    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
>                                                      IRQ_TYPE_LEVEL_HIGH>;
>    msi-controller;
>    msi-parent = <&pcie0>;
>
>    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
>              0x0 0x40000000>;
>    /*
>     * The wrapper around the PCIe block has a bug
>     * preventing it from accessing beyond the first 3GB of
>     * memory.
>     */
>    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
>                  0x0 0xc0000000>;
>    brcm,enable-ssc;
>
>    pci@1,0 {
>            #address-cells = <3>;
>            #size-cells = <2>;
>            ranges;
>
>            reg = <0 0 0 0 0>;
>
>            usb@1,0 {
>                    reg = <0x10000 0 0 0 0>;
>                    resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
>            };
>    };
> };
>
>
> Xen fails to parse it with an error because it tries to remap reg =
> <0x10000 0 0 0 0> as if it was a CPU address and of course it fails.
>
> Reading the device tree description in details, I cannot tell if Xen has
> a bug: the ranges property under pci@1,0 means that pci@1,0 is treated
> like a default bus (not a PCI bus), hence, the children regs are
> translated using the ranges property of the parent (pcie@7d500000).
>
> Is it possible that the device tree is missing device_type =
> "pci" under pci@1,0? Or is it just implied because pci@1,0 is a child of
> pcie@7d500000?

Indeed, it should have device_type. Linux (only recently due to
another missing device_type case) will also look at node name, but
only 'pcie'.

We should be able to create (or extend pci-bus.yaml) a schema to catch
this case.

Rob

> I'd like to make Xen able to parse this device tree without errors but I
> am not sure what is the best way to fix it.
>
> Thanks for any help you can provide!
>
> Cheers,
>
> Stefano
>
>
>
> On Thu, 4 Feb 2021, Julien Grall wrote:
> > On 04/02/2021 00:13, Stefano Stabellini wrote:
> > > On Wed, 3 Feb 2021, Julien Grall wrote:
> > > > On Wed, 3 Feb 2021 at 22:18, Stefano Stabellini <sstabellini@kernel.org>
> > > > wrote:
> > > > > > > But aside from PCIe, let's say that we know of a few nodes for which
> > > > > > > "reg" needs a special treatment. I am not sure it makes sense to
> > > > > > > proceed
> > > > > > > with parsing those nodes without knowing how to deal with that.
> > > > > >
> > > > > > I believe that most of the time the "special" treatment would be to
> > > > > > ignore the
> > > > > > property "regs" as it will not be an CPU memory address.
> > > > > >
> > > > > > > So maybe
> > > > > > > we should add those nodes to skip_matches until we know what to do
> > > > > > > with
> > > > > > > them. At that point, I would imagine we would introduce a special
> > > > > > > handle_device function that knows what to do. In the case of PCIe,
> > > > > > > something like "handle_device_pcie".
> > > > > > Could you outline how "handle_device_pcie()" will differ with
> > > > > > handle_node()?
> > > > > >
> > > > > > In fact, the problem is not the PCIe node directly. Instead, it is the
> > > > > > second
> > > > > > level of nodes below it (i.e usb@...).
> > > > > >
> > > > > > The current implementation of dt_number_of_address() only look at the
> > > > > > bus type
> > > > > > of the parent. As the parent has no bus type and "ranges" then it
> > > > > > thinks this
> > > > > > is something we can translate to a CPU address.
> > > > > >
> > > > > > However, this is below a PCI bus so the meaning of "reg" is completely
> > > > > > different. In this case, we only need to ignore "reg".
> > > > >
> > > > > I see what you are saying and I agree: if we had to introduce a special
> > > > > case for PCI, then  dt_number_of_address() seems to be a good place.  In
> > > > > fact, we already have special PCI handling, see our
> > > > > __dt_translate_address function and xen/common/device_tree.c:dt_busses.
> > > > >
> > > > > Which brings the question: why is this actually failing?
> > > >
> > > > I already hinted at the reason in my previous e-mail :). Let me expand
> > > > a bit more.
> > > >
> > > > >
> > > > > pcie0 {
> > > > >       ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000 0x0
> > > > > 0x40000000>;
> > > > >
> > > > > Which means that PCI addresses 0xc0000000-0x100000000 become
> > > > > 0x600000000-0x700000000.
> > > > >
> > > > > The offending DT is:
> > > > >
> > > > > &pcie0 {
> > > > >           pci@1,0 {
> > > > >                   #address-cells = <3>;
> > > > >                   #size-cells = <2>;
> > > > >                   ranges;
> > > > >
> > > > >                   reg = <0 0 0 0 0>;
> > > > >
> > > > >                   usb@1,0 {
> > > > >                           reg = <0x10000 0 0 0 0>;
> > > > >                           resets = <&reset
> > > > > RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > > > >                   };
> > > > >           };
> > > > > };
> > > > >
> > > > >
> > > > > reg = <0x10000 0 0 0 0> means that usb@1,0 is PCI device 01:00.0.
> > > > > However, the rest of the regs cells are left as zero. It shouldn't be an
> > > > > issue because usb@1,0 is a child of pci@1,0 but pci@1,0 is not a bus.
> > > >
> > > > The property "ranges" is used to define a mapping or translation
> > > > between the address space of the "bus" (here pci@1,0) and the address
> > > > space of the bus node's parent (&pcie0).
> > > > IOW, it means "reg" in usb@1,0 is an address on the PCI bus (i.e. BDF).
> > > >
> > > > The problem is dt_number_of_address() will only look at the "bus" type
> > > > of the parent using dt_match_bus(). This will return the default bus
> > > > (see dt_bus_default_match()), because this is a property "ranges" in
> > > > the parent node (i.e. pci@1,0). Therefore...
> > > >
> > > > > So
> > > > > in theory dt_number_of_address() should already return 0 for it.
> > > >
> > > > ... dt_number_of_address() will return 1 even if the address is not a
> > > > CPU address. So when Xen will try to translate it, it will fail.
> > > >
> > > > >
> > > > > Maybe reg = <0 0 0 0 0> is the problem. In that case, we could simply
> > > > > add a check to skip 0 size ranges. Just a hack to explain what I mean:
> > > >
> > > > The parent of pci@1,0 is a PCI bridge (see the property type), so the
> > > > CPU addresses are found not via "regs" but "assigned-addresses".
> > > >
> > > > In this situation, "regs" will have a different meaning and therefore
> > > > there is no promise that the size will be 0.
> > >
> > > I copy/pasted the following:
> > >
> > >         pci@1,0 {
> > >                 #address-cells = <3>;
> > >                 #size-cells = <2>;
> > >                 ranges;
> > >
> > >                 reg = <0 0 0 0 0>;
> > >
> > >                 usb@1,0 {
> > >                         reg = <0x10000 0 0 0 0>;
> > >                         resets = <&reset
> > >                         RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > >                 };
> > >         };
> > >
> > > under pcie0 in my DTS to see what happens (the node is not there in the
> > > device tree for the rpi-5.9.y kernel.) It results in the expected error:
> > >
> > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > (XEN) Device tree generation failed (-22).
> > >
> > > I could verify that pci@1,0 is seen as "default" bus due to the range
> > > property, thus dt_number_of_address() returns 1.
> > >
> > >
> > > I can see that reg = <0 0 0 0 0> is not a problem because it is ignored
> > > given that the parent is a PCI bus. assigned-addresses is the one that
> > > is read.
> > >
> > >
> > > But from a device tree perspective I am actually confused by the
> > > presence of the "ranges" property under pci@1,0. Is that correct? It is
> > > stating that addresses of children devices will be translated to the
> > > address space of the parent (pcie0) using the parent translation rules.
> > > I mean -- it looks like Xen is right in trying to translate reg =
> > > <0x10000 0 0 0 0> using ranges = <0x02000000 0x0 0xc0000000 0x6
> > > 0x00000000 0x0 0x40000000>.
> > >
> > > Or maybe since pcie0 is a PCI bus all the children addresses, even
> > > grand-children, are expected to be specified using "assigned-addresses"?
> > >
> > >
> > > Looking at other examples [1][2] maybe the mistake is that pci@1,0 is
> > > missing device_type = "pci"?  Of course, if I add that, the error
> > > disappear.
> >
> > I am afraid, I don't know the answer. I think it would be best to ask the
> > Linux DT folks about it.
> >
> > >
> > > [1] Documentation/devicetree/bindings/pci/mvebu-pci.txt
> > > [2] Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > >
> > > For the sake of making Xen more resilient to possible DTSes, maybe we
> > > should try to extend the dt_bus_pci_match check? See for instance the
> > > change below, but we might be able to come up with better ideas.
> > >
> > >
> > > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > > index 18825e333e..24d998f725 100644
> > > --- a/xen/common/device_tree.c
> > > +++ b/xen/common/device_tree.c
> > > @@ -565,12 +565,21 @@ static unsigned int dt_bus_default_get_flags(const
> > > __be32 *addr)
> > >     static bool_t dt_bus_pci_match(const struct dt_device_node *np)
> > >   {
> > > +    bool ret = false;
> > > +
> > >       /*
> > >        * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen
> > > PCI
> > >        * powermacs "ht" is hypertransport
> > >        */
> > > -    return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
> > > +    ret = !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
> > >           !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
> > > +
> > > +    if ( ret ) return ret;
> > > +
> > > +    if ( !strcmp(np->name, "pci") )
> > > +        ret = dt_bus_pci_match(dt_get_parent(np));
> >
> > It is probably safe to assume that a PCI device (not hostbridge) will start
> > with "pci". Although, I don't much like the idea because the name is not meant
> > to be stable.
> >
> > AFAICT, we can only rely on "compatible" and "type".
> >
> > Cheers,
> >
> > --
> > Julien Grall
> >

