Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D644477E8D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 22:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248265.428202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxy6c-00083A-Nb; Thu, 16 Dec 2021 21:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248265.428202; Thu, 16 Dec 2021 21:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxy6c-00081L-Jv; Thu, 16 Dec 2021 21:16:02 +0000
Received: by outflank-mailman (input) for mailman id 248265;
 Thu, 16 Dec 2021 21:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxy6b-00081F-30
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 21:16:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf2feba-5eb5-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 22:15:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9601618B3;
 Thu, 16 Dec 2021 21:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECE0C36AE7;
 Thu, 16 Dec 2021 21:15:56 +0000 (UTC)
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
X-Inumbo-ID: 5cf2feba-5eb5-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639689357;
	bh=7rRmfTrToD4jqpF7Ax6Xi68uwKeLH0FDxcLqsWl3p7o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EI69Mofl7T1nECNowTigZChE8x97q66y36IhWkmVeTtdhzmq6+TbZU3Tel8hGV2vH
	 XK6xzjVX6NhPX2P1Yy40yOXjIQiCcExG/stRAKmezN31IOsEaV8RlYTmvv0x+BZICD
	 LyGG84+shiuZCXzYuMblDCQUSIqEp3btprpIlGIlkDvaHaXRkUdF2oXSN57re+GHaR
	 zpIJZtD7En7/PM+2bqiA+e4RQ3tMRve3+f8jjpKw10xVj6zJ2a0ss7BtsvpQTV/Da9
	 0Sx41vFpMgqquEAzu25boyuxSMj1YzHp2KGbF8P/bSN01XxLQPoNYfK3TCxwKO6Plv
	 cNjyexby7Jg6A==
Date: Thu, 16 Dec 2021 13:15:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
In-Reply-To: <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
References: <20211208155606.20029-1-jgross@suse.com> <20211208155606.20029-3-jgross@suse.com> <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org> <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com> <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com> <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Dec 2021, Stefano Stabellini wrote:
> On Thu, 16 Dec 2021, Juergen Gross wrote:
> > On 16.12.21 03:10, Stefano Stabellini wrote:
> > > On Wed, 15 Dec 2021, Juergen Gross wrote:
> > > > On 14.12.21 18:36, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 08/12/2021 15:55, Juergen Gross wrote:
> > > > > > Today most hypercall handlers have a return type of long, while the
> > > > > > compat ones return an int. There are a few exceptions from that rule,
> > > > > > however.
> > > > > 
> > > > > So on Arm64, I don't think you can make use of the full 64-bit because a
> > > > > 32-bit domain would not be able to see the top 32-bit.
> > > > > 
> > > > > In fact, this could potentially cause us some trouble (see [1]) in Xen.
> > > > > So it feels like the hypercalls should always return a 32-bit signed
> > > > > value
> > > > > on Arm.
> > > > 
> > > > This would break hypercalls like XENMEM_maximum_ram_page which are able
> > > > to return larger values, right?
> > > > 
> > > > > The other advantage is it would be clear that the top 32-bit are not
> > > > > usuable. Stefano, what do you think?
> > > > 
> > > > Wouldn't it make more sense to check the return value to be a sign
> > > > extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
> > > > 
> > > > The question is what to return if this is not the case. -EDOM?
> > > 
> > > 
> > > I can see where Julien is coming from: we have been trying to keep the
> > > arm32 and arm64 ABIs identical since the beginning of the project. So,
> > > like Julien, my preference would be to always return 32-bit on ARM, both
> > > aarch32 and aarch64. It would make things simple.
> > > 
> > > The case of XENMEM_maximum_ram_page is interesting but it is not a
> > > problem in reality because the max physical address size is only 40-bit
> > > for aarch32 guests, so 32-bit are always enough to return the highest
> > > page in memory for 32-bit guests.
> > 
> > You are aware that this isn't the guest's max page, but the host's?

I can see now that you meant to say that, no matter what is the max
pseudo-physical address supported by the VM, XENMEM_maximum_ram_page is
supposed to return the max memory page, which could go above the
addressibility limit of the VM.

So XENMEM_maximum_ram_page should potentially be able to return (1<<44)
even when called by an aarch32 VM, with max IPA 40-bit.

I would imagine it could be useful if dom0 is 32-bit but domUs are
64-bit on a 64-bit hypervisor (which I think it would be a very rare
configuration on ARM.)

Then it looks like XENMEM_maximum_ram_page needs to be able to return a
value > 32-bit when called by a 32-bit guest.

The hypercall ABI follows the ARM C calling convention, so a 64-bit
value should be returned using r0 and r1. But looking at
xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever sets r1
today. Only r0 is set, so effectively we only support 32-bit return
values on aarch32 and for aarch32 guests.

In other words, today all hypercalls on ARM return 64-bit to 64-bit
guests and 32-bit to 32-bit guests. Which in the case of memory_op is
"technically" the correct thing to do because it matches the C
declaration in xen/include/xen/hypercall.h:

extern long
do_memory_op(
    unsigned long cmd,
    XEN_GUEST_HANDLE_PARAM(void) arg);

So...  I guess the conclusion is that on ARM do_memory_op should return
"long" although it is not actually enough for a correct implementation
of XENMEM_maximum_ram_page for aarch32 guests ?

