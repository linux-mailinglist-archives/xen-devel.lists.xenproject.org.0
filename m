Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A33E598D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 13:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165347.302183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQOw-00064I-Nn; Tue, 10 Aug 2021 11:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165347.302183; Tue, 10 Aug 2021 11:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQOw-00062V-Kg; Tue, 10 Aug 2021 11:58:34 +0000
Received: by outflank-mailman (input) for mailman id 165347;
 Tue, 10 Aug 2021 11:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQPR=NB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mDQOv-00062P-Mf
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 11:58:33 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e636214d-e753-4fc9-96b8-235fbb6dcbba;
 Tue, 10 Aug 2021 11:58:32 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id n12so5948535edx.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 04:58:32 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t11sm6763837ejr.89.2021.08.10.04.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 04:58:31 -0700 (PDT)
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
X-Inumbo-ID: e636214d-e753-4fc9-96b8-235fbb6dcbba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UDoZ2I2HvwaT3NQw63fDrZKn5H1QaUUoKZW9xC3tGas=;
        b=kykYTABuxh44QvRZL4TI2ouXz7fUfd/1KnbtVhw5p8JsDsmT2A5+XArkE5WFY6yxj+
         wkN+HYCP5tkVCwrsT/1kjGmyxItumFZmZIT2p+mc3Tgf2msBZKcb/7+Xt74sG4XnGHkf
         tPon50uSvheyB5JRXTOYMR1zoNjf9PKYcM7dwNL64l8MJqd8SRcyA43e+oG6AJilDPqA
         4+MBtrjN2tqDEXZoZv/L3OaF1IrB3eON2+MFximymJGiS6WFf4sny/LY4yTzkYnXAkux
         DVYXkWuTCwPCIjm+sDBm0WomdV5vqYPWikNmfkw3sjR7MACVhahshKnVcvS5rMssuMt1
         xesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UDoZ2I2HvwaT3NQw63fDrZKn5H1QaUUoKZW9xC3tGas=;
        b=ovGc49gEGbiXFmH9eQif1iz0GavKI1rif1SUDCnFyGrHOpdSMi3tZiPnkScRyQVv8m
         AkLiTbMT+s6dZKG3F7p/c9HE9qaQmg4MwIs16qo6Mysan9VEMBxEPXvhmezXaL5JQPbn
         /sxgG0XLggMRyvoDp2IzNAmh65BrqqusrxumJUuPkmZE0HElw5ISUSlpPPnQ9WHRMglS
         bQnZdL7VTKGMlfI9jtwaoIzFVvqhpu2y4ckLUYVaheeqAScEsANkemLxVkdlZFH0nq8y
         9w0n9oM2fFhKJAwnaCXc2qG7HmR/tKLZXGZ+zbpU8hdRcdenLj85Z3wyrmhhX0LjjYs8
         5toA==
X-Gm-Message-State: AOAM5336RXeuXdajF182P+Dl2dc/9XjUw1Nt92D4DF+94GfpbqEBTjTv
	HCzCG7uk1EOE7TDD82xBh60=
X-Google-Smtp-Source: ABdhPJxyAuVl6EZ1MYAU/7gmUZ9yF8i/ssE0csavJ4bXbbH7fiB7TslV6eEttkX2CjXzLIG0xPBwKQ==
X-Received: by 2002:a05:6402:c8a:: with SMTP id cm10mr4302448edb.192.1628596711582;
        Tue, 10 Aug 2021 04:58:31 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
 <DB9PR08MB6857442248B996CC978BBA379EF79@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0ddb516b-1990-b772-6163-3e0d3af2c635@gmail.com>
Date: Tue, 10 Aug 2021 14:58:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857442248B996CC978BBA379EF79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.08.21 09:34, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei, Julien.


