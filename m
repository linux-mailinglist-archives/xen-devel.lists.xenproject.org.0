Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0BB68B218
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 23:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489952.758536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOnAj-0004cE-9p; Sun, 05 Feb 2023 22:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489952.758536; Sun, 05 Feb 2023 22:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOnAj-0004Zp-6U; Sun, 05 Feb 2023 22:07:41 +0000
Received: by outflank-mailman (input) for mailman id 489952;
 Sun, 05 Feb 2023 22:07:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOnAh-0004Zj-I0
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 22:07:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOnAh-0002cy-9m; Sun, 05 Feb 2023 22:07:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOnAh-0001gP-3a; Sun, 05 Feb 2023 22:07:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=6AdZCZI6fb0VGIeKRACPAcGvZAbt3Nl8xzVZj9BRxMk=; b=nYTtoyv8vLgYMEMm363LU+Gx0n
	MS6pgAKJG8fT4PYS2X3fYpDxQZTV7DQh95Y1sD8BIKHyY12NagkW+WtP3yPqThfkLE+AsJFML5N71
	uINGnwEufrL5ipO5QwBUjYOZquabJVUnhni22TVajcps3fdI7rIuMEuDipOU7tX9VXQE=;
Message-ID: <2382e2c1-ab5a-ad7d-1426-b323d5f02ba6@xen.org>
Date: Sun, 5 Feb 2023 22:07:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-24-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 23/40] xen/mpu: initialize frametable in MPU system
In-Reply-To: <20230113052914.3845596-24-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> Xen is using page as the smallest granularity for memory managment.
> And we want to follow the same concept in MPU system.
> That is, structure page_info and the frametable which is used for storing
> and managing page_info is also required in MPU system.
> 
> In MPU system, since there is no virtual address translation (VA == PA),
> we can not use a fixed VA address(FRAMETABLE_VIRT_START) to map frametable
> like MMU system does.
> Instead, we define a variable "struct page_info *frame_table" as frametable
> pointer, and ask boot allocator to allocate memory for frametable.
> 
> As frametable is successfully initialized, the convertion between machine frame
> number/machine address/"virtual address" and page-info structure is
> ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/mm.h     | 15 ---------------
>   xen/arch/arm/include/asm/mm_mmu.h | 16 ++++++++++++++++

You are already moving some bits related to the frametable in an earlier 
patch. So I am a bit surprised to see some changes in mm_mmu.h here.

I would also rather prefer if the code changes are separated from the 
addition of the MPU code. They could them be moved at the beginning of 
the series and hopefully be merged before the rest (reducing the size 
this series).

