Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBEE4EFD45
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 01:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297656.507107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naR4n-0000ZB-CN; Fri, 01 Apr 2022 23:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297656.507107; Fri, 01 Apr 2022 23:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naR4n-0000X1-7I; Fri, 01 Apr 2022 23:53:09 +0000
Received: by outflank-mailman (input) for mailman id 297656;
 Fri, 01 Apr 2022 23:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naR4l-0000Wu-IG
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 23:53:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df84d682-b216-11ec-8fbc-03012f2f19d4;
 Sat, 02 Apr 2022 01:53:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD6B616AA;
 Fri,  1 Apr 2022 23:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847FCC2BBE4;
 Fri,  1 Apr 2022 23:53:03 +0000 (UTC)
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
X-Inumbo-ID: df84d682-b216-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648857183;
	bh=1J/IGJPpqY73ftLbfVEJzfZEYZpXm+SrGHibXxEOEFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r8T/Zy63pIA/aUXHJcN2DeuaQVO2/yFN+ouQsgxuozGpgenRORopp5X5ECaD1cpd1
	 LPabSG2MCDKDVFoN9MvbPcYJ6xGnB51HdoJOStYUDBMkhMGTaZT7NoKQIMPv8ylycD
	 JueZsE64j4JRY1IoLP7ZnrIzIMfeBBX2H3QW31UUo3GxPp/CR2MrvgqffocC9ISooz
	 JQMzY+OiW58SrxdFMtDqp4PWLaI+++XHmU6cSMEy4cHjo1Bp5oh2lflhV4u81Z++Eo
	 tWCsK+Ub9AOpgKTwgYhKC5DAHM1xK76G0jEvnxQ2w+4EETOYXAvOQyR6mM7l6St6v0
	 JrSEPJbBcUpjQ==
Date: Fri, 1 Apr 2022 16:53:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous
 bit
In-Reply-To: <20220221102218.33785-6-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011639430.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-6-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In follow-up patches, we will use xen_pt_update() (or its callers)
> to handle large mappings (e.g. frametable, xenheap). They are also
> not going to be modified once created.
> 
> The page-table entries have an hint to indicate that whether an
> entry is contiguous to another 16 entries (assuming 4KB). When the
> processor support the hint, one TLB entry will be created per
> contiguous region.
> 
> For now this is tied to _PAGE_BLOCK. We can untie it in the future
> if there are use-cases where we may want to use _PAGE_BLOCK without
> setting the contiguous (couldn't think of any yet).
> 
> Note that to avoid extra complexity, mappings with the contiguous
> bit set cannot be removed. Given the expected use, this restriction
> ought to be fine.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - New patch
> ---
>  xen/arch/arm/include/asm/page.h |  4 ++
>  xen/arch/arm/mm.c               | 80 ++++++++++++++++++++++++++++++---
>  2 files changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 07998df47bac..e7cd62190c7f 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -70,6 +70,7 @@
>   * [5]   Page present
>   * [6]   Only populate page tables
>   * [7]   Superpage mappings is allowed
> + * [8]   Set contiguous bit (internal flag)
>   */
>  #define PAGE_AI_MASK(x) ((x) & 0x7U)
>  
> @@ -86,6 +87,9 @@
>  #define _PAGE_BLOCK_BIT     7
>  #define _PAGE_BLOCK         (1U << _PAGE_BLOCK_BIT)
>  
> +#define _PAGE_CONTIG_BIT    8
> +#define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
> +
>  /*
>   * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
>   * meant to be used outside of this header.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 3af69b396bd1..fd16c1541ce2 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1237,6 +1237,8 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>          /* Set permission */
>          pte.pt.ro = PAGE_RO_MASK(flags);
>          pte.pt.xn = PAGE_XN_MASK(flags);
> +        /* Set contiguous bit */
> +        pte.pt.contig = !!(flags & _PAGE_CONTIG);
>      }
>  
>      write_pte(entry, pte);
> @@ -1289,6 +1291,51 @@ static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>       return level;
>  }
>  
> +#define XEN_PT_4K_NR_CONTIG 16
> +
> +/*
> + * Check whether the contiguous bit can be set. Return the number of
> + * contiguous entry allowed. If not allowed, return 1.
> + */
> +static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
> +                                        unsigned int level, unsigned long left,
> +                                        unsigned int flags)
> +{
> +    unsigned long nr_contig;
> +
> +    /*
> +     * Allow the contiguous bit to set when the caller requests block
> +     * mapping.
> +     */
> +    if ( !(flags & _PAGE_BLOCK) )
> +        return 1;
> +
> +    /*
> +     * We don't allow to remove mapping with the contiguous bit set.
> +     * So shortcut the logic and directly return 1.
> +     */
> +    if ( mfn_eq(mfn, INVALID_MFN) )
> +        return 1;
> +
> +    /*
> +     * The number of contiguous entries varies depending on the page
> +     * granularity used. The logic below assumes 4KB.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> +
> +    /*
> +     * In order to enable the contiguous bit, we should have enough entries
> +     * to map left and both the virtual and physical address should be
> +     * aligned to the size of 16 translation tables entries.
> +     */
> +    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
> +
> +    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
> +        return 1;
> +
> +    return XEN_PT_4K_NR_CONTIG;
> +}
> +
>  static DEFINE_SPINLOCK(xen_pt_lock);
>  
>  static int xen_pt_update(unsigned long virt,
> @@ -1322,6 +1369,12 @@ static int xen_pt_update(unsigned long virt,
>          return -EINVAL;
>      }
>  
> +    if ( flags & _PAGE_CONTIG )
> +    {
> +        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
> +        return -EINVAL;
> +    }
> +
>      if ( !IS_ALIGNED(virt, PAGE_SIZE) )
>      {
>          mm_printk("The virtual address is not aligned to the page-size.\n");
> @@ -1333,21 +1386,34 @@ static int xen_pt_update(unsigned long virt,
>      while ( left )
>      {
>          unsigned int order, level;
> +        unsigned int nr_contig;
> +        unsigned int new_flags;
>  
>          level = xen_pt_mapping_level(vfn, mfn, left, flags);
>          order = XEN_PT_LEVEL_ORDER(level);
>  
>          ASSERT(left >= BIT(order, UL));
>  
> -        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);
> -        if ( rc )
> -            break;
> +        /*
> +         * Check if we can set the contiguous mapping and update the
> +         * flags accordingly.
> +         */
> +        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
> +        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);

Here is an optional idea to make the code simpler. We could move the
flags changes (adding/removing _PAGE_CONTIG) to xen_pt_check_contig.
That way, we could remove the inner loop.

xen_pt_check_contig could check if _PAGE_CONTIG is already set and based
on alignment, it should be able to figure out when it needs to be
disabled.

But also this code works as far as I can tell.


> -        vfn += 1U << order;
> -        if ( !mfn_eq(mfn, INVALID_MFN) )
> -            mfn = mfn_add(mfn, 1U << order);
> +        for ( ; nr_contig > 0; nr_contig-- )
> +        {
> +            rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level,
> +                                     new_flags);
> +            if ( rc )
> +                break;
>  
> -        left -= (1U << order);
> +            vfn += 1U << order;
> +            if ( !mfn_eq(mfn, INVALID_MFN) )
> +                mfn = mfn_add(mfn, 1U << order);
> +
> +            left -= (1U << order);
> +        }
>      }
>  
>      /*
> -- 
> 2.32.0
> 

