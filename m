Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0842CADA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208835.365083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1makj8-0008QK-BR; Wed, 13 Oct 2021 20:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208835.365083; Wed, 13 Oct 2021 20:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1makj8-0008OF-88; Wed, 13 Oct 2021 20:19:50 +0000
Received: by outflank-mailman (input) for mailman id 208835;
 Wed, 13 Oct 2021 20:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1makj7-0008O9-77
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:19:49 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f87377-b07c-45e5-a8a4-d7012d66b1dc;
 Wed, 13 Oct 2021 20:19:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o20so12323442wro.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 13:19:47 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l16sm397364wmj.33.2021.10.13.13.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 13:19:46 -0700 (PDT)
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
X-Inumbo-ID: e8f87377-b07c-45e5-a8a4-d7012d66b1dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tGC+9rHO3gnHvq9Yw1yYEgAt89VMye/5SsNdEzya0Yw=;
        b=c2vqZ/+0I2Spxg5KJRE2LIUrJ1xv9t4sZwqDLE6cLmFv58m6QJvPVuzDVourLtptl5
         0AVKHUyDGhwIfkEF1pt2BFpLMpLBw7IMKILLNLIdjEk0CkVJSUgKCks9TufxiCgyAN8a
         kjrFqxJ65qtbF8GhXVaS4oCUmhxQPweiixDoRZiUhr3Ej8obI+uwGc6QYBGmRnSTBHBx
         fhe/HLdGbCXVTSfKWmfLN+FKhryV/5WwLM77oR9+U3CEz/hNIla6fSHrPwIbc3+2QsHb
         SvS/RQ901hQMV7IsA5ePgnCECprKPJPq9tv+BOTvkR03vHLpgSSXLD5tUX+4253kfdN3
         5NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tGC+9rHO3gnHvq9Yw1yYEgAt89VMye/5SsNdEzya0Yw=;
        b=3QQP48VsbTSkVRTMqSf//Dvvfi8g0Vcdmloq/U4218V1xcJEuzgNTbXqG2lXSOLXpS
         IfKd+X8eAol6fnYMazB/OYDTlsX0nWSzF1nHNE2TxBsxF47+qS8DRoOzL0+44awDRqbL
         CgogA66x9XEUJKFPKq5wgG1fNhh722jp10Xg3XnAXJ0zsakt6ZQDl7WZyRG6DSICMObO
         XUopnkRhUXCDb5hjdd3wFd1sN2of5RhZj5FwcMaRB0rwRvYSksmSVgkwsCOeklb+pt+P
         okpLVl86Y7kzWp0bBebTk6e4r2FxRd3m9CzNMgYcjE2vISquP0xh8DXw3MnuQUaZLl2b
         1Daw==
X-Gm-Message-State: AOAM532wnPFiL/SPRUYTak6wG3VPsht1z2CbDLAtiTu5D0ciHVxn5Xn2
	tKY3O8TLacV1gyI3bwx88MM=
X-Google-Smtp-Source: ABdhPJwpmrCvjseFR2nYvloCUE6smGZftJtgZmR11r0qlWrOg+1dG/SZJKQfvI0EnkrBMaZnyyCUoA==
X-Received: by 2002:adf:a30b:: with SMTP id c11mr1492934wrb.289.1634156386382;
        Wed, 13 Oct 2021 13:19:46 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
From: Oleksandr <olekstysh@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <c98c1acd-86c0-f556-643e-e472b696644f@xen.org>
 <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com>
 <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
 <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
 <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
 <d076afcc-5fde-e83e-1632-371406bdd387@xen.org>
 <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com>
 <2faf58fa-2e06-635f-27fe-9ba642db27b0@xen.org>
 <0125116e-1e8a-8e68-62fb-dfc868ea76d4@gmail.com>
 <a9b9b16d-daf0-0bd3-cc1b-f3812f670e69@xen.org>
 <b2285058-360d-ebef-836e-5b87658e8847@gmail.com>
Message-ID: <510cdb07-3702-4c96-d0be-d1916e36c697@gmail.com>
Date: Wed, 13 Oct 2021 23:19:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b2285058-360d-ebef-836e-5b87658e8847@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Stefano,


