Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18F410BEC
	for <lists+xen-devel@lfdr.de>; Sun, 19 Sep 2021 16:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190146.339970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRxtp-0000nW-OB; Sun, 19 Sep 2021 14:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190146.339970; Sun, 19 Sep 2021 14:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRxtp-0000kr-Kv; Sun, 19 Sep 2021 14:34:33 +0000
Received: by outflank-mailman (input) for mailman id 190146;
 Sun, 19 Sep 2021 14:34:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mRxto-0000kl-3K
 for xen-devel@lists.xenproject.org; Sun, 19 Sep 2021 14:34:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRxtm-0007dz-6t; Sun, 19 Sep 2021 14:34:30 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRxtl-0004OE-QA; Sun, 19 Sep 2021 14:34:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NPqax0K85Rn1tgWNrKuhFMIiw0yhsK7RuuSCpIkX8ps=; b=p3kSlH9ib9c8OTLnkgH9errBHl
	9m19AFSol0ubA9WqOghaB3IURuY44+cxN7sBU0ZRXCLp8QxemHk6S45yj//BQkfqUyoUy3P9zW+4f
	HnQnutgwiAFOUI2S5q7ZX+j+o704u5BtAdMwjQh6KIzF49Nfej/ri68NyAkc83iN527E=;
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
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
From: Julien Grall <julien@xen.org>
Message-ID: <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
Date: Sun, 19 Sep 2021 19:34:23 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 18/09/2021 03:37, Stefano Stabellini wrote:
> On Fri, 17 Sep 2021, Stefano Stabellini wrote:
>> On Fri, 17 Sep 2021, Oleksandr wrote:
>>>>> +
>>>>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>>>>> +
>>>>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>>>>> +    if ( !unalloc_mem )
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    /* Start with all available RAM */
>>>>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>>>> +    {
>>>>> +        start = bootinfo.mem.bank[i].start;
>>>>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
>>>>> +        res = rangeset_add_range(unalloc_mem, start, end);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>>> +                   start, end);
>>>>> +            goto out;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* Remove RAM assigned to Dom0 */
>>>>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>>>> +    {
>>>>> +        start = assign_mem->bank[i].start;
>>>>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
>>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>> +                   start, end);
>>>>> +            goto out;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* Remove reserved-memory regions */
>>>>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>>>>> +    {
>>>>> +        start = bootinfo.reserved_mem.bank[i].start;
>>>>> +        end = bootinfo.reserved_mem.bank[i].start +
>>>>> +            bootinfo.reserved_mem.bank[i].size - 1;
>>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>> +                   start, end);
>>>>> +            goto out;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* Remove grant table region */
>>>>> +    start = kinfo->gnttab_start;
>>>>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>>>>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>>>>> +    if ( res )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>>>> +               start, end);
>>>>> +        goto out;
>>>>> +    }
>>>>> +
>>>>> +    start = EXT_REGION_START;
>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>>>>> +                                 add_ext_regions, ext_regions);
>>>>> +    if ( res )
>>>>> +        ext_regions->nr_banks = 0;
>>>>> +    else if ( !ext_regions->nr_banks )
>>>>> +        res = -ENOENT;
>>>>> +
>>>>> +out:
>>>>> +    rangeset_destroy(unalloc_mem);
>>>>> +
>>>>> +    return res;
>>>>> +}
>>>>> +
>>>>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>> +                                    struct meminfo *ext_regions)
>>>>> +{
>>>>> +    struct dt_device_node *np;
>>>>> +    struct rangeset *mem_holes;
>>>>> +    paddr_t start, end;
>>>>> +    unsigned int i;
>>>>> +    int res;
>>>>> +
>>>>> +    dt_dprintk("Find memory holes for extended regions\n");
>>>>> +
>>>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>>>> +    if ( !mem_holes )
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    /* Start with maximum possible addressable physical memory range */
>>>>> +    start = EXT_REGION_START;
>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>>> +    res = rangeset_add_range(mem_holes, start, end);
>>>>> +    if ( res )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>>> +               start, end);
>>>>> +        goto out;
>>>>> +    }
>>>>> +
>>>>> +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
>>>>
>>>> Well... The loop below is not going to handle all the regions described in
>>>> the property "reg". Instead, it will cover a subset of "reg" where the
>>>> memory is addressable.
>>>
>>> As I understand, we are only interested in subset of "reg" where the memory is
>>> addressable.
>>>
>>>
>>>>
>>>>
>>>> You will also need to cover "ranges" that will describe the BARs for the PCI
>>>> devices.
>>> Good point.
>>
>> Yes, very good point!
>>
>>
>>> Could you please clarify how to recognize whether it is a PCI
>>> device as long as PCI support is not merged? Or just to find any device nodes
>>> with non-empty "ranges" property
>>> and retrieve addresses?
>>
>> Normally any bus can have a ranges property with the aperture and
>> possible address translations, including /amba (compatible =
>> "simple-bus"). However, in these cases dt_device_get_address already
>> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
>>
>> The PCI bus is special for 2 reasons:
>> - the ranges property has a different format
>> - the bus is hot-pluggable
>>
>> So I think the only one that we need to treat specially is PCI.
>>
>> As far as I am aware PCI is the only bus (or maybe just the only bus
>> that we support?) where ranges means the aperture.
> 
> Now that I think about this, there is another "hotpluggable" scenario we
> need to think about:
> 
> [1] https://marc.info/?l=xen-devel&m=163056546214978
> 
> Xilinx devices have FPGA regions with apertures currently not described
> in device tree, where things can programmed in PL at runtime making new
> devices appear with new MMIO regions out of thin air.
> 
> Now let me start by saying that yes, the entire programmable region
> aperture could probably be described in device tree, however, in
> reality it is not currently done in any of the device trees we use
> (including the upstream device trees in linux.git).

This is rather annoying, but not unheard. There are a couple of 
platforms where the MMIOs are not fully described in the DT.

In fact, we have a callback 'specific_mappings' which create additional 
mappings (e.g. on the omap5) for dom0.

> 
> So, we have a problem :-(
> 
> 
> I can work toward getting the right info on device tree, but in reality
> that is going to take time and for now the device tree doesn't have the
> FPGA aperture in it. So if we accept this series as is, it is going to
> stop features like [1] from working. >
> If we cannot come up with any better plans, I think it would be better
> to drop find_memory_holes, only rely on find_unallocated_memory even
> when the IOMMU is on. One idea is that we could add on top of the
> regions found by find_unallocated_memory any MMIO regions marked as
> xen,passthrough: they are safe because they are not going to dom0 anyway.

(Oleksandr, it looks like some rationale about the different approach is 
missing in the commit message. Can you add it?)

When the IOMMU is on, Xen will do an extra mapping with GFN == MFN for 
every grant mapping in dom0. This is because Linux will always program 
the device with the MFN as it doesn't know whether the device has been 
protected by the hypervisor.

Therefore we can't use find_unallocated_memory() with the IOMMU on as it 
stands.

> 
> The only alternative I can think of is to have a per-board
> enable/disable toggle for the extend region but it would be very ugly.
At least, for your board, you seem to know the list of regions that are 
reserved for future use. So how about adding a per-board list of regions 
that should not be allocated?

This will also include anything mentioned in 'specific_mappings'.

Cheers,

-- 
Julien Grall

