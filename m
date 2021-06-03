Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3F39ACF4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 23:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136562.253134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1louxa-00010D-Rm; Thu, 03 Jun 2021 21:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136562.253134; Thu, 03 Jun 2021 21:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1louxa-0000yK-Od; Thu, 03 Jun 2021 21:33:02 +0000
Received: by outflank-mailman (input) for mailman id 136562;
 Thu, 03 Jun 2021 21:33:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pgrk=K5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1louxZ-0000yE-3C
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 21:33:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6f904b6-5101-45e7-ad9a-d8ea53cf7d79;
 Thu, 03 Jun 2021 21:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B7CC613F8;
 Thu,  3 Jun 2021 21:32:59 +0000 (UTC)
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
X-Inumbo-ID: e6f904b6-5101-45e7-ad9a-d8ea53cf7d79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622755979;
	bh=7mzKDYQvsKnAd6FcZQrbNzzG+GQurCNinl6HDYlWK+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eqLL0oPVVzDEtiH56rP31crhdoTUgmqMrl2pW3Ys78/QVm446fJQf5eeGvcdYDg63
	 SHP2CIBtcqz/qEFXkU99axbkOa+Upt1q4AXZok0ukbcmmGVcpOP31dpE/kdnjtuj9I
	 ivbV5b+dsd3so/0p/hKUXMUZTAWrtURdKb0+C89ZwfnUWCRX+IIhle8G8emkJpFtpL
	 K97lDLFz2Wut0SZo2xuD7Je4uF63xe31SGu9ex3EflrpsLmbF7PWt1S/TkToMrrHnm
	 VJKunm/66v28voO4I+zvt2VNeBKs1witeALfE5LSHsz2G8Dpo033HKcrktEuS/aqCm
	 jtgOaVoJahGyg==
Date: Thu, 3 Jun 2021 14:32:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    nd <nd@arm.com>
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
In-Reply-To: <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
Message-ID: <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
References: <20210518052113.725808-1-penny.zheng@arm.com> <20210518052113.725808-2-penny.zheng@arm.com> <e1b90f06-92d2-11da-c556-4081907124b8@xen.org> <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com> <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com> <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org> <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com> <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I have not read most emails in this thread (sorry!) but I spotted this
discussion about device tree and I would like to reply to that as we
have discussed something very similar in the context of system device
tree.


On Thu, 3 Jun 2021, Julien Grall wrote:
> On 02/06/2021 11:09, Penny Zheng wrote:
> > Hi Julien
> > 
> > > -----Original Message-----
> > > From: Julien Grall <julien@xen.org>
> > > Sent: Thursday, May 20, 2021 4:51 PM
> > > To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> > > sstabellini@kernel.org
> > > Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
> > > <Wei.Chen@arm.com>; nd <nd@arm.com>
> > > Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
> > > 
> > > Hi,
> > > 
> > > On 20/05/2021 07:07, Penny Zheng wrote:
> > > > > > It will be consistent with the ones defined in the parent node,
> > > > > > domUx.
> > > > > Hmmm... To take the example you provided, the parent would be chosen.
> > > > > However, from the example, I would expect the property #{address,
> > > > > size}-cells in domU1 to be used. What did I miss?
> > > > > 
> > > > 
> > > > Yeah, the property #{address, size}-cells in domU1 will be used. And
> > > > the parent node will be domU1.
> > > 
> > > You may have misunderstood what I meant. "domU1" is the node that
> > > contains the property "xen,static-mem". The parent node would be the one
> > > above (in our case "chosen").
> > > 
> > 
> > I re-re-reconsider what you meant here, hope this time I get what you mean,
> > correct me if I'm wrong,
> > List an example here:
> > 
> >      / {
> >          reserved-memory {
> >              #address-cells = <2>;
> >              #size-cells = <2>;
> > 
> >              staticmemdomU1: static-memory@0x30000000 {
> >                  compatible = "xen,static-memory-domain";
> >                  reg = <0x0 0x30000000 0x0 0x20000000>;
> >              };
> >          };
> > 
> >          chosen {
> >              domU1 {
> >                  compatible = "xen,domain";
> >                  #address-cells = <0x1>;
> >                  #size-cells = <0x1>;
> >                  cpus = <2>;
> >                  xen,static-mem = <&staticmemdomU1>;
> > 
> >                 ...
> >              };
> >          };
> >      };
> > 
> > If user gives two different #address-cells and #size-cells in
> > reserved-memory and domU1, Then when parsing it
> > through `xen,static-mem`, it may have unexpected answers.
> 
> Why are you using the #address-cells and #size-cells from the node domU1 to
> parse staticmemdomU1?
> 
> > I could not think a way to fix it properly in codes, do you have any
> > suggestion? Or we just put a warning in doc/commits.
> 
> The correct approach is to find the parent of staticmemdomU1 (i.e.
> reserved-memory) and use the #address-cells and #size-cells from there.

Julien is right about how to parse the static-memory.

But I have a suggestion on the new binding. The /reserved-memory node is
a weird node: it is one of the very few node (the only node aside from
/chosen) which is about software configurations rather than hardware
description.

For this reason, in a device tree with multiple domains /reserved-memory
doesn't make a lot of sense: for which domain is the memory reserved?

This was one of the first points raised by Rob Herring in reviewing
system device tree.

So the solution we went for is the following: if there is a default
domain /reserved-memory applies to the default domain. Otherwise, each
domain is going to have its own reserved-memory. Example:

        domU1 {
            compatible = "xen,domain";
            #address-cells = <0x1>;
            #size-cells = <0x1>;
            cpus = <2>;

            reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
   
                static-memory@0x30000000 {
                    compatible = "xen,static-memory-domain";
                    reg = <0x0 0x30000000 0x0 0x20000000>;
                };
            };
        };


So I don't think we want to use reserved-memory for this, either
/reserved-memory or /chosen/domU1/reserved-memory. Instead it would be
good to align it with system device tree and define it as a new property
under domU1.

In system device tree we would use a property called "memory" to specify
one or more ranges, e.g.:

    domU1 {
        memory = <0x0 0x500000 0x0 0x7fb00000>;

Unfortunately for xen,domains we have already defined "memory" to
specify an amount, rather than a range. That's too bad because the most
natural way to do this would be:

    domU1 {
        size = <amount>;
        memory = <ranges>;

When we'll introduce native system device tree support in Xen we'll be
able to do that. For now, we need to come up with a different property.
For instance: "static-memory" (other names are welcome if you have a
better suggestion).

We use a new property called "static-memory" together with
#static-memory-address-cells and #static-memory-size-cells to define how
many cells to use for address and size.

Example:

    domU1 {
        #static-memory-address-cells = <2>;
        #static-memory-size-cells = <2>;
        static-memory = <0x0 0x500000 0x0 0x7fb00000>;



Another alternative would be to extend the definition of the existing
"memory" property to potentially handle not just sizes but also address
and size pairs. There are a couple of ways to do that, including using
#memory-address-cells = <0>; to specify when memory only has a size, or
changing compatible string to "xen,domain-v2". But actually I would
avoid it. I would keep it simple and just introduce a new property like
"static-memory" (we can come up with a better name).


