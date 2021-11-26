Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D945EF75
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233106.404320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbd5-0003Nq-Pp; Fri, 26 Nov 2021 13:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233106.404320; Fri, 26 Nov 2021 13:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbd5-0003Ls-MW; Fri, 26 Nov 2021 13:51:07 +0000
Received: by outflank-mailman (input) for mailman id 233106;
 Fri, 26 Nov 2021 13:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skxS=QN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqbd4-0003Lm-Ct
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:51:06 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e54f5dde-4ebf-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:51:03 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id k23so18965694lje.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 05:51:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v15sm500510ljj.5.2021.11.26.05.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 05:51:02 -0800 (PST)
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
X-Inumbo-ID: e54f5dde-4ebf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HzaxNAcrJLkS5d+Bi4ePJAj3TSX4GqKpzLtoILOmdyw=;
        b=Bs1Jb5xbZaMPWAqz09nWywcrW2/5dUgJ5NqxJORz4kG+/DFC11YOID5xvzID7dwb8U
         sHLxZ/OZI3KXDX5sEQaJBLUW9jsxLeKLfzI7q7+KhdkYxlfiM3iQp3U5YWnZXgD9Rayo
         ahoSmiQEB8xl7YoBOBAIQQTuje6q5Vh4H8LreLqiAEcxlTnOnaGKCOEUdZnP1baSvvNo
         csZWASRhiYMoZQzYp1N92k1vQD+0Zvvh5UuqHvdCgvXLskm9AR17KziTbul+sbTjmL0w
         I+5bGHGmbIJk/0UQ0mLFpf/EcTKmRPPKYlP/Pkz2PlJsct/Vz3Vxtqp5Q8WP5nGM/TZa
         wmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HzaxNAcrJLkS5d+Bi4ePJAj3TSX4GqKpzLtoILOmdyw=;
        b=Pn+XUDEOqTkr6CUhr/fO2oVk5I3AazR10X65zi+RvejDb1k/G5eIvg2zoaVzrqsPws
         aOiZn6Okl5zFmg7LoriNT52S9UfpG6Ehyyheq//ET6WD2pufzUcH/mhwyn1FKbBAo1fs
         5bNtUMi/gf4WAn0OdSNkx7ebu/Y9U6FS3boN4O5uQE1vNPsxzUnq8wBsNJu+l08LJSCu
         CtZmV9Pk9jIKmm3JCM6ybNO9IxmicmJVkc7Gg4nilANSxiHawdfdu0tUrfYGw7QJmuu6
         SC2HQXj5keK+/1aAmd3bpb9SZzC0MPeUQ2uNTkHCD+X3GdcCtYVlee9oSFJa0CqR0yVY
         r6Wg==
X-Gm-Message-State: AOAM532Yb/9yrPgDxaiJMFwqg1S5vyU59QXUEWOvgf7AIoV6/zCPR2Ox
	4U4/xfyad2CxXxZmjqyBN6E=
X-Google-Smtp-Source: ABdhPJzRKglYJQ3mcyItkNA+gjWXCrld5aO+o+YtaVr1nSQ6yzeGPr8dCYPL9mPNs6V7i0FofzFHHQ==
X-Received: by 2002:a2e:7618:: with SMTP id r24mr30915618ljc.144.1637934662832;
        Fri, 26 Nov 2021 05:51:02 -0800 (PST)
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <863c9a06-f0af-eac1-fb04-e059e4ce0a09@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
Date: Fri, 26 Nov 2021 15:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <863c9a06-f0af-eac1-fb04-e059e4ce0a09@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 25.11.21 21:04, Julien Grall wrote:
> Hi Oleksandr,
>
> Apologies for the late answer. I was waiting for XSA-387 to go out 
> before commenting.


Hi Julien,


I got it, no problem


