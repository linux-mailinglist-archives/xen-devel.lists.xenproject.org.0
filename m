Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815152DB01
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 19:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333175.556959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjl8-0002cR-8W; Thu, 19 May 2022 17:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333175.556959; Thu, 19 May 2022 17:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjl8-0002Zx-5P; Thu, 19 May 2022 17:16:22 +0000
Received: by outflank-mailman (input) for mailman id 333175;
 Thu, 19 May 2022 17:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9elr=V3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nrjl6-0002Zq-Cl
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 17:16:20 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65dccd85-d797-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 19:16:19 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id e4so6456510ljb.13
 for <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 10:16:19 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a056512208500b0047255d211cfsm342560lfr.254.2022.05.19.10.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 10:16:18 -0700 (PDT)
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
X-Inumbo-ID: 65dccd85-d797-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KCMYHEZzLVzWO/NgFR4uh6OCxET/1BguPqK7/3lzzEc=;
        b=qd2s90ai+R7SPhnQJa9l8uy5s9Y8ktjDyEHqjAGmzwmChcDaLzkxByTTMTGEXqgAP4
         VMHqaV0d0It8XbO3jdeYAGXqWcDSyEKPzgHpkk/ZcAQ85mXQAG3zOy9zqIYvNLJGwT5o
         sCqv/ecRf7wUwGo+PHo0KKwkjw7fyo6eDdCTPCQm5v5hI4OKULIjDYYwzRHpvV5QsfYb
         IKNAh/M/axjlUaz+t2ghiq9MJJsuzPz0CCZ4Gwqh616IMIrJiViT0Nr8irje270fP1Sc
         AetZNAxkA1TSSImI+88Efx8gAtNmZ2YaB/TShweqhfpJLan8GoC7ms6P5Zm/O+qbDDLo
         lhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KCMYHEZzLVzWO/NgFR4uh6OCxET/1BguPqK7/3lzzEc=;
        b=qWtQweiuhECIvuv6nYY5QK+Vc6edlGfRhWiC7lOr/tqn9avGa5BkiGwwMwlSDfhnW7
         B8TCy56/p5lGrp2PAOoiUi4qk9TKGydh6P6owz/0X4/ArtAnKn6ibbyukv91fsZyZed0
         HHCjkoVXMjNRaHOeHG5j63LlpMXucgPw2X4JKlyhUIGftG7zKjHAaz/wOYI9JsQWOz2L
         jQCK8Z6Ymoxr4v6YbXLrxj80hx3n0vryIQKrLTY0UOBmSh8x1wd2kowy+gUAeNyBZgS9
         bWhvs0099NVLSiynyXdfYMnbKd20jz4Of0lQTcvSjJWqdWqFYe5BmOYZT869rlO89urr
         OiFA==
X-Gm-Message-State: AOAM5307K/KUi8HWcc+TSoJ2V8381GQ7wksLgDnf//XXbea9WZ8ZlTRY
	yxPGsudPdaZofiinQp+ZTsk=
X-Google-Smtp-Source: ABdhPJzVEeNR3HVocoYiIq8pvCH31i8/+ZUnIcZ1E9POBmJfCWmk+3HTdqCERPFxcseqriXaPp8YLg==
X-Received: by 2002:a2e:91cf:0:b0:24f:11ea:d493 with SMTP id u15-20020a2e91cf000000b0024f11ead493mr3178996ljg.408.1652980578549;
        Thu, 19 May 2022 10:16:18 -0700 (PDT)
Subject: Re: [PATCH V8 2/2] libxl: Introduce basic virtio-mmio support on Arm
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
 <1651598763-12162-3-git-send-email-olekstysh@gmail.com>
 <YoTTEBSlz0t8LslO@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <755f075c-db1f-bcd3-9f0d-f5979237e431@gmail.com>
Date: Thu, 19 May 2022 20:16:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YoTTEBSlz0t8LslO@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.05.22 14:05, Anthony PERARD wrote:

Hello Anthony