>
>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 2021年8月10日 2:25
>> To: Julien Grall <julien@xen.org>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; xen-devel@lists.xenproject.org; Oleksandr
>> Tyshchenko <oleksandr_tyshchenko@epam.com>; Daniel De Graaf
>> <dgdegra@tycho.nsa.gov>; Daniel P. Smith <dpsmith@apertussolutions.com>;
>> Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Volodymyr
>> Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei
>> Chen <Wei.Chen@arm.com>
>> Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
>> unallocated space
>>
>>
>> On 09.08.21 18:42, Julien Grall wrote:
>>> Hi Oleksandr,
>>
>> Hi Julien.
>>
>>
>> Thank you for the input.
>>
>>
>>> On 07/08/2021 18:03, Oleksandr wrote:
>>>> On 06.08.21 03:30, Stefano Stabellini wrote:
>>>>
>>>> Hi Stefano
>>>>
>>>>> On Wed, 4 Aug 2021, Julien Grall wrote:
>>>>>>> +#define GUEST_SAFE_RANGE_BASE xen_mk_ullong(0xDE00000000) /*
>>>>>>> 128GB */
>>>>>>> +#define GUEST_SAFE_RANGE_SIZE xen_mk_ullong(0x0200000000)
>>>>>>>
>>>>>>> While the possible new DT bindings has not been agreed yet, I re-
>> used
>>>>>>> existing "reg" property under the hypervisor node to pass safe
>>>>>>> range as a
>>>>>>> second region,
>>>>>>> https://elixir.bootlin.com/linux/v5.14-
>> rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10:
>>>>>> So a single region works for a guest today, but for dom0 we will
>>>>>> need multiple
>>>>>> regions because it is may be difficult to find enough contiguous
>>>>>> space for a
>>>>>> single region.
>>>>>>
>>>>>> That said, as dom0 is mapped 1:1 (including some guest mapping),
>>>>>> there is also
>>>>>> the question where to allocate the safe region. For grant table, we
>>>>>> so far
>>>>>> re-use the Xen address space because it is assumed it will space
>>>>>> will always
>>>>>> be bigger than the grant table.
>>>>>>
>>>>>> I am not sure yet where we could allocate the safe regions.
>>>>>> Stefano, do you
>>>>>> have any ideas?
>>>>> The safest choice would be the address range corresponding to memory
>>>>> (/memory) not already allocated to Dom0.
>>>>>
>>>>> For instance from my last boot logs:
>>>>> (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
>>>>> (XEN) BANK[0] 0x00000010000000-0x00000070000000 (1536MB)
>>>>> (XEN) BANK[1] 0x00000078000000-0x0000007c000000 (64MB)
>>>>>
>>>>> All the other ranges could be given as unallocated space:
>>>>>
>>>>> - 0x0 - 0x10000000
>>>>> - 0x70000000 - 0x78000000
>>>>> - 0x8_0000_0000 - 0x8_8000_0000
>>>> Thank you for the ideas.
>>>>
>>>> If I got the idea correctly, yes, as these ranges represent the real
>>>> RAM, so no I/O would be in conflict with them and as the result - no
>>>> overlaps would be expected.
>>>> But, I wonder, would this work if we have IOMMU enabled for Dom0 and
>>>> need to establish 1:1 mapping for the DMA devices to work with grant
>>>> mappings...
>>>> In arm_iommu_map_page() we call guest_physmap_add_entry() with gfn =
>>>> mfn, so the question is could we end up with this new gfn replacing
>>>> the valid mapping
>>>> (with gfn allocated from the safe region)?
>>> Right, when we enable the IOMMU for dom0, Xen will add an extra
>>> mapping with GFN == MFN for foreign and grant pages. This is because
>>> Linux is not aware that whether a device is protected by an IOMMU.
>>> Therefore it is assuming it is not and will use the MFN to configure
>>> for DMA transaction.
>>>
>>> We can't remove the mapping without significant changes in Linux and
>>> Xen. I would not mandate them for this work.
>>>
>>> That said, I think it would be acceptable to have different way to
>>> find the region depending on the dom0 configuration. So we could use
>>> the RAM not used by dom0 when the IOMMU is turned off.
>> OK
>>
>>
>>>>> The second best choice would be an hole: an address range not used by
>>>>> anybody else (no reg property) and also not even mappable by a bus
>> (not
>>>>> covered by a ranges property). This is not the best choice because
>>>>> there
>>>>> can cases where physical resources appear afterwards.
>>> Are you saying that the original device-tree doesn't even describe
>>> them in any way (i.e. reserved...)?
>>>
>>>> Unfortunately, yes.
>>> So the decision where the safe region is located will be done by Xen.
>>> There is no involvement of the domain (it will discover the region
>>> from the DT). Therefore, I don't think we need to think about
>>> everything right now as we could adapt this is exact region is not
>>> part of the stable ABI.
>>>
>>> The hotplug is one I would defer because this is not supported (and
>>> quite likely not working) in Xen upstream today.
>> Sounds reasonable.
>>
>>
>>>
>>> Now regarding the case where dom0 is using the IOMMU. The assumption
>>> is Xen will be able to figure out all the regions used from the
>>> firmware table (ACPI or DT).
>>>
>>> AFAIK, this assumption would be correct for DT. However, for ACPI, I
>>> remember we were not able to find all the MMIOs region in Xen (see [1]
>>> and [2]). So even this solution would not work for ACPI.
>>>
>>> If I am not mistaken, we don't support IOMMU with ACPI yet. So we
>>> could defer the problem to when this is going to be supported.
>> Sounds reasonable.
>>
>>
>> To summarize:
>>
>> 0. Skip ACPI case for now, implement for DT case
>>
>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host DT as
>> safe ranges
>>
> Does static allocation and direct mapping driver domain can be treated
> as this case?
I am not sure I can answer this question correctly due to the limited 
knowledge of these features.

But, it feels to me that holes solution would work, at least I don't see 
why not.


I wonder, why these can't be treated as the case #2 (where we provide 
not assigned RAM), I also don't see why not, however there might be 
pitfalls with direct mapped driver domain. Julien, do you have any 
opinion on this?



>
>> I would take into the account holes >= 1MB. I am wondering, do we need a
>> special alignment here other than a PAGE_SIZE?
>>
>> 2. If IOMMU is disabled for Dom0 -> provide RAM which not assigned to
>> Dom0 as safe ranges
>>
>> We could even provide holes here as well.
>>
>>
>>>
>>> Cheers,
>>>
>>> [1] https://marc.info/?l=linux-arm-kernel&m=148469169210500&w=2
>>> [2] Xen commit 80f9c316708400cea4417e36337267d3b26591db
>>>
>> --
>> Regards,
>>
>> Oleksandr Tyshchenko

-- 
Regards,

Oleksandr Tyshchenko