>
>
> On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Rework Arm implementation to store grant table frame GFN
>> in struct page_info directly instead of keeping it in
>> standalone status/shared arrays.
>>
>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>> to hold 52-bit/28-bit + extra bit value respectively. In order
>> to not grow the size of struct page_info borrow the required
>> amount of bits from type_info's count portion which current
>> context won't suffer (currently only 1 bit is used on Arm).
>> Please note, to minimize code changes and avoid introducing
>> an extra #ifdef-s to the header, we keep the same amount of
>> bits on both subarches, although the count portion on Arm64
>> could be wider, so we waste some bits here.
>>
>> Introduce corresponding PGT_* constructs and access macros.
>> Update existing gnttab macros to deal with GFN value according
>> to new location. Also update the use of count portion on Arm
>> in share_xen_page_with_guest().
>>
>> Update the P2M code to clean said GFN portion when putting
>> a reference on the grant table page in p2m_put_l3_page().
>> The added check is based on the assumption that grant table page
>> is the xen_heap page and its entry has p2m_ram_rw type, which
>> is correct. However, this check is not entirely precise and we
>> might end up clearing the GFN portion for other xen_heap pages
>> with the same p2m_type. But, this action is considered as
>> harmless, since only grant table pages really use that portion.
>>
>> And for everything to work correctly introduce arch-specific
>> macros to be called from alloc_xenheap_pages()/free_xenheap_pages()
>> which purposes on Arm are to clear the portion before use and
>> make sure the portion is cleared after use, on x86 these are
>> just stubs.
>>
>> This patch is intended to fix the potential issue on Arm
>> which might happen when remapping grant-table frame.
>> A guest (or the toolstack) will unmap the grant-table frame
>> using XENMEM_remove_physmap. This is a generic hypercall,
>> so on x86, we are relying on the fact the M2P entry will
>> be cleared on removal. For architecture without the M2P,
>> the GFN would still be present in the grant frame/status
>> array. So on the next call to map the page, we will end up to
>> request the P2M to remove whatever mapping was the given GFN.
>> This could well be another mapping.
>>
>> Besides that, this patch simplifies arch code on Arm by
>> removing arrays and corresponding management code and
>> as the result gnttab_init_arch/gnttab_destroy_arch helpers
>> and struct grant_table_arch become useless and can be
>> dropped globally.
>
> Before dropping the arch specific helpers, I would check with the 
> RISC-v folks that they will not need it in the near future.

arch/riscv/configs/tiny64_defconfig says that CONFIG_GRANT_TABLE is not 
set, for me it sounds like unlikely for *the near* future. But, anyway, 
it would be better to clarify.


>
>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> You can find the related discussions at:
>> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/ 
>>
>> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/ 
>>
>> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/ 
>>
>>
>> ! Please note, there is still unresolved locking question here for which
>> I failed to find a suitable solution. So, it is still an RFC !
>>
>> According to the internal conversation:
>> Now the GFN field in the struct page_info is accessed from
>> gnttab_set_frame_gfn() in the grant table code and from 
>> page_set_frame_gfn()
>> in the P2M code (the former uses the latter).
>>
>> We need to prevent the concurrent access to this field. But, we 
>> cannot grab
>> the grant lock from the P2M code because we will introduce a lock 
>> inversion.
>> The page_set_frame_gfn() will be called from the P2M code with the 
>> p2m lock held
>> and then acquire the grant table lock. The gnttab_map_frame() will do 
>> the inverse.
>
> This is a tricky one. I think, we will:
>
>   1) Need to use the P2M lock to protect the access to the GFN in the 
> struct page_info *.
>   2) Defer the call to page_set_frame_gfn() from gnttab_map_frame() to 
> xenmem_add_to_physmap_one()
>   3) In xenmem_add_to_physmap_one() hold the P2M lock while checking 
> the page was not already mapped (e.g. page_get_frame_gfn() == 
> INVALID_GFN) and do the mapping. Call page_set_frame_gfn() on success.
>
> This would still allow the guest to shot itself in the foot (e.g. 
> potentially removing the wrong mapping) if it tries concurrent 
> hypercall but I believe we would not introduce issue like XSA-380.
>
> At the end this would look quite similar to how x86 deal with the M2P 
> update.

Thank you for the suggestion, I need to analyze the code to better 
understand your idea and technical possibility to implement it, I will 
come up with questions if any.


