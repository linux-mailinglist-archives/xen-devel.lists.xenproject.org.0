Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00541FBD3
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 14:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201069.355485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWeJm-0005TI-Cu; Sat, 02 Oct 2021 12:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201069.355485; Sat, 02 Oct 2021 12:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWeJm-0005Ql-94; Sat, 02 Oct 2021 12:40:42 +0000
Received: by outflank-mailman (input) for mailman id 201069;
 Sat, 02 Oct 2021 12:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+enT=OW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mWeJk-0005Qf-8A
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 12:40:40 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a7f1b47-d2c4-4bc1-8d4b-bc9bcf4fa323;
 Sat, 02 Oct 2021 12:40:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x27so49359927lfa.9
 for <xen-devel@lists.xenproject.org>; Sat, 02 Oct 2021 05:40:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d13sm1034116lfe.21.2021.10.02.05.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 05:40:34 -0700 (PDT)
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
X-Inumbo-ID: 6a7f1b47-d2c4-4bc1-8d4b-bc9bcf4fa323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6hF3HXnGdZcZAtzK7CE3tv51dDQlqDJAhzskya9FjfE=;
        b=R99152PKZCD+yTmYAJ5yayJtQmlLD+nDHEODsHhm1Fo36+MsPWcdrSu8PcUG1Mk42a
         XoOsZnxC7zVzvIo4VCvVzWMvNagnO/kBiRpB67IV3YFPTzBsPhYJ1ID6WQlucsyxkJKF
         pwrL5oNuW2kAmhLBdmEP+DklUbqUACnMaiIysKE12Y/vt1e0VE2mKQQXT04DqaCkdaWS
         vDPYFS3asdGQtMsRHcyLCA/i+LLF91WKVbBz462TDvnIRBq9iR6FLvJcZY3u+aTtifa/
         7ct1fEpUCRS4FfLWPR6/ZE1BhtDQCRFAOpDN9aUHCTG9gKmEEt36PNPze3PQautXuUfL
         rzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6hF3HXnGdZcZAtzK7CE3tv51dDQlqDJAhzskya9FjfE=;
        b=RJ0S5jBvtIouguRQ/hGmtmiIE7j+SAkbIdQiOvItByrETrmkDc49bHeJObRRg2Drvg
         6J/MNPdQgKVnP22MQhI6Xw3H4wtQt6VntUScMUUItrSkwry5i0iOIohfc7pDDLacmXYI
         aiS8YYi+4S27hjYwUYUugd7dU7ecYdwOKHStvHXVq33aqrdf4Ea+e83OMxNNirNfhB+1
         LeKMp37QVZY2Fr+GNUWBC7uMHTqJAJuFe5SdBD3S1JznyzVSpNq+qrfqNmZwBMglLQ4y
         qxhaVv5sAW3Rb7sl9KHXXh71RLxBlDLtKh0uaD/iVA1Xzi5jBb3pQxqLMHqYPcPWZhmL
         0lWQ==
X-Gm-Message-State: AOAM533cJarZuWamOyT2Db7kjzH5HbSkRAMY5nRJoNtFhjqrV8VPOun2
	8E7aRTV7jgacC2K3m5XFP9A=
X-Google-Smtp-Source: ABdhPJyXeN1WtreSjmjL3lk34csk5AT9YPx2Pt1fpOQCjisiUJuLwxLSY/awy0VwlwAX88mr7sMkGA==
X-Received: by 2002:ac2:5cd7:: with SMTP id f23mr3778929lfq.652.1633178435092;
        Sat, 02 Oct 2021 05:40:35 -0700 (PDT)
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110011704350.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7e0a9915-ed26-afde-19d7-9c76bb476a24@gmail.com>
Date: Sat, 2 Oct 2021 15:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110011704350.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 02.10.21 03:33, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen at the domain creation time and
>> advertised to it via "reg" property under hypervisor node in
>> the guest device-tree. As region 0 is reserved for grant table
>> space (always present), the indexes for extended regions are 1...N.
>> If extended regions could not be allocated for some reason,
>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>
>> Please note the following limitations:
>> - The extended region feature is only supported for 64-bit domain
>>    currently.
>> - The ACPI case is not covered.
>>
>> ***
>>
>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
>> the algorithm to choose extended regions for it is different
>> in comparison with the algorithm for non-direct mapped DomU.
>> What is more, that extended regions should be chosen differently
>> whether IOMMU is enabled or not.
>>
>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
>> holes found in host device-tree if otherwise. Make sure that
>> extended regions are 2MB-aligned and located within maximum possible
>> addressable physical memory range. The minimum size of extended
>> region is 64MB. The maximum number of extended regions is 128,
>> which is an artificial limit to minimize code changes (we reuse
>> struct meminfo to describe extended regions, so there are an array
>> field for 128 elements).
>>
>> It worth mentioning that unallocated memory solution (when the IOMMU
>> is disabled) will work safely until Dom0 is able to allocate memory
>> outside of the original range.
>>
>> Also introduce command line option to be able to globally enable or
>> disable support for extended regions for Dom0 (enabled by default).
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> I thought about it and I decided to commit this patch because it doesn't
> actually need anything from the other two patches, and it is very useful
> on its own (both of them are for domU, while this one is for dom0).

