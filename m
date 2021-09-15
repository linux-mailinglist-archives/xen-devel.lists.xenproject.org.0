Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A440CD06
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 21:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187860.336867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQaIg-00017L-QT; Wed, 15 Sep 2021 19:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187860.336867; Wed, 15 Sep 2021 19:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQaIg-00014D-MF; Wed, 15 Sep 2021 19:10:30 +0000
Received: by outflank-mailman (input) for mailman id 187860;
 Wed, 15 Sep 2021 19:10:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLCT=OF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQaIe-000147-Vs
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 19:10:29 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a95f2cb1-a4b7-4fb3-9659-1770f807852d;
 Wed, 15 Sep 2021 19:10:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g21so7419784edw.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Sep 2021 12:10:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 6sm357505ejx.82.2021.09.15.12.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 12:10:25 -0700 (PDT)
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
X-Inumbo-ID: a95f2cb1-a4b7-4fb3-9659-1770f807852d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pn3+UGoyhb1u5WaznGKX/AfbsmQRh2tuWoPupZP9LlE=;
        b=QXqRcBpum5I5tcHEbYiRv8KiSyhTbeI97RRfZN7KTW5AOckOTEvULgm2t5xZ3yqdQF
         557n3EYhABv3qCymgPY82JfELibX3Y4WctQ7ZpH/5MXt9j/jNUAtKFwKqlhZXCXeQGo2
         X6QG2rKkzoSEB5JJ6altLxKgL66e5kkZcOlBw8yFpWyBBjAlsbcRhmZEywhwOpPaUun8
         hXIsNafDZ7omqVjuncXe+yiIPCNWRpTVKgsSE+cEtiFjojXGUFcNRzNgtiPKyBf8WPSO
         98ARtNN+GCWyI38MMQqgnbqCADKb4+pFZuBKdiu9tay7yDVQDj95sid3IymtXU5W7N9o
         O6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pn3+UGoyhb1u5WaznGKX/AfbsmQRh2tuWoPupZP9LlE=;
        b=p+Kg4MhgsYU007z404UJ/Y7c2zrzwR8wxg0N0dJI1p1nfAAi2ZvlEDHnAgb0zD4+gb
         PTe4kr/RYvqDBPcPPTimfegwWZ2OgMle9WtZBrrqHSBQZ+YrbxhSJo4twS/AfivHo6Nx
         KUFU8YkW3rL7JXyg8D5P+IfTiFP22jx/P473lpKgaEsOX1rhCgKpyYOIyx6A2wubh93R
         l+4xzOz6GbUhQXeAXdX2tQU1l88m/bgT1Luul+pm0G+6WOA2eAxL/oFVbTa9vi4cmBUh
         8nn4tb2yPbGV+qCUsg4LunI6ugD2Z1DBBrDTE6tzB0uGxtiARp+9g+yY1OOkTLdKhTdA
         7XoQ==
X-Gm-Message-State: AOAM531th6Z9nUtnbsh8dBIeeH/kMnYjK2BSgRDujlGJRy5ag2ePgxhj
	hkF8AFJQAd2IheGVsFRMaB0=
X-Google-Smtp-Source: ABdhPJwWnGJ2240DgmQR2Gsn0ebhDl12vCSqKN5ziU/A+sxj8OoWz0es4t85oiqW1g2SkL6XE2Rojg==
X-Received: by 2002:a17:906:4f96:: with SMTP id o22mr1650327eju.169.1631733025347;
        Wed, 15 Sep 2021 12:10:25 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
Date: Wed, 15 Sep 2021 22:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.09.21 03:55, Stefano Stabellini wrote:

Hi Stefano

