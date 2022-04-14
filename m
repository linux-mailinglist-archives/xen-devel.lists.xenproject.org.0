Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2A5019BB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 19:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304962.519734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf30S-0004Bq-P9; Thu, 14 Apr 2022 17:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304962.519734; Thu, 14 Apr 2022 17:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf30S-0004A0-MF; Thu, 14 Apr 2022 17:11:44 +0000
Received: by outflank-mailman (input) for mailman id 304962;
 Thu, 14 Apr 2022 17:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nf30R-00049u-5p
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 17:11:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ed911b-bc15-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 19:11:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4174B82AE5;
 Thu, 14 Apr 2022 17:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A956C385A5;
 Thu, 14 Apr 2022 17:11:39 +0000 (UTC)
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
X-Inumbo-ID: f3ed911b-bc15-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649956299;
	bh=RlbnDQE8CrHXLBBWm8AbRoILmKHoCiwRsc3a4lBjJPE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r9YY9cKzSPn2Gr2JdVi+jTjn2+HZAp6X8GTLKxp7cJ9xF/b3BGAALuMn2KXE8bwjV
	 2Ll7713S//U+J5Tyg1pjFpz5ooZopF5afuBo+/gu4TTkSG8thGqYvYVtdLFF5vcS7A
	 lR2chB2vNOxafHpInwxu5W+70ftxH5rpMd2AfQNGaaR9TL8tHUuECJWKy1kkpxghSS
	 tHDz+xxBFaECaM0iKQvH1AoH4BihJwYvsJws5Dq4SlCSbf9znMX5AaG5ANu8pytCEn
	 4XNE+3Hohth8b61MacfWI9br27YXEC+zv2XrripGxsgnk5DedVKL6TMNokuydWWocJ
	 2yxyBXbRzFrxw==
