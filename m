Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED742C6AA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 18:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208748.364988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mahMm-0001Ub-LO; Wed, 13 Oct 2021 16:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208748.364988; Wed, 13 Oct 2021 16:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mahMm-0001Sc-IX; Wed, 13 Oct 2021 16:44:32 +0000
Received: by outflank-mailman (input) for mailman id 208748;
 Wed, 13 Oct 2021 16:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mahMl-0001ST-B9
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 16:44:31 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c307d30a-1a34-483b-a6ab-3ab4613b0446;
 Wed, 13 Oct 2021 16:44:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k7so10308877wrd.13
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 09:44:29 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r9sm71881wrn.95.2021.10.13.09.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:44:28 -0700 (PDT)
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
X-Inumbo-ID: c307d30a-1a34-483b-a6ab-3ab4613b0446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HQsgPcpNwkbVXghJLqSPvgc74dSDApj4VkUHeZxQA/o=;
        b=Ivzq3d0T+lA7C4Q5hD6UtOqepEFzu6g884JU3pzhMbIniarKeNjrkBMjWZ8hkfwtAp
         sGc5Inut5awDe7/rrCTb6tSr0xsxtQ6V7F51hIZHYupkqSqr4uI5TWVfoiVTXpD1sWeC
         1N9wbBO3IWDN8zOI5uTx93Ar+HByq85N0YTaxW6cIqbBYWEJ6gWrQY1nUMgSNjl6bMDs
         aYRQ88gPKVTtLzF1prLg0HTF7MYn7FnabRoF+xlTP7MBUXPRl6Z7NrwIO8l9kLvqU0Bn
         7LUjjtk/xkflviXFnjIECYvYFVkTR/dGAqFYI+BbCNKMoOK+HQOL83u7kCjRx7yLVvMp
         Cu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HQsgPcpNwkbVXghJLqSPvgc74dSDApj4VkUHeZxQA/o=;
        b=POaXZdvyrXhowyCKohqJ8V+sMdihhrsGzNcjNbQwVSQ9/ZnXQAmmbfcVn5hIPyrAB4
         jpnXIxeBc1Kuz3MCmmKzCjj5tQON0X4X4zJ+q6J7Oc+nK/7p+5JfPapqIFQuinr6faeo
         nzrHxjteMd3J5fwdX/q9EQX6qufY0nMCpZghhNHOgD7RSZCnQdAhY7najpN46hp0EjDy
         DGpSuBRA+YGC0jEhnyG4/xaq17Ikcn3OX1OMVr+NdHU9Z09dHIti5awwHeN8XnWaP+Bn
         Fie/ZrcTvwXqoMn2Dgkffv1I9UdUdNmhbE3FwtRV7sufdfc+Gd7JZZHj7+fOHM93vl2Y
         bdCA==
X-Gm-Message-State: AOAM5313bOWbz0vLRDiWdbuEQ/SGepQCs8NmzWqCZvi5jUslhlbnOdEh
	XyLak9JIJHXC3P3J2hzBqJ0=
X-Google-Smtp-Source: ABdhPJygHK8nZzKTmZHNXlX7FLJyqvslmSQs9TzRPDsxKxipTPyapAc42OtVioEI015/612D8BR9Aw==
X-Received: by 2002:a7b:c393:: with SMTP id s19mr337467wmj.13.1634143468346;
        Wed, 13 Oct 2021 09:44:28 -0700 (PDT)
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
 <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com>
 <2faf58fa-2e06-635f-27fe-9ba642db27b0@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0125116e-1e8a-8e68-62fb-dfc868ea76d4@gmail.com>
Date: Wed, 13 Oct 2021 19:44:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2faf58fa-2e06-635f-27fe-9ba642db27b0@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 13.10.21 19:24, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien



>
> On 13/10/2021 16:49, Oleksandr wrote:
>>
>> On 13.10.21 18:15, Julien Grall wrote:
>>> On 13/10/2021 14:46, Oleksandr wrote:
>>>>
>>>> Hi Julien
>>>
>>> Hi Oleksandr,
>>
>> Hi Julien
>>
>>
>> Thank you for the prompt response.
>>
>>
>>>
>>>> On 13.10.21 00:43, Oleksandr wrote:
>>>> diff --git a/tools/libs/light/libxl_arm.c 
>>>> b/tools/libs/light/libxl_arm.c
>>>> index e3140a6..53ae0f3 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, 
>>>> void *fdt,
>>>>                                 "xen,xen");
>>>>       if (res) return res;
>>>>
>>>> -    /* reg 0 is grant table space */
>>>> +    /*
>>>> +     * reg 0 is a placeholder for grant table space, reg 1...N are
>>>> +     * the placeholders for extended regions.
>>>> +     */
>>>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>>>> GUEST_ROOT_SIZE_CELLS,
>>>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>>> +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 0);
>>>
>>> Here you are relying on GUEST_RAM_BANKS == 2. I think this is pretty 
>>> fragile as this may change in the future.
>>>
>>> fdt_property_regs() is not really suitable for here. I would suggest 
>>> to create a new helper fdt_property_placeholder() which takes the 
>>> address cells, size cells and the number of ranges. The function 
>>> will then create N range that are zeroed.
>>
>> You are right. Probably, we could add an assert here for now to be 
>> triggered if "GUEST_RAM_BANKS != 2"?
>> But, if you still think we need to make it with the helper right now, 
>> I will. However, I don't know how long this will take.
>
> I would prefer if we introduce the helper now. Below a potential 
> version (not compiled):


You wouldn't believe)))
I decided to not wait for the answer and re-check. So, I ended up with 
the similar to what you suggested below. Thank you.
Yes, it will work if add missing locals. However, I initially named it 
exactly as was suggested (fdt_property_placeholder) and got a 
compilation error, since fdt_property_placeholder is already present.
So, I was thinking to choose another name or to even open-code it, but I 
see you already proposed new name fdt_property_reg_placeholder.

...

libxl_arm.c:366:12: error: conflicting types for 'fdt_property_placeholder'
   366 | static int fdt_property_placeholder(libxl__gc *gc, void *fdt,
       |            ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from libxl_libfdt_compat.h:64,
                  from libxl_arm.c:3:

...


>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e0039..df59a0521412 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -269,6 +269,20 @@ static int fdt_property_regs(libxl__gc *gc, void 
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
> +
> +    for (i = 0 ; i < num_regs; i++) {
> +        set_range(&cells, addr_cells, size_cells, 0, 0);
> +    }
> +
> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
> +}
> +
>  static int make_root_properties(libxl__gc *gc,
>                                  const libxl_version_info *vers,
>
>>>> +{
>>>> +    void *fdt = dom->devicetree_blob;
>>>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
>>>> region_base[GUEST_RAM_BANKS],
>>>> +        bankend[GUEST_RAM_BANKS];
>>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + 
>>>> GUEST_ROOT_SIZE_CELLS) *
>>>> +                  (GUEST_RAM_BANKS + 1)];
>>>> +    be32 *cells = &regs[0];
>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>>> +    unsigned int i, len, nr_regions = 0;
>>>> +    libxl_dominfo info;
>>>> +    int offset, rc;
>>>> +
>>>> +    offset = fdt_path_offset(fdt, "/hypervisor");
>>>> +    assert(offset > 0);
>>>> +
>>>> +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
>>>> +    assert(!rc);
>>>> +
>>>> +    assert(info.gpaddr_bits <= 64);
>>>
>>> Neither of the two should be assert(). They should be proper check 
>>> so we don't end up with a disaster (in particularly for the former) 
>>> if there is a problem.
>>
>> I looked at the similar finalise_*(), and it looks like no one 
>> bothers with returning an error. Of course, this is not an excuse, 
>> will add a proper check.
>
> This is a bit unfortunate. I would prefer if this can be avoided for 
> new code (the more libxl__arch_domain_finalise_hw_description() can 
> already propagate the error).
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


