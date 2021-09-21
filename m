Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BD41386A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 19:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191832.341948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSjfy-0001h4-57; Tue, 21 Sep 2021 17:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191832.341948; Tue, 21 Sep 2021 17:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSjfy-0001eq-1o; Tue, 21 Sep 2021 17:35:26 +0000
Received: by outflank-mailman (input) for mailman id 191832;
 Tue, 21 Sep 2021 17:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aS0w=OL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mSjfw-0001ek-DT
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 17:35:24 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fae314a1-2aac-499b-a095-6be0f9346101;
 Tue, 21 Sep 2021 17:35:23 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b15so566592lfe.7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 10:35:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z16sm2024386lji.41.2021.09.21.10.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 10:35:21 -0700 (PDT)
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
X-Inumbo-ID: fae314a1-2aac-499b-a095-6be0f9346101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/jP81gv1AslQYHUXA2ClcvKMKyvf+YRZSggmAzN4Okw=;
        b=m3EU9eaA86ZKspM7TYEt9E3CXhHrsQvPyi7mXjEaYQY/nJQee/9+ugHrf7pkATnotj
         EyDJ+WjC24LDo8Se/FTp9L7WdfZFKsCB7IV3Rln82aF0TTqmnwolM5j+gaxawn+cJQO3
         8oZjlpba7LBlv3Q2+Y8+SLMge9ILvKESvVtwRBYqYCLk4izDtWHKLMFYdaBRlgEH4Liu
         9yCw1pBeeK9AIHDWJ6WKpxkRDQmBfwmFIOOxXDPl5Kp+LOHHU7g+kyeofxm0VUJNOWOP
         rBqZO0HwAuE/oH8TiGvO+Re+U+VTe1se34ZqSJQffquKiEu9kedV7oeBNEKy2a3gAJI9
         tCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/jP81gv1AslQYHUXA2ClcvKMKyvf+YRZSggmAzN4Okw=;
        b=RZpu12+rDiOcjsD75SVUloVzkQX3h4gy6v37X2Tp3VkoXrniKlglGnTZsNJN9kL85/
         nmFfSg8Kb9gboirgvH2LGXqs40cByNZcNLo7sujmULmSIQSxYilHEshKGCYvzpq4uSrj
         o6fAsv59tWh8obScTQomvYSBWuNZhPTu9YOo1KIAM/yB52BGVmkTH2sq2ZOTYN6MTPS+
         Ww3xf6znYElkmqVGVV2pLWbYa7tgqHNZKS38qQw6jhLdd+7of7l4c5hsDW5aYZ0vbWix
         fjPgQ/WPR8z6eAsbGtU2fFmEFBkhx78CtXCyPh+J8bmYGKunSlrwa65lZK3KYouT9EzL
         yjrw==
X-Gm-Message-State: AOAM531F//E3vwvYo3D8LNKwx7Eh5N2hwYBINEiU9f9klR65vccyTn4j
	2gjL8ff+qfQw3JZHKnIlxg0=
X-Google-Smtp-Source: ABdhPJwkTbRmYMgJv3DIAg73LAjr6EeEywdlWgNBf5kaYNo87eNpkOMu+Il2abr/YVuRCWRS6gmSPg==
X-Received: by 2002:ac2:5442:: with SMTP id d2mr23601454lfn.275.1632245721737;
        Tue, 21 Sep 2021 10:35:21 -0700 (PDT)
Subject: Re: [PATCH V2 3/3] libxl/arm: Add handling of extended regions for
 DomU
From: Oleksandr <olekstysh@gmail.com>
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
 <d5016065-fc36-d3bf-ff69-c102ede528dc@gmail.com>
Message-ID: <5e9ea5d5-0784-9697-94a2-e528cf705614@gmail.com>
Date: Tue, 21 Sep 2021 20:35:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5016065-fc36-d3bf-ff69-c102ede528dc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Stefano

[snip]



