Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A745FAA9096
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 12:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975955.1363234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBsir-0004Xj-ME; Mon, 05 May 2025 10:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975955.1363234; Mon, 05 May 2025 10:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBsir-0004V9-Fq; Mon, 05 May 2025 10:06:53 +0000
Received: by outflank-mailman (input) for mailman id 975955;
 Mon, 05 May 2025 10:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBsip-0004V3-Qc
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 10:06:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a86aeaab-2998-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 12:06:48 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so732848866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 03:06:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fb4sm474942266b.10.2025.05.05.03.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:06:47 -0700 (PDT)
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
X-Inumbo-ID: a86aeaab-2998-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746439608; x=1747044408; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnWbTMR6PFtZ/HWhz6xzS0TH/ykoGRXRZPYKmmnoTOI=;
        b=JpkPs5vmIJv2gFlok8K3zD0TVmH0ugLHreN+4L2cXGCAuLt9A3dNjh/vI4bOmIBS60
         p/GrowlNVcbfRA7CHmT92BrLjxKAbe7dpkw47N4q7AmNV3RgjUfak2oBFsNuf/FUMH7n
         ogtgNVYB7Bv2lPK1HopfEnw0AqwwVpZyCzZ7v5hlTxgJleCtLMbgCiNoP6ee0l4ewW+B
         gHFnGINEIyE69ISbHxO0hv28z3l+e/tUZPLr/Qogp3ZIS+/EPmg16Eba/nIRD/bF2eFt
         pmQyuViy+ds54GrHFR7RiHE4VY6W0rS7cEd/Ya5QRW5UnFQiC8fn7D5Qkq16n5hf3/Aj
         Y5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746439608; x=1747044408;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnWbTMR6PFtZ/HWhz6xzS0TH/ykoGRXRZPYKmmnoTOI=;
        b=Y4SJJH9YeC1KV/TEHzskff4eL95gg6s1ziwQnWmsoV+xR1Bdt8gbPv491Eddmcir59
         qUf8OV9Ovc0wDJw0e4TkYbwKQjRnHeqdxaaCgwLeXYUsHTR/Bmvjv6Pnt9Bmv4VLi5gh
         /KDBN22x2IXUDKVCN8y1HLfUV5jXrrshRAeVXJDKOKuwAq9Cnw83yEwildwS0vNPxAJB
         M/+pKDeKnTJLfUzabmjYjcTwxW6oC22DzTzqXk+MtDVL5HTK+SklVys2j5tACjumsKXh
         j0CRlHVRRT6OKbEj6MtC89puT1fClF0iYMWAfLCjSy7defA7xHIHUk3kTaghvqXl8Gnh
         VnIQ==
X-Gm-Message-State: AOJu0YzIbSYBD5P4ZDzx3hs3co+AYTTzkHvsY7aKoPZJn/ZmSWDnpqZX
	sTIY7e+29U/5PFQ2Oje/r8noEdONH946Lad19qR+MCxgeqGH89AJ/OOsiA==
X-Gm-Gg: ASbGncvFnIgomt/toVuE5K2kg8DYnBa6tJGL1MRsquRa1YkPvDvfRCLQmO5hmYmHSeS
	SdnxJmGs6IpNaC18so6favKUUTQR21rbS/OnnQ7QZOHGKv/1XfheMRtDpHNhEMyE/WKlLRJMCE1
	m/f/20BRoE3T4vqrt8V7rUt2LSvvvdyYFboTTVSl69IZ1NsahsUcnZ3jhO9MLW4uEnah00zfZnw
	jVR/HyEd5/FuuCViL+LRyJYZBtteIKRaqGEktYChuLRRRdtSj3zDUxxa1dabk8/pI4fnYWK294d
	Neh2HBZuqnGlUOACokszW2mumLos79hSF3tWdhUi6LyFfBl1MNAJDZ23WVN5+QrMG72uuU3y1UK
	3Hv/gra8PSyXsMsVd
X-Google-Smtp-Source: AGHT+IH1bl3Z5HCcH44OHj+U7z/CJBV4TnuQUNP3FTvsZTQhPCkyw4IX7xlKnsdPXXUHojQ61kzrlA==
X-Received: by 2002:a17:907:96a2:b0:ac7:391b:e684 with SMTP id a640c23a62f3a-ad1a4b5b9abmr573296666b.58.1746439607617;
        Mon, 05 May 2025 03:06:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------c3Tx0EG8Ky8f2ynJQQQ1P3ru"
Message-ID: <e44b9ef7-a2cb-4563-952f-07b1f6250af3@gmail.com>
Date: Mon, 5 May 2025 12:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] xen/common: dom0less: introduce common
 domain-build.c
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <291544ec45d69a3f0ff79eb6770266a0aa04e77d.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------c3Tx0EG8Ky8f2ynJQQQ1P3ru
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 10:02 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Some functions of Arm's domain_build.c could be reused by dom0less or other
>> features connected to domain construction/build.
>>
>> The following functions are moved to common:
>> - get_allocation_size().
>> - allocate_domheap_memory().
>> - guest_map_pages().
>> - allocate_bank_memory().
>> - add_hwdom_free_regions().
>> - find_unallocated_memory().
>> - allocate_memory().
>> - dtb_load().
>> - initrd_load().
> The declaration of allocate_domheap_memory, allocate_bank_memory,
> allocate_memory were moved in patch #5. Maybe their movement should be
> in this patch?

Sure, it makes sense.

