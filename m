Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41F30E644
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 23:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81082.149166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7R18-0001XL-S1; Wed, 03 Feb 2021 22:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81082.149166; Wed, 03 Feb 2021 22:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7R18-0001Wy-OW; Wed, 03 Feb 2021 22:52:58 +0000
Received: by outflank-mailman (input) for mailman id 81082;
 Wed, 03 Feb 2021 22:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JooJ=HF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l7R17-0001Wt-BO
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 22:52:57 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fbccfa8-004a-47c0-a63a-435a22cef54f;
 Wed, 03 Feb 2021 22:52:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i8so1789124ejc.7
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 14:52:56 -0800 (PST)
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
X-Inumbo-ID: 9fbccfa8-004a-47c0-a63a-435a22cef54f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zQdBrKtgGLyifz0oCElzsKWKMiI4DTiGlD3rvY/pxE=;
        b=B5m0jCQ2E+yFUzruzcZ4MXywRVfHVhQ/IYPCZslNwqu/8UKRc/32nODVf2T7BLMbtE
         3ffIdPLp61Jp4TvvV8YZMxxmX5MUrh19vVDRU1UcDl6bbTH42M28i+UF6zO9yWbHee5p
         RG0uOSiV/2zq1K9aaToFINxnKHJpZ/Q64Xx9JQFeoYiSvUQfHFBGnn0/J8N/N4osk/X7
         DB3xfcKVOryolYmvLgcC6YUtyPuXCrC/bN1N/Wj9jqBj1STMzI+DXypdGE/iwF44TtVX
         lzfQOiZJEiXMzZLFlUKLkA4yYgzs/RWj0uB0Tse4f9VedmnCoqMPrpIpDQaJCfiy7yIO
         hpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zQdBrKtgGLyifz0oCElzsKWKMiI4DTiGlD3rvY/pxE=;
        b=BilX6usGwCiYhnVUOAcgpuNbd9x1/ys9k509g07H1lCDf5j4hvUp03QsnvOeDvZQiO
         KsP6ZURjXKusdrzrP2x4ZjTN94CXLEt33bvQOpaKU8nAyFoxZL5DiMhmjfQxdHVlr8OM
         c0lbWVzKP2AAhhowajKBZDl59ZFoXmpIB0VJ7G30pZ6Q9I5i0U7GrOZlZgWrbIb90kCn
         O5Zsj36wKBhkD7SEAOdbVuL4XikC88TNONepCNCrVi4UHsgDSF4e3cBukm4CGxURBVl/
         1x8sxQI0ZYmQA+n+XZd1S2eSXDINtdQOanvPNJXSe6QX1rn2umrBw7lFR1FugHsfY3DU
         Uq7g==
X-Gm-Message-State: AOAM533RpvyM3kXpE0y+1Z3s8ZvKgHcrr4Elirmmlnc7OsQqhaqsmjQp
	Z0vyDtIU+1q2MvdKISKvPR3bXRAxwRzpmlINKOw=
X-Google-Smtp-Source: ABdhPJxARiiNuXKrEI4iixbIZqWqrkxh69QtI8L9ODVCc1DVaKnoTNyIPQpCeTfY2EQkb2qmzw7HwYL+zVsGhtdGtGY=
X-Received: by 2002:a17:906:296a:: with SMTP id x10mr5341214ejd.240.1612392775402;
 Wed, 03 Feb 2021 14:52:55 -0800 (PST)
MIME-Version: 1.0
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
 <b6d342f8-c833-db88-9808-cdc946999300@xen.org> <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s>
 <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org> <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 3 Feb 2021 22:52:44 +0000
Message-ID: <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid addresses
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Feb 2021 at 22:18, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > But aside from PCIe, let's say that we know of a few nodes for which
> > > "reg" needs a special treatment. I am not sure it makes sense to proceed
> > > with parsing those nodes without knowing how to deal with that.
> >
> > I believe that most of the time the "special" treatment would be to ignore the
> > property "regs" as it will not be an CPU memory address.
> >
> > > So maybe
> > > we should add those nodes to skip_matches until we know what to do with
> > > them. At that point, I would imagine we would introduce a special
> > > handle_device function that knows what to do. In the case of PCIe,
> > > something like "handle_device_pcie".
> > Could you outline how "handle_device_pcie()" will differ with handle_node()?
> >
> > In fact, the problem is not the PCIe node directly. Instead, it is the second
> > level of nodes below it (i.e usb@...).
> >
> > The current implementation of dt_number_of_address() only look at the bus type
> > of the parent. As the parent has no bus type and "ranges" then it thinks this
> > is something we can translate to a CPU address.
> >
> > However, this is below a PCI bus so the meaning of "reg" is completely
> > different. In this case, we only need to ignore "reg".
>
> I see what you are saying and I agree: if we had to introduce a special
> case for PCI, then  dt_number_of_address() seems to be a good place.  In
> fact, we already have special PCI handling, see our
> __dt_translate_address function and xen/common/device_tree.c:dt_busses.
>
> Which brings the question: why is this actually failing?

I already hinted at the reason in my previous e-mail :). Let me expand
a bit more.

>
> pcie0 {
>      ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000 0x0 0x40000000>;
>
> Which means that PCI addresses 0xc0000000-0x100000000 become 0x600000000-0x700000000.
>
> The offending DT is:
>
> &pcie0 {
>          pci@1,0 {
>                  #address-cells = <3>;
>                  #size-cells = <2>;
>                  ranges;
>
>                  reg = <0 0 0 0 0>;
>
>                  usb@1,0 {
>                          reg = <0x10000 0 0 0 0>;
>                          resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
>                  };
>          };
> };
>
>
> reg = <0x10000 0 0 0 0> means that usb@1,0 is PCI device 01:00.0.
> However, the rest of the regs cells are left as zero. It shouldn't be an
> issue because usb@1,0 is a child of pci@1,0 but pci@1,0 is not a bus.

The property "ranges" is used to define a mapping or translation
between the address space of the "bus" (here pci@1,0) and the address
space of the bus node's parent (&pcie0).
IOW, it means "reg" in usb@1,0 is an address on the PCI bus (i.e. BDF).

The problem is dt_number_of_address() will only look at the "bus" type
of the parent using dt_match_bus(). This will return the default bus
(see dt_bus_default_match()), because this is a property "ranges" in
the parent node (i.e. pci@1,0). Therefore...

> So
> in theory dt_number_of_address() should already return 0 for it.

... dt_number_of_address() will return 1 even if the address is not a
CPU address. So when Xen will try to translate it, it will fail.

>
> Maybe reg = <0 0 0 0 0> is the problem. In that case, we could simply
> add a check to skip 0 size ranges. Just a hack to explain what I mean:

The parent of pci@1,0 is a PCI bridge (see the property type), so the
CPU addresses are found not via "regs" but "assigned-addresses".

In this situation, "regs" will have a different meaning and therefore
there is no promise that the size will be 0.

Cheers,