On 13.10.21 21:26, Oleksandr wrote:
>
> On 13.10.21 20:07, Julien Grall wrote:
>
> Hi Julien
>
>> Hi,
>>
>> On 13/10/2021 17:44, Oleksandr wrote:
>>> On 13.10.21 19:24, Julien Grall wrote:
>>>> On 13/10/2021 16:49, Oleksandr wrote:
>>>>>
>>>>> On 13.10.21 18:15, Julien Grall wrote:
>>>>>> On 13/10/2021 14:46, Oleksandr wrote:
>>>>>>>
>>>>>>> Hi Julien
>>>>>>
>>>>>> Hi Oleksandr,
>>>>>
>>>>> Hi Julien
>>>>>
>>>>>
>>>>> Thank you for the prompt response.
>>>>>
>>>>>
>>>>>>
>>>>>>> On 13.10.21 00:43, Oleksandr wrote:
>>>>>>> diff --git a/tools/libs/light/libxl_arm.c 
>>>>>>> b/tools/libs/light/libxl_arm.c
>>>>>>> index e3140a6..53ae0f3 100644
>>>>>>> --- a/tools/libs/light/libxl_arm.c
>>>>>>> +++ b/tools/libs/light/libxl_arm.c
>>>>>>> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc 
>>>>>>> *gc, void *fdt,
>>>>>>>                                 "xen,xen");
>>>>>>>       if (res) return res;
>>>>>>>
>>>>>>> -    /* reg 0 is grant table space */
>>>>>>> +    /*
>>>>>>> +     * reg 0 is a placeholder for grant table space, reg 1...N are
>>>>>>> +     * the placeholders for extended regions.
>>>>>>> +     */
>>>>>>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>>>>>>> GUEST_ROOT_SIZE_CELLS,
>>>>>>> -                            1,GUEST_GNTTAB_BASE, 
>>>>>>> GUEST_GNTTAB_SIZE);
>>>>>>> +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 
>>>>>>> 0);
>>>>>>
>>>>>> Here you are relying on GUEST_RAM_BANKS == 2. I think this is 
>>>>>> pretty fragile as this may change in the future.
>>>>>>
>>>>>> fdt_property_regs() is not really suitable for here. I would 
>>>>>> suggest to create a new helper fdt_property_placeholder() which 
>>>>>> takes the address cells, size cells and the number of ranges. The 
>>>>>> function will then create N range that are zeroed.
>>>>>
>>>>> You are right. Probably, we could add an assert here for now to be 
>>>>> triggered if "GUEST_RAM_BANKS != 2"?
>>>>> But, if you still think we need to make it with the helper right 
>>>>> now, I will. However, I don't know how long this will take.
>>>>
>>>> I would prefer if we introduce the helper now. Below a potential 
>>>> version (not compiled):
>>>
>>>
>>> You wouldn't believe)))
>>> I decided to not wait for the answer and re-check. So, I ended up 
>>> with the similar to what you suggested below. Thank you.
>>> Yes, it will work if add missing locals. However, I initially named 
>>> it exactly as was suggested (fdt_property_placeholder) and got a 
>>> compilation error, since fdt_property_placeholder is already present.
>>> So, I was thinking to choose another name or to even open-code it, 
>>> but I see you already proposed new name fdt_property_reg_placeholder.
>>
>> Ah I didn't realize that libfdt already implemented 
>> fdt_property_placeholder(). The function sounds perfect for us (and 
>> the code is nicer :)), but unfortunately this was introdcued only in 
>> 2017. So it is possible that some distros may not ship the last libfdt.
>>
>> So for now, I think we need to implement our own. In a follow-up we 
>> could try to provide a compat layer as we did for other missing fdt_* 
>> helpers.
>>
>> Cheers,
>
>
> Well, I hope that I addressed all your comments. If so, I will prepare V7.


May I please ask, are you *preliminary* OK with new changes requested by 
Julien? The main changes are to bring finalize_*() back (hopefully there 
is a way how to downsize a placeholder), avoid relying on the fact that 
Bank 0 is always below 4GB, adding a convenient helper to create a 
placeholder for N ranges plus some code hardening, etc.