>
>> Prototype of dtb_load() and initrd_load() is updated to recieve a pointer
>> to copy_to_guest_phys() as some archs require
>> copy_to_guest_phys_fluch_dcache().
>>
>> Update arm/include/asm/Makefile to generate  domain-build.h for Arm as it is
>> used by domain-build.c.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Change in v3:
>>   - Nothing changed. Only rebase.
>> ---
>> Change in v2:
>>   - Use xen/fdt-domain-build.h instead of asm/domain_build.h.
>> ---
>>   xen/arch/arm/domain_build.c           | 397 +------------------------
>>   xen/common/device-tree/Makefile       |   1 +
>>   xen/common/device-tree/domain-build.c | 404 ++++++++++++++++++++++++++
>>   xen/include/xen/fdt-domain-build.h    |  33 ++-
>>   4 files changed, 439 insertions(+), 396 deletions(-)
>>   create mode 100644 xen/common/device-tree/domain-build.c
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 9d649b06b3..df29619c40 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -120,18 +120,6 @@ struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
>>       return vcpu_create(dom0, 0);
>>   }
>>   
>> -unsigned int __init get_allocation_size(paddr_t size)
>> -{
>> -    /*
>> -     * get_order_from_bytes returns the order greater than or equal to
>> -     * the given size, but we need less than or equal. Adding one to
>> -     * the size pushes an evenly aligned size into the next order, so
>> -     * we can then unconditionally subtract 1 from the order which is
>> -     * returned.
>> -     */
>> -    return get_order_from_bytes(size + 1) - 1;
>> -}
>> -
>>   /*
>>    * Insert the given pages into a memory bank, banks are ordered by address.
>>    *
>> @@ -418,98 +406,6 @@ static void __init allocate_memory_11(struct domain *d,
>>       }
>>   }
>>   
>> -bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> -                                    alloc_domheap_mem_cb cb, void *extra)
>> -{
>> -    unsigned int max_order = UINT_MAX;
>> -
>> -    while ( tot_size > 0 )
>> -    {
>> -        unsigned int order = get_allocation_size(tot_size);
>> -        struct page_info *pg;
>> -
>> -        order = min(max_order, order);
>> -
>> -        pg = alloc_domheap_pages(d, order, 0);
>> -        if ( !pg )
>> -        {
>> -            /*
>> -             * If we can't allocate one page, then it is unlikely to
>> -             * succeed in the next iteration. So bail out.
>> -             */
>> -            if ( !order )
>> -                return false;
>> -
>> -            /*
>> -             * If we can't allocate memory with order, then it is
>> -             * unlikely to succeed in the next iteration.
>> -             * Record the order - 1 to avoid re-trying.
>> -             */
>> -            max_order = order - 1;
>> -            continue;
>> -        }
>> -
>> -        if ( !cb(d, pg, order, extra) )
>> -            return false;
>> -
>> -        tot_size -= (1ULL << (PAGE_SHIFT + order));
>> -    }
>> -
>> -    return true;
>> -}
>> -
>> -static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
>> -                                   unsigned int order, void *extra)
>> -{
>> -    gfn_t *sgfn = (gfn_t *)extra;
>> -    int res;
>> -
>> -    BUG_ON(!sgfn);
>> -    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
>> -    if ( res )
>> -    {
>> -        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
>> -        return false;
>> -    }
>> -
>> -    *sgfn = gfn_add(*sgfn, 1UL << order);
>> -
>> -    return true;
>> -}
>> -
>> -bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> -                                 paddr_t tot_size)
>> -{
>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>> -    struct domain *d = kinfo->d;
>> -    struct membank *bank;
>> -
>> -    /*
>> -     * allocate_bank_memory can be called with a tot_size of zero for
>> -     * the second memory bank. It is not an error and we can safely
>> -     * avoid creating a zero-size memory bank.
>> -     */
>> -    if ( tot_size == 0 )
>> -        return true;
>> -
>> -    bank = &mem->bank[mem->nr_banks];
>> -    bank->start = gfn_to_gaddr(sgfn);
>> -    bank->size = tot_size;
>> -
>> -    /*
>> -     * Allocate pages from the heap until tot_size is zero and map them to the
>> -     * guest using guest_map_pages, passing the starting gfn as extra parameter
>> -     * for the map operation.
>> -     */
>> -    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
>> -        return false;
>> -
>> -    mem->nr_banks++;
>> -    kinfo->unassigned_mem -= bank->size;
>> -
>> -    return true;
>> -}
>> -
>>   /*
>>    * When PCI passthrough is available we want to keep the
>>    * "linux,pci-domain" in sync for every host bridge.
>> @@ -900,226 +796,6 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>>       return 0;
>>   }
>>   
>> -static int __init add_hwdom_free_regions(unsigned long s_gfn,
>> -                                         unsigned long e_gfn, void *data)
>> -{
>> -    struct membanks *free_regions = data;
>> -    paddr_t start, size;
>> -    paddr_t s = pfn_to_paddr(s_gfn);
>> -    paddr_t e = pfn_to_paddr(e_gfn);
>> -    unsigned int i, j;
>> -
>> -    if ( free_regions->nr_banks >= free_regions->max_banks )
>> -        return 0;
>> -
>> -    /*
>> -     * Both start and size of the free region should be 2MB aligned to
>> -     * potentially allow superpage mapping.
>> -     */
>> -    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>> -    if ( start > e )
>> -        return 0;
>> -
>> -    /*
>> -     * e is actually "end-1" because it is called by rangeset functions
>> -     * which are inclusive of the last address.
>> -     */
>> -    e += 1;
>> -    size = (e - start) & ~(SZ_2M - 1);
>> -
>> -    /* Find the insert position (descending order). */
>> -    for ( i = 0; i < free_regions->nr_banks ; i++ )
>> -        if ( size > free_regions->bank[i].size )
>> -            break;
>> -
>> -    /* Move the other banks to make space. */
>> -    for ( j = free_regions->nr_banks; j > i ; j-- )
>> -    {
>> -        free_regions->bank[j].start = free_regions->bank[j - 1].start;
>> -        free_regions->bank[j].size = free_regions->bank[j - 1].size;
>> -    }
>> -
>> -    free_regions->bank[i].start = start;
>> -    free_regions->bank[i].size = size;
>> -    free_regions->nr_banks++;
>> -
>> -    return 0;
>> -}
>> -
>> -/*
>> - * Find unused regions of Host address space which can be exposed to domain
>> - * using the host memory layout. In order to calculate regions we exclude every
>> - * region passed in mem_banks from the Host RAM.
>> - */
>> -static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>> -                                          const struct membanks *mem_banks[],
>> -                                          unsigned int nr_mem_banks,
>> -                                          struct membanks *free_regions,
>> -                                          int (*cb)(unsigned long s_gfn,
>> -                                                    unsigned long e_gfn,
>> -                                                    void *data))
>> -{
>> -    const struct membanks *mem = bootinfo_get_mem();
>> -    struct rangeset *unalloc_mem;
>> -    paddr_t start, end;
>> -    unsigned int i, j;
>> -    int res;
>> -
>> -    ASSERT(domain_use_host_layout(kinfo->d));
>> -
>> -    unalloc_mem = rangeset_new(NULL, NULL, 0);
>> -    if ( !unalloc_mem )
>> -        return -ENOMEM;
>> -
>> -    /* Start with all available RAM */
>> -    for ( i = 0; i < mem->nr_banks; i++ )
>> -    {
>> -        start = mem->bank[i].start;
>> -        end = mem->bank[i].start + mem->bank[i].size;
>> -        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
>> -                                 PFN_DOWN(end - 1));
>> -        if ( res )
>> -        {
>> -            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
>> -                   start, end);
>> -            goto out;
>> -        }
>> -    }
>> -
>> -    /* Remove all regions listed in mem_banks */
>> -    for ( i = 0; i < nr_mem_banks; i++ )
>> -        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>> -        {
>> -            start = mem_banks[i]->bank[j].start;
>> -
>> -            /* Shared memory banks can contain INVALID_PADDR as start */
>> -            if ( INVALID_PADDR == start )
>> -                continue;
>> -
>> -            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
>> -            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
>> -                                        PFN_DOWN(end - 1));
>> -            if ( res )
>> -            {
>> -                printk(XENLOG_ERR
>> -                       "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error %d\n",
>> -                       start, end, res);
>> -                goto out;
>> -            }
>> -        }
>> -
>> -    start = 0;
>> -    end = (1ULL << p2m_ipa_bits) - 1;
>> -    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
>> -                                 cb, free_regions);
>> -    if ( res )
>> -        free_regions->nr_banks = 0;
>> -    else if ( !free_regions->nr_banks )
>> -        res = -ENOENT;
>> -
>> -out:
>> -    rangeset_destroy(unalloc_mem);
>> -
>> -    return res;
>> -}
>> -
>> -void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>> -{
>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>> -    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>> -    struct membanks *hwdom_free_mem = NULL;
>> -
>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>> -
>> -    mem->nr_banks = 0;
>> -    /*
>> -     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>> -     * is enabled.
>> -     */
>> -    if ( is_hardware_domain(d) )
>> -    {
>> -        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>> -        /*
>> -         * Exclude the following regions:
>> -         * 1) Remove reserved memory
>> -         * 2) Grant table assigned to hwdom
>> -         */
>> -        const struct membanks *mem_banks[] = {
>> -            bootinfo_get_reserved_mem(),
>> -            gnttab,
>> -        };
>> -
>> -        if ( !gnttab )
>> -            goto fail;
>> -
>> -        gnttab->nr_banks = 1;
>> -        gnttab->bank[0].start = kinfo->gnttab_start;
>> -        gnttab->bank[0].size = kinfo->gnttab_size;
>> -
>> -        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>> -        if ( !hwdom_free_mem )
>> -            goto fail;
>> -
>> -        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>> -                                     hwdom_free_mem, add_hwdom_free_regions) )
>> -            goto fail;
>> -
>> -        nr_banks = hwdom_free_mem->nr_banks;
>> -        xfree(gnttab);
>> -    }
>> -
>> -    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
>> -    {
>> -        paddr_t bank_start, bank_size;
>> -
>> -        if ( is_hardware_domain(d) )
>> -        {
>> -            bank_start = hwdom_free_mem->bank[i].start;
>> -            bank_size = hwdom_free_mem->bank[i].size;
>> -        }
>> -        else
>> -        {
>> -            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> -            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> -
>> -            if ( i >= GUEST_RAM_BANKS )
>> -                goto fail;
>> -
>> -            bank_start = bankbase[i];
>> -            bank_size = banksize[i];
>> -        }
>> -
>> -        bank_size = MIN(bank_size, kinfo->unassigned_mem);
>> -        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>> -            goto fail;
>> -    }
>> -
>> -    if ( kinfo->unassigned_mem )
>> -        goto fail;
>> -
>> -    for( i = 0; i < mem->nr_banks; i++ )
>> -    {
>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>> -               d,
>> -               i,
>> -               mem->bank[i].start,
>> -               mem->bank[i].start + mem->bank[i].size,
>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>> -               (unsigned long)(mem->bank[i].size >> 20));
>> -    }
>> -
>> -    xfree(hwdom_free_mem);
>> -    return;
>> -
>> -  fail:
>> -    panic("Failed to allocate requested domain memory."
>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>> -}
>> -
>>   static int __init handle_pci_range(const struct dt_device_node *dev,
>>                                      uint64_t addr, uint64_t len, void *data)
>>   {
>> @@ -2059,75 +1735,6 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
>>       return -EINVAL;
>>   }
>>   
>> -static void __init dtb_load(struct kernel_info *kinfo)
>> -{
>> -    unsigned long left;
>> -
>> -    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>> -           kinfo->d, kinfo->dtb_paddr,
>> -           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
>> -
>> -    left = copy_to_guest_phys_flush_dcache(kinfo->d, kinfo->dtb_paddr,
>> -                                           kinfo->fdt,
>> -                                           fdt_totalsize(kinfo->fdt));
>> -
>> -    if ( left != 0 )
>> -        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
>> -              kinfo->d, left);
>> -    xfree(kinfo->fdt);
>> -}
>> -
>> -static void __init initrd_load(struct kernel_info *kinfo)
>> -{
>> -    const struct bootmodule *mod = kinfo->initrd_bootmodule;
>> -    paddr_t load_addr = kinfo->initrd_paddr;
>> -    paddr_t paddr, len;
>> -    int node;
>> -    int res;
>> -    __be32 val[2];
>> -    __be32 *cellp;
>> -    void __iomem *initrd;
>> -
>> -    if ( !mod || !mod->size )
>> -        return;
>> -
>> -    paddr = mod->start;
>> -    len = mod->size;
>> -
>> -    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>> -           kinfo->d, paddr, load_addr, load_addr + len);
>> -
>> -    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
>> -    node = fdt_path_offset(kinfo->fdt, "/chosen");
>> -    if ( node < 0 )
>> -        panic("Cannot find the /chosen node\n");
>> -
>> -    cellp = (__be32 *)val;
>> -    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
>> -    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
>> -                              val, sizeof(val));
>> -    if ( res )
>> -        panic("Cannot fix up \"linux,initrd-start\" property\n");
>> -
>> -    cellp = (__be32 *)val;
>> -    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
>> -    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
>> -                              val, sizeof(val));
>> -    if ( res )
>> -        panic("Cannot fix up \"linux,initrd-end\" property\n");
>> -
>> -    initrd = ioremap_wc(paddr, len);
>> -    if ( !initrd )
>> -        panic("Unable to map the %pd initrd\n", kinfo->d);
>> -
>> -    res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
>> -                                          initrd, len);
>> -    if ( res != 0 )
>> -        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
>> -
>> -    iounmap(initrd);
>> -}
>> -
>>   /*
>>    * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
>>    * The allocated IRQ will be found in d->arch.evtchn_irq.
>> @@ -2220,8 +1827,8 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>        */
>>       kernel_load(kinfo);
>>       /* initrd_load will fix up the fdt, so call it before dtb_load */
>> -    initrd_load(kinfo);
>> -    dtb_load(kinfo);
>> +    initrd_load(kinfo, copy_to_guest_phys_flush_dcache);
>> +    dtb_load(kinfo, copy_to_guest_phys_flush_dcache);
>>   
>>       memset(regs, 0, sizeof(*regs));
>>   
>> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
>> index e88a4d5799..831b91399b 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -1,6 +1,7 @@
>>   obj-y += bootfdt.init.o
>>   obj-y += bootinfo.init.o
>>   obj-y += device-tree.o
>> +obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.o
>>   obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
>>   obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>>   obj-y += intc.o
>> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
>> new file mode 100644
>> index 0000000000..69257a15ba
>> --- /dev/null
>> +++ b/xen/common/device-tree/domain-build.c
>> @@ -0,0 +1,404 @@
>> +#include <xen/bootfdt.h>
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/mm.h>
>> +#include <xen/sched.h>
>> +#include <xen/sizes.h>
>> +#include <xen/types.h>
>> +#include <xen/vmap.h>
>> +
>> +#include <asm/p2m.h>
>> +
>> +bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> +                                    alloc_domheap_mem_cb cb, void *extra)
>> +{
>> +    unsigned int max_order = UINT_MAX;
>> +
>> +    while ( tot_size > 0 )
>> +    {
>> +        unsigned int order = get_allocation_size(tot_size);
>> +        struct page_info *pg;
>> +
>> +        order = min(max_order, order);
>> +
>> +        pg = alloc_domheap_pages(d, order, 0);
>> +        if ( !pg )
>> +        {
>> +            /*
>> +             * If we can't allocate one page, then it is unlikely to
>> +             * succeed in the next iteration. So bail out.
>> +             */
>> +            if ( !order )
>> +                return false;
>> +
>> +            /*
>> +             * If we can't allocate memory with order, then it is
>> +             * unlikely to succeed in the next iteration.
>> +             * Record the order - 1 to avoid re-trying.
>> +             */
>> +            max_order = order - 1;
>> +            continue;
>> +        }
>> +
>> +        if ( !cb(d, pg, order, extra) )
>> +            return false;
>> +
>> +        tot_size -= (1ULL << (PAGE_SHIFT + order));
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
>> +                                   unsigned int order, void *extra)
>> +{
>> +    gfn_t *sgfn = (gfn_t *)extra;
>> +    int res;
>> +
>> +    BUG_ON(!sgfn);
>> +    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
>> +    if ( res )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
>> +        return false;
>> +    }
>> +
>> +    *sgfn = gfn_add(*sgfn, 1UL << order);
>> +
>> +    return true;
>> +}
>> +
>> +bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> +                                 paddr_t tot_size)
>> +{
>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>> +    struct domain *d = kinfo->d;
>> +    struct membank *bank;
>> +
>> +    /*
>> +     * allocate_bank_memory can be called with a tot_size of zero for
>> +     * the second memory bank. It is not an error and we can safely
>> +     * avoid creating a zero-size memory bank.
>> +     */
>> +    if ( tot_size == 0 )
>> +        return true;
>> +
>> +    bank = &mem->bank[mem->nr_banks];
>> +    bank->start = gfn_to_gaddr(sgfn);
>> +    bank->size = tot_size;
>> +
>> +    /*
>> +     * Allocate pages from the heap until tot_size is zero and map them to the
>> +     * guest using guest_map_pages, passing the starting gfn as extra parameter
>> +     * for the map operation.
>> +     */
>> +    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
>> +        return false;
>> +
>> +    mem->nr_banks++;
>> +    kinfo->unassigned_mem -= bank->size;
>> +
>> +    return true;
>> +}
>> +
>> +static int __init add_hwdom_free_regions(unsigned long s_gfn,
>> +                                         unsigned long e_gfn, void *data)
>> +{
>> +    struct membanks *free_regions = data;
>> +    paddr_t start, size;
>> +    paddr_t s = pfn_to_paddr(s_gfn);
>> +    paddr_t e = pfn_to_paddr(e_gfn);
>> +    unsigned int i, j;
>> +
>> +    if ( free_regions->nr_banks >= free_regions->max_banks )
>> +        return 0;
>> +
>> +    /*
>> +     * Both start and size of the free region should be 2MB aligned to
>> +     * potentially allow superpage mapping.
>> +     */
>> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>> +    if ( start > e )
>> +        return 0;
>> +
>> +    /*
>> +     * e is actually "end-1" because it is called by rangeset functions
>> +     * which are inclusive of the last address.
>> +     */
>> +    e += 1;
>> +    size = (e - start) & ~(SZ_2M - 1);
>> +
>> +    /* Find the insert position (descending order). */
>> +    for ( i = 0; i < free_regions->nr_banks ; i++ )
>> +        if ( size > free_regions->bank[i].size )
>> +            break;
>> +
>> +    /* Move the other banks to make space. */
>> +    for ( j = free_regions->nr_banks; j > i ; j-- )
>> +    {
>> +        free_regions->bank[j].start = free_regions->bank[j - 1].start;
>> +        free_regions->bank[j].size = free_regions->bank[j - 1].size;
>> +    }
>> +
>> +    free_regions->bank[i].start = start;
>> +    free_regions->bank[i].size = size;
>> +    free_regions->nr_banks++;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Find unused regions of Host address space which can be exposed to domain
>> + * using the host memory layout. In order to calculate regions we exclude every
>> + * region passed in mem_banks from the Host RAM.
>> + */
>> +int __init find_unallocated_memory(const struct kernel_info *kinfo,
>> +                                   const struct membanks *mem_banks[],
>> +                                   unsigned int nr_mem_banks,
>> +                                   struct membanks *free_regions,
>> +                                   int (*cb)(unsigned long s_gfn,
>> +                                             unsigned long e_gfn,
>> +                                             void *data))
>> +{
>> +    const struct membanks *mem = bootinfo_get_mem();
>> +    struct rangeset *unalloc_mem;
>> +    paddr_t start, end;
>> +    unsigned int i, j;
>> +    int res;
>> +
>> +    ASSERT(domain_use_host_layout(kinfo->d));
>> +
>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>> +    if ( !unalloc_mem )
>> +        return -ENOMEM;
>> +
>> +    /* Start with all available RAM */
>> +    for ( i = 0; i < mem->nr_banks; i++ )
>> +    {
>> +        start = mem->bank[i].start;
>> +        end = mem->bank[i].start + mem->bank[i].size;
>> +        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
>> +                                 PFN_DOWN(end - 1));
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove all regions listed in mem_banks */
>> +    for ( i = 0; i < nr_mem_banks; i++ )
>> +        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>> +        {
>> +            start = mem_banks[i]->bank[j].start;
>> +
>> +            /* Shared memory banks can contain INVALID_PADDR as start */
>> +            if ( INVALID_PADDR == start )
>> +                continue;
>> +
>> +            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
>> +            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
>> +                                        PFN_DOWN(end - 1));
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error %d\n",
>> +                       start, end, res);
>> +                goto out;
>> +            }
>> +        }
>> +
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
>> +                                 cb, free_regions);
>> +    if ( res )
>> +        free_regions->nr_banks = 0;
>> +    else if ( !free_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(unalloc_mem);
>> +
>> +    return res;
>> +}
>> +
>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>> +    struct membanks *hwdom_free_mem = NULL;
>> +
>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>> +
>> +    mem->nr_banks = 0;
>> +    /*
>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>> +     * is enabled.
>> +     */
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> shouldn't we set gnttab->max_banks and gnttab->type here?

