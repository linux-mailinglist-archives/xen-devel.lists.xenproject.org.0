Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EC410016
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 21:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189680.339527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRJtO-0002la-Si; Fri, 17 Sep 2021 19:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189680.339527; Fri, 17 Sep 2021 19:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRJtO-0002jU-Pi; Fri, 17 Sep 2021 19:51:26 +0000
Received: by outflank-mailman (input) for mailman id 189680;
 Fri, 17 Sep 2021 19:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmcU=OH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mRJtN-0002jO-DD
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 19:51:25 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d116eca-84fe-481c-876e-fd5a4aeaa2bd;
 Fri, 17 Sep 2021 19:51:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so37406443lfu.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 12:51:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z5sm797124ljc.123.2021.09.17.12.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 12:51:21 -0700 (PDT)
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
X-Inumbo-ID: 2d116eca-84fe-481c-876e-fd5a4aeaa2bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WYr4zzNq1cI/srAikGZcpR00UKFOVEEZrIQbhI86kbo=;
        b=AI0Q45z32pmw6+nANgi0B+P18bxWzZragWOa8Ufoys/erHxMFnupZ/5lduGRaCIKgb
         hzS9tu6IMa9E/1P4kjYs4pZXD+X9omYu9Oq8XciV5wlarHwoPKUSh384PzxMGVMKeP9l
         WTdnikgnAi/R6ScmPlrEu700wzn2BI3H8ft2NT6NlM3zGMtuIqKALM4bVMZ0xdEl6AaA
         /MooHNpSXT9SHdxcOhvEqQmGrgk/jbeUdtL1lKNcQla90Qto5FUdDSd4ynnlZSlp4vQe
         gW7aji1svI93ltelv7svDEKjEHru6wGM/p0qdVr/yz4ymHtLs0Q/ur+oDRUGkwo7kss0
         Yj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WYr4zzNq1cI/srAikGZcpR00UKFOVEEZrIQbhI86kbo=;
        b=ExnzU00j+04mTZe0YldQC4vNMpukAuG5dk3bjyaktu4blm9k8k5QEj7lv5VlVEUr+A
         ArqcpjOI3bzMWGiruyQrtieM3HlumGN0k5ig51bsGTRK6qQI884SZBljtrVQBErNQGga
         /zZfyFJ7mjiBvPzkBt4KhYNZVlgU8NZcTECBVsVcJowfi4hXVdKP3CE32HUjbyZSwp13
         fNqaqT5RCrpgFSdSVxXWYwoqxGPKq7LSpX4vYXUimg/ZUf3YilJngkltQpVkovau62sH
         5iGDLuHwmbO+e6uDeORkRcRYYtlHHvWHquO4+1j4/LSnee8O8aVH7pLH0hVSd+bxaFMh
         qxHA==
X-Gm-Message-State: AOAM531GAR4U1PwBRw/gQXhXCE4U9NTJFJmExqCFxDeb14v52p699XNW
	tmMyFYm6xPB4OHXpM+7ybto=
X-Google-Smtp-Source: ABdhPJyitVwl2ACKH3Mpth0/Vzijvys8A5Obs/WtYg6EIQgFHgdV3haNS3KwWD/v5hI65KkoTfYaVg==
X-Received: by 2002:a19:f24d:: with SMTP id d13mr9308532lfk.3.1631908281566;
        Fri, 17 Sep 2021 12:51:21 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
Date: Fri, 17 Sep 2021 22:51:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 17.09.21 18:48, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 10/09/2021 23:18, Oleksandr Tyshchenko wrote:
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
>> - The extended region feature is only supported for 64-bit domain.
>> - The ACPI case is not covered.
>
> I understand the ACPI is not covered because we would need to create a 
> new binding. But I am not sure to understand why 32-bit domain is not 
> supported. Can you explain it?

The 32-bit domain is not supported for simplifying things from the 
beginning. It is a little bit difficult to get everything working at 
start. As I understand from discussion at [1] we can afford that 
simplification. However, I should have mentioned that 32-bit domain is 
not supported "for now".

>
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
>> holes found in host device-tree if otherwise. 
>
> For the case when the IOMMU is disabled, this will only work if dom0 
> cannot allocate memory outside of the original range. This is 
> currently the case... but I think this should be spelled out in at 
> least the commit message.

Agree, will update commit description.


