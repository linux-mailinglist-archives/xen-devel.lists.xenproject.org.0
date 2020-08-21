Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B414C24C960
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 02:54:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8vJg-0006Jf-81; Fri, 21 Aug 2020 00:54:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g3v=B7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8vJe-0006JR-Ne
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 00:53:58 +0000
X-Inumbo-ID: 1d6b0049-dba5-470f-a689-0c5a574c18ae
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d6b0049-dba5-470f-a689-0c5a574c18ae;
 Fri, 21 Aug 2020 00:53:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 214FE20702;
 Fri, 21 Aug 2020 00:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597971237;
 bh=+MBEQqTqksDVjAqZz4o5NDmvkN+Eddf1emR9wLaRSZQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dW53WxAgEWr5RTXjIq0ZbYkKrEDHiK+AKn8KjVdBMZjnwmFOeAvkdQCoCNF1lxBZj
 8PSqlTK+nEpY5xUI0zIwQLOy+a1BIYp0/cbYZU5OYm11KtZPVU5C/o+mp/4LNDvN9Z
 l9RNS6Y/FBaiC4Sk2oofeKgORcly4cY+4y5NJdC8=
Date: Thu, 20 Aug 2020 17:53:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien.grall.oss@gmail.com>, Jan Beulich <jbeulich@suse.com>, 
 Oleksandr Tyshchenko <olekstysh@gmail.com>, 
 xen-devel <xen-devel@lists.xenproject.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <dbbf27bc-7ae0-9e25-cc30-2adb3ba26355@xen.org>
Message-ID: <alpine.DEB.2.21.2008201635510.6005@sstabellini-ThinkPad-T480s>
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
 <alpine.DEB.2.21.2008101142500.16004@sstabellini-ThinkPad-T480s>
 <97b477a9-3945-9c5d-671d-ab5cbb2d0468@xen.org>
 <alpine.DEB.2.21.2008111521050.15669@sstabellini-ThinkPad-T480s>
 <dbbf27bc-7ae0-9e25-cc30-2adb3ba26355@xen.org>
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

On Tue, 18 Aug 2020, Julien Grall wrote:
> On 11/08/2020 23:48, Stefano Stabellini wrote:
> > On Tue, 11 Aug 2020, Julien Grall wrote:
> > > >   I vaguely
> > > > recall a bug 10+ years ago about this with QEMU on x86 and a line that
> > > > could be both active-high and active-low. So QEMU would raise the
> > > > interrupt but Xen would actually think that QEMU stopped the interrupt.
> > > > 
> > > > To do this right, we would have to introduce an interface between Xen
> > > > and QEMU to propagate the trigger type. Xen would have to tell QEMU when
> > > > the guest changed the configuration. That would work, but it would be
> > > > better if we can figure out a way to do without it to reduce complexity.
> > > Per above, I don't think this is necessary.
> > > 
> > > > 
> > > > Instead, given that QEMU and other emulators don't actually care about
> > > > active-high or active-low, if we have a Xen interface that just says
> > > > "fire the interrupt" we get away from this kind of troubles. It would
> > > > also be more efficient because the total number of hypercalls required
> > > > would be lower.
> > > 
> > > I read "fire interrupt" the interrupt as "Please generate an interrupt
> > > once".
> > > Is it what you definition you expect?
> > 
> > Yes, that is the idea. It would have to take into account the edge/level
> > semantic difference: level would have "start it" and a "stop it".
> 
> I am still struggling to see how this can work:
>     - At the moment, QEMU is only providing us the line state. How can we
> deduce the type of the interrupt? Would it mean a major modification of the
> QEMU API?

Good question. 

I don't think we would need any major modifications of the QEMU APIs.
QEMU already uses two different function calls to trigger an edge
interrupt and to trigger a level interrupt.

Edge interrupts are triggered with qemu_irq_pulse; level interrupts with
qemu_irq_raise/qemu_irq_lower.

It is also possible for devices to call qemu_set_irq directly which
only has the state of the line represented by the "level" argument.
As far as I can tell all interrupts emulated in QEMU (at least the ones
we care about) are active-high.

We have a couple of choices in the implementation, like hooking into
qemu_irq_pulse, and/or checking if the interrupt is level or edge in the
xen interrupt injection function. The latter shouldn't require any
changes in QEMU common code.


FYI looking into the code there is something "strange" in virtio-mmio.c:
it only ever calls qemu_set_irq to start a notification. It doesn't look
like it ever calls qemu_set_irq to stop a notification at all. It is
possible that the state of the line is not accurately emulated for
virtio-mmio.c.


>     - Can you provide a rough sketch how this could be implemented in Xen?

It would work similarly to other emulated interrupt injections on the
Xen side, calling vgic_inject_irq.  We have matching info about
level/edge and active-high/active-low in Xen too, so we could do more
precise emulation of the interrupt flow, although I am aware of the
current limitations of the vgic in that regard.

But I have the feeling I didn't address your concern :-)


