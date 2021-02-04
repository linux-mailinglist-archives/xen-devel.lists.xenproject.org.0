Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E357630FFD3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 23:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81453.150612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7mi8-0000WB-8a; Thu, 04 Feb 2021 22:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81453.150612; Thu, 04 Feb 2021 22:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7mi8-0000Vm-5H; Thu, 04 Feb 2021 22:02:48 +0000
Received: by outflank-mailman (input) for mailman id 81453;
 Thu, 04 Feb 2021 22:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7BZ=HG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l7mi7-0000Vh-J7
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 22:02:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa9156d9-ddf9-4dd5-8528-ba17f9e695c0;
 Thu, 04 Feb 2021 22:02:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A58AB64E4A;
 Thu,  4 Feb 2021 22:02:45 +0000 (UTC)
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
X-Inumbo-ID: fa9156d9-ddf9-4dd5-8528-ba17f9e695c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612476166;
	bh=cWpf/sl7YbyXMwRUWefx2vK72Rmt9Pl/ONyCk2nEOfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NLGe0BQfXWA9t2m3IDHzOu/yh3P/E4+OQdrH28O3rMIoQCMMN3UGZ1LxvLwl0zJXA
	 K3GbN4iIv/x5C93bNuL2JHzSGq10UyPgFCTe3Ime4VbkRJXobNWwpY2TGkOHdkAVeZ
	 GDUvG9T4nvGkbu4D9W0VH1p5CkXu8SMzhYYT5gEEkxHtMTzP1Pmy96RhNGUtvbAPzb
	 pzrYvNyoGaleJ/8KU5UfdkBK9HesrLDml9w4jaPme8y45rYzDe83TSQLz9oxUOtja2
	 PKZVTCAnVgsJImOoKe6f8FAksC78XcfvMQG9tLJ6UzWuhW3oCkL0F4anyfHh6v3ksn
	 Q9uHhpfXyZRKA==
Date: Thu, 4 Feb 2021 14:02:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rob Herring <robh@kernel.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    Elliott Mitchell <ehem+xen@m5p.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, julien@xen.org
Subject: Re: Question on PCIe Device Tree bindings, Was: [PATCH] xen/arm:
 domain_build: Ignore device nodes with invalid addresses
In-Reply-To: <CAL_Jsq+cedzG5NBfLRub=msZEK6umBrk-O7FYB=Dk34=k9fuCA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102041359340.29047@sstabellini-ThinkPad-T480s>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org> <b6d342f8-c833-db88-9808-cdc946999300@xen.org> <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s> <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org>
 <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s> <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com> <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s> <9b97789b-5560-0186-642a-0501789830e5@xen.org>
 <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s> <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com> <alpine.DEB.2.21.2102041228560.29047@sstabellini-ThinkPad-T480s> <CAL_JsqKTz8J3txk9W5ekqmfON_g_TdLYsLi0YXYU3rmiyubL2A@mail.gmail.com>
 <alpine.DEB.2.21.2102041309430.29047@sstabellini-ThinkPad-T480s> <CAL_Jsq+cedzG5NBfLRub=msZEK6umBrk-O7FYB=Dk34=k9fuCA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Feb 2021, Rob Herring wrote:
