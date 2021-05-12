Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FC37D46D
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 23:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126399.237962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwQt-0007JE-CI; Wed, 12 May 2021 21:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126399.237962; Wed, 12 May 2021 21:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwQt-0007GZ-8J; Wed, 12 May 2021 21:30:19 +0000
Received: by outflank-mailman (input) for mailman id 126399;
 Wed, 12 May 2021 21:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgwQr-0007GT-7i
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 21:30:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6518a3d-b686-4252-a12a-5d89cf54ddfa;
 Wed, 12 May 2021 21:30:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EAB1613E6;
 Wed, 12 May 2021 21:30:15 +0000 (UTC)
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
X-Inumbo-ID: a6518a3d-b686-4252-a12a-5d89cf54ddfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620855015;
	bh=4GO29E4P5CadwLaZmmzGQrRInrNcFgNOKyQmX0Qeh6M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H7kB4nMlt4dT5hTPNVurw8KhB9GFLNAnp08qTFUxB60QGtv7ioFSlocbE9UWB1+rg
	 wP4MixwiGLQlwkZyWNTQYY8pl5tb1WbMMdhF72YwtQIms2G5w5hnYG3SkJMcXnZOLY
	 sO/EJxCUjgpbmB1k6KfpL3Ro0Hbx082+c8VvVfARJfpXf0p1f5oTyQFohT1WhfDHtp
	 KO3m5A5gSRaDbpEyltrfw/9a0oCBnHmyaxfEbjpadBdZGhlZy5wVdPUZNKfd6eqSqU
	 QUk9l1Dj+tNPshaw4cy7hr6R62cj9y9Msfatlbn5Ul9NDkT2gkIdGDDV64sCBOUdw4
	 dcJHArdEt2PRA==
Date: Wed, 12 May 2021 14:30:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
In-Reply-To: <94e364a7-de40-93ab-6cde-a2f493540439@xen.org>
Message-ID: <alpine.DEB.2.21.2105121425500.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-3-julien@xen.org> <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s> <94e364a7-de40-93ab-6cde-a2f493540439@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/05/2021 23:26, Stefano Stabellini wrote:
> > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Currently, Xen PT helpers are only working with 4KB page granularity
> > > and open-code the generic helpers. To allow more flexibility, we can
> > > re-use the generic helpers and pass Xen's page granularity
> > > (PAGE_SHIFT).
> > > 
> > > As Xen PT helpers are used in both C and assembly, we need to move
> > > the generic helpers definition outside of the !__ASSEMBLY__ section.
> > > 
> > > Note the aliases for each level are still kept for the time being so we
> > > can avoid a massive patch to change all the callers.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > The patch is OK as is. I have a couple of suggestions for improvement
> > below. If you feel like making them, good, otherwise I am also OK if you
> > don't want to change anything.
> > 
> > 
> > > ---
> > >      Changes in v2:
> > >          - New patch
> > > ---
> > >   xen/include/asm-arm/lpae.h | 71 +++++++++++++++++++++-----------------
> > >   1 file changed, 40 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
> > > index 4fb9a40a4ca9..310f5225e056 100644
> > > --- a/xen/include/asm-arm/lpae.h
> > > +++ b/xen/include/asm-arm/lpae.h
> > > @@ -159,6 +159,17 @@ static inline bool lpae_is_superpage(lpae_t pte,
> > > unsigned int level)
> > >   #define lpae_get_mfn(pte)    (_mfn((pte).walk.base))
> > >   #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
> > >   +/* Generate an array @var containing the offset for each level from
> > > @addr */
> > > +#define DECLARE_OFFSETS(var, addr)          \
> > > +    const unsigned int var[4] = {           \
> > > +        zeroeth_table_offset(addr),         \
> > > +        first_table_offset(addr),           \
> > > +        second_table_offset(addr),          \
> > > +        third_table_offset(addr)            \
> > > +    }
> > > +
> > > +#endif /* __ASSEMBLY__ */
> > > +
> > >   /*
> > >    * AArch64 supports pages with different sizes (4K, 16K, and 64K).
> > >    * Provide a set of generic helpers that will compute various
> > > @@ -190,17 +201,6 @@ static inline bool lpae_is_superpage(lpae_t pte,
> > > unsigned int level)
> > >   #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> > >       (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
> > >   -/* Generate an array @var containing the offset for each level from
> > > @addr */
> > > -#define DECLARE_OFFSETS(var, addr)          \
> > > -    const unsigned int var[4] = {           \
> > > -        zeroeth_table_offset(addr),         \
> > > -        first_table_offset(addr),           \
> > > -        second_table_offset(addr),          \
> > > -        third_table_offset(addr)            \
> > > -    }
> > > -
> > > -#endif /* __ASSEMBLY__ */
> > > -
> > >   /*
> > >    * These numbers add up to a 48-bit input address space.
> > >    *
> > > @@ -211,26 +211,35 @@ static inline bool lpae_is_superpage(lpae_t pte,
> > > unsigned int level)
> > >    * therefore 39-bits are sufficient.
> > >    */
> > >   -#define LPAE_SHIFT      9
> > > -#define LPAE_ENTRIES    (_AC(1,U) << LPAE_SHIFT)
> > > -#define LPAE_ENTRY_MASK (LPAE_ENTRIES - 1)
> > > -
> > > -#define THIRD_SHIFT    (PAGE_SHIFT)
> > > -#define THIRD_ORDER    (THIRD_SHIFT - PAGE_SHIFT)
> > > -#define THIRD_SIZE     (_AT(paddr_t, 1) << THIRD_SHIFT)
> > > -#define THIRD_MASK     (~(THIRD_SIZE - 1))
> > > -#define SECOND_SHIFT   (THIRD_SHIFT + LPAE_SHIFT)
> > > -#define SECOND_ORDER   (SECOND_SHIFT - PAGE_SHIFT)
> > > -#define SECOND_SIZE    (_AT(paddr_t, 1) << SECOND_SHIFT)
> > > -#define SECOND_MASK    (~(SECOND_SIZE - 1))
> > > -#define FIRST_SHIFT    (SECOND_SHIFT + LPAE_SHIFT)
> > > -#define FIRST_ORDER    (FIRST_SHIFT - PAGE_SHIFT)
> > > -#define FIRST_SIZE     (_AT(paddr_t, 1) << FIRST_SHIFT)
> > > -#define FIRST_MASK     (~(FIRST_SIZE - 1))
> > > -#define ZEROETH_SHIFT  (FIRST_SHIFT + LPAE_SHIFT)
> > > -#define ZEROETH_ORDER  (ZEROETH_SHIFT - PAGE_SHIFT)
> > > -#define ZEROETH_SIZE   (_AT(paddr_t, 1) << ZEROETH_SHIFT)
> > > -#define ZEROETH_MASK   (~(ZEROETH_SIZE - 1))
> > 
> > Should we add a one-line in-code comment saying that the definitions
> > below are for 4KB pages? It is not immediately obvious any longer.
> 
> Because they are not meant to be for 4KB pages. They are meant to be for Xen
> page size.
> 
> Today, it is always 4KB but I would like the Xen code to not rely on that.
> 
> I can clarify it in an in-code comment.

