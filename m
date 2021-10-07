Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46040425E3C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204014.359213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaQJ-0004yQ-PS; Thu, 07 Oct 2021 20:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204014.359213; Thu, 07 Oct 2021 20:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaQJ-0004vl-MO; Thu, 07 Oct 2021 20:55:27 +0000
Received: by outflank-mailman (input) for mailman id 204014;
 Thu, 07 Oct 2021 20:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYaQI-0004vM-93
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:55:26 +0000
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a416a85e-feb3-4abe-b490-554e7114e3b1;
 Thu, 07 Oct 2021 20:55:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a25so12223303edx.8
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 13:55:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f25sm171986ejb.34.2021.10.07.13.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 13:55:22 -0700 (PDT)
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
X-Inumbo-ID: a416a85e-feb3-4abe-b490-554e7114e3b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nA4xCXkfVXNEXjfpLRR7owsHwcLnqWVVz9rx9223EFQ=;
        b=GOie1uJ/ijfJ3Us4qjIYZ+DEaE6/aH1gQ4de023dR0oldF4UNoEHRDb2mf07vqQcRW
         DvWIvKu9m2NP2dFipgR1jB0j01xbgIFsVvowu8pleJJNrYu3Dr9Hn3zMCqLFplmy7Lh7
         XoTHvFax156p2wGq2V4tQrV2W1cWCaVAi/kITIYhGtHLC7MbkmvT5Arb1AQeS1Yt3tE2
         8W6PRWXQuB50aB1QZzpPEPYg+A/UoSOhR+cyXlQ3+5UBvGUMvkBikkwCEX5ZuRPPJeko
         iqn3+M5SoU7gSYJvSInXNlQ0udP3QfntvLs+5OaMJcVd3DavhzKuAtFdLNPYg8MbMESa
         73rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nA4xCXkfVXNEXjfpLRR7owsHwcLnqWVVz9rx9223EFQ=;
        b=rOO3IDRuj6CLeD/cP+HTbC0bck9C1w2vlk5ebV3HvHIxi3rNOC4z5h2qrCkQcyUnHB
         5leWtbqD2oKIj8XZr/zjr8+vd3SvgvHzS37OlFSgZ3pukRHRRBkvkt+kQ3dgXRQp7+cQ
         Eb76f4U2SW6A4dZdo9h5P3FdOuwbfp7VxJzy5CMtyMSe2tUZ89kFrooULA+VI+p6EtVF
         fx/jg6Tf8oBw5EFaw0HloZlXGQaGpIIqChWQI/byEnlXh5YswiSibJO/FdZnRUGF7Tyi
         uyA0TSlPsK3r92JkxkW87jSBMZXQ+CQ9Vo0ECvNdyV1whfAySPUAyixivmeMyPcLf7Zu
         VEFQ==
X-Gm-Message-State: AOAM531J0+2QZVpBLeAyYz7mXlWEpMU3jsN7+rbRxYTSIJOIUHRm32Hm
	0EQke8nEmBFSqbiXcmG5x/A=
X-Google-Smtp-Source: ABdhPJyE3bxpkpQM6c6Tl7+8Jies2bPcxaT8FIkpSJwJyqMhNycOdIm+Aq+TaI4Jvra0aJpKLryIpw==
X-Received: by 2002:a05:6402:358c:: with SMTP id y12mr9022061edc.159.1633640122958;
        Thu, 07 Oct 2021 13:55:22 -0700 (PDT)
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061808570.3209@sstabellini-ThinkPad-T480s>
 <9a4fb8be-e893-bd7f-fe77-7274457e2b04@gmail.com>
 <alpine.DEB.2.21.2110071327520.414@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9ee3760e-fcb3-c783-3a96-5079c167450c@gmail.com>
