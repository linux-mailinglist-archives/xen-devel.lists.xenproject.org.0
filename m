Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF6425888
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 18:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203867.359022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYWhj-0007IW-A1; Thu, 07 Oct 2021 16:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203867.359022; Thu, 07 Oct 2021 16:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYWhj-0007F3-67; Thu, 07 Oct 2021 16:57:11 +0000
Received: by outflank-mailman (input) for mailman id 203867;
 Thu, 07 Oct 2021 16:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYWhh-0007Ex-9E
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 16:57:09 +0000
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f83e7105-8820-41c2-913d-2f539e27b611;
 Thu, 07 Oct 2021 16:57:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z20so25231925edc.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 09:57:07 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y8sm54664ejm.104.2021.10.07.09.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 09:57:06 -0700 (PDT)
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
X-Inumbo-ID: f83e7105-8820-41c2-913d-2f539e27b611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=B3UgCCALqs9hgNIwGMJtFQOuaq80rmp71wOVGW9frv0=;
        b=YdS8vBSPgBrBJi1CwggRPfVc8yLPYGk/tvtyqEKt1tO2mCqJ7gR4TQyEDjnDW3GcfO
         9y5CcW61wWiK1oBnU4NvyHMFJseEM1LEnX3HdKn5FLRi1D/7VmTKBT/lPzwHN5jWnswH
         yfit2pHB+R19JBFipD2B0ZGU0ijuC0ya21KPyJINdwJ+RICsgtVOmNzesY4JZngQBDCo
         ASG99LwLbAW0Jv6j8QtO6pEYnXGYl/QMZVk/N44sA5Z+qdNCQkw1JEqMdA1sA9/ZDLdC
         aCY3qS6whOVziKX7btAmqhTh8JO7m4ijZpNq+poxe5KL0Rodm0hsGX8vhvtcvR2twArB
         e4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=B3UgCCALqs9hgNIwGMJtFQOuaq80rmp71wOVGW9frv0=;
        b=wupvo8RSEJTPacis7tAZSeN9MtzGPZmfq1KUTXCX5IIYeo2VctuGTQaFYap8GueSvm
         a7yJAlTK7zxFYUm/q/mGuxHhXX9snNP1xGA7FAbA6fhnEoyI7O0IJnuYm0FkRwb3h3io
         pOgvzGyz1xHTY5rxFj8PwV/fgMkAyiSCKp1RmtH+evEeiQl7nFPMyCZwRlv9CFiTvYIJ
         BkWm2bfMHFQu+pr+XX6Pf2qJrRtYOqn7ZJBg8XUjF1yTLhUioaNYiV7Ut9KJ1YXxK2j1
         GZPU33BpV06dLGlvJbV5T5DkisEKL0SrUj2K6k2gNst7oSskm6NrOkXiJvJiR/DffhBd
         doxg==
X-Gm-Message-State: AOAM531CkCXSF+b6RvOt8Qb3vPuqejPuDyvjuoD8OF3Yk7vDZnwHoaDe
	WKxSoeDkMjXlMADOxXfG8Vc=
X-Google-Smtp-Source: ABdhPJxR7Jf9toX9SzBw+AIoZ06cHm0e7ENN8DRDbcPiDNS49vbK6XlwYeveDX9GSU3e5TKQl76iMg==
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr6924947ejb.479.1633625826920;
        Thu, 07 Oct 2021 09:57:06 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9a4fb8be-e893-bd7f-fe77-7274457e2b04@gmail.com>
Date: Thu, 7 Oct 2021 19:57:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110061808570.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.10.21 04:29, Stefano Stabellini wrote:

Hi Stefano

> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen at the domain creation time and
>> advertised to it via "reg" property under hypervisor node in
>> the guest device-tree. As region 0 is reserved for grant table
>> space (always present), the indexes for extended regions are 1...N.
>> If extended regions could not be allocated for some reason,
>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>
>> Please note the following limitations:
>> - The extended region feature is only supported for 64-bit domain
>>    currently.
>> - The ACPI case is not covered.
>>
>> ***
>>
>> The algorithm to choose extended regions for non-direct mapped
>> DomU is simpler in comparison with the algorithm for direct mapped
>> Dom0. We usually have a lot of unused space above 4GB, and might
>> have some unused space below 4GB (depends on guest memory size).
>> Try to allocate separate 2MB-aligned extended regions from the first
>> (below 4GB) and second (above 4GB) RAM banks taking into the account
>> the maximum supported guest physical address space size and the amount
>> of memory assigned to the guest. The minimum size of extended region
>> the same as for Dom0 (64MB).
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> ! Stefano, Ian, Michal I dropped your A-b/R-b. I decided to change patch
>> to make it more functional !
>>
>> Changes RFC -> V2:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>>     - clear reg array in finalise_ext_region() and add a TODO
>>
>> Changes V2 -> V3:
>>     - update patch description, comments in code
>>     - only pick up regions with size >= 64MB
>>     - move the region calculation to make_hypervisor_node() and drop
>>       finalise_ext_region()
>>     - extend the list of arguments for make_hypervisor_node()
>>     - do not show warning for 32-bit domain
>>     - change the region alignment from 1GB to 2MB
>>     - move EXT_REGION_SIZE to public/arch-arm.h
>>
>> Changes V3 -> V4:
>>     - add R-b, A-b and T-b
>>
>> Changes V4 -> V5:
>>     - update patch description and comments in code
>>     - reflect changes done in previous patch to pass gpaddr_bits
>>       via createdomain domctl (struct xen_arch_domainconfig)
>>     - drop R-b, A-b and T-b
>>     - drop limit for maximum extended region size (128GB)
>>     - try to also allocate region below 4GB, optimize code
>>       for calculating extended regions
>> ---
>>   tools/libs/light/libxl_arm.c  | 80 ++++++++++++++++++++++++++++++++++++++++---
>>   xen/include/public/arch-arm.h |  2 ++
>>   2 files changed, 77 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 45e0386..cd743f7 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -600,9 +600,21 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>>       return 0;
>>   }
>>   
>> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
>> +
>>   static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>> -                                const libxl_version_info *vers)
>> +                                const libxl_version_info *vers,
>> +                                const libxl_domain_build_info *b_info,
>> +                                const struct xc_dom_image *dom)
>>   {
>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
>> +        banksize[GUEST_RAM_BANKS], bankend[GUEST_RAM_BANKS], ramsize;
>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>> +                  (GUEST_RAM_BANKS + 1)];
>> +    be32 *cells = &regs[0];
>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> +    unsigned int i, len, nr_regions = 0;
>> +    uint8_t gpaddr_bits;
>>       int res;
>>       gic_interrupt intr;
>>   
>> @@ -617,9 +629,67 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>                                 "xen,xen");
>>       if (res) return res;
>>   
>> -    /* reg 0 is grant table space */
>> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>> +        LOG(WARN, "The extended regions are only supported for 64-bit guest currently");
>> +        goto out;
>> +    }
>> +
>> +    gpaddr_bits = b_info->arch_arm.gpaddr_bits;
>> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
>> +
>> +    /*
>> +     * Try to allocate separate 2MB-aligned extended regions from the first
>> +     * (below 4GB) and second (above 4GB) RAM banks taking into the account
>> +     * the maximum supported guest physical address space size and the amount
>> +     * of memory assigned to the guest.
>> +     * As the guest memory layout is not populated yet we cannot rely on
>> +     * dom->rambank_size[], so calculate the actual size of both banks using
>> +     * "max_memkb" value.
>> +     */
>> +    ramsize = b_info->max_memkb * 1024;
>> +    if (ramsize <= GUEST_RAM0_SIZE) {
>> +        banksize[0] = ramsize;
>> +        banksize[1] = 0;
>> +    } else {
>> +        banksize[0] = GUEST_RAM0_SIZE;
>> +        banksize[1] = ramsize - GUEST_RAM0_SIZE;
>> +    }
>> +
>> +    bankend[0] = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
>> +    bankend[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
>> +
>> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> +        region_base[i] = bankbase[i] + ALIGN_UP_TO_2MB(banksize[i]);
>> +        if (bankend[i] > region_base[i])
>> +            region_size[i] = bankend[i] - region_base[i];
>> +    }
> This seems correct but it looks a bit overkill. I would have written
> like this:
>
>      if (ramsize <= GUEST_RAM0_SIZE) {
>          region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>          region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>          region_base[1] = GUEST_RAM1_BASE;
>          region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE) -
>                           region_base[0];
Why  "- region_base[0]" in last expression? I think it should be "- 
region_base[1]", the same as for "else" case (so it can be moved out of 
if-else construct). Also we need to check

that min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE) is 
greater than region_base[1] before the subtraction. If gpaddr_bits = 32 
(on Arm64) we will get incorrect result.


>      } else {
>          region_size[0] = 0;
>          region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
>          region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE) -
>                           region_base[1];
>      }
>
> Which removes the needs for banksize, bankend, bankbase. What do you
> think? Your version works too, so I am OK anyway.
Thank you for looking into this.

I think, you version will also work with adjustments. I am OK either 
way. Your version reduces the number of locals, so probably better.  
Although "min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE)" 
construction probably wants latching in local bank1end.


Below the updated version:


     if (ramsize <= GUEST_RAM0_SIZE) {
         region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
         region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
         region_base[1] = GUEST_RAM1_BASE;
     } else
         region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize - 
GUEST_RAM0_SIZE);

     bank1end = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
     if (bank1end > region_base[1])
         region_size[1] = bank1end - region_base[1];




>
>
>
>> +out:
>> +    /*
>> +     * The region 0 for grant table space must be always present. If we managed
>> +     * to allocate the extended regions then insert them as regions 1...N.
>> +     */
>> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +
>> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> +        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
>> +            continue;
>> +
>> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"\n",
>> +            nr_regions, region_base[i], region_base[i] + region_size[i]);
>> +
>> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> +                  region_base[i], region_size[i]);
>> +        nr_regions ++;
>                       ^ code style

ok


>
>
>> +    }
>> +
>> +    if (!nr_regions)
>> +        LOG(WARN, "The extended regions cannot be allocated, not enough space");
>> +
>> +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>> +        (nr_regions + 1);
>> +    res = fdt_property(fdt, "reg", regs, len);
>>       if (res) return res;
>>   
>>       /*
>> @@ -965,7 +1035,7 @@ next_resize:
>>           }
>>   
>>           FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
>> -        FDT( make_hypervisor_node(gc, fdt, vers) );
>> +        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
>>   
>>           if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>>               FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 4a01f8b..f74cc0b 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -454,6 +454,8 @@ typedef uint64_t xen_callback_t;
>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>   
>> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
>> +
>>   /* Current supported guest VCPUs */
>>   #define GUEST_MAX_VCPUS 128
>>   
>> -- 
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


