Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818022413DB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 01:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5HJ0-00055f-Vq; Mon, 10 Aug 2020 23:34:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5HIz-00055a-9e
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 23:34:13 +0000
X-Inumbo-ID: bf34b211-bbce-4357-b72e-ba6cd6f4d004
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf34b211-bbce-4357-b72e-ba6cd6f4d004;
 Mon, 10 Aug 2020 23:34:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1207206DA;
 Mon, 10 Aug 2020 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102451;
 bh=tVD2FJ00WBqm2ZG05dmvzk6bspKQ4r+EHqC9bGPgIBY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=o+ylv8hhpuSfbUEMTkPPiTZDpPOXd7VXwRUvypdvYCZirh/8blnURJuOyCur7uz/f
 LP5guFGvDfQnCMRRoQwUjsVyKoZeTtowTdOTKdmJnYRV38WNKhLQW7zEGCjeOx45Ry
 4STD2X5GNokEytC8tHgz7v7h+Qyx93GNNV1cdKg4=
Date: Mon, 10 Aug 2020 16:34:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <CAJ=z9a3ngzDS6Fu5DwdRSzWaMASPgp3cZLnpazMQzUbH-9_EEw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008101142500.16004@sstabellini-ThinkPad-T480s>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 8 Aug 2020, Julien Grall wrote:
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

Emulators, at least the ones in QEMU, don't model the hardware so
closely to care about trigger type. The only thing they typically care
about is to fire a notification.

The trigger type only comes into the picture when there is a bug or a
disagreement between Xen and QEMU. Imagine a device that can be both
level active-high or active-low, if the guest kernel changes the
configuration, Xen would know about it, but QEMU wouldn't. I vaguely
recall a bug 10+ years ago about this with QEMU on x86 and a line that
could be both active-high and active-low. So QEMU would raise the
interrupt but Xen would actually think that QEMU stopped the interrupt.

To do this right, we would have to introduce an interface between Xen
and QEMU to propagate the trigger type. Xen would have to tell QEMU when
the guest changed the configuration. That would work, but it would be
better if we can figure out a way to do without it to reduce complexity.

Instead, given that QEMU and other emulators don't actually care about
active-high or active-low, if we have a Xen interface that just says
"fire the interrupt" we get away from this kind of troubles. It would
also be more efficient because the total number of hypercalls required
would be lower.

