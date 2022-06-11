Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F4547080
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 02:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346861.572807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzouP-00024F-OK; Sat, 11 Jun 2022 00:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346861.572807; Sat, 11 Jun 2022 00:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzouP-00022T-LY; Sat, 11 Jun 2022 00:23:21 +0000
Received: by outflank-mailman (input) for mailman id 346861;
 Sat, 11 Jun 2022 00:23:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzouO-00022N-HF
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 00:23:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b11d0596-e91c-11ec-bd2c-47488cf2e6aa;
 Sat, 11 Jun 2022 02:23:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA6D1B837C6;
 Sat, 11 Jun 2022 00:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235DBC3411E;
 Sat, 11 Jun 2022 00:23:16 +0000 (UTC)
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
X-Inumbo-ID: b11d0596-e91c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654906996;
	bh=hgePJFBVCqf4ZZNjTfnhdlCC4xdsn6oPrkWViA35yk0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AcMGNVGQKZQVJjW5/BrtonNXz1EGLitf9bCgQL1w3aaPF74d82gmEuXpcCJ61R1Tz
	 xT4l0WplwRd2GnW0ahhqcn7OIBE8LP1GFZ+7ATm5bDa/0X4kA2PZKS87X9j8OuKKr9
	 zAWmkC+5VRlHc7MZvnYqIqFs0KhSwo/uDxKk/77rBGDzglZS7pczIkjrXJF1eCuqK7
	 s8d4fLgrNuvBBlDn4pyATDh+fiiJtkMcb7WmARptZpE1t828tFBFx/u1jmlB4mktDy
	 4vpfZHGFZnl78zKEU6kKDPAnT7dPWYHEiSKvPSxh8sns1CZefWK/sBAHMmux+z+r9e
	 qU5Un0+bUIhqg==
Date: Fri, 10 Jun 2022 17:23:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/evtchn: Add design for static event channel
 signaling
In-Reply-To: <bb77b88185e26010d0502ce38940d2d5f7d28464.1652452306.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206101721580.756493@ubuntu-linux-20-04-desktop>
References: <bb77b88185e26010d0502ce38940d2d5f7d28464.1652452306.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1948795101-1654906997=:756493"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1948795101-1654906997=:756493
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 May 2022, Rahul Singh wrote:
> This patch introduces a new feature to support the signaling between
> two domains in dom0less system.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> v3 changes:
> - add dt node example for dom0 and domU.
> - add info about "xen,enhanced" property to enable the event-channel interface
>   for domU guests.
> 
> v2 changes:
> - switch to the one-subnode-per-evtchn under xen,domain" compatible node.
> - Add more detail about event-channel.
> ---
>  docs/designs/dom0less-evtchn.md | 144 ++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 docs/designs/dom0less-evtchn.md
> 
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> new file mode 100644
> index 0000000000..3c89a9fb7d
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,144 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state: Draft version
> +
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
> +0 -> 1 transition on the pending bits and does not touch the mask bit. The
> +domain may toggle masked bits in the masked bit field and should clear the
> +pending bit when an event has been processed
> +
> +Events are received by a domain via an interrupt from Xen to the domain,
> +indicating when an event arrives (setting the bit). Further notifications are
> +blocked until the bit is cleared again. Events are delivered asynchronously to
> +a domain and are enqueued when the domain is not running. Xen supports two
> +different ABIs for event channel: FIFO and 2L.
> +
> +The event channel communication will be established statically between two
> +domains (dom0 and domU also) before unpausing the domains after domain creation.
> +Event channel connection information between domains will be passed to Xen via
> +the device tree node. The event channel will be created and established
> +in Xen before the domain started. The domain doesn’t need to do any operation
> +to establish a connection. Domain only needs hypercall
> +EVTCHNOP_send(local port) to send notifications to the remote guest.
> +
> +There is no need to describe the static event channel info in the domU device
> +tree. Static event channels are only useful in fully static configurations,
> +and in those configurations the domU device tree dynamically generated by Xen
> +is not needed.
> +
> +To enable the event-channel interface for domU guests include the
> +"xen,enhanced" property with an empty string ( or with the value
> +"enabled” or "evtchn") in domU Xen device tree node.
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
> +    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2L ABI.
> +
> +    link-to-foreign-evtchn is a single phandle to a foreign evtchn to which
> +    local-evtchn will be connected.
> +
> +
> +Example:
> +
> +    chosen {
> +        ....
> +
> +        module@0 {
> +            compatible = "multiboot,kernel", "multiboot,module";
> +            xen,uefi-binary = "...";
> +            bootargs = "...";
> +
> +            /* one sub-node per local event channel */
> +            ec1: evtchn@1 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xa &ec2>;
> +            };
> +        };

Great that you added a dom0 example. I wish we had a dom0 node for dom0
but what you have done here is the easiest thing we can do and less
disruptive for the existing bindings.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +        domU1: domU1 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec2: evtchn@2 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xa &ec1>;
> +            };
> +
> +            ec3: evtchn@3 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xb &ec5>;
> +            };
> +
> +            ec4: evtchn@4 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xc &ec6>;
> +            };
> +            ....
> +        };
> +
> +        domU2: domU2 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec5: evtchn@5 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xa &ec3>;
> +            };
> +
> +            ec6: evtchn@6 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xb &ec4>;
> +            };
> +            ....
> +        };
> +    };
> +
> +In above example three event channel comunications will be established:
> +
> +    dom0  (port 0xa) <-----------------> domU1 (port 0xa)
> +    domU1 (port 0xb) <-----------------> domU2 (port 0xa)
> +    domU1 (port 0xc) <-----------------> domU2 (port 0xb)
> -- 
> 2.25.1
> 
--8323329-1948795101-1654906997=:756493--

