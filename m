Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FD23F70F
	for <lists+xen-devel@lfdr.de>; Sat,  8 Aug 2020 11:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4L8t-0004Ck-Qm; Sat, 08 Aug 2020 09:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dy1V=BS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1k4L8s-0004Cf-Fr
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2020 09:27:54 +0000
X-Inumbo-ID: 031871fd-48f7-4811-8c24-e225470a8786
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 031871fd-48f7-4811-8c24-e225470a8786;
 Sat, 08 Aug 2020 09:27:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l2so3737700wrc.7
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2020 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ju3yrQZ0C1jwOZhE8FGnux8NGFbcKUy7GP+6ib/P3Kc=;
 b=bzpIOwx7Ehg1yiS5w71jAsJTQEbGkslshrb5+yA68wbm7MaPIS0dIMrFu4dVT+XNVz
 PnNY+xAzrphGUSxABu7YqkPzFG+E7bntRGlEjUjuskeDGIPOyysosMYL3BSqAnv0lKIO
 TfD3LlOjjqTbfIQiBxkVkoS31FgGUo320gKKHealciQgTI2xwToK6nEwsgtq9QkVk1IC
 yrbOe5RurM/39ooeu5XrYv8jAz23FvG1YMAJ0+1ZTri8H6wNfsWogr30bwXPZQiHe/xK
 OUWmRcF3LH4ViTL5iEDv9DAnJUohEnLBdQNySrTDetVf0cdBDZ+J6tPPlC0Q8AaLhWcN
 F3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ju3yrQZ0C1jwOZhE8FGnux8NGFbcKUy7GP+6ib/P3Kc=;
 b=Kt29g0fP8NdFq1LFiVkLiJsNacCONpmWFz+m0pju3PLxR8SCABH8w8GgRA/Vbs+9hB
 PJzPPIwWEnvDvazepnW41e+uIueTh9PmMHBwu4JT9UvfBlSdAcIsX5XifWiYlO3SydF/
 o0+JZOEnZmq0swBeBKj4WXtkBK/KPO+hNOqvHOD5pBnXxJDJVSEk4YynIBxEPkVlqDrk
 n0jh5+qeHwj2oRSFInGgoyYI/7XmeQxG3KxZwBQpxYXxXjD3wSllAt87ZmbcZycmnO2K
 jyDTdrEKymP0V0tvlP3VEuH8vOB7FLzm0W9EGZ402HKw3R/dcEMQw22+IlSQbzmluhSu
 TeGg==
X-Gm-Message-State: AOAM530n8xPz3DSlLfVRPBpefBaF8pfH9pYYu2bpFLwCL/D7CvxQarix
 cZL4YzzRwEim1rmMjlig2zDEsfGitfoSWqpZJ9M=
X-Google-Smtp-Source: ABdhPJxJ7os9jqo3lo/nNhaxlO/y9jQ20LSeqUNX7vobMskl1936iKRAa0YDth22YeiHT+GAA0cvTZp9ZyS9DINn0xU=
X-Received: by 2002:a5d:43c4:: with SMTP id v4mr16377578wrr.426.1596878872101; 
 Sat, 08 Aug 2020 02:27:52 -0700 (PDT)
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
In-Reply-To: <alpine.DEB.2.21.2008071253520.16004@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 8 Aug 2020 10:27:40 +0100
Message-ID: <CAJ=z9a3ngzDS6Fu5DwdRSzWaMASPgp3cZLnpazMQzUbH-9_EEw@mail.gmail.com>
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