Here and ...

>
>
>> +        /*
>> +         * Exclude the following regions:
>> +         * 1) Remove reserved memory
>> +         * 2) Grant table assigned to hwdom
>> +         */
>> +        const struct membanks *mem_banks[] = {
>> +            bootinfo_get_reserved_mem(),
>> +            gnttab,
>> +        };
>> +
>> +        if ( !gnttab )
>> +            goto fail;
>> +
>> +        gnttab->nr_banks = 1;
>> +        gnttab->bank[0].start = kinfo->gnttab_start;
>> +        gnttab->bank[0].size = kinfo->gnttab_size;
>> +
>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>> +                                             NR_MEM_BANKS);
>> +        if ( !hwdom_free_mem )
>> +            goto fail;
>> +
>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
> here we are missing setting hwdom_free_mem->type ?

... here, membanks_xzalloc() should be really used.
for the first one case - membanks_xzalloc(1, MEMORY) and
for the second - membanks_xzalloc(NR_MEM_BANKS, MEMORY).
Good catch.

>
>> +
>> +        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>> +                                     hwdom_free_mem, add_hwdom_free_regions) )
>> +            goto fail;
>> +
>> +        nr_banks = hwdom_free_mem->nr_banks;
>> +        xfree(gnttab);
>> +    }
>> +
>> +    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
>> +    {
>> +        paddr_t bank_start, bank_size;
>> +
>> +        if ( is_hardware_domain(d) )
>> +        {
>> +            bank_start = hwdom_free_mem->bank[i].start;
>> +            bank_size = hwdom_free_mem->bank[i].size;
>> +        }
>> +        else
>> +        {
>> +            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> +            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> +
>> +            if ( i >= GUEST_RAM_BANKS )
>> +                goto fail;
>> +
>> +            bank_start = bankbase[i];
>> +            bank_size = banksize[i];
>> +        }
>> +
>> +        bank_size = MIN(bank_size, kinfo->unassigned_mem);
>> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>> +            goto fail;
>> +    }
>> +
>> +    if ( kinfo->unassigned_mem )
>> +        goto fail;
>> +
>> +    for( i = 0; i < mem->nr_banks; i++ )
>> +    {
>> +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>> +               d,
>> +               i,
>> +               mem->bank[i].start,
>> +               mem->bank[i].start + mem->bank[i].size,
>> +               /* Don't want format this as PRIpaddr (16 digit hex) */
>> +               (unsigned long)(mem->bank[i].size >> 20));
>> +    }
>> +
>> +    xfree(hwdom_free_mem);
>> +    return;
>> +
>> +  fail:
>> +    panic("Failed to allocate requested domain memory."
>> +          /* Don't want format this as PRIpaddr (16 digit hex) */
>> +          " %ldKB unallocated. Fix the VMs configurations.\n",
>> +          (unsigned long)kinfo->unassigned_mem >> 10);
>> +}
>> +
>> +/* Copy data to guest physical address, then clean the region. */
>> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>> +                                               paddr_t gpa,
>> +                                               void *buf,
>> +                                               unsigned int len);
> This shouldn't be needed because copy_to_guest_phys_cb is already
> declared in xen/include/xen/fdt-domain-build.h
>
>
>> +void __init dtb_load(struct kernel_info *kinfo,
>> +                     copy_to_guest_phys_cb copy_to_guest)
>> +{
>> +    unsigned long left;
>> +
>> +    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>> +           kinfo->d, kinfo->dtb_paddr,
>> +           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
>> +
>> +    left = copy_to_guest(kinfo->d, kinfo->dtb_paddr,
>> +                         kinfo->fdt,
>> +                         fdt_totalsize(kinfo->fdt));
>> +
>> +    if ( left != 0 )
>> +        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
>> +              kinfo->d, left);
>> +    xfree(kinfo->fdt);
>> +}
>> +
>> +void __init initrd_load(struct kernel_info *kinfo,
>> +                        copy_to_guest_phys_cb copy_to_guest)
>> +{
>> +    const struct bootmodule *mod = kinfo->initrd_bootmodule;
>> +    paddr_t load_addr = kinfo->initrd_paddr;
>> +    paddr_t paddr, len;
>> +    int node;
>> +    int res;
>> +    __be32 val[2];
>> +    __be32 *cellp;
>> +    void __iomem *initrd;
>> +
>> +    if ( !mod || !mod->size )
>> +        return;
>> +
>> +    paddr = mod->start;
>> +    len = mod->size;
>> +
>> +    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>> +           kinfo->d, paddr, load_addr, load_addr + len);
>> +
>> +    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
>> +    node = fdt_path_offset(kinfo->fdt, "/chosen");
>> +    if ( node < 0 )
>> +        panic("Cannot find the /chosen node\n");
>> +
>> +    cellp = (__be32 *)val;
>> +    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
>> +    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
>> +                              val, sizeof(val));
>> +    if ( res )
>> +        panic("Cannot fix up \"linux,initrd-start\" property\n");
>> +
>> +    cellp = (__be32 *)val;
>> +    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
>> +    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
>> +                              val, sizeof(val));
>> +    if ( res )
>> +        panic("Cannot fix up \"linux,initrd-end\" property\n");
>> +
>> +    initrd = ioremap_wc(paddr, len);
>> +    if ( !initrd )
>> +        panic("Unable to map the hwdom initrd\n");
> The original message was:
>
>    panic("Unable to map the %pd initrd\n", kinfo->d);
>
> why change it? It can be called for domUs.
>
>
>> +    res = copy_to_guest(kinfo->d, load_addr,
>> +                        initrd, len);
>> +    if ( res != 0 )
>> +        panic("Unable to copy the initrd in the hwdom memory\n");
> Same here, the original message was:
>
>    panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);

