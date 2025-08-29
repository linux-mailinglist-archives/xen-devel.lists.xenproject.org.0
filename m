Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644ABB3B535
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100824.1454120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uru2c-0003kJ-Ri; Fri, 29 Aug 2025 08:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100824.1454120; Fri, 29 Aug 2025 08:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uru2c-0003iU-Oq; Fri, 29 Aug 2025 08:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1100824;
 Fri, 29 Aug 2025 08:00:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uru2b-0003iO-6R
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:00:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uru2a-00CWTA-1o;
 Fri, 29 Aug 2025 08:00:56 +0000
Received: from [2a02:8012:3a1:0:a40e:c7d9:d4:3bff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uru2a-007F8Q-1q;
 Fri, 29 Aug 2025 08:00:56 +0000
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
	bh=jSqVd3U1+aKxO9eEEI0wRLF+F3Vy8n421pGqeGWEODo=; b=Ruzwt4D3GcOAWUdoFgVzg6NVAz
	EihNBoc6B0xReaySJvKR50f2e7B+chmf5C27AMql2RDLurluwX+Sgq5HGa1Aqip9RAzNtAd7+J8aM
	84GKYOOjWiQ+W4nlZzAuxx1ikm9vKWmf5bnXaoc/Wtv7OmOyjWC/jlyuaeiaJXN5Vj3U=;
Message-ID: <7d988bb3-96e6-4c05-9bcf-c792f14bc4c4@xen.org>
Date: Fri, 29 Aug 2025 09:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm/mpu: Implement ioremap_attr for MPU
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <53c6aa61bc0cefce369ffc3a9ff5a7060b5f4b20.1756379422.git.hari.limaye@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <53c6aa61bc0cefce369ffc3a9ff5a7060b5f4b20.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hari,

On 28/08/2025 12:12, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Introduce helpers (un)map_mm_range() in order to allow the transient
> mapping of a range of memory, and use these to implement the function
> `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v2:
> - Propagate error to caller of is_mm_range_mapped, rather than panic
> 
> Changes from v1:
> - Use transient instead of temporary, and improve wording of comments
>    regarding transient mapping
> - Rename start, end -> base, limit
> ---
>   xen/arch/arm/include/asm/mpu/mm.h |  22 +++++
>   xen/arch/arm/mpu/mm.c             | 157 ++++++++++++++++++++++++++++--
>   2 files changed, 170 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 566d338986..efb0680e39 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -101,6 +101,28 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
>    */
>   pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>   
> +/*
> + * Maps transiently a range of memory with attributes `flags`; if the range is
> + * already mapped with the same attributes, including an inclusive match, the
> + * existing mapping is returned. This API is intended for mappings that exist
> + * transiently for a short period between calls to this function and
> + * `unmap_mm_range`.
> + *
> + * @param base      Base address of the range to map (inclusive).
> + * @param limit     Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          Pointer to base of region on success, NULL on error.
> + */
 > +void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags);

I think I am missing a couple of things:

  * The current use seems to be ioremap() which tends to be mapping for 
the lifetime of Xen. So I would not describe them as transient.
  * It is unclear to me why we need a different interface and can't use 
exist one. The name also doesn't make very clear that the mapping will 
be "transient" (whatever that means).

> +
> +/*
> + * Unmaps a range of memory if it was previously mapped by map_mm_range,
> + * otherwise it does not remove the mapping.
> + *
> + * @param base     Base address of the range to map (inclusive).
> + */
> +void unmap_mm_range(paddr_t base);
> +
>   /*
>    * Checks whether a given memory range is present in the provided table of
>    * MPU protection regions.
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 33333181d5..337573f9d7 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -332,31 +332,39 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>       return 0;
>   }
>   
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> -                      bool transient)
> +static bool check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
>   {
> -    int rc;
> -
>       if ( flags_has_rwx(flags) )
>       {
>           printk("Mappings should not be both Writeable and Executable\n");
> -        return -EINVAL;
> +        return false;
>       }
>   
>       if ( base >= limit )
>       {
>           printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
>                  base, limit);
> -        return -EINVAL;
> +        return false;
>       }
>   
>       if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
>       {
>           printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
>                  base, limit);
> -        return -EINVAL;
> +        return false;
>       }
>   
> +    return true;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> +                      bool transient)
> +{
> +    int rc;
> +
> +    if ( !check_mpu_mapping(base, limit, flags) )
> +        return -EINVAL;
> +
>       spin_lock(&xen_mpumap_lock);
>   
>       rc = xen_mpumap_update_entry(base, limit, flags, transient);
> @@ -465,10 +473,141 @@ void free_init_memory(void)
>       BUG_ON("unimplemented");
>   }
>   
> +static int is_mm_range_mapped(paddr_t start, paddr_t end, uint8_t *idx)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    /*
> +     * 'idx' will be INVALID_REGION_IDX for rc == MPUMAP_REGION_NOTFOUND and
> +     * it will be a proper region index when rc >= MPUMAP_REGION_FOUND.
> +     */


I feels this comment belongs on top of ``is_mm_range_mapped()`` because 
it describe the behavior of the function.

> +    return mpumap_contains_region(xen_mpumap, max_mpu_regions, start, end, idx);
> +}
> +
> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +{
> +    bool ret = true;
> +
> +    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Access Permission attributes (%#x0 instead of %#x0)\n",
> +               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    return ret;
> +}
> +
> +void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    paddr_t start_pg = round_pgdown(base);
> +    paddr_t end_pg = round_pgup(limit);
> +    void *ret = NULL;
> +    uint8_t idx;
> +    int rc;
> +
> +    if ( !check_mpu_mapping(start_pg, end_pg, flags) )
> +        return NULL;
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = is_mm_range_mapped(start_pg, end_pg, &idx);
> +    if ( rc < 0 ) {

Coding style:

if ( rc < 0 )
{

> +        printk(XENLOG_WARNING
> +               "Cannot handle overlapping MPU memory protection regions\n");
> +        goto out;
> +    }
> +
> +    if ( idx != INVALID_REGION_IDX )
> +    {
> +        /* Already mapped with different attributes */
> +        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "Range %#"PRIpaddr"-%#"PRIpaddr" already mapped with different flags\n",
> +                   start_pg, end_pg);
> +            goto out;
> +        }
> +
> +        /* Already mapped with same attributes */
> +        ret = maddr_to_virt(base);
> +        goto out;
> +    }
> +
> +    if ( !xen_mpumap_update_entry(start_pg, end_pg, flags, true) )
> +    {
> +        context_sync_mpu();
> +        ret = maddr_to_virt(base);
> +    }
> +
> + out:
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return ret;
> +}
> +
> +void unmap_mm_range(paddr_t base)
> +{
> +    uint8_t idx;
> +    int rc;
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    /*
> +     * Mappings created via map_mm_range are at least PAGE_SIZE. Find the idx
> +     * of the MPU memory region containing `start` mapped through map_mm_range.
> +     */
> +    rc = is_mm_range_mapped(base, base + PAGE_SIZE, &idx);
> +    if ( rc < 0 ) {

Style:

if ( rc < 0 )
{

> +        printk(XENLOG_WARNING
> +               "Cannot handle overlapping MPU memory protection regions\n");

I think this message is incorrect. AFACT, If is_mm_range_mapped() 
returns a negative value, then it means the region is unmapped.

> +        goto out;
> +    }
> +
> +    if ( idx == INVALID_REGION_IDX )
> +    {
> +        printk(XENLOG_ERR
> +               "Failed to unmap_mm_range MPU memory region at %#"PRIpaddr"\n",
> +               base);
> +        goto out;
> +    }
> +
> +    /* This API is only meant to unmap transient regions */

So the transient flag is more for debugging purpose? But if it really 
happens then...

> +    if ( !region_is_transient(&xen_mpumap[idx]) )
 > +        goto out;

... why do we silently fail? Surely this would indicate an error on the 
system which we want to know in debug build.

> +
> +    /* Disable MPU memory region and clear the associated entry in xen_mpumap */
> +    disable_mpu_region_from_index(idx);
> +    context_sync_mpu();
> +
> + out:
> +    spin_unlock(&xen_mpumap_lock);
> +}
> +
>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
>   {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    if ( !map_mm_range(start, start + len, flags) )
> +        return NULL;
> +
> +    /* Mapped or already mapped */
> +    return maddr_to_virt(start);
>   }
>   
>   /*

Cheers,

-- 
Julien Grall