>
>
> For the record, I actually considered whether it is worth to fully 
> implement an M2P on Arm. We technically have space in the struct 
> page_info for that. However, I don't see it necessary in other place 
> of Xen, so I would prefer to keep the space free for other purpose (or 
> event be able to remove it).
>
> @Stefano, what do you think?
>
>>
>> Changes RFC1 -> RFC2:
>>   - update patch description
>>   - add/update comments in code
>>   - clarify check in p2m_put_l3_page()
>>   - introduce arch_alloc_xenheap_page() and arch_free_xenheap_page()
>>     and drop page_arch_init()
>>   - add ASSERT to gnttab_shared_page() and gnttab_status_page()
>>   - rework changes to Arm's struct page_info: do not split type_info,
>>     allocate GFN portion by reducing count portion, create corresponding
>>     PGT_* construct, etc
>>   - update page_get_frame_gfn() and page_set_frame_gfn()
>>   - update the use of count portion on Arm
>>   - drop the leading underscore in the macro parameter names
>>
>> Changes RFC2 -> RFC3:
>>   - update patch description
>>   - drop PGT_count_base and MASK_INSR() in share_xen_page_with_guest()
>>   - update alloc_xenheap_page() and free_xenheap_page() for 
>> SEPARATE_XENHEAP
>>     case (Arm32)
>>   - provide an extra bit for GFN portion, to get PGT_INVALID_FRAME_GFN
>>     one bit more than the maximum number of physical address bits on 
>> Arm32
>> ---
>>   xen/arch/arm/mm.c                 |  8 ++++--
>>   xen/arch/arm/p2m.c                | 21 ++++++++++++---
>>   xen/common/grant_table.c          |  9 -------
>>   xen/common/page_alloc.c           | 20 +++++++++++++-
>>   xen/include/asm-arm/grant_table.h | 57 
>> +++++++++++++++------------------------
>>   xen/include/asm-arm/mm.h          | 35 +++++++++++++++++++++---
>>   xen/include/asm-x86/grant_table.h |  5 ----
>>   xen/include/asm-x86/mm.h          |  4 +++
>>   8 files changed, 99 insertions(+), 60 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index eea926d..b1e42e5 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1376,14 +1376,18 @@ unsigned long domain_get_maximum_gpfn(struct 
>> domain *d)
>>   void share_xen_page_with_guest(struct page_info *page, struct 
>> domain *d,
>>                                  enum XENSHARE_flags flags)
>>   {
>> +    unsigned long type_info;
>> +
>>       if ( page_get_owner(page) == d )
>>           return;
>>         spin_lock(&d->page_alloc_lock);
>>         /* The incremented type count pins as writable or read-only. */
>> -    page->u.inuse.type_info =
>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>> +    type_info = page->u.inuse.type_info & ~(PGT_type_mask | 
>> PGT_count_mask);
>
> The local variable can be avoided if you write:
>
> page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
> page->u.inuse.type_info |= ...;

agree, will do


>
>
>> +    page->u.inuse.type_info = type_info |
>> +        (flags == SHARE_ro ? PGT_none : PGT_writable_page) |
>> +        MASK_INSR(1, PGT_count_mask);
>>         page_set_owner(page, d);
>>       smp_wmb(); /* install valid domain ptr before updating refcnt. */
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 8b20b43..7a8d92d 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -718,8 +718,10 @@ static int p2m_mem_access_radix_set(struct 
>> p2m_domain *p2m, gfn_t gfn,
>>    * TODO: Handle superpages, for now we only take special references 
>> for leaf
>>    * pages (specifically foreign ones, which can't be super mapped 
>> today).
>>    */
>> -static void p2m_put_l3_page(const lpae_t pte)
>> +static void p2m_put_l3_page(struct p2m_domain *p2m, const lpae_t pte)
>
> You pass 'p2m' but you don't seem to use it.

indeed, p2m->domain was needed for the first version of this patch, but 
with current implementation it is not needed anymore, will drop.


>
>
>>   {
>> +    mfn_t mfn = lpae_get_mfn(pte);
>> +
>>       ASSERT(p2m_is_valid(pte));
>>         /*
>> @@ -731,11 +733,22 @@ static void p2m_put_l3_page(const lpae_t pte)
>>        */
>>       if ( p2m_is_foreign(pte.p2m.type) )
>>       {
>> -        mfn_t mfn = lpae_get_mfn(pte);
>> -
>>           ASSERT(mfn_valid(mfn));
>>           put_page(mfn_to_page(mfn));
>>       }
>> +
>> +#ifdef CONFIG_GRANT_TABLE
>> +    /*
>> +     * Check whether we deal with grant table page. As the grant 
>> table page
>> +     * is xen_heap page and its entry has known p2m type, detect it 
>> and mark
>> +     * the stored GFN as invalid. Although this check is not precise 
>> and we
>> +     * might end up updating this for other xen_heap pages, this 
>> action is
>> +     * harmless to these pages since only grant table pages have 
>> this field
>> +     * in use. So, at worst, unnecessary action might be performed.
>> +     */
>> +    if ( (pte.p2m.type == p2m_ram_rw) && is_xen_heap_mfn(mfn) )
>
> I would use p2m_is_ram() to cover read-only mapping. I think it would 
> also be better to use an ``else if`` so it is clear that this doesn't 
> cover foreign mapping (it is possible to map xenheap page from another 
> domain).

ok, will use p2m_is_ram() and ``else if`` construct, however I don't 
entirely understand why we also want/need to include read-only pages (as 
type is set to p2m_ram_rw in xenmem_add_to_physmap_one() for case 
XENMAPSPACE_grant_table)?


>
>
>> + page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>> +#endif
>>   }
>>     /* Free lpae sub-tree behind an entry */
>> @@ -768,7 +781,7 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>           p2m->stats.mappings[level]--;
>>           /* Nothing to do if the entry is a super-page. */
>>           if ( level == 3 )
>> -            p2m_put_l3_page(entry);
>> +            p2m_put_l3_page(p2m, entry);
>>           return;
>>       }
>>   diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index fe1fc11..08fc827 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -93,8 +93,6 @@ struct grant_table {
>>         /* Domain to which this struct grant_table belongs. */
>>       const struct domain *domain;
>> -
>> -    struct grant_table_arch arch;
>>   };
>>     unsigned int __read_mostly opt_max_grant_frames = 64;
>> @@ -1981,14 +1979,9 @@ int grant_table_init(struct domain *d, int 
>> max_grant_frames,
>>         grant_write_lock(gt);
>>   -    ret = gnttab_init_arch(gt);
>> -    if ( ret )
>> -        goto unlock;
>> -
>>       /* gnttab_grow_table() allocates a min number of frames, so 0 
>> is okay. */
>>       ret = gnttab_grow_table(d, 0);
>>   - unlock:
>>       grant_write_unlock(gt);
>>      out:
>> @@ -3894,8 +3887,6 @@ grant_table_destroy(
>>       if ( t == NULL )
>>           return;
>>   -    gnttab_destroy_arch(t);
>> -
>>       for ( i = 0; i < nr_grant_frames(t); i++ )
>>           free_xenheap_page(t->shared_raw[i]);
>>       xfree(t->shared_raw);
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 5801358..aafd847 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2161,6 +2161,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>>   void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>   {
>>       struct page_info *pg;
>> +    unsigned int i;
>>         ASSERT(!in_irq());
>>   @@ -2169,6 +2170,9 @@ void *alloc_xenheap_pages(unsigned int order, 
>> unsigned int memflags)
>>       if ( unlikely(pg == NULL) )
>>           return NULL;
>>   +    for ( i = 0; i < (1u << order); i++ )
>> +        arch_alloc_xenheap_page(&pg[i]);
>> +
>>       memguard_unguard_range(page_to_virt(pg), 1 << (order + 
>> PAGE_SHIFT));
>>         return page_to_virt(pg);
>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, 
>> unsigned int memflags)
>>     void free_xenheap_pages(void *v, unsigned int order)
>>   {
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>>       ASSERT(!in_irq());
>>         if ( v == NULL )
>>           return;
>>   +    pg = virt_to_page(v);
>> +
>>       memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>   -    free_heap_pages(virt_to_page(v), order, false);
>> +    for ( i = 0; i < (1u << order); i++ )
>> +        arch_free_xenheap_page(&pg[i]);
>> +
>> +    free_heap_pages(pg, order, false);
>>   }
>>     #else  /* !CONFIG_SEPARATE_XENHEAP */
>> @@ -2220,7 +2232,10 @@ void *alloc_xenheap_pages(unsigned int order, 
>> unsigned int memflags)
>>           return NULL;
>>         for ( i = 0; i < (1u << order); i++ )
>> +    {
>>           pg[i].count_info |= PGC_xen_heap;
>> +        arch_alloc_xenheap_page(&pg[i]);
>> +    }
>>         return page_to_virt(pg);
>>   }
>> @@ -2238,7 +2253,10 @@ void free_xenheap_pages(void *v, unsigned int 
>> order)
>>       pg = virt_to_page(v);
>>         for ( i = 0; i < (1u << order); i++ )
>> +    {
>>           pg[i].count_info &= ~PGC_xen_heap;
>> +        arch_free_xenheap_page(&pg[i]);
>> +    }
>>         free_heap_pages(pg, order, true);
>>   }
>> diff --git a/xen/include/asm-arm/grant_table.h 
>> b/xen/include/asm-arm/grant_table.h
>> index 0ce77f9..479339d 100644
>> --- a/xen/include/asm-arm/grant_table.h
>> +++ b/xen/include/asm-arm/grant_table.h
>> @@ -11,11 +11,6 @@
>>   #define INITIAL_NR_GRANT_FRAMES 1U
>>   #define GNTTAB_MAX_VERSION 1
>>   -struct grant_table_arch {
>> -    gfn_t *shared_gfn;
>> -    gfn_t *status_gfn;
>> -};
>> -
>>   static inline void gnttab_clear_flags(struct domain *d,
>>                                         unsigned int mask, uint16_t 
>> *addr)
>>   {
>> @@ -46,35 +41,11 @@ int replace_grant_host_mapping(unsigned long 
>> gpaddr, mfn_t mfn,
>>   #define gnttab_dom0_frames() \
>>       min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - 
>> _stext))
>>   -#define gnttab_init_arch(gt) \
>> -({ \
>> -    unsigned int ngf_ = 
>> (gt)->max_grant_frames;                          \
>> -    unsigned int nsf_ = 
>> grant_to_status_frames(ngf_);                    \
>> - \
>> -    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, 
>> ngf_);                  \
>> -    (gt)->arch.status_gfn = xmalloc_array(gfn_t, 
>> nsf_);                  \
>> -    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn 
>> )                \
>> - { \
>> -        while ( ngf_-- 
>> )                                                 \
>> -            (gt)->arch.shared_gfn[ngf_] = 
>> INVALID_GFN;                   \
>> -        while ( nsf_-- 
>> )                                                 \
>> -            (gt)->arch.status_gfn[nsf_] = 
>> INVALID_GFN;                   \
>> - } \
>> - else \
>> - gnttab_destroy_arch(gt); \
>> -    (gt)->arch.shared_gfn ? 0 : 
>> -ENOMEM;                                 \
>> -})
>> -
>> -#define gnttab_destroy_arch(gt) \
>> -    do { \
>> - XFREE((gt)->arch.shared_gfn); \
>> - XFREE((gt)->arch.status_gfn); \
>> -    } while ( 0 )
>> -
>>   #define gnttab_set_frame_gfn(gt, st, idx, 
>> gfn)                           \
>>       do { \
>> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] 
>> =    \
>> - (gfn);                                                       \
>> +        struct page_info *pg_ = (st) ? gnttab_status_page(gt, 
>> idx)       \
>> +                                     : gnttab_shared_page(gt, 
>> idx);      \
>> +        page_set_frame_gfn(pg_, 
>> gfn);                                    \
>>       } while ( 0 )
>>     #define gnttab_get_frame_gfn(gt, st, idx) 
>> ({                             \
>> @@ -82,11 +53,25 @@ int replace_grant_host_mapping(unsigned long 
>> gpaddr, mfn_t mfn,
>>           : gnttab_shared_gfn(NULL, gt, 
>> idx);                              \
>>   })
>>   -#define gnttab_shared_gfn(d, t, 
>> i)                                       \
>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : 
>> (t)->arch.shared_gfn[i])
>> +#define gnttab_shared_page(t, i) 
>> ({                                      \
>> + ASSERT((t)->shared_raw[i]); \
>
> The ASSERT() is unnecessary because virt_to_mfn() will panic() if the 
> virtual address is not mapped.

Right, ...


>
>
>> + mfn_to_page(_mfn(__virt_to_mfn((t)->shared_raw[i]))); \
>
> You can directly use virt_to_page(...) for xenheap which also contains
> some ASSERT() preventing NULL among other value.

    ... indeed this would look much better


>
>
>> +})
>> +
>> +#define gnttab_status_page(t, i) 
>> ({                                      \
>> + ASSERT((t)->status[i]); \
>> + mfn_to_page(_mfn(__virt_to_mfn((t)->status[i]))); \
>
> Same here.

ok


>
>> +})
>>   -#define gnttab_status_gfn(d, t, 
>> i)                                       \
>> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : 
>> (t)->arch.status_gfn[i])
>> +#define gnttab_shared_gfn(d, t, i) 
>> ({                                    \
>> +    struct page_info *pg_ = gnttab_shared_page(t, 
>> i);                    \
>
> NIT: I would drop the local variable.

ok


>
>
>> + page_get_frame_gfn(pg_); \
>> +})
>> +
>> +#define gnttab_status_gfn(d, t, i) 
>> ({                                    \
>> +    struct page_info *pg_ = gnttab_status_page(t, 
>> i);                    \
>
> NIT: I would drop the local variable.

ok


>
>> + page_get_frame_gfn(pg_); \
>> +})
>>     #define gnttab_need_iommu_mapping(d)                    \
>>       (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>> index 7b5e7b7..a00c5f5 100644
>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -98,9 +98,17 @@ struct page_info
>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable 
>> mappings?         */
>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 
>> 63.                 */
>>   - /* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>> + /* 2-bit count of uses of this frame as its current type. */
>> +#define PGT_count_mask    PG_mask(3, 3)
>> +
>> +/*
>> + * Stored in bits [28:0] or [60:0] GFN if page is used for grant 
>> table frame.
>
> I think this wording is conflicting with ...
>
>> + * This only valid for the xenheap pages.
>
> ... this becase xen heap pages are used in other situations. But I 
> would prefer if the comment doesn't mention grant-table frame. This 
> would allow use to repurpose the field for other xenheap if needed.
>
> Typo: This *is* only valid


ok, so how about to simply mention it's purpose as xenheap GFN here and 
down this header?

For example,
Stored in bits [28:0] or [60:0] GFN if page is xenheap page.

BTW, shall I rename the access helpers page_set(get)_frame_gfn() as 
well? For me the frame is associated with grant-table.
Something to: page_set(get)_xenheap_gfn() or even page_set(get)_gfn().


>
>
>> + */
>> +#define PGT_gfn_width     PG_shift(3)
>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
>> +
>> +#define PGT_INVALID_FRAME_GFN   _gfn(PGT_gfn_mask)
>>      /* Cleared when the owning guest 'frees' this page. */
>>   #define _PGC_allocated    PG_shift(1)
>> @@ -166,6 +174,27 @@ extern unsigned long xenheap_base_pdx;
>>     #define maddr_get_owner(ma) (page_get_owner(maddr_to_page((ma))))
>>   +#define page_get_frame_gfn(p) ({                                \
>
> Above, you wrote:
>
> "This is only valid for xenheap pages". So I would add an ASSERT() to 
> confirm that.

Sounds reasonable, will add.


>
>
>> +    gfn_t gfn_ = _gfn((p)->u.inuse.type_info & PGT_gfn_mask);   \
>> +    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_; \
>> +})
>
> Can the function be converted to a static inline?


