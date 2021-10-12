Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C442AF25
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 23:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207675.363567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPYb-0007dx-6m; Tue, 12 Oct 2021 21:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207675.363567; Tue, 12 Oct 2021 21:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPYb-0007bK-3k; Tue, 12 Oct 2021 21:43:33 +0000
Received: by outflank-mailman (input) for mailman id 207675;
 Tue, 12 Oct 2021 21:43:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maPYZ-0007bE-9L
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 21:43:31 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 675be4a1-4877-435f-8b46-bfe7019e6f03;
 Tue, 12 Oct 2021 21:43:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x27so2701334lfu.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 14:43:28 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u25sm1135883lfc.176.2021.10.12.14.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 14:43:27 -0700 (PDT)
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
X-Inumbo-ID: 675be4a1-4877-435f-8b46-bfe7019e6f03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ptdloW3YWcAlJzynbmmiowqjnJFfkXnitqVRK7FB1F4=;
        b=c8ZKgfD2sfQjGiWOwq4ID0OtrYWz6tbfV7+wMNojJHHHy7L3ManQ8gWrcKMSWJ+F5w
         XhPU8xRjzOc6WxTbHROfcb71k7HAePVp6zj6EoCjWHLbd3YyT+ZrzXA4TogVgjBWvuKY
         2tqQE7VVWFo0oBHNNm+Ya2lqA9p2AYbJm1XIdwgSTCAct3v/LrI2OUgu/2t4eoNCzfBX
         WBYfxYVcVzNokF2/+e8JWwWeUjs5jupHjeGP6VPN3Wa+ygIyQe53o+7wjWM7rD+oQrbL
         OhsV7T6jJdGYb8L8Iw2I1rvtP4vXJJ3Z1ShqrTRCCUcC13UJDeeKQwCvpHXy9U69beHc
         kBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ptdloW3YWcAlJzynbmmiowqjnJFfkXnitqVRK7FB1F4=;
        b=LfF1L1PMpncaRu/sqwpoWQYjoYiZfPaRYGyfYLqS8CLdUBdLy96jmOahzeQ95l+UtW
         yYKf6yAuH9mdCWP3atlEP94oW4/6CUIFxg5JgJQS2ULMJhIfSZKTuvhQb/f1w1VmmPja
         kVvhAiPThOevlN0xnLSSVULfKhfOYJaXW9QbCVwvlwBTImguxdcWsGDMAHKNmhz/4stq
         kwUYpxHupLIn/n162G8SiQBTMfwDcB51lvhb5J21+v5fUNEEgJF6/dmXi8+QHGQnpupe
         7qOxJHw9QCISyJHwxWbJzuTK5Aq0PxHYfNoRdk3p5py7MZJlF4Xlwhso+Z0Ug66cEUev
         fgrw==
X-Gm-Message-State: AOAM531+2Ij6+WP2W5kMpEL8DRYNWwN78+nLA+NTnju7TPMx9V+zBbf9
	jZNaxrm6VPnNf6649SZAsgI=
X-Google-Smtp-Source: ABdhPJzh3o7TdBg9Z6plJTphSynCCKUyufYWGiblLjm7jUDOH2s7cpFVafe9G8SoYAFPUnCSJqX+RQ==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr16861593ljc.317.1634075007705;
        Tue, 12 Oct 2021 14:43:27 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <c98c1acd-86c0-f556-643e-e472b696644f@xen.org>
 <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com>
 <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
Date: Wed, 13 Oct 2021 00:43:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 13.10.21 00:22, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien, Ian.


Julien, thank you for the detailed answer, I will analyze it tomorrow.

Ian, I think, there is no reason in providing git branch with the acks 
folded in + my minor fix for the debug message as it was discussed 
before, it sounds like there is more work to do, so it is going to be a 
new version anyway.




