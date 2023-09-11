Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6179AC7E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 01:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599812.935382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfqEL-0002gD-Tm; Mon, 11 Sep 2023 23:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599812.935382; Mon, 11 Sep 2023 23:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfqEL-0002dW-Qe; Mon, 11 Sep 2023 23:22:09 +0000
Received: by outflank-mailman (input) for mailman id 599812;
 Mon, 11 Sep 2023 23:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01Lo=E3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfqEK-0002dQ-IB
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 23:22:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 047afd94-50fa-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 01:22:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1D05FCE193C;
 Mon, 11 Sep 2023 23:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E92C116B1;
 Mon, 11 Sep 2023 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 047afd94-50fa-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694474518;
	bh=zzGf8tHMDHuYE2TeR+xtgUAO5GkyPcllDXwff9HW96o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q9NhUWnYtjGoFiDZv/duAR8mg3fgdOPGo1NYEh6SUKgaiyALrjh/+/k/8UAELYg+b
	 nGypBrauc33AKJSBWwtwP7blHejzNbEDEHllkU4+sD7CEWQ7VGdqehdxpocTGdH7te
	 j4WZm93GOr17lTTMToTM/GR1yHoTV7H5Kxtdkh+FknXykq2d58s5eilH38vGnVuT8c
	 AkNuebRTvxQ1J2lIpkz3HlgqoI1T13eJQXuz7uC02OYbreaUoxhsJASYxRz0MW8lKc
	 i0FyakCxoqVzFarH5OA9JRsoW2qNmLg+j1VjJmT1/XoM6rj5SWtB1fxFnnE/yGfDMz
	 MJs8I57cEYe0Q==
Date: Mon, 11 Sep 2023 16:21:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
In-Reply-To: <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309111620130.1847660@ubuntu-linux-20-04-desktop>
References: <20230911123401.27659-1-michal.orzel@amd.com> <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org> <042fae56-e8e2-c079-2686-d27c5469b7fc@amd.com> <e24a7d3a-ca18-474b-bce2-84b97512c58e@xen.org> <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Sep 2023, Michal Orzel wrote:
> On 11/09/2023 16:48, Julien Grall wrote:
> > On 11/09/2023 15:01, Michal Orzel wrote:
> >> Hi Julien,
> >>
> >> On 11/09/2023 15:14, Julien Grall wrote:
> >>>
> >>>
> >>> Hi,
> >>>
> >>> On 11/09/2023 13:34, Michal Orzel wrote:
> >>>> Host device tree nodes under /chosen with compatible string
> >>>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
> >>>> meant to be exposed to hardware domain.
> >>>
> >>> So, how dom0 is meant to discover the static event channel, shared
> >>> memory it can use?
> >>
> >> For static shared memory:
> >> A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
> >> Xen creates a different node for guests under /reserved-memory.
> >> Linux binding:
> >> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> >> Xen node generation:
> >> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407
> > 
> > Ah good point. I agree with this one.
> > 
> >>
> >> For static event channels:
> >> This is a bit weird so let me put it in a different way.
> >> 1) Xen does not create any node for static evtchn for domU.
> >> 2) The booting.txt states:
> >> There is no need to describe the static event channel info in the domU device
> >> tree. Static event channels are only useful in fully static configurations,
> >> and in those configurations, the domU device tree dynamically generated by Xen
> >> is not needed.
> >> 3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
> >> dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
> >> makes me think that:
> > 
> > You have a point for the phandle. Yet, this is the only way dom0 can
> > find the event channel today. As we exposed it, I don't think we can
> > remove it until we have a proper replacement.
> > 
> > We might get away if the feature is not supported it at all. But there
> > is no statement, so it is a little unclear whether the feature is meant
> > to be in technical preview.
> > 
> > In any case, I think the commit message deserve a bit more explanation
> > as hiding "xen,evtchn-v1"/"xen,domain-shared-memory-v1" is not
> > uncontroversial.
> > 
> >> a) point 2) applies to dom0 as well and we should hide this node or > b) there is a missing property for both dom0 and domUs to tell them
> > about static local port in a proper way
> >>
> >> Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
> >> in xen,evtchn is definitely not a proper solution.
> > 
> > My concern here is we exposed such information to dom0. So as I said
> > above, I don't think we can simply remove it as there is no other way to
> > find such information today.
> > 
> > It doesn't matter that it wasn't exposed to domU.
> > 
> >> Also, there is no Linux binding for it.
> > 
> > AFAIK the static event channel support was not added in Linux until very
> > recently. Also, I think the kernel doesn't directly use the static event
> > channel. So it is possible, this is just an overlook.
> 
> I've found this thread in which Stefano, Rahul and Bertrand agrees on not exposing
> any dt property and the rationale behind:
> https://patchwork.kernel.org/project/xen-devel/patch/4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com/

yes it was done on purpose


> I would not call exposing node to dom0 as something done deliberately given that it happens automatically by copying. So my understanding is
> that we did not want to expose any node and dom0 case was overlooked (since done automatically).
> 
> Exposing half the interface (from system POV) in a way it should not be done (phandle) is not great IMO.
> In any case, if you insist on keeping xen,evtchn, I can leave with it.
> 
> This feature is marked as tech preview with no Linux binding in place so I would not be worried.

Yes I agree. I don't think we risk breaking anything. I would remove
that info from Dom0. Even if we wanted to expose it to Dom0, this is not
the right way to do it...

