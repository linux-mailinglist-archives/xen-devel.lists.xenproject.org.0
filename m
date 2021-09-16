Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED340EBE5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 22:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188714.337977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQySB-0006Cr-Jp; Thu, 16 Sep 2021 20:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188714.337977; Thu, 16 Sep 2021 20:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQySB-0006B3-F7; Thu, 16 Sep 2021 20:57:55 +0000
Received: by outflank-mailman (input) for mailman id 188714;
 Thu, 16 Sep 2021 20:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Js+i=OG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQyS9-0006Au-FJ
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 20:57:53 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25f49dfd-9386-4e37-90d9-c459a5214bdb;
 Thu, 16 Sep 2021 20:57:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p29so23653911lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 13:57:51 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x1sm465924ljh.113.2021.09.16.13.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 13:57:49 -0700 (PDT)
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
X-Inumbo-ID: 25f49dfd-9386-4e37-90d9-c459a5214bdb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PBwMpJ8RXnLuJPR1IIalhXLuam6FXctzmKajI1mHnsU=;
        b=QbnOjHJrwCrpx9QWhcszQ5L5LfLqNa5A80YISlWpKQDBf/Ybdtqwz8KiUT6eUxhxpe
         ScZP5ogAS/jEvRCpotl76lLUgIrSMKnxKajE1wU37dg5+5LZfVXxX2VHsy+KXVldK8z0
         s1yqxu2+4Mi+ohXIW3ZT4IVZNTMVlFlaZGVaiyBQI+PmUre0zO+dWga5OPAarVrIVLGD
         BPUVvdVvThbE0RC1UIigVdeUQR3jdHPhId33RcgUvZUBwBWR1pkCgkMYkVAmsMEK3iVx
         hvYr6RJkNsQ0sEJJEnWpSaLlYONl/gmFz2TVKutVKG9fUL4EqiajQ9B3ELwtyon1/drV
         Nrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PBwMpJ8RXnLuJPR1IIalhXLuam6FXctzmKajI1mHnsU=;
        b=6FwUEC1Rs3Rs7CHRyyaxXOxe7gi+6237XaebN/LTv81s63qmZ9GrpJOIPEcdhEArqY
         iP8yAk6YPntutAosyr4CXArUsMo+t2EVsqC50RNxpt8HAGX6Yf8BC806CSRqDfJdAUHK
         YN0DvZgHk/0dukyTbi3DBe/usZ7E71pHzNK7RmpknAg4BjG4/4BWltTpnDEBmULJotxT
         UgfmHaUkGBzk1D800JZSw+oO7xRDWanhxelM5vGoS/aof0K8hCp4oYvQ8K03EyKChxZE
         3kjmu6wIl+RGqkJk9eoJqLbdt1o88Bg5Tds3VRAA7/ptLDJjHbCWpxHgeWETgptmNyaX
         hQ/Q==
X-Gm-Message-State: AOAM532ZzuAYKUslMNWGf1cwRYRcF0pSxgleS0HwbDnr6LrPCbe/MObL
	E0k4bLk7pLv1onAbqwb+FtM=
X-Google-Smtp-Source: ABdhPJwoiNdjd1zh5Hsgj5SQiMoYabTLGMqud3Na3vBKBo1TyEUE6B3WxcUerWOG35Y41hpPwrQfsg==
X-Received: by 2002:a2e:9296:: with SMTP id d22mr6498843ljh.413.1631825869866;
        Thu, 16 Sep 2021 13:57:49 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
 <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
 <alpine.DEB.2.21.2109151352100.21985@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b349e43a-91d9-16ba-57c6-34e790b8b31c@gmail.com>
Date: Thu, 16 Sep 2021 23:57:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109151352100.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.09.21 00:21, Stefano Stabellini wrote:

Hi Stefano