>
> On 12/10/2021 18:42, Oleksandr wrote:
>> On 12.10.21 19:05, Julien Grall wrote:
>>> On 11/10/2021 18:48, Oleksandr Tyshchenko wrote:
>>>> ---
>>>>   tools/libs/light/libxl_arm.c  | 76 
>>>> ++++++++++++++++++++++++++++++++++++++++---
>>>>   xen/include/public/arch-arm.h |  2 ++
>>>>   2 files changed, 73 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/tools/libs/light/libxl_arm.c 
>>>> b/tools/libs/light/libxl_arm.c
>>>> index e3140a6..c0e8415 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -598,9 +598,20 @@ static int make_timer_node(libxl__gc *gc, void 
>>>> *fdt,
>>>>       return 0;
>>>>   }
>>>>   +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
>>>> +
>>>>   static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>>> -                                const libxl_version_info *vers)
>>>> +                                const libxl_version_info *vers,
>>>> +                                const libxl_domain_build_info 
>>>> *b_info,
>>>> +                                const struct xc_dom_image *dom)
>>>>   {
>>>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
>>>> region_base[GUEST_RAM_BANKS],
>>>> +        bank1end, ramsize;
>>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + 
>>>> GUEST_ROOT_SIZE_CELLS) *
>>>> +                  (GUEST_RAM_BANKS + 1)];
>>>> +    be32 *cells = &regs[0];
>>>> +    unsigned int i, len, nr_regions = 0;
>>>> +    libxl_dominfo info;
>>>>       int res;
>>>>       gic_interrupt intr;
>>>>   @@ -615,9 +626,64 @@ static int make_hypervisor_node(libxl__gc 
>>>> *gc, void *fdt,
>>>>                                 "xen,xen");
>>>>       if (res) return res;
>>>>   -    /* reg 0 is grant table space */
>>>> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>>>> GUEST_ROOT_SIZE_CELLS,
>>>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>>>> +        LOG(WARN, "The extended regions are only supported for 
>>>> 64-bit guest currently");
>>>> +        goto out;
>>>> +    }
>>>
>>> I understand why we want to limit to 64-bit domain for dom0. But I 
>>> am not sure this is warrant for 32-bit domain. At worse, the guest 
>>> will ignore the bank because it is not usable. So could we drop the 
>>> check?
>>
>> Yes.
>>
>>
>>>
>>>
>>>> +
>>>> +    res = libxl_domain_info(CTX, &info, dom->guest_domid);
>>>> +    if (res) return res;
>>>> +
>>>> +    assert(info.gpaddr_bits >= 32 && info.gpaddr_bits <= 48);
>>> What could go wrong below if gpaddr_bits is not within this range?
>>
>> if info.gpaddr_bits is less than 64, then nothing bad, otherwise, I 
>> assume we will get shift count overflow.
>
> So I think the assert() is not suitable here because even if the 
> gpaddr_bits is provided by the hypervisor (and therefore should be 
> trusted), this is a different component so hardening the code is a 
> good practice.
>
> In this case, I would check that info.gpaddr_bits <= 64 and return an 
> error. The reason I am suggesting <= 64 and not 48 is because Arm 
> already supports 52 bits address space. Yet, I still like to avoid 
> this assumption in the code. Something like below should work:
>
> bank1end = GUEST_RAM1_BASE + GUEST_RAM1_SIZE - 1;
> bank1end = min(bank1end, ~(0ULL) >> (64 - info.gpaddr_bits);
>
>>>> +
>>>> +    /*
>>>> +     * Try to allocate separate 2MB-aligned extended regions from 
>>>> the first
>>>> +     * (below 4GB) and second (above 4GB) RAM banks taking into 
>>>> the account
>>>> +     * the maximum supported guest physical address space size and 
>>>> the amount
>>>> +     * of memory assigned to the guest.
>>>> +     * As the guest memory layout is not populated yet we cannot 
>>>> rely on
>>>> +     * dom->rambank_size[], so calculate the actual size of both 
>>>> banks using
>>>> +     * "max_memkb" value.
>>>> +     */
>>>
>>> At the moment, libxl doesn't know how libxc will allocate the 
>>> memory. We may decide in the future to have only a small amount of 
>>> memory below 4GB and then the rest above 4GB. With this approach it 
>>> would be more difficult to modify the memory layout. Instead, I 
>>> think we should create a placeholder that is updated once we know 
>>> the banks in libxl__arch_domain_finalise_hw_description.
>>
>> If I got your point correctly, this is close to how it was done from 
>> the beginning. Yes, we can create placeholder(s) here and then update 
>> them once the memory layout is populated. The problem is that we 
>> won't be able to remove the placeholder(s) if we fail to allocate 
>> region(s) for some reasons. So, we should know for sure in advance 
>> how many region(s) we will be able to allocate later on in order to 
>> create the required number of placeholders right now...  Please, look 
>> at the TODO I wrote in finalise_ext_region() [1]. Or I misread your 
>> point?
>
> You read correctly my point. However, I disagree that it is a problem 
> to remove the placeholder if we fail to allocate the amount of regions 
> expected.
>
> Looking at libfdt, I can see two ways to deal with it:
>   1) Use fdt_setprop()
>   2) Delete the property using fdt_delprop() and then recreate it with 
> fdt_appendprop()
>
> The first solution is ideal and I think can work here to downsize the 
> property. At worse, the second solution should work as the FDT blob 
> will not increase.
>
>>> We also probably want to mention in the memory layout in 
>>> public/arch-arm.h this decision as the suggested way to find 
>>> extended regions will definitely impact our decision to re-order the 
>>> memory layout or shrink some regions in the future (I have in mind 
>>> the PCI Passthrough work).
>>
>> Sorry, I couldn't parse.
>
> So this patch is relying on the fact that the regions reserved for the 
> RAM are big enough to also accommodate the extended regions.
>
> I am happy with this approach. However, I would like the approach to 
> be documented in arch-arm.h because this is the first place one would 
> look to understand the memory layout. This will be helpful if/when we 
> need to modify the guest memory layout.
>
>>
>>
>>>
>>>
>>>> +    ramsize = b_info->max_memkb * 1024;
>>>> +    if (ramsize <= GUEST_RAM0_SIZE) {
>>>> +        region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>>>> +        region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>>>> +        region_base[1] = GUEST_RAM1_BASE;
>>>> +    } else
>>>> +        region_base[1] = GUEST_RAM1_BASE +
>>>> +            ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
>>>> +
>>>> +    bank1end = min(1ULL << info.gpaddr_bits, GUEST_RAM1_BASE + 
>>>> GUEST_RAM1_SIZE);
>>>> +    if (bank1end > region_base[1])
>>>> +        region_size[1] = bank1end - region_base[1];
>>>
>>> It would be best to not rely on the fact that Bank on is always 
>>> below 4GB. If the code is too complex then we should look to add a 
>>> BUILD_BUG_ON() to avoid any surprise.
>>
>> Yes, I can add:
>>
>> BUILD_BUG_ON((GUEST_RAM0_BASE + GUEST_RAM0_SIZE) > GB(4));
>
> I am OK with that. But I wonder if we could simply use min(..., ) to 
> avoid the BUILD_BUG_ON().
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


