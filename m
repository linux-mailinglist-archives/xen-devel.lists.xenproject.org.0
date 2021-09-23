Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E1415BCA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193608.344864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLgB-0004nd-2h; Thu, 23 Sep 2021 10:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193608.344864; Thu, 23 Sep 2021 10:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLgA-0004ka-VG; Thu, 23 Sep 2021 10:10:10 +0000
Received: by outflank-mailman (input) for mailman id 193608;
 Thu, 23 Sep 2021 10:10:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTLg8-0004kT-Th
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:10:08 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8b089b8-8929-41d8-980d-71910081bfd3;
 Thu, 23 Sep 2021 10:10:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e15so24421161lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 03:10:07 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q2sm322992lfm.306.2021.09.23.03.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:10:05 -0700 (PDT)
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
X-Inumbo-ID: a8b089b8-8929-41d8-980d-71910081bfd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lOLKsC7QU6uW8UPH3QxwQddTYgFfgaG2iDWPw7J8H98=;
        b=OlJMvU4ZCXrM3UsHVnf9+ZcErpogjdDpGTxh99kuEufDK/3JUXUIpkBS+zIwZIH1cS
         PgR5C19VzKFbIfi/ir7Eydr/nURhxSHOcyuKNXweAxXwbFOG6kbKv2eijp2Zl9tpzvxP
         /s1QK3z1x8+xmm85CY2h2NZvxUWK2l3Zhva4AluZQpccF7lSLk6JjFrbq7Bo3/IFBr1O
         9luTcYZznpxU+x1UGrvY6tc9ZUoX1z3vni3vJ+QXmdWDSskIVs1/mxS96CvDB2xed8iN
         d2oWW2ifWj/+rGlZEJwchq4BPand+W/IKiwVXgldvlnbXWHMNwyB2StwZWiisCwcQIsI
         /KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lOLKsC7QU6uW8UPH3QxwQddTYgFfgaG2iDWPw7J8H98=;
        b=BHSoCQAAsxlmQC+ePFunsqgkL1YF0zDSQzfVgsOZX4dWyTEqXsyirkRpaX19xpc8bx
         hpDd2wRhTBsspM3JTQaPCs/4rimskZJpBYDqKEfzG1hwsNU2vGXrpImrKasD9oEKfxWt
         q7SmMLHpfxXAZZFsPP8TapN+URCrMOislJWwJQuXomSf8tAxX51LIuIo9oAU62gcJzC0
         btCDq0F/OGpXmIL7gbsd73dtSHrF4KL2taKxbbpFFLJtzSkOor9o0XfUyQwMDNleVWax
         VCFSRYBgvaFetYB9RwZMQOdWj+jqbjPaJzN1KxxhHJmG+vox4bT/d+ulaQFZdNY3ZMU/
         O88g==
X-Gm-Message-State: AOAM530Kkufqg3vV8P9gkW6Yy3UvYHiITwV3mI5EcOfZebsMyvZ3zNiV
	Knbt0kU6wet8qgDzkXyNTt4=
X-Google-Smtp-Source: ABdhPJxjKo/smQaTt2FedPGvDnyq0u1oWSXNTOJ5e+8VMD45ubQG6sBSN0YYQK9BXX9oNowfIMkEQg==
X-Received: by 2002:a05:651c:88b:: with SMTP id d11mr4328212ljq.126.1632391805873;
        Thu, 23 Sep 2021 03:10:05 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, fnuv@xilinx.com
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109171459200.21985@sstabellini-ThinkPad-T480s>
 <2a1cf877-60a3-c8c5-8982-51ef3606b977@xen.org>
 <1a2cd4d2-7ec3-266a-9cba-e4ab49c3aaef@gmail.com>
 <alpine.DEB.2.21.2109201619020.17979@sstabellini-ThinkPad-T480s>
 <df9e2f08-b21c-902c-673a-1d690088a98b@gmail.com>
 <alpine.DEB.2.21.2109211439370.17979@sstabellini-ThinkPad-T480s>
 <1ac58681-ef42-bb32-25b6-620d51d4f075@gmail.com>
 <alpine.DEB.2.21.2109221349350.17979@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5e2dd68c-0d17-a564-fd87-e635044a8cbf@gmail.com>