> On Wed, 15 Sep 2021, Oleksandr wrote:
>>> On Fri, 10 Sep 2021, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> The extended region (safe range) is a region of guest physical
>>>> address space which is unused and could be safely used to create
>>>> grant/foreign mappings instead of wasting real RAM pages from
>>>> the domain memory for establishing these mappings.
>>>>
>>>> The extended regions are chosen at the domain creation time and
>>>> advertised to it via "reg" property under hypervisor node in
>>>> the guest device-tree. As region 0 is reserved for grant table
>>>> space (always present), the indexes for extended regions are 1...N.
>>>> If extended regions could not be allocated for some reason,
>>>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>>>
>>>> Please note the following limitations:
>>>> - The extended region feature is only supported for 64-bit domain.
>>>> - The ACPI case is not covered.
>>>>
>>>> ***
>>>>
>>>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
>>>> the algorithm to choose extended regions for it is different
>>>> in comparison with the algorithm for non-direct mapped DomU.
>>>> What is more, that extended regions should be chosen differently
>>>> whether IOMMU is enabled or not.
>>>>
>>>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
>>>> holes found in host device-tree if otherwise. Make sure that
>>>> extended regions are 2MB-aligned and located within maximum possible
>>>> addressable physical memory range. The maximum number of extended
>>>> regions is 128.
>>>>
>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Changes since RFC:
>>>>      - update patch description
>>>>      - drop uneeded "extended-region" DT property
>>>> ---
>>>>
>>>>    xen/arch/arm/domain_build.c | 226
>>>> +++++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 224 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 206038d..070ec27 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -724,6 +724,196 @@ static int __init make_memory_node(const struct
>>>> domain *d,
>>>>        return res;
>>>>    }
>>>>    +static int __init add_ext_regions(unsigned long s, unsigned long e,
>>>> void *data)
>>>> +{
>>>> +    struct meminfo *ext_regions = data;
>>>> +    paddr_t start, size;
>>>> +
>>>> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>>>> +        return 0;
>>>> +
>>>> +    /* Both start and size of the extended region should be 2MB aligned
>>>> */
>>>> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>>>> +    if ( start > e )
>>>> +        return 0;
>>>> +
>>>> +    size = (e - start + 1) & ~(SZ_2M - 1);
>>>> +    if ( !size )
>>>> +        return 0;
>>> Can't you align size as well?
>>>
>>>     size = (size - (SZ_2M - 1)) & ~(SZ_2M - 1);
>> I am sorry, I don't entirely get what you really meant here. We get both start
>> and size 2MB-aligned by the calculations above
>> (when calculating an alignment, we need to make sure that "start_passed <=
>> start_aligned && size_aligned <= size_passed").
>> If I add the proposing string after, I will reduce the already aligned size by
>> 2MB.
>> If I replace the size calculation with the following, I will get the reduced
>> size even if the passed region is initially 2MB-aligned, so doesn't need to be
>> adjusted.
>> size = e - s + 1;
>> size = (size - (SZ_2M - 1)) & ~(SZ_2M - 1);
> Sorry I misread your original code, I think it was working as intended
> except for the "+1". I think it should be:
>
>    size = (e - start) & ~(SZ_2M - 1);
But why without "+1"? Isn't "e" here the *last address* of passed range?
Without "+1" I get non entirely correct calculations, last valid 2MB is 
missed.

[snip]
(XEN) Extended region 14: 0x580000000->0x5ffe00000
(XEN) Extended region 15: 0x680000000->0x6ffe00000
(XEN) Extended region 16: 0x780000000->0xffffe00000

But should get:

[snip]
(XEN) Extended region 15: 0x580000000->0x600000000
(XEN) Extended region 16: 0x680000000->0x700000000
(XEN) Extended region 17: 0x780000000->0x10000000000

Let's consider how a hole between (for example) RAM bank 1 and bank 2 is 
calculated:
(XEN) RAM: 0000000500000000 - 000000057fffffff <--- RAM bank 1 with size 
0x80000000
(XEN) RAM: 0000000600000000 - 000000067fffffff <--- RAM bank 2 with size 
0x80000000
So the hole size should also be 0x80000000.
If we pass these RAM banks to rangeset_remove_range() one by one:
1: s = 0x500000000 e = 0x57FFFFFFF
2. s = 0x600000000 e = 0x67FFFFFFF
we get s = 0x580000000 e = 0x5FFFFFFFF in add_ext_regions(), where "e" 
is the last address of the hole (not the first address out of the hole), 
so I think, that for proper size calculation we need to add 1 to "e - 
s". Or I really missed something?


>
>>>> + */
>>>> +#define EXT_REGION_START   0x40000000ULL
>>>> +#define EXT_REGION_END     0x80003fffffffULL
>>>> +
>>>> +static int __init find_unallocated_memory(const struct kernel_info
>>>> *kinfo,
>>>> +                                          struct meminfo *ext_regions)
>>>> +{
>>>> +    const struct meminfo *assign_mem = &kinfo->mem;
>>>> +    struct rangeset *unalloc_mem;
>>>> +    paddr_t start, end;
>>>> +    unsigned int i;
>>>> +    int res;
>>>> +
>>>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>>>> +
>>>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>>>> +    if ( !unalloc_mem )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /* Start with all available RAM */
>>>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>>> +    {
>>>> +        start = bootinfo.mem.bank[i].start;
>>>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
>>> Is the -1 needed? Isn't it going to screw up the size calculation later?
>> I thought, it was needed. The calculation seems correct.
> I think that normally for an example MMIO region:
>
> start = 0x48000000
> size  = 0x40000000
> end   = 0x88000000
>
> So end = start + size and points to the first address out of the range.
> In other words, 0x88000000 doesn't actually belong to the MMIO region in
> the example.
>
> But here you are passing addresses to rangeset_add_range and other
> rangeset functions and I think rangeset takes *inclusive* addresses as
> input. So you need to pass start and end-1 because end-1 is the last
> address of the MMIO region.
>
> In fact you can see for instance in map_range_to_domain:
>
>          res = iomem_permit_access(d, paddr_to_pfn(addr),
>                  paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>
> Where iomem_permit_access is based on rangeset. So for clarity, I would
> do:
>
> start = assign_mem->bank[i].start;
> end = assign_mem->bank[i].start + assign_mem->bank[i].size;
> res = rangeset_remove_range(unalloc_mem, start, end - 1);
>
> So that we don't get confused on the meaning of "end" which everywhere
> else means the first address not in range.

I got your point, I will update the code if it much cleaner.


>>>> +        res = rangeset_add_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove RAM assigned to Dom0 */
>>>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>>> +    {
>>>> +        start = assign_mem->bank[i].start;
>>>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove reserved-memory regions */
>>>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>>>> +    {
>>>> +        start = bootinfo.reserved_mem.bank[i].start;
>>>> +        end = bootinfo.reserved_mem.bank[i].start +
>>>> +            bootinfo.reserved_mem.bank[i].size - 1;
>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove grant table region */
>>>> +    start = kinfo->gnttab_start;
>>>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>>>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +    if ( res )
>>>> +    {
>>>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>>> +               start, end);
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    start = EXT_REGION_START;
>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>>>> +                                 add_ext_regions, ext_regions);
>>>> +    if ( res )
>>>> +        ext_regions->nr_banks = 0;
>>>> +    else if ( !ext_regions->nr_banks )
>>>> +        res = -ENOENT;
>>>> +
>>>> +out:
>>>> +    rangeset_destroy(unalloc_mem);
>>>> +
>>>> +    return res;
>>>> +}
>>>> +
>>>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>> +                                    struct meminfo *ext_regions)
>>>> +{
>>>> +    struct dt_device_node *np;
>>>> +    struct rangeset *mem_holes;
>>>> +    paddr_t start, end;
>>>> +    unsigned int i;
>>>> +    int res;
>>>> +
>>>> +    dt_dprintk("Find memory holes for extended regions\n");
>>>> +
>>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>>> +    if ( !mem_holes )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /* Start with maximum possible addressable physical memory range */
>>>> +    start = EXT_REGION_START;
>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>> +    res = rangeset_add_range(mem_holes, start, end);
>>>> +    if ( res )
>>>> +    {
>>>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>> +               start, end);
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
>>>> +    dt_for_each_device_node( dt_host, np )
>>> Don't you need something like device_tree_for_each_node ?
>>> dt_for_each_device_node won't go down any deeper in the tree?
>> Thank you for pointing this out, I will investigate and update the patch.
>>
>>
>>> Alternatively, maybe we could simply record the highest possible address
>>> of any memory/device/anything as we scan the device tree with
>>> handle_node. Then we can use that as the starting point here.
>> I also don't like the idea to scan the DT much, but I failed to find an
>> effective solution how to avoid that.
>> Yes, we can record the highest possible address, but I am afraid, I didn't
>> entirely get a suggestion. Is the suggestion to provide a single region
>> starting from highest possible address + 1 and up to the EXT_REGION_END
>> suitably aligned? Could you please clarify?
> Yes, that is what I was suggesting as a possible alternative: start from
> the highest possible address in DT + 1 and up to the EXT_REGION_END
> suitably aligned. But that wouldn't solve the <4GB issue.
>
>>>> +                goto out;
>>>> +            }
>>>> +
>>>> +            start = addr & PAGE_MASK;
>>>> +            end = PAGE_ALIGN(addr + size) - 1;
>>>> +            res = rangeset_remove_range(mem_holes, start, end);
>>>> +            if ( res )
>>>> +            {
>>>> +                printk(XENLOG_ERR "Failed to remove:
>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>> +                       start, end);
>>>> +                goto out;
>>>> +            }
>>>> +        }
>>>> +    }
>>> As is, it will result in a myriad of small ranges which is unuseful and
>>> slow to parse. I suggest to simplify it by removing a larger region than
>>> strictly necessary. For instance, you could remove a 1GB-aligned and
>>> 1GB-multiple region for each range. That way, you are going to get fewer
>>> large free ranges instance of many small ones which we don't need.
>> I agree with you that a lot of small ranges increase the bookkeeping in Dom0
>> and there is also a theoretical (?) possibility
>> that small ranges occupy all space we provide for extended regions
>> (NR_MEM_BANKS)...
>> But, let's consider my setup as an example again, but when the IOMMU is
>> enabled for Dom0 ("holes found in DT").
>>
>> --- The RAM configuration is the same:
>>
>> (XEN) RAM: 0000000048000000 - 00000000bfffffff <--- RAM bank 0
>> (XEN) RAM: 0000000500000000 - 000000057fffffff <--- RAM bank 1
>> (XEN) RAM: 0000000600000000 - 000000067fffffff <--- RAM bank 2
>> (XEN) RAM: 0000000700000000 - 000000077fffffff <--- RAM bank 3
>>
>> --- There are a lot of various platform devices with reg property described in
>> DT, I will probably not post all IO ranges here, just say that mostly all of
>> them to be mapped at 0xE0000000-0xFFFFFFFF.
>>
>> --- As we only pick up ranges with size >= 2MB, the calculated extended
>> regions are (based on 40-bit IPA):
>>
>> (XEN) Extended region 0: 0x40000000->0x47e00000
>> (XEN) Extended region 1: 0xc0000000->0xe6000000
>> (XEN) Extended region 2: 0xe7000000->0xe7200000
>> (XEN) Extended region 3: 0xe7400000->0xe7600000
>> (XEN) Extended region 4: 0xe7800000->0xec000000
>> (XEN) Extended region 5: 0xec200000->0xec400000
>> (XEN) Extended region 6: 0xec800000->0xee000000
>> (XEN) Extended region 7: 0xee600000->0xee800000
>> (XEN) Extended region 8: 0xeea00000->0xf1000000
>> (XEN) Extended region 9: 0xf1200000->0xfd000000
>> (XEN) Extended region 10: 0xfd200000->0xfd800000
>> (XEN) Extended region 11: 0xfda00000->0xfe000000
>> (XEN) Extended region 12: 0xfe200000->0xfe600000
>> (XEN) Extended region 13: 0xfec00000->0xff800000
>> (XEN) Extended region 14: 0x100000000->0x500000000
>> (XEN) Extended region 15: 0x580000000->0x600000000
>> (XEN) Extended region 16: 0x680000000->0x700000000
>> (XEN) Extended region 17: 0x780000000->0x10000000000
>>
>> So, if I *correctly* understood your idea about removing 1GB-aligned
>> 1GB-multiple region for each range we would get the following:
>>
>> (XEN) Extended region 0: 0x100000000->0x500000000
>> (XEN) Extended region 1: 0x580000000->0x600000000
>> (XEN) Extended region 2: 0x680000000->0x700000000
>> (XEN) Extended region 3: 0x780000000->0x10000000000
>>
>> As you can see there are no extended regions below 4GB at all. I assume, it
>> would be good to provide them for 1:1 mapped Dom0 (for 32-bit DMA devices?)
>> What else worries me is that IPA size could be 36 or even 32. So, I am afraid,
>> we might even fail to find extended regions above 4GB.
>>
>>
>> I think, if 2MB is considered small enough to bother with, probably we should
>> go with something in between (16MB, 32MB, 64MB).
>> For example, we can take into the account ranges with size >= 16MB:
>>
>> (XEN) Extended region 0: 0x40000000->0x47e00000
>> (XEN) Extended region 1: 0xc0000000->0xe6000000
>> (XEN) Extended region 2: 0xe7800000->0xec000000
>> (XEN) Extended region 3: 0xec800000->0xee000000
>> (XEN) Extended region 4: 0xeea00000->0xf1000000
>> (XEN) Extended region 5: 0xf1200000->0xfd000000
>> (XEN) Extended region 6: 0x100000000->0x500000000
>> (XEN) Extended region 7: 0x580000000->0x600000000
>> (XEN) Extended region 8: 0x680000000->0x700000000
>> (XEN) Extended region 9: 0x780000000->0x10000000000
>>
>> Any thoughts?
> Yeah maybe an intermediate value would be best. I'd go with 64MB.

I completely agree.

So what I got on my setup with that value.

1. IOMMU is enabled for Dom0:

(XEN) Extended region 0: 0x40000000->0x47e00000
(XEN) Extended region 1: 0xc0000000->0xe6000000
(XEN) Extended region 2: 0xe7800000->0xec000000
(XEN) Extended region 3: 0xf1200000->0xfd000000
(XEN) Extended region 4: 0x100000000->0x500000000
(XEN) Extended region 5: 0x580000000->0x600000000
(XEN) Extended region 6: 0x680000000->0x700000000
(XEN) Extended region 7: 0x780000000->0x10000000000

2. IOMMU is disabled for Dom0:

(XEN) Extended region 0: 0x48000000->0x54000000
(XEN) Extended region 1: 0x57000000->0x60000000
(XEN) Extended region 2: 0x70000000->0x78000000
(XEN) Extended region 3: 0x78200000->0xc0000000
(XEN) Extended region 4: 0x500000000->0x580000000
(XEN) Extended region 5: 0x600000000->0x680000000
(XEN) Extended region 6: 0x700000000->0x780000000

Which is not bad.

Thank you.

-- 
Regards,

Oleksandr Tyshchenko


