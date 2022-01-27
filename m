Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AA49E320
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 14:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261471.452777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4Zb-0007gd-2d; Thu, 27 Jan 2022 13:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261471.452777; Thu, 27 Jan 2022 13:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4Za-0007eH-Ve; Thu, 27 Jan 2022 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 261471;
 Thu, 27 Jan 2022 13:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nD4ZZ-0007eB-Mz
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 13:12:21 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c25f0dbb-7f72-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 14:12:20 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id n8so5263273lfq.4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 05:12:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e10sm1835096ljk.30.2022.01.27.05.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:12:19 -0800 (PST)
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
X-Inumbo-ID: c25f0dbb-7f72-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DwT77EWg7HZ/9Z5GWp9CRYMsVNSb83mlX5xe/fYgdiI=;
        b=X+QGGoKAlkIzdCg7UvuZ37TCA4rD3RL7EZQgTWD+WLFNJ6Dok8so1gWZXVnGmuzRRZ
         jPxE91DYioMphXjDBeyPaHr/PNPCkOgaqI+3nXwnAHrtSGw7QK6NA85j03HDcL5y7/Hk
         6d3SDy2ciO2C/+XfStmtwrawQE3U6tLLl8/+Ph0wyQAquDpO2w67vs1jT58bSh9MoTDr
         AblcoMNYzODZVvnC7oIlUFUsHkD6D+z53nZ0fv9RBMOIwywH14gvCu3BzBejzLbVZNJS
         5j52OBwiuJmPAzJsYwF8ry/TSsG3ToOQLJZbHVJEx37v/9e+cn3KVMMfU/MANtrH/ZM2
         myGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DwT77EWg7HZ/9Z5GWp9CRYMsVNSb83mlX5xe/fYgdiI=;
        b=1U73kgMGT/OG8vmNXB/O1/RuoZVppil5tn6YDsuwVUDDoOVkqEbTQJ+wEgXvx9Vdvy
         7wrxtTHYcU80vaCJk+TEDxJwJCpsTSkV3edcLurF/+I3qucxh6eI2AsX+Wq0MLRiNgeQ
         d9XE+Nu5sDed7dwcTica7CxpOG7datLACRjMHsAgXYR1F9JdIgXcvEwZPr/rUQdGk2QB
         SVPVYGsJsvAgeN6frQfyFbaOXvlyf6F6INvUhQRCsqlAACsHzX1Iv6SVYxkBw6gaRxfJ
         WshL1mUW3ZcP+qoGODgM0F0frwKejE85HQfa2AQiEBEFRWwtXgJOHYVwZfGKUOo5W7bI
         xBHg==
X-Gm-Message-State: AOAM530W/zmEcX6s9xkCWQhQis7RWuPta+eSEzCGDrZt+59a/dJGzr1Y
	jPCPi5enjeR2ISfMlqT8grU=
X-Google-Smtp-Source: ABdhPJwNJ7XAtzg7C8A1blvaSEAzKCfp+vIxUnoVozgRHfCtd19f45z2XxRGDZqmejZxY9pXh8li5w==
X-Received: by 2002:ac2:54aa:: with SMTP id w10mr2706635lfk.357.1643289139554;
        Thu, 27 Jan 2022 05:12:19 -0800 (PST)
Subject: Re: [PATCH V2 09/10] iommu/ipmmu-vmsa: Use refcount for the
 micro-TLBs
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-10-git-send-email-olekstysh@gmail.com>
 <5ca5e8c4-93b8-de4c-3582-cda9bd6b809e@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bf0d928a-0e60-6614-c506-8d666f9bae9b@gmail.com>
Date: Thu, 27 Jan 2022 15:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ca5e8c4-93b8-de4c-3582-cda9bd6b809e@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.22 13:48, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Reference-count the micro-TLBs as several bus masters can be
>> connected to the same micro-TLB (and drop TODO comment).
>> This wasn't an issue so far, since the platform devices
>> (this driver deals with) get assigned/deassigned together during
>> domain creation/destruction. But, in order to support PCI devices
>> (which are hot-pluggable) in the near future we will need to
>> take care of.
>
> Looking at the code, it is not possible to share the micro-TLB between 
> domains (or even Xen). So technically, we will still want to {, 
> un}hotplug the devices using the same u-TLB together.
>
> Therefore, I would clarify that this is necessary because even if we 
> have to remove all the devices together, the IOMMU driver will be 
> de-assigning them one-by-one.
>
> I would add a similar comment in the code as well.

ok, will add.


>
>
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> ---
>> Changes V1 -> V2:
>>     - add R-b
>>     - add ASSERT() in ipmmu_utlb_disable()
>> ---
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 19 +++++++++++--------
>>   1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c 
>> b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 649b9f6..1224ea4 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -127,6 +127,7 @@ struct ipmmu_vmsa_device {
>>       spinlock_t lock;    /* Protects ctx and domains[] */
>>       DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
>>       struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>> +    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>>       const struct ipmmu_features *features;
>>   };
>>   @@ -467,13 +468,12 @@ static int ipmmu_utlb_enable(struct 
>> ipmmu_vmsa_domain *domain,
>>           }
>>       }
>>   -    /*
>> -     * TODO: Reference-count the micro-TLB as several bus masters 
>> can be
>> -     * connected to the same micro-TLB.
>> -     */
>> -    ipmmu_imuasid_write(mmu, utlb, 0);
>> -    ipmmu_imuctr_write(mmu, utlb, imuctr |
>> -                       IMUCTR_TTSEL_MMU(domain->context_id) | 
>> IMUCTR_MMUEN);
>> +    if ( mmu->utlb_refcount[utlb]++ == 0 )
>> +    {
>> +        ipmmu_imuasid_write(mmu, utlb, 0);
>> +        ipmmu_imuctr_write(mmu, utlb, imuctr |
>> + IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
>> +    }
>>         return 0;
>>   }
>> @@ -484,7 +484,10 @@ static void ipmmu_utlb_disable(struct 
>> ipmmu_vmsa_domain *domain,
>>   {
>>       struct ipmmu_vmsa_device *mmu = domain->mmu;
>>   -    ipmmu_imuctr_write(mmu, utlb, 0);
>> +    ASSERT(mmu->utlb_refcount[utlb] > 0);
>> +
>> +    if ( --mmu->utlb_refcount[utlb] == 0 )
>> +        ipmmu_imuctr_write(mmu, utlb, 0);
>>   }
>>     /* Domain/Context Management */
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