>
>
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..a780155 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -269,6 +269,21 @@ static int fdt_property_regs(libxl__gc *gc, void 
> *fdt,
>      return fdt_property(fdt, "reg", regs, sizeof(regs));
>  }
>
> +static int fdt_property_reg_placeholder(libxl__gc *gc, void *fdt,
> +                                        unsigned int addr_cells,
> +                                        unsigned int size_cells,
> +                                        unsigned int num_regs)
> +{
> +    uint32_t regs[num_regs * (addr_cells + size_cells)];
> +    be32 *cells = &regs[0];
> +    unsigned int i;
> +
> +    for (i = 0; i < num_regs; i++)
> +        set_range(&cells, addr_cells, size_cells, 0, 0);
> +
> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
> +}
> +
>  static int make_root_properties(libxl__gc *gc,
>                                  const libxl_version_info *vers,
>                                  void *fdt)
> @@ -615,9 +630,13 @@ static int make_hypervisor_node(libxl__gc *gc, 
> void *fdt,
>                                "xen,xen");
>      if (res) return res;
>
> -    /* reg 0 is grant table space */
> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
> GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +    /*
> +     * reg 0 is a placeholder for grant table space, reg 1...N are
> +     * the placeholders for extended regions.
> +     */
> +    res = fdt_property_reg_placeholder(gc, fdt, 
> GUEST_ROOT_ADDRESS_CELLS,
> +                                       GUEST_ROOT_SIZE_CELLS,
> +                                       GUEST_RAM_BANKS + 1);
>      if (res) return res;
>
>      /*
> @@ -1069,20 +1088,93 @@ static void finalise_one_node(libxl__gc *gc, 
> void *fdt, const char *uname,
>      }
>  }
>
> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> +
> +#define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> +
> +static int finalize_hypervisor_node(libxl__gc *gc, struct 
> xc_dom_image *dom)
> +{
> +    void *fdt = dom->devicetree_blob;
> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
> region_base[GUEST_RAM_BANKS],
> +        bankend[GUEST_RAM_BANKS];
> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +                  (GUEST_RAM_BANKS + 1)];
> +    be32 *cells = &regs[0];
> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    unsigned int i, len, nr_regions = 0;
> +    libxl_dominfo info;
> +    int offset, rc;
> +
> +    offset = fdt_path_offset(fdt, "/hypervisor");
> +    if (offset < 0)
> +        return offset;
> +
> +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
> +    if (rc)
> +        return rc;
> +
> +    if (info.gpaddr_bits > 64)
> +        return ERROR_INVAL;
> +
> +    /*
> +     * Try to allocate separate 2MB-aligned extended regions from the 
> first
> +     * and second RAM banks taking into the account the maximum 
> supported
> +     * guest physical address space size and the amount of memory 
> assigned
> +     * to the guest.
> +     */
> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> +        region_base[i] = bankbase[i] +
> +            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << 
> XC_PAGE_SHIFT);
> +
> +        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
> +        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
> +        if (bankend[i] > region_base[i])
> +            region_size[i] = bankend[i] - region_base[i] + 1;
> +    }
> +
> +    /*
> +     * The region 0 for grant table space must be always present. If 
> we managed
> +     * to allocate the extended regions then insert them as regions 
> 1...N.
> +     */
> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +
> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> +        if (region_size[i] < EXT_REGION_MIN_SIZE)
> +            continue;
> +
> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
> +            nr_regions, region_base[i], region_base[i] + 
> region_size[i]);
> +
> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, 
> GUEST_ROOT_SIZE_CELLS,
> +                  region_base[i], region_size[i]);
> +        nr_regions++;
> +    }
> +
> +    if (!nr_regions)
> +        LOG(WARN, "The extended regions cannot be allocated, not 
> enough space");
> +
> +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + 
> GUEST_ROOT_SIZE_CELLS) *
> +        (nr_regions + 1);
> +
> +    return fdt_setprop(fdt, offset, "reg", regs, len);
> +}
> +
>  int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>                                                 uint32_t domid,
> libxl_domain_config *d_config,
>                                                 struct xc_dom_image *dom)
>  {
>      void *fdt = dom->devicetree_blob;
> -    int i;
> +    int i, res;
>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>
>      const struct xc_dom_seg *ramdisk = dom->modules[0].blob ?
>          &dom->modules[0].seg : NULL;
>
>      if (ramdisk) {
> -        int chosen, res;
> +        int chosen;
>          uint64_t val;
>
>          /* Neither the fdt_path_offset() nor either of the
> @@ -1109,6 +1201,10 @@ int 
> libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>
>      }
>
> +    res = finalize_hypervisor_node(gc, dom);
> +    if (res)
> +        return res;
> +
>      for (i = 0; i < GUEST_RAM_BANKS; i++) {
>          const uint64_t size = (uint64_t)dom->rambank_size[i] << 
> XC_PAGE_SHIFT;
>
> diff --git a/xen/include/public/arch-arm.h 
> b/xen/include/public/arch-arm.h
> index d46c61f..96ead3d 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;
>
>  #define GUEST_RAM_BANKS   2
>
> +/*
> + * The way to find the extended regions (to be exposed to the guest 
> as unused
> + * address space) relies on the fact that the regions reserved for 
> the RAM
> + * below are big enough to also accommodate such regions.
> + */
>  #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM 
> @ 1GB */
>  #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
>
> (END)
>
>
-- 
Regards,

Oleksandr Tyshchenko


