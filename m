Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB33B6A81
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 23:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147951.273174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxyz8-00086D-O1; Mon, 28 Jun 2021 21:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147951.273174; Mon, 28 Jun 2021 21:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxyz8-00084G-K2; Mon, 28 Jun 2021 21:40:06 +0000
Received: by outflank-mailman (input) for mailman id 147951;
 Mon, 28 Jun 2021 21:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jr4=LW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lxyz6-0007pA-KD
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 21:40:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98eda089-46b4-4b85-a055-c1ebdbc9242a;
 Mon, 28 Jun 2021 21:40:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB03B61CF9;
 Mon, 28 Jun 2021 21:40:02 +0000 (UTC)
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
X-Inumbo-ID: 98eda089-46b4-4b85-a055-c1ebdbc9242a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624916403;
	bh=QVNLAl6MKPiCumJKwCfV0HnPQ7cA9+fiISTBRdiF74Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J7nVY/vweVl/vuM5hpaEufXDwkMBlVn5DhXw3qHoi2EnoD+aHxiJcKJMI+niB/BVg
	 GnRU3iVyDMCMse3fXZBFyWVZEhNw5OEg5l1/sgOHBF6syXFhoLEUSWmLDQL26ZzdvQ
	 pVHpT5bpz47a52dL4pUsaGnxsAJm6vyT74XfAxL5zc3XnLUFNAS4TNRn2G0iw8hTQe
	 IEkrtmuAIt6GVW63pJda0VSNGoO3/GoWrzwsC0y40q9B1PA7uWF2FuPtXr/M7gJ0OR
	 C8TbSdi29f22lHQY3ILDJtjDuB+np4IFZxT0Z1mzoYmyY3uMF1K3IZUVTEUNjszYgr
	 ssSNsjg+LwVaw==
Date: Mon, 28 Jun 2021 14:40:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH] xen/arm: add forward_smc command line option for
 debugging