> On Tue, May 03, 2022 at 08:26:03PM +0300, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch introduces helpers to allocate Virtio MMIO params
>> (IRQ and memory region) and create specific device node in
>> the Guest device-tree with allocated params. In order to deal
>> with multiple Virtio devices, reserve corresponding ranges.
>> For now, we reserve 1MB for memory regions and 10 SPIs.
>>
>> As these helpers should be used for every Virtio device attached
>> to the Guest, call them for Virtio disk(s).
>>
>> Please note, with statically allocated Virtio IRQs there is
>> a risk of a clash with a physical IRQs of passthrough devices.
>> For the first version, it's fine, but we should consider allocating
>> the Virtio IRQs automatically. Thankfully, we know in advance which
>> IRQs will be used for passthrough to be able to choose non-clashed
>> ones.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index eef1de0..37403a2 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -8,6 +8,46 @@
>>   #include <assert.h>
>>   #include <xen/device_tree_defs.h>
>>   
>> +/*
>> + * There is no clear requirements for the total size of Virtio MMIO region.
>> + * The size of control registers is 0x100 and device-specific configuration
>> + * registers starts at the offset 0x100, however it's size depends on the device
>> + * and the driver. Pick the biggest known size at the moment to cover most
>> + * of the devices (also consider allowing the user to configure the size via
>> + * config file for the one not conforming with the proposed value).
>> + */
>> +#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
>> +
>> +static uint64_t alloc_virtio_mmio_base(libxl__gc *gc, uint64_t *virtio_mmio_base)
>> +{
>> +    uint64_t base = *virtio_mmio_base;
>> +
>> +    /* Make sure we have enough reserved resources */
>> +    if ((base + VIRTIO_MMIO_DEV_SIZE >
>> +        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE)) {
> Could you remove the second set of parentheses? I'd like the compiler to
> warn us if there's an assignment.

ok


>
>> @@ -26,8 +66,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>   {
>>       uint32_t nr_spis = 0;
>>       unsigned int i;
>> -    uint32_t vuart_irq;
>> -    bool vuart_enabled = false;
>> +    uint32_t vuart_irq, virtio_irq = 0;
>> +    bool vuart_enabled = false, virtio_enabled = false;
>> +    uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
>> +    uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
>>   
>>       /*
>>        * If pl011 vuart is enabled then increment the nr_spis to allow allocation
>> @@ -39,6 +81,30 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           vuart_enabled = true;
>>       }
>>   
>> +    for (i = 0; i < d_config->num_disks; i++) {
>> +        libxl_device_disk *disk = &d_config->disks[i];
>> +
>> +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>> +            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
>> +            if (!disk->base)
>> +                return ERROR_FAIL;
>> +
>> +            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
>> +            if (!disk->irq)
>> +                return ERROR_FAIL;
>> +
>> +            if (virtio_irq < disk->irq)
>> +                virtio_irq = disk->irq;
>> +            virtio_enabled = true;
>> +
>> +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
>> +                disk->vdev, disk->irq, disk->base);
>> +        }
>> +    }
>> +
>> +    if (virtio_enabled)
>> +        nr_spis += (virtio_irq - 32) + 1;
> Is it possible to update "nr_spis" inside the loop?

yes, but ...


>   The added value
> seems to be "number of virtio device + 1",

    ... not really ...


>   so updating "nr_spis" and
> adding +1 after the loop could work, right?

    ... from my understanding, we cannot just increment nr_spis by "one" 
inside a loop, we need to calculate it.


Something like that (not tested):

        uint32_t spi;

        ...

        spi = irq - 32;
        if (nr_spis <= spi)
            nr_spis = spi + 1;


Shall I update "nr_spis" inside the loop?

Are you asking because of eliminating "virtio_enabled" and/or 
"virtio_irq" locals? They are used down the code.


>
> Also, what is "32"? Is it "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" ?


Although currently "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" = "32", we cannot 
rely on this (I mean to use "GUEST_VIRTIO_MMIO_SPI_FIRST - 1"

instead of "32"),  because "32" has yet another meaning. This is an 
offset for SPI, the values before 32 are for private IRQs (PPI, SGI).



>
>> +
>>       for (i = 0; i < d_config->b_info.num_irqs; i++) {
>>           uint32_t irq = d_config->b_info.irqs[i];
>>           uint32_t spi;
>> @@ -787,6 +860,39 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>>       return 0;
>>   }
>>   
>> +
>> +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>> +                                 uint64_t base, uint32_t irq)
>> +{
>> +    int res;
>> +    gic_interrupt intr;
>> +    /* Placeholder for virtio@ + a 64-bit number + \0 */
>> +    char buf[24];
>> +
>> +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
> Could you use GCSPRINTF() here instead of using a buffer of a static
> size calculated by hand which is potentially wrong? Also, the return
> value of snprintf isn't checked so the string could be truncated without
> warning. So I think GCSPRINTF is better than a static buffer.

I got it, thank you for detailed explanation, will use.


>
>
>
> The rest of the patch looks fine.

Thank you.


>
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko


