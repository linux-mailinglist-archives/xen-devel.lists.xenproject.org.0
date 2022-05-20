Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8552F3B2
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 21:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334494.558520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns80r-0005WZ-CU; Fri, 20 May 2022 19:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334494.558520; Fri, 20 May 2022 19:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns80r-0005TV-9h; Fri, 20 May 2022 19:10:13 +0000
Received: by outflank-mailman (input) for mailman id 334494;
 Fri, 20 May 2022 19:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvDE=V4=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ns80p-0005TP-PA
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 19:10:11 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78065bfd-d870-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 21:10:10 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id u23so15931154lfc.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 May 2022 12:10:10 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a056512202900b0047255d2114csm758168lfs.123.2022.05.20.12.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 12:10:09 -0700 (PDT)
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
X-Inumbo-ID: 78065bfd-d870-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uY1JkTGiJQDhGBUBrMHucysX+YL/hEg2cKvszOSGbKg=;
        b=DL0SgxQq1+2p5MTwvw58lD34raQZPL2AxZAuaqpc51bDoWgOIwz8ogH6TKbOsPj0FC
         93jutYN1ZcFk4trCLB/2zV6sGC3aGIvvF6BU6YL5XH6DclaN+pNobLo4YDU8YznpnBSz
         gCDMfe6WQ9Yn38gZ6tSHKV19lQQHRFxMw4hf/BnGYEqJNPfVu0mregSk6wCYnEvkspIJ
         flYHSZKuKHeBgpbnpWEIYZefYq+5hj7Z/6+KcYYSK/brD/xQ3NuPWJyyt3eXaLbj4PWO
         EqOA9Q6nIduDlw3S2AAikQpEJxpParVtqDZ3kKtKHPGYPDf8TOqCNS6MoPSUILhvk82d
         APKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uY1JkTGiJQDhGBUBrMHucysX+YL/hEg2cKvszOSGbKg=;
        b=Agb1n7j2ya/DxjI+RmmOenjj6XW1PdIRu8TxHRW3nHuyHrDmkgq3v7DqtxpvZvUNbE
         hWWy1gfNYuY74V9bEgBEDEkmM21xfddDofyGVWKNnkrdDR1QxoE+QmJgbBOBIyie6etM
         2exdYjK66f+YIntFX4AKUzCr2X0KK48fLHejAzeRRsjA8DlU5HMRWtAChJfTPfA3GwG7
         AmrfkQYOFbQ8sUJK8Aty0abWcU/vLrHc9pYEfJwh4Lbg9WEJ4e7cfwinW3Sr4/hJSoZ9
         bpmWwso/8e4NTD29wFqxaEXkjzC3dg2WfsOufQ/DbjpF3AatZ4tjl042Wu+y3HxHq95J
         /Rvg==
X-Gm-Message-State: AOAM5331sW6dndrvihX363FLPCwXHaZqZBj/VkkhJKNHqcRVsccFshHd
	UtihohmC/Ve6RPerXFhejIg=
X-Google-Smtp-Source: ABdhPJzJFLH3Wv6NCJvfvq7dbR869LU1BKFDeV9atETbL8Gd0RFruC7rnOrvLTRhDd98Fli+ihUrag==
X-Received: by 2002:a05:6512:39c1:b0:473:be4f:726d with SMTP id k1-20020a05651239c100b00473be4f726dmr8116456lfu.259.1653073809875;
        Fri, 20 May 2022 12:10:09 -0700 (PDT)
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
 <755f075c-db1f-bcd3-9f0d-f5979237e431@gmail.com>
 <YoeyL1uLo+BPKUOj@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <739287eb-9fc6-af3d-a511-69e048296291@gmail.com>
Date: Fri, 20 May 2022 22:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YoeyL1uLo+BPKUOj@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.05.22 18:22, Anthony PERARD wrote:

Hello Anthony

> On Thu, May 19, 2022 at 08:16:16PM +0300, Oleksandr wrote:
>> On 18.05.22 14:05, Anthony PERARD wrote:
>>> On Tue, May 03, 2022 at 08:26:03PM +0300, Oleksandr Tyshchenko wrote:
>>>> +    for (i = 0; i < d_config->num_disks; i++) {
>>>> +        libxl_device_disk *disk = &d_config->disks[i];
>>>> +
>>>> +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>>>> +            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
>>>> +            if (!disk->base)
>>>> +                return ERROR_FAIL;
>>>> +
>>>> +            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
>>>> +            if (!disk->irq)
>>>> +                return ERROR_FAIL;
>>>> +
>>>> +            if (virtio_irq < disk->irq)
>>>> +                virtio_irq = disk->irq;
>>>> +            virtio_enabled = true;
>>>> +
>>>> +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
>>>> +                disk->vdev, disk->irq, disk->base);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (virtio_enabled)
>>>> +        nr_spis += (virtio_irq - 32) + 1;
>>> Is it possible to update "nr_spis" inside the loop?
>> yes, but ...
>>
>>
>>>    The added value
>>> seems to be "number of virtio device + 1",
>>     ... not really ...
>>
>>
>>>    so updating "nr_spis" and
>>> adding +1 after the loop could work, right?
>>     ... from my understanding, we cannot just increment nr_spis by "one"
>> inside a loop, we need to calculate it.
>>
>>
>> Something like that (not tested):
>>
>>         uint32_t spi;
>>
>>         ...
>>
>>         spi = irq - 32;
>>         if (nr_spis <= spi)
>>             nr_spis = spi + 1;
>>
>>
>> Shall I update "nr_spis" inside the loop?
>>
>> Are you asking because of eliminating "virtio_enabled" and/or "virtio_irq"
>> locals? They are used down the code.
> I'm asking because the calculation doesn't really make sense to me yet. At the
> moment "virtio_irq-32+1" happen to be the "number of disk + 1" and we
> have "nr_spis += " which I don't think makes sense with the "+1".

I see


>
> Doesn't "nr_spis" only need to be the highest irq value for the devices
> we're adding? (Maybe with +1) (also -32 because I think I understand
> what 32 stand for now) (also, the "num_irqs" loop just after this loop
> seems to do exactly that)

I also think the same, the "nr_spis" needs to cover the highest SPI.


>
> But I think what this line of code needs the most is a comment.

ok


>
>>> Also, what is "32"? Is it "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" ?
>> Although currently "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" = "32", we cannot rely
>> on this (I mean to use "GUEST_VIRTIO_MMIO_SPI_FIRST - 1"
>>
>> instead of "32"),  because "32" has yet another meaning. This is an offset
>> for SPI, the values before 32 are for private IRQs (PPI, SGI).
> Do you think it could be possible to name that value? I've seen other
> use of 32 in the same function that have probably the same meaning.

yes, all uses of "32" within current function have the same meaning.


> But
> if you don't have a good name, I guess we can also live a bit longer
> with a plain "32".

Except here in toolstack, this plain "32" is used in a few places in 
hypervisor code also.

I don't have a plan to convert this value into appropriate #define 
everywhere.

But, I can introduce local to this file #define NR_LOCAL_IRQS 32 and 
change in current function.

Shall I?


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


