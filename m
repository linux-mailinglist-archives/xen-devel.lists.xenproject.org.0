Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08D42C52E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208699.364930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magVM-0000wT-Dl; Wed, 13 Oct 2021 15:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208699.364930; Wed, 13 Oct 2021 15:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magVM-0000tt-9a; Wed, 13 Oct 2021 15:49:20 +0000
Received: by outflank-mailman (input) for mailman id 208699;
 Wed, 13 Oct 2021 15:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1magVL-0000tn-GN
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:49:19 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 519353ed-b22e-465c-8b28-b9d4e1e62ede;
 Wed, 13 Oct 2021 15:49:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r18so9918904wrg.6
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 08:49:18 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h1sm5599968wmb.7.2021.10.13.08.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 08:49:16 -0700 (PDT)
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
X-Inumbo-ID: 519353ed-b22e-465c-8b28-b9d4e1e62ede
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7qGKNmUK5wRhgrPP2YOqtUvOXnh7juTN6K4uUXJPHtI=;
        b=lPgdm2K/+OvSPiWXvX1QlQaBCKzPlEfcmc+ET1pvzdP3/L2zY0HQb9C3xAHUec97Oq
         WFXN1dmxeyA8Vnwsq2t956m9T2DOe3UWsRwY05RKXtOzClClTLOVxdHuikOnEdJ3Pj7+
         iMvx0cdKP3rcliQtCOuKqZMZMSevrQo1lGei3laaVbKmwm4ij9Lq6M8ofd3iutaSWZDj
         fmOCFst1Gg/Tn8/Rc0/EEaqVg6HXGAMBAzjZv2282o5LF7RAIz7eiCuFE2OZUCAb5ihD
         lOPDyqiJLKBBtMjTioVsv/eCZLrGuwcSxGQqPJtbLf/uJN86znjXvVSxHugZPtLjq9ud
         9R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7qGKNmUK5wRhgrPP2YOqtUvOXnh7juTN6K4uUXJPHtI=;
        b=3B3ATBdi7mdt0ge0ZsnPCbcDPFmODkyt2fHatXcvxJFVQzm6NUsdTSSIDShj4RopVM
         Yi74m6ZxWnJqlcnGKhVY4NbhVWFbd2ywvbqVfC2OSe/6DvqMJMVQ/pm+/TCvclZ37JOS
         sNuhECNc22PrnUg0GmLrAgCN+HicXc6BP2u1pY5sx/DqXG8m8JI790c5759ea6f9F+A7
         surBrtW0XkkXPoAL0z6pVRtpk/zbvLXcMvWwUI6IkEJA53T4JayAyeE99RfX9H8TJayp
         Vu3cvzhhzfRLjOJWkvnNF1ooliY3zOdSXfneNv9Jb7TZy3sw3qFDEhMGWu8PrOgKnXzq
         V+og==
X-Gm-Message-State: AOAM532C/jzUIvgeK+8lbZ6XWUqDQPaMhm5gZeeH4G4lln5/fDMftLl1
	vPqMlBrbO16or3jjLEQ07uw=
X-Google-Smtp-Source: ABdhPJzfHoqzyzG6pSIKGyb6cJgH1cuuxKSwsl1Hi19313K4OYnlCNNXpRPXbTTlPykaSPhNxzy7lA==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr51089wmc.108.1634140157395;
        Wed, 13 Oct 2021 08:49:17 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Julien Grall <julien@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <c98c1acd-86c0-f556-643e-e472b696644f@xen.org>
 <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com>
 <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
 <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
 <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
 <d076afcc-5fde-e83e-1632-371406bdd387@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com>
Date: Wed, 13 Oct 2021 18:49:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d076afcc-5fde-e83e-1632-371406bdd387@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 13.10.21 18:15, Julien Grall wrote:
> On 13/10/2021 14:46, Oleksandr wrote:
>>
>> Hi Julien
>
> Hi Oleksandr,

Hi Julien


Thank you for the prompt response.


>
>> On 13.10.21 00:43, Oleksandr wrote:
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index e3140a6..53ae0f3 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, 
>> void *fdt,
>>                                 "xen,xen");
>>       if (res) return res;
>>
>> -    /* reg 0 is grant table space */
>> +    /*
>> +     * reg 0 is a placeholder for grant table space, reg 1...N are
>> +     * the placeholders for extended regions.
>> +     */
>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>> GUEST_ROOT_SIZE_CELLS,
>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 0);
>
> Here you are relying on GUEST_RAM_BANKS == 2. I think this is pretty 
> fragile as this may change in the future.
>
> fdt_property_regs() is not really suitable for here. I would suggest 
> to create a new helper fdt_property_placeholder() which takes the 
> address cells, size cells and the number of ranges. The function will 
> then create N range that are zeroed.