This is "new" (introduced 1 month ago), so I just overlooked them when doing rebasing. I'll update
the messages.

Thanks for review.

~ Oleksii

>
>
>> +    iounmap(initrd);
>> +}
>> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
>> index b79e9fabfe..4a0052b2e8 100644
>> --- a/xen/include/xen/fdt-domain-build.h
>> +++ b/xen/include/xen/fdt-domain-build.h
>> @@ -6,6 +6,7 @@
>>   #include <xen/bootfdt.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/fdt-kernel.h>
>> +#include <xen/mm.h>
>>   #include <xen/types.h>
>>   
>>   struct domain;
>> @@ -29,7 +30,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>>                        int sizecells, const struct membanks *mem);
>>   int make_timer_node(const struct kernel_info *kinfo);
>>   
>> -unsigned int get_allocation_size(paddr_t size);
>> +
>> +static inline int get_allocation_size(paddr_t size)
>> +{
>> +    /*
>> +     * get_order_from_bytes returns the order greater than or equal to
>> +     * the given size, but we need less than or equal. Adding one to
>> +     * the size pushes an evenly aligned size into the next order, so
>> +     * we can then unconditionally subtract 1 from the order which is
>> +     * returned.
>> +     */
>> +    return get_order_from_bytes(size + 1) - 1;
>> +}
>> +
>> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>> +                                               paddr_t gpa,
>> +                                               void *buf,
>> +                                               unsigned int len);
>> +
>> +void initrd_load(struct kernel_info *kinfo,
>> +                 copy_to_guest_phys_cb copy_to_guest);
>> +
>> +void dtb_load(struct kernel_info *kinfo,
>> +              copy_to_guest_phys_cb copy_to_guest);
>> +
>> +int find_unallocated_memory(const struct kernel_info *kinfo,
>> +                            const struct membanks *mem_banks[],
>> +                            unsigned int nr_mem_banks,
>> +                            struct membanks *free_regions,
>> +                            int (*cb)(unsigned long s_gfn,
>> +                                      unsigned long e_gfn,
>> +                                      void *data));
>>   
>>   #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>>   
>> -- 
>> 2.49.0
>>
--------------c3Tx0EG8Ky8f2ynJQQQ1P3ru
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/2/25 10:02 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Some functions of Arm's domain_build.c could be reused by dom0less or other
features connected to domain construction/build.

