Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DA2B9FF5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 02:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31515.61944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfvV3-0005B2-9z; Fri, 20 Nov 2020 01:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31515.61944; Fri, 20 Nov 2020 01:46:09 +0000
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
	id 1kfvV3-0005Ag-5j; Fri, 20 Nov 2020 01:46:09 +0000
Received: by outflank-mailman (input) for mailman id 31515;
 Fri, 20 Nov 2020 01:46:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfvV1-0005AZ-F2
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:46:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 791fc257-8a63-47dd-8298-a17fa9d82606;
 Fri, 20 Nov 2020 01:46:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26BBA22201;
 Fri, 20 Nov 2020 01:46:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfvV1-0005AZ-F2
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:46:07 +0000
X-Inumbo-ID: 791fc257-8a63-47dd-8298-a17fa9d82606
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 791fc257-8a63-47dd-8298-a17fa9d82606;
	Fri, 20 Nov 2020 01:46:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 26BBA22201;
	Fri, 20 Nov 2020 01:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605836765;
	bh=V5boTDEjdkYilLFmPcgOgYX+IVrjIZnVUJnGU+ojcEQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sWT2LdzUb89InejWQmmCK9q/N3hNscjmAC0rygmCJ/pc2oRzOax1LVxdYujHaUoVU
	 2Hi1tsDAT5UL7eBFf9JoOAMYbmPxjKMFiEc5CsPMGR68cpVWKjQRkdN/wDcHpbmodS
	 VLk6etECtFeSRyAAmmsSw+xYVnovP5tkn6vVxGKU=
Date: Thu, 19 Nov 2020 17:46:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <20201119190751.22345-5-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-5-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> At the moment, xen_pt_update_entry() only supports mapping at level 3
> (i.e 4KB mapping). While this is fine for most of the runtime helper,
> the boot code will require to use superpage mapping.
> 
> We don't want to allow superpage mapping by default as some of the
> callers may expect small mappings (i.e populate_pt_range()) or even
> expect to unmap only a part of a superpage.
> 
> To keep the code simple, a new flag _PAGE_BLOCK is introduced to
> allow the caller to enable superpage mapping.
> 
> As the code doesn't support all the combinations, xen_pt_check_entry()
> is extended to take into account the cases we don't support when
> using block mapping:
>     - Replacing a table with a mapping. This may happen if region was
>     first mapped with 4KB mapping and then later on replaced with a 2MB
>     (or 1GB mapping)
>     - Removing/modify a table. This may happen if a caller try to remove a
>     region with _PAGE_BLOCK set when it was created without it
> 
> Note that the current restriction mean that the caller must ensure that
> _PAGE_BLOCK is consistently set/cleared across all the updates on a
> given virtual region. This ought to be fine with the expected use-cases.
> 
> More rework will be necessary if we wanted to remove the restrictions.
> 
> Note that nr_mfns is now marked const as it is used for flushing the
> TLBs and we don't want it to be modified.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>

