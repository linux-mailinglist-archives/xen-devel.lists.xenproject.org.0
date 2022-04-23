Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8D850CB3D
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 16:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311643.528905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niGrP-0006CK-0d; Sat, 23 Apr 2022 14:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311643.528905; Sat, 23 Apr 2022 14:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niGrO-0006AY-TZ; Sat, 23 Apr 2022 14:35:42 +0000
Received: by outflank-mailman (input) for mailman id 311643;
 Sat, 23 Apr 2022 14:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJIN=VB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1niGrN-0006AS-AR
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 14:35:41 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5c32397-c312-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 16:35:40 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id w19so18949089lfu.11
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 07:35:40 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a19560a000000b0046d1707fcbdsm640495lfb.215.2022.04.23.07.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 07:35:38 -0700 (PDT)
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
X-Inumbo-ID: a5c32397-c312-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5Ob5FZ3XWHH7ndiX9e02UPLlc8ptKYdQZQQb2q10kFk=;
        b=edcQjFzK13CxlrO3DRi39U1HLX1VBiZdMToLxtPriW5w54rke5iEMAjcSbz0qLKiU1
         6Dg/+t7jlWN4zLOE4R7gc+Oiehyx44/fBegjF9CUPZTdazhsEq5kmlyBBIDrFcpJ2UXh
         39lAPieblL9SemJymxB3+VitLdVV4ID+j2PN+nuGr61uKUGz8IVRPkA+fobqsdBAqXKq
         ApWZOKdhVIcgtmhqGwlNCdGSukJgvhZDorgcmTlkv0mfPzZ/PfSWiA/hCgs5Wv2oL+vK
         XJZN28Yak1op0o0AkGamHUIANzbptaiH+ktbXi6pl22teiG63KGXxIYyM50hdzwzZcwU
         6EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5Ob5FZ3XWHH7ndiX9e02UPLlc8ptKYdQZQQb2q10kFk=;
        b=nfsLed2CNQT4bW/7ImaZ9jJlMRtCiVF8IhpokrScogc+XWQ7wmyuoWJd8tqIJqG8vs
         x9qXscoP0+Vv4Et4KNHl5BU95J1WLyRbzkAPzaEnf1cmDOnLAx0WR4EgiZ42qaXbyTAl
         ozv36q7UADdAb4i/dbOcBpFDY3fOH0OjTcEZr6Y/7LDoVRe7RVWoXllHVGHVy5Nm/0bd
         gnzoG7UBM9XomyOMW6cnjaqITTeGa5pbzSlHeHg1eBRklgoqR9P//VftvBrKuk5v80dX
         +ag+BuQ9+DCLIVn/sVmPcTcUOJE00a8aobmHuc2PohCe/DQjlXK0cK/ED/GedI8Ib8I5
         gywg==
X-Gm-Message-State: AOAM531u4ZeJzFsp8ox7yYCBSg0Hjet+aKqntpC9dyI6ofnf7mp9QTP6
	tBjp2bZaa5Df6UneYGabsek=
X-Google-Smtp-Source: ABdhPJzuBm8Fq2ksLNZubEsggwEds0YNor4simf+758e/Wch36unqYhiwGrQiA/w92oNFg+B4tk+9w==
X-Received: by 2002:a05:6512:2348:b0:471:92ac:3bfd with SMTP id p8-20020a056512234800b0047192ac3bfdmr6525788lfu.199.1650724539295;
        Sat, 23 Apr 2022 07:35:39 -0700 (PDT)
Subject: Re: [PATCH V1 1/6] arm/xen: Introduce xen_setup_dma_ops()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@redhat.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Kees Cook <keescook@chromium.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204221509220.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a1112ea4-6eb9-f4ec-745d-e28c41fd1930@gmail.com>
Date: Sat, 23 Apr 2022 17:35:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204221509220.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 23.04.22 01:59, Stefano Stabellini wrote:


Hello Stefano


> On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch introduces new helper and places it in new header.
>> The helper's purpose is to assign any Xen specific DMA ops in
>> a single place. For now, we deal with xen-swiotlb DMA ops only.
>> The one of the subsequent commits in current series will add
>> xen-grant DMA ops case.
>>
>> Also re-use the xen_swiotlb_detect() check on Arm32.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Thanks!


