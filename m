Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E75048FC
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 20:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306706.521864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9ri-0000so-QL; Sun, 17 Apr 2022 18:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306706.521864; Sun, 17 Apr 2022 18:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9ri-0000qc-MC; Sun, 17 Apr 2022 18:43:18 +0000
Received: by outflank-mailman (input) for mailman id 306706;
 Sun, 17 Apr 2022 18:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3EG=U3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ng9rh-0000qW-Od
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 18:43:17 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e968736-be7e-11ec-a405-831a346695d4;
 Sun, 17 Apr 2022 20:43:16 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id v13so8644510ljg.10
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 11:43:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a19d602000000b0046d150c112dsm999811lfg.234.2022.04.17.11.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 11:43:15 -0700 (PDT)
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
X-Inumbo-ID: 3e968736-be7e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Kk9BppkAb1GLyoA2hlXyi8RoR58LZ27BwBibVf+whww=;
        b=qt5JWOZ1VfiLDVLEejVPGDYo3ZcP+JCb/V3FdDnmfvP9WmAWjdDok5wpZUVuADRg24
         fS/HUufwFDewQAGNUruGZUWRsayZYLyRWsbPnthPGLeban+cJ+sfdiZr4+6hZ8K+H/fq
         HaF7YfEMxlTsydFQ6VJEyHmcvpcepTm1ox5hOSvpTaf/VW/vMkACJQmHuCofbf7EQTSb
         YTUlrx3yCnHQ24kUxwwOj6znDjmn1Kb8i1QrzF3m8VAufNmIQbIx425Kl9LZDPjOxIng
         6E+6kHI9MbvnSm9HzKn1MfSr582N/2iNs5Zcd/9Lj9zQYqMx4tFf915Bgcyb2FYMkAvD
         DvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Kk9BppkAb1GLyoA2hlXyi8RoR58LZ27BwBibVf+whww=;
        b=EIrrpazc+z1FuubTcF1knauvZ9A+7LEDXIks0woUCRg+0iiUccG/ZawyMyC1iHQamu
         k3mXJGSJpoYyk8KKanxwXEN9IaMbUOt8UUFYnksB12dvu52C8nW4pEx660JUYbxy4I+a
         dbqKdhsMoASk1jCvB04tP/NTt31Pl+ccefcVq3Duia1/H/nB8ce39Ph6PTvYvNFocWOd
         /B3vJgWweKWuoZFwhAusoPpOtbwUDOdDqNptLUA7TBFriZY33gkRpUdcRLaj7y5xNjCP
         jlGA+riVKSgfrrllUJiycNlKO4Ko2NFqIIkLtHjel4bbkFKdAyqTUXUnX/hevbzdtkoQ
         msMg==
X-Gm-Message-State: AOAM531lCXZ39ib+x/C4ULuhHsxZt492t6NU+91PkynnXNB83KNStYPO
	1xoXM3pOXy5jSQEpTb9zMf0=
X-Google-Smtp-Source: ABdhPJwUkJUNtAb7kvGmdnAfzY9PQvgtza8+x07uV7miQaHaGsm/DshtCFE9C62GtukahGs1aCKfTw==
X-Received: by 2002:a05:651c:19a5:b0:24c:87dd:d60d with SMTP id bx37-20020a05651c19a500b0024c87ddd60dmr5119546ljb.344.1650220996419;
        Sun, 17 Apr 2022 11:43:16 -0700 (PDT)
Subject: Re: [RFC PATCH 5/6] arm/xen: Introduce xen_setup_dma_ops()
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
 Julien Grall <julien@xen.org>, Christoph Hellwig <hch@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151303340.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <53d13d03-b387-bf01-20fb-8d11a964b370@gmail.com>
Date: Sun, 17 Apr 2022 21:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204151303340.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.04.22 01:02, Stefano Stabellini wrote:

Hello Stefano

> On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch introduces new helper and places it in new header.
>> The helper's purpose is to assign any Xen specific DMA ops in
>> a single place. For now, we deal with xen-swiotlb DMA ops only.
>> The subsequent patch will add xen-virtio DMA ops case.
>>
>> Also re-use the xen_swiotlb_detect() check on Arm32.
> Thanks for the patch, this is good to have in any case. I would move it
> to the beginning of the series.


ok, will move


>
>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   arch/arm/include/asm/xen/xen-ops.h   |  1 +
>>   arch/arm/mm/dma-mapping.c            |  5 ++---
>>   arch/arm64/include/asm/xen/xen-ops.h |  1 +
>>   arch/arm64/mm/dma-mapping.c          |  5 ++---
>>   include/xen/arm/xen-ops.h            | 13 +++++++++++++
>>   5 files changed, 19 insertions(+), 6 deletions(-)
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
>> index 82ffac6..a1bf9dd 100644
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
>> @@ -2288,8 +2288,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   	set_dma_ops(dev, dma_ops);
>>   
>>   #ifdef CONFIG_XEN
>> -	if (xen_initial_domain())
>> -		dev->dma_ops = &xen_swiotlb_dma_ops;
>> +	xen_setup_dma_ops(dev);
>>   #endif
> You can take this opportunity to also remove the #ifdef, by providing an
> empty stub implemention of xen_setup_dma_ops for the !CONFIG_XEN case.


agree, will do


>
>
>>   	dev->archdata.dma_ops_setup = true;
>>   }
>> diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
>> new file mode 100644
>> index 00000000..8d2fa24
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/xen/xen-ops.h
>> @@ -0,0 +1 @@
>> +#include <xen/arm/xen-ops.h>
>> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
>> index 6719f9e..831e673 100644
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
>> @@ -53,7 +53,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
>>   
>>   #ifdef CONFIG_XEN
>> -	if (xen_swiotlb_detect())
>> -		dev->dma_ops = &xen_swiotlb_dma_ops;
>> +	xen_setup_dma_ops(dev);
>>   #endif
> same here

ok


>
>
>>   }
>> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
>> new file mode 100644
>> index 00000000..621da05
>> --- /dev/null
>> +++ b/include/xen/arm/xen-ops.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_ARM_XEN_OPS_H
>> +#define _ASM_ARM_XEN_OPS_H
>> +
>> +#include <xen/swiotlb-xen.h>
>> +
>> +static inline void xen_setup_dma_ops(struct device *dev)
>> +{
>> +	if (xen_swiotlb_detect())
>> +		dev->dma_ops = &xen_swiotlb_dma_ops;
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