Thanks for the patch, you might want to update the Signed-off-by (even
if you haven't changed the patch)


> ---
> 
> This patch is necessary for upcoming changes in the MM code. I would
> like to remove most of the open-coding update of the page-tables as they
> are not easy to properly fix/extend. For instance, always mapping
> xenheap mapping with 1GB superpage is plain wrong because:
>     - RAM regions are not always 1GB aligned (such as on RPI 4) and we
>     may end up to map MMIO with cacheable attributes
>     - RAM may contain reserved regions should either not be mapped
> ---
>  xen/arch/arm/mm.c          | 87 ++++++++++++++++++++++++++++++--------
>  xen/include/asm-arm/page.h |  4 ++
>  2 files changed, 73 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 59f8a3f15fd1..af0f12b6e6d3 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1060,9 +1060,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>  }
>  
>  /* Sanity check of the entry */
> -static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
> +static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
> +                               unsigned int flags)
>  {
> -    /* Sanity check when modifying a page. */
> +    /* Sanity check when modifying an entry. */
>      if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
>      {
>          /* We don't allow modifying an invalid entry. */
> @@ -1072,6 +1073,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>              return false;
>          }
>  
> +        /* We don't allow modifying a table entry */
> +        if ( !lpae_is_mapping(entry, level) )
> +        {
> +            mm_printk("Modifying a table entry is not allowed.\n");
> +            return false;
> +        }
> +
>          /* We don't allow changing memory attributes. */
>          if ( entry.pt.ai != PAGE_AI_MASK(flags) )
>          {
> @@ -1087,7 +1095,7 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>              return false;
>          }
>      }
> -    /* Sanity check when inserting a page */
> +    /* Sanity check when inserting a mapping */
>      else if ( flags & _PAGE_PRESENT )
>      {
>          /* We should be here with a valid MFN. */
> @@ -1096,18 +1104,28 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>          /* We don't allow replacing any valid entry. */
>          if ( lpae_is_valid(entry) )
>          {
> -            mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> -                      mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
> +            if ( lpae_is_mapping(entry, level) )
> +                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> +                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
> +            else
> +                mm_printk("Trying to replace a table with a mapping.\n");
>              return false;
>          }
>      }
> -    /* Sanity check when removing a page. */
> +    /* Sanity check when removing a mapping. */
>      else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
>      {
>          /* We should be here with an invalid MFN. */
>          ASSERT(mfn_eq(mfn, INVALID_MFN));
>  
> -        /* We don't allow removing page with contiguous bit set. */
> +        /* We don't allow removing a table */
> +        if ( lpae_is_table(entry, level) )
> +        {
> +            mm_printk("Removing a table is not allowed.\n");
> +            return false;
> +        }
> +
> +        /* We don't allow removing a mapping with contiguous bit set. */
>          if ( entry.pt.contig )
>          {
>              mm_printk("Removing entry with contiguous bit set is not allowed.\n");
> @@ -1126,12 +1144,12 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>  }
>  
>  static int xen_pt_update_entry(mfn_t root, unsigned long virt,
> -                               mfn_t mfn, unsigned int flags)
> +                               mfn_t mfn, unsigned int page_order,
> +                               unsigned int flags)
>  {
>      int rc;
>      unsigned int level;
> -    /* We only support 4KB mapping (i.e level 3) for now */
> -    unsigned int target = 3;
> +    unsigned int target = 3 - (page_order / LPAE_SHIFT);

Given that page_order is not used for anything else in this function,
wouldn't it be easier to just pass the target level to
xen_pt_update_entry? Calculating target from page_order, when page_order
is otherwise unused, it doesn't look like the most straightforward way
to do it.


>      lpae_t *table;
>      /*
>       * The intermediate page tables are read-only when the MFN is not valid
> @@ -1186,7 +1204,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>      entry = table + offsets[level];
>  
>      rc = -EINVAL;
> -    if ( !xen_pt_check_entry(*entry, mfn, flags) )
> +    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
>          goto out;
>  
>      /* If we are only populating page-table, then we are done. */
> @@ -1204,8 +1222,11 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>          {
>              pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
>  
> -            /* Third level entries set pte.pt.table = 1 */
> -            pte.pt.table = 1;
> +            /*
> +             * First and second level pages set pte.pt.table = 0, but
> +             * third level entries set pte.pt.table = 1.
> +             */
> +            pte.pt.table = (level == 3);
>          }
>          else /* We are updating the permission => Copy the current pte. */
>              pte = *entry;
> @@ -1229,11 +1250,12 @@ static DEFINE_SPINLOCK(xen_pt_lock);
>  
>  static int xen_pt_update(unsigned long virt,
>                           mfn_t mfn,
> -                         unsigned long nr_mfns,
> +                         const unsigned long nr_mfns,
>                           unsigned int flags)
>  {
>      int rc = 0;
> -    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
> +    unsigned long vfn = paddr_to_pfn(virt);
> +    unsigned long left = nr_mfns;

Given that paddr_to_pfn is meant for physical addresses, I would rather
opencode paddr_to_pfn using PAGE_SHIFT here. Again, just a suggestion.


>      /*
>       * For arm32, page-tables are different on each CPUs. Yet, they share
> @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
>  
>      spin_lock(&xen_pt_lock);
>  
> -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> +    while ( left )
>      {
> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> +        unsigned int order;
> +        unsigned long mask;
> +
> +        /*
> +         * Don't take into account the MFN when removing mapping (i.e
> +         * MFN_INVALID) to calculate the correct target order.
> +         *
> +         * XXX: Support superpage mappings if nr is not aligned to a
> +         * superpage size.

It would be good to add another sentence to explain that the checks
below are simply based on masks and rely on the mfn, vfn, and also
nr_mfn to be superpage aligned. (It took me some time to figure it out.)


> +         */
> +        mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +        mask |= vfn | left;
> +
> +        /*
> +         * Always use level 3 mapping unless the caller request block
> +         * mapping.
> +         */
> +        if ( likely(!(flags & _PAGE_BLOCK)) )
> +            order = THIRD_ORDER;
> +        else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) )
> +            order = FIRST_ORDER;
> +        else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) )
> +            order = SECOND_ORDER;
> +        else
> +            order = THIRD_ORDER;
> +
> +        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, order, flags);
>          if ( rc )
>              break;
>  
> +        vfn += 1U << order;
>          if ( !mfn_eq(mfn, INVALID_MFN) )
> -            mfn = mfn_add(mfn, 1);
> +            mfn = mfn_add(mfn, 1U << order);
> +
> +        left -= (1U << order);
>
>      }
>  
>      /*
> diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
> index 4ea8e97247c8..de096b0968e3 100644
> --- a/xen/include/asm-arm/page.h
> +++ b/xen/include/asm-arm/page.h
> @@ -79,6 +79,7 @@
>   * [3:4] Permission flags
>   * [5]   Page present
>   * [6]   Only populate page tables
> + * [7]   Use any level mapping only (i.e. superpages is allowed)
>   */
>  #define PAGE_AI_MASK(x) ((x) & 0x7U)
>  
> @@ -92,6 +93,9 @@
>  #define _PAGE_PRESENT    (1U << 5)
>  #define _PAGE_POPULATE   (1U << 6)
>  
> +#define _PAGE_BLOCK_BIT     7
> +#define _PAGE_BLOCK         (1U << _PAGE_BLOCK_BIT)
> +
>  /*
>   * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
>   * meant to be used outside of this header.


