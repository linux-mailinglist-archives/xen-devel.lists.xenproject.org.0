Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F95204F4
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 21:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324768.546974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8m8-0005UJ-3R; Mon, 09 May 2022 19:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324768.546974; Mon, 09 May 2022 19:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8m8-0005RS-0H; Mon, 09 May 2022 19:10:32 +0000
Received: by outflank-mailman (input) for mailman id 324768;
 Mon, 09 May 2022 19:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1no8m7-0005RM-0P
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 19:10:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0feb8e8-cfcb-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 21:10:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD0C5B81905;
 Mon,  9 May 2022 19:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4D7C385B2;
 Mon,  9 May 2022 19:10:27 +0000 (UTC)
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
X-Inumbo-ID: b0feb8e8-cfcb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652123427;
	bh=lTmuOdIDLlvJ7DRmxlzn/RBRVVrlQTLw1z2YtHjZGNE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HIFZ8JMeZzjy8iXj6NQMQ6a5XEZAhqxrs6MI5SZ+ra2SlrknXOK1ebdDcvsMoSY2O
	 jEauGoshF7/sruBBPepz9prWLxT/Nr9+d1qtE3/4Vv+vSTAVZLVHtXFUhYSY/r1GdE
	 JC8uYsppKINfeetcfZPjzEUnE6IyqMH9dTyWrwNQ+R8IO0EelfA/VVgR8CA8ncxgPc
	 Xx7iHukiO15ELY0zH0Zt7hbN9LiDW9gSg2Ic/gJ9lvutx2YsG/C8Zk7HJ9KbAW3d3D
	 AI83gYH+9esp0HARxMa851KiJb0nN5gz2VY2eBOktWr55vvusKZOd0tDh5jKjDIOtI
	 rf89TBelmxjLw==
Date: Mon, 9 May 2022 12:10:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_nr
In-Reply-To: <DU2PR08MB73255A68E4FB00430263D832F7C49@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2205091204520.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-5-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2205061713070.43560@ubuntu-linux-20-04-desktop> <DU2PR08MB73255A68E4FB00430263D832F7C49@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 May 2022, Penny Zheng wrote:
> > On Fri, 6 May 2022, Penny Zheng wrote:
> > > Later, we need to add the right amount of references, which should be
> > > the number of borrower domains, to the owner domain. Since we only
> > > have
> > > get_page() to increment the page reference by 1, a loop is needed per
> > > page, which is inefficient and time-consuming.
> > >
> > > To save the loop time, this commit introduces a set of new helpers
> > > put_page_nr() and get_page_nr() to increment/drop the page reference by
> > nr.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > ---
> > > v2 change:
> > > - new commit
> > > ---
> > >  xen/arch/arm/include/asm/mm.h |  4 ++++
> > >  xen/arch/arm/mm.c             | 36 +++++++++++++++++++++++++----------
> > >  2 files changed, 30 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/include/asm/mm.h
> > > b/xen/arch/arm/include/asm/mm.h index 424aaf2823..c737d51e4d 100644
> > > --- a/xen/arch/arm/include/asm/mm.h
> > > +++ b/xen/arch/arm/include/asm/mm.h
> > > @@ -347,6 +347,10 @@ void free_init_memory(void);  int
> > > guest_physmap_mark_populate_on_demand(struct domain *d, unsigned
> > long gfn,
> > >                                            unsigned int order);
> > >
> > > +extern bool get_page_nr(struct page_info *page, const struct domain
> > *domain,
> > > +                        unsigned long nr); extern void
> > > +put_page_nr(struct page_info *page, unsigned long nr);
> > > +
> > >  extern void put_page_type(struct page_info *page);  static inline
> > > void put_page_and_type(struct page_info *page)  { diff --git
> > > a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c index 7b1f2f4906..e565979f3c
> > > 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -1537,7 +1537,8 @@ long arch_memory_op(int op,
> > XEN_GUEST_HANDLE_PARAM(void) arg)
> > >      return 0;
> > >  }
> > >
> > > -struct domain *page_get_owner_and_reference(struct page_info *page)
> > > +static struct domain *page_get_owner_and_nr_reference(struct page_info
> > *page,
> > > +                                                      unsigned long
> > > +nr)
> > >  {
> > >      unsigned long x, y = page->count_info;
> > >      struct domain *owner;
> > > @@ -1545,13 +1546,14 @@ struct domain
> > *page_get_owner_and_reference(struct page_info *page)
> > >      do {
> > >          x = y;
> > >          /*
> > > +         * Consider the minimum case(nr = 1):
> > >           * Count ==  0: Page is not allocated, so we cannot take a reference.
> > >           * Count == -1: Reference count would wrap, which is invalid.
> > >           */
> > >          if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
> > >              return NULL;
> > >      }
> > > -    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
> > > +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
> > >
> > >      owner = page_get_owner(page);
> > >      ASSERT(owner);
> > > @@ -1559,36 +1561,50 @@ struct domain
> > *page_get_owner_and_reference(struct page_info *page)
> > >      return owner;
> > >  }
> > >
> > > -void put_page(struct page_info *page)
> > > +struct domain *page_get_owner_and_reference(struct page_info *page) {
> > > +    return page_get_owner_and_nr_reference(page, 1); }
> > > +
> > > +void put_page_nr(struct page_info *page, unsigned long nr)
> > >  {
> > >      unsigned long nx, x, y = page->count_info;
> > >
> > >      do {
> > > -        ASSERT((y & PGC_count_mask) != 0);
> > > +        ASSERT(((y - nr) & PGC_count_mask) >= 0);
> > 
> > Why this change? The original ASSERT is to check that we enter the loop only
> > when count_info is greater than 0. It should still apply even for put_page_nr
> > without modifications?
> > 
> > 
> 
> Oh, I understand wrongly about the ASSERT. I thought it was to
> check the result count_info after the loop will be not smaller than 0.
> 
> Do you think we still need to ensure that? Maybe ASSERT( ((y & PGC_count_mask) != 0) && (((y - nr) & PGC_count_mask) >= 0)); ?

I think it should be:

ASSERT((y & PGC_count_mask) >= nr);

