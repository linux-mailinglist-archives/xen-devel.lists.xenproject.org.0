Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A30310C44
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81733.151138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81bj-0005L8-FM; Fri, 05 Feb 2021 13:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81733.151138; Fri, 05 Feb 2021 13:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81bj-0005Kj-Bo; Fri, 05 Feb 2021 13:57:11 +0000
Received: by outflank-mailman (input) for mailman id 81733;
 Fri, 05 Feb 2021 13:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iq/M=HH=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1l81bi-0005Ke-Ns
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:57:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31e03a70-067d-41de-bb6e-078d1638811f;
 Fri, 05 Feb 2021 13:57:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB8E664FC4
 for <xen-devel@lists.xenproject.org>; Fri,  5 Feb 2021 13:57:08 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id w1so12010459ejf.11
 for <xen-devel@lists.xenproject.org>; Fri, 05 Feb 2021 05:57:08 -0800 (PST)
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
X-Inumbo-ID: 31e03a70-067d-41de-bb6e-078d1638811f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612533429;
	bh=9Mw4lLzsK6vgoXWqjy7jhrlf3iQ42jlD9NTI8s6g9ME=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oPxHGTxejB5ZyMKKS3FS6WldkVjKb43m6862FndaCS+qmBHi56r7mDjG0ZUVn7Xzh
	 l7Y5Lg8yKdOptnYePju90v0eJKyBgnr1C5+fOrvQEIPy7k6NxLz8lMcoolTe2n8W3g
	 OTZiYOOxWvVIAbQZk5y6KZyHTvaZgtNix7MJGXroAeE1q2cYgBzSdY1VSXrxCv+bgd
	 dRF2nCIqGjC3KLFtigeeWWI/2nKolYOO9E+WX6YUyenbSynS4UUbFDCHrAHYF3b7S3
	 YZXXUjDxt5ZFnH5sCctcBEErVnqXy1a4svI86qfFFX6tGZL6YzNNKMv63r7YZskn0c
	 Ztb7UJ3tdrWLg==
X-Gm-Message-State: AOAM530tE3IJ3c6GFDew3cmJgY6T4OYCRSRJpL0rHkc3sD369jsJNuc6
	qEUZKLLE3jIawsHrx4nvdcVYFOKiD+Fh9+qfXg==
X-Google-Smtp-Source: ABdhPJxtN3UjgPOA/NhlcqOiuRYTaIUm9iO77IYbz+Md6xUxQtWW+nAVvuic5OJzV1ZRbOjwDH/UpEvtMQUAbnhbBb4=
X-Received: by 2002:a17:906:4301:: with SMTP id j1mr4102199ejm.108.1612533427315;
 Fri, 05 Feb 2021 05:57:07 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
 <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s>
 <9b97789b-5560-0186-642a-0501789830e5@xen.org> <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s>
 <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com>
 <alpine.DEB.2.21.2102041228560.29047@sstabellini-ThinkPad-T480s>
 <CAL_JsqKTz8J3txk9W5ekqmfON_g_TdLYsLi0YXYU3rmiyubL2A@mail.gmail.com>
 <alpine.DEB.2.21.2102041309430.29047@sstabellini-ThinkPad-T480s>
 <CAL_Jsq+cedzG5NBfLRub=msZEK6umBrk-O7FYB=Dk34=k9fuCA@mail.gmail.com> <YBy8PbYeLEHjcELY@mattapan.m5p.com>
In-Reply-To: <YBy8PbYeLEHjcELY@mattapan.m5p.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Feb 2021 07:56:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKaB+=B-9x0tBoeRkJHR0oD+j_erD36X2fBGsczKthnRQ@mail.gmail.com>
Message-ID: <CAL_JsqKaB+=B-9x0tBoeRkJHR0oD+j_erD36X2fBGsczKthnRQ@mail.gmail.com>
Subject: Re: Question on PCIe Device Tree bindings, Was: [PATCH] xen/arm:
 domain_build: Ignore device nodes with invalid addresses
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall.oss@gmail.com>, 
	Elliott Mitchell <ehem+xen@m5p.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, julien@xen.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:51 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
