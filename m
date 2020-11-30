Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906CE2C908A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 23:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41495.74680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrIX-0007Ik-L3; Mon, 30 Nov 2020 22:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41495.74680; Mon, 30 Nov 2020 22:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrIX-0007IL-I1; Mon, 30 Nov 2020 22:05:29 +0000
Received: by outflank-mailman (input) for mailman id 41495;
 Mon, 30 Nov 2020 22:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs/p=FE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kjrIW-0007IG-7h
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 22:05:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e11f1b65-4675-4214-9e42-c131d4317e0a;
 Mon, 30 Nov 2020 22:05:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 244D42076C;
 Mon, 30 Nov 2020 22:05:26 +0000 (UTC)
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
X-Inumbo-ID: e11f1b65-4675-4214-9e42-c131d4317e0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606773926;
	bh=rgXlfBrxIRPu9ogxe3dMJbhm9O98pcHHp9kCwex3gC4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m6IpA0gQ9tGRJIA2RWXS8qFQVLmUM8GAHFmsqlU0zrhqWH0Ytv7sJmn9aj6fBMmgo
	 JOwJcYvMKNBHedg3lgnsaNxn+5FrExB5f0gwJq5uQa374me++3E4Gx2FD+x43O+2h1
	 l6IeQkfjjRnS7HdehGfJcw968y4Q94qgL5xaukDo=
Date: Mon, 30 Nov 2020 14:05:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <d02e29cb-a4f1-4ebe-a04f-67b4a159a193@xen.org>
Message-ID: <alpine.DEB.2.21.2011301359290.1100@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-5-julien@xen.org> <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s> <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org> <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
 <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org> <alpine.DEB.2.21.2011231612330.7979@sstabellini-ThinkPad-T480s> <d02e29cb-a4f1-4ebe-a04f-67b4a159a193@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 28 Nov 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/11/2020 00:25, Stefano Stabellini wrote:
> > On Mon, 23 Nov 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 23/11/2020 22:27, Stefano Stabellini wrote:
> > > > On Fri, 20 Nov 2020, Julien Grall wrote:
> > > > > > >         /*
> > > > > > >          * For arm32, page-tables are different on each CPUs. Yet,
> > > > > > > they
> > > > > > > share
> > > > > > > @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long
> > > > > > > virt,
> > > > > > >           spin_lock(&xen_pt_lock);
> > > > > > >     -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> > > > > > > +    while ( left )
> > > > > > >         {
> > > > > > > -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> > > > > > > +        unsigned int order;
> > > > > > > +        unsigned long mask;
> > > > > > > +
> > > > > > > +        /*
> > > > > > > +         * Don't take into account the MFN when removing mapping
> > > > > > > (i.e
> > > > > > > +         * MFN_INVALID) to calculate the correct target order.
> > > > > > > +         *
> > > > > > > +         * XXX: Support superpage mappings if nr is not aligned
> > > > > > > to a
> > > > > > > +         * superpage size.
> > > > > > 
> > > > > > It would be good to add another sentence to explain that the checks
> > > > > > below are simply based on masks and rely on the mfn, vfn, and also
> > > > > > nr_mfn to be superpage aligned. (It took me some time to figure it
> > > > > > out.)
> > > > > 
> > > > > I am not sure to understand what you wrote here. Could you suggest a
> > > > > sentence?
> > > > 
> > > > Something like the following:
> > > > 
> > > > /*
> > > >    * Don't take into account the MFN when removing mapping (i.e
> > > >    * MFN_INVALID) to calculate the correct target order.
> > > >    *
> > > >    * This loop relies on mfn, vfn, and nr_mfn, to be all superpage
> > > >    * aligned, and it uses `mask' to check for that.
> > > 
> > > Unfortunately, I am still not sure to understand this comment.
> > > The loop can deal with any (super)page size (4KB, 2MB, 1GB). There are no
> > > assumption on any alignment for mfn, vfn and nr_mfn.
> > > 
> > > By OR-ing the 3 components together, we can use it to find out the maximum
> > > size that can be used for the mapping.
> > > 
> > > So can you clarify what you mean?
> > 
> > In pseudo-code:
> > 
> >    mask = mfn | vfn | nr_mfns;
> >    if (mask & ((1<<FIRST_ORDER) - 1))
> >    if (mask & ((1<<SECOND_ORDER) - 1))
> >    if (mask & ((1<<THIRD_ORDER) - 1))
> >    ...
> > 
> > As you wrote the mask is used to find the max size that can be used for
> > the mapping.
> > 
> > But let's take nr_mfns out of the equation for a moment for clarity:
> > 
> >    mask = mfn | vfn;
> >    if (mask & ((1<<FIRST_ORDER) - 1))
> >    if (mask & ((1<<SECOND_ORDER) - 1))
> >    if (mask & ((1<<THIRD_ORDER) - 1))
> >    ...
> > 
> > How would you describe this check? I'd call this an alignment check,
> > is it not?
> If you take the ``if`` alone, yes they are alignment check. But if you take
> the overall code, then it will just compute which mapping size can be used.
> 
> However, what I am disputing here is "rely" because there are no assumption
> made on the alignment in the loop (we are able to cater any size). In fact,
> the fact mfn and vfn should be aligned to the mapping size is a requirement
> from the hardware and not the implementation.

OK, maybe the "rely" gives a bad impression. What about:

This loop relies on mfn, vfn, and nr_mfn, to be all superpage aligned
(mfn and vfn have to be architecturally), and it uses `mask' to check
for that.

Feel free to reword it differently if you have a better idea.

