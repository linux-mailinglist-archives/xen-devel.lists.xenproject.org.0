Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415123F70E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Aug 2020 11:29:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4LA0-0004HJ-6c; Sat, 08 Aug 2020 09:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dy1V=BS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1k4L9y-0004HC-Ho
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2020 09:29:02 +0000
X-Inumbo-ID: ca6223c5-20e5-4a18-92cb-f10a2c4eabbb
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca6223c5-20e5-4a18-92cb-f10a2c4eabbb;
 Sat, 08 Aug 2020 09:29:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so3951277wmi.1
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2020 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6WzWpHmSqGqUrp2Pgfeis/uo0uwjwAVhwvkPXq5ats=;
 b=T7TZ1HJzKxSttopluJmiMP/sVZGRw38XxMJS8i+g7idKWjNm8R5VtT3B5konxXGBKN
 Vf7LPpGaU310x40n5R9qt+NDcz2zBe3mDn1llhKLA/JG+P5TQvw5kxTbmRAPpLK+MR6J
 D4tbZTYxQq+KZVczJnwwWFOHRZX88f//ZAI+0oHYVsl6ulRgOOyAqgeiwqPo10BSoXAt
 LE4GzlaShuFbuUSJV/8QiTk0U80ffZ6v1OgYr8mPr+hY5oqOS+XNixPVLZoW9c5Ob4II
 wPQqbs/sVCGicHMfOTLgvYRUKxkaORDifnrzxD7m34zyNpYRyKYCcDz6OpMLOHIBotAd
 BE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6WzWpHmSqGqUrp2Pgfeis/uo0uwjwAVhwvkPXq5ats=;
 b=DNibVLv4xHleq/aW3TpqkpBsy/hHNTXCKXolZR2YomCOIMDZzE7Bh6myp/Vx30mMZc
 BYMH0YC4h8eUyf5TW5+TTWlYkJLDNgXO4KNuOmvnpRVr7hJqhiva4BDw6FjOe1p2njvI
 Rio4Nqk64bUBXWr7W7UGC0sFtrrJZ1sJ6uwE13XerBn27Bswn8XQqWkg3z2xY9maCiwI
 SGYGppPcY2++7IoXrkwy6tJoDrJXjr3Ni5FMaK3VTmeD1ZBVJ1oD0aXMxbkOQDBfTmqs
 vkfpa8zOwdBw8dH+k9tLCfigPFzyF1g+qa+qPqRvkrqC48g9F9ctn6V80WQD38c5iUrl
 CfWg==
X-Gm-Message-State: AOAM533NtVlJmTbK7M7+PkYaO+cq5QzpDGGXN+W0wzpKGjU9sqtgp0ec
 OPuVACDSpTB3fCixpKG7xPnbX88/NCO7DNR+J4A=
X-Google-Smtp-Source: ABdhPJxj8yb4YF92pDXktjtrNnwhqN3Vr+p4ZKJqEq7lGcxC2r2fbYb/WGExwJn5xiTnkygfvuUGGCMkXMreA6IpHdw=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr16803231wma.79.1596878940561; 
 Sat, 08 Aug 2020 02:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
 <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
 <alpine.DEB.2.21.2008050943300.5748@sstabellini-ThinkPad-T480s>
 <92e2b136-8468-2877-0e8c-c13ff2a0a1fb@xen.org>
 <alpine.DEB.2.21.2008061422300.16004@sstabellini-ThinkPad-T480s>
 <d8aa0f36-d3c4-011a-9ec1-32c1e3118112@suse.com>
 <alpine.DEB.2.21.2008071253520.16004@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3ngzDS6Fu5DwdRSzWaMASPgp3cZLnpazMQzUbH-9_EEw@mail.gmail.com>
