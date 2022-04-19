Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664BC506555
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 09:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307809.523117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghxG-0004cv-Sx; Tue, 19 Apr 2022 07:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307809.523117; Tue, 19 Apr 2022 07:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghxG-0004af-Q9; Tue, 19 Apr 2022 07:07:18 +0000
Received: by outflank-mailman (input) for mailman id 307809;
 Tue, 19 Apr 2022 07:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr1R=U5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nghxF-0004aZ-WA
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 07:07:18 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5893d690-bfaf-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 09:07:16 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id bu29so27834294lfb.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 00:07:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bj8-20020a2eaa88000000b0024c8f61c960sm1409303ljb.41.2022.04.19.00.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 00:07:15 -0700 (PDT)
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
X-Inumbo-ID: 5893d690-bfaf-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g3qSZKngG45zSw5fBOwAtc0YdEsjG3JU5BfHsaq0LiQ=;
        b=bkXlqnuB/kolbwrMRuelZiUz+bjx4L1bO1ZqN8R+28AZ++I5eKCYHBe1xjBXzlWiCy
         tm2xx3/ZIRQQK5r4LjrpGfHPN90P6P+9sF0lniTjU6rb8NzW3VE7v3ie9SebGbsiOL+y
         pEepcyfENM5C12Vsb+ymllAq+g0F6PwAeHKyAfP2HJkl6jLQy65jtpQmgBQEyYIiKzac
         W3sduDxvIbcHDN7T8n33cqZlbwD4LI4iOhmDIdiSwcy/FSQrwbJcv5/RrBn4YsOWlxN/
         iUcbpMc9lyj0umNQzvA3RTnJ5QxCCFxjuw5iRc9mlCLNlkTwXdkcAcgA7owwPMu5PF1p
         7n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g3qSZKngG45zSw5fBOwAtc0YdEsjG3JU5BfHsaq0LiQ=;
        b=xjMdrLqCEl3OxQ/D4VRpfCr5apvMSklzvXBwG6IfVLVzdOhhyAHGLOZU775rflsLVs
         f77yNUbEsMIrfEWDexdeMZAICc2dNvW4r5BTntKwjAnSCGDxJxdnzNPvrgiIEkX4RyBp
         X9C1mrvRdVJeQpFx/HVfxbw79rnXQ1AvaB2VJK2w+Wxb+dRprMg2M8QPmjeIxtWEFJGr
         GTDx/9aVvPxMUx+ck/cMqn5bLKX36Xr5hmFKi3+cwRS+hr9wScd68YVTeiyOHOgqIA74
         jn6OEBNCBAYTTAVcgBnolSXY+3NZBmKLG9VRVzvXhJGVBXEEfNuE6gy5UwQcE4quJUQC
         HVwQ==
X-Gm-Message-State: AOAM530bvKvmsQL3/RfrV8p2/nTshjG6XTenlRmBYRdg4HjzwnnBvA7Y
	j5FwN65ED9K30tg5OtupcHU=
X-Google-Smtp-Source: ABdhPJwDlGWpSl1i/brX4urC/IsF/MofoGsuVdPTpja8M3Fb4G4QIrCtIfbTCa+qgQ0eevhFxEs4AQ==
X-Received: by 2002:a05:6512:b0b:b0:44a:f4a5:b519 with SMTP id w11-20020a0565120b0b00b0044af4a5b519mr10591701lfu.287.1650352036268;
        Tue, 19 Apr 2022 00:07:16 -0700 (PDT)
Subject: Re: [RFC PATCH 4/6] virtio: Various updates to xen-virtio DMA ops
 layer
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151302350.915916@ubuntu-linux-20-04-desktop>
 <84f5264c-6b98-6d56-b7ca-61c19dc502ca@gmail.com>
 <alpine.DEB.2.22.394.2204181156280.915916@ubuntu-linux-20-04-desktop>
 <de61ab3a-a6e9-0209-f06a-dc04d3b14f5d@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5d2ba980-5efc-e2cb-1962-2056e1fffe7c@gmail.com>
Date: Tue, 19 Apr 2022 10:07:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <de61ab3a-a6e9-0209-f06a-dc04d3b14f5d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hello Stefano, Juergen


