Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B6410CC3
	for <lists+xen-devel@lfdr.de>; Sun, 19 Sep 2021 20:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190175.339996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mS15p-0005Q9-C2; Sun, 19 Sep 2021 17:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190175.339996; Sun, 19 Sep 2021 17:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mS15p-0005N4-8q; Sun, 19 Sep 2021 17:59:09 +0000
Received: by outflank-mailman (input) for mailman id 190175;
 Sun, 19 Sep 2021 17:59:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iuPp=OJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mS15n-0005My-Dp
 for xen-devel@lists.xenproject.org; Sun, 19 Sep 2021 17:59:07 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78a1c39f-a660-498e-b547-32df6cce442f;
 Sun, 19 Sep 2021 17:59:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g41so23945165lfv.1
 for <xen-devel@lists.xenproject.org>; Sun, 19 Sep 2021 10:59:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m12sm1068943ljh.21.2021.09.19.10.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 10:59:03 -0700 (PDT)
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
X-Inumbo-ID: 78a1c39f-a660-498e-b547-32df6cce442f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=f1QseqEMTj6gyZJlqR485ScF1zaUGJm0X/256UAJv7U=;
        b=lxCKPAu153HpaBvh4sEDRlyYx2jUHAMfsqv5LntwlanZkV2AATUK36M+onspNt3u7p
         9DPGWSF+Hu7ODQMtj0vsdcSPts2Q+6GHyK+hkanuEM4UIdW5oql0HvtXH2njmJMIZbIr
         519KWU7W6+O8OeElXI40w2L7kbUMHru62LpZmX8ujRKVvMCfAIos0c1ctmgUD0iXVXdx
         7s07Cu3fAu6/zEQM9Ljk7EFMRL0oCHsZBHuIngJrjUhCv15I21bTcapyHxmBK6Gzotru
         cdZafRSzPoMJ12YbwJnTX9w8ngg2PbSzXHURD/QGeADO5qp+G/D/XYQSdcbWmNZBygz5
         Rv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=f1QseqEMTj6gyZJlqR485ScF1zaUGJm0X/256UAJv7U=;
        b=MaQA3+6kNnkzcOTczdhyjc4xJsaS2jek96wYbhufuRlOlFyuTJoQXNiAQuzUASM6y8
         UuOQwZWA1unXaxZIlZ1TtDMOoco5yanSfYVH7S3bDqYuJQ0dLRwDigN2VtnbxpWFJF4t
         b/Rf5MBOX6FWAcCbz7QHkJ1KLPPHjP3le05fMHnH8M1/WpIPIOFeebzYGEaoNACVnJuF
         3dxgI2acCzlOlzLDwr/O3j3gQ0Z/Qt0/BqrmS+h7d2OXU71nTDOyQQh17IQzpxyVRYWF
         B7DYSVqKuF1kpUp4PvoSFQAbl5O6K/f6phSeGeQvvleMRi9Jw+B5RNFh4wNyG/NGlYId
         ZmPQ==
X-Gm-Message-State: AOAM532QzQficLvzmNX0EYOvtaCYtS77lXm8w1sInxNyeYoTMGMIxEit
	ksw0X8UX4Sy5ppLR9BKUnZo=
X-Google-Smtp-Source: ABdhPJy0l4ae4OX0COjvzHnO799N3ACEZicSb3Lbwm6lln/iAdiFWTJMDkMKy4sYwRHzNnKS9sOgfw==
X-Received: by 2002:a2e:a555:: with SMTP id e21mr19881477ljn.490.1632074344174;
        Sun, 19 Sep 2021 10:59:04 -0700 (PDT)
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
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <8b8a7055-9983-3e83-a308-21dc61b27d4d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <239fe26b-1d64-ca54-aa0d-c45fcf3d44b6@gmail.com>
Date: Sun, 19 Sep 2021 20:59:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b8a7055-9983-3e83-a308-21dc61b27d4d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 19.09.21 17:00, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 18/09/2021 00:51, Oleksandr wrote:
>> On 17.09.21 18:48, Julien Grall wrote:
>>> On 10/09/2021 23:18, Oleksandr Tyshchenko wrote:
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
>>>
>>> I understand the ACPI is not covered because we would need to create 
>>> a new binding. But I am not sure to understand why 32-bit domain is 
>>> not supported. Can you explain it?
>>
>> The 32-bit domain is not supported for simplifying things from the 
>> beginning. It is a little bit difficult to get everything working at 
>> start. As I understand from discussion at [1] we can afford that 
>> simplification. However, I should have mentioned that 32-bit domain 
>> is not supported "for now".
>
> Right, I forgot that. This is where it is useful to write down the 
> decision in the commit message.

ok, will do.