>
> On Thu, Feb 04, 2021 at 03:52:26PM -0600, Rob Herring wrote:
> > On Thu, Feb 4, 2021 at 3:33 PM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > > On Thu, Feb 4, 2021 at 2:36 PM Stefano Stabellini
> > > > <sstabellini@kernel.org> wrote:
> > > > >
> > > > > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > > > > On Thu, Feb 4, 2021 at 11:56 AM Stefano Stabellini
> > > > > > <sstabellini@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi Rob,
> > > > > > >
> > > > > > > We have a question on the PCIe device tree bindings. In summary, we have
> > > > > > > come across the Raspberry Pi 4 PCIe description below:
> > > > > > >
> > > > > > >
> > > > > > > pcie0: pcie@7d500000 {
> > > > > > >    compatible = "brcm,bcm2711-pcie";
> > > > > > >    reg = <0x0 0x7d500000  0x0 0x9310>;
> > > > > > >    device_type = "pci";
> > > > > > >    #address-cells = <3>;
> > > > > > >    #interrupt-cells = <1>;
> > > > > > >    #size-cells = <2>;
> > > > > > >    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > >                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > >    interrupt-names = "pcie", "msi";
> > > > > > >    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > > > > > >    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
> > > > > > >                                                      IRQ_TYPE_LEVEL_HIGH>;
> > > > > > >    msi-controller;
> > > > > > >    msi-parent = <&pcie0>;
> > > > > > >
> > > > > > >    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
> > > > > > >              0x0 0x40000000>;
> > > > > > >    /*
> > > > > > >     * The wrapper around the PCIe block has a bug
> > > > > > >     * preventing it from accessing beyond the first 3GB of
> > > > > > >     * memory.
> > > > > > >     */
> > > > > > >    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
> > > > > > >                  0x0 0xc0000000>;
> > > > > > >    brcm,enable-ssc;
> > > > > > >
> > > > > > >    pci@1,0 {
> > > > > > >            #address-cells = <3>;
> > > > > > >            #size-cells = <2>;
> > > > > > >            ranges;
> > > > > > >
> > > > > > >            reg = <0 0 0 0 0>;
> > > > > > >
> > > > > > >            usb@1,0 {
> > > > > > >                    reg = <0x10000 0 0 0 0>;
> > > > > > >                    resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > > > > > >            };
> > > > > > >    };
> > > > > > > };
> > > > > > >
> > > > > > >
> > > > > > > Xen fails to parse it with an error because it tries to remap reg =
> > > > > > > <0x10000 0 0 0 0> as if it was a CPU address and of course it fails.
> > > > > > >
> > > > > > > Reading the device tree description in details, I cannot tell if Xen has
> > > > > > > a bug: the ranges property under pci@1,0 means that pci@1,0 is treated
> > > > > > > like a default bus (not a PCI bus), hence, the children regs are
> > > > > > > translated using the ranges property of the parent (pcie@7d500000).
> > > > > > >
> > > > > > > Is it possible that the device tree is missing device_type =
> > > > > > > "pci" under pci@1,0? Or is it just implied because pci@1,0 is a child of
> > > > > > > pcie@7d500000?
> > > > > >
> > > > > > Indeed, it should have device_type. Linux (only recently due to
> > > > > > another missing device_type case) will also look at node name, but
> > > > > > only 'pcie'.
> > > > > >
> > > > > > We should be able to create (or extend pci-bus.yaml) a schema to catch
> > > > > > this case.
> > > > >
> > > > > Ah, that is what I needed to know, thank you!  Is Linux considering a
> > > > > node named "pcie" as if it has device_type = "pci"?
> > > >
> > > > Yes, it was added for Rockchip RK3399 to avoid a DT update and regression.
> > > >
> > > > > In Xen, also to cover the RPi4 case, maybe I could add a check for the
> > > > > node name to be "pci" or "pcie" and if so Xen could assume device_type =
> > > > > "pci".
> > > >
> > > > I assume this never worked for RPi4 (and Linux will have the same
> > > > issue), so can't we just update the DT in this case?
> > >
> > > I am not sure where the DT is coming from, probably from the RPi4 kernel
> > > trees or firmware. I think it would be good if somebody got in touch to
> > > tell them they have an issue.
> >
> > So you just take whatever downstream RPi invents? Good luck.
> >
> > > Elliot, where was that device tree coming from originally?
>
> Please excuse my very weak device-tree fu...
>
> I'm unsure which section is the problem, but looking at `git blame` what
> shows is commt d5c8dc0d4c880fbde5293cc186b1ab23466254c4.
>
> This commit is present in the Linux master branch and the linux-5.10.y
> branch.
>
> You were saying?

That commit looks perfectly fine. The problem is the PCI bridge node
shown above which doesn't exist upstream.

Rob