On Fri, 7 Aug 2020 at 22:51, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Fri, 7 Aug 2020, Jan Beulich wrote:
> > On 07.08.2020 01:49, Stefano Stabellini wrote:
> > > On Thu, 6 Aug 2020, Julien Grall wrote:
> > >> On 06/08/2020 01:37, Stefano Stabellini wrote:
> > >>> On Wed, 5 Aug 2020, Julien Grall wrote:
> > >>>> On 05/08/2020 00:22, Stefano Stabellini wrote:
> > >>>>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> > >>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > >>>>>>
> > >>>>>> This patch adds ability to the device emulator to notify otherend
> > >>>>>> (some entity running in the guest) using a SPI and implements Arm
> > >>>>>> specific bits for it. Proposed interface allows emulator to set
> > >>>>>> the logical level of a one of a domain's IRQ lines.
> > >>>>>>
> > >>>>>> Please note, this is a split/cleanup of Julien's PoC:
> > >>>>>> "Add support for Guest IO forwarding to a device emulator"
> > >>>>>>
> > >>>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> > >>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > >>>>>> ---
> > >>>>>>    tools/libs/devicemodel/core.c                   | 18
> > >>>>>> ++++++++++++++++++
> > >>>>>>    tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
> > >>>>>>    tools/libs/devicemodel/libxendevicemodel.map    |  1 +
> > >>>>>>    xen/arch/arm/dm.c                               | 22
> > >>>>>> +++++++++++++++++++++-
> > >>>>>>    xen/common/hvm/dm.c                             |  1 +
> > >>>>>>    xen/include/public/hvm/dm_op.h                  | 15
> > >>>>>> +++++++++++++++
> > >>>>>>    6 files changed, 60 insertions(+), 1 deletion(-)
> > >>>>>>
> > >>>>>> diff --git a/tools/libs/devicemodel/core.c
> > >>>>>> b/tools/libs/devicemodel/core.c
> > >>>>>> index 4d40639..30bd79f 100644
> > >>>>>> --- a/tools/libs/devicemodel/core.c
> > >>>>>> +++ b/tools/libs/devicemodel/core.c
> > >>>>>> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
> > >>>>>>        return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> > >>>>>>    }
> > >>>>>>    +int xendevicemodel_set_irq_level(
> > >>>>>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> > >>>>>> +    unsigned int level)
> > >>>>>
> > >>>>> It is a pity that having xen_dm_op_set_pci_intx_level and
> > >>>>> xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> > >>>>> the names alone I don't think we can reuse either of them.
> > >>>>
> > >>>> The problem is not the name...
> > >>>>
> > >>>>>
> > >>>>> It is very similar to set_isa_irq_level. We could almost rename
> > >>>>> xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> > >>>>> better, just add an alias to it so that xendevicemodel_set_irq_level is
> > >>>>> implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> > >>>>> not sure if it is worth doing it though. Any other opinions?
> > >>>>
> > >>>> ... the problem is the interrupt field is only 8-bit. So we would only be
> > >>>> able
> > >>>> to cover IRQ 0 - 255.
> > >>>
> > >>> Argh, that's not going to work :-(  I wasn't sure if it was a good idea
> > >>> anyway.
> > >>>
> > >>>
> > >>>> It is not entirely clear how the existing subop could be extended without
> > >>>> breaking existing callers.
> > >>>>
> > >>>>> But I think we should plan for not needing two calls (one to set level
> > >>>>> to 1, and one to set it to 0):
> > >>>>> https://marc.info/?l=xen-devel&m=159535112027405
> > >>>>
> > >>>> I am not sure to understand your suggestion here? Are you suggesting to
> > >>>> remove
> > >>>> the 'level' parameter?
> > >>>
> > >>> My hope was to make it optional to call the hypercall with level = 0,
> > >>> not necessarily to remove 'level' from the struct.
> > >>
> > >> From my understanding, the hypercall is meant to represent the status of the
> > >> line between the device and the interrupt controller (either low or high).
> > >>
> > >> This is then up to the interrupt controller to decide when the interrupt is
> > >> going to be fired:
> > >>   - For edge interrupt, this will fire when the line move from low to high (or
> > >> vice versa).
> > >>   - For level interrupt, this will fire when line is high (assuming level
> > >> trigger high) and will keeping firing until the device decided to lower the
> > >> line.
> > >>
> > >> For a device, it is common to keep the line high until an OS wrote to a
> > >> specific register.
> > >>
> > >> Furthermore, technically, the guest OS is in charge to configure how an
> > >> interrupt is triggered. Admittely this information is part of the DT, but
> > >> nothing prevent a guest to change it.
> > >>
> > >> As side note, we have a workaround in Xen for some buggy DT (see the arch
> > >> timer) exposing the wrong trigger type.
> > >>
> > >> Because of that, I don't really see a way to make optional. Maybe you have
> > >> something different in mind?
> > >
> > > For level, we need the level parameter. For edge, we are only interested
> > > in the "edge", right?
> >
> > I don't think so, unless Arm has special restrictions. Edges can be
> > both rising and falling ones.
>
> And the same is true for level interrupts too: they could be active-low
> or active-high.
>
>
> Instead of modelling the state of the line, which seems to be a bit
> error prone especially in the case of a single-device emulator that
> might not have enough information about the rest of the system (it might
> not know if the interrupt is active-high or active-low), we could model
> the triggering of the interrupt instead.

I am not sure to understand why the single (or event multiple) device
emulator needs to know the trigger type. The information of the
trigger type of the interrupt would be described in the firmware table
and it is expected to be the same as what the emulator expects.

If the guest OS decided to configure wrongly the interrupt trigger
type, then it may not work properly. But, from my understanding, this
doesn't differ from the HW behavior.

>
> In the case of level=1, it would mean that the interrupt line is active,
> no matter if it is active-low or active-high. In the case of level=0, it
> would mean that it is inactive.
>
> Similarly, in the case of an edge interrupt edge=1 or level=1 would mean
> that there is an edge, no matter if it is rising or falling.

TBH, I think your approach is only going to introduce more headache in
Xen if a guest OS decides to change the trigger type.

It feels much easier to just ask the emulator to let us know the level
of the line. Then if the guest OS decides to change the trigger type,
we only need to resample the line.

Cheers,