I don't see why not from the first look, will convert.


>
>
>> +
>> +#define page_set_frame_gfn(p, gfn) ({ \
>
> Same questions as above to add an ASSERT() and convert to a static inline.


ok


>
>
>> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ?                     \
>> +                 PGT_INVALID_FRAME_GFN : gfn; \
>> +    (p)->u.inuse.type_info &= ~PGT_gfn_mask;                    \
>> +    (p)->u.inuse.type_info |= gfn_x(gfn_);                      \
>> +})
>> +
>> +/*
>> + * As the struct page_info representing the xen_heap page can contain
>> + * the grant table frame GFN on Arm we need to clear it beforehand and
>> + * make sure it is not still set when freeing a page.
>> + */
> I would prefer if the comment doesn't mention grant-table frame. This 
> would allow use to repurpose the field for other xenheap if needed.

ok


>
>
>> +#define arch_alloc_xenheap_page(p) page_set_frame_gfn(p, INVALID_GFN)
>> +#define arch_free_xenheap_page(p) \
>> +    BUG_ON(!gfn_eq(page_get_frame_gfn(p), INVALID_GFN))
>
> I believe this BUG_ON() could be triggered if gnttab_map_frame() 
> succeeds but then we fail to insert the entry in the P2M. This means 
> we would need to revert changes done in gnttab_map_frame() in case of 
> failure.
>
> However, I am still a bit unease with the BUG_ON(). A domain will not 
> necessarily remove the grant-table mapping from its P2M before 
> shutting down. So you are relying on Xen to go through the P2M before 
> we free the page.
>
> This is the case today, but I am not sure we would want to rely on it 
> because it will be hard to remember this requirement if we decide to 
> optimize p2m_relinquish().
>
> One possibility would be to add a comment in p2m_relinquish(). That's 
> assuming there are no other places which could lead to false 
> positively hit the BUG().