> On Fri, 10 Sep 2021, Oleksandr Tyshchenko wrote:
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
>> addressable physical memory range. The maximum number of extended
>> regions is 128.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes since RFC:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>> ---
>>
>>   xen/arch/arm/domain_build.c | 226 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 224 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 206038d..070ec27 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -724,6 +724,196 @@ static int __init make_memory_node(const struct domain *d,
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
>> +    size = (e - start + 1) & ~(SZ_2M - 1);
>> +    if ( !size )
>> +        return 0;
> Can't you align size as well?
>
>    size = (size - (SZ_2M - 1)) & ~(SZ_2M - 1);

I am sorry, I don't entirely get what you really meant here. We get both 
start and size 2MB-aligned by the calculations above
(when calculating an alignment, we need to make sure that "start_passed 
<= start_aligned && size_aligned <= size_passed").
If I add the proposing string after, I will reduce the already aligned 
size by 2MB.
If I replace the size calculation with the following, I will get the 
reduced size even if the passed region is initially 2MB-aligned, so 
doesn't need to be adjusted.
size = e - s + 1;
size = (size - (SZ_2M - 1)) & ~(SZ_2M - 1);

>
>> +    ext_regions->bank[ext_regions->nr_banks].start = start;
>> +    ext_regions->bank[ext_regions->nr_banks].size = size;
>> +    ext_regions->nr_banks ++;
>                              ^ no space

ok


>
>> +    return 0;
>> +}
>> +
>> +/*
>> + * The extended regions will be prevalidated by the memory hotplug path
>> + * in Linux which requires for any added address range to be within maximum
>> + * possible addressable physical memory range for which the linear mapping
>> + * could be created.
>> + * For 48-bit VA space size the maximum addressable range are:
>> + * 0x40000000 - 0x80003fffffff
> Please don't make Linux-specific comments in Xen code for interfaces
> that are supposed to be OS-agnostic.

You are right. I just wanted to describe where these magic numbers come 
from.
Someone might question why, for example, "0 ... max_gpaddr" can't be 
used. I will move
that Linux-specific comments to the commit message to keep some 
justification of these numbers.


>> + */
>> +#define EXT_REGION_START   0x40000000ULL
>> +#define EXT_REGION_END     0x80003fffffffULL
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
>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
> Is the -1 needed? Isn't it going to screw up the size calculation later?
I thought, it was needed. The calculation seems correct.
For example, in my setup when IOMMU is disabled for Dom0 ("unallocated 
to Dom0 RAM"):

--- All available RAM and reserved memory found in DT:

(XEN) Initrd 0000000084000040-0000000085effc48
(XEN) RAM: 0000000048000000 - 00000000bfffffff <--- RAM bank 0
(XEN) RAM: 0000000500000000 - 000000057fffffff <--- RAM bank 1
(XEN) RAM: 0000000600000000 - 000000067fffffff <--- RAM bank 2
(XEN) RAM: 0000000700000000 - 000000077fffffff <--- RAM bank 3
(XEN)
(XEN) MODULE[0]: 0000000078080000 - 00000000781d74c8 Xen
(XEN) MODULE[1]: 0000000057fe7000 - 0000000057ffd080 Device Tree
(XEN) MODULE[2]: 0000000084000040 - 0000000085effc48 Ramdisk
(XEN) MODULE[3]: 000000008a000000 - 000000008c000000 Kernel
(XEN) MODULE[4]: 000000008c000000 - 000000008c010000 XSM
(XEN)  RESVD[0]: 0000000084000040 - 0000000085effc48
(XEN)  RESVD[1]: 0000000054000000 - 0000000056ffffff  <--- Reserved memory

--- Dom0 RAM:

(XEN) Allocating 1:1 mappings totalling 256MB for dom0:
(XEN) BANK[0] 0x00000060000000-0x00000070000000 (256MB)

--- Dom0 grant table range:

(XEN) Grant table range: 0x00000078080000-0x000000780c0000

--- Calculated extended regions printed in make_hypervisor_node():

printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n", i, start, start + 
size);

(XEN) Extended region 0: 0x48000000->0x54000000
(XEN) Extended region 1: 0x57000000->0x60000000
(XEN) Extended region 2: 0x70000000->0x78000000
(XEN) Extended region 3: 0x78200000->0xc0000000
(XEN) Extended region 4: 0x500000000->0x580000000
(XEN) Extended region 5: 0x600000000->0x680000000
(XEN) Extended region 6: 0x700000000->0x780000000

--- Resulted hypervisor node in Dom0 DT:

hypervisor {
         interrupts = <0x01 0x00 0xf08>;
         interrupt-parent = <0x19>;
         compatible = "xen,xen-4.16\0xen,xen";
         reg = <0x00 0x78080000 0x00 0x40000 0x00 0x48000000 0x00 
0xc000000 0x00 0x57000000 0x00 0x9000000 0x00 0x70000000 0x00 0x8000000 
0x00 0x78200000 0x00 0x47e00000 0x05 0x00 0x00 0x80000000 0x06 0x00 0x00 
0x80000000 0x07 0x00 0x00 0x80000000>;
};

Where index 0 corresponds to the grant table region and indexes 1...N 
correspond to the extended regions.


>> +        res = rangeset_add_range(unalloc_mem, start, end);
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
>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
>> +        res = rangeset_remove_range(unalloc_mem, start, end);
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
>> +            bootinfo.reserved_mem.bank[i].size - 1;
>> +        res = rangeset_remove_range(unalloc_mem, start, end);
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
>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
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
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>> +    res = rangeset_add_range(mem_holes, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
>> +    dt_for_each_device_node( dt_host, np )
> Don't you need something like device_tree_for_each_node ?
> dt_for_each_device_node won't go down any deeper in the tree?

Thank you for pointing this out, I will investigate and update the patch.


>
> Alternatively, maybe we could simply record the highest possible address
> of any memory/device/anything as we scan the device tree with
> handle_node. Then we can use that as the starting point here.
I also don't like the idea to scan the DT much, but I failed to find an 
effective solution how to avoid that.
Yes, we can record the highest possible address, but I am afraid, I 
didn't entirely get a suggestion. Is the suggestion to provide a single 
region
starting from highest possible address + 1 and up to the EXT_REGION_END 
suitably aligned? Could you please clarify?


> So that we
> don't need to scan the device tree twice, and also we don't need my
> suggestion below to remove 1GB-aligned 1GB-multiple regions.
I provided some thoughts regarding this below.


>
>
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
> It might be possible for a device not to have a range if it doesn't have
> any MMIO regions, right? For instance, certain ARM timer nodes. I would
> not print any errors and continue.
I though, if device didn't have a range, then this loop wouldn't be 
executed at all as dt_number_of_address would return 0.
I will double check.


>
>
>> +                goto out;
>> +            }
>> +
>> +            start = addr & PAGE_MASK;
>> +            end = PAGE_ALIGN(addr + size) - 1;
>> +            res = rangeset_remove_range(mem_holes, start, end);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                       start, end);
>> +                goto out;
>> +            }
>> +        }
>> +    }
> As is, it will result in a myriad of small ranges which is unuseful and
> slow to parse. I suggest to simplify it by removing a larger region than
> strictly necessary. For instance, you could remove a 1GB-aligned and
> 1GB-multiple region for each range. That way, you are going to get fewer
> large free ranges instance of many small ones which we don't need.