The following functions are moved to common:
- get_allocation_size().
- allocate_domheap_memory().
- guest_map_pages().
- allocate_bank_memory().
- add_hwdom_free_regions().
- find_unallocated_memory().
- allocate_memory().
- dtb_load().
- initrd_load().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The declaration of allocate_domheap_memory, allocate_bank_memory,
allocate_memory were moved in patch #5. Maybe their movement should be
in this patch?</pre>
    </blockquote>
    <pre>Sure, it makes sense.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Prototype of dtb_load() and initrd_load() is updated to recieve a pointer
to copy_to_guest_phys() as some archs require
copy_to_guest_phys_fluch_dcache().

Update arm/include/asm/Makefile to generate  domain-build.h for Arm as it is
used by domain-build.c.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Change in v3:
 - Nothing changed. Only rebase.
---
Change in v2:
 - Use xen/fdt-domain-build.h instead of asm/domain_build.h.
---
 xen/arch/arm/domain_build.c           | 397 +------------------------
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/domain-build.c | 404 ++++++++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h    |  33 ++-
 4 files changed, 439 insertions(+), 396 deletions(-)
 create mode 100644 xen/common/device-tree/domain-build.c

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9d649b06b3..df29619c40 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -120,18 +120,6 @@ struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
     return vcpu_create(dom0, 0);
 }
 
