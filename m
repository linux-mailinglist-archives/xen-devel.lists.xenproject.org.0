Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90C4FE988
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 22:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303801.518253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neNIv-0007hs-Pp; Tue, 12 Apr 2022 20:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303801.518253; Tue, 12 Apr 2022 20:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neNIv-0007eD-Lr; Tue, 12 Apr 2022 20:40:01 +0000
Received: by outflank-mailman (input) for mailman id 303801;
 Tue, 12 Apr 2022 20:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URkf=UW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1neNIu-0007e7-LI
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 20:40:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7849043-baa0-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 22:39:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38EE761C14;
 Tue, 12 Apr 2022 20:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BC2C385A5;
 Tue, 12 Apr 2022 20:39:56 +0000 (UTC)
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
X-Inumbo-ID: b7849043-baa0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649795996;
	bh=/igA5A7Qbzc8ri3xw14JcLzQM47CuuY/Zi/uRXf2ehg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pvZ97SCPpg678+TeoezCN3WkkfwvpzSZLH1d+H28Wu2K5cLgum8q9MOyCCvag2cs9
	 jLOMjJ5sLn1XO48nm4820qdXvju/FRAt+EZKo5g0zq6tyxXcz6dOjjF2U9PWzqRGVh
	 fvxVvslnT9OHdlmol0wGo0Yro2tIiJvFqvm/TVFq469cJOYOy8ciXDAeXMTgSkgE5Y
	 JF2E9AGVjx8Sd3RKWOeOBcTp4HsbMEB/gcq2jp41XNx49biLgyyQb4GBh5C8tDMHKP
	 I0u8NaMtwfAN+rPsS42HG9F3tUVyAo8nnBLf5m0etSrT+E6H54joPl1sHkV58sE3lr
	 +HbqTNwQXYp5g==
Date: Tue, 12 Apr 2022 13:39:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
In-Reply-To: <0210f3c6-0f06-4ff5-9f66-8410fd540171@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204121332460.3066615@ubuntu-linux-20-04-desktop>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop> <0210f3c6-0f06-4ff5-9f66-8410fd540171@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1475397912-1649795812=:3066615"
Content-ID: <alpine.DEB.2.22.394.2204121336580.3066615@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1475397912-1649795812=:3066615
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204121336581.3066615@ubuntu-linux-20-04-desktop>

