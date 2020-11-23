Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4FF2C185E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35209.66622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKJQ-0000Nt-8M; Mon, 23 Nov 2020 22:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35209.66622; Mon, 23 Nov 2020 22:27:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKJQ-0000NR-4F; Mon, 23 Nov 2020 22:27:56 +0000
Received: by outflank-mailman (input) for mailman id 35209;
 Mon, 23 Nov 2020 22:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khKJO-0000NM-N5
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:27:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09d3b6af-6795-497d-b1c3-f78e4847d379;
 Mon, 23 Nov 2020 22:27:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B99020715;
 Mon, 23 Nov 2020 22:27:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VxlT=E5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khKJO-0000NM-N5
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:27:54 +0000
X-Inumbo-ID: 09d3b6af-6795-497d-b1c3-f78e4847d379
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 09d3b6af-6795-497d-b1c3-f78e4847d379;
	Mon, 23 Nov 2020 22:27:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1B99020715;
	Mon, 23 Nov 2020 22:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606170473;
	bh=XTVgf6MJsIORC0sxL3htLEwzrBRdJZChC4NEG8kN+Ug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XRwAlmz74nRf162Rcwqvgh1OPWdRni+yM43ZANzvbmfP2N0CctHYseLbWeVmBwx1L
	 alXg0wID0r4YAvr9e+uu4/Z5FnuAcMQi6SjHb8fyPuwqW2kgiSineG/zK96vgk5+r5
	 2+NlcAG8re81ZGnMOWMY7ZIzEj1Nu6J3253WKaWM=
Date: Mon, 23 Nov 2020 14:27:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
Message-ID: <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-5-julien@xen.org> <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s> <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2020, Julien Grall wrote:
> > >       /*
> > >        * For arm32, page-tables are different on each CPUs. Yet, they
> > > share
> > > @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
> > >         spin_lock(&xen_pt_lock);
> > >   -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> > > +    while ( left )
> > >       {
> > > -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> > > +        unsigned int order;
> > > +        unsigned long mask;
> > > +
> > > +        /*
> > > +         * Don't take into account the MFN when removing mapping (i.e
> > > +         * MFN_INVALID) to calculate the correct target order.
> > > +         *
> > > +         * XXX: Support superpage mappings if nr is not aligned to a
> > > +         * superpage size.
> > 
> > It would be good to add another sentence to explain that the checks
> > below are simply based on masks and rely on the mfn, vfn, and also
> > nr_mfn to be superpage aligned. (It took me some time to figure it out.)
> 
> I am not sure to understand what you wrote here. Could you suggest a sentence?

Something like the following:

/*
 * Don't take into account the MFN when removing mapping (i.e
 * MFN_INVALID) to calculate the correct target order.
 *
 * This loop relies on mfn, vfn, and nr_mfn, to be all superpage
 * aligned, and it uses `mask' to check for that.
 *
 * XXX: Support superpage mappings if nr_mfn is not aligned to a
 * superpage size.
 */


> Regarding the TODO itself, we have the exact same one in the P2M code. I
> couldn't find a clever way to deal with it yet. Any idea how this could be
> solved?
 
I was thinking of a loop that start with the highest possible superpage
size that virt and mfn are aligned to, and also smaller or equal to
nr_mfn. So rather than using the mask to also make sure nr_mfns is
aligned, I would only use the mask to check that mfn and virt are
aligned. Then, we only need to check that superpage_size <= left.

Concrete example: virt and mfn are 2MB aligned, nr_mfn is 5MB / 1280 4K
pages. We allocate 2MB superpages until onlt 1MB is left. At that point
superpage_size <= left fails and we go down to 4K allocations.

Would that work?