Date: Thu, 23 Sep 2021 13:10:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109221349350.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 22.09.21 23:50, Stefano Stabellini wrote:

Hi Stefano.

> On Wed, 22 Sep 2021, Oleksandr wrote:
>> On 22.09.21 01:00, Stefano Stabellini wrote:
>>> On Tue, 21 Sep 2021, Oleksandr wrote:
>>>> On 21.09.21 02:21, Stefano Stabellini wrote:
>>>>> On Sun, 19 Sep 2021, Oleksandr wrote:
>>>>>>> On 18/09/2021 03:37, Stefano Stabellini wrote:
>>>>>>>> On Fri, 17 Sep 2021, Stefano Stabellini wrote:
>>>>>>>>> On Fri, 17 Sep 2021, Oleksandr wrote:
>>>>>>>>>>>> +
>>>>>>>>>>>> +    dt_dprintk("Find unallocated memory for extended
>>>>>>>>>>>> regions\n");
>>>>>>>>>>>> +
>>>>>>>>>>>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>>>>>>>>>>>> +    if ( !unalloc_mem )
>>>>>>>>>>>> +        return -ENOMEM;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Start with all available RAM */
>>>>>>>>>>>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        start = bootinfo.mem.bank[i].start;
>>>>>>>>>>>> +        end = bootinfo.mem.bank[i].start +
>>>>>>>>>>>> bootinfo.mem.bank[i].size - 1;
>>>>>>>>>>>> +        res = rangeset_add_range(unalloc_mem, start,
>>>>>>>>>>>> end);
>>>>>>>>>>>> +        if ( res )
>>>>>>>>>>>> +        {
>>>>>>>>>>>> +            printk(XENLOG_ERR "Failed to add:
>>>>>>>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>>>>>>>> +                   start, end);
>>>>>>>>>>>> +            goto out;
>>>>>>>>>>>> +        }
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Remove RAM assigned to Dom0 */
>>>>>>>>>>>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        start = assign_mem->bank[i].start;
>>>>>>>>>>>> +        end = assign_mem->bank[i].start +
>>>>>>>>>>>> assign_mem->bank[i].size - 1;
>>>>>>>>>>>> +        res = rangeset_remove_range(unalloc_mem, start,
>>>>>>>>>>>> end);
>>>>>>>>>>>> +        if ( res )
>>>>>>>>>>>> +        {
>>>>>>>>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>>>>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>>>>>>>> +                   start, end);
>>>>>>>>>>>> +            goto out;
>>>>>>>>>>>> +        }
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Remove reserved-memory regions */
>>>>>>>>>>>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++
>>>>>>>>>>>> )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        start = bootinfo.reserved_mem.bank[i].start;
>>>>>>>>>>>> +        end = bootinfo.reserved_mem.bank[i].start +
>>>>>>>>>>>> +            bootinfo.reserved_mem.bank[i].size - 1;
>>>>>>>>>>>> +        res = rangeset_remove_range(unalloc_mem, start,
>>>>>>>>>>>> end);
>>>>>>>>>>>> +        if ( res )
>>>>>>>>>>>> +        {
>>>>>>>>>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>>>>>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>>>>>>>> +                   start, end);
>>>>>>>>>>>> +            goto out;
>>>>>>>>>>>> +        }
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Remove grant table region */
>>>>>>>>>>>> +    start = kinfo->gnttab_start;
>>>>>>>>>>>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>>>>>>>>>>>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>>>>>>>>>>>> +    if ( res )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        printk(XENLOG_ERR "Failed to remove:
>>>>>>>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>>>>>>>> +               start, end);
>>>>>>>>>>>> +        goto out;
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    start = EXT_REGION_START;
>>>>>>>>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1,
>>>>>>>>>>>> EXT_REGION_END);
>>>>>>>>>>>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>>>>>>>>>>>> +                                 add_ext_regions,
>>>>>>>>>>>> ext_regions);
>>>>>>>>>>>> +    if ( res )
>>>>>>>>>>>> +        ext_regions->nr_banks = 0;
>>>>>>>>>>>> +    else if ( !ext_regions->nr_banks )
>>>>>>>>>>>> +        res = -ENOENT;
>>>>>>>>>>>> +
>>>>>>>>>>>> +out:
>>>>>>>>>>>> +    rangeset_destroy(unalloc_mem);
>>>>>>>>>>>> +
>>>>>>>>>>>> +    return res;
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +static int __init find_memory_holes(const struct
>>>>>>>>>>>> kernel_info
>>>>>>>>>>>> *kinfo,
>>>>>>>>>>>> +                                    struct meminfo
>>>>>>>>>>>> *ext_regions)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +    struct dt_device_node *np;
>>>>>>>>>>>> +    struct rangeset *mem_holes;
>>>>>>>>>>>> +    paddr_t start, end;
>>>>>>>>>>>> +    unsigned int i;
>>>>>>>>>>>> +    int res;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    dt_dprintk("Find memory holes for extended
>>>>>>>>>>>> regions\n");
>>>>>>>>>>>> +
>>>>>>>>>>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>>>>>>>>>>> +    if ( !mem_holes )
>>>>>>>>>>>> +        return -ENOMEM;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Start with maximum possible addressable physical
>>>>>>>>>>>> memory
>>>>>>>>>>>> range */
>>>>>>>>>>>> +    start = EXT_REGION_START;
>>>>>>>>>>>> +    end = min((1ULL << p2m_ipa_bits) - 1,
>>>>>>>>>>>> EXT_REGION_END);
>>>>>>>>>>>> +    res = rangeset_add_range(mem_holes, start, end);
>>>>>>>>>>>> +    if ( res )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        printk(XENLOG_ERR "Failed to add:
>>>>>>>>>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>>>>>>>>>> +               start, end);
>>>>>>>>>>>> +        goto out;
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    /* Remove all regions described by "reg" property
>>>>>>>>>>>> (MMIO,
>>>>>>>>>>>> RAM,
>>>>>>>>>>>> etc) */
>>>>>>>>>>> Well... The loop below is not going to handle all the
>>>>>>>>>>> regions
>>>>>>>>>>> described in
>>>>>>>>>>> the property "reg". Instead, it will cover a subset of "reg"
>>>>>>>>>>> where
>>>>>>>>>>> the
>>>>>>>>>>> memory is addressable.
>>>>>>>>>> As I understand, we are only interested in subset of "reg"
>>>>>>>>>> where
>>>>>>>>>> the
>>>>>>>>>> memory is
>>>>>>>>>> addressable.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> You will also need to cover "ranges" that will describe the
>>>>>>>>>>> BARs
>>>>>>>>>>> for
>>>>>>>>>>> the PCI
>>>>>>>>>>> devices.
>>>>>>>>>> Good point.
>>>>>>>>> Yes, very good point!
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Could you please clarify how to recognize whether it is a PCI
>>>>>>>>>> device as long as PCI support is not merged? Or just to find
>>>>>>>>>> any
>>>>>>>>>> device nodes
>>>>>>>>>> with non-empty "ranges" property
>>>>>>>>>> and retrieve addresses?
>>>>>>>>> Normally any bus can have a ranges property with the aperture
>>>>>>>>> and
>>>>>>>>> possible address translations, including /amba (compatible =
>>>>>>>>> "simple-bus"). However, in these cases dt_device_get_address
>>>>>>>>> already
>>>>>>>>> takes care of it, see
>>>>>>>>> xen/common/device_tree.c:dt_device_get_address.
>>>>>>>>>
>>>>>>>>> The PCI bus is special for 2 reasons:
>>>>>>>>> - the ranges property has a different format
>>>>>>>>> - the bus is hot-pluggable
>>>>>>>>>
>>>>>>>>> So I think the only one that we need to treat specially is PCI.
>>>>>>>>>
>>>>>>>>> As far as I am aware PCI is the only bus (or maybe just the only
>>>>>>>>> bus
>>>>>>>>> that we support?) where ranges means the aperture.
>>>>>>>> Now that I think about this, there is another "hotpluggable"
>>>>>>>> scenario
>>>>>>>> we
>>>>>>>> need to think about:
>>>>>>>>
>>>>>>>> [1] https://marc.info/?l=xen-devel&m=163056546214978
>>>>>>>>
>>>>>>>> Xilinx devices have FPGA regions with apertures currently not
>>>>>>>> described
>>>>>>>> in device tree, where things can programmed in PL at runtime
>>>>>>>> making
>>>>>>>> new
>>>>>>>> devices appear with new MMIO regions out of thin air.
>>>>>>>>
>>>>>>>> Now let me start by saying that yes, the entire programmable
>>>>>>>> region
>>>>>>>> aperture could probably be described in device tree, however, in
>>>>>>>> reality it is not currently done in any of the device trees we use
>>>>>>>> (including the upstream device trees in linux.git).
>>>>>>> This is rather annoying, but not unheard. There are a couple of
>>>>>>> platforms
>>>>>>> where the MMIOs are not fully described in the DT.
>>>>>>>
>>>>>>> In fact, we have a callback 'specific_mappings' which create
>>>>>>> additional
>>>>>>> mappings (e.g. on the omap5) for dom0.
>>>>>>>
>>>>>>>> So, we have a problem :-(
>>>>>>>>
>>>>>>>>
>>>>>>>> I can work toward getting the right info on device tree, but in
>>>>>>>> reality
>>>>>>>> that is going to take time and for now the device tree doesn't
>>>>>>>> have
>>>>>>>> the
>>>>>>>> FPGA aperture in it. So if we accept this series as is, it is
>>>>>>>> going to
>>>>>>>> stop features like [1] from working. >
>>>>>>>> If we cannot come up with any better plans, I think it would be
>>>>>>>> better
>>>>>>>> to drop find_memory_holes, only rely on find_unallocated_memory
>>>>>>>> even
>>>>>>>> when the IOMMU is on. One idea is that we could add on top of the
>>>>>>>> regions found by find_unallocated_memory any MMIO regions marked
>>>>>>>> as
>>>>>>>> xen,passthrough: they are safe because they are not going to dom0
>>>>>>>> anyway.
>>>>>>> (Oleksandr, it looks like some rationale about the different
>>>>>>> approach is
>>>>>>> missing in the commit message. Can you add it?)
>>>>>> Yes sure, but let me please clarify what is different approach in this
>>>>>> context. Is it to *also* take into the account MMIO regions of the
>>>>>> devices
>>>>>> for
>>>>>> passthrough for case when IOMMU is off (in addition to unallocated
>>>>>> memory)? If
>>>>>> yes, I wonder whether we will gain much with that according to that
>>>>>> device's
>>>>>> MMIO regions are usually not big enough and we stick to allocate
>>>>>> extended
>>>>>> regions with bigger size (> 64MB).
>>>>> That's fair enough. There are a couple of counter examples where the
>>>>> MMIO regions for the device to assign are quite large, for instance a
>>>>> GPU, Xilinx AIEngine, or the PCIe Root Complex with the entire aperture,
>>>>> but maybe they are not that common. I am not sure if it is worth
>>>>> scanning the tree for xen,passthrough regions every time at boot for
>>>>> this.
>>>> ok, I will add a few sentences to commit message about this different
>>>> approach
>>>> for now. At least this could be implemented later on if there is a need.
>>> One thing that worries me about this is that if we take an old Xen with
>>> this series and run it on a new board, it might cause problems. At the
>>> very least [1] wouldn't work.
>> I got it.
>>
>>
>>> Can we have a Xen command line argument to disable extended regions as
>>> an emergecy toggle?
>> I think, yes. If no preference for the argument name I will name it
>> "no-ext-region".
> It is better to introduce it as ext-regions=yes/no with yes as default.
> So that in the future we could extending it to ext-regions=start,size if
> we wanted to.

ok, will do


-- 
Regards,

Oleksandr Tyshchenko


