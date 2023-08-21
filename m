Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22480782FC1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 19:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587785.919185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY99R-0005Mb-6F; Mon, 21 Aug 2023 17:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587785.919185; Mon, 21 Aug 2023 17:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY99R-0005JG-30; Mon, 21 Aug 2023 17:57:17 +0000
Received: by outflank-mailman (input) for mailman id 587785;
 Mon, 21 Aug 2023 17:57:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY99P-0005J8-Mg
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 17:57:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY99P-0005O3-7R; Mon, 21 Aug 2023 17:57:15 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY99O-0006QV-Vs; Mon, 21 Aug 2023 17:57:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XErJZJz/ysBPsMGb6H2muw/xQ+xiv9fGer87sHym944=; b=DfLpsVNwbgt4BDZkml3kRNNOkg
	Fr/6XxR8ERs3owVPUJc8yX72hBe2WPa0+1ZZcH8uXN5KqPxNKxgXWpSRKKgjkXJzHxfqWVBV/jA59
	k7MPdkEl/LKIe8x5W3GYKHHdVJObKDVxYl3zcEiYIPpC+CNlCbcvpf5xCb++xRThAIwg=;
Message-ID: <96c4e031-a448-47c9-a24a-48b9ef914b58@xen.org>
Date: Mon, 21 Aug 2023 18:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] xen/arm: Extract MMU-specific code
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-8-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-8-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> Currently, most of the MMU-specific code is in mm.{c,h}. To make the
> mm extendable, this commit extract the MMU-specific code by firstly:
> - Create a arch/arm/include/asm/mmu/ subdir.
> - Create a arch/arm/mmu/ subdir.
> 
> Then move the MMU-specific code to above mmu subdir, which includes
> below changes:
> - Move arch/arm/arm64/mm.c to arch/arm/arm64/mmu/mm.c
> - Move MMU-related declaration in arch/arm/include/asm/mm.h to
>    arch/arm/include/asm/mmu/mm.h
> - Move the MMU-related declaration dump_pt_walk() in asm/page.h
While I agree that dump_pt_walk() is better to be defined in mm.h, I am 
not entirely sure for ...

>    and pte_of_xenaddr() in asm/setup.h to the new asm/mmu/mm.h.

... pte_of_xenaddr(). It was defined in setup.h because this is an 
helper that is only intended to be used during early boot.


That said, it is probably not worth creating a new helper for that. So I 
would suggest to at least mark pte_of_xenaddr() __init to make clear of 
the intended usage.

> - Move MMU-related code in arch/arm/mm.c to arch/arm/mmu/mm.c.
> 
> Also modify the build system (Makefiles in this case) to pick above
> mentioned code changes.
> 
> This patch is a pure code movement, no functional change intended.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> With the code movement of this patch, the descriptions on top of
> xen/arch/arm/mm.c and xen/arch/arm/mmu/mm.c might need some changes,
> suggestions?
> v5:
> - Rebase on top of xen/arm: Introduce CONFIG_MMU Kconfig option and
>    xen/arm: mm: add missing extern variable declaration
> v4:
> - Rework "[v3,13/52] xen/mmu: extract mmu-specific codes from
>    mm.c/mm.h" with the lastest staging branch, only do the code movement
>    in this patch to ease the review.
> ---
>   xen/arch/arm/Makefile             |    1 +
>   xen/arch/arm/arm64/Makefile       |    1 -
>   xen/arch/arm/arm64/mmu/Makefile   |    1 +
>   xen/arch/arm/arm64/{ => mmu}/mm.c |    0
>   xen/arch/arm/include/asm/mm.h     |   20 +-
>   xen/arch/arm/include/asm/mmu/mm.h |   55 ++
>   xen/arch/arm/include/asm/page.h   |   15 -
>   xen/arch/arm/include/asm/setup.h  |    3 -
>   xen/arch/arm/mm.c                 | 1119 ----------------------------
>   xen/arch/arm/mmu/Makefile         |    1 +
>   xen/arch/arm/mmu/mm.c             | 1146 +++++++++++++++++++++++++++++

I noticed you transferred everything in mm.c But I think some part could 
go in arm{32,64}/mmu/mm.c.

