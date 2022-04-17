Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F5504946
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 21:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306723.521886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngARN-0005jw-Sy; Sun, 17 Apr 2022 19:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306723.521886; Sun, 17 Apr 2022 19:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngARN-0005i5-PV; Sun, 17 Apr 2022 19:20:09 +0000
Received: by outflank-mailman (input) for mailman id 306723;
 Sun, 17 Apr 2022 19:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3EG=U3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngARL-0005hy-GU
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 19:20:07 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 636d663c-be83-11ec-8fbe-03012f2f19d4;
 Sun, 17 Apr 2022 21:20:06 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id b21so21452682lfb.5
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 12:20:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056512322300b0046bbce218f2sm1005348lfe.79.2022.04.17.12.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 12:20:05 -0700 (PDT)
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
X-Inumbo-ID: 636d663c-be83-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UX+UJJi6cm6n3siakzXlqA7VdWeUuC0amPEI0CKnoy8=;
        b=anmuYIHMR44DHUBsKUVkyea2mPIgGJA1WVaLfL42XbsYHNLQ0QX5zF1vmXuveOfZa4
         TlIHgkTCOoYjOOVnzvPRkPqi+LYsmZYW7I9daLrolOUzGvJlP00NxPg1O42tKDiJdj3F
         W9UfoOoRhm9POPkypEpow7p+m6+WvsPwt0uKdYh6rfDXjumAupEnI2eqJ5bvdLrMXSrC
         Cydz5opZP1kh8wO33oIdvdQNglyjqHQLYMwCMFJqbSQLDJLtzHIrpnxoZKpVTXJ6x3oS
         ln3RXLd9fG/Z8R9g6sIQ9UgqXuc/KTif0O4MOzEsU4QUu9/7gdRIRnOzt0xx7Xe7vU1v
         3hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UX+UJJi6cm6n3siakzXlqA7VdWeUuC0amPEI0CKnoy8=;
        b=K6HF7qVTe+WPQGz4dVgfkgGnj8LHzpc9BjTlY8/oa60meF7UmV/Zf/8uKvCLR85e9+
         3OHEJBbG6PC+sa7Fj+nTnpxujwL3EdLkq1tnlotx8M149+ncSYI3hstKdGfrQHrd8TaZ
         Qzr0FqTO4d1sT0ZG++gaasbRC8Ag3HJZ0gHTNC/Lt/PK4I7R1D6mop83hPXE4LS6ZRPP
         lTCsOts23YzLFeSWiOPZRk7zefIKGIsiVgKWKIft3O4V9g/k3gCm3lW63SkPpHGbirE7
         XRuITrypPtPvTNxWZ3ZuveayjfGw46rz3pgo2HTHvHtXqOuZn1DoeJMR5h31vAsHmX8t
         Bpug==
X-Gm-Message-State: AOAM53127Y6BzQKqBoLhJuD9Uil9qMlGXVCR6E2iJ8/GGF8o77e+8ppY
	4KPgP/r53b43DHkGURy+YWw=
X-Google-Smtp-Source: ABdhPJwipgGgKdPerX/TjaWsmOWeRcT7lQlBUqHmoX8ARPDdhaoRZak1gHU/2o+0U1HoS6YY+cJbTA==
X-Received: by 2002:a05:6512:c21:b0:471:9935:f8f2 with SMTP id z33-20020a0565120c2100b004719935f8f2mr35608lfu.650.1650223205568;
        Sun, 17 Apr 2022 12:20:05 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8df1dc60-614a-67fa-3a9d-e2db4a7e0132@gmail.com>
Date: Sun, 17 Apr 2022 22:20:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.04.22 01:02, Stefano Stabellini wrote:


Hello Stefano

> On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Call xen_virtio_setup_dma_ops() only for Xen-aware virtio devices
>> in Xen guests if restricted access to the guest memory is enabled.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   include/xen/arm/xen-ops.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
>> index 621da05..28b2ad3 100644
>> --- a/include/xen/arm/xen-ops.h
>> +++ b/include/xen/arm/xen-ops.h
>> @@ -2,12 +2,19 @@
>>   #ifndef _ASM_ARM_XEN_OPS_H
>>   #define _ASM_ARM_XEN_OPS_H
>>   
>> +#include <linux/virtio_config.h>
>>   #include <xen/swiotlb-xen.h>
>> +#include <xen/xen-ops.h>
>>   
>>   static inline void xen_setup_dma_ops(struct device *dev)
>>   {
>>   	if (xen_swiotlb_detect())
>>   		dev->dma_ops = &xen_swiotlb_dma_ops;
>> +
>> +#ifdef CONFIG_XEN_VIRTIO
>> +	if (arch_has_restricted_virtio_memory_access() && xen_is_virtio_device(dev))
>> +		xen_virtio_setup_dma_ops(dev);
>> +#endif
> This makes sense overall.


thank you


> Considering that the swiotlb-xen case and the
> virtio case are mutually exclusive, I would write it like this:
>
> 	if (arch_has_restricted_virtio_memory_access() && xen_is_virtio_device(dev))
> 		xen_virtio_setup_dma_ops(dev);
> 	else if (xen_swiotlb_detect())
> 		dev->dma_ops = &xen_swiotlb_dma_ops;


Agree, will do


>
> There is no need for #ifdef (also see other comments).


Agree, if !CONFIG_XEN_VIRTIO then xen_virtio_ are just stubs.


#ifdef CONFIG_XEN_VIRTIO
void xen_virtio_setup_dma_ops(struct device *dev);
bool xen_is_virtio_device(struct device *dev);
#else
static inline void xen_virtio_setup_dma_ops(struct device *dev)
{
}
static inline bool xen_is_virtio_device(struct device *dev)
{
     return false;
}
#endif /* CONFIG_XEN_VIRTIO */



-- 
Regards,

Oleksandr Tyshchenko


