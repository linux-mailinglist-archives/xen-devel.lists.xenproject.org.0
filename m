Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF06412734
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 22:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191185.341131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSPa3-0007Oj-IZ; Mon, 20 Sep 2021 20:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191185.341131; Mon, 20 Sep 2021 20:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSPa3-0007MV-FB; Mon, 20 Sep 2021 20:07:59 +0000
Received: by outflank-mailman (input) for mailman id 191185;
 Mon, 20 Sep 2021 20:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujlw=OK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mSPa2-0007MP-DV
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 20:07:58 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f35bc1c-13f8-4372-aec9-67c0eaeba79e;
 Mon, 20 Sep 2021 20:07:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i25so73147155lfg.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 13:07:57 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w2sm1146323lfn.298.2021.09.20.13.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 13:07:55 -0700 (PDT)
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
X-Inumbo-ID: 7f35bc1c-13f8-4372-aec9-67c0eaeba79e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hAx0+cboWTss++cU2Cv+F5KhT5Bih7JomoByhdbei04=;
        b=Ly9VR/XezOqcpC/y6IfrYS+pVg6iQ/e9IYnAJX51T1WmJry3VyVErbugyndwRrlSSu
         UUfit7Fa2zQFJrSIMPcVetXeLfvMmYbtxmn9hWa/p48vLAFj24I9uU43gIkKQBXK9gl/
         sj4LVZTKpZ1+qeDmutU+osi5O638B5XrEYw7/cPLkPTVv+HuRPLj4vTx3ILZ9dsOBoLb
         hg++D7eX9sCdULVaBSiV6AzwQYom0o3D9Ya8UqnxIXMtsfZYibeNJ2r75VZkLp+v266w
         UBeY6Ww9N0WEDjnfcr10X5XNfdtR0SCcvTQqf1JpVEpQv4ldNguhsi2HSoW5TZftpiDw
         RmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hAx0+cboWTss++cU2Cv+F5KhT5Bih7JomoByhdbei04=;
        b=RYLbgJQmHfvUH6tloDSOx77XNCm41jNvIyVc+WdRbbGc65HPG0l1UsdDQmg0KauE5D
         enNJJzzgmjyQJRMP3uB/OUfjjqU4T8bxeQDln38vi9DxYOZGw+HCsbXMlRh3WNYjnzNZ
         ygNVypljzxTrhdFyRiEpwEOrD0sIifaVkoH8jnr7Zh/jgPcpv/Wy1v589K8itjVibyoA
         yMnUOGKrl3yl8Ci7w5+pp9b40g8cffNDAlau1I2J6VMRF33czFmM+iHzoDYO6FMccgNx
         g1YzVBUD+DfvyE/pHV4d2We1eraNsEY0Wv2R8n7/0CRnlzXJ6rYBP9BE9l7OAU9BZIMh
         0rXA==
X-Gm-Message-State: AOAM533Ah/JiVm1x5GDCd7MfqQBfg2oircihaZGvDBfLxgBr/GCA5vR0
	qx/SCuumk+LyfX4GgDCuek8=
X-Google-Smtp-Source: ABdhPJzBtAI3L6L36hEFt9cP4DPGKMoQ+h+jNXNTj9i7/APqkmnPCWU7ZIdt63wXA4XmbqOm2mfVhg==
X-Received: by 2002:a2e:901a:: with SMTP id h26mr23668633ljg.76.1632168475994;
        Mon, 20 Sep 2021 13:07:55 -0700 (PDT)
Subject: Re: [PATCH V2 3/3] libxl/arm: Add handling of extended regions for
 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109161516350.21985@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d5016065-fc36-d3bf-ff69-c102ede528dc@gmail.com>
Date: Mon, 20 Sep 2021 23:07:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109161516350.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.09.21 01:35, Stefano Stabellini wrote:

Hi Stefano

