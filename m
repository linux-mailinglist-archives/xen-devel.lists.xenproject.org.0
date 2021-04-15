Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DB361586
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 00:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111515.213286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXAXM-0007ea-Gb; Thu, 15 Apr 2021 22:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111515.213286; Thu, 15 Apr 2021 22:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXAXM-0007eD-D2; Thu, 15 Apr 2021 22:32:36 +0000
Received: by outflank-mailman (input) for mailman id 111515;
 Thu, 15 Apr 2021 22:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clmd=JM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lXAXL-0007e8-KB
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 22:32:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d6c84b4-9ef6-4ebb-b8f5-5d01052538de;
 Thu, 15 Apr 2021 22:32:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE9E4610FB;
 Thu, 15 Apr 2021 22:32:33 +0000 (UTC)
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
X-Inumbo-ID: 2d6c84b4-9ef6-4ebb-b8f5-5d01052538de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618525954;
	bh=Yco3/ZrSA35N5drUJsJpua5yUrh1ZrhfpMmLaz+V8H0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MHyw0xOPXDyc52Zw/pF2IOjef0BKgGi2LRvoReHN7Ccc8IHiwFPpgh7N7md0S0HeT
	 7gcCfipl+yFZ8UmnsM4YYZL6uhMOD+wQpxfXNU0sdUKxWi7RX5ENWPgwHhO+zu1PEu
	 lBosEP7gU8JM4jKVqJbmQidQlrR1LDP0HjF+7fvSZZqWLPqZGeBMCOhCy03KZqQnTd
	 3lS3Qto9W3Xo3oUeusMHdwP54PGHKxsTF74eUWOecJHkoZim0oM5OUlyZJyvsu4O+q
	 gdD6a71BelxhDdN5W4mLgyD+RJ23L22QKgXrB/colSpethnUloHlJnxKSoysJ5C3Aj
	 Jwvu3r4ORR2bw==
Date: Thu, 15 Apr 2021 15:32:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien@amazon.com>
Subject: Re: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
In-Reply-To: <20210405162046.9353-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2104151532190.4885@sstabellini-ThinkPad-T480s>
References: <20210405162046.9353-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, we are computing offsets/masks for each level and
> granularity. This is a bit of waste given that we only need to
> know the offsets/masks for the granularity used by the guest.
> 
> All the LPAE information can easily be inferred with just the
> page shift for a given granularity and the level.
> 
> So rather than providing a set of helpers per granularity, we can
> provide a single set that takes the granularity and the level in
> parameters.
> 
> With the new helpers in place, we can rework guest_walk_ld() to
> only compute necessary information.
> 
> Signed-off-by: Julien Grall <julien@amazon.com>