I agree with you that a lot of small ranges increase the bookkeeping in 
Dom0 and there is also a theoretical (?) possibility
that small ranges occupy all space we provide for extended regions 
(NR_MEM_BANKS)...
But, let's consider my setup as an example again, but when the IOMMU is 
enabled for Dom0 ("holes found in DT").

--- The RAM configuration is the same:

(XEN) RAM: 0000000048000000 - 00000000bfffffff <--- RAM bank 0
(XEN) RAM: 0000000500000000 - 000000057fffffff <--- RAM bank 1
(XEN) RAM: 0000000600000000 - 000000067fffffff <--- RAM bank 2
(XEN) RAM: 0000000700000000 - 000000077fffffff <--- RAM bank 3

--- There are a lot of various platform devices with reg property 
described in DT, I will probably not post all IO ranges here, just say 
that mostly all of them to be mapped at 0xE0000000-0xFFFFFFFF.

--- As we only pick up ranges with size >= 2MB, the calculated extended 
regions are (based on 40-bit IPA):

(XEN) Extended region 0: 0x40000000->0x47e00000
(XEN) Extended region 1: 0xc0000000->0xe6000000
(XEN) Extended region 2: 0xe7000000->0xe7200000
(XEN) Extended region 3: 0xe7400000->0xe7600000
(XEN) Extended region 4: 0xe7800000->0xec000000
(XEN) Extended region 5: 0xec200000->0xec400000
(XEN) Extended region 6: 0xec800000->0xee000000
(XEN) Extended region 7: 0xee600000->0xee800000
(XEN) Extended region 8: 0xeea00000->0xf1000000
(XEN) Extended region 9: 0xf1200000->0xfd000000
(XEN) Extended region 10: 0xfd200000->0xfd800000
(XEN) Extended region 11: 0xfda00000->0xfe000000
(XEN) Extended region 12: 0xfe200000->0xfe600000
(XEN) Extended region 13: 0xfec00000->0xff800000
(XEN) Extended region 14: 0x100000000->0x500000000
(XEN) Extended region 15: 0x580000000->0x600000000
(XEN) Extended region 16: 0x680000000->0x700000000
(XEN) Extended region 17: 0x780000000->0x10000000000

