Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B04258FC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 19:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203877.359033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYWvQ-0001CB-I8; Thu, 07 Oct 2021 17:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203877.359033; Thu, 07 Oct 2021 17:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYWvQ-00019U-EL; Thu, 07 Oct 2021 17:11:20 +0000
Received: by outflank-mailman (input) for mailman id 203877;
 Thu, 07 Oct 2021 17:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYWvO-00019O-Gx
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 17:11:18 +0000
Received: from mail-ed1-x534.google.com (unknown [2a00:1450:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 619ddad6-9e46-4ea6-a959-c82112f23beb;
 Thu, 07 Oct 2021 17:11:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a25so9984039edx.8
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 10:11:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u16sm7650edy.55.2021.10.07.10.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:11:15 -0700 (PDT)
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
X-Inumbo-ID: 619ddad6-9e46-4ea6-a959-c82112f23beb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gsCIBGpk6Y6BC6fZwGevI0r9FjPMa7p9BeRC5JmWKHU=;
        b=qbm25oIa48k2Z6qT75n3qfxqyTS0l6M1AWfcXXo+WutVmUHcd3hPBtbQi3P6f1Bw9+
         UF20oJ5ymWc6oI0X0l0c1oY0JCV7lN452SgMssCTlhuTxC+Jvs987umbZZK/e8jxnyv2
         u4BzORbAa6r+T9EQU+0RXz5UQfOIRoaS4nHMgj5zx+ttjVoNSWWaAy4kdrUHjU/Jxbdl
         u/WEag3t7WoxBxN7WQyc86q1gLJ6AO3m5nonpVcAZaHDuuEGJ/3y7M7GYpx+x7NE6wP9
         wmNW2WSDOSvr+sL0KCAdWQU4qN874z4B8WFEznnVobDWHn7cS/5nGIIqovA/bKmYIIlr
         gWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gsCIBGpk6Y6BC6fZwGevI0r9FjPMa7p9BeRC5JmWKHU=;
        b=bx8/uk83+mJ1Y7DqVnpuqOsfHdIjEjDH3XKTWGYoNX5zLFQrLQjT/mspIPZfPyw0Zt
         zzvQqkzREdSpgQI9N2iQ/35SMql5zzRfgr06B4rSCUY9yF+BdKSLpdSW9RjZ8D9bJKxL
         bAE+sBze2Rb+zCQDD4yyJX4LAbwMLnJ9VQOQJGMrnaNpEmvMRTtqHMvidz97pzpp4Npq
         iNQCm7df2+NSLTixbiUcoVWg3ggOBN854BiPgvCmpFrEULPuDS4DD82+PUNm2peNnfiC
         54L0y1zaQ7zA5jCGmisXBfp095dETcQX32zqh5EnYxwzztQ7L8lMCxe/IwhEQ0t0LN3b
         8LOQ==
X-Gm-Message-State: AOAM531OQX3weZgR2ji5f7euuKV+K8hBmrIisCR4gNKLzzkmVCoYQbK2
	x1+nCIgwWWVUByoW40EhWWI=
X-Google-Smtp-Source: ABdhPJxo24C2jHjHAFg+ZqdfmV5IrOtuCE27s2TYHOLSUj+1CvYwZArAY+co6aOghhq1sGalOb/bCw==
X-Received: by 2002:a17:906:1848:: with SMTP id w8mr7076520eje.485.1633626675557;
        Thu, 07 Oct 2021 10:11:15 -0700 (PDT)
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
Date: Thu, 7 Oct 2021 20:11:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 04:50, Stefano Stabellini wrote:

Hi Stefano

> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This is a follow-up of
>> "b6fe410 xen/arm: Add handling of extended regions for Dom0"
>>
>> Add various in-code comments, update Xen hypervisor device tree
>> bindings text, change the log level for some prints and clarify
>> format specifier, reuse dt_for_each_range() to avoid open-coding
>> in find_memory_holes().
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Thanks for the patch, it looks like you addressed all Julien's comments
> well.

I believe so)


>   A couple of minor issues below.
>
>
>> ---
>>     New patch
>> ---
>>   docs/misc/arm/device-tree/guest.txt |  12 ++--
>>   xen/arch/arm/domain_build.c         | 108 ++++++++++++++++++++++--------------
>>   2 files changed, 73 insertions(+), 47 deletions(-)
>>
>> diff --git a/docs/misc/arm/device-tree/guest.txt b/docs/misc/arm/device-tree/guest.txt
>> index 418f1e9..c115751 100644
>> --- a/docs/misc/arm/device-tree/guest.txt
>> +++ b/docs/misc/arm/device-tree/guest.txt
>> @@ -7,10 +7,14 @@ the following properties:
>>   	compatible = "xen,xen-<version>", "xen,xen";
>>     where <version> is the version of the Xen ABI of the platform.
>>   
>> -- reg: specifies the base physical address and size of a region in
>> -  memory where the grant table should be mapped to, using an
>> -  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
>> -  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
>> +- reg: specifies the base physical address and size of the regions in memory
>> +  where the special resources should be mapped to, using an HYPERVISOR_memory_op
>> +  hypercall.
>> +  Region 0 is reserved for mapping grant table, it must be always present.
>> +  The memory region is large enough to map the whole grant table (it is larger
>> +  or equal to gnttab_max_grant_frames()).
>> +  Regions 1...N are extended regions (unused address space) for mapping foreign
>> +  GFNs and grants, they might be absent if there is nothing to expose.
>>     This property is unnecessary when booting Dom0 using ACPI.
>>   
>>   - interrupts: the interrupt used by Xen to inject event notifications.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index c5afbe2..d9f40d4 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -898,7 +898,10 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>>       if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>>           return 0;
>>   
>> -    /* Both start and size of the extended region should be 2MB aligned */
>> +    /*
>> +     * Both start and size of the extended region should be 2MB aligned to
>> +     * potentially allow superpage mapping.
>> +     */
>>       start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>>       if ( start > e )
>>           return 0;
>> @@ -909,6 +912,12 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>>        */
>>       e += 1;
>>       size = (e - start) & ~(SZ_2M - 1);
>> +
>> +    /*
>> +     * Reasonable size. Not too little to pick up small ranges which are
>> +     * not quite useful itself but increase bookkeeping and not too much
>                             ^ remove itself                             ^ large

ok


>
>> +     * to skip a large proportion of unused address space.
>> +     */
>>       if ( size < MB(64) )
>>           return 0;
>>   
>> @@ -919,6 +928,14 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Find unused regions of Host address space which can be exposed to Dom0
>> + * as extended regions for the special memory mappings. In order to calculate
>> + * regions we exclude every assigned to Dom0 region from the Host RAM:
>                                ^ region assigned  ^ remove

ok


>
>
>> + * - domain RAM
>> + * - reserved-memory
>> + * - grant table space
>> + */
>>   static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>                                             struct meminfo *ext_regions)
>>   {
>> @@ -942,7 +959,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>           res = rangeset_add_range(unalloc_mem, start, end - 1);
>>           if ( res )
>>           {
>> -            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                      start, end);
>>               goto out;
>>           }
>> @@ -956,7 +973,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>           res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>           if ( res )
>>           {
>> -            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                      start, end);
>>               goto out;
>>           }
>> @@ -971,7 +988,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>           res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>           if ( res )
>>           {
>> -            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                      start, end);
>>               goto out;
>>           }
>> @@ -983,7 +1000,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>       res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>       if ( res )
>>       {
>> -        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                  start, end);
>>           goto out;
>>       }
>> @@ -1003,6 +1020,35 @@ out:
>>       return res;
>>   }
>>   
>> +static int __init handle_pci_range(const struct dt_device_node *dev,
>> +                                   u64 addr, u64 len, void *data)
>> +{
>> +    struct rangeset *mem_holes = data;
>> +    paddr_t start, end;
>> +    int res;
>> +
>> +    start = addr & PAGE_MASK;
>> +    end = PAGE_ALIGN(addr + len);
>> +    res = rangeset_remove_range(mem_holes, start, end - 1);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>> +               start, end);
>> +        return res;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Find the holes in the Host DT which can be exposed to Dom0 as extended
>> + * regions for the special memory mappings. In order to calculate regions
>> + * we exclude every addressable memory region described by "reg" and "ranges"
>> + * properties from the maximum possible addressable physical memory range:
>> + * - MMIO
>> + * - Host RAM
>> + * - PCI bar
>          ^ PCI aperture

