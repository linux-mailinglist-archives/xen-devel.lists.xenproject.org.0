Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26764759D1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 14:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247391.426580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUX5-0006zO-UG; Wed, 15 Dec 2021 13:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247391.426580; Wed, 15 Dec 2021 13:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUX5-0006xE-QK; Wed, 15 Dec 2021 13:41:23 +0000
Received: by outflank-mailman (input) for mailman id 247391;
 Wed, 15 Dec 2021 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxUX3-0006x8-IP
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 13:41:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af633797-5dac-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 14:41:20 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id k37so43312991lfv.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 05:41:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y7sm56169lfe.222.2021.12.15.05.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 05:41:19 -0800 (PST)
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
X-Inumbo-ID: af633797-5dac-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QGMsG2Qq+3i5fYEiIxeLez6/JesFrzIf/Iid84/MF0A=;
        b=LSLod0Kwbnc0bDK4hH1ykjsxnPpJrMWnLIF/5ULvrLonTI+/fGP0063gcUvSj8KuCk
         NBlD3/xehhothoM6fmQcz0ppIec8vfjJ6sBIP4ObX1+yQC+vVTNE12x4zDmdLgkDtjnm
         erNuLZtIwCOW8c8+BgAuM1UVSicB+jBaD1HYrmkJFN4KHdeUm8a0nwSgtmQyES80yfEj
         3OPBwb3xRhrR3huz+sr6GF0w6Vp5yTCqXP6fiGwVBW73d19t+hGG2z8NJ0IpqTYwG9vL
         T55yQapvosByA7gjUqJgKsngeWpeEjiokV75PmTCaZ8CZQnfaTOQcc3oVTE4l3wr4KJf
         ph0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QGMsG2Qq+3i5fYEiIxeLez6/JesFrzIf/Iid84/MF0A=;
        b=bb3oGp1bHc6UjdWmbY82MCq8buIBxaCeEdz2rxPZngbQUU3MM5+C5isvPn7Uojt8bC
         QcEUpRYXig3IdsEu4+CAHIAXJTEconJSjeNW2iC183xHbdcb76LgylQH86IhSgyV0ZLn
         f9CwHKskQ9u2s7bQRcTQjntEtbCY3tycRz9D1gQdPpb6+f5lr3Lh2b+o4AeVUBj0M2U0
         6yMw+AJqoUyw0I7SYoBPcvuyACpdiC+i6VT7gvz2YmPQhkd3+BREDg12jW7jE+MI9VCI
         gLM+QjHaAeDFiQupDY3zq61aRgsJHmtCmx0hGboCU3gNU7GrpbdLAdVY4H9nomY+yytk
         /gog==
X-Gm-Message-State: AOAM532NUJcJvrqag+WdakBjzekMf9FKLfMPU6k6X7Bo8Gnns+NEE2hm
	fiL4Fq7YwTm2Fud5GElRVfE=
X-Google-Smtp-Source: ABdhPJwnt10ndsBUfLTbEF8JQrH+oAHom/6cO98D74xNylOHw+c0RF5maosSXtQdgxrasxAYmus5Bw==
X-Received: by 2002:a05:6512:39c4:: with SMTP id k4mr9767269lfu.79.1639575679575;
        Wed, 15 Dec 2021 05:41:19 -0800 (PST)
Subject: Re: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
 <87ee6ey3ox.fsf@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c28cfcf3-4da5-4a3c-baeb-229759d506c2@gmail.com>
Date: Wed, 15 Dec 2021 15:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87ee6ey3ox.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.12.21 04:58, Volodymyr Babchuk wrote:
> Hi Oleksandr,

Hi Volodymyr


>
>
> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Reference-count the micro-TLBs as several bus masters can be
>> connected to the same micro-TLB (and drop TODO comment).
>> This wasn't an issue so far, since the platform devices
>> (this driver deals with) get assigned/deassigned together during
>> domain creation/destruction. But, in order to support PCI devices
>> (which are hot-pluggable) in the near future we will need to
>> take care of.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 22dd84e..32609f8 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -134,6 +134,7 @@ struct ipmmu_vmsa_device {
>>       spinlock_t lock;    /* Protects ctx and domains[] */
>>       DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
>>       struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>> +    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>>       const struct ipmmu_features *features;
>>   };
>>   
>> @@ -477,13 +478,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
>>           }
>>       }
>>   
>> -    /*
>> -     * TODO: Reference-count the micro-TLB as several bus masters can be
>> -     * connected to the same micro-TLB.
>> -     */
>> -    ipmmu_imuasid_write(mmu, utlb, 0);
>> -    ipmmu_imuctr_write(mmu, utlb, imuctr |
>> -                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
>> +    if ( mmu->utlb_refcount[utlb]++ == 0 )
>> +    {
>> +        ipmmu_imuasid_write(mmu, utlb, 0);
>> +        ipmmu_imuctr_write(mmu, utlb, imuctr |
>> +                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
>> +    }
>>   
>>       return 0;
>>   }
>> @@ -494,7 +494,8 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
>>   {
>>       struct ipmmu_vmsa_device *mmu = domain->mmu;
>>   
>> -    ipmmu_imuctr_write(mmu, utlb, 0);
> It would be great to have
>
> +      ASSERT(mmu->utlb_refcount[utlb] > 0);
>
> there. Just in case.

ok, will add.


Thank you.


>
>> +    if ( --mmu->utlb_refcount[utlb] == 0 )
>> +        ipmmu_imuctr_write(mmu, utlb, 0);
>>   }
>>   
>>   /* Domain/Context Management */
>
-- 
Regards,

Oleksandr Tyshchenko