checkpatch.pl suggests adding missing SPDX-License-Identifier to 
Arm/Arm64's xen-ops.h

I will retain your R-b tag after making this change. Please let me know 
if you think otherwise.



>> ---
>> Changes RFC -> V1:
>>     - update commit description
>>     - move commit to the beginning of the series
>>     - move #ifdef CONFIG_XEN from dma-mapping.c to xen-ops.h
>> ---
>>   arch/arm/include/asm/xen/xen-ops.h   |  1 +
>>   arch/arm/mm/dma-mapping.c            |  7 ++-----
>>   arch/arm64/include/asm/xen/xen-ops.h |  1 +
>>   arch/arm64/mm/dma-mapping.c          |  7 ++-----
>>   include/xen/arm/xen-ops.h            | 15 +++++++++++++++
>>   5 files changed, 21 insertions(+), 10 deletions(-)
>>   create mode 100644 arch/arm/include/asm/xen/xen-ops.h
>>   create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
>>   create mode 100644 include/xen/arm/xen-ops.h
>>
>> diff --git a/arch/arm/include/asm/xen/xen-ops.h b/arch/arm/include/asm/xen/xen-ops.h
>> new file mode 100644
>> index 00000000..8d2fa24
>> --- /dev/null
>> +++ b/arch/arm/include/asm/xen/xen-ops.h
>> @@ -0,0 +1 @@
>> +#include <xen/arm/xen-ops.h>
>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index 82ffac6..059cce0 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -33,7 +33,7 @@
>>   #include <asm/dma-iommu.h>
>>   #include <asm/mach/map.h>
>>   #include <asm/system_info.h>
>> -#include <xen/swiotlb-xen.h>
>> +#include <asm/xen/xen-ops.h>
>>   
>>   #include "dma.h"
>>   #include "mm.h"
>> @@ -2287,10 +2287,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   
>>   	set_dma_ops(dev, dma_ops);
>>   
>> -#ifdef CONFIG_XEN
>> -	if (xen_initial_domain())
>> -		dev->dma_ops = &xen_swiotlb_dma_ops;
>> -#endif
>> +	xen_setup_dma_ops(dev);
>>   	dev->archdata.dma_ops_setup = true;
>>   }
>>   
>> diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
>> new file mode 100644
>> index 00000000..8d2fa24
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/xen/xen-ops.h
>> @@ -0,0 +1 @@
>> +#include <xen/arm/xen-ops.h>
>> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
>> index 6719f9e..6099c81 100644
>> --- a/arch/arm64/mm/dma-mapping.c
>> +++ b/arch/arm64/mm/dma-mapping.c
>> @@ -9,9 +9,9 @@
>>   #include <linux/dma-map-ops.h>
>>   #include <linux/dma-iommu.h>
>>   #include <xen/xen.h>
>> -#include <xen/swiotlb-xen.h>
>>   
>>   #include <asm/cacheflush.h>
>> +#include <asm/xen/xen-ops.h>
>>   
>>   void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>>   		enum dma_data_direction dir)
>> @@ -52,8 +52,5 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   	if (iommu)
>>   		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
>>   
>> -#ifdef CONFIG_XEN
>> -	if (xen_swiotlb_detect())
>> -		dev->dma_ops = &xen_swiotlb_dma_ops;
>> -#endif
>> +	xen_setup_dma_ops(dev);
>>   }
>> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
>> new file mode 100644
>> index 00000000..288deb1
>> --- /dev/null
>> +++ b/include/xen/arm/xen-ops.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_ARM_XEN_OPS_H
>> +#define _ASM_ARM_XEN_OPS_H
>> +
>> +#include <xen/swiotlb-xen.h>
>> +
>> +static inline void xen_setup_dma_ops(struct device *dev)
>> +{
>> +#ifdef CONFIG_XEN
>> +	if (xen_swiotlb_detect())
>> +		dev->dma_ops = &xen_swiotlb_dma_ops;
>> +#endif
>> +}
>> +
>> +#endif /* _ASM_ARM_XEN_OPS_H */
>> -- 
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
-- 
Regards,

Oleksandr Tyshchenko