>
>>
>>
>>> +static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image 
>>> *dom)
>>> +{
>>> +    void *fdt = dom->devicetree_blob;
>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + 
>>> GUEST_ROOT_SIZE_CELLS) * 2];
>>> +    be32 *cells = &regs[0];
>>> +    uint64_t region_size = 0, region_base, bank1end_align, 
>>> bank1end_max;
>>> +    uint32_t gpaddr_bits;
>>> +    libxl_physinfo info;
>>> +    int offset, rc;
>>> +
>>> +    offset = fdt_path_offset(fdt, "/hypervisor");
>>> +    assert(offset > 0);
>>> +
>>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>>> +        LOG(WARN, "The extended region is only supported for 64-bit 
>>> guest");
>>> +        goto out;
>>> +    }
>>> +
>>> +    rc = libxl_get_physinfo(CTX, &info);
>>> +    assert(!rc);
>>> +
>>> +    gpaddr_bits = info.gpaddr_bits;
>>> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
>>> +
>>> +    /*
>>> +     * Try to allocate single 1GB-aligned extended region from the 
>>> second RAM
>>> +     * bank (above 4GB) taking into the account the maximum 
>>> supported guest
>>> +     * address space size and the amount of memory assigned to the 
>>> guest.
>>> +     * The maximum size of the region is 128GB.
>>> +     */
>>> +    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + 
>>> GUEST_RAM1_SIZE);
>>> +    bank1end_align = GUEST_RAM1_BASE +
>>> +        ALIGN_UP_TO_GB((uint64_t)dom->rambank_size[1] << 
>>> XC_PAGE_SHIFT);
>>> +
>>> +    if (bank1end_max <= bank1end_align) {
>>> +        LOG(WARN, "The extended region cannot be allocated, not 
>>> enough space");
>>> +        goto out;
>>> +    }
>>> +
>>> +    if (bank1end_max - bank1end_align > EXT_REGION_SIZE) {
>>> +        region_base = bank1end_max - EXT_REGION_SIZE;
>>> +        region_size = EXT_REGION_SIZE;
>>> +    } else {
>>> +        region_base = bank1end_align;
>>> +        region_size = bank1end_max - bank1end_align;
>>> +    }
>>> +
>>> +out:
>>> +    /*
>>> +     * The first region for grant table space must be always present.
>>> +     * If we managed to allocate the extended region then insert it as
>>> +     * a second region.
>>> +     * TODO If we failed to allocate the region, we end up inserting
>>> +     * zero-sized region. This is because we don't know in advance 
>>> when
>>> +     * creating hypervisor node whether it would be possible to 
>>> allocate
>>> +     * a region, but we have to create a placeholder anyway. The 
>>> Linux driver
>>> +     * is able to deal with by checking the region size. We cannot 
>>> choose
>>> +     * a region when creating hypervisor node because the guest 
>>> memory layout
>>> +     * is not know at that moment (and dom->rambank_size[1] is empty).
>>> +     * We need to find a way not to expose invalid regions.
>>> +     */
>> This is not great -- it would be barely spec compliant.
>
> Absolutely agree.
>
>
>>
>> When make_hypervisor_node is called we know the max memory of the guest
>> as build_info.max_memkb should be populate, right?
>
> Right. Just a small change to pass build_info to 
> make_hypervisor_node() is needed.
>
>
>>
>> If so, we could at least detect whether we can have an extended region
>> (if not caculate the exact start address) from make_hypervisor_node.
>>
>> total_guest_memory = build_info.max_memkb * 1024;
>> rambank1_approx = total_guest_memory - GUEST_RAM0_SIZE;
>> extended_region_size = GUEST_RAM1_SIZE - rambank1_approx;
>>
>> if (extended_region_size >= MIN_EXT_REGION_SIZE)
>>      allocate_ext_region
> Good point! I will recheck that. I would prefer avoid spreading 
> extended region handling (introduce finalise_ext_region())
> and do everything from the make_hypervisor_node().
I experimented with that, so we can indeed calculate the address and 
size of extended region from make_hypervisor_node(),
there is no need for finalise_ext_region(). So, there won't be any 
zero-sized region anymore (due to unpopulated placeholder) if we fail to 
allocate extended region.
Thanks for the idea!

[snip]


-- 
Regards,

Oleksandr Tyshchenko