Thank you.


>
> In regards to Julien's suggestion: as explained in earlier emails I
> prefer this version but I don't have a strong opinion. If Julien still
> prefers the other approach we can still change it in time for 4.16
> (Oleksandr has already implemented both and I am happy to review.)

Sure, we will able to do it if needed.


>
>
>> ---
>> Please note, we need to decide which approach to use in find_unallocated_memory(),
>> you can find details at:
>> https://lore.kernel.org/xen-devel/28503e09-44c3-f623-bb8d-8778bb94225f@gmail.com/
>>
>> Changes RFC -> V2:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>>
>> Changes V2 -> V3:
>>     - update patch description
>>     - add comment for "size" calculation in add_ext_regions()
>>     - clarify "end" calculation in find_unallocated_memory() and
>>       find_memory_holes()
>>     - only pick up regions with size >= 64MB
>>     - allocate reg dynamically instead of keeping on the stack in
>>       make_hypervisor_node()
>>     - do not show warning for 32-bit domain
>>     - drop Linux specific limits EXT_REGION_*
>>     - also cover "ranges" property in find_memory_holes()
>>     - add command line arg to enable/disable extended region support
>>
>> Changes V3 -> V4:
>>    - update opt_ext_regions purpose and comment in code
>>    - reorganize make_hypervisor_node() to move allocations after initial
>>      checks, allocate only required amount of elements instead of maximum
>>      possible
>> ---
>>   docs/misc/xen-command-line.pandoc |  11 ++
>>   xen/arch/arm/domain_build.c       | 286 +++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 294 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 177e656..5cae4ad 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1081,6 +1081,17 @@ hardware domain is architecture dependent.
>>   Note that specifying zero as domU value means zero, while for dom0 it means
>>   to use the default.
>>   
>> +### ext_regions (Arm)
>> +> `= <boolean>`
>> +
>> +> Default : `true`
>> +
>> +Flag to enable or disable support for extended regions for Dom0.
>> +
>> +Extended regions are ranges of unused address space exposed to Dom0 as
>> +"safe to use" for special memory mappings. Disable if your board device
>> +tree is incomplete.
>> +
>>   ### flask
>>   > `= permissive | enforcing | late | disabled`
>>   
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index d233d63..c5afbe2 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -34,6 +34,10 @@
>>   static unsigned int __initdata opt_dom0_max_vcpus;
>>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>>   
>> +/* If true, the extended regions support is enabled for dom0 */
>> +static bool __initdata opt_ext_regions = true;
>> +boolean_param("ext_regions", opt_ext_regions);
>> +
>>   static u64 __initdata dom0_mem;
>>   static bool __initdata dom0_mem_set;
>>   
>> @@ -886,6 +890,232 @@ static int __init make_memory_node(const struct domain *d,
>>       return res;
>>   }
>>   
>> +static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>> +{
>> +    struct meminfo *ext_regions = data;
>> +    paddr_t start, size;
>> +
>> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>> +        return 0;
>> +
>> +    /* Both start and size of the extended region should be 2MB aligned */
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
>> +    if ( size < MB(64) )
>> +        return 0;
>> +
>> +    ext_regions->bank[ext_regions->nr_banks].start = start;
>> +    ext_regions->bank[ext_regions->nr_banks].size = size;
>> +    ext_regions->nr_banks++;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>> +                                          struct meminfo *ext_regions)
>> +{
>> +    const struct meminfo *assign_mem = &kinfo->mem;
>> +    struct rangeset *unalloc_mem;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>> +
>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>> +
>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>> +    if ( !unalloc_mem )
>> +        return -ENOMEM;
>> +
>> +    /* Start with all available RAM */
>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.mem.bank[i].start;
>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
>> +        res = rangeset_add_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove RAM assigned to Dom0 */
>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>> +    {
>> +        start = assign_mem->bank[i].start;
>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
>> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove reserved-memory regions */
>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.reserved_mem.bank[i].start;
>> +        end = bootinfo.reserved_mem.bank[i].start +
>> +            bootinfo.reserved_mem.bank[i].size;
>> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove grant table region */
>> +    start = kinfo->gnttab_start;
>> +    end = kinfo->gnttab_start + kinfo->gnttab_size;
>> +    res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(unalloc_mem);
>> +
>> +    return res;
>> +}
>> +
>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>> +                                    struct meminfo *ext_regions)
>> +{
>> +    struct dt_device_node *np;
>> +    struct rangeset *mem_holes;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>> +
>> +    dt_dprintk("Find memory holes for extended regions\n");
>> +
>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>> +    if ( !mem_holes )
>> +        return -ENOMEM;
>> +
>> +    /* Start with maximum possible addressable physical memory range */
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_add_range(mem_holes, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * Remove regions described by "reg" and "ranges" properties where
>> +     * the memory is addressable (MMIO, RAM, PCI BAR, etc).
>> +     */
>> +    dt_for_each_device_node( dt_host, np )
>> +    {
>> +        unsigned int naddr;
>> +        u64 addr, size;
>> +
>> +        naddr = dt_number_of_address(np);
>> +
>> +        for ( i = 0; i < naddr; i++ )
>> +        {
>> +            res = dt_device_get_address(np, i, &addr, &size);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
>> +                       i, dt_node_full_name(np));
>> +                goto out;
>> +            }
>> +
>> +            start = addr & PAGE_MASK;
>> +            end = PAGE_ALIGN(addr + size);
>> +            res = rangeset_remove_range(mem_holes, start, end - 1);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                       start, end);
>> +                goto out;
>> +            }
>> +        }
>> +
>> +        if ( dt_device_type_is_equal(np, "pci" ) )
>> +        {
>> +            unsigned int range_size, nr_ranges;
>> +            int na, ns, pna;
>> +            const __be32 *ranges;
>> +            u32 len;
>> +
>> +            /*
>> +             * Looking for non-empty ranges property which in this context
>> +             * describes the PCI host bridge aperture.
>> +             */
>> +            ranges = dt_get_property(np, "ranges", &len);
>> +            if ( !ranges || !len )
>> +                continue;
>> +
>> +            pna = dt_n_addr_cells(np);
>> +            na = dt_child_n_addr_cells(np);
>> +            ns = dt_child_n_size_cells(np);
>> +            range_size = pna + na + ns;
>> +            nr_ranges = len / sizeof(__be32) / range_size;
>> +
>> +            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
>> +            {
>> +                /* Skip the child address and get the parent (CPU) address */
>> +                addr = dt_read_number(ranges + na, pna);
>> +                size = dt_read_number(ranges + na + pna, ns);
>> +
>> +                start = addr & PAGE_MASK;
>> +                end = PAGE_ALIGN(addr + size);
>> +                res = rangeset_remove_range(mem_holes, start, end - 1);
>> +                if ( res )
>> +                {
>> +                    printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                           start, end);
>> +                    goto out;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_report_ranges(mem_holes, start, end,
>> +                                 add_ext_regions,  ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(mem_holes);
>> +
>> +    return res;
>> +}
>> +
>>   static int __init make_hypervisor_node(struct domain *d,
>>                                          const struct kernel_info *kinfo,
>>                                          int addrcells, int sizecells)
>> @@ -893,11 +1123,12 @@ static int __init make_hypervisor_node(struct domain *d,
>>       const char compat[] =
>>           "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>>           "xen,xen";
>> -    __be32 reg[4];
>> +    __be32 *reg, *cells;
>>       gic_interrupt_t intr;
>> -    __be32 *cells;
>>       int res;
>>       void *fdt = kinfo->fdt;
>> +    struct meminfo *ext_regions = NULL;
>> +    unsigned int i, nr_ext_regions;
>>   
>>       dt_dprintk("Create hypervisor node\n");
>>   
>> @@ -919,12 +1150,61 @@ static int __init make_hypervisor_node(struct domain *d,
>>       if ( res )
>>           return res;
>>   
>> +    if ( !opt_ext_regions )
>> +    {
>> +        printk(XENLOG_DEBUG "The extended regions support is disabled\n");
>> +        nr_ext_regions = 0;
>> +    }
>> +    else if ( is_32bit_domain(d) )
>> +    {
>> +        printk(XENLOG_DEBUG "The extended regions are only supported for 64-bit guest currently\n");
>> +        nr_ext_regions = 0;
>> +    }
>> +    else
>> +    {
>> +        ext_regions = xzalloc(struct meminfo);
>> +        if ( !ext_regions )
>> +            return -ENOMEM;
>> +
>> +        if ( !is_iommu_enabled(d) )
>> +            res = find_unallocated_memory(kinfo, ext_regions);
>> +        else
>> +            res = find_memory_holes(kinfo, ext_regions);
>> +
>> +        if ( res )
>> +            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
>> +        nr_ext_regions = ext_regions->nr_banks;
>> +    }
>> +
>> +    reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + sizecells));
>> +    if ( !reg )
>> +    {
>> +        xfree(ext_regions);
>> +        return -ENOMEM;
>> +    }
>> +
>>       /* reg 0 is grant table space */
>>       cells = &reg[0];
>>       dt_child_set_range(&cells, addrcells, sizecells,
>>                          kinfo->gnttab_start, kinfo->gnttab_size);
>> +    /* reg 1...N are extended regions */
>> +    for ( i = 0; i < nr_ext_regions; i++ )
>> +    {
>> +        u64 start = ext_regions->bank[i].start;
>> +        u64 size = ext_regions->bank[i].size;
>> +
>> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> +                   i, start, start + size);
>> +
>> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
>> +    }
>> +
>>       res = fdt_property(fdt, "reg", reg,
>> -                       dt_cells_to_size(addrcells + sizecells));
>> +                       dt_cells_to_size(addrcells + sizecells) *
>> +                       (nr_ext_regions + 1));
>> +    xfree(ext_regions);
>> +    xfree(reg);
>> +
>>       if ( res )
>>           return res;
>>   
>> -- 
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