-unsigned int __init get_allocation_size(paddr_t size)
-{
-    /*
-     * get_order_from_bytes returns the order greater than or equal to
-     * the given size, but we need less than or equal. Adding one to
-     * the size pushes an evenly aligned size into the next order, so
-     * we can then unconditionally subtract 1 from the order which is
-     * returned.
-     */
-    return get_order_from_bytes(size + 1) - 1;
-}
-
 /*
  * Insert the given pages into a memory bank, banks are ordered by address.
  *
@@ -418,98 +406,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                                    alloc_domheap_mem_cb cb, void *extra)
-{
-    unsigned int max_order = UINT_MAX;
-
-    while ( tot_size &gt; 0 )
-    {
-        unsigned int order = get_allocation_size(tot_size);
-        struct page_info *pg;
-
-        order = min(max_order, order);
-
-        pg = alloc_domheap_pages(d, order, 0);
-        if ( !pg )
-        {
-            /*
-             * If we can't allocate one page, then it is unlikely to
-             * succeed in the next iteration. So bail out.
-             */
-            if ( !order )
-                return false;
-
-            /*
-             * If we can't allocate memory with order, then it is
-             * unlikely to succeed in the next iteration.
-             * Record the order - 1 to avoid re-trying.
-             */
-            max_order = order - 1;
-            continue;
-        }
-
-        if ( !cb(d, pg, order, extra) )
-            return false;
-
-        tot_size -= (1ULL &lt;&lt; (PAGE_SHIFT + order));
-    }
-
-    return true;
-}
-
-static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
-                                   unsigned int order, void *extra)
-{
-    gfn_t *sgfn = (gfn_t *)extra;
-    int res;
-
-    BUG_ON(!sgfn);
-    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
-    if ( res )
-    {
-        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
-        return false;
-    }
-
-    *sgfn = gfn_add(*sgfn, 1UL &lt;&lt; order);
-
-    return true;
-}
-
-bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                                 paddr_t tot_size)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct domain *d = kinfo-&gt;d;
-    struct membank *bank;
-
-    /*
-     * allocate_bank_memory can be called with a tot_size of zero for
-     * the second memory bank. It is not an error and we can safely
-     * avoid creating a zero-size memory bank.
-     */
-    if ( tot_size == 0 )
-        return true;
-
-    bank = &amp;mem-&gt;bank[mem-&gt;nr_banks];
-    bank-&gt;start = gfn_to_gaddr(sgfn);
-    bank-&gt;size = tot_size;
-
-    /*
-     * Allocate pages from the heap until tot_size is zero and map them to the
-     * guest using guest_map_pages, passing the starting gfn as extra parameter
-     * for the map operation.
-     */
-    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &amp;sgfn) )
-        return false;
-
-    mem-&gt;nr_banks++;
-    kinfo-&gt;unassigned_mem -= bank-&gt;size;
-
-    return true;
-}
-
 /*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
@@ -900,226 +796,6 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     return 0;
 }
 
-static int __init add_hwdom_free_regions(unsigned long s_gfn,
-                                         unsigned long e_gfn, void *data)
-{
-    struct membanks *free_regions = data;
-    paddr_t start, size;
-    paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
-    unsigned int i, j;
-
-    if ( free_regions-&gt;nr_banks &gt;= free_regions-&gt;max_banks )
-        return 0;
-
-    /*
-     * Both start and size of the free region should be 2MB aligned to
-     * potentially allow superpage mapping.
-     */
-    start = (s + SZ_2M - 1) &amp; ~(SZ_2M - 1);
-    if ( start &gt; e )
-        return 0;
-
-    /*
-     * e is actually "end-1" because it is called by rangeset functions
-     * which are inclusive of the last address.
-     */
-    e += 1;
-    size = (e - start) &amp; ~(SZ_2M - 1);
-
-    /* Find the insert position (descending order). */
-    for ( i = 0; i &lt; free_regions-&gt;nr_banks ; i++ )
-        if ( size &gt; free_regions-&gt;bank[i].size )
-            break;
-
-    /* Move the other banks to make space. */
-    for ( j = free_regions-&gt;nr_banks; j &gt; i ; j-- )
-    {
-        free_regions-&gt;bank[j].start = free_regions-&gt;bank[j - 1].start;
-        free_regions-&gt;bank[j].size = free_regions-&gt;bank[j - 1].size;
-    }
-
-    free_regions-&gt;bank[i].start = start;
-    free_regions-&gt;bank[i].size = size;
-    free_regions-&gt;nr_banks++;
-
-    return 0;
-}
-
-/*
- * Find unused regions of Host address space which can be exposed to domain
- * using the host memory layout. In order to calculate regions we exclude every
- * region passed in mem_banks from the Host RAM.
- */
-static int __init find_unallocated_memory(const struct kernel_info *kinfo,
-                                          const struct membanks *mem_banks[],
-                                          unsigned int nr_mem_banks,
-                                          struct membanks *free_regions,
-                                          int (*cb)(unsigned long s_gfn,
-                                                    unsigned long e_gfn,
-                                                    void *data))
-{
-    const struct membanks *mem = bootinfo_get_mem();
-    struct rangeset *unalloc_mem;
-    paddr_t start, end;
-    unsigned int i, j;
-    int res;
-
-    ASSERT(domain_use_host_layout(kinfo-&gt;d));
-
-    unalloc_mem = rangeset_new(NULL, NULL, 0);
-    if ( !unalloc_mem )
-        return -ENOMEM;
-
-    /* Start with all available RAM */
-    for ( i = 0; i &lt; mem-&gt;nr_banks; i++ )
-    {
-        start = mem-&gt;bank[i].start;
-        end = mem-&gt;bank[i].start + mem-&gt;bank[i].size;
-        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
-                                 PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"-&gt;%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
-        }
-    }
-
-    /* Remove all regions listed in mem_banks */
-    for ( i = 0; i &lt; nr_mem_banks; i++ )
-        for ( j = 0; j &lt; mem_banks[i]-&gt;nr_banks; j++ )
-        {
-            start = mem_banks[i]-&gt;bank[j].start;
-
-            /* Shared memory banks can contain INVALID_PADDR as start */
-            if ( INVALID_PADDR == start )
-                continue;
-
-            end = mem_banks[i]-&gt;bank[j].start + mem_banks[i]-&gt;bank[j].size;
-            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
-                                        PFN_DOWN(end - 1));
-            if ( res )
-            {
-                printk(XENLOG_ERR
-                       "Failed to add: %#"PRIpaddr"-&gt;%#"PRIpaddr", error %d\n",
-                       start, end, res);
-                goto out;
-            }
-        }
-
-    start = 0;
-    end = (1ULL &lt;&lt; p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
-                                 cb, free_regions);
-    if ( res )
-        free_regions-&gt;nr_banks = 0;
-    else if ( !free_regions-&gt;nr_banks )
-        res = -ENOENT;
-
-out:
-    rangeset_destroy(unalloc_mem);
-
-    return res;
-}
-
-void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    unsigned int i, nr_banks = GUEST_RAM_BANKS;
-    struct membanks *hwdom_free_mem = NULL;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo-&gt;unassigned_mem &gt;&gt; 20), d);
-
-    mem-&gt;nr_banks = 0;
-    /*
-     * Use host memory layout for hwdom. Only case for this is when LLC coloring
-     * is enabled.
-     */
-    if ( is_hardware_domain(d) )
-    {
-        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
-        /*
-         * Exclude the following regions:
-         * 1) Remove reserved memory
-         * 2) Grant table assigned to hwdom
-         */
-        const struct membanks *mem_banks[] = {
-            bootinfo_get_reserved_mem(),
-            gnttab,
-        };
-
-        if ( !gnttab )
-            goto fail;
-
-        gnttab-&gt;nr_banks = 1;
-        gnttab-&gt;bank[0].start = kinfo-&gt;gnttab_start;
-        gnttab-&gt;bank[0].size = kinfo-&gt;gnttab_size;
-
-        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
-        if ( !hwdom_free_mem )
-            goto fail;
-
-        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
-                                     hwdom_free_mem, add_hwdom_free_regions) )
-            goto fail;
-
-        nr_banks = hwdom_free_mem-&gt;nr_banks;
-        xfree(gnttab);
-    }
-
-    for ( i = 0; kinfo-&gt;unassigned_mem &gt; 0 &amp;&amp; nr_banks &gt; 0; i++, nr_banks-- )
-    {
-        paddr_t bank_start, bank_size;
-
-        if ( is_hardware_domain(d) )
-        {
-            bank_start = hwdom_free_mem-&gt;bank[i].start;
-            bank_size = hwdom_free_mem-&gt;bank[i].size;
-        }
-        else
-        {
-            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
-            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
-
-            if ( i &gt;= GUEST_RAM_BANKS )
-                goto fail;
-
-            bank_start = bankbase[i];
-            bank_size = banksize[i];
-        }
-
-        bank_size = MIN(bank_size, kinfo-&gt;unassigned_mem);
-        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
-            goto fail;
-    }
-
-    if ( kinfo-&gt;unassigned_mem )
-        goto fail;
-
-    for( i = 0; i &lt; mem-&gt;nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               mem-&gt;bank[i].start,
-               mem-&gt;bank[i].start + mem-&gt;bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem-&gt;bank[i].size &gt;&gt; 20));
-    }
-
-    xfree(hwdom_free_mem);
-    return;
-
-  fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo-&gt;unassigned_mem &gt;&gt; 10);
-}
-
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data)
 {
@@ -2059,75 +1735,6 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static void __init dtb_load(struct kernel_info *kinfo)
-{
-    unsigned long left;
-
-    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo-&gt;d, kinfo-&gt;dtb_paddr,
-           kinfo-&gt;dtb_paddr + fdt_totalsize(kinfo-&gt;fdt));
-
-    left = copy_to_guest_phys_flush_dcache(kinfo-&gt;d, kinfo-&gt;dtb_paddr,
-                                           kinfo-&gt;fdt,
-                                           fdt_totalsize(kinfo-&gt;fdt));
-
-    if ( left != 0 )
-        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo-&gt;d, left);
-    xfree(kinfo-&gt;fdt);
-}
-
-static void __init initrd_load(struct kernel_info *kinfo)
-{
-    const struct bootmodule *mod = kinfo-&gt;initrd_bootmodule;
-    paddr_t load_addr = kinfo-&gt;initrd_paddr;
-    paddr_t paddr, len;
-    int node;
-    int res;
-    __be32 val[2];
-    __be32 *cellp;
-    void __iomem *initrd;
-
-    if ( !mod || !mod-&gt;size )
-        return;
-
-    paddr = mod-&gt;start;
-    len = mod-&gt;size;
-
-    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo-&gt;d, paddr, load_addr, load_addr + len);
-
-    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
-    node = fdt_path_offset(kinfo-&gt;fdt, "/chosen");
-    if ( node &lt; 0 )
-        panic("Cannot find the /chosen node\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&amp;cellp, ARRAY_SIZE(val), load_addr);
-    res = fdt_setprop_inplace(kinfo-&gt;fdt, node, "linux,initrd-start",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-start\" property\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&amp;cellp, ARRAY_SIZE(val), load_addr + len);
-    res = fdt_setprop_inplace(kinfo-&gt;fdt, node, "linux,initrd-end",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-end\" property\n");
-
-    initrd = ioremap_wc(paddr, len);
-    if ( !initrd )
-        panic("Unable to map the %pd initrd\n", kinfo-&gt;d);
-
-    res = copy_to_guest_phys_flush_dcache(kinfo-&gt;d, load_addr,
-                                          initrd, len);
-    if ( res != 0 )
-        panic("Unable to copy the initrd in the %pd memory\n", kinfo-&gt;d);
-
-    iounmap(initrd);
-}
-
 /*
  * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
  * The allocated IRQ will be found in d-&gt;arch.evtchn_irq.
@@ -2220,8 +1827,8 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
      */
     kernel_load(kinfo);
     /* initrd_load will fix up the fdt, so call it before dtb_load */
-    initrd_load(kinfo);
-    dtb_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys_flush_dcache);
+    dtb_load(kinfo, copy_to_guest_phys_flush_dcache);
 
     memset(regs, 0, sizeof(*regs));
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index e88a4d5799..831b91399b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
+obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
new file mode 100644
index 0000000000..69257a15ba
--- /dev/null
+++ b/xen/common/device-tree/domain-build.c
@@ -0,0 +1,404 @@
+#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/libfdt/libfdt.h&gt;
+#include &lt;xen/mm.h&gt;
+#include &lt;xen/sched.h&gt;
+#include &lt;xen/sizes.h&gt;
+#include &lt;xen/types.h&gt;
+#include &lt;xen/vmap.h&gt;
+
+#include &lt;asm/p2m.h&gt;
+
+bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                                    alloc_domheap_mem_cb cb, void *extra)
+{
+    unsigned int max_order = UINT_MAX;
+
+    while ( tot_size &gt; 0 )
+    {
+        unsigned int order = get_allocation_size(tot_size);
+        struct page_info *pg;
+
+        order = min(max_order, order);
+
+        pg = alloc_domheap_pages(d, order, 0);
+        if ( !pg )
+        {
+            /*
+             * If we can't allocate one page, then it is unlikely to
+             * succeed in the next iteration. So bail out.
+             */
+            if ( !order )
+                return false;
+
+            /*
+             * If we can't allocate memory with order, then it is
+             * unlikely to succeed in the next iteration.
+             * Record the order - 1 to avoid re-trying.
+             */
+            max_order = order - 1;
+            continue;
+        }
+
+        if ( !cb(d, pg, order, extra) )
+            return false;
+
+        tot_size -= (1ULL &lt;&lt; (PAGE_SHIFT + order));
+    }
+
+    return true;
+}
+
+static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
+                                   unsigned int order, void *extra)
+{
+    gfn_t *sgfn = (gfn_t *)extra;
+    int res;
+
+    BUG_ON(!sgfn);
+    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        return false;
+    }
+
+    *sgfn = gfn_add(*sgfn, 1UL &lt;&lt; order);
+
+    return true;
+}
+
+bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                                 paddr_t tot_size)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    struct domain *d = kinfo-&gt;d;
+    struct membank *bank;
+
+    /*
+     * allocate_bank_memory can be called with a tot_size of zero for
+     * the second memory bank. It is not an error and we can safely
+     * avoid creating a zero-size memory bank.
+     */
+    if ( tot_size == 0 )
+        return true;
+
+    bank = &amp;mem-&gt;bank[mem-&gt;nr_banks];
+    bank-&gt;start = gfn_to_gaddr(sgfn);
+    bank-&gt;size = tot_size;
+
+    /*
+     * Allocate pages from the heap until tot_size is zero and map them to the
+     * guest using guest_map_pages, passing the starting gfn as extra parameter
+     * for the map operation.
+     */
+    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &amp;sgfn) )
+        return false;
+
+    mem-&gt;nr_banks++;
+    kinfo-&gt;unassigned_mem -= bank-&gt;size;
+
+    return true;
+}
+
+static int __init add_hwdom_free_regions(unsigned long s_gfn,
+                                         unsigned long e_gfn, void *data)
+{
+    struct membanks *free_regions = data;
+    paddr_t start, size;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn);
+    unsigned int i, j;
+
+    if ( free_regions-&gt;nr_banks &gt;= free_regions-&gt;max_banks )
+        return 0;
+
+    /*
+     * Both start and size of the free region should be 2MB aligned to
+     * potentially allow superpage mapping.
+     */
+    start = (s + SZ_2M - 1) &amp; ~(SZ_2M - 1);
+    if ( start &gt; e )
+        return 0;
+
+    /*
+     * e is actually "end-1" because it is called by rangeset functions
+     * which are inclusive of the last address.
+     */
+    e += 1;
+    size = (e - start) &amp; ~(SZ_2M - 1);
+
+    /* Find the insert position (descending order). */
+    for ( i = 0; i &lt; free_regions-&gt;nr_banks ; i++ )
+        if ( size &gt; free_regions-&gt;bank[i].size )
+            break;
+
+    /* Move the other banks to make space. */
+    for ( j = free_regions-&gt;nr_banks; j &gt; i ; j-- )
+    {
+        free_regions-&gt;bank[j].start = free_regions-&gt;bank[j - 1].start;
+        free_regions-&gt;bank[j].size = free_regions-&gt;bank[j - 1].size;
+    }
+
+    free_regions-&gt;bank[i].start = start;
+    free_regions-&gt;bank[i].size = size;
+    free_regions-&gt;nr_banks++;
+
+    return 0;
+}
+
+/*
+ * Find unused regions of Host address space which can be exposed to domain
+ * using the host memory layout. In order to calculate regions we exclude every
+ * region passed in mem_banks from the Host RAM.
+ */
+int __init find_unallocated_memory(const struct kernel_info *kinfo,
+                                   const struct membanks *mem_banks[],
+                                   unsigned int nr_mem_banks,
+                                   struct membanks *free_regions,
+                                   int (*cb)(unsigned long s_gfn,
+                                             unsigned long e_gfn,
+                                             void *data))
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    struct rangeset *unalloc_mem;
+    paddr_t start, end;
+    unsigned int i, j;
+    int res;
+
+    ASSERT(domain_use_host_layout(kinfo-&gt;d));
+
+    unalloc_mem = rangeset_new(NULL, NULL, 0);
+    if ( !unalloc_mem )
+        return -ENOMEM;
+
+    /* Start with all available RAM */
+    for ( i = 0; i &lt; mem-&gt;nr_banks; i++ )
+    {
+        start = mem-&gt;bank[i].start;
+        end = mem-&gt;bank[i].start + mem-&gt;bank[i].size;
+        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
+                                 PFN_DOWN(end - 1));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"-&gt;%#"PRIpaddr"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove all regions listed in mem_banks */
+    for ( i = 0; i &lt; nr_mem_banks; i++ )
+        for ( j = 0; j &lt; mem_banks[i]-&gt;nr_banks; j++ )
+        {
+            start = mem_banks[i]-&gt;bank[j].start;
+
+            /* Shared memory banks can contain INVALID_PADDR as start */
+            if ( INVALID_PADDR == start )
+                continue;
+
+            end = mem_banks[i]-&gt;bank[j].start + mem_banks[i]-&gt;bank[j].size;
+            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                        PFN_DOWN(end - 1));
+            if ( res )
+            {
+                printk(XENLOG_ERR
+                       "Failed to add: %#"PRIpaddr"-&gt;%#"PRIpaddr", error %d\n",
+                       start, end, res);
+                goto out;
+            }
+        }
+
+    start = 0;
+    end = (1ULL &lt;&lt; p2m_ipa_bits) - 1;
+    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
+                                 cb, free_regions);
+    if ( res )
+        free_regions-&gt;nr_banks = 0;
+    else if ( !free_regions-&gt;nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(unalloc_mem);
+
+    return res;
+}
+
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = GUEST_RAM_BANKS;
+    struct membanks *hwdom_free_mem = NULL;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo-&gt;unassigned_mem &gt;&gt; 20), d);
+
+    mem-&gt;nr_banks = 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
shouldn't we set gnttab-&gt;max_banks and gnttab-&gt;type here?</pre>
    </blockquote>
    <pre>Here and ...

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /*
+         * Exclude the following regions:
+         * 1) Remove reserved memory
+         * 2) Grant table assigned to hwdom
+         */
+        const struct membanks *mem_banks[] = {
+            bootinfo_get_reserved_mem(),
+            gnttab,
+        };
+
+        if ( !gnttab )
+            goto fail;
+
+        gnttab-&gt;nr_banks = 1;
+        gnttab-&gt;bank[0].start = kinfo-&gt;gnttab_start;
+        gnttab-&gt;bank[0].size = kinfo-&gt;gnttab_size;
+
+        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
+                                             NR_MEM_BANKS);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        hwdom_free_mem-&gt;max_banks = NR_MEM_BANKS;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
here we are missing setting hwdom_free_mem-&gt;type ?</pre>
    </blockquote>
    <pre>... here, membanks_xzalloc() should be really used.