Date: Thu, 14 Apr 2022 10:11:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
In-Reply-To: <BA690DF6-577C-44CD-BB01-2E8B2FCFEFC6@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204141001580.3066615@ubuntu-linux-20-04-desktop>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2204081837410.3066615@ubuntu-linux-20-04-desktop> <D24074F6-E6CF-440A-9E9B-A10783C273D7@arm.com>
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop> <BA690DF6-577C-44CD-BB01-2E8B2FCFEFC6@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Bertrand Marquis wrote:
> > On 14 Apr 2022, at 02:14, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 11 Apr 2022, Bertrand Marquis wrote:
> >> What you mention here is actually combining 2 different solutions inside
> >> Xen to build a custom communication solution.
> >> My assumption here is that the user will actually create the device tree
> >> nodes he wants to do that and we should not create guest node entries
> >> as it would enforce some design.
> >> 
> >> If everything can be statically defined for Xen then the user can also
> >> statically define node entries inside his guest to make use of the events
> >> and the shared memories.
> >> 
> >> For example one might need more than one event to build a communication
> >> system, or more than one shared memory or could build something
> >> communicating with multiple guest thus requiring even more events and
> >> shared memories.
> > 
> > Hi Bertrand, Rahul,
> > 
> > If the guests are allowed some level of dynamic discovery, this feature
> > is not needed. They can discover the shared memory location from the
> > domU device tree, then proceed to allocate evtchns as needed and tell
> > the other end the evtchn numbers over shared memory. I already have an
> > example of it here:
> > 
> > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2251030537/Xen+Shared+Memory+and+Interrupts+Between+VMs
> > 
> > What if the guest doesn't support device tree at runtime, like baremetal
> > or Zephyr? The shared memory address can be hardcoded or generated from
> > device tree at build time. That's no problem. Then, the event channels
> > can still be allocated at runtime and passed to the other end over
> > shared memory. That's what the example on the wikipage does.
> > 
> > 
> > When are static event channels actually useful? When the application
> > cannot allocate the event channels at runtime at all. The reason for the
> > restriction could be related to safety (no dynamic allocations at
> > runtime) or convenience (everything else is fully static, why should the
> > event channel numbers be dynamic?)
> 
> An other use case here is dom0less: you cannot have dom0 create them.
> 
> > 
> > Given the above, I can see why there is no need to describe the static
> > event channel info in the domU device tree: static event channels are
> > only useful in fully static configurations, and in those configurations
> > the domU device tree dynamically generated by Xen is not needed. I can
> > see where you are coming from.
> > 
> > 
> > The workflow that we have been trying to enable with the System Device
> > Tree effort (System Device Tree is similar to a normal Device Tree plus
> > the xen,domains nodes) is the following:
> > 
> > S-DT ---[lopper]---> Linux DT
> >                L--> Zephyr DT ---[Zephyr build]---> Zephyr .h files
> > 
> > S-DT contains all the needed information for both the regular Linux DT
> > generation and also the Zephyr/RTOS/baremetal header files generation,
> > that happens at build time.
> > 
> > S-DT is not the same as the Xen device tree, but so far it has been
> > conceptually and practically similar. I always imagine that the bindings
> > we have in Xen we'll also have corresponding bindings in System Device
> > Tree.
> > 
> > For this workflow to work S-DT needs all the info so that both Linux DT
> > and Zephyr DT and Zephyr .h files can be generated.
> > 
> > Does this proposal contain enough information so that Zephyr .h files
> > could be statically generated with the event channel numbers and static
> > shared memory regions addresses?
> > 
> > I am not sure. Maybe not?
> 
> Yes it should be possible to have all infos as the integrator will setup the
> system and will decide upfront the address and the event(s) number(s).
> 
> > 
> > 
> > It is possible that the shared memory usage is so application specific
> > that there is no point in even talking about it. But I think that
> > introducing a simple bundle of both event channels and shared memory
> > would help a lot.
> > 
> > Something like the following in the Xen device tree would be enough to
> > specify an arbitrary number of event channels connected with the same
> > domains sharing the memory region.
> > 
> > It looks like that if we did the below, we would carry a lot more useful
> > information compared to the original proposal alone. We could add a
> > similar xen,notificaiton property to the domU reserved-memory region in
> > device tree generated by Xen for consistency, so that everything
> > available to the domU is described fully in device tree.
> > 
> > 
> >    domU1 {
> >        compatible = "xen,domain";
> > 
> >        /* one sub-node per local event channel */
> >        ec1: evtchn@1 {
> >            compatible = "xen,evtchn-v1";
> >            /* local-evtchn link-to-foreign-evtchn */
> >            xen,evtchn = <0x1 &ec3>
> >        };
> >        ec2: evtchn@2 {
> >            compatible = "xen,evtchn-v1";
> >            xen,evtchn = <0x2 &ec4>
> >        };
> >        /*
> >         * shared memory region between DomU1 and DomU2.
> >         */
> >        domU1-shared-mem@50000000 {
> >            compatible = "xen,domain-shared-memory-v1";
> >            xen,shm-id = <0x1>;
> >            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
> >            /* this is new */
> >            xen,notification = <&ec1 &ec2>;
> >        }
> >    };
> > 
> >    domU2 {
> >        compatible = "xen,domain";
> > 
> >        /* one sub-node per local event channel */
> >        ec3: evtchn@3 {
> >            compatible = "xen,evtchn-v1";
> >            /* local-evtchn link-to-foreign-evtchn */
> >            xen,evtchn = <0x3 &ec1>
> >        };
> >        ec4: evtchn@4 {
> >            compatible = "xen,evtchn-v1";
> >            xen,evtchn = <0x4 &ec2>
> >        };
> >        /*
> >         * shared memory region between domU1 and domU2.
> >         */
> >        domU2-shared-mem@50000000 {
> >            compatible = "xen,domain-shared-memory-v1";
> >            xen,shm-id = <0x1>;
> >            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
> >            /* this is new */
> >            xen,notification = <&ec3 &ec4>;
> >        }
> >    };
> 
> Few remarks/questions on this:
> - this is not a shared memory anymore as you add a notification system to it
> - what if someone wants to use only a shared memory, or an event, what should xen do ?

They still can. xen,notification would only be an optional property, not
a mandatory property. So it is still possible to have shared memory
without notifications (skip the xen,notification property), or event
channels without shared memory (do not link the evtchn to
xen,notification).


> - in xen device tree, how do you associate the event with the shared memory ?

I don't think I understand the question. The example above shows how to
associate the event with the shared memory: the only additional thing
needed (compared to proposal 2 already discussed) is the new optional
property xen,notification.

Xen itself wouldn't have to do anything special when xen,notification is
specified, but would add a similar optional xen,notification property to
the generated domU device tree.


> > The good thing about this is that:
> > 
> > - it is very flexible
> > - nothing to do in this series, except switching to the
> >  one-subnode-per-evtchn model, which we called 2) in the previous email
> > - there were good reasons to use the one-subnode-per-evtchn model anyway
> > - the xen,notification property can be added later without issues, after Penny's series
> > 
> > There are a couple of ways to implement the xen,notification property
> > but we don't need to discuss them now.
> 
> I think there is something to do here but we need a bit more discussion and this can be done later.
> Right now I am not quite sure we will not add something that will end up not being used.
 
Yes, I am not asking to add xen,notification now, neither to the Xen
device tree or the domU device tree. I am only trying to make sure it
would be possible do something like it without major changes to the
existing device tree. And I think it is possible if we use proposal 2).
 

> > Short Summary
> > ------------
> > I think it is fine to only introduce the Xen device tree binding for
> > static event channels without domU binding, but I prefer if we switched
> > to using proposal 2) "one subnode per event channel".
> 
> I will let Rahul answer on that.