> On Thu, Feb 4, 2021 at 3:33 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > On Thu, Feb 4, 2021 at 2:36 PM Stefano Stabellini
> > > <sstabellini@kernel.org> wrote:
> > > >
> > > > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > > > On Thu, Feb 4, 2021 at 11:56 AM Stefano Stabellini
> > > > > <sstabellini@kernel.org> wrote:
> > > > > >
> > > > > > Hi Rob,
> > > > > >
> > > > > > We have a question on the PCIe device tree bindings. In summary, we have
> > > > > > come across the Raspberry Pi 4 PCIe description below:
> > > > > >
> > > > > >
> > > > > > pcie0: pcie@7d500000 {
> > > > > >    compatible = "brcm,bcm2711-pcie";
> > > > > >    reg = <0x0 0x7d500000  0x0 0x9310>;
> > > > > >    device_type = "pci";
> > > > > >    #address-cells = <3>;
> > > > > >    #interrupt-cells = <1>;
> > > > > >    #size-cells = <2>;
> > > > > >    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> > > > > >                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > > > > >    interrupt-names = "pcie", "msi";
> > > > > >    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > > > > >    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
> > > > > >                                                      IRQ_TYPE_LEVEL_HIGH>;
> > > > > >    msi-controller;
> > > > > >    msi-parent = <&pcie0>;
> > > > > >
> > > > > >    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
> > > > > >              0x0 0x40000000>;
> > > > > >    /*
> > > > > >     * The wrapper around the PCIe block has a bug
> > > > > >     * preventing it from accessing beyond the first 3GB of
> > > > > >     * memory.
> > > > > >     */
> > > > > >    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
> > > > > >                  0x0 0xc0000000>;
> > > > > >    brcm,enable-ssc;
> > > > > >
> > > > > >    pci@1,0 {
> > > > > >            #address-cells = <3>;
> > > > > >            #size-cells = <2>;
> > > > > >            ranges;
> > > > > >
> > > > > >            reg = <0 0 0 0 0>;
> > > > > >
> > > > > >            usb@1,0 {
> > > > > >                    reg = <0x10000 0 0 0 0>;
> > > > > >                    resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > > > > >            };
> > > > > >    };
> > > > > > };
> > > > > >
> > > > > >
> > > > > > Xen fails to parse it with an error because it tries to remap reg =
> > > > > > <0x10000 0 0 0 0> as if it was a CPU address and of course it fails.
> > > > > >
> > > > > > Reading the device tree description in details, I cannot tell if Xen has
> > > > > > a bug: the ranges property under pci@1,0 means that pci@1,0 is treated
> > > > > > like a default bus (not a PCI bus), hence, the children regs are
> > > > > > translated using the ranges property of the parent (pcie@7d500000).
> > > > > >
> > > > > > Is it possible that the device tree is missing device_type =
> > > > > > "pci" under pci@1,0? Or is it just implied because pci@1,0 is a child of
> > > > > > pcie@7d500000?
> > > > >
> > > > > Indeed, it should have device_type. Linux (only recently due to
> > > > > another missing device_type case) will also look at node name, but
> > > > > only 'pcie'.
> > > > >
> > > > > We should be able to create (or extend pci-bus.yaml) a schema to catch
> > > > > this case.
> > > >
> > > > Ah, that is what I needed to know, thank you!  Is Linux considering a
> > > > node named "pcie" as if it has device_type = "pci"?
> > >
> > > Yes, it was added for Rockchip RK3399 to avoid a DT update and regression.
> > >
> > > > In Xen, also to cover the RPi4 case, maybe I could add a check for the
> > > > node name to be "pci" or "pcie" and if so Xen could assume device_type =
> > > > "pci".
> > >
> > > I assume this never worked for RPi4 (and Linux will have the same
> > > issue), so can't we just update the DT in this case?
> >
> > I am not sure where the DT is coming from, probably from the RPi4 kernel
> > trees or firmware. I think it would be good if somebody got in touch to
> > tell them they have an issue.
> 
> So you just take whatever downstream RPi invents? Good luck.

Ehm, yes, I know what you are talking about :-D

We don't promise to support downstream kernels and device trees but
fortunately they work most of the time.


> > Elliot, where was that device tree coming from originally?
> >
> >
> > From a Xen perspective, for the sake of minimizing user pains (given
> > that it might take a while to update those DTs) and to introduce as few
> > ties as possible with kernel versions, it might be best to add the
> > "pci" name workaround maybe with a /* HACK */ comment on top.
> 
> There is some possibility of that causing a regression on another
> platform. That's why we limited Linux as much as possible and also
> print a warning. But we have to worry about 20 year old PowerMacs and
> such.

I see, that makes sense. Printing a warning is very sensible.