On 19.04.22 09:58, Juergen Gross wrote:
> On 18.04.22 21:11, Stefano Stabellini wrote:
>> On Sun, 17 Apr 2022, Oleksandr wrote:
>>> On 16.04.22 01:02, Stefano Stabellini wrote:
>>>> On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> In the context of current patch do the following:
>>>>> 1. Update code to support virtio-mmio devices
>>>>> 2. Introduce struct xen_virtio_data and account passed virtio devices
>>>>>      (using list) as we need to store some per-device data
>>>>> 3. Add multi-page support for xen_virtio_dma_map(unmap)_page 
>>>>> callbacks
>>>>> 4. Harden code against malicious backend
>>>>> 5. Change to use alloc_pages_exact() instead of __get_free_pages()
>>>>> 6. Introduce locking scheme to protect mappings (I am not 100% sure
>>>>>      whether per-device lock is really needed)
>>>>> 7. Handle virtio device's DMA mask
>>>>> 8. Retrieve the ID of backend domain from DT for virtio-mmio device
>>>>>      instead of hardcoding it.
>>>>>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> ---
>>>>>    arch/arm/xen/enlighten.c |  11 +++
>>>>>    drivers/xen/Kconfig      |   2 +-
>>>>>    drivers/xen/xen-virtio.c | 200
>>>>> ++++++++++++++++++++++++++++++++++++++++++-----
>>>>>    include/xen/xen-ops.h    |   5 ++
>>>>>    4 files changed, 196 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>>>>> index ec5b082..870d92f 100644
>>>>> --- a/arch/arm/xen/enlighten.c
>>>>> +++ b/arch/arm/xen/enlighten.c
>>>>> @@ -409,6 +409,17 @@ int __init arch_xen_unpopulated_init(struct 
>>>>> resource
>>>>> **res)
>>>>>    }
>>>>>    #endif
>>>>>    +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>>>>> +int arch_has_restricted_virtio_memory_access(void)
>>>>> +{
>>>>> +    if (IS_ENABLED(CONFIG_XEN_HVM_VIRTIO_GRANT) && xen_hvm_domain())
>>>>> +        return 1;
>>>> Instead of xen_hvm_domain(), you can just use xen_domain(). Also there
>>>> is no need for the #ifdef
>>>> CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS, given that:
>>>>
>>>> CONFIG_XEN_HVM_VIRTIO_GRANT depends on XEN_VIRTIO which selects
>>>> ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>>>
>>>
>>> Yes, but please see my comments in commit #2 regarding
>>> CONFIG_XEN_HVM_VIRTIO_GRANT option and
>>> arch_has_restricted_virtio_memory_access() on Arm.
>>>
>>> I propose to have the following on Arm:
>>>
>>> int arch_has_restricted_virtio_memory_access(void)
>>> {
>>>       return xen_has_restricted_virtio_memory_access();
>>> }
>>>
>>>
>>> where common xen.h contain a helper to be used by both Arm and x86:
>>>
>>> static inline int xen_has_restricted_virtio_memory_access(void)
>>> {
>>>       if (IS_ENABLED(CONFIG_XEN_VIRTIO) && (xen_pv_domain() ||
>>> xen_hvm_domain()))
>>>           return 1;
>>>
>>>       return 0;
>>> }
>>>
>>>
>>> But I would be happy with what you propose as well.
>>
>> As I wrote in the previous reply, I also prefer to share the code
>> between x86 and ARM, and I think it could look like:
>>
>> int arch_has_restricted_virtio_memory_access(void)
>> {
>>       return xen_has_restricted_virtio_memory_access();
>> }
>> [...]
>> static inline int xen_has_restricted_virtio_memory_access(void)
>> {
>>       return (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain());
>> }
>>
>> But let's check with Juergen and Boris.


for the record, it is already clarified in commit #2, I will use this 
variant.


>>
>>
>>
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
>>>>> +#endif
>>>>> +
>>>>>    static void __init xen_dt_guest_init(void)
>>>>>    {
>>>>>        struct device_node *xen_node;
>>>>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>>>>> index fc61f7a..56afe6a 100644
>>>>> --- a/drivers/xen/Kconfig
>>>>> +++ b/drivers/xen/Kconfig
>>>>> @@ -347,7 +347,7 @@ config XEN_VIRTIO
>>>>>      config XEN_HVM_VIRTIO_GRANT
>>>>>        bool "Require virtio for fully virtualized guests to use grant
>>>>> mappings"
>>>>> -    depends on XEN_VIRTIO && X86_64
>>>>> +    depends on XEN_VIRTIO && (X86_64 || ARM || ARM64)
>>>> you can remove the architectural dependencies
>>>
>>>
>>> According to the conversation in commit #2 we are considering just a 
>>> single
>>> XEN_VIRTIO option, but it is going to has the
>>> same architectural dependencies: (X86_64 || ARM || ARM64)
>>>
>>> By removing the architectural dependencies here, we will leave also 
>>> X86_32
>>> covered (neither XEN_HVM_VIRTIO_GRANT nor XEN_PV_VIRTIO covered it). 
>>> I don't
>>> know whether it is ok or not.
>>>
>>> Shall I remove dependencies anyway?
>>
>> No, good point. I don't know about X86_32. This is another detail where
>> Juergen or Boris should comment.
>
> X86_32 should in theory work (it is HVM/PVH only, as PV 32-bit guests 
> are no
> longer supported).


ok, thank you for confirming. I will drop architectural dependencies then.


>
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


