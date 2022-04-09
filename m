Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512B4FA164
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 03:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301865.515247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd09s-0008Ie-7b; Sat, 09 Apr 2022 01:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301865.515247; Sat, 09 Apr 2022 01:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd09s-0008Gu-2w; Sat, 09 Apr 2022 01:45:00 +0000
Received: by outflank-mailman (input) for mailman id 301865;
 Sat, 09 Apr 2022 01:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EL/=UT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nd09r-0008Go-CG
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 01:44:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d9bda8-b7a6-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 03:44:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 248EE62220;
 Sat,  9 Apr 2022 01:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235E3C385A1;
 Sat,  9 Apr 2022 01:44:55 +0000 (UTC)
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
X-Inumbo-ID: a8d9bda8-b7a6-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649468695;
	bh=JD7nwjtMwLwXZ61zCNVpq4UXjH4WCYCO9ccOzy7810I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O1kHKOEqwaAWnZi8E0kq52UiJWYRpWtlIaPyVs852PwYvrq/upnJtDPO4mleew0qT
	 1+9bCOyufjeTX+hcV6FHnYahTZg4T/sPNntVo7OIZCiOebgM//xKurrtS3CQfumk13
	 NjLnVFKtwLY7PQ2MtOtQSJzXxzFfL/YLIJ7ZZtXX7UUVJTSmkrhBiaBnpP6udK/hb+
	 mP0cWTTY/Eeuc4jeFvNIjt4yfQJdPISgkrAJRQciBgYkQSXYOCl5Cdcv0Ecy9EAUVM
	 tGruW0qlwuL+IF6TkokvTjfG4Zwajv3rSeXNssumezfXw7Rux2+4jQ7H4tg2jAxkV1
	 1TyLradaBH6tg==