In-Reply-To: <db2405f9-61d2-5d8f-816e-547bc09bb95c@xen.org>
Message-ID: <alpine.DEB.2.21.2106281421530.9437@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s> <b5ba0757-322f-a77a-2293-111b77b29d35@xen.org> <alpine.DEB.2.21.2106251033500.24906@sstabellini-ThinkPad-T480s> <db2405f9-61d2-5d8f-816e-547bc09bb95c@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Jun 2021, Julien Grall wrote:
> On 25/06/2021 18:47, Stefano Stabellini wrote:
> > On Fri, 25 Jun 2021, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 25/06/2021 02:51, Stefano Stabellini wrote:
> > > > It has become clear that an option to disable trapping SMC calls to Xen
> > > > is very useful for debugging user issues.
> > > > 
> > > > Instead of having to provide a
> > > > patch to users every time, it would be great if we could just tell them
> > > > to add forward_smc=true to the Xen command line.
> > > 
> > > I can understand this woud be useful to go a bit further in dom0 boot. But
> > > I
> > > am quite sceptical on the idea of providing an option directly in Xen
> > > because:
> > > 
> > > 1) This breaks other SMC uses in Xen (optee, VM monitor...)
> > > 2) There are no guarantee that the SMC call will not wreck Xen. To be
> > > clear, I
> > > don't refer to a malicious OS here, but a normal OS that boot
> > > 3) Very likely the next steps for the user (or better call it the
> > > developper
> > > because that option should really not be used by a normal user) will be to
> > > decide whether they should modify the kernel or implement a mediator in
> > > Xen.
> > > 
> > > > This option is obviously unsafe and unsecure and only meant for
> > > > debugging. Make clear in the description that if you pass
> > > > forward_smc=true then the system is not security supported.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > 
> > > > diff --git a/docs/misc/xen-command-line.pandoc
> > > > b/docs/misc/xen-command-line.pandoc
> > > > index 3ece83a427..0833fe80fc 100644
> > > > --- a/docs/misc/xen-command-line.pandoc
> > > > +++ b/docs/misc/xen-command-line.pandoc
> > > > @@ -2501,6 +2501,16 @@ vwfi to `native` reduces irq latency
> > > > significantly.
> > > > It can also lead to
> > > >    suboptimal scheduling decisions, but only when the system is
> > > >    oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> > > >    +### forward_smc (arm)
> > > > +> `= <boolean>`
> > > > +
> > > > +> Default: `false`
> > > > +
> > > > +If enabled, instead of trapping firmware SMC calls to Xen, allow SMC
> > > > +calls from VMs directly to the firmware. This option is UNSAFE and it
> > > > is
> > > > +only meant for debugging. Systems with forward_smc=true are not
> > > > security
> > > > +supported.
> > > > +
> > > >    ### watchdog (x86)
> > > >    > `= force | <boolean>`
> > > >    diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > > > index e7384381cc..0580ac5762 100644
> > > > --- a/xen/arch/arm/traps.c
> > > > +++ b/xen/arch/arm/traps.c
> > > > @@ -95,11 +95,15 @@ static int __init parse_vwfi(const char *s)
> > > >    }
> > > >    custom_param("vwfi", parse_vwfi);
> > > >    +static bool forward_smc = false;
> > > > +boolean_param("forward_smc", forward_smc);
> > > > +
> > > >    register_t get_default_hcr_flags(void)
> > > >    {
> > > >        return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
> > > >                 (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
> > > > -
> > > > HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> > > > +             (forward_smc ? 0 : HCR_TSC) |
> > > > +             HCR_TID3|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> > > 
> > > A system wide option to turn off SMC trapping is a no-go because this
> > > would
> > > only be usable for debugging dom0 and not a guest.
> > > 
> > > So at the minimum this should be a per-domain option. Also, I think we
> > > still
> > > want to integrate with the rest of the SMC users. So Xen should still trap
> > > the
> > > SMC and the forward should happen in vsmccc_handle_call().
> > > 
> > > This would cover my first point.
> > 
> > Yes, you are totally right. I thought about it this morning as well.
> > This patch would break even PSCI :-(
> > 
> > It would be best implemented in platform_smc as forward_to_fw (see
> > xen/arch/arm/platforms/xilinx-zynqmp-eemi.c:forward_to_fw).
> 
> There is one problem though. How do you know which calling convention to use?
> IOW, will all the firmware call (in particular on older platform) follow the
> SMCCC?

I am not aware of any firmware (Xilinx or non-Xilinx) with SMCs call
not SMCCC compliant.

That said, the most important thing is that we handle PSCI correctly,
right? After that, if we forward all calls to the firmware we should be
OK. From a calling convention perspective, it would only break if we
don't forward enough parameters on registers or save enough return
values on registers.

Then there are the problems with memory addresses you wrote below.

 
> > > For the second and third point, I still like
> > > to understand how this is going to help the developer to fully port the
> > > board/OS to Xen with this option disabled?
> > 
> > This is meant to help with bug triage only. There are a number of bugs
> > that can happen if certain platform SMCs are intercerpted by Xen instead
> > of being forwarded to the hardware.
> 
> We already print a message informating the user that the SMC call was trapped
> and terminated in Xen. So I am not entirely sure why you also need to
> passthrough all the SMC calls to triage it. You already know that the SMC will
> have to be implemented in Xen...

On Xilinx, we have so many SMCs that it would be difficult to figure it
out from the boot log alone. In the sense that it is unfortunately
"normal" for one or two SMCs to fail (even without Xen!) But that could
be a Xilinx-only issue.

 
> > I found myself having to provide a
> > patch to forward_to_fw all platform SMCs as a first test to
> > triage bugs a few times recently. It is never a fix, only a way to
> > understand the next step of debugging. Also Alex stumbled across
> > something similar on a non-Xilinx board (MacchiatoBin) so I thought it
> > was time for a better debugging option.
> > 
> > I think for debugging purposes it would be sufficient if all platform
> > SMCs were forward_to_fw from all domains. Of course it is totally
> > unsafe, but it is just for debugging.
> 
> In order to add a debugging option in Xen, we need to be reasonably confident
> that the option will not make more damage (I am not speaking about security
> here...) than it is actually worth it.
> 
> I can see how this helps in both your situation to boot dom0. However, I am
> not sure this can be generalized to every platform. A developper (or user)
> enabling this debugging option may end up to see corruption/hang because:
>   1) SMC call may pass memory address. A domain would pass a guest physical
> address but the firmware will interpret as host physical address. This
> working(ish) for dom0 because both are equivalent, but for other domain this
> will break.
>  2) SMC call may change the behavior of the system (i.e. turning off the
> UART)...
> 
> It would be difficult to pinpoint whether the problem is because an SMC (or
> else) without implementing each SMC call in Xen.
> 
> I don't think it is a lot of work to implement SMCs in Xen as you find them
> (sooner or later, you will have to do it anyway...). At which point,
> forwarding all the unknowns SMCs to attempt to boot further is probably more
> risky than it is worth it.
> 
> If the problem is re-building, then we could consider to provide a command
> line option to easily specify which SMC call is passthrough...

The problem is that it isn't always the same person doing the work.

If it is me working on a new release or a new platform, the command line
option wouldn't help me much. In fact, it might even be faster for me to
add "goto forward_to_fw" and rebuild. I am happy with that.

The issue is when there is a bug reported by a customer or by a user on
the mailing list. In that case, it is very useful to ask them to run a
little experiment to narrow down the possibilities, and it i easier to
ask them to add a command line option than to apply a patch. If
passthrough is involved, then we need to ask the user to forward all
SMCs, not just Dom0. If passthrough is not involved, then forwarding
only Dom0 calls is fine.


That said, I am not so sure we want this patch upstream: I think it
would benefit Xilinx users and a recent request from Alex made me think
that it would benefit other platforms too, but maybe the benefits on
other platforms are not enough to introduce an option like this, which
could easily break things.

So I am happy to follow your preference:

1) I can drop the patch
2) forward platform_smc only for dom0
3) forward platform_smc for all domains


Let me know. I am happy either way.

Cheers,

Stefano

