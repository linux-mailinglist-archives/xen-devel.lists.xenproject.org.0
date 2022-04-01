Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F244EFD1B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 01:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297648.507090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naQoC-0006fE-Rl; Fri, 01 Apr 2022 23:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297648.507090; Fri, 01 Apr 2022 23:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naQoC-0006cv-Nm; Fri, 01 Apr 2022 23:36:00 +0000
Received: by outflank-mailman (input) for mailman id 297648;
 Fri, 01 Apr 2022 23:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naQoB-0006cp-41
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 23:35:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aa95997-b214-11ec-8fbc-03012f2f19d4;
 Sat, 02 Apr 2022 01:35:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48CA7B8256B;
 Fri,  1 Apr 2022 23:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9761AC2BBE4;
 Fri,  1 Apr 2022 23:35:54 +0000 (UTC)
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
X-Inumbo-ID: 7aa95997-b214-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648856155;
	bh=+iEryKsuAPI8Y89/I7krnPYE+MMmG3m2b4naH2Vixvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AtgFDssTeVz9IHt1HTMMn11wVNgYrCgGQd2UQJKMInWznXu2joAzlhV3Rk0e/H+9P
	 WaaScX6uUHL5zu39z5EzZk4XB82HxBk74EDJpS8nllyy4+u+1Q12wB59Zr/vM0grQ5
	 5V5wZwxQ42XC2+8G1Lq3MeFQEEsl/aEPeN+S2FRZyf/lAU/2tmgQYcR5fRp8hLiV7f
	 RGUze5r+GMXfeisTmo1D03bwDfmug8Q0j0twq/xww/GhPZFlqXQbRRA8PtBPsGvd/Z
	 Ogtcp3uvylhytENPuVfnZvw8rh73Se1k3ZjJSDKJcQ1E8pXrSM4iJ2cPx2fptKA50P
	 y2i8zKpV+XWrg==
Date: Fri, 1 Apr 2022 16:35:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 04/19] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <20220221102218.33785-5-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011605580.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-5-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
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
>     (or 1GB mapping).
>     - Removing/modifying a table. This may happen if a caller try to
>     remove a region with _PAGE_BLOCK set when it was created without it.
> 
> Note that the current restriction means that the caller must ensure that
> _PAGE_BLOCK is consistently set/cleared across all the updates on a
> given virtual region. This ought to be fine with the expected use-cases.
> 
> More rework will be necessary if we wanted to remove the restrictions.
> 
> Note that nr_mfns is now marked const as it is used for flushing the
> TLBs and we don't want it to be modified.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - Fix clash after prefixing the PT macros with XEN_PT_
>         - Fix typoes in the commit message
>         - Support superpage mappings even if nr is not suitably aligned
>         - Move the logic to find the level in a separate function
> 
>     Changes in v2:
>         - Pass the target level rather than the order to
>         xen_pt_update_entry()
>         - Update some comments
>         - Open-code paddr_to_pfn()
>         - Add my AWS signed-off-by
> ---
>  xen/arch/arm/include/asm/page.h |   4 ++
>  xen/arch/arm/mm.c               | 108 ++++++++++++++++++++++++++------
>  2 files changed, 94 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index c6f9fb0d4e0c..07998df47bac 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -69,6 +69,7 @@
>   * [3:4] Permission flags
>   * [5]   Page present
>   * [6]   Only populate page tables
> + * [7]   Superpage mappings is allowed
>   */
>  #define PAGE_AI_MASK(x) ((x) & 0x7U)
>  
> @@ -82,6 +83,9 @@
>  #define _PAGE_PRESENT    (1U << 5)
>  #define _PAGE_POPULATE   (1U << 6)
>  
> +#define _PAGE_BLOCK_BIT     7
> +#define _PAGE_BLOCK         (1U << _PAGE_BLOCK_BIT)
> +
>  /*
>   * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
>   * meant to be used outside of this header.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 515d0906f85b..3af69b396bd1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1063,9 +1063,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
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
> @@ -1075,6 +1076,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
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
> @@ -1090,7 +1098,7 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>              return false;
>          }
>      }
> -    /* Sanity check when inserting a page */
> +    /* Sanity check when inserting a mapping */
>      else if ( flags & _PAGE_PRESENT )
>      {
>          /* We should be here with a valid MFN. */
> @@ -1099,18 +1107,28 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
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
> @@ -1128,13 +1146,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>      return true;
>  }
>  
> +/* Update an entry at the level @target. */
>  static int xen_pt_update_entry(mfn_t root, unsigned long virt,
> -                               mfn_t mfn, unsigned int flags)
> +                               mfn_t mfn, unsigned int target,
> +                               unsigned int flags)
>  {
>      int rc;
>      unsigned int level;
> -    /* We only support 4KB mapping (i.e level 3) for now */
> -    unsigned int target = 3;
>      lpae_t *table;
>      /*
>       * The intermediate page tables are read-only when the MFN is not valid
> @@ -1189,7 +1207,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>      entry = table + offsets[level];
>  
>      rc = -EINVAL;
> -    if ( !xen_pt_check_entry(*entry, mfn, flags) )
> +    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
>          goto out;
>  
>      /* If we are only populating page-table, then we are done. */
> @@ -1207,8 +1225,11 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
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
> @@ -1228,15 +1249,56 @@ out:
>      return rc;
>  }
>  
> +/* Return the level where mapping should be done */
> +static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
> +                                unsigned int flags)
> +{
> +    unsigned int level;
> +    unsigned long mask;

Shouldn't mask be 64-bit on aarch32?


> +    /*
> +      * Don't take into account the MFN when removing mapping (i.e
> +      * MFN_INVALID) to calculate the correct target order.
> +      *
> +      * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
> +      * They are or-ed together and then checked against the size of
> +      * each level.
> +      *
> +      * `left` is not included and checked separately to allow
> +      * superpage mapping even if it is not properly aligned (the
> +      * user may have asked to map 2MB + 4k).
> +      */
> +     mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +     mask |= vfn;
> +
> +     /*
> +      * Always use level 3 mapping unless the caller request block
> +      * mapping.
> +      */
> +     if ( likely(!(flags & _PAGE_BLOCK)) )
> +         level = 3;
> +     else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) &&
> +               (nr >= BIT(FIRST_ORDER, UL)) )
> +         level = 1;
> +     else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) &&
> +               (nr >= BIT(SECOND_ORDER, UL)) )
> +         level = 2;
> +     else
> +         level = 3;
> +
> +     return level;

