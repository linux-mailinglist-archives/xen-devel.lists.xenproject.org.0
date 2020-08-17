Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F269A247AC8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 00:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7o3O-0003aF-C6; Mon, 17 Aug 2020 22:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k7o3M-0003a9-Tz
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 22:56:32 +0000
X-Inumbo-ID: c99bf54b-e505-4b3f-a543-0c4fc690913a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c99bf54b-e505-4b3f-a543-0c4fc690913a;
 Mon, 17 Aug 2020 22:56:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 478402063A;
 Mon, 17 Aug 2020 22:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597704991;
 bh=k3C/CJrDxY91ceuYo1kB0Qc8CBh+q3MptRAsJlanmyg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bhcDxymrsOCDjuz6P4sMQi7sYZMhIyHsAIb1xEwquG33PIGbIgpymBZwHr6slu8SK
 Y9KSqjtCG3oIV38QXEN8CqUz4qOl87pgnEy5lpjjN+NVP8JcGQpyH0s3CpdD7OHwaw
 qO9umVioALMyalhEezUq6adlmuEj+o7Bs5Eou3Rs=
Date: Mon, 17 Aug 2020 15:56:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <21da3195-f43a-ebc7-cbc6-986d5a3a1e67@suse.com>
Message-ID: <alpine.DEB.2.21.2008171502390.15985@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
 <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
 <alpine.DEB.2.21.2008050943300.5748@sstabellini-ThinkPad-T480s>
 <92e2b136-8468-2877-0e8c-c13ff2a0a1fb@xen.org>
 <alpine.DEB.2.21.2008061422300.16004@sstabellini-ThinkPad-T480s>
 <d8aa0f36-d3c4-011a-9ec1-32c1e3118112@suse.com>
 <alpine.DEB.2.21.2008071253520.16004@sstabellini-ThinkPad-T480s>
 <21da3195-f43a-ebc7-cbc6-986d5a3a1e67@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 17 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 23:50, Stefano Stabellini wrote:
