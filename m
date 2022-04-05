Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D74F3EC1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 22:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299278.509865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq7n-0001UW-SX; Tue, 05 Apr 2022 20:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299278.509865; Tue, 05 Apr 2022 20:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq7n-0001Qh-OR; Tue, 05 Apr 2022 20:50:03 +0000
Received: by outflank-mailman (input) for mailman id 299278;
 Tue, 05 Apr 2022 20:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbq7m-0001Cp-Jj
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 20:50:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5d71cbb-b521-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 22:50:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DFC361A33;
 Tue,  5 Apr 2022 20:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5509BC385A0;
 Tue,  5 Apr 2022 20:49:59 +0000 (UTC)
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
X-Inumbo-ID: f5d71cbb-b521-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649191799;
	bh=0YaxkY0Fk1Ka/2d7/myeTwLJd9zXxqB/S4aWnOgA38s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jz+prIySMsPDF5I4FLICNLnBvOdtjewr8/Ka+vPpmxBzXn6zOfGvFuZVsP/ITkACD
	 DvKvcdgrkxPa5sesjt8pqF/1E8aqbauYbjxXXMtdxKdk7c+atKZsLiPM8khjUC5E+L
	 gqfX31L8VqDaoRtH2DyJSCb5whh4yP4QiBg3HeRhGTU+7q8+nNxyLo3ryr6S4pHc53
	 +duTzXSVXW07G/j0ESUw5aHS1crWBpZY9wWe73EIb/4ba1U/ctsF/HRn0bPSQBkaJx
	 4AfNpfGstxi8LHIEfUIjr/JhVi24QTmCCQjGAjl3FTPKXBD/7lxjJC0bSOQ3B4yIOi
	 YDAZUinwoQ9zQ==
Date: Tue, 5 Apr 2022 13:49:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 06/19] xen/arm: mm: Avoid flushing the TLBs when
 mapping are inserted
In-Reply-To: <f0d3ed02-450f-9bd1-e8ab-5594234a835d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051348200.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-7-julien@xen.org> <alpine.DEB.2.22.394.2204011657080.2910984@ubuntu-linux-20-04-desktop> <f0d3ed02-450f-9bd1-e8ab-5594234a835d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Apr 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 02/04/2022 01:00, Stefano Stabellini wrote:
> > On Mon, 21 Feb 2022, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Currently, the function xen_pt_update() will flush the TLBs even when
> > > the mappings are inserted. This is a bit wasteful because we don't
> > > allow mapping replacement. Even if we were, the flush would need to
> > > happen earlier because mapping replacement should use Break-Before-Make
> > > when updating the entry.
> > > 
> > > A single call to xen_pt_update() can perform a single action. IOW, it
> > > is not possible to, for instance, mix inserting and removing mappings.
> > > Therefore, we can use `flags` to determine what action is performed.
> > > 
> > > This change will be particularly help to limit the impact of switching
> > > boot time mapping to use xen_pt_update().
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ---
> > >      Changes in v2:
> > >          - New patch
> > > ---
> > >   xen/arch/arm/mm.c | 17 ++++++++++++++---
> > >   1 file changed, 14 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > index fd16c1541ce2..7b4b9de8693e 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -1104,7 +1104,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t
> > > mfn, unsigned int level,
> > >           /* We should be here with a valid MFN. */
> > >           ASSERT(!mfn_eq(mfn, INVALID_MFN));
> > >   -        /* We don't allow replacing any valid entry. */
> > > +        /*
> > > +         * We don't allow replacing any valid entry.
> > > +         *
> > > +         * Note that the function xen_pt_update() relies on this
> > > +         * assumption and will skip the TLB flush. The function will need
> > > +         * to be updated if the check is relaxed.
> > > +         */
> > >           if ( lpae_is_valid(entry) )
> > >           {
> > >               if ( lpae_is_mapping(entry, level) )
> > > @@ -1417,11 +1423,16 @@ static int xen_pt_update(unsigned long virt,
> > >       }
> > >         /*
> > > -     * Flush the TLBs even in case of failure because we may have
> > > +     * The TLBs flush can be safely skipped when a mapping is inserted
> > > +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
> > > +     *
> > > +     * For all the other cases, the TLBs will be flushed unconditionally
> > > +     * even if the mapping has failed. This is because we may have
> > >        * partially modified the PT. This will prevent any unexpected
> > >        * behavior afterwards.
> > >        */
> > > -    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> > > +    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
> > > +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> > 
> > I am trying to think of a care where the following wouldn't be enough
> > but I cannot come up with one:
> > 
> >     if ( mfn_eq(mfn, INVALID_MFN) )
> >         flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> 
> _PAGE_PRESENT is not set for two cases: when removing a page or populating
> page-tables for a region. Both of them will expect an INVALID_MFN (see the two
> asserts in xen_pt_check_entry()).
> 
> Therefore your solution should work. However, technically the 'mfn' is ignored
> in both situation (hence why this is an ASSERT() rather than a prod check).
> 
> Also, I feel it is better to flush more than less (missing a flush could have
> catastrophic result). So I chose to be explicit in which case the flush can be
> skipped.
> 
> Maybe it would be clearer if I write:
> 
>  !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN))

It is not much a matter of clarity -- I just wanted to check with you
the reasons for the if condition because, as you wrote, wrong tlb
flushes can have catastrophic effects.

That said, actually I prefer your second version:

  !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN))

