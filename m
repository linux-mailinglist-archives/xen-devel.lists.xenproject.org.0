Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D81410D43
	for <lists+xen-devel@lfdr.de>; Sun, 19 Sep 2021 22:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190192.340021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mS3Gw-0003Pv-QS; Sun, 19 Sep 2021 20:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190192.340021; Sun, 19 Sep 2021 20:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mS3Gw-0003O6-Lp; Sun, 19 Sep 2021 20:18:46 +0000
Received: by outflank-mailman (input) for mailman id 190192;
 Sun, 19 Sep 2021 20:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iuPp=OJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mS3Gv-0003O0-SI
 for xen-devel@lists.xenproject.org; Sun, 19 Sep 2021 20:18:45 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df83c6be-9939-491e-af7e-4e8b353c693e;
 Sun, 19 Sep 2021 20:18:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b15so39817220lfe.7
 for <xen-devel@lists.xenproject.org>; Sun, 19 Sep 2021 13:18:43 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z21sm1483076ljh.114.2021.09.19.13.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 13:18:42 -0700 (PDT)
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
X-Inumbo-ID: df83c6be-9939-491e-af7e-4e8b353c693e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pvIxQwiFj2vWD+5A5po5dfBhxIeOOD0+fMUphus6ujM=;
        b=PoliQTllbWACCNEqHkl9HQHngnLIC8OhFXPcLcJiQa8vTz+j0i1yDxdvwcwP0BBJmh
         vy9HbTi+QJ7i35Lni6CH3JmtoKN2wQgBXbO3OTdMInayhOwDE2uFR1pAJMvf3vecqqsY
         sio1Ul+e7eWPRY5jBZY5X/M/G1gdlewKPgxjBtldc4Sff0bAhFaEdadMxjr0QPOMvNwN
         nPYWo0pa4e1GvUjU4Hs7uE8gi9tyjiJBbzhrtr6B8c0OwK5JDJkgxlYg9n3Ai4nLCO69
         5/SYjb9gSE/+aNsXmL+K6uG74paxHWf+AFWjmAtbH/yT0KJGGpTwD31Ymk820K8VwgbO
         HUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pvIxQwiFj2vWD+5A5po5dfBhxIeOOD0+fMUphus6ujM=;
        b=X1lHrsgQNXjcGfUKU/qMw746bmbEYX17KGsFDfOT3ZE9ai4zhyFR/eQho9knUuPOOK
         PFafy1H3BOEVrjQ1gzm7OYmu33r7iTJ4MBuR2Mbn+bBhzOYnd/0rrZU3N1v1QILBpN/t
         0Uop0MF21Mkp0n7yT2XgRFfOC1XAfRN1sU95OoNmi0i3e9zMh8sKNS0jiK4474WoKOaD
         r9BSIfbZFPQKQ/4B1BKpM7xb4N5tn66ZuQyjRJDtxf+HLrXuPlbzNpS+JwCdgH0t+bzv
         AQ0eWwnphsxmWDEUiLbSl2eWpwW3sYxrks3aA/g85OIYDTIF1GDNcR75B8ukvXc765cH
         sRng==
X-Gm-Message-State: AOAM532N1QEHGAip5kR9fRbH3ftQskkxbs2Jcxv3gIE7RzGDsWJu3agc
	qsFQpu8Mv2TTQspOsfCHzyQ=
X-Google-Smtp-Source: ABdhPJziqN3oySqSk0sELbHySfDZIh5FEm0a+3K6x6Rl+vJMZh2uXYrSJLUumt0/BG0c5SByUOfk5g==
X-Received: by 2002:ac2:5451:: with SMTP id d17mr15835549lfn.367.1632082722891;
        Sun, 19 Sep 2021 13:18:42 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s>
 <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1a2cd4d2-7ec3-266a-9cba-e4ab49c3aaef@gmail.com>
Date: Sun, 19 Sep 2021 23:18:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 19.09.21 17:34, Julien Grall wrote:



> Hi Stefano,

Hi Julien


