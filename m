Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B539AEEC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 01:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136603.253201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loxBs-00085i-EK; Thu, 03 Jun 2021 23:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136603.253201; Thu, 03 Jun 2021 23:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loxBs-00083p-AL; Thu, 03 Jun 2021 23:55:56 +0000
Received: by outflank-mailman (input) for mailman id 136603;
 Thu, 03 Jun 2021 23:55:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pgrk=K5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1loxBq-00083j-4a
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 23:55:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e145c33d-1adf-48a2-8533-838c257a1e3a;
 Thu, 03 Jun 2021 23:55:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 520826135E;
 Thu,  3 Jun 2021 23:55:52 +0000 (UTC)
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
X-Inumbo-ID: e145c33d-1adf-48a2-8533-838c257a1e3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622764552;
	bh=KsaJKBQwAcW5BnlUQPtVHaS0rfnoyn2RvUPmiM9cJ14=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kdEJuNesLUOUQle/0fRKVUdW/+mWmtygQSfa/OW61lcop/5CaVXM+Ye+RCSSfKJcl
	 4bw9NjDgdcxHm+/4v/v3iPFAAoFqlLnd6cYaBfrKrVXIQH1kTUHyHiuWBwrhTP3dXi
	 W4g76EZVcBoBoC3dL6DBSZRjQIL01C2WeEdsDA9Wgwu+zXnUVeGC/EaQBW4ISgr5eG
	 ENmm+sN6ochrutDyIeNf68LYpIVH+dgj3JlUvJUPfRAudOalqB7j/1mPvZkSGpA+KF
	 G+yMM/KNGRAPcXYhHhvqddb70RQoBhS6vRgVuecb+Aq8rrB0lta0E/y15TM+TMMrRf
	 RqJQVg9X2+f6Q==
Date: Thu, 3 Jun 2021 16:55:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    nd <nd@arm.com>
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
In-Reply-To: <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
References: <20210518052113.725808-1-penny.zheng@arm.com> <20210518052113.725808-2-penny.zheng@arm.com> <e1b90f06-92d2-11da-c556-4081907124b8@xen.org> <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com> <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com> <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org> <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com> <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s> <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jun 2021, Julien Grall wrote:
> On Thu, 3 Jun 2021 at 22:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Thu, 3 Jun 2021, Julien Grall wrote:
> > > On 02/06/2021 11:09, Penny Zheng wrote:
> > > > I could not think a way to fix it properly in codes, do you have any
> > > > suggestion? Or we just put a warning in doc/commits.
> > >
> > > The correct approach is to find the parent of staticmemdomU1 (i.e.
> > > reserved-memory) and use the #address-cells and #size-cells from there.
> >
> > Julien is right about how to parse the static-memory.
> >
> > But I have a suggestion on the new binding. The /reserved-memory node is
> > a weird node: it is one of the very few node (the only node aside from
> > /chosen) which is about software configurations rather than hardware
> > description.
> >
> > For this reason, in a device tree with multiple domains /reserved-memory
> > doesn't make a lot of sense: for which domain is the memory reserved?
> 
> IHMO, /reserved-memory refers to the memory that the hypervisor should
> not touch. It is just a coincidence that most of the domains are then
> passed through to dom0.
>
> This also matches the fact that the GIC, /memory is consumed by the
> hypervisor directly and not the domain..

In system device tree one of the key principles is to distinguish between
hardware description and domains configuration. The domains
configuration is under /domains (originally it was under /chosen then
the DT maintainers requested to move it to its own top-level node), while
everything else is for hardware description.

/chosen and /reserved-memory are exceptions. They are top-level nodes
but they are for software configurations. In system device tree
configurations go under the domain node. This makes sense: Xen, dom0 and
domU can all have different reserved-memory and chosen configurations.

/domains/domU1/reserved-memory gives us a clear way to express
reserved-memory configurations for domU1.

Which leaves us with /reserved-memory. Who is that for? It is for the
default domain.

The default domain is the one receiving all devices by default. In a Xen
setting, it is probably Dom0. In this case, we don't want to add
reserved-memory regions for DomUs to Dom0's list. Dom0's reserved-memory
list is for its own drivers. We could also make an argument that the
default domain is Xen itself. From a spec perspective, that would be
fine too. In this case, /reserved-memory is a list of memory regions
reserved for Xen drivers.  Either way, I don't think is a great fit for
domains memory allocations.


> > This was one of the first points raised by Rob Herring in reviewing
> > system device tree.
> >
> > So the solution we went for is the following: if there is a default
> > domain /reserved-memory applies to the default domain. Otherwise, each
> > domain is going to have its own reserved-memory. Example:
> >
> >         domU1 {
> >             compatible = "xen,domain";
> >             #address-cells = <0x1>;
> >             #size-cells = <0x1>;
> >             cpus = <2>;
> >
> >             reserved-memory {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >
> >                 static-memory@0x30000000 {
> >                     compatible = "xen,static-memory-domain";
> >                     reg = <0x0 0x30000000 0x0 0x20000000>;
> >                 };
> >             };
> >         };
> 
> This sounds wrong to me because the memory is reserved from the
> hypervisor PoV not from the domain. IOW, when I read this, I think the
> memory will be reserved in the domain.

It is definitely very wrong to place the static-memory allocation under
/chosen/domU1/reserved-memory. Sorry if I caused confusion. I only meant
it as an example of how reserved-memory (actual reserved-memory list
driver-specific memory ranges) is used.


> >
> > So I don't think we want to use reserved-memory for this, either
> > /reserved-memory or /chosen/domU1/reserved-memory. Instead it would be
> > good to align it with system device tree and define it as a new property
> > under domU1.
> 
> Do you have any formal documentation of the system device-tree?

It lives here:
https://github.com/devicetree-org/lopper/tree/master/specification

Start from specification.md. It is the oldest part of the spec, so it is
not yet written with a formal specification language.

FYI there are a number of things in-flight in regards to domains that
we discussed in the last call but they are not yet settled, thus, they
are not yet committed (access flags definitions and hierarchical
domains). However, they don't affect domains memory allocations so from
that perspective nothing has changed.


> > In system device tree we would use a property called "memory" to specify
> > one or more ranges, e.g.:
> >
> >     domU1 {
> >         memory = <0x0 0x500000 0x0 0x7fb00000>;
> >
> > Unfortunately for xen,domains we have already defined "memory" to
> > specify an amount, rather than a range. That's too bad because the most
> > natural way to do this would be:
> >
> >     domU1 {
> >         size = <amount>;
> >         memory = <ranges>;
> >
> > When we'll introduce native system device tree support in Xen we'll be
> > able to do that. For now, we need to come up with a different property.
> > For instance: "static-memory" (other names are welcome if you have a
> > better suggestion).
> >
> > We use a new property called "static-memory" together with
> > #static-memory-address-cells and #static-memory-size-cells to define how
> > many cells to use for address and size.
> >
> > Example:
> >
> >     domU1 {
> >         #static-memory-address-cells = <2>;
> >         #static-memory-size-cells = <2>;
> >         static-memory = <0x0 0x500000 0x0 0x7fb00000>;
> 
> This is pretty similar to what Penny suggested. But I dislike it
> because of the amount of code that needs to be duplicated with the
> reserved memory.

Where is the code duplication? In the parsing itself?

If there is code duplication, can we find a way to share some of the
code to avoid the duplication?