ok


>
>
>> + */
>>   static int __init find_memory_holes(const struct kernel_info *kinfo,
>>                                       struct meminfo *ext_regions)
>>   {
>> @@ -1024,7 +1070,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>       res = rangeset_add_range(mem_holes, start, end);
>>       if ( res )
>>       {
>> -        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>> +        printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                  start, end);
>>           goto out;
>>       }
>> @@ -1055,49 +1101,25 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>               res = rangeset_remove_range(mem_holes, start, end - 1);
>>               if ( res )
>>               {
>> -                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> +                printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>                          start, end);
>>                   goto out;
>>               }
>>           }
>>   
>> -        if ( dt_device_type_is_equal(np, "pci" ) )
>> +        if ( dt_device_type_is_equal(np, "pci") )
>>           {
>> -            unsigned int range_size, nr_ranges;
>> -            int na, ns, pna;
>> -            const __be32 *ranges;
>> -            u32 len;
>> -
>>               /*
>> -             * Looking for non-empty ranges property which in this context
>> -             * describes the PCI host bridge aperture.
>> +             * The ranges property in this context describes the PCI host
>> +             * bridge aperture. It shall be absent if no addresses are mapped
>> +             * through the bridge.
>>                */
>> -            ranges = dt_get_property(np, "ranges", &len);
>> -            if ( !ranges || !len )
>> +            if ( !dt_get_property(np, "ranges", NULL) )
>>                   continue;
>>   
>> -            pna = dt_n_addr_cells(np);
>> -            na = dt_child_n_addr_cells(np);
>> -            ns = dt_child_n_size_cells(np);
>> -            range_size = pna + na + ns;
>> -            nr_ranges = len / sizeof(__be32) / range_size;
>> -
>> -            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
>> -            {
>> -                /* Skip the child address and get the parent (CPU) address */
>> -                addr = dt_read_number(ranges + na, pna);
>> -                size = dt_read_number(ranges + na + pna, ns);
>> -
>> -                start = addr & PAGE_MASK;
>> -                end = PAGE_ALIGN(addr + size);
>> -                res = rangeset_remove_range(mem_holes, start, end - 1);
>> -                if ( res )
>> -                {
>> -                    printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>> -                           start, end);
>> -                    goto out;
>> -                }
>> -            }
>> +            res = dt_for_each_range(np, &handle_pci_range, mem_holes);
>> +            if ( res )
>> +                goto out;
>>           }
>>       }
>>   
>> @@ -1152,12 +1174,12 @@ static int __init make_hypervisor_node(struct domain *d,
>>   
>>       if ( !opt_ext_regions )
>>       {
>> -        printk(XENLOG_DEBUG "The extended regions support is disabled\n");
>> +        printk(XENLOG_INFO "The extended regions support is disabled\n");
>>           nr_ext_regions = 0;
>>       }
>>       else if ( is_32bit_domain(d) )
>>       {
>> -        printk(XENLOG_DEBUG "The extended regions are only supported for 64-bit guest currently\n");
>> +        printk(XENLOG_WARNING "The extended regions are only supported for 64-bit guest currently\n");
>>           nr_ext_regions = 0;
>>       }
>>       else
>> @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct domain *d,
>>           u64 start = ext_regions->bank[i].start;
>>           u64 size = ext_regions->bank[i].size;
>>   
>> -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> -                   i, start, start + size);
>> +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> +               i, start, start + size);
> Also should be PRIpaddr

I thought I needed to change specifier only for variables of type 
"paddr_t", but here "u64".


-- 
Regards,

Oleksandr Tyshchenko