> On Fri, 10 Sep 2021, Oleksandr Tyshchenko wrote:
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
>> - The extended region feature is only supported for 64-bit domain.
>> - The ACPI case is not covered.
>>
>> ***
>>
>> The algorithm to choose extended regions for non-direct mapped
>> DomU is simpler in comparison with the algorithm for direct mapped
>> Dom0. As we have a lot of unused space above 4GB, provide single
>> 1GB-aligned region from the second RAM bank taking into the account
>> the maximum supported guest address space size and the amount of
>> memory assigned to the guest. The maximum size of the region is 128GB.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes since RFC:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>>     - clear reg array in finalise_ext_region() and add a TODO
>> ---
>>   tools/libs/light/libxl_arm.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index e3140a6..8c1d9d7 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>                                 "xen,xen");
>>       if (res) return res;
>>   
>> -    /* reg 0 is grant table space */
>> +    /*
>> +     * reg 0 is a placeholder for grant table space, reg 1 is a placeholder
>> +     * for the extended region.
>> +     */
>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +                            2, 0, 0, 0, 0);
>>       if (res) return res;
>>   
>>       /*
>> @@ -1069,6 +1072,86 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
>>       }
>>   }
>>   
>> +#define ALIGN_UP_TO_GB(x)   (((x) + GB(1) - 1) & (~(GB(1) - 1)))
> Why do we need to align it to 1GB when for Dom0 is aligned to 2MB? I
> think it makes sense to have the same alignment requirement.
Here, unlike with Dom0, we can provide indeed a big region (the maximum 
size is 128GB), so I decided to use maximum block size for the alignment.
ok, I will use 2MB alignment to be consistent will Dom0.


>
>
>> +
>> +#define EXT_REGION_SIZE   GB(128)
> The region needs to be described in xen/include/public/arch-arm.h like
> GUEST_RAM1_BASE/SIZE.

ok, will do


>
>
>> +static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image *dom)
>> +{
>> +    void *fdt = dom->devicetree_blob;
>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>> +    be32 *cells = &regs[0];
>> +    uint64_t region_size = 0, region_base, bank1end_align, bank1end_max;
>> +    uint32_t gpaddr_bits;
>> +    libxl_physinfo info;
>> +    int offset, rc;
>> +
>> +    offset = fdt_path_offset(fdt, "/hypervisor");
>> +    assert(offset > 0);
>> +
>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>> +        LOG(WARN, "The extended region is only supported for 64-bit guest");
>> +        goto out;
>> +    }
>> +
>> +    rc = libxl_get_physinfo(CTX, &info);
>> +    assert(!rc);
>> +
>> +    gpaddr_bits = info.gpaddr_bits;
>> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
>> +
>> +    /*
>> +     * Try to allocate single 1GB-aligned extended region from the second RAM
>> +     * bank (above 4GB) taking into the account the maximum supported guest
>> +     * address space size and the amount of memory assigned to the guest.
>> +     * The maximum size of the region is 128GB.
>> +     */
>> +    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
>> +    bank1end_align = GUEST_RAM1_BASE +
>> +        ALIGN_UP_TO_GB((uint64_t)dom->rambank_size[1] << XC_PAGE_SHIFT);
>> +
>> +    if (bank1end_max <= bank1end_align) {
>> +        LOG(WARN, "The extended region cannot be allocated, not enough space");
>> +        goto out;
>> +    }
>> +
>> +    if (bank1end_max - bank1end_align > EXT_REGION_SIZE) {
>> +        region_base = bank1end_max - EXT_REGION_SIZE;
>> +        region_size = EXT_REGION_SIZE;
>> +    } else {
>> +        region_base = bank1end_align;
>> +        region_size = bank1end_max - bank1end_align;
>> +    }
>> +
>> +out:
>> +    /*
>> +     * The first region for grant table space must be always present.
>> +     * If we managed to allocate the extended region then insert it as
>> +     * a second region.
>> +     * TODO If we failed to allocate the region, we end up inserting
>> +     * zero-sized region. This is because we don't know in advance when
>> +     * creating hypervisor node whether it would be possible to allocate
>> +     * a region, but we have to create a placeholder anyway. The Linux driver
>> +     * is able to deal with by checking the region size. We cannot choose
>> +     * a region when creating hypervisor node because the guest memory layout
>> +     * is not know at that moment (and dom->rambank_size[1] is empty).
>> +     * We need to find a way not to expose invalid regions.
>> +     */
> This is not great -- it would be barely spec compliant.

Absolutely agree.


>   
>
> When make_hypervisor_node is called we know the max memory of the guest
> as build_info.max_memkb should be populate, right?

Right. Just a small change to pass build_info to make_hypervisor_node() 
is needed.


>
> If so, we could at least detect whether we can have an extended region
> (if not caculate the exact start address) from make_hypervisor_node.
>
> total_guest_memory = build_info.max_memkb * 1024;
> rambank1_approx = total_guest_memory - GUEST_RAM0_SIZE;
> extended_region_size = GUEST_RAM1_SIZE - rambank1_approx;
>
> if (extended_region_size >= MIN_EXT_REGION_SIZE)
>      allocate_ext_region
Good point! I will recheck that. I would prefer avoid spreading extended 
region handling (introduce finalise_ext_region())
and do everything from the make_hypervisor_node().


>
>
>> +    memset(regs, 0, sizeof(regs));
>> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +    if (region_size > 0) {
> I think we want to check against a minimum amount rather than 0. Maybe 64MB?

Sounds reasonable, will update.


>
>
>> +        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
>> +            region_base, region_base + region_size);
>> +
>> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>> +                  region_base, region_size);
>> +    }
>> +
>> +    rc = fdt_setprop_inplace(fdt, offset, "reg", regs, sizeof(regs));
>> +    assert(!rc);
>> +}
>> +
>>   int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>>                                                  uint32_t domid,
>>                                                  libxl_domain_config *d_config,
>> @@ -1109,6 +1192,8 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>>   
>>       }
>>   
>> +    finalise_ext_region(gc, dom);
>> +
>>       for (i = 0; i < GUEST_RAM_BANKS; i++) {
>>           const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
>>   
>> -- 
>> 2.7.4


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