On Mon, 11 Apr 2022, Julien Grall wrote:
> On 09/04/2022 02:00, Stefano Stabellini wrote:
> > On Wed, 23 Mar 2022, Rahul Singh wrote:
> > > in dom0less system. This patch introduce the new feature to support the
> > > signaling between two domUs in dom0less system.
> > > 
> > > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > > ---
> > >   docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
> > >   1 file changed, 96 insertions(+)
> > >   create mode 100644 docs/designs/dom0less-evtchn.md
> > > 
> > > diff --git a/docs/designs/dom0less-evtchn.md
> > > b/docs/designs/dom0less-evtchn.md
> > > new file mode 100644
> > > index 0000000000..6a1b7e8c22
> > > --- /dev/null
> > > +++ b/docs/designs/dom0less-evtchn.md
> > > @@ -0,0 +1,96 @@
> > > +# Signaling support between two domUs on dom0less system
> > > +
> > > +## Current state: Draft version
> > > +
> > > +## Proposer(s): Rahul Singh, Bertrand Marquis
> > > +
> > > +## Problem Statement:
> > > +
> > > +The goal of this work is to define a simple signaling system between Xen
> > > guests
> > > +in dom0less systems.
> > > +
> > > +In dom0less system, we cannot make use of xenbus and xenstore that are
> > > used in
> > > +normal systems with dynamic VMs to communicate between domains by
> > > providing a
> > > +bus abstraction for paravirtualized drivers.
> > > +
> > > +One possible solution to implement the signaling system between domUs is
> > > based
> > > +on event channels.
> > 
> > I suggest to reword this as follows:
> > 
> > ---
> > Dom0less guests would benefit from a statically-defined memory sharing
> > and signally system for communication. One that would be immediately
> > available at boot without any need for dynamic configurations.
> > 
> > In embedded a great variety of guest operating system kernels exist,
> > many of which don't have support for xenstore, grant table or other
> > complex drivers. Some of them are small kernel-space applications (often
> > called "baremetal", not to be confused with the term "baremetal" used in
> > datacenter which means "without hypervisors") or RTOSes.  Additionally,
> > for safety reasons, users often need to be able to configure the full
> > system statically so that it can be verified statically.
> > 
> > Event channels are very simple and can be added even to baremetal
> > applications. This proposal introduces a way to define them statically
> > to make them suitable to dom0less embedded deployments.
> > ---
> > 
> > 
> > > +## Proposal:
> > > +
> > > +Event channels are the basic primitive provided by Xen for event
> > > notifications.
> > > +An event channel is a logical connection between 2 domains (more
> > > specifically
> > > +between dom1,port1 and dom2,port2). They essentially store one bit of
> > > +information, the event of interest is signalled by transitioning this bit
> > > from
> > > +0 to 1. An event is an equivalent of a hardware interrupt.
> > > +
> > > +Notifications are received by a guest via an interrupt from Xen to the
> > > guest,
> > > +indicating when an event arrives (setting the bit). Further notifications
> > > are
> > > +masked until the bit is cleared again. When a domain wants to wait for
> > > data it
> > > +will block until an event arrives, and then send an event to signal that
> > > data
> > > +has been consumed. Events are delivered asynchronously to guests and are
> > > +enqueued when the guest is not running.
> > > +
> > > +Event channel communication will be established statically between two
> > > domU
> > > +guests before unpausing the domains after domain creation. Event channel
> > > +connection information between domUs will be passed to XEN via device
> > > tree
> > > +node.
> > > +
> > > +Under the /chosen node, there needs to be sub nodes with compatible
> > > +"xen,evtchn" that descibes the event channel connection between two
> > > domUs.
> > > +
> > > +The event channel sub-node has the following properties:
> > > +
> > > +- compatible
> > > +
> > > +    "xen,evtchn"
> > > +
> > > +- xen,evtchn
> > > +
> > > +    The property is four numbers of tuples of
> > > +    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle)
> > > where:
> > > +
> > > +    local-port-domU1 is an integer value that will be used to allocte
> > > local
> > > +    port for domU1 to send an event notification to the remote domain.
> > > +
> > > +    domU1-phandle is a single phandle to an domain to which
> > > local-port-domU1
> > > +    will be allocated.
> > > +
> > > +    local-port-domU2 is an integer value that will be used to allocte
> > > local
> > > +    port for domU2 to send an event notification to the remote domain.
> > > +
> > > +    domU2-phandle is a single phandle to an domain to which
> > > local-port-domU2
> > > +    will be allocated.
> > > +
> > > +Example:
> > > +
> > > +    chosen {
> > > +        ....
> > > +
> > > +        domU1: domU1 {
> > > +            ......
> > > +        };
> > > +
> > > +        domU2: domU2 {
> > > +            ......
> > > +        };
> > > +
> > > +        evtchn@1 {
> > > +            compatible = "xen,evtchn";
> > > +            xen,evtchn = <0xa &domU1 0xb &domU2>;
> > > +        };
> > > +
> > > +        evtchn@2 {
> > > +            compatible = "xen,evtchn";
> > > +            xen,evtchn = <0xc &domU1 0xd &domU2>;
> > > +        };
> > > +    };
> > 
> > There is no need to use two evtchn nodes for this given that in device
> > tree it is entirely normal to have multiple tuplets in a property. Also,
> > it would be good to have a version number in the compatible string so
> > that we can change version in the future.
> > 
> > 1)
> >      chosen {
> >          ....
> > 
> >          domU1: domU1 {
> >              ......
> >          };
> > 
> >          domU2: domU2 {
> >              ......
> >          };
> > 
> >          evtchn {
> >              compatible = "xen,evtchn-v1";
> >              xen,evtchn = <0xa &domU1 0xb &domU2 0xc &domU1 0xd &domU2>;
> >          };
> >      };
> > 
> > 
> > I should mention that it would be also possible to use sub-nodes to
> > express this information:
> > 
> > 2)
> >          domU1: domU1 {
> >              ...
> >              /* one sub-node per local event channel */
> >              ec1: evtchn@a {
> >                  compatible = "xen,evtchn-v1";
> >                  /* local-evtchn link-to-foreign-evtchn */
> >                  xen,evtchn = <0xa &ec3>
> >              };
> >              ec2: evtchn@c {
> >                  compatible = "xen,evtchn-v1";
> >                  xen,evtchn = <0xc &ec4>
> >              };
> >          };
> > 
> >          domU2: domU2 {
> >              ...
> >              ec3: evtchn@b {
> >                  compatible = "xen,evtchn-v1";
> >                  xen,evtchn = <0xb &ec1>
> >              };
> >              ec4: evtchn@d {
> >                  compatible = "xen,evtchn-v1";
> >                  xen,evtchn = <0xd &ec2>
> >              };
> >          };
> >      };
> 
> As for 1), you could combine all the ports in one node.

I thought about it but I couldn't come up with a way to do that which
retains the simplicity of this example. The problem is that in device
tree you can only link to nodes, not to individual properties. So I
think we would have to have separate nodes for each event channel so
that we could separately link to them. 

Otherwise, we would have to add the foreign event channel number in
addition to the link to be able to distinguish them. And that would
result in duplicated information. E.g.:

       domU1: domU1 {
           ...
           /* one sub-node per local event channel */
           ec1: evtchn@a {
               compatible = "xen,evtchn-v1";
               /* local-evtchn link-to-foreign foreign-evtchn */
               xen,evtchn = <0xa &ec2 0xa 0xc &ec2 0xd>
           };
       };

       domU2: domU2 {
           ...
           ec2: evtchn@b {
               compatible = "xen,evtchn-v1";
               xen,evtchn = <0xb &ec1 0xa 0xd &ec1 0xc>
           };
       };
--8323329-1475397912-1649795812=:3066615--

