Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E040B520636
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 22:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324815.547068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noALG-0002lb-3H; Mon, 09 May 2022 20:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324815.547068; Mon, 09 May 2022 20:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noALF-0002j0-WD; Mon, 09 May 2022 20:50:54 +0000
Received: by outflank-mailman (input) for mailman id 324815;
 Mon, 09 May 2022 20:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1noALD-0002iu-Ic
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 20:50:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b475cc16-cfd9-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 22:50:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDF90B81982;
 Mon,  9 May 2022 20:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA89C385BB;
 Mon,  9 May 2022 20:50:46 +0000 (UTC)
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
X-Inumbo-ID: b475cc16-cfd9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652129446;
	bh=xJHKAPfi/62DzZrgyAcgK/3GP9N1eeUJPC8tNsGbC/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OCsW31iwPo53roGuztxOUUJxd3Pk3rzXTicz9ZdgmgI6CE6wzk0QZx1QUaXlWoiV6
	 /B/+E5OBp63Fbi0ocYZO3lgYZ5O6KyhelIDqATrPghS/tr8fBLDcgxCTpfaoR11zMt
	 1gaVtA6Q+CDAwPcAUYQG6OQs7ux6lOgegQS+UCF4iV+AauM5VR8XIBA53acBcLbNAZ
	 uqFt1nR+Ul/kbzAgaTOGmW/OyRTmCByGPEwEXXVm0Xox+hKLCzHsC3waycnUkxeEPu
	 9xWMB30QaAvbKaB/9hloNrafhwhRjbV2txYxpVWtgKgKgngYr9a+9xC8AuLxsqr0Xo
	 mrfZLUCECl9Fg==
Date: Mon, 9 May 2022 13:50:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
In-Reply-To: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205091347470.43560@ubuntu-linux-20-04-desktop>
References: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 May 2022, Rahul Singh wrote:
> This patch introduces a new feature to support the signaling between
> two domains in dom0less system.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> v2 changes:
> - switch to the one-subnode-per-evtchn under xen,domain" compatible node.
> - Add more detail about event-channel 
> ---
>  docs/designs/dom0less-evtchn.md | 126 ++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 docs/designs/dom0less-evtchn.md
> 
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> new file mode 100644
> index 0000000000..62ec8a4009
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,126 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state:???Draft version

Something went wrong with the encoding of this email. Aside from that
the proposal looks good to me. Thanks Rahul!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +## Proposer(s): Rahul Singh, Bertrand Marquis
> +
> +## Problem Statement:
> +
> +Dom0less guests would benefit from a statically-defined memory sharing and
> +signally system for communication. One that would be immediately available at
> +boot without any need for dynamic configurations.
> +
> +In embedded a great variety of guest operating system kernels exist, many of
> +which don't have support for xenstore, grant table, or other complex drivers.
> +Some of them are small kernel-space applications (often called "baremetal",
> +not to be confused with the term "baremetal" used in the data center which
> +means "without hypervisors") or RTOSes. Additionally, for safety reasons, users
> +often need to be able to configure the full system statically so that it can
> +be verified statically.
> +
> +Event channels are very simple and can be added even to baremetal applications.
> +This proposal introduces a way to define them statically to make them suitable
> +for dom0less embedded deployments.
> +
> +## Proposal:
> +
> +Event channels are the basic primitive provided by Xen for event notifications.
> +An event channel is a logical connection between 2 domains (more specifically
> +between dom1,port1, and dom2,port2). Each event has a pending and a masked bit.
> +The pending bit indicates the event has been raised. The masked bit is used by
> +the domain to prevent the delivery of that specific event. Xen only performs a
> +0 ??? 1 transition on the pending bits and does not touch the mask bit. The
> +domain may toggle masked bits in the masked bit field and should clear the
> +pending bit when an event has been processed
> +
> +Events are received by a domain via an interrupt from Xen to the domain,
> +indicating when an event arrives (setting the bit). Further notifications are
> +blocked until the bit is cleared again. Events are delivered asynchronously to
> +a domain and are enqueued when the domain is not running.
> +More information about FIFO based event channel can be found at:
> +https://xenbits.xen.org/people/dvrabel/event-channels-H.pdf
> +
> +The event channel communication will be established statically between two
> +domains (dom0 and domU also) before unpausing the domains after domain creation.
> +Event channel connection information between domains will be passed to XEN via
> +the device tree node. The event channel will be created and established
> +beforehand in XEN before the domain started. The domain doesn???t need to do any
> +operation to establish a connection. Domain only needs hypercall
> +EVTCHNOP_send(local port) to send notifications to the remote guest.
> +
> +There is no need to describe the static event channel info in the domU device
> +tree. Static event channels are only useful in fully static configurations,
> +and in those configurations the domU device tree dynamically generated by Xen
> +is not needed.
> +
> +Under the "xen,domain" compatible node, there need to be sub-nodes with
> +compatible "xen,evtchn" that describe the event channel connection between two
> +domains(dom0 and domU also).
> +
> +The event channel sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,evtchn"
> +
> +- xen,evtchn
> +
> +    The property is tuples of two numbers
> +    (local-evtchn link-to-foreign-evtchn) where:
> +
> +    local-evtchn is an integer value that will be used to allocate local port
> +    for a domain to send and receive event notifications to/from the remote
> +    domain.
> +
> +    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
> +    local-evtchn will be connected.
> +
> +
> +Example:
> +
> +    chosen {
> +        ....
> +
> +        domU1: domU1 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec1: evtchn@1 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xa &ec3>;
> +            };
> +
> +            ec2: evtchn@2 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xc &ec4>;
> +            };
> +            ....
> +        };
> +
> +        domU2: domU2 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec3: evtchn@3 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xb &ec1>;
> +            };
> +
> +            ec4: evtchn@4 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xd &ec2>;
> +            };
> +            ....
> +        };
> +    };
> +
> +In above example two event channel comunication will be established between
> +domU1 and domU2.
> +
> +    domU1 (port 0xa) <-----------------> domU2 (port 0xb)
> +    domU1 (port 0xc) <-----------------> domU2 (port 0xd)
> +
> +domU1 and domU2 can send the signal to remote domain via hypercall
> +EVTCHNOP_send(.) on local port.
> -- 
> 2.25.1
> 

