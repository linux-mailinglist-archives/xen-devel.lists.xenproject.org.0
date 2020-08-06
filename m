Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B935923E4C6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdE-00049i-Oc; Thu, 06 Aug 2020 23:49:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdD-000497-6P
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:07 +0000
X-Inumbo-ID: ef0a8600-ae4f-4719-be5a-8f4611405119
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef0a8600-ae4f-4719-be5a-8f4611405119;
 Thu, 06 Aug 2020 23:49:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2937221E2;
 Thu,  6 Aug 2020 23:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757746;
 bh=1OY1VeWI4aiTYikcUEmnMBeLg9G9bo4U06TqQ4H7Hdw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=HUBiKB++9n4ez6V/cQLegI0WNgHh/4pYY9lUFVv7i5V0Z7FEu5H8kpIjeG26m2uP7
 rTBubGicmNQB/gQsmjJKK+gduOVTtEvuc8ZBYGXNm8RtyZFckwvXKE/AvxYQlDZ0Ws
 T103tmchJWeEi8bzSQm0O8vabcEQtRc8k7Gaugy4=
Date: Thu, 6 Aug 2020 16:49:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <92e2b136-8468-2877-0e8c-c13ff2a0a1fb@xen.org>
Message-ID: <alpine.DEB.2.21.2008061422300.16004@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
 <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
 <alpine.DEB.2.21.2008050943300.5748@sstabellini-ThinkPad-T480s>
 <92e2b136-8468-2877-0e8c-c13ff2a0a1fb@xen.org>
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
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 6 Aug 2020, Julien Grall wrote:
> On 06/08/2020 01:37, Stefano Stabellini wrote:
> > On Wed, 5 Aug 2020, Julien Grall wrote:
> > > On 05/08/2020 00:22, Stefano Stabellini wrote:
> > > > On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > 
> > > > > This patch adds ability to the device emulator to notify otherend
> > > > > (some entity running in the guest) using a SPI and implements Arm
> > > > > specific bits for it. Proposed interface allows emulator to set
> > > > > the logical level of a one of a domain's IRQ lines.
> > > > > 
> > > > > Please note, this is a split/cleanup of Julien's PoC:
> > > > > "Add support for Guest IO forwarding to a device emulator"
> > > > > 
> > > > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > ---
> > > > >    tools/libs/devicemodel/core.c                   | 18
> > > > > ++++++++++++++++++
> > > > >    tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
> > > > >    tools/libs/devicemodel/libxendevicemodel.map    |  1 +
> > > > >    xen/arch/arm/dm.c                               | 22
> > > > > +++++++++++++++++++++-
> > > > >    xen/common/hvm/dm.c                             |  1 +
> > > > >    xen/include/public/hvm/dm_op.h                  | 15
> > > > > +++++++++++++++
> > > > >    6 files changed, 60 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/tools/libs/devicemodel/core.c
> > > > > b/tools/libs/devicemodel/core.c
> > > > > index 4d40639..30bd79f 100644
> > > > > --- a/tools/libs/devicemodel/core.c
> > > > > +++ b/tools/libs/devicemodel/core.c
> > > > > @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
> > > > >        return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> > > > >    }
> > > > >    +int xendevicemodel_set_irq_level(
> > > > > +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> > > > > +    unsigned int level)
> > > > 
> > > > It is a pity that having xen_dm_op_set_pci_intx_level and
> > > > xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> > > > the names alone I don't think we can reuse either of them.
> > > 
> > > The problem is not the name...
> > > 
> > > > 
> > > > It is very similar to set_isa_irq_level. We could almost rename
> > > > xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> > > > better, just add an alias to it so that xendevicemodel_set_irq_level is
> > > > implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> > > > not sure if it is worth doing it though. Any other opinions?
> > > 
> > > ... the problem is the interrupt field is only 8-bit. So we would only be
> > > able
> > > to cover IRQ 0 - 255.
> > 
> > Argh, that's not going to work :-(  I wasn't sure if it was a good idea
> > anyway.
> > 
> > 
> > > It is not entirely clear how the existing subop could be extended without
> > > breaking existing callers.
> > > 
> > > > But I think we should plan for not needing two calls (one to set level
> > > > to 1, and one to set it to 0):
> > > > https://marc.info/?l=xen-devel&m=159535112027405
> > > 
> > > I am not sure to understand your suggestion here? Are you suggesting to
> > > remove
> > > the 'level' parameter?
> > 
> > My hope was to make it optional to call the hypercall with level = 0,
> > not necessarily to remove 'level' from the struct.
> 
> From my understanding, the hypercall is meant to represent the status of the
> line between the device and the interrupt controller (either low or high).
> 
> This is then up to the interrupt controller to decide when the interrupt is
> going to be fired:
>   - For edge interrupt, this will fire when the line move from low to high (or
> vice versa).
>   - For level interrupt, this will fire when line is high (assuming level
> trigger high) and will keeping firing until the device decided to lower the
> line.
> 
> For a device, it is common to keep the line high until an OS wrote to a
> specific register.
> 
> Furthermore, technically, the guest OS is in charge to configure how an
> interrupt is triggered. Admittely this information is part of the DT, but
> nothing prevent a guest to change it.
> 
> As side note, we have a workaround in Xen for some buggy DT (see the arch
> timer) exposing the wrong trigger type.
> 
> Because of that, I don't really see a way to make optional. Maybe you have
> something different in mind?

For level, we need the level parameter. For edge, we are only interested
in the "edge", right? So maybe we don't want to specify the interrupt
line state for edge interrupts (note that virtio interrupts are edge.)

Maybe something like this:

    struct xen_dm_op_set_irq {
        uint32_t irq;
        #define XEN_DMOP_IRQ_LEVEL 0
        #define XEN_DMOP_IRQ_EDGE  1
        uint8_t type;
        /*
         * If type is XEN_DMOP_IRQ_EDGE, level is ignored.
         * If type is XEN_DMOP_IRQ_LEVEL, level means:
         *      Level: 0 -> level low
         *      Level: 1 -> asserted
         */
        uint8_t level;
    };

So a level interrupt would get two xen_dm_op_set_irq hypercalls, an edge
interrupt only one.

