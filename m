Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE052507622
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 19:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308407.524145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrNm-00069M-8i; Tue, 19 Apr 2022 17:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308407.524145; Tue, 19 Apr 2022 17:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrNm-00068D-4O; Tue, 19 Apr 2022 17:11:18 +0000
Received: by outflank-mailman (input) for mailman id 308407;
 Tue, 19 Apr 2022 17:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr1R=U5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngrNl-00067p-Fn
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 17:11:17 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9106021-c003-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 19:11:16 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id o16so21347744ljp.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 10:11:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a19ad4a000000b0044826a25a2esm1559012lfd.292.2022.04.19.10.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 10:11:14 -0700 (PDT)
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
X-Inumbo-ID: b9106021-c003-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rxPYmQa0Egn1mqp1mSydb9Om/nZ3dlYXqwZ9ZJ/h6io=;
        b=dyWdHQ6Lc1rlJ6pELKH/xYiaKPOXoQ/YcCodyE8U8e8bJBI77zlMVC+Ki6HcNSpIeZ
         hJhP6IRzUA4XCB0CBu49/DWNC2kDBRY6Pb2V4fXowbHziawlTEuj1pobxjq4/74XRzHZ
         P04N+J4pxJESMwwUZ/O2VvJMUiPQiB31BKyfGR5KU7rbwgKt2kpcI8QRn/jUpuEzNlQZ
         BF26p8IN65HWr/A4mTBhF0ZoyuOAyjgP2gt0p0gmutZfrzGiFS/zwsWUARmd/Tsv9Yab
         gn1QKQyQzIc/sGsGr4aW/kVp0yTL+K/d22SwqK1Urv8YmJlhqe2Ogkij7yMTxIpxpxDV
         wp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rxPYmQa0Egn1mqp1mSydb9Om/nZ3dlYXqwZ9ZJ/h6io=;
        b=RC7Ap+HJqCo5G/mgBlp3Xujk0yj6WMb4dMNOcKUKG81xojg0kTRqpW3Qcv529KdTxJ
         X066Uvt0wy8KUZWlifLK1m6hfFboeg3dCNsP378P1tNCdbkOyBQ7EEUvmXAs0Zh+fjQY
         vqINgtzgdH1BDe1Dv5gl+sAeo3/zombYqkd3Iq8kS7zZ7B0S1Xdv6ucP6s+8SlcnP4k5
         CAXihGrvQDySIz/JD1W1kago2EHg1eLylZPt49t+79hoGIg34wFTAI7/X4KDkV7sJnJt
         qKB6qFZMCDtptWQBL7iNEoXcnW790+O0K4jIzaBadMHnhg2/tX/dAY6+xgadQu/Je/W6
         qwpA==
X-Gm-Message-State: AOAM531SpZcvaymMgKNkHd+nNCb526ujymZoVmEr4aeS07LOlA67TEjQ
	9dkHSr79P1j698A+fYknPDc=
X-Google-Smtp-Source: ABdhPJwgqbLh/VuZRiEY2WTuxX7nyZVaNDxdTGSqSrhHfcljZTAensAc3R99HsPQkc5LdCgC/gCgEw==
X-Received: by 2002:a2e:9c43:0:b0:24b:469:2bb6 with SMTP id t3-20020a2e9c43000000b0024b04692bb6mr11327140ljj.248.1650388274392;
        Tue, 19 Apr 2022 10:11:14 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
 <YlpdBHKT1bYzZe2e@infradead.org>
 <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
 <alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop>
 <6a04cc34-fbb3-44d8-c1a4-03bda5b3deb1@gmail.com>
 <b68163be-ad43-7773-22ff-e83191886626@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5afb9e61-4164-9cc9-278a-911fc21f4f6c@gmail.com>
Date: Tue, 19 Apr 2022 20:11:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b68163be-ad43-7773-22ff-e83191886626@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hello Stefano, Juergen