>   xen/arch/arm/include/asm/mm_mpu.h | 17 +++++++++++++++++
>   xen/arch/arm/mm_mpu.c             | 25 +++++++++++++++++++++++++
>   4 files changed, 58 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index e29158028a..7969ec9f98 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -176,7 +176,6 @@ struct page_info
>   
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>   
> -#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   /* PDX of the first page in the frame table. */
>   extern unsigned long frametable_base_pdx;
>   
> @@ -280,20 +279,6 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>   
> -/* Convert between Xen-heap virtual addresses and page-info structures. */
> -static inline struct page_info *virt_to_page(const void *v)
> -{
> -    unsigned long va = (unsigned long)v;
> -    unsigned long pdx;
> -
> -    ASSERT(va >= XENHEAP_VIRT_START);
> -    ASSERT(va < directmap_virt_end);
> -
> -    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
> -    pdx += mfn_to_pdx(directmap_mfn_start);
> -    return frame_table + pdx - frametable_base_pdx;
> -}
> -
>   static inline void *page_to_virt(const struct page_info *pg)
>   {
>       return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> diff --git a/xen/arch/arm/include/asm/mm_mmu.h b/xen/arch/arm/include/asm/mm_mmu.h
> index 6d7e5ddde7..bc1b04c4c7 100644
> --- a/xen/arch/arm/include/asm/mm_mmu.h
> +++ b/xen/arch/arm/include/asm/mm_mmu.h
> @@ -23,6 +23,8 @@ extern uint64_t init_ttbr;
>   extern void setup_directmap_mappings(unsigned long base_mfn,
>                                        unsigned long nr_mfns);
>   
> +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> +
>   static inline paddr_t __virt_to_maddr(vaddr_t va)
>   {
>       uint64_t par = va_to_par(va);
> @@ -49,6 +51,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>   }
>   #endif
>   
> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long va = (unsigned long)v;
> +    unsigned long pdx;
> +
> +    ASSERT(va >= XENHEAP_VIRT_START);
> +    ASSERT(va < directmap_virt_end);
> +
> +    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
> +    pdx += mfn_to_pdx(directmap_mfn_start);
> +    return frame_table + pdx - frametable_base_pdx;
> +}
> +
>   #endif /* __ARCH_ARM_MM_MMU__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
> index fe6a828a50..eebd5b5d35 100644
> --- a/xen/arch/arm/include/asm/mm_mpu.h
> +++ b/xen/arch/arm/include/asm/mm_mpu.h
> @@ -9,6 +9,8 @@
>    */
>   extern void setup_static_mappings(void);
>   
> +extern struct page_info *frame_table;
> +
>   static inline paddr_t __virt_to_maddr(vaddr_t va)
>   {
>       /* In MPU system, VA == PA. */
> @@ -22,6 +24,21 @@ static inline void *maddr_to_virt(paddr_t ma)
>       return (void *)ma;
>   }
>   
> +/* Convert between virtual address to page-info structure. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long va = (unsigned long)v;
> +    unsigned long pdx;
> +
> +    /*
> +     * In MPU system, VA == PA, virt_to_maddr() outputs the
> +     * exact input address.
> +     */
You are describing an implementation details of virt_to_maddr() which 
doesn't matter here.

> +    pdx = mfn_to_pdx(maddr_to_mfn(virt_to_maddr(va)));

Why not using virt_to_mfn()?

Also, I would consider to add ASSERT(mfn_is_valid(...)) to confirm the 
MFN you pass is covered by the frametable. (This would be a sort of 
equalivent check to the MMU one).

> +
> +    return frame_table + pdx - frametable_base_pdx;
> +}
> +
>   #endif /* __ARCH_ARM_MM_MPU__ */
>   
>   /*
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index f057ee26df..7b282be4fb 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -69,6 +69,8 @@ static DEFINE_SPINLOCK(xen_mpumap_lock);
>   
>   static paddr_t dtb_paddr;
>   
> +struct page_info *frame_table;
> +
>   /* Write a MPU protection region */
>   #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
>       uint64_t _sel = sel;                                                \
> @@ -564,6 +566,29 @@ void __init setup_static_mappings(void)
>       /* TODO: guest memory section, device memory section, boot-module section, etc */
>   }
>   
> +/* Map a frame table to cover physical addresses ps through pe */
> +void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)

I have to admit, I am a bit puzzled why you added some stub in earlier 
patches for some functions but not for others. How did you make the 
decision on which one to stub?

> +{
> +    mfn_t base_mfn;
> +    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
> +                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
> +    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
> +
> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
> +    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);

Maybe assert()/panic() the function is not called twice?

> +    /*
> +     * Since VA == PA in MPU and we've already setup Xenheap mapping
> +     * in setup_staticheap_mappings(), we could easily deduce the
> +     * "virtual address" of frame table.
> +     */
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
> +    frame_table = (struct page_info*)mfn_to_virt(base_mfn);

Coding style: "struct page_info *".

> +
> +    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> +    memset(&frame_table[nr_pdxs], -1,
> +           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> +}
> +
>   /* TODO: Implementation on the first usage */
>   void dump_hyp_walk(vaddr_t addr)
>   {

Cheers,

-- 
Julien Grall