That would help I think


> > > +#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
> > > +#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
> > > +#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> > > 
> > > +#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> > > +#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> > > +#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> > > +#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> > 
> > I would avoid adding these 4 macros. It would be OK if they were just
> > used within this file but lpae.h is a header: they could end up be used
> > anywhere in the xen/ code and they have a very generic name. My
> > suggestion would be to skip them and just do:
> 
> Those macros will be used in follow-up patches. They are pretty useful to
> avoid introduce static array with the different information for each level.
> 
> Would prefix them with XEN_ be better?

Maybe. The concern I have is that there are multiple page granularities
(4kb, 16kb, etc) and multiple page sizes (4kb, 2mb, etc). If I just see
LEVEL_ORDER it is not immediately obvious what granularity and what size
we are talking about.

I think using a name that makes it clear that they are referring to Xen
pages, currently 4kb, it would make sense. Or maybe a in-code comment
would be sufficient.

I don't have a great suggestion here so I'll leave it to you. I am also
OK to keep them as is.


> > #define THIRD_SHIFT         LEVEL_SHIFT_GS(PAGE_SHIFT, 3)
> > 
> > etc.
> > 
> > 
> > > +/* Convenience aliases */
> > > +#define THIRD_SHIFT         LEVEL_SHIFT(3)
> > > +#define THIRD_ORDER         LEVEL_ORDER(3)
> > > +#define THIRD_SIZE          LEVEL_SIZE(3)
> > > +#define THIRD_MASK          LEVEL_MASK(3)
> > > +
> > > +#define SECOND_SHIFT        LEVEL_SHIFT(2)
> > > +#define SECOND_ORDER        LEVEL_ORDER(2)
> > > +#define SECOND_SIZE         LEVEL_SIZE(2)
> > > +#define SECOND_MASK         LEVEL_MASK(2)
> > > +
> > > +#define FIRST_SHIFT         LEVEL_SHIFT(1)
> > > +#define FIRST_ORDER         LEVEL_ORDER(1)
> > > +#define FIRST_SIZE          LEVEL_SIZE(1)
> > > +#define FIRST_MASK          LEVEL_MASK(1)
> > > +
> > > +#define ZEROETH_SHIFT       LEVEL_SHIFT(0)
> > > +#define ZEROETH_ORDER       LEVEL_ORDER(0)
> > > +#define ZEROETH_SIZE        LEVEL_SIZE(0)
> > > +#define ZEROETH_MASK        LEVEL_MASK(0)
> > >     /* Calculate the offsets into the pagetables for a given VA */
> > >   #define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
> > > -- 
> > > 2.17.1
> > > 
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