> > On Fri, 7 Aug 2020, Jan Beulich wrote:
> >> On 07.08.2020 01:49, Stefano Stabellini wrote:
> >>> On Thu, 6 Aug 2020, Julien Grall wrote:
> >>>> On 06/08/2020 01:37, Stefano Stabellini wrote:
> >>>>> On Wed, 5 Aug 2020, Julien Grall wrote:
> >>>>>> On 05/08/2020 00:22, Stefano Stabellini wrote:
> >>>>>>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> >>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>>>>>
> >>>>>>>> This patch adds ability to the device emulator to notify otherend
> >>>>>>>> (some entity running in the guest) using a SPI and implements Arm
> >>>>>>>> specific bits for it. Proposed interface allows emulator to set
> >>>>>>>> the logical level of a one of a domain's IRQ lines.
> >>>>>>>>
> >>>>>>>> Please note, this is a split/cleanup of Julien's PoC:
> >>>>>>>> "Add support for Guest IO forwarding to a device emulator"
> >>>>>>>>
> >>>>>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> >>>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>>>>> ---
> >>>>>>>>    tools/libs/devicemodel/core.c                   | 18
> >>>>>>>> ++++++++++++++++++
> >>>>>>>>    tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
> >>>>>>>>    tools/libs/devicemodel/libxendevicemodel.map    |  1 +
> >>>>>>>>    xen/arch/arm/dm.c                               | 22
> >>>>>>>> +++++++++++++++++++++-
> >>>>>>>>    xen/common/hvm/dm.c                             |  1 +
> >>>>>>>>    xen/include/public/hvm/dm_op.h                  | 15
> >>>>>>>> +++++++++++++++
> >>>>>>>>    6 files changed, 60 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/tools/libs/devicemodel/core.c
> >>>>>>>> b/tools/libs/devicemodel/core.c
> >>>>>>>> index 4d40639..30bd79f 100644
> >>>>>>>> --- a/tools/libs/devicemodel/core.c
> >>>>>>>> +++ b/tools/libs/devicemodel/core.c
> >>>>>>>> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
> >>>>>>>>        return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> >>>>>>>>    }
> >>>>>>>>    +int xendevicemodel_set_irq_level(
> >>>>>>>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> >>>>>>>> +    unsigned int level)
> >>>>>>>
> >>>>>>> It is a pity that having xen_dm_op_set_pci_intx_level and
> >>>>>>> xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> >>>>>>> the names alone I don't think we can reuse either of them.
> >>>>>>
> >>>>>> The problem is not the name...
> >>>>>>
> >>>>>>>
> >>>>>>> It is very similar to set_isa_irq_level. We could almost rename
> >>>>>>> xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> >>>>>>> better, just add an alias to it so that xendevicemodel_set_irq_level is
> >>>>>>> implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> >>>>>>> not sure if it is worth doing it though. Any other opinions?
> >>>>>>
> >>>>>> ... the problem is the interrupt field is only 8-bit. So we would only be
> >>>>>> able
> >>>>>> to cover IRQ 0 - 255.
> >>>>>
> >>>>> Argh, that's not going to work :-(  I wasn't sure if it was a good idea
> >>>>> anyway.
> >>>>>
> >>>>>
> >>>>>> It is not entirely clear how the existing subop could be extended without
> >>>>>> breaking existing callers.
> >>>>>>
> >>>>>>> But I think we should plan for not needing two calls (one to set level
> >>>>>>> to 1, and one to set it to 0):
> >>>>>>> https://marc.info/?l=xen-devel&m=159535112027405
> >>>>>>
> >>>>>> I am not sure to understand your suggestion here? Are you suggesting to
> >>>>>> remove
> >>>>>> the 'level' parameter?
> >>>>>
> >>>>> My hope was to make it optional to call the hypercall with level = 0,
> >>>>> not necessarily to remove 'level' from the struct.
> >>>>
> >>>> From my understanding, the hypercall is meant to represent the status of the
> >>>> line between the device and the interrupt controller (either low or high).
> >>>>
> >>>> This is then up to the interrupt controller to decide when the interrupt is
> >>>> going to be fired:
> >>>>   - For edge interrupt, this will fire when the line move from low to high (or
> >>>> vice versa).
> >>>>   - For level interrupt, this will fire when line is high (assuming level
> >>>> trigger high) and will keeping firing until the device decided to lower the
> >>>> line.
> >>>>
> >>>> For a device, it is common to keep the line high until an OS wrote to a
> >>>> specific register.
> >>>>
> >>>> Furthermore, technically, the guest OS is in charge to configure how an
> >>>> interrupt is triggered. Admittely this information is part of the DT, but
> >>>> nothing prevent a guest to change it.
> >>>>
> >>>> As side note, we have a workaround in Xen for some buggy DT (see the arch
> >>>> timer) exposing the wrong trigger type.
> >>>>
> >>>> Because of that, I don't really see a way to make optional. Maybe you have
> >>>> something different in mind?
> >>>
> >>> For level, we need the level parameter. For edge, we are only interested
> >>> in the "edge", right?
> >>
> >> I don't think so, unless Arm has special restrictions. Edges can be
> >> both rising and falling ones.
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
> > 
> > In the case of level=1, it would mean that the interrupt line is active,
> > no matter if it is active-low or active-high. In the case of level=0, it
> > would mean that it is inactive.
> > 
> > Similarly, in the case of an edge interrupt edge=1 or level=1 would mean
> > that there is an edge, no matter if it is a rising or falling.
> 
> Am I understanding right that you propose to fold two properties into
> a single bit?

I don't think I understand what are the two properties that my proposal
is merging into a single bit.

The hypercall specifies the state of the line in terms of "high" and
"low". My proposal is to replace it with "fire the interrupt" for edge
interrupts, and "interrupt enabled/disabled" for level, abstracting away
the state of the line in terms of high/low and instead focusing on
whether the interrupt should be injected or not.


> While this _may_ be sufficient for Arm, wouldn't it be
> better to retain both properties separately, to cover possible further
> uses of the new sub-op?

It would be possible to pass both sets of information, such as:

- line high/low
- "interrupt enabled/disabled" or "fire the interrupt"

If we pass both sets of information at the same time we lose the
benefits of my proposal. So I take you are suggesting to design the
hypercall so that either set (not both!) could be passed? So either:

- line high/low

or:

- "interrupt enabled/disabled" or "fire the interrupt"

?