Very nice!!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/guest_walk.c  | 37 ++---------------
>  xen/include/asm-arm/lpae.h | 82 +++++++++++++-------------------------
>  2 files changed, 30 insertions(+), 89 deletions(-)
> 
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index b4496c4c86c6..87de40d0cb68 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -372,38 +372,6 @@ static bool guest_walk_ld(const struct vcpu *v,
>      register_t tcr = READ_SYSREG(TCR_EL1);
>      struct domain *d = v->domain;
>  
> -#define OFFSETS(gva, gran)              \
> -{                                       \
> -    zeroeth_table_offset_##gran(gva),   \
> -    first_table_offset_##gran(gva),     \
> -    second_table_offset_##gran(gva),    \
> -    third_table_offset_##gran(gva)      \
> -}
> -
> -    const paddr_t offsets[3][4] = {
> -        OFFSETS(gva, 4K),
> -        OFFSETS(gva, 16K),
> -        OFFSETS(gva, 64K)
> -    };
> -
> -#undef OFFSETS
> -
> -#define MASKS(gran)                     \
> -{                                       \
> -    zeroeth_size(gran) - 1,             \
> -    first_size(gran) - 1,               \
> -    second_size(gran) - 1,              \
> -    third_size(gran) - 1                \
> -}
> -
> -    static const paddr_t masks[3][4] = {
> -        MASKS(4K),
> -        MASKS(16K),
> -        MASKS(64K)
> -    };
> -
> -#undef MASKS
> -
>      static const unsigned int grainsizes[3] = {
>          PAGE_SHIFT_4K,
>          PAGE_SHIFT_16K,
> @@ -519,7 +487,7 @@ static bool guest_walk_ld(const struct vcpu *v,
>           * Add offset given by the GVA to the translation table base address.
>           * Shift the offset by 3 as it is 8-byte aligned.
>           */
> -        paddr |= offsets[gran][level] << 3;
> +        paddr |= LPAE_TABLE_INDEX_GS(grainsizes[gran], level, gva) << 3;
>  
>          /* Access the guest's memory to read only one PTE. */
>          ret = access_guest_memory_by_ipa(d, paddr, &pte, sizeof(lpae_t), false);
> @@ -572,7 +540,8 @@ static bool guest_walk_ld(const struct vcpu *v,
>  
>      /* Make sure that the lower bits of the PTE's base address are zero. */
>      mask = GENMASK_ULL(47, grainsizes[gran]);
> -    *ipa = (pfn_to_paddr(pte.walk.base) & mask) | (gva & masks[gran][level]);
> +    *ipa = (pfn_to_paddr(pte.walk.base) & mask) |
> +        (gva & (LEVEL_SIZE_GS(grainsizes[gran], level) - 1));
>  
>      /*
>       * Set permissions so that the caller can check the flags by herself. Note
> diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
> index 4797f9cee494..e94de2e7d8e8 100644
> --- a/xen/include/asm-arm/lpae.h
> +++ b/xen/include/asm-arm/lpae.h
> @@ -160,63 +160,35 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>  #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
>  
>  /*
> - * AArch64 supports pages with different sizes (4K, 16K, and 64K). To enable
> - * page table walks for various configurations, the following helpers enable
> - * walking the translation table with varying page size granularities.
> + * AArch64 supports pages with different sizes (4K, 16K, and 64K).
> + * Provide a set of generic helpers that will compute various
> + * information based on the page granularity.
> + *
> + * Note the parameter 'gs' is the page shift of the granularity used.
> + * Some macro will evaluate 'gs' twice rather than storing in a
> + * variable. This is to allow using the macros in assembly.
> + */
> +
> +/*
> + * Granularity | PAGE_SHIFT | LPAE_SHIFT
> + * -------------------------------------
> + * 4K          | 12         | 9
> + * 16K         | 14         | 11
> + * 64K         | 16         | 13
> + *
> + * This is equivalent to LPAE_SHIFT = PAGE_SHIFT - 3
>   */
> +#define LPAE_SHIFT_GS(gs)         ((gs) - 3)
> +#define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
> +#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> +
> +#define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
> +#define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
> +#define LEVEL_SIZE_GS(gs, lvl)    (_AT(paddr_t, 1) << LEVEL_SHIFT_GS(gs, lvl))
>  
> -#define LPAE_SHIFT_4K           (9)
> -#define LPAE_SHIFT_16K          (11)
> -#define LPAE_SHIFT_64K          (13)
> -
> -#define lpae_entries(gran)      (_AC(1,U) << LPAE_SHIFT_##gran)
> -#define lpae_entry_mask(gran)   (lpae_entries(gran) - 1)
> -
> -#define third_shift(gran)       (PAGE_SHIFT_##gran)
> -#define third_size(gran)        ((paddr_t)1 << third_shift(gran))
> -
> -#define second_shift(gran)      (third_shift(gran) + LPAE_SHIFT_##gran)
> -#define second_size(gran)       ((paddr_t)1 << second_shift(gran))
> -
> -#define first_shift(gran)       (second_shift(gran) + LPAE_SHIFT_##gran)
> -#define first_size(gran)        ((paddr_t)1 << first_shift(gran))
> -
> -/* Note that there is no zeroeth lookup level with a 64K granule size. */
> -#define zeroeth_shift(gran)     (first_shift(gran) + LPAE_SHIFT_##gran)
> -#define zeroeth_size(gran)      ((paddr_t)1 << zeroeth_shift(gran))
> -
> -#define TABLE_OFFSET(offs, gran)      (offs & lpae_entry_mask(gran))
> -#define TABLE_OFFSET_HELPERS(gran)                                          \
> -static inline paddr_t third_table_offset_##gran##K(paddr_t va)              \
> -{                                                                           \
> -    return TABLE_OFFSET((va >> third_shift(gran##K)), gran##K);             \
> -}                                                                           \
> -                                                                            \
> -static inline paddr_t second_table_offset_##gran##K(paddr_t va)             \
> -{                                                                           \
> -    return TABLE_OFFSET((va >> second_shift(gran##K)), gran##K);            \
> -}                                                                           \
> -                                                                            \
> -static inline paddr_t first_table_offset_##gran##K(paddr_t va)              \
> -{                                                                           \
> -    return TABLE_OFFSET((va >> first_shift(gran##K)), gran##K);             \
> -}                                                                           \
> -                                                                            \
> -static inline paddr_t zeroeth_table_offset_##gran##K(paddr_t va)            \
> -{                                                                           \
> -    /* Note that there is no zeroeth lookup level with 64K granule sizes. */\
> -    if ( gran == 64 )                                                       \
> -        return 0;                                                           \
> -    else                                                                    \
> -        return TABLE_OFFSET((va >> zeroeth_shift(gran##K)), gran##K);       \
> -}                                                                           \
> -
> -TABLE_OFFSET_HELPERS(4);
> -TABLE_OFFSET_HELPERS(16);
> -TABLE_OFFSET_HELPERS(64);
> -
> -#undef TABLE_OFFSET
> -#undef TABLE_OFFSET_HELPERS
> +/* Offset in the table at level 'lvl' */
> +#define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> +    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
>  
>  /* Generate an array @var containing the offset for each level from @addr */
>  #define DECLARE_OFFSETS(var, addr)          \
> -- 
> 2.17.1
> 

