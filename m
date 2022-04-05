Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B11C4F3E93
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 22:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299270.509843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq4o-0008NH-5q; Tue, 05 Apr 2022 20:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299270.509843; Tue, 05 Apr 2022 20:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq4o-0008LR-22; Tue, 05 Apr 2022 20:46:58 +0000
Received: by outflank-mailman (input) for mailman id 299270;
 Tue, 05 Apr 2022 20:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbq4n-0008LF-3S
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 20:46:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86d87867-b521-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 22:46:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 03236CE1FEA;
 Tue,  5 Apr 2022 20:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1740BC385A3;
 Tue,  5 Apr 2022 20:46:48 +0000 (UTC)
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
X-Inumbo-ID: 86d87867-b521-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649191608;
	bh=Pu3rHnIsFQfC8fDr7MNt41ExeAmGP9LpggprWLdUJ6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bxA5r438nkJ2VBad/dFwJEo0L3RDB+1zvbdPtbpO9gUbapc8l85CMOdcAQF70EF/S
	 Kt0mmfAHzUiBSLmtq5fC/dVzbFt5VLDZ6FBHw9cmN6HA99lSf17JG55gLKqAii3atv
	 yqQ0kp0WM330LCwofVvNDctOei2xkvN18IW60c1QZmlELYf1KVLr1qK0iLKrQNSKIU
	 LJ7cvcleKrrgO9RsWVU3qJgCIDPwDOpwsSR/eWP2BpNzpNCngnEmdxX24El5IvxULg
	 C1zOSAYYcc7y/G8JJZewacQ49Brmhae+qarpZkdwNuNNytPhqR1TvIiQaXfCRwSKyY
	 CnQK5ppwJjnjw==
Date: Tue, 5 Apr 2022 13:46:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 04/19] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <a2dafd9a-a0a9-b99d-9592-4f8e5fbb3f20@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051345500.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-5-julien@xen.org> <alpine.DEB.2.22.394.2204011605580.2910984@ubuntu-linux-20-04-desktop> <a2dafd9a-a0a9-b99d-9592-4f8e5fbb3f20@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Apr 2022, Julien Grall wrote:
> On 02/04/2022 00:35, Stefano Stabellini wrote:
> > > +/* Return the level where mapping should be done */
> > > +static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned
> > > long nr,
> > > +                                unsigned int flags)
> > > +{
> > > +    unsigned int level;
> > > +    unsigned long mask;
> > 
> > Shouldn't mask be 64-bit on aarch32?
> 
> The 3 variables we will use (mfn, vfn, nr) are unsigned long. So it is fine to
> define the mask as unsigned long.

Good point


> > > +}
> > > +
> > >   static DEFINE_SPINLOCK(xen_pt_lock);
> > >     static int xen_pt_update(unsigned long virt,
> > >                            mfn_t mfn,
> > > -                         unsigned long nr_mfns,
> > > +                         const unsigned long nr_mfns,
> > 
> > Why const? nr_mfns is an unsigned long so it is passed as value: it
> > couldn't change the caller's parameter anyway. Just curious.
> 
> Because nr_mfns is used to flush the TLBs. In the original I made the mistake
> to decrement the variable and only discovered later on when the TLB contained
> the wrong entry.
> 
> Such bug tends to be very subtle and it is hard to find the root cause. So
> better mark the variable const to avoid any surprise.
> 
> The short version of what I wrote is in the commit message. I can write a
> small comment in the code if you want.

No, that's fine. Thanks for the explanation.


> > >                            unsigned int flags)
> > >   {
> > >       int rc = 0;
> > > -    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
> > > +    unsigned long vfn = virt >> PAGE_SHIFT;
> > > +    unsigned long left = nr_mfns;
> > >         /*
> > >        * For arm32, page-tables are different on each CPUs. Yet, they
> > > share
> > > @@ -1268,14 +1330,24 @@ static int xen_pt_update(unsigned long virt,
> > >         spin_lock(&xen_pt_lock);
> > >   -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> > > +    while ( left )
> > >       {
> > > -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> > > +        unsigned int order, level;
> > > +
> > > +        level = xen_pt_mapping_level(vfn, mfn, left, flags);
> > > +        order = XEN_PT_LEVEL_ORDER(level);
> > > +
> > > +        ASSERT(left >= BIT(order, UL));
> > > +
> > > +        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level,
> > > flags);
> > 
> > NIT: I know we don't have vfn_to_vaddr at the moment and there is no
> > widespread usage of vfn in Xen anyway, but it looks off to use
> > pfn_to_paddr on a vfn parameter. Maybe open-code pfn_to_paddr instead?
> > Or introduce vfn_to_vaddr locally in this file?
> 
> To avoid inconsistency with mfn_to_maddr() and gfn_to_gaddr(), I don't want ot
> introduce vfn_to_vaddr() withtout the typesafe part. I think this is a bit
> over the top for now.
> 
> So I will open-code pfn_to_paddr().

Sounds good