These make me think that it would be better (safer and simpler) to just 
remove this BUG_ON() for now. Do you agree?


>
>
>> +
>>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>>   /* PDX of the first page in the frame table. */
>>   extern unsigned long frametable_base_pdx;
>> diff --git a/xen/include/asm-x86/grant_table.h 
>> b/xen/include/asm-x86/grant_table.h
>> index 84e3296..0eb018f 100644
>> --- a/xen/include/asm-x86/grant_table.h
>> +++ b/xen/include/asm-x86/grant_table.h
>> @@ -14,9 +14,6 @@
>>     #define INITIAL_NR_GRANT_FRAMES 1U
>>   -struct grant_table_arch {
>> -};
>> -
>>   static inline int create_grant_host_mapping(uint64_t addr, mfn_t 
>> frame,
>>                                               unsigned int flags,
>>                                               unsigned int cache_flags)
>> @@ -35,8 +32,6 @@ static inline int 
>> replace_grant_host_mapping(uint64_t addr, mfn_t frame,
>>       return replace_grant_pv_mapping(addr, frame, new_addr, flags);
>>   }
>>   -#define gnttab_init_arch(gt) 0
>> -#define gnttab_destroy_arch(gt) do {} while ( 0 )
>>   #define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
>>   #define gnttab_get_frame_gfn(gt, st, idx) 
>> ({                             \
>>       mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, 
>> idx)                       \
>> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
>> index cb90527..04d8704 100644
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -327,6 +327,10 @@ struct page_info
>>     #define maddr_get_owner(ma) (page_get_owner(maddr_to_page((ma))))
>>   +/* No arch-specific actions are needed for the xen_heap page */
>> +#define arch_alloc_xenheap_page(p)   do {} while ( 0 )
>> +#define arch_free_xenheap_page(p)    do {} while ( 0 )
>> +
>>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>>   extern unsigned long max_page;
>>   extern unsigned long total_pages;
>>
>
-- 
Regards,

Oleksandr Tyshchenko