>   11 files changed, 1208 insertions(+), 1154 deletions(-)
>   rename xen/arch/arm/arm64/{ => mmu}/mm.c (100%)
>   create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
>   create mode 100644 xen/arch/arm/mmu/Makefile
>   create mode 100644 xen/arch/arm/mmu/mm.c

(I haven't checked if the code was moved correctly. I only checked if 
the split makes sense).

To ease the review, I think this patch can be split in a more piecemeal 
patches. The first two pieces would be :
   * Patch #1 transfer xen_pt_update()/dump_pt_walk() and their dependencies
   * Patch #2 transfer root page-table allocation

Then you can have some for each small functions.

[...]

> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> similarity index 100%
> rename from xen/arch/arm/arm64/mm.c
> rename to xen/arch/arm/arm64/mmu/mm.c
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index aaacba3f04..dc1458b047 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -14,6 +14,10 @@
>   # error "unknown ARM variant"
>   #endif
>   
> +#ifdef CONFIG_MMU
> +#include <asm/mmu/mm.h>

I am guessing you will need to include <asm/mpu/mm.h> at some point. So 
I would add a:

#else
# error "Unknown memory management layout"

This would be easier to find out where includes might be missing.

[...]

> @@ -1233,11 +119,6 @@ int map_pages_to_xen(unsigned long virt,
>       return xen_pt_update(virt, mfn, nr_mfns, flags);
>   }
>   

[...]

> +/* MMU setup for secondary CPUS (which already have paging enabled) */
> +void mmu_init_secondary_cpu(void)
> +{
> +    xen_pt_enforce_wnx();
> +}
> +
> +#ifdef CONFIG_ARM_32

Rather than #ifdef, I would prefer if we move each implementation to 
arm32/mmu/mm.c and ...

> +/*
> + * Set up the direct-mapped xenheap:
> + * up to 1GB of contiguous, always-mapped memory.
> + */
> +void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                     unsigned long nr_mfns)
> +{
> +    int rc;
> +
> +    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the directmap mappings.\n");
> +
> +    /* Record where the directmap is, for translation routines. */
> +    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> +}
> +#else /* CONFIG_ARM_64 */
> +/* Map the region in the directmap area. */
> +void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                     unsigned long nr_mfns)

... arm64/mmu/mm.c.

> +{
> +    int rc;
> +
> +    /* First call sets the directmap physical and virtual offset. */
> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> +    {
> +        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
> +
> +        directmap_mfn_start = _mfn(base_mfn);
> +        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
> +        /*
> +         * The base address may not be aligned to the first level
> +         * size (e.g. 1GB when using 4KB pages). This would prevent
> +         * superpage mappings for all the regions because the virtual
> +         * address and machine address should both be suitably aligned.
> +         *
> +         * Prevent that by offsetting the start of the directmap virtual
> +         * address.
> +         */
> +        directmap_virt_start = DIRECTMAP_VIRT_START +
> +            (base_mfn - mfn_gb) * PAGE_SIZE;
> +    }
> +
> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
> +        panic("cannot add directmap mapping at %lx below heap start %lx\n",
> +              base_mfn, mfn_x(directmap_mfn_start));
> +
> +    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
> +                          _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the directmap mappings.\n");
> +}
> +#endif
> +
> +/* Map a frame table to cover physical addresses ps through pe */
> +void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)

I looked at the implement for the MPU and the code is mainly the same. 
So can we keep this code in common and just ...

> +{
> +    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
> +                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
> +    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
> +    mfn_t base_mfn;
> +    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
> +    int rc;
> +
> +    /*
> +     * The size of paddr_t should be sufficient for the complete range of
> +     * physical address.
> +     */
> +    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
> +    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
> +
> +    if ( frametable_size > FRAMETABLE_SIZE )
> +        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
> +              ps, pe);
> +
> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
> +    /* Round up to 2M or 32M boundary, as appropriate. */
> +    frametable_size = ROUNDUP(frametable_size, mapping_size);
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
> +
> +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          frametable_size >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);

abstract the frametable mapping? THis would also make clear that the 
BUILD_BUG_ON() above are not specific to the MMU code.

> +    if ( rc )
> +        panic("Unable to setup the frametable mappings.\n");
> +
> +    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> +    memset(&frame_table[nr_pdxs], -1,
> +           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> +
> +    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
> +}

-- 
Julien Grall