Date: Fri, 8 Apr 2022 18:44:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
In-Reply-To: <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2204081837410.3066615@ubuntu-linux-20-04-desktop>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1710515683-1649468696=:3066615"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1710515683-1649468696=:3066615
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 8 Apr 2022, Stefano Stabellini wrote:
> On Wed, 23 Mar 2022, Rahul Singh wrote:
> > in dom0less system. This patch introduce the new feature to support the
> > signaling between two domUs in dom0less system.
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> >  docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 docs/designs/dom0less-evtchn.md
> > 
> > diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> > new file mode 100644
> > index 0000000000..6a1b7e8c22
> > --- /dev/null
> > +++ b/docs/designs/dom0less-evtchn.md
> > @@ -0,0 +1,96 @@
> > +# Signaling support between two domUs on dom0less system
> > +
> > +## Current state: Draft version
> > +
> > +## Proposer(s): Rahul Singh, Bertrand Marquis
> > +
> > +## Problem Statement:
> > +
> > +The goal of this work is to define a simple signaling system between Xen guests
> > +in dom0less systems.
> > +
> > +In dom0less system, we cannot make use of xenbus and xenstore that are used in
> > +normal systems with dynamic VMs to communicate between domains by providing a
> > +bus abstraction for paravirtualized drivers.
> > +
> > +One possible solution to implement the signaling system between domUs is based
> > +on event channels.
> 
> I suggest to reword this as follows:
> 
> ---
> Dom0less guests would benefit from a statically-defined memory sharing
> and signally system for communication. One that would be immediately
> available at boot without any need for dynamic configurations.
> 
> In embedded a great variety of guest operating system kernels exist,
> many of which don't have support for xenstore, grant table or other
> complex drivers. Some of them are small kernel-space applications (often
> called "baremetal", not to be confused with the term "baremetal" used in
> datacenter which means "without hypervisors") or RTOSes.  Additionally,
> for safety reasons, users often need to be able to configure the full
> system statically so that it can be verified statically.
> 
> Event channels are very simple and can be added even to baremetal
> applications. This proposal introduces a way to define them statically
> to make them suitable to dom0less embedded deployments.
> ---
> 
> 
> > +## Proposal:
> > +
> > +Event channels are the basic primitive provided by Xen for event notifications.
> > +An event channel is a logical connection between 2 domains (more specifically
> > +between dom1,port1 and dom2,port2). They essentially store one bit of
> > +information, the event of interest is signalled by transitioning this bit from
> > +0 to 1. An event is an equivalent of a hardware interrupt.
> > +
> > +Notifications are received by a guest via an interrupt from Xen to the guest,
> > +indicating when an event arrives (setting the bit). Further notifications are
> > +masked until the bit is cleared again. When a domain wants to wait for data it
> > +will block until an event arrives, and then send an event to signal that data
> > +has been consumed. Events are delivered asynchronously to guests and are
> > +enqueued when the guest is not running.
> > +
> > +Event channel communication will be established statically between two domU
> > +guests before unpausing the domains after domain creation. Event channel
> > +connection information between domUs will be passed to XEN via device tree
> > +node.
> > +
> > +Under the /chosen node, there needs to be sub nodes with compatible
> > +"xen,evtchn" that descibes the event channel connection between two domUs.
> > +
> > +The event channel sub-node has the following properties:
> > +
> > +- compatible
> > +
> > +    "xen,evtchn"
> > +
> > +- xen,evtchn
> > +
> > +    The property is four numbers of tuples of
> > +    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle) where:
> > +
> > +    local-port-domU1 is an integer value that will be used to allocte local
> > +    port for domU1 to send an event notification to the remote domain.
> > +
> > +    domU1-phandle is a single phandle to an domain to which local-port-domU1
> > +    will be allocated.
> > +
> > +    local-port-domU2 is an integer value that will be used to allocte local
> > +    port for domU2 to send an event notification to the remote domain.
> > +
> > +    domU2-phandle is a single phandle to an domain to which local-port-domU2
> > +    will be allocated.
> > +
> > +Example:
> > +
> > +    chosen {
> > +        ....
> > +
> > +        domU1: domU1 {
> > +            ......
> > +        };
> > +
> > +        domU2: domU2 {
> > +            ......
> > +        };
> > +
> > +        evtchn@1 {
> > +            compatible = "xen,evtchn";
> > +            xen,evtchn = <0xa &domU1 0xb &domU2>;
> > +        };
> > +
> > +        evtchn@2 {
> > +            compatible = "xen,evtchn";
> > +            xen,evtchn = <0xc &domU1 0xd &domU2>;
> > +        };
> > +    };
> 
> There is no need to use two evtchn nodes for this given that in device
> tree it is entirely normal to have multiple tuplets in a property. Also,
> it would be good to have a version number in the compatible string so
> that we can change version in the future.
> 
> 1)
>     chosen {
>         ....
> 
>         domU1: domU1 {
>             ......
>         };
> 
>         domU2: domU2 {
>             ......
>         };
> 
>         evtchn {
>             compatible = "xen,evtchn-v1";
>             xen,evtchn = <0xa &domU1 0xb &domU2 0xc &domU1 0xd &domU2>;
>         };
>     };
> 
> 
> I should mention that it would be also possible to use sub-nodes to
> express this information:
> 
> 2)
>         domU1: domU1 {
>             ...
>             /* one sub-node per local event channel */
>             ec1: evtchn@a {
>                 compatible = "xen,evtchn-v1";
>                 /* local-evtchn link-to-foreign-evtchn */
>                 xen,evtchn = <0xa &ec3>
>             };
>             ec2: evtchn@c {
>                 compatible = "xen,evtchn-v1";
>                 xen,evtchn = <0xc &ec4>
>             };
>         };
> 
>         domU2: domU2 {
>             ...
>             ec3: evtchn@b {
>                 compatible = "xen,evtchn-v1";
>                 xen,evtchn = <0xb &ec1>
>             };
>             ec4: evtchn@d {
>                 compatible = "xen,evtchn-v1";
>                 xen,evtchn = <0xa &ec2>
>             };
>         };
>     };
> 
> This format has the advantage that doesn't need a new top-level node
> type under /chosen. That is desirable few a few reasons. Today we only
> have domains (dom0 is legacy). In the future we might have nested
> domains and non-Xen domains. With System Device Tree, domains are under
> /domains instead of /chosen.
> 
> So normally I would argue to use the sub-node format because it doesn't
> need a new top-level node under /chosen. However, in this case it looks
> like the 1) format is simpler to write and also simpler to parse in Xen.
> 
> In 1), we would need to loop over xen,evtchn and for each tuplet we
> would only need to fetch the foreign domid.
> 
> In 2), we would need to check the compatible string of every
> "xen,evtchn-v1" node, and we would have to fetch from the phandle both
> the remote event channel number but also the domain-id of the parent.
> 
> So it looks like 1) is better because it is much simpler to parse. Do
> you agree?

[...]
> 
> I think this is fine in principle. Like Jan wrote, at some point we'll
> need to specify the device tree binding to expose this information to
> the guest.

Actually, thinking more about it, I think it is likely that the guest
device tree bindings will include information about how it is supposed
to be used. For instance, the domU device tree might pair an event
channel with a shared memory region so that the domU knows that they are
expected to be used together.

If Xen is to generate such a device tree for guests, then we need that
information also on the host device tree too (the one given to Xen and
discussed here.)

So, I think it would be a good idea to discuss the domU device tree
bindings for this, as part of this design document, even if we don't
implement it straight away.
--8323329-1710515683-1649468696=:3066615--

