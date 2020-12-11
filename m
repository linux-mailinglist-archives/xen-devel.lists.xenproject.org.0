Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D22D8119
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 22:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50914.89755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpx5-0002g4-LA; Fri, 11 Dec 2020 21:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50914.89755; Fri, 11 Dec 2020 21:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpx5-0002ff-I4; Fri, 11 Dec 2020 21:27:47 +0000
Received: by outflank-mailman (input) for mailman id 50914;
 Fri, 11 Dec 2020 21:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knpx4-0002fa-GS
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 21:27:46 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afc1cfc5-c3b3-47b4-8507-7ddc1076cf16;
 Fri, 11 Dec 2020 21:27:45 +0000 (UTC)
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
X-Inumbo-ID: afc1cfc5-c3b3-47b4-8507-7ddc1076cf16
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607722064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPMMCIZpTkbwn/vpPbbWIvtIfsdUJZbFWGvj4XBXX/8=;
	b=Kc/FVw++R6e2tySXtGXcjxUCfxzjuTQFTglr5qIAHuhSnqpTp+Ikj+7Hq7mXQTlJIhQso1
	GzueGJq666vDoGnyl7z+R0hqgzUE1QvEz7r/C1zoUW/uJEMWoH29CdDJSk0WUoP2avCyFO
	CRX7sZOyAR4dgW8urx4t099te3vzsLBebYBFzSZHvt/ir/v+j+DUtH3KLF65BJZt70WJkw
	AE4vdTRQhanAKvsPxu5Ss601VFRMIT6sTuiXwTfT17QUlJMwNoTmBl7avya6WCOOi1pn/V
	ZDVRxzcxQEEpw+Wd6+ymYN074dQBF+mj2DWvKS0m9PZ0lY8tuhofO6ggRZ9GJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607722064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPMMCIZpTkbwn/vpPbbWIvtIfsdUJZbFWGvj4XBXX/8=;
	b=tFwThmGQdDL1Ql7epJregGVf1InSk/8mJJwiaGupYZNmlO1tti86n4xUB3jqi7xZFrdYET
	SNdr5SpWVlT7QnDA==
To: boris.ostrovsky@oracle.com, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pankaj
 Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Lee Jones
 <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Michal
 Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu interrupts
In-Reply-To: <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
References: <20201210192536.118432146@linutronix.de> <20201210194045.250321315@linutronix.de> <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com> <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com> <871rfwiknd.fsf@nanos.tec.linutronix.de> <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
Date: Fri, 11 Dec 2020 22:27:43 +0100
Message-ID: <877dpoghio.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11 2020 at 09:29, boris ostrovsky wrote:

> On 12/11/20 7:37 AM, Thomas Gleixner wrote:
>> On Fri, Dec 11 2020 at 13:10, J=C3=BCrgen Gro=C3=9F wrote:
>>> On 11.12.20 00:20, boris.ostrovsky@oracle.com wrote:
>>>> On 12/10/20 2:26 PM, Thomas Gleixner wrote:
>>>>> Change the implementation so that the channel is bound to CPU0 at the=
 XEN
>>>>> level and leave the affinity mask alone. At startup of the interrupt
>>>>> affinity will be assigned out of the affinity mask and the XEN bindin=
g will
>>>>> be updated.
>>>>
>>>> If that's the case then I wonder whether we need this call at all and =
instead bind at startup time.
>>> After some discussion with Thomas on IRC and xen-devel archaeology the
>>> result is: this will be needed especially for systems running on a
>>> single vcpu (e.g. small guests), as the .irq_set_affinity() callback
>>> won't be called in this case when starting the irq.
>
> On UP are we not then going to end up with an empty affinity mask? Or
> are we guaranteed to have it set to 1 by interrupt generic code?

An UP kernel does not ever look on the affinity mask. The
chip::irq_set_affinity() callback is not invoked so the mask is
irrelevant.

A SMP kernel on a UP machine sets CPU0 in the mask so all is good.

> This is actually why I brought this up in the first place --- a
> potential mismatch between the affinity mask and Xen-specific data
> (e.g. info->cpu and then protocol-specific data in event channel
> code). Even if they are re-synchronized later, at startup time (for
> SMP).

Which is not a problem either. The affinity mask is only relevant for
setting the affinity, but it's not relevant for delivery and never can
be.

> I don't see anything that would cause a problem right now but I worry
> that this inconsistency may come up at some point.

As long as the affinity mask becomes not part of the event channel magic
this should never matter.

Look at it from hardware:

interrupt is affine to CPU0

     CPU0 runs:
=20=20=20=20=20
     set_affinity(CPU0 -> CPU1)
        local_irq_disable()
=20=20=20=20=20=20=20=20
 --> interrupt is raised in hardware and pending on CPU0

        irq hardware is reconfigured to be affine to CPU1

        local_irq_enable()

 --> interrupt is handled on CPU0

the next interrupt will be raised on CPU1

So info->cpu which is registered via the hypercall binds the 'hardware
delivery' and whenever the new affinity is written it is rebound to some
other CPU and the next interrupt is then raised on this other CPU.

It's not any different from the hardware example at least not as far as
I understood the code.

Thanks,

        tglx

