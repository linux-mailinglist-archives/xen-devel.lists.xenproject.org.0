Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666313B4862
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 19:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147352.271552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpvG-0005Yu-A3; Fri, 25 Jun 2021 17:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147352.271552; Fri, 25 Jun 2021 17:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpvG-0005X4-5v; Fri, 25 Jun 2021 17:47:22 +0000
Received: by outflank-mailman (input) for mailman id 147352;
 Fri, 25 Jun 2021 17:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l36E=LT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lwpvF-0005Wy-9g
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 17:47:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 351e135f-7696-44e6-b8c0-d18fb6054ae9;
 Fri, 25 Jun 2021 17:47:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 822FF6157E;
 Fri, 25 Jun 2021 17:47:19 +0000 (UTC)
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
X-Inumbo-ID: 351e135f-7696-44e6-b8c0-d18fb6054ae9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624643239;
	bh=nOVeSVwc3vAa+JVLD6a/lw25Pvfe+iUBs+PTwaec6tU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SrXsxrd6S6BN8XcXzR1f3GVK+MewsoyV7ruAbm/7cSQ8e5C5wxjmCbI5YOQGnfag8
	 BxRDNlGTsz2vDZgyGyKGdFGEpYWh+IH7SyHNbf8HPiqMJY5mQQ70cva3n4zz6YIeFF
	 UKjTEGuU1zB/MQect/A/K7mjiMhy/6h24FguYuQ3RpRGdoptylyCfscaGuNJFmeK11
	 /9iPE4+pQoAqoUCy72ECKEuIBlo4SnFJmjSTa+3zb1EwTHOL2HlOKffOATABjE7Yfy
	 uWuTqsvg1rBB/8ArIj6UXV/RzvhS1ijPeKxiPEx/H9PICV2lMAipLgwLcCA03w/CkJ
	 /dPvmk6bA1zRA==
Date: Fri, 25 Jun 2021 10:47:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH] xen/arm: add forward_smc command line option for
 debugging
In-Reply-To: <b5ba0757-322f-a77a-2293-111b77b29d35@xen.org>
Message-ID: <alpine.DEB.2.21.2106251033500.24906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s> <b5ba0757-322f-a77a-2293-111b77b29d35@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jun 2021, Julien Grall wrote:
> Hi,
> 
> On 25/06/2021 02:51, Stefano Stabellini wrote:
> > It has become clear that an option to disable trapping SMC calls to Xen
> > is very useful for debugging user issues.
> >
> > Instead of having to provide a
> > patch to users every time, it would be great if we could just tell them
> > to add forward_smc=true to the Xen command line.
> 
> I can understand this woud be useful to go a bit further in dom0 boot. But I
> am quite sceptical on the idea of providing an option directly in Xen because:
> 
> 1) This breaks other SMC uses in Xen (optee, VM monitor...)
> 2) There are no guarantee that the SMC call will not wreck Xen. To be clear, I
> don't refer to a malicious OS here, but a normal OS that boot
> 3) Very likely the next steps for the user (or better call it the developper
> because that option should really not be used by a normal user) will be to
> decide whether they should modify the kernel or implement a mediator in Xen.
> 
> > This option is obviously unsafe and unsecure and only meant for
> > debugging. Make clear in the description that if you pass
> > forward_smc=true then the system is not security supported.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/docs/misc/xen-command-line.pandoc
> > b/docs/misc/xen-command-line.pandoc
> > index 3ece83a427..0833fe80fc 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2501,6 +2501,16 @@ vwfi to `native` reduces irq latency significantly.
> > It can also lead to
> >   suboptimal scheduling decisions, but only when the system is
> >   oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> >   +### forward_smc (arm)
> > +> `= <boolean>`
> > +
> > +> Default: `false`
> > +
> > +If enabled, instead of trapping firmware SMC calls to Xen, allow SMC
> > +calls from VMs directly to the firmware. This option is UNSAFE and it is
> > +only meant for debugging. Systems with forward_smc=true are not security
> > +supported.
> > +
> >   ### watchdog (x86)
> >   > `= force | <boolean>`
> >   diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > index e7384381cc..0580ac5762 100644
> > --- a/xen/arch/arm/traps.c
> > +++ b/xen/arch/arm/traps.c
> > @@ -95,11 +95,15 @@ static int __init parse_vwfi(const char *s)
> >   }
> >   custom_param("vwfi", parse_vwfi);
> >   +static bool forward_smc = false;
> > +boolean_param("forward_smc", forward_smc);
> > +
> >   register_t get_default_hcr_flags(void)
> >   {
> >       return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
> >                (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
> > -             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> > +             (forward_smc ? 0 : HCR_TSC) |
> > +             HCR_TID3|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> 
> A system wide option to turn off SMC trapping is a no-go because this would
> only be usable for debugging dom0 and not a guest.
> 
> So at the minimum this should be a per-domain option. Also, I think we still
> want to integrate with the rest of the SMC users. So Xen should still trap the
> SMC and the forward should happen in vsmccc_handle_call().
> 
> This would cover my first point.

Yes, you are totally right. I thought about it this morning as well.
This patch would break even PSCI :-(

It would be best implemented in platform_smc as forward_to_fw (see
xen/arch/arm/platforms/xilinx-zynqmp-eemi.c:forward_to_fw).


> For the second and third point, I still like
> to understand how this is going to help the developer to fully port the
> board/OS to Xen with this option disabled?

This is meant to help with bug triage only. There are a number of bugs
that can happen if certain platform SMCs are intercerpted by Xen instead
of being forwarded to the hardware. I found myself having to provide a
patch to forward_to_fw all platform SMCs as a first test to
triage bugs a few times recently. It is never a fix, only a way to
understand the next step of debugging. Also Alex stumbled across
something similar on a non-Xilinx board (MacchiatoBin) so I thought it
was time for a better debugging option.

I think for debugging purposes it would be sufficient if all platform
SMCs were forward_to_fw from all domains. Of course it is totally
unsafe, but it is just for debugging. But I can also see the value in
having a command line option to forward_to_fw all platform SMCs from
dom0 only and maybe a separate patch later to add a per-domain option to
forward_to_fw platform SMCs for specific domains if needed. That would
be safer and more flexible but a little more work.

