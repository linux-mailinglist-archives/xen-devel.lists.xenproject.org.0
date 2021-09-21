Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077D413AE3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 21:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191875.342019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSlfb-0000dW-JW; Tue, 21 Sep 2021 19:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191875.342019; Tue, 21 Sep 2021 19:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSlfb-0000b2-GQ; Tue, 21 Sep 2021 19:43:11 +0000
Received: by outflank-mailman (input) for mailman id 191875;
 Tue, 21 Sep 2021 19:43:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aS0w=OL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mSlfa-0000ad-4U
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 19:43:10 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c28d9ec-10e7-4e97-a77b-7bb88d92e38c;
 Tue, 21 Sep 2021 19:43:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y28so2287016lfb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 12:43:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y32sm1589020lfa.171.2021.09.21.12.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:43:07 -0700 (PDT)
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
X-Inumbo-ID: 6c28d9ec-10e7-4e97-a77b-7bb88d92e38c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Gn/9MMD+lIm5s/bvzqWXUO99oDTImbcpJ6nNxz3pWUY=;
        b=IYvy+pKq+jVPWuXihjEuNNhU5SUrrLxqfECkYSBvQC43m4XNm+3IzLGBopysvAODen
         iGhnpOVKc4AaW1lias53UuPcm0HqB4eliYJrL9y0bw8lhAvttkUBsWB33OJjUhphteRy
         e+j4AluLf8tnlGU+Ikp5LOuCRWMybzYEUBrT4nu6UGWLU10iBVh86Ox+keZW//F5yDQo
         j0qYa/TPnGljHITZLfDy1VBWIpn/wlrs2u21FX+PUkwkuM+BZgNaDyxBeO9qU+18Q51e
         OEG9x+VG4iZKcrD2Wc9YN6iboGXoKrfWjKQXtP2MrFgU2pGNUNgnsa3dQdSozlMYffBf
         rbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Gn/9MMD+lIm5s/bvzqWXUO99oDTImbcpJ6nNxz3pWUY=;
        b=66uHOh8Sl5QKreX2+Bud0/DRhBvJuQ0lybGiHIe+s9P2OKqvMzKMZGW2A74ZRZnR0b
         lvRiU8/36CHfiSgWMcisw8Wq/Fqcp6koMJx/0+2d4XgtktpnuMH5zs+mSCFEJ9W5zksY
         aeLRTlG7/nz4BOY9KDtP3Q7yx0u2w7QBC3M7ASTyapVIJ8bqFdLNncasI7PdTVFgn+Z6
         2zz+8Hp46fApdv1rR2Lkgnrpmt4YN3j+fBrn3u5fcMovJfOc/f1NPGXjKc7L/sbkY5f4
         qVnbHeA8GItRH2rOAbf6a73zQjcy4kHoeo2WfUMDy7vzxRt/BGHz6ryYCENYcLooCMJC
         XsSw==
X-Gm-Message-State: AOAM531IBSjPZ4iZJwCvQ0v8hlfcdh4mzFrLQiRVY4tgbxExwr1taj7+
	OWkdg263iA2I3iIGUeFBo28=
X-Google-Smtp-Source: ABdhPJxo8Dzr7HhmpYwOAWh4FSnBDNUC2xpiyznNVZBRDzUoTO4oAK3+K0qwB9R/pkwEJYca1w0kUg==
X-Received: by 2002:a2e:2a06:: with SMTP id q6mr28912275ljq.424.1632253387596;
        Tue, 21 Sep 2021 12:43:07 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a993466f-1b7d-ceb3-aa3b-16f5f145b2fb@gmail.com>
Date: Tue, 21 Sep 2021 22:43:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.09.21 00:56, Stefano Stabellini wrote:

Hi Stefano

> On Fri, 17 Sep 2021, Oleksandr wrote:
>>>> +
>>>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>>>> +
>>>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>>>> +    if ( !unalloc_mem )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /* Start with all available RAM */
>>>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>>> +    {
>>>> +        start = bootinfo.mem.bank[i].start;
>>>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
>>>> +        res = rangeset_add_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove RAM assigned to Dom0 */
>>>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>>> +    {
>>>> +        start = assign_mem->bank[i].start;
>>>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove reserved-memory regions */
>>>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>>>> +    {
>>>> +        start = bootinfo.reserved_mem.bank[i].start;
>>>> +        end = bootinfo.reserved_mem.bank[i].start +
>>>> +            bootinfo.reserved_mem.bank[i].size - 1;
>>>> +        res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Failed to remove:
>>>> %#"PRIx64"->%#"PRIx64"\n",
>>>> +                   start, end);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Remove grant table region */
>>>> +    start = kinfo->gnttab_start;
>>>> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
>>>> +    res = rangeset_remove_range(unalloc_mem, start, end);
>>>> +    if ( res )
>>>> +    {
>>>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>>> +               start, end);
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    start = EXT_REGION_START;
>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>>>> +                                 add_ext_regions, ext_regions);
>>>> +    if ( res )
>>>> +        ext_regions->nr_banks = 0;
>>>> +    else if ( !ext_regions->nr_banks )
>>>> +        res = -ENOENT;
>>>> +
>>>> +out:
>>>> +    rangeset_destroy(unalloc_mem);
>>>> +
>>>> +    return res;
>>>> +}
>>>> +
>>>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>> +                                    struct meminfo *ext_regions)
>>>> +{
>>>> +    struct dt_device_node *np;
>>>> +    struct rangeset *mem_holes;
>>>> +    paddr_t start, end;
>>>> +    unsigned int i;
>>>> +    int res;
>>>> +
>>>> +    dt_dprintk("Find memory holes for extended regions\n");
>>>> +
>>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>>> +    if ( !mem_holes )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /* Start with maximum possible addressable physical memory range */
>>>> +    start = EXT_REGION_START;
>>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>>> +    res = rangeset_add_range(mem_holes, start, end);
>>>> +    if ( res )
>>>> +    {
>>>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>>> +               start, end);
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
>>> Well... The loop below is not going to handle all the regions described in
>>> the property "reg". Instead, it will cover a subset of "reg" where the
>>> memory is addressable.
>> As I understand, we are only interested in subset of "reg" where the memory is
>> addressable.
>>
>>
>>>
>>> You will also need to cover "ranges" that will describe the BARs for the PCI
>>> devices.
>> Good point.
> Yes, very good point!
>
>
>> Could you please clarify how to recognize whether it is a PCI
>> device as long as PCI support is not merged? Or just to find any device nodes
>> with non-empty "ranges" property
>> and retrieve addresses?
> Normally any bus can have a ranges property with the aperture and
> possible address translations, including /amba (compatible =
> "simple-bus"). However, in these cases dt_device_get_address already
> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
>
> The PCI bus is special for 2 reasons:
> - the ranges property has a different format
> - the bus is hot-pluggable
>
> So I think the only one that we need to treat specially is PCI.
>
> As far as I am aware PCI is the only bus (or maybe just the only bus
> that we support?) where ranges means the aperture.
Thank you for the clarification. I need to find device node with 
non-empty ranges property
(and make sure that device_type property is "pci"), after that I need to 
read the context of ranges property and translate it.


-- 
Regards,

Oleksandr Tyshchenko


