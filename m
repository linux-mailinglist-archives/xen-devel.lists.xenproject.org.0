Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E226507D99
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 02:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308505.524270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngy9x-0007bE-PC; Wed, 20 Apr 2022 00:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308505.524270; Wed, 20 Apr 2022 00:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngy9x-0007Y0-M9; Wed, 20 Apr 2022 00:25:29 +0000
Received: by outflank-mailman (input) for mailman id 308505;
 Wed, 20 Apr 2022 00:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngy9w-0007Xr-Cb
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 00:25:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fa96b40-c040-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 02:25:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3E09FCE1AC1;
 Wed, 20 Apr 2022 00:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1940AC385A5;
 Wed, 20 Apr 2022 00:25:20 +0000 (UTC)
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
X-Inumbo-ID: 5fa96b40-c040-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650414320;
	bh=Iy+kAeZv1ZtQ8L2MtESntcdoy5vtuelI++Igl50uL4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bOBJGvFtc/9tb3BpTwMLGlkDz9lHVOZrQVvyqmW2SKGeo/TYh85uPLdjkGqW+LaZU
	 ayTVBYVwH+S/0/IMHtjIwlLQBR79ZcdVYisjdYc34qOgTxnIQPbCEApPZBz/coNeT9
	 2JlQSv4fGfJNKX/XfrOACdDpa7H08aquDgHGtVcuZBMRWUqW5+x++wh8kWL22gFNi5
	 5fHHOVXgsDt66clxT9jLJNv5E/O2qFsB67FqXCU9QA0KRu7vA8spMYndR6a17UzWK9
	 RzdwbLovWnmCTuF/0KDzwiTp3VHFcDXx9NliXchNX17RojqIRZ7FHazgdTQn9TPHAe
	 3Rm/hELufCFAQ==
Date: Tue, 19 Apr 2022 17:25:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
In-Reply-To: <076C6D09-C0DA-41BD-84CA-AD595B5AF0A2@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204191725080.915916@ubuntu-linux-20-04-desktop>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2204081837410.3066615@ubuntu-linux-20-04-desktop> <D24074F6-E6CF-440A-9E9B-A10783C273D7@arm.com>
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop> <076C6D09-C0DA-41BD-84CA-AD595B5AF0A2@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Apr 2022, Rahul Singh wrote:
> > On 14 Apr 2022, at 2:14 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
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
> > 
> > 
> > 
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
> > 
> > 
> > Short Summary
> > ------------
> > I think it is fine to only introduce the Xen device tree binding for
> > static event channels without domU binding, but I prefer if we switched
> > to using proposal 2) "one subnode per event channel".
> 
> Thanks for detailed explanation.I just did the basic implementation of the 2) proposal and
> it looks simple and not very complex as I thought earlier.Therefore I am ok to switch to proposal 2).
> 
> If everyone is ok with the 2) proposal I will send the v2 of design doc after fixing all the comments.

That's great, thank you Rahul!