for the first one case - membanks_xzalloc(1, MEMORY) and
for the second - membanks_xzalloc(NR_MEM_BANKS, MEMORY).
Good catch.
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
+                                     hwdom_free_mem, add_hwdom_free_regions) )
+            goto fail;
+
+        nr_banks = hwdom_free_mem-&gt;nr_banks;
+        xfree(gnttab);
+    }
+
+    for ( i = 0; kinfo-&gt;unassigned_mem &gt; 0 &amp;&amp; nr_banks &gt; 0; i++, nr_banks-- )
+    {
+        paddr_t bank_start, bank_size;
+
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_free_mem-&gt;bank[i].start;
+            bank_size = hwdom_free_mem-&gt;bank[i].size;
+        }
+        else
+        {
+            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
+            if ( i &gt;= GUEST_RAM_BANKS )
+                goto fail;
+
+            bank_start = bankbase[i];
+            bank_size = banksize[i];
+        }
+
+        bank_size = MIN(bank_size, kinfo-&gt;unassigned_mem);
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
+            goto fail;
+    }
+
+    if ( kinfo-&gt;unassigned_mem )
+        goto fail;
+
+    for( i = 0; i &lt; mem-&gt;nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               mem-&gt;bank[i].start,
+               mem-&gt;bank[i].start + mem-&gt;bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(mem-&gt;bank[i].size &gt;&gt; 20));
+    }
+
+    xfree(hwdom_free_mem);
+    return;
+
+  fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo-&gt;unassigned_mem &gt;&gt; 10);
+}
+
+/* Copy data to guest physical address, then clean the region. */
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
+                                               unsigned int len);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This shouldn't be needed because copy_to_guest_phys_cb is already
declared in xen/include/xen/fdt-domain-build.h


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void __init dtb_load(struct kernel_info *kinfo,
+                     copy_to_guest_phys_cb copy_to_guest)
+{
+    unsigned long left;
+
+    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo-&gt;d, kinfo-&gt;dtb_paddr,
+           kinfo-&gt;dtb_paddr + fdt_totalsize(kinfo-&gt;fdt));
+
+    left = copy_to_guest(kinfo-&gt;d, kinfo-&gt;dtb_paddr,
+                         kinfo-&gt;fdt,
+                         fdt_totalsize(kinfo-&gt;fdt));
+
+    if ( left != 0 )
+        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
+              kinfo-&gt;d, left);
+    xfree(kinfo-&gt;fdt);
+}
+
+void __init initrd_load(struct kernel_info *kinfo,
+                        copy_to_guest_phys_cb copy_to_guest)
+{
+    const struct bootmodule *mod = kinfo-&gt;initrd_bootmodule;
+    paddr_t load_addr = kinfo-&gt;initrd_paddr;
+    paddr_t paddr, len;
+    int node;
+    int res;
+    __be32 val[2];
+    __be32 *cellp;
+    void __iomem *initrd;
+
+    if ( !mod || !mod-&gt;size )
+        return;
+
+    paddr = mod-&gt;start;
+    len = mod-&gt;size;
+
+    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo-&gt;d, paddr, load_addr, load_addr + len);
+
+    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
+    node = fdt_path_offset(kinfo-&gt;fdt, "/chosen");
+    if ( node &lt; 0 )
+        panic("Cannot find the /chosen node\n");
+
+    cellp = (__be32 *)val;
+    dt_set_cell(&amp;cellp, ARRAY_SIZE(val), load_addr);
+    res = fdt_setprop_inplace(kinfo-&gt;fdt, node, "linux,initrd-start",
+                              val, sizeof(val));
+    if ( res )
+        panic("Cannot fix up \"linux,initrd-start\" property\n");
+
+    cellp = (__be32 *)val;
+    dt_set_cell(&amp;cellp, ARRAY_SIZE(val), load_addr + len);
+    res = fdt_setprop_inplace(kinfo-&gt;fdt, node, "linux,initrd-end",
+                              val, sizeof(val));
+    if ( res )
+        panic("Cannot fix up \"linux,initrd-end\" property\n");
+
+    initrd = ioremap_wc(paddr, len);
+    if ( !initrd )
+        panic("Unable to map the hwdom initrd\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The original message was:

  panic("Unable to map the %pd initrd\n", kinfo-&gt;d);

why change it? It can be called for domUs.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    res = copy_to_guest(kinfo-&gt;d, load_addr,
+                        initrd, len);
+    if ( res != 0 )
+        panic("Unable to copy the initrd in the hwdom memory\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here, the original message was:

  panic("Unable to copy the initrd in the %pd memory\n", kinfo-&gt;d);</pre>
    </blockquote>
    <pre>This is "new" (introduced 1 month ago), so I just overlooked them when doing rebasing. I'll update
the messages.

Thanks for review.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021248360.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    iounmap(initrd);
+}
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index b79e9fabfe..4a0052b2e8 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -6,6 +6,7 @@
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/types.h&gt;
 
 struct domain;
@@ -29,7 +30,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
-unsigned int get_allocation_size(paddr_t size);
+
+static inline int get_allocation_size(paddr_t size)
+{
+    /*
+     * get_order_from_bytes returns the order greater than or equal to
+     * the given size, but we need less than or equal. Adding one to
+     * the size pushes an evenly aligned size into the next order, so
+     * we can then unconditionally subtract 1 from the order which is
+     * returned.
+     */
+    return get_order_from_bytes(size + 1) - 1;
+}
+
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
+                                               unsigned int len);
+
+void initrd_load(struct kernel_info *kinfo,
+                 copy_to_guest_phys_cb copy_to_guest);
+
+void dtb_load(struct kernel_info *kinfo,
+              copy_to_guest_phys_cb copy_to_guest);
+
+int find_unallocated_memory(const struct kernel_info *kinfo,
+                            const struct membanks *mem_banks[],
+                            unsigned int nr_mem_banks,
+                            struct membanks *free_regions,
+                            int (*cb)(unsigned long s_gfn,
+                                      unsigned long e_gfn,
+                                      void *data));
 
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------c3Tx0EG8Ky8f2ynJQQQ1P3ru--

