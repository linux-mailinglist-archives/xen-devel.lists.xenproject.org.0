Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17633E7DC8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 18:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165442.302322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUw8-0004aV-V4; Tue, 10 Aug 2021 16:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165442.302322; Tue, 10 Aug 2021 16:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUw8-0004Y8-Rp; Tue, 10 Aug 2021 16:49:08 +0000
Received: by outflank-mailman (input) for mailman id 165442;
 Tue, 10 Aug 2021 16:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQPR=NB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mDUw7-0004Y2-EN
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 16:49:07 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f3066e-101b-4d18-a509-c849e7352def;
 Tue, 10 Aug 2021 16:49:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y7so19137419ljp.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 09:49:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y20sm363668lji.126.2021.08.10.09.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:49:04 -0700 (PDT)
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
X-Inumbo-ID: 07f3066e-101b-4d18-a509-c849e7352def
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=y/6dCXP7pKem3jwxJV+oqakShfCnHcGFD7xZafWyuBM=;
        b=eIvzUjur+rcqbRVsRSFeTme7cvC7M4w4Bd0rRzL/tXvKJxLGVGQoMIYGjIGgC2wTNV
         Zgnz01/Jf+lolTIToAx83hZMaWB/DWRKljVLR7TpVEmAwiZktSEVpEWRkPNU9RgmGJbj
         P/7ZxS5HuH6WTRs9oQ9zeunLzFFflk92bBoBOlWw1kwrNv1EP+YBUZW52fDm9JOyJkpz
         S9JGmulK1mujVJ2EIVFCEmOO4rUSYEPVj/AWMKSRRhpJuazrx7fWDRURgO2iVQd8mgIR
         x9MNt0y4wNrpGXvfXLx530/5bpDLebY7Oak4PAlQHliVs3Dv3d7Fqe0wuam8+lp15w78
         AbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=y/6dCXP7pKem3jwxJV+oqakShfCnHcGFD7xZafWyuBM=;
        b=clq0NGkVAOimuWA7kSfoIyoFedP10jg5rjiFuMDxUvFkACKANDuGuiwCCq4+JvxUjo
         n7y3msoMzQnI+5gWYHwhn7DRNrpooniXPg9tj+exPC5r4c/ba20umCnO63RPe+CqBmq+
         QQx2LmcID3hM0ydsPi+fcgnib+ryUGsp47sWk4Topn6rLhkerDOqo1JZxdAaJXa1djk6
         yDzqLHTRZywOoVnOH5WHNSEERCJ2i5mbMkj2z6dASyk8urn/T+fQejl83E4JpBbwlB9g
         amkHCcGmBsBEbtI3PofHfok7klCNhZyOWvOP8lpyzvD3iW8BP7oZ1HzFjtilyLp47D0t
         MRMA==
X-Gm-Message-State: AOAM532lMS7B3WuxEnMW/SNah0FbrxF8kiG8TqMUHQflkSwF6bEmAHtV
	jYPJ5aZiLlt0+3WRUSJrJkY=
X-Google-Smtp-Source: ABdhPJwK3Euu6EJgaGFjkZA5D7wjR+rwskw/4N7q5o0MgxPMeu0uqD0zZRA9qWld9J+qPlyYNnHjnw==
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr18875081ljf.374.1628614145047;
        Tue, 10 Aug 2021 09:49:05 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
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
 <0ddb516b-1990-b772-6163-3e0d3af2c635@gmail.com>
 <fd3b5afe-d186-decf-335a-e08dc1556d7b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <005a02cb-b400-5998-5f57-3422ba7091e8@gmail.com>
Date: Tue, 10 Aug 2021 19:49:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd3b5afe-d186-decf-335a-e08dc1556d7b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.08.21 19:21, Julien Grall wrote:

Hi Julien