>
>
>> Make sure that
>> extended regions are 2MB-aligned and located within maximum possible
>> addressable physical memory range. The maximum number of extended
>> regions is 128.
>
> Please explain how this limit was chosen.
Well, I decided to not introduce new data struct and etc to represent 
extended regions but reuse existing struct meminfo
used for memory/reserved-memory and, as I though, perfectly fitted. So, 
that limit come from NR_MEM_BANKS which is 128.


>
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes since RFC:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>> ---
>>
>>   xen/arch/arm/domain_build.c | 226 
>> +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 224 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 206038d..070ec27 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -724,6 +724,196 @@ static int __init make_memory_node(const struct 
>> domain *d,
>>       return res;
>>   }
>>   +static int __init add_ext_regions(unsigned long s, unsigned long 
>> e, void *data)
>> +{
>> +    struct meminfo *ext_regions = data;
>> +    paddr_t start, size;
>> +
>> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>> +        return 0;
>> +
>> +    /* Both start and size of the extended region should be 2MB 
>> aligned */
>> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>> +    if ( start > e )
>> +        return 0;
>> +
>> +    size = (e - start + 1) & ~(SZ_2M - 1);
>> +    if ( !size )
>> +        return 0;
>> +
>> +    ext_regions->bank[ext_regions->nr_banks].start = start;
>> +    ext_regions->bank[ext_regions->nr_banks].size = size;
>> +    ext_regions->nr_banks ++;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * The extended regions will be prevalidated by the memory hotplug path
>> + * in Linux which requires for any added address range to be within 
>> maximum
>> + * possible addressable physical memory range for which the linear 
>> mapping
>> + * could be created.
>> + * For 48-bit VA space size the maximum addressable range are:
>
> When I read "maximum", I understand an upper limit. But below, you are 
> providing a range. So should you drop "maximum"?

yes, it is a little bit confusing.


>
>
> Also, this is tailored to Linux using 48-bit VA. How about other limits?
These limits are calculated at [2]. Sorry, I didn't investigate yet what 
values would be for other CONFIG_ARM64_VA_BITS_XXX. Also looks like some 
configs depend on 16K/64K pages...
I will try to investigate and provide limits later on.


>
>
>> + * 0x40000000 - 0x80003fffffff
>> + */
>> +#define EXT_REGION_START   0x40000000ULL
>
> I am probably missing something here.... There are platform out there 
> with memory starting at 0 (IIRC ZynqMP is one example). So wouldn't 
> this potentially rule out the extended region on such platform?

 From my understanding the extended region cannot be in 0...0x40000000 
range. If these platforms have memory above first GB, I believe the 
extended region(s) can be allocated for them.


>
>
>> +#define EXT_REGION_END 0x80003fffffffULL
>> +
>> +static int __init find_unallocated_memory(const struct kernel_info 
>> *kinfo,
>> +                                          struct meminfo *ext_regions)
>> +{
>> +    const struct meminfo *assign_mem = &kinfo->mem;
>> +    struct rangeset *unalloc_mem;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>
> We technically already know which range of memory is unused. This is 
> pretty much any region in the freelist of the page allocator. So how 
> about walking the freelist instead?

ok, I will investigate the page allocator code (right now I have no 
understanding of how to do that). BTW, I have just grepped "freelist" 
through the code and all page context related appearances are in x86 
code only.

>
> The advantage is we don't need to worry about modifying the function 
> when adding new memory type.
>
> One disavantage is this will not cover *all* the unused memory as this 
> is doing. But I think this is an acceptable downside.
>
>> +
>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>> +
>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>> +    if ( !unalloc_mem )
>> +        return -ENOMEM;
>> +
>> +    /* Start with all available RAM */
>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.mem.bank[i].start;
>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size 
>> - 1;
>> +        res = rangeset_add_range(unalloc_mem, start, end);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to add: 
>> %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove RAM assigned to Dom0 */
>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>> +    {
>> +        start = assign_mem->bank[i].start;
>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove reserved-memory regions */
>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.reserved_mem.bank[i].start;
>> +        end = bootinfo.reserved_mem.bank[i].start +
>> +            bootinfo.reserved_mem.bank[i].size - 1;
>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove grant table region */
>> +    start = kinfo->gnttab_start;
>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(unalloc_mem);
>> +
>> +    return res;
>> +}
>> +
>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>> +                                    struct meminfo *ext_regions)
>> +{
>> +    struct dt_device_node *np;
>> +    struct rangeset *mem_holes;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>> +
>> +    dt_dprintk("Find memory holes for extended regions\n");
>> +
>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>> +    if ( !mem_holes )
>> +        return -ENOMEM;
>> +
>> +    /* Start with maximum possible addressable physical memory range */
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>> +    res = rangeset_add_range(mem_holes, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    /* Remove all regions described by "reg" property (MMIO, RAM, 
>> etc) */
>
> Well... The loop below is not going to handle all the regions 
> described in the property "reg". Instead, it will cover a subset of 
> "reg" where the memory is addressable.

As I understand, we are only interested in subset of "reg" where the 
memory is addressable.


>
>
> You will also need to cover "ranges" that will describe the BARs for 
> the PCI devices.
Good point. Could you please clarify how to recognize whether it is a 
PCI device as long as PCI support is not merged? Or just to find any 
device nodes with non-empty "ranges" property
and retrieve addresses?


>
>
>> +    dt_for_each_device_node( dt_host, np )
>> +    {
>> +        unsigned int naddr;
>> +        u64 addr, size;
>> +
>> +        naddr = dt_number_of_address(np);
>> +
>> +        for ( i = 0; i < naddr; i++ )
>> +        {
>> +            res = dt_device_get_address(np, i, &addr, &size);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Unable to retrieve address %u for 
>> %s\n",
>> +                       i, dt_node_full_name(np));
>> +                goto out;
>> +            }
>> +
>> +            start = addr & PAGE_MASK;
>> +            end = PAGE_ALIGN(addr + size) - 1;
>> +            res = rangeset_remove_range(mem_holes, start, end);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>> +                       start, end);
>> +                goto out;
>> +            }
>> +        }
>> +    }
>> +
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>> +    res = rangeset_report_ranges(mem_holes, start, end,
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(mem_holes);
>> +
>> +    return res;
>> +}
>> +
>>   static int __init make_hypervisor_node(struct domain *d,
>>                                          const struct kernel_info 
>> *kinfo,
>>                                          int addrcells, int sizecells)
>> @@ -731,11 +921,13 @@ static int __init make_hypervisor_node(struct 
>> domain *d,
>>       const char compat[] =
>> "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>>           "xen,xen";
>> -    __be32 reg[4];
>> +    __be32 reg[(NR_MEM_BANKS + 1) * 4];
>
> This is a fairly large allocation on the stack. Could we move to a 
> dynamic allocation?

Of course, will do.


>
>
>>       gic_interrupt_t intr;
>>       __be32 *cells;
>>       int res;
>>       void *fdt = kinfo->fdt;
>> +    struct meminfo *ext_regions;
>> +    unsigned int i;
>>         dt_dprintk("Create hypervisor node\n");
>>   @@ -757,12 +949,42 @@ static int __init make_hypervisor_node(struct 
>> domain *d,
>>       if ( res )
>>           return res;
>>   +    ext_regions = xzalloc(struct meminfo);
>> +    if ( !ext_regions )
>> +        return -ENOMEM;
>> +
>> +    if ( is_32bit_domain(d) )
>> +        printk(XENLOG_WARNING "The extended region is only supported 
>> for 64-bit guest\n");
>> +    else
>> +    {
>> +        if ( !is_iommu_enabled(d) )
>> +            res = find_unallocated_memory(kinfo, ext_regions);
>> +        else
>> +            res = find_memory_holes(kinfo, ext_regions);
>> +
>> +        if ( res )
>> +            printk(XENLOG_WARNING "Failed to allocate extended 
>> regions\n");
>> +    }
>> +
>>       /* reg 0 is grant table space */
>>       cells = &reg[0];
>>       dt_child_set_range(&cells, addrcells, sizecells,
>>                          kinfo->gnttab_start, kinfo->gnttab_size);
>> +    /* reg 1...N are extended regions */
>> +    for ( i = 0; i < ext_regions->nr_banks; i++ )
>> +    {
>> +        u64 start = ext_regions->bank[i].start;
>> +        u64 size = ext_regions->bank[i].size;
>> +
>> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> +                   i, start, start + size);
>> +
>> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
>> +    }
>> +    xfree(ext_regions);
>> +
>>       res = fdt_property(fdt, "reg", reg,
>> -                       dt_cells_to_size(addrcells + sizecells));
>> +                       dt_cells_to_size(addrcells + sizecells) * (i 
>> + 1));
>>       if ( res )
>>           return res;
>>
>
> Cheers,

[1] 
https://lore.kernel.org/xen-devel/cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org/

[2] 
https://elixir.bootlin.com/linux/v5.15-rc1/source/arch/arm64/mm/mmu.c#L1448


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