In-Reply-To: <CAJ=z9a3ngzDS6Fu5DwdRSzWaMASPgp3cZLnpazMQzUbH-9_EEw@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 8 Aug 2020 10:28:49 +0100
Message-ID: <CAJ=z9a3UKeV90pJ_aPjZiOfpApA+vwFHcoEqLaAUiVMTSLqqCg@mail.gmail.com>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 8 Aug 2020 at 10:27, Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Fri, 7 Aug 2020 at 22:51, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Fri, 7 Aug 2020, Jan Beulich wrote:
> > > On 07.08.2020 01:49, Stefano Stabellini wrote:
> > > > On Thu, 6 Aug 2020, Julien Grall wrote:
> > > >> On 06/08/2020 01:37, Stefano Stabellini wrote:
> > > >>> On Wed, 5 Aug 2020, Julien Grall wrote:
> > > >>>> On 05/08/2020 00:22, Stefano Stabellini wrote:
> > > >>>>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> > > >>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > >>>>>>
> > > >>>>>> This patch adds ability to the device emulator to notify otherend
> > > >>>>>> (some entity running in the guest) using a SPI and implements Arm
> > > >>>>>> specific bits for it. Proposed interface allows emulator to set
> > > >>>>>> the logical level of a one of a domain's IRQ lines.
> > > >>>>>>
> > > >>>>>> Please note, this is a split/cleanup of Julien's PoC:
> > > >>>>>> "Add support for Guest IO forwarding to a device emulator"
> > > >>>>>>
> > > >>>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > >>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > >>>>>> ---
> > > >>>>>>    tools/libs/devicemodel/core.c                   | 18
> > > >>>>>> ++++++++++++++++++
> > > >>>>>>    tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
> > > >>>>>>    tools/libs/devicemodel/libxendevicemodel.map    |  1 +
> > > >>>>>>    xen/arch/arm/dm.c                               | 22
> > > >>>>>> +++++++++++++++++++++-
> > > >>>>>>    xen/common/hvm/dm.c                             |  1 +
> > > >>>>>>    xen/include/public/hvm/dm_op.h                  | 15
> > > >>>>>> +++++++++++++++
> > > >>>>>>    6 files changed, 60 insertions(+), 1 deletion(-)
> > > >>>>>>
> > > >>>>>> diff --git a/tools/libs/devicemodel/core.c
> > > >>>>>> b/tools/libs/devicemodel/core.c
> > > >>>>>> index 4d40639..30bd79f 100644
> > > >>>>>> --- a/tools/libs/devicemodel/core.c
> > > >>>>>> +++ b/tools/libs/devicemodel/core.c
> > > >>>>>> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
> > > >>>>>>        return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> > > >>>>>>    }
> > > >>>>>>    +int xendevicemodel_set_irq_level(
> > > >>>>>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> > > >>>>>> +    unsigned int level)
> > > >>>>>
> > > >>>>> It is a pity that having xen_dm_op_set_pci_intx_level and
> > > >>>>> xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> > > >>>>> the names alone I don't think we can reuse either of them.
> > > >>>>
> > > >>>> The problem is not the name...
> > > >>>>
> > > >>>>>
> > > >>>>> It is very similar to set_isa_irq_level. We could almost rename
> > > >>>>> xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> > > >>>>> better, just add an alias to it so that xendevicemodel_set_irq_level is
> > > >>>>> implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> > > >>>>> not sure if it is worth doing it though. Any other opinions?
> > > >>>>
> > > >>>> ... the problem is the interrupt field is only 8-bit. So we would only be
> > > >>>> able
> > > >>>> to cover IRQ 0 - 255.
> > > >>>
> > > >>> Argh, that's not going to work :-(  I wasn't sure if it was a good idea
> > > >>> anyway.
> > > >>>
> > > >>>
> > > >>>> It is not entirely clear how the existing subop could be extended without
> > > >>>> breaking existing callers.
> > > >>>>
> > > >>>>> But I think we should plan for not needing two calls (one to set level
> > > >>>>> to 1, and one to set it to 0):
> > > >>>>> https://marc.info/?l=xen-devel&m=159535112027405
> > > >>>>
> > > >>>> I am not sure to understand your suggestion here? Are you suggesting to
> > > >>>> remove
> > > >>>> the 'level' parameter?
> > > >>>
> > > >>> My hope was to make it optional to call the hypercall with level = 0,
> > > >>> not necessarily to remove 'level' from the struct.
> > > >>
> > > >> From my understanding, the hypercall is meant to represent the status of the
> > > >> line between the device and the interrupt controller (either low or high).
> > > >>
> > > >> This is then up to the interrupt controller to decide when the interrupt is
> > > >> going to be fired:
> > > >>   - For edge interrupt, this will fire when the line move from low to high (or
> > > >> vice versa).
> > > >>   - For level interrupt, this will fire when line is high (assuming level
> > > >> trigger high) and will keeping firing until the device decided to lower the
> > > >> line.
> > > >>
> > > >> For a device, it is common to keep the line high until an OS wrote to a
> > > >> specific register.
> > > >>
> > > >> Furthermore, technically, the guest OS is in charge to configure how an
> > > >> interrupt is triggered. Admittely this information is part of the DT, but
> > > >> nothing prevent a guest to change it.
> > > >>
> > > >> As side note, we have a workaround in Xen for some buggy DT (see the arch
> > > >> timer) exposing the wrong trigger type.
> > > >>
> > > >> Because of that, I don't really see a way to make optional. Maybe you have
> > > >> something different in mind?
> > > >
> > > > For level, we need the level parameter. For edge, we are only interested
> > > > in the "edge", right?
> > >
> > > I don't think so, unless Arm has special restrictions. Edges can be
> > > both rising and falling ones.
> >
> > And the same is true for level interrupts too: they could be active-low
> > or active-high.
> >
> >
> > Instead of modelling the state of the line, which seems to be a bit
> > error prone especially in the case of a single-device emulator that
> > might not have enough information about the rest of the system (it might
> > not know if the interrupt is active-high or active-low), we could model
> > the triggering of the interrupt instead.
>
> I am not sure to understand why the single (or event multiple) device
> emulator needs to know the trigger type. The information of the

I mean trigger type configured by the OS here. Sorry for the confusion.

> trigger type of the interrupt would be described in the firmware table
> and it is expected to be the same as what the emulator expects.
>
> If the guest OS decided to configure wrongly the interrupt trigger
> type, then it may not work properly. But, from my understanding, this
> doesn't differ from the HW behavior.
>
> >
> > In the case of level=1, it would mean that the interrupt line is active,
> > no matter if it is active-low or active-high. In the case of level=0, it
> > would mean that it is inactive.
> >
> > Similarly, in the case of an edge interrupt edge=1 or level=1 would mean
> > that there is an edge, no matter if it is rising or falling.
>
> TBH, I think your approach is only going to introduce more headache in
> Xen if a guest OS decides to change the trigger type.
>
> It feels much easier to just ask the emulator to let us know the level
> of the line. Then if the guest OS decides to change the trigger type,
> we only need to resample the line.
>
> Cheers,