>
>
>>
>>>
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
>>>> holes found in host device-tree if otherwise. 
>>>
>>> For the case when the IOMMU is disabled, this will only work if dom0 
>>> cannot allocate memory outside of the original range. This is 
>>> currently the case... but I think this should be spelled out in at 
>>> least the commit message.
>>
>> Agree, will update commit description.
>>
>>
>>>
>>>
>>>> Make sure that
>>>> extended regions are 2MB-aligned and located within maximum possible
>>>> addressable physical memory range. The maximum number of extended
>>>> regions is 128.
>>>
>>> Please explain how this limit was chosen.
>> Well, I decided to not introduce new data struct and etc to represent 
>> extended regions but reuse existing struct meminfo
>> used for memory/reserved-memory and, as I though, perfectly fitted. 
>> So, that limit come from NR_MEM_BANKS which is 128.
>
> Ok. So this is an artificial limit. Please make it clear in the commit 
> message.

ok, will do


>
>
>>
>>>
>>>>
>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Changes since RFC:
>>>>     - update patch description
>>>>     - drop uneeded "extended-region" DT property
>>>> ---
>>>>
>>>>   xen/arch/arm/domain_build.c | 226 
>>>> +++++++++++++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 224 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 206038d..070ec27 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -724,6 +724,196 @@ static int __init make_memory_node(const 
>>>> struct domain *d,
>>>>       return res;
>>>>   }
>>>>   +static int __init add_ext_regions(unsigned long s, unsigned long 
>>>> e, void *data)
>>>> +{
>>>> +    struct meminfo *ext_regions = data;
>>>> +    paddr_t start, size;
>>>> +
>>>> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>>>> +        return 0;
>>>> +
>>>> +    /* Both start and size of the extended region should be 2MB 
>>>> aligned */
>>>> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>>>> +    if ( start > e )
>>>> +        return 0;
>>>> +
>>>> +    size = (e - start + 1) & ~(SZ_2M - 1);
>>>> +    if ( !size )
>>>> +        return 0;
>>>> +
>>>> +    ext_regions->bank[ext_regions->nr_banks].start = start;
>>>> +    ext_regions->bank[ext_regions->nr_banks].size = size;
>>>> +    ext_regions->nr_banks ++;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * The extended regions will be prevalidated by the memory hotplug 
>>>> path
>>>> + * in Linux which requires for any added address range to be 
>>>> within maximum
>>>> + * possible addressable physical memory range for which the linear 
>>>> mapping
>>>> + * could be created.
>>>> + * For 48-bit VA space size the maximum addressable range are:
>>>
>>> When I read "maximum", I understand an upper limit. But below, you 
>>> are providing a range. So should you drop "maximum"?
>>
>> yes, it is a little bit confusing.
>>
>>
>>>
>>>
>>> Also, this is tailored to Linux using 48-bit VA. How about other 
>>> limits?
>> These limits are calculated at [2]. Sorry, I didn't investigate yet 
>> what values would be for other CONFIG_ARM64_VA_BITS_XXX. Also looks 
>> like some configs depend on 16K/64K pages...
>> I will try to investigate and provide limits later on.

I have rebuilt Linux with CONFIG_ARM64_VA_BITS_39=y and printed the limits.

These are: 0x40000000 - 0x403fffffff


>>
>
> I have thought a bit more about it. At the moment, you are relying on 
> Xen to find a range that is addressable by the OS. This can be quite 
> complex as different OS may have different requirement. So how about 
> letting the OS to filter the ranges based on its limitations?

I think, it is a nice idea, thank you. So, I will drop OS specific 
limits (EXT_REGION_*) from the patch.

>
>
>>
>>
>>>
>>>
>>>> + * 0x40000000 - 0x80003fffffff
>>>> + */
>>>> +#define EXT_REGION_START   0x40000000ULL
>>>
>>> I am probably missing something here.... There are platform out 
>>> there with memory starting at 0 (IIRC ZynqMP is one example). So 
>>> wouldn't this potentially rule out the extended region on such 
>>> platform?
>>
>>  From my understanding the extended region cannot be in 
>> 0...0x40000000 range. If these platforms have memory above first GB, 
>> I believe the extended region(s) can be allocated for them.
>
> Do you mean "cannot"? 
No. I think, there was some misunderstanding from my size. Initially, I 
got this as "extended region feature cannot be used on such platform in 
general", so I tried to say that if these platforms
also had some RAM *above* 0x40000000 then extended region could be 
allocated for them in principle, we only won't be able to take advantage 
of 0...0x40000000...


> Technically this is a limitation of the current version of Linux. 
> Tomorrow, someone may be able to remove that limitations. So, as 
> mentionned above, maybe Xen should not do the filtering.

I got it, sounds reasonable.


>
>
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
>>>> +    /* Start with maximum possible addressable physical memory 
>>>> range */
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
>>>> +    /* Remove all regions described by "reg" property (MMIO, RAM, 
>>>> etc) */
>>>
>>> Well... The loop below is not going to handle all the regions 
>>> described in the property "reg". Instead, it will cover a subset of 
>>> "reg" where the memory is addressable.
>>
>> As I understand, we are only interested in subset of "reg" where the 
>> memory is addressable.
>
> Right... That's not what your comment is saying.

ok, will update.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