>
>
> On 10/08/2021 12:58, Oleksandr wrote:
>>
>> On 10.08.21 09:34, Wei Chen wrote:
>>> Hi Oleksandr,
>>
>> Hi Wei, Julien.
> Hi,
>
>>>> -----Original Message-----
>>>> From: Oleksandr <olekstysh@gmail.com>
>>>> Sent: 2021年8月10日 2:25
>>>> To: Julien Grall <julien@xen.org>
>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; xen-devel@lists.xenproject.org; Oleksandr
>>>> Tyshchenko <oleksandr_tyshchenko@epam.com>; Daniel De Graaf
>>>> <dgdegra@tycho.nsa.gov>; Daniel P. Smith 
>>>> <dpsmith@apertussolutions.com>;
>>>> Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; George Dunlap
>>>> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Volodymyr
>>>> Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monné
>>>> <roger.pau@citrix.com>; Bertrand Marquis 
>>>> <Bertrand.Marquis@arm.com>; Wei
>>>> Chen <Wei.Chen@arm.com>
>>>> Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
>>>> unallocated space
>>>>
>>>>
>>>> On 09.08.21 18:42, Julien Grall wrote:
>>>>> Hi Oleksandr,
>>>>
>>>> Hi Julien.
>>>>
>>>>
>>>> Thank you for the input.
>>>>
>>>>
>>>>> On 07/08/2021 18:03, Oleksandr wrote:
>>>>>> On 06.08.21 03:30, Stefano Stabellini wrote:
>>>>>>
>>>>>> Hi Stefano
>>>>>>
>>>>>>> On Wed, 4 Aug 2021, Julien Grall wrote:
>>>>>>>>> +#define GUEST_SAFE_RANGE_BASE xen_mk_ullong(0xDE00000000) /*
>>>>>>>>> 128GB */
>>>>>>>>> +#define GUEST_SAFE_RANGE_SIZE xen_mk_ullong(0x0200000000)
>>>>>>>>>
>>>>>>>>> While the possible new DT bindings has not been agreed yet, I re-
>>>> used
>>>>>>>>> existing "reg" property under the hypervisor node to pass safe
>>>>>>>>> range as a
>>>>>>>>> second region,
>>>>>>>>> https://elixir.bootlin.com/linux/v5.14-
>>>> rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10:
>>>>>>>> So a single region works for a guest today, but for dom0 we will
>>>>>>>> need multiple
>>>>>>>> regions because it is may be difficult to find enough contiguous
>>>>>>>> space for a
>>>>>>>> single region.
>>>>>>>>
>>>>>>>> That said, as dom0 is mapped 1:1 (including some guest mapping),
>>>>>>>> there is also
>>>>>>>> the question where to allocate the safe region. For grant 
>>>>>>>> table, we
>>>>>>>> so far
>>>>>>>> re-use the Xen address space because it is assumed it will space
>>>>>>>> will always
>>>>>>>> be bigger than the grant table.
>>>>>>>>
>>>>>>>> I am not sure yet where we could allocate the safe regions.
>>>>>>>> Stefano, do you
>>>>>>>> have any ideas?
>>>>>>> The safest choice would be the address range corresponding to 
>>>>>>> memory
>>>>>>> (/memory) not already allocated to Dom0.
>>>>>>>
>>>>>>> For instance from my last boot logs:
>>>>>>> (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
>>>>>>> (XEN) BANK[0] 0x00000010000000-0x00000070000000 (1536MB)
>>>>>>> (XEN) BANK[1] 0x00000078000000-0x0000007c000000 (64MB)
>>>>>>>
>>>>>>> All the other ranges could be given as unallocated space:
>>>>>>>
>>>>>>> - 0x0 - 0x10000000
>>>>>>> - 0x70000000 - 0x78000000
>>>>>>> - 0x8_0000_0000 - 0x8_8000_0000
>>>>>> Thank you for the ideas.
>>>>>>
>>>>>> If I got the idea correctly, yes, as these ranges represent the real
>>>>>> RAM, so no I/O would be in conflict with them and as the result - no
>>>>>> overlaps would be expected.
>>>>>> But, I wonder, would this work if we have IOMMU enabled for Dom0 and
>>>>>> need to establish 1:1 mapping for the DMA devices to work with grant
>>>>>> mappings...
>>>>>> In arm_iommu_map_page() we call guest_physmap_add_entry() with gfn =
>>>>>> mfn, so the question is could we end up with this new gfn replacing
>>>>>> the valid mapping
>>>>>> (with gfn allocated from the safe region)?
>>>>> Right, when we enable the IOMMU for dom0, Xen will add an extra
>>>>> mapping with GFN == MFN for foreign and grant pages. This is because
>>>>> Linux is not aware that whether a device is protected by an IOMMU.
>>>>> Therefore it is assuming it is not and will use the MFN to configure
>>>>> for DMA transaction.
>>>>>
>>>>> We can't remove the mapping without significant changes in Linux and
>>>>> Xen. I would not mandate them for this work.
>>>>>
>>>>> That said, I think it would be acceptable to have different way to
>>>>> find the region depending on the dom0 configuration. So we could use
>>>>> the RAM not used by dom0 when the IOMMU is turned off.
>>>> OK
>>>>
>>>>
>>>>>>> The second best choice would be an hole: an address range not 
>>>>>>> used by
>>>>>>> anybody else (no reg property) and also not even mappable by a bus
>>>> (not
>>>>>>> covered by a ranges property). This is not the best choice because
>>>>>>> there
>>>>>>> can cases where physical resources appear afterwards.
>>>>> Are you saying that the original device-tree doesn't even describe
>>>>> them in any way (i.e. reserved...)?
>>>>>
>>>>>> Unfortunately, yes.
>>>>> So the decision where the safe region is located will be done by Xen.
>>>>> There is no involvement of the domain (it will discover the region
>>>>> from the DT). Therefore, I don't think we need to think about
>>>>> everything right now as we could adapt this is exact region is not
>>>>> part of the stable ABI.
>>>>>
>>>>> The hotplug is one I would defer because this is not supported (and
>>>>> quite likely not working) in Xen upstream today.
>>>> Sounds reasonable.
>>>>
>>>>
>>>>>
>>>>> Now regarding the case where dom0 is using the IOMMU. The assumption
>>>>> is Xen will be able to figure out all the regions used from the
>>>>> firmware table (ACPI or DT).
>>>>>
>>>>> AFAIK, this assumption would be correct for DT. However, for ACPI, I
>>>>> remember we were not able to find all the MMIOs region in Xen (see 
>>>>> [1]
>>>>> and [2]). So even this solution would not work for ACPI.
>>>>>
>>>>> If I am not mistaken, we don't support IOMMU with ACPI yet. So we
>>>>> could defer the problem to when this is going to be supported.
>>>> Sounds reasonable.
>>>>
>>>>
>>>> To summarize:
>>>>
>>>> 0. Skip ACPI case for now, implement for DT case
>>>>
>>>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host DT as
>>>> safe ranges
>>>>
>>> Does static allocation and direct mapping driver domain can be treated
>>> as this case?
>> I am not sure I can answer this question correctly due to the limited 
>> knowledge of these features.
>>
>> But, it feels to me that holes solution would work, at least I don't 
>> see why not.
>>
>>
>> I wonder, why these can't be treated as the case #2 (where we provide 
>> not assigned RAM), I also don't see why not, however there might be 
>> pitfalls with direct mapped driver domain. Julien, do you have any 
>> opinion on this?
>
> So whether the memory is statically allocated or dynamically allocated 
> should not matter here. For direct mapped domain, then they should be 
> treated the same way as dom0.
>
> By that I mean if the IOMMU is not enabled for the domain, then we can 
> use thew unallocated RAM. Otherwise, we would need to find some holes.

OK, thank you for the clarification.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