So, if I *correctly* understood your idea about removing 1GB-aligned 
1GB-multiple region for each range we would get the following:

(XEN) Extended region 0: 0x100000000->0x500000000
(XEN) Extended region 1: 0x580000000->0x600000000
(XEN) Extended region 2: 0x680000000->0x700000000
(XEN) Extended region 3: 0x780000000->0x10000000000

As you can see there are no extended regions below 4GB at all. I assume, 
it would be good to provide them for 1:1 mapped Dom0 (for 32-bit DMA 
devices?)
What else worries me is that IPA size could be 36 or even 32. So, I am 
afraid, we might even fail to find extended regions above 4GB.


I think, if 2MB is considered small enough to bother with, probably we 
should go with something in between (16MB, 32MB, 64MB).
For example, we can take into the account ranges with size >= 16MB:

(XEN) Extended region 0: 0x40000000->0x47e00000
(XEN) Extended region 1: 0xc0000000->0xe6000000
(XEN) Extended region 2: 0xe7800000->0xec000000
(XEN) Extended region 3: 0xec800000->0xee000000
(XEN) Extended region 4: 0xeea00000->0xf1000000
(XEN) Extended region 5: 0xf1200000->0xfd000000
(XEN) Extended region 6: 0x100000000->0x500000000
(XEN) Extended region 7: 0x580000000->0x600000000
(XEN) Extended region 8: 0x680000000->0x700000000
(XEN) Extended region 9: 0x780000000->0x10000000000

Any thoughts?


>
>> +    start = EXT_REGION_START;
>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
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
>> @@ -731,11 +921,13 @@ static int __init make_hypervisor_node(struct domain *d,
>>       const char compat[] =
>>           "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>>           "xen,xen";
>> -    __be32 reg[4];
>> +    __be32 reg[(NR_MEM_BANKS + 1) * 4];
> If you are xzalloc'ing struct meminfo then you might as well xzalloc reg
> too. Or keep both on the stack with a lower NR_MEM_BANKS.
sounds reasonable, I will probably xzalloc reg as well.

>
>
>>       gic_interrupt_t intr;
>>       __be32 *cells;
>>       int res;
>>       void *fdt = kinfo->fdt;
>> +    struct meminfo *ext_regions;
>> +    unsigned int i;
>>   
>>       dt_dprintk("Create hypervisor node\n");
>>   
>> @@ -757,12 +949,42 @@ static int __init make_hypervisor_node(struct domain *d,
>>       if ( res )
>>           return res;
>>   
>> +    ext_regions = xzalloc(struct meminfo);
>> +    if ( !ext_regions )
>> +        return -ENOMEM;
>> +
>> +    if ( is_32bit_domain(d) )
>> +        printk(XENLOG_WARNING "The extended region is only supported for 64-bit guest\n");
> This is going to add an unconditional warning to all 32bit boots. I
> would skip it entirely or only keep it as XENLOG_DEBUG.

agree, I will probably convert to XENLOG_DEBUG.


>
>
>> +    else
>> +    {
>> +        if ( !is_iommu_enabled(d) )
>> +            res = find_unallocated_memory(kinfo, ext_regions);
>> +        else
>> +            res = find_memory_holes(kinfo, ext_regions);
>> +
>> +        if ( res )
>> +            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
>> +    }
>> +
>>       /* reg 0 is grant table space */
>>       cells = &reg[0];
>>       dt_child_set_range(&cells, addrcells, sizecells,
>>                          kinfo->gnttab_start, kinfo->gnttab_size);
>> +    /* reg 1...N are extended regions */
>> +    for ( i = 0; i < ext_regions->nr_banks; i++ )
>> +    {
>> +        u64 start = ext_regions->bank[i].start;
>> +        u64 size = ext_regions->bank[i].size;
>> +
>> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> +                   i, start, start + size);
>> +
>> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
>> +    }
>> +    xfree(ext_regions);
>> +
>>       res = fdt_property(fdt, "reg", reg,
>> -                       dt_cells_to_size(addrcells + sizecells));
>> +                       dt_cells_to_size(addrcells + sizecells) * (i + 1));
>>       if ( res )
>>           return res;
>>   
>> -- 
>> 2.7.4
>>

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