On 19.04.22 17:48, Juergen Gross wrote:
> On 19.04.22 14:17, Oleksandr wrote:
>>
>> Hello Stefano, Juergen
>>
>>
>> On 18.04.22 22:11, Stefano Stabellini wrote:
>>> On Mon, 18 Apr 2022, Oleksandr wrote:
>>>> On 16.04.22 09:07, Christoph Hellwig wrote:
>>>>
>>>> Hello Christoph
>>>>
>>>>> On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini wrote:
>>>>>> This makes sense overall. Considering that the swiotlb-xen case 
>>>>>> and the
>>>>>> virtio case are mutually exclusive, I would write it like this:
>>>>> Curious question:  Why can't the same grant scheme also be used for
>>>>> non-virtio devices?  I really hate having virtio hooks in the arch
>>>>> dma code.  Why can't Xen just say in DT/ACPI that grants can be used
>>>>> for a given device?
>>> [...]
>>>
>>>> This patch series tries to make things work with "virtio" devices 
>>>> in Xen
>>>> system without introducing any modifications to code under 
>>>> drivers/virtio.
>>>
>>> Actually, I think Christoph has a point.
>>>
>>> There is nothing inherently virtio specific in this patch series or in
>>> the "xen,dev-domid" device tree binding.
>>
>>
>> Although the main intention of this series was to enable using virtio 
>> devices in Xen guests, I agree that nothing in new DMA ops layer 
>> (xen-virtio.c) is virtio specific (at least at the moment). Regarding 
>> the whole patch series I am not quite sure, as it uses 
>> arch_has_restricted_virtio_memory_access(). >
>>>   Assuming a given device is
>>> emulated by a Xen backend, it could be used with grants as well.
>>>
>>> For instance, we could provide an emulated e1000 NIC with a
>>> "xen,dev-domid" property in device tree. Linux could use grants with it
>>> and the backend could map the grants. It would work the same way as
>>> virtio-net/block/etc. Passthrough devices wouldn't have the
>>> "xen,dev-domid" property, so no problems.
>>>
>>> So I think we could easily generalize this work and expand it to any
>>> device. We just need to hook on the "xen,dev-domid" device tree
>>> property.
>>>
>>> I think it is just a matter of:
>>> - remove the "virtio,mmio" check from xen_is_virtio_device
>>> - rename xen_is_virtio_device to something more generic, like
>>>    xen_is_grants_device
>
> xen_is_grants_dma_device, please. Normal Xen PV devices are covered by
> grants, too, and I'd like to avoid the confusion arising from this.


yes, this definitely makes sense as we need to distinguish


>
>
>>> - rename xen_virtio_setup_dma_ops to something more generic, like
>>>    xen_grants_setup_dma_ops
>>>
>>> And that's pretty much it.
>>
>> + likely renaming everything in that patch series not to mention 
>> virtio (mostly related to xen-virtio.c internals).
>>
>>
>> Stefano, thank you for clarifying Christoph's point.
>>
>> Well, I am not against going this direction. Could we please make a 
>> decision on this? @Juergen, what is your opinion?
>
> Yes, why not.


ok, thank you for confirming.


>
>
> Maybe rename xen-virtio.c to grant-dma.c?


Personally I don't mind.


>
> I'd keep the XEN_VIRTIO related config option, as this will be the 
> normal use
> case. grant-dma.c should be covered by a new hidden config option 
> XEN_GRANT_DMA
> selected by XEN_VIRTIO.


I got it, ok


>
>
> CONFIG_XEN_VIRTIO should still guard 
> xen_has_restricted_virtio_memory_access().


ok


So a few questions to clarify:

1. What is the best place to keep "xen,dev-domid" binding's description 
now? I think that proposed in current series place 
(Documentation/devicetree/bindings/virtio/) is not good fit now.

2. I assume the logic in the current patch will remain the same, I mean 
we will still assign Xen grant DMA ops from xen_setup_dma_ops() here?


>
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