Date: Thu, 7 Oct 2021 23:55:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110071327520.414@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.10.21 23:29, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 7 Oct 2021, Oleksandr wrote:
>> On 07.10.21 04:29, Stefano Stabellini wrote:
>>
>> Hi Stefano
>>
>>> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
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
>>>> - The extended region feature is only supported for 64-bit domain
>>>>     currently.
>>>> - The ACPI case is not covered.
>>>>
>>>> ***
>>>>
>>>> The algorithm to choose extended regions for non-direct mapped
>>>> DomU is simpler in comparison with the algorithm for direct mapped
>>>> Dom0. We usually have a lot of unused space above 4GB, and might
>>>> have some unused space below 4GB (depends on guest memory size).
>>>> Try to allocate separate 2MB-aligned extended regions from the first
>>>> (below 4GB) and second (above 4GB) RAM banks taking into the account
>>>> the maximum supported guest physical address space size and the amount
>>>> of memory assigned to the guest. The minimum size of extended region
>>>> the same as for Dom0 (64MB).
>>>>
>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> ! Stefano, Ian, Michal I dropped your A-b/R-b. I decided to change patch
>>>> to make it more functional !
>>>>
>>>> Changes RFC -> V2:
>>>>      - update patch description
>>>>      - drop uneeded "extended-region" DT property
>>>>      - clear reg array in finalise_ext_region() and add a TODO
>>>>
>>>> Changes V2 -> V3:
>>>>      - update patch description, comments in code
>>>>      - only pick up regions with size >= 64MB
>>>>      - move the region calculation to make_hypervisor_node() and drop
>>>>        finalise_ext_region()
>>>>      - extend the list of arguments for make_hypervisor_node()
>>>>      - do not show warning for 32-bit domain
>>>>      - change the region alignment from 1GB to 2MB
>>>>      - move EXT_REGION_SIZE to public/arch-arm.h
>>>>
>>>> Changes V3 -> V4:
>>>>      - add R-b, A-b and T-b
>>>>
>>>> Changes V4 -> V5:
>>>>      - update patch description and comments in code
>>>>      - reflect changes done in previous patch to pass gpaddr_bits
>>>>        via createdomain domctl (struct xen_arch_domainconfig)
>>>>      - drop R-b, A-b and T-b
>>>>      - drop limit for maximum extended region size (128GB)
>>>>      - try to also allocate region below 4GB, optimize code
>>>>        for calculating extended regions
>>>> ---
>>>>    tools/libs/light/libxl_arm.c  | 80
>>>> ++++++++++++++++++++++++++++++++++++++++---
>>>>    xen/include/public/arch-arm.h |  2 ++
>>>>    2 files changed, 77 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>>> index 45e0386..cd743f7 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -600,9 +600,21 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>>>>        return 0;
>>>>    }
>>>>    +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
>>>> +
>>>>    static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>>> -                                const libxl_version_info *vers)
>>>> +                                const libxl_version_info *vers,
>>>> +                                const libxl_domain_build_info *b_info,
>>>> +                                const struct xc_dom_image *dom)
>>>>    {
>>>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0},
>>>> region_base[GUEST_RAM_BANKS],
>>>> +        banksize[GUEST_RAM_BANKS], bankend[GUEST_RAM_BANKS], ramsize;
>>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>>>> +                  (GUEST_RAM_BANKS + 1)];
>>>> +    be32 *cells = &regs[0];
>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>> +    unsigned int i, len, nr_regions = 0;
>>>> +    uint8_t gpaddr_bits;
>>>>        int res;
>>>>        gic_interrupt intr;
>>>>    @@ -617,9 +629,67 @@ static int make_hypervisor_node(libxl__gc *gc, void
>>>> *fdt,
>>>>                                  "xen,xen");
>>>>        if (res) return res;
>>>>    -    /* reg 0 is grant table space */
>>>> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>>>> GUEST_ROOT_SIZE_CELLS,
>>>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>>>> +        LOG(WARN, "The extended regions are only supported for 64-bit
>>>> guest currently");
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    gpaddr_bits = b_info->arch_arm.gpaddr_bits;
>>>> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
>>>> +
>>>> +    /*
>>>> +     * Try to allocate separate 2MB-aligned extended regions from the
>>>> first
>>>> +     * (below 4GB) and second (above 4GB) RAM banks taking into the
>>>> account
>>>> +     * the maximum supported guest physical address space size and the
>>>> amount
>>>> +     * of memory assigned to the guest.
>>>> +     * As the guest memory layout is not populated yet we cannot rely on
>>>> +     * dom->rambank_size[], so calculate the actual size of both banks
>>>> using
>>>> +     * "max_memkb" value.
>>>> +     */
>>>> +    ramsize = b_info->max_memkb * 1024;
>>>> +    if (ramsize <= GUEST_RAM0_SIZE) {
>>>> +        banksize[0] = ramsize;
>>>> +        banksize[1] = 0;
>>>> +    } else {
>>>> +        banksize[0] = GUEST_RAM0_SIZE;
>>>> +        banksize[1] = ramsize - GUEST_RAM0_SIZE;
>>>> +    }
>>>> +
>>>> +    bankend[0] = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
>>>> +    bankend[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
>>>> GUEST_RAM1_SIZE);
>>>> +
>>>> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>>>> +        region_base[i] = bankbase[i] + ALIGN_UP_TO_2MB(banksize[i]);
>>>> +        if (bankend[i] > region_base[i])
>>>> +            region_size[i] = bankend[i] - region_base[i];
>>>> +    }
>>> This seems correct but it looks a bit overkill. I would have written
>>> like this:
>>>
>>>       if (ramsize <= GUEST_RAM0_SIZE) {
>>>           region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>>>           region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>>>           region_base[1] = GUEST_RAM1_BASE;
>>>           region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
>>> GUEST_RAM1_SIZE) -
>>>                            region_base[0];
>> Why  "- region_base[0]" in last expression? I think it should be "-
>> region_base[1]", the same as for "else" case (so it can be moved out of
>> if-else construct). Also we need to check
>>
>> that min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE) is greater
>> than region_base[1] before the subtraction. If gpaddr_bits = 32 (on Arm64) we
>> will get incorrect result.
>>
>>
>>>       } else {
>>>           region_size[0] = 0;
>>>           region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize -
>>> GUEST_RAM0_SIZE);
>>>           region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
>>> GUEST_RAM1_SIZE) -
>>>                            region_base[1];
>>>       }
>>>
>>> Which removes the needs for banksize, bankend, bankbase. What do you
>>> think? Your version works too, so I am OK anyway.
>> Thank you for looking into this.
>>
>> I think, you version will also work with adjustments. I am OK either way. Your
>> version reduces the number of locals, so probably better.  Although "min(1ULL
>> << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE)" construction probably
>> wants latching in local bank1end.
>>
>>
>> Below the updated version:
>>
>>      if (ramsize <= GUEST_RAM0_SIZE) {
>>          region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>>          region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>>          region_base[1] = GUEST_RAM1_BASE;
>>      } else
>>          region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
>>
>>      bank1end = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
>>      if (bank1end > region_base[1])
>>          region_size[1] = bank1end - region_base[1];
>
> Yeah I like this. I'd be happy to go with it.

Great, thank you, will update.


-- 
Regards,

Oleksandr Tyshchenko