As far as I can tell this function is correct

> +}
> +
>  static DEFINE_SPINLOCK(xen_pt_lock);
>  
>  static int xen_pt_update(unsigned long virt,
>                           mfn_t mfn,
> -                         unsigned long nr_mfns,
> +                         const unsigned long nr_mfns,

Why const? nr_mfns is an unsigned long so it is passed as value: it
couldn't change the caller's parameter anyway. Just curious.


>                           unsigned int flags)
>  {
>      int rc = 0;
> -    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
> +    unsigned long vfn = virt >> PAGE_SHIFT;
> +    unsigned long left = nr_mfns;
>  
>      /*
>       * For arm32, page-tables are different on each CPUs. Yet, they share
> @@ -1268,14 +1330,24 @@ static int xen_pt_update(unsigned long virt,
>  
>      spin_lock(&xen_pt_lock);
>  
> -    for ( ; addr < addr_end; addr += PAGE_SIZE )
> +    while ( left )
>      {
> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
> +        unsigned int order, level;
> +
> +        level = xen_pt_mapping_level(vfn, mfn, left, flags);
> +        order = XEN_PT_LEVEL_ORDER(level);
> +
> +        ASSERT(left >= BIT(order, UL));
> +
> +        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);

NIT: I know we don't have vfn_to_vaddr at the moment and there is no
widespread usage of vfn in Xen anyway, but it looks off to use
pfn_to_paddr on a vfn parameter. Maybe open-code pfn_to_paddr instead?
Or introduce vfn_to_vaddr locally in this file?


>          if ( rc )
>              break;
>  
> +        vfn += 1U << order;
>          if ( !mfn_eq(mfn, INVALID_MFN) )
> -            mfn = mfn_add(mfn, 1);
> +            mfn = mfn_add(mfn, 1U << order);
> +
> +        left -= (1U << order);

This looks correct. I don't have any other feedback on this patch.


>      /*
> -- 
> 2.32.0
> 