>
> On 18/09/2021 03:37, Stefano Stabellini wrote:
>> On Fri, 17 Sep 2021, Stefano Stabellini wrote:
>>> On Fri, 17 Sep 2021, Oleksandr wrote:
>>>>>> +
>>>>>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>>>>>> +
>>>>>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>>>>>> +    if ( !unalloc_mem )
>>>>>> +        return -ENOMEM;
>>>>>> +
>>>>>> +    /* Start with all available RAM */
>>>>>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>>>>> +    {
>>>>>> +        start = bootinfo.mem.bank[i].start;
>>>>>> +        end = bootinfo.mem.bank[i].start + 
>>>>>> bootinfo.mem.bank[i].size - 1;
>>>>>> +        res = rangeset_add_range(unalloc_mem, start, end);
>>>>>> +        if ( res )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "Failed to add: 
>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +                   start, end);
>>>>>> +            goto out;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Remove RAM assigned to Dom0 */
>>>>>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>>>>> +    {
>>>>>> +        start = assign_mem->bank[i].start;
>>>>>> +        end = assign_mem->bank[i].start + 
>>>>>> assign_mem->bank[i].size - 1;
>>>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>>>> +        if ( res )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +                   start, end);
>>>>>> +            goto out;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Remove reserved-memory regions */
>>>>>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>>>>>> +    {
>>>>>> +        start = bootinfo.reserved_mem.bank[i].start;
>>>>>> +        end = bootinfo.reserved_mem.bank[i].start +
>>>>>> +            bootinfo.reserved_mem.bank[i].size - 1;
>>>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>>>> +        if ( res )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +                   start, end);
>>>>>> +            goto out;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Remove grant table region */
>>>>>> +    start = kinfo->gnttab_start;
>>>>>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>>>>>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>>>>>> +    if ( res )
>>>>>> +    {
>>>>>> +        printk(XENLOG_ERR "Failed to remove: 
>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +               start, end);
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +
>>>>>> +    start = EXT_REGION_START;
>>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>>>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>>>>>> +                                 add_ext_regions, ext_regions);
>>>>>> +    if ( res )
>>>>>> +        ext_regions->nr_banks = 0;
>>>>>> +    else if ( !ext_regions->nr_banks )
>>>>>> +        res = -ENOENT;
>>>>>> +
>>>>>> +out:
>>>>>> +    rangeset_destroy(unalloc_mem);
>>>>>> +
>>>>>> +    return res;
>>>>>> +}
>>>>>> +
>>>>>> +static int __init find_memory_holes(const struct kernel_info 
>>>>>> *kinfo,
>>>>>> +                                    struct meminfo *ext_regions)
>>>>>> +{
>>>>>> +    struct dt_device_node *np;
>>>>>> +    struct rangeset *mem_holes;
>>>>>> +    paddr_t start, end;
>>>>>> +    unsigned int i;
>>>>>> +    int res;
>>>>>> +
>>>>>> +    dt_dprintk("Find memory holes for extended regions\n");
>>>>>> +
>>>>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>>>>> +    if ( !mem_holes )
>>>>>> +        return -ENOMEM;
>>>>>> +
>>>>>> +    /* Start with maximum possible addressable physical memory 
>>>>>> range */
>>>>>> +    start = EXT_REGION_START;
>>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>>>> +    res = rangeset_add_range(mem_holes, start, end);
>>>>>> +    if ( res )
>>>>>> +    {
>>>>>> +        printk(XENLOG_ERR "Failed to add: 
>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +               start, end);
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Remove all regions described by "reg" property (MMIO, 
>>>>>> RAM, etc) */
>>>>>
>>>>> Well... The loop below is not going to handle all the regions 
>>>>> described in
>>>>> the property "reg". Instead, it will cover a subset of "reg" where 
>>>>> the
>>>>> memory is addressable.
>>>>
>>>> As I understand, we are only interested in subset of "reg" where 
>>>> the memory is
>>>> addressable.
>>>>
>>>>
>>>>>
>>>>>
>>>>> You will also need to cover "ranges" that will describe the BARs 
>>>>> for the PCI
>>>>> devices.
>>>> Good point.
>>>
>>> Yes, very good point!
>>>
>>>
>>>> Could you please clarify how to recognize whether it is a PCI
>>>> device as long as PCI support is not merged? Or just to find any 
>>>> device nodes
>>>> with non-empty "ranges" property
>>>> and retrieve addresses?
>>>
>>> Normally any bus can have a ranges property with the aperture and
>>> possible address translations, including /amba (compatible =
>>> "simple-bus"). However, in these cases dt_device_get_address already
>>> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
>>>
>>> The PCI bus is special for 2 reasons:
>>> - the ranges property has a different format
>>> - the bus is hot-pluggable
>>>
>>> So I think the only one that we need to treat specially is PCI.
>>>
>>> As far as I am aware PCI is the only bus (or maybe just the only bus
>>> that we support?) where ranges means the aperture.
>>
>> Now that I think about this, there is another "hotpluggable" scenario we
>> need to think about:
>>
>> [1] https://marc.info/?l=xen-devel&m=163056546214978
>>
>> Xilinx devices have FPGA regions with apertures currently not described
>> in device tree, where things can programmed in PL at runtime making new
>> devices appear with new MMIO regions out of thin air.
>>
>> Now let me start by saying that yes, the entire programmable region
>> aperture could probably be described in device tree, however, in
>> reality it is not currently done in any of the device trees we use
>> (including the upstream device trees in linux.git).
>
> This is rather annoying, but not unheard. There are a couple of 
> platforms where the MMIOs are not fully described in the DT.
>
> In fact, we have a callback 'specific_mappings' which create 
> additional mappings (e.g. on the omap5) for dom0.
>
>>
>> So, we have a problem :-(
>>
>>
>> I can work toward getting the right info on device tree, but in reality
>> that is going to take time and for now the device tree doesn't have the
>> FPGA aperture in it. So if we accept this series as is, it is going to
>> stop features like [1] from working. >
>> If we cannot come up with any better plans, I think it would be better
>> to drop find_memory_holes, only rely on find_unallocated_memory even
>> when the IOMMU is on. One idea is that we could add on top of the
>> regions found by find_unallocated_memory any MMIO regions marked as
>> xen,passthrough: they are safe because they are not going to dom0 
>> anyway.
>
> (Oleksandr, it looks like some rationale about the different approach 
> is missing in the commit message. Can you add it?)

Yes sure, but let me please clarify what is different approach in this 
context. Is it to *also* take into the account MMIO regions of the 
devices for passthrough for case when IOMMU is off (in addition to 
unallocated memory)? If yes, I wonder whether we will gain much with 
that according to that device's MMIO regions are usually not big enough 
and we stick to allocate extended regions with bigger size (> 64MB).


>
>
> When the IOMMU is on, Xen will do an extra mapping with GFN == MFN for 
> every grant mapping in dom0. This is because Linux will always program 
> the device with the MFN as it doesn't know whether the device has been 
> protected by the hypervisor.
>
> Therefore we can't use find_unallocated_memory() with the IOMMU on as 
> it stands.
>
>>
>> The only alternative I can think of is to have a per-board
>> enable/disable toggle for the extend region but it would be very ugly.
> At least, for your board, you seem to know the list of regions that 
> are reserved for future use. So how about adding a per-board list of 
> regions that should not be allocated?
>
> This will also include anything mentioned in 'specific_mappings'.
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