You are right. Probably, we could add an assert here for now to be 
triggered if "GUEST_RAM_BANKS != 2"?
But, if you still think we need to make it with the helper right now, I 
will. However, I don't know how long this will take.


>
>
>>       if (res) return res;
>>
>>       /*
>> @@ -1069,6 +1072,74 @@ static void finalise_one_node(libxl__gc *gc, 
>> void *fdt, const char *uname,
>>       }
>>   }
>>
>> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
>> +
>> +static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image 
>> *dom)
>
> The function is doing more than finalizing extend regions, it also 
> create the grant table regs. So how about naming it: 
> finalize_hypervisor_node()?

ok, I don't mind.


>
>
>> +{
>> +    void *fdt = dom->devicetree_blob;
>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
>> region_base[GUEST_RAM_BANKS],
>> +        bankend[GUEST_RAM_BANKS];
>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>> +                  (GUEST_RAM_BANKS + 1)];
>> +    be32 *cells = &regs[0];
>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> +    unsigned int i, len, nr_regions = 0;
>> +    libxl_dominfo info;
>> +    int offset, rc;
>> +
>> +    offset = fdt_path_offset(fdt, "/hypervisor");
>> +    assert(offset > 0);
>> +
>> +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
>> +    assert(!rc);
>> +
>> +    assert(info.gpaddr_bits <= 64);
>
> Neither of the two should be assert(). They should be proper check so 
> we don't end up with a disaster (in particularly for the former) if 
> there is a problem.

I looked at the similar finalise_*(), and it looks like no one bothers 
with returning an error. Of course, this is not an excuse, will add a 
proper check.


>
>
>> +
>> +    /*
>> +     * Try to allocate separate 2MB-aligned extended regions from 
>> the first
>> +     * and second RAM banks taking into the account the maximum 
>> supported
>> +     * guest physical address space size and the amount of memory 
>> assigned
>> +     * to the guest.
>> +     */
>> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> +        region_base[i] = bankbase[i] +
>> +            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << 
>> XC_PAGE_SHIFT);
>> +
>> +        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
>> +        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
>> +        if (bankend[i] > region_base[i])
>> +            region_size[i] = bankend[i] - region_base[i] + 1;
>> +    } > +
>> +    /*
>> +     * The region 0 for grant table space must be always present. If 
>> we managed
>> +     * to allocate the extended regions then insert them as regions 
>> 1...N.
>> +     */
>> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +
>> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> +        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
>> +            continue;
>> +
>> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
>> +            nr_regions, region_base[i], region_base[i] + 
>> region_size[i]);
>> +
>> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, 
>> GUEST_ROOT_SIZE_CELLS,
>> +                  region_base[i], region_size[i]);
>> +        nr_regions++;
>> +    }
>> +
>> +    if (!nr_regions)
>> +        LOG(WARN, "The extended regions cannot be allocated, not 
>> enough space");
>> +
>> +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + 
>> GUEST_ROOT_SIZE_CELLS) *
>> +        (nr_regions + 1);
>> +    rc = fdt_setprop(fdt, offset, "reg", regs, len);
>> +    assert(!rc);
>
> We should propagate the error.

ok, will propagate, it looks like an upper layer 
libxl__arch_domain_finalise_hw_description() also needs to propagate it.


>
>
>> +}
>> +
>>   int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>>                                                  uint32_t domid,
>> libxl_domain_config *d_config,
>> @@ -1109,6 +1180,8 @@ int 
>> libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>>
>>       }
>>
>> +    finalise_ext_region(gc, dom);
>> +
>>       for (i = 0; i < GUEST_RAM_BANKS; i++) {
>>           const uint64_t size = (uint64_t)dom->rambank_size[i] << 
>> XC_PAGE_SHIFT;
>>
>> diff --git a/xen/include/public/arch-arm.h 
>> b/xen/include/public/arch-arm.h
>> index d46c61f..7425a78 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;
>>
>>   #define GUEST_RAM_BANKS   2
>>
>> +/*
>> + * The way to find the extended regions (to be exposed to the guest 
>> as unused
>> + * address space) relies on the fact that the regions reserved for 
>> the RAM
>> + * below are big enough to also accommodate such regions.
>> + */
>>   #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low 
>> RAM @ 1GB */
>>   #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
>>
>> @@ -451,6 +456,8 @@ typedef uint64_t xen_callback_t;
>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>
>> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 
>> 64MB */
>
> I would prefer if this value is not part of the public header because 
> this is not a value that the hypervisor needs to know. So it is better 
> to restrict it to the libxl_arm.c

ok, will do.


-- 
Regards,

Oleksandr Tyshchenko


