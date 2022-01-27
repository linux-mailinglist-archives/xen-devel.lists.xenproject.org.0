Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEC49E212
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261428.452642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3bT-0005Gp-3G; Thu, 27 Jan 2022 12:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261428.452642; Thu, 27 Jan 2022 12:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3bS-0005EA-Vo; Thu, 27 Jan 2022 12:10:14 +0000
Received: by outflank-mailman (input) for mailman id 261428;
 Thu, 27 Jan 2022 12:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nD3bR-0005E4-2R
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:10:13 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 136cf24e-7f6a-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 13:10:11 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id e9so4029423ljq.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 04:10:12 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y3sm948020lji.96.2022.01.27.04.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:10:10 -0800 (PST)
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
X-Inumbo-ID: 136cf24e-7f6a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EP7H1MD7VG4qY9HkmiP9yxysuw89DmQofTsk0GAt9TA=;
        b=KU58LSIWdCK+KfN2tMigMREB7xEjUONNrgMfOGISdIjc4jrBMEbGeRM1PwMWfVxtXt
         2FFKTUARbOaZzVg6qEBluh406KOqPQiPdBLUWtNT/cX6nRmZPxgdarjSy4ffu46NzpAU
         T7MjUsnnsGWql/wh3QSwuhGrODtPTrf5qWyhY90j7JnDkMnyCxL4JelxeqCaG9aF4s8d
         PDSwz4ZO8xb8xS+M6SFrvbdmYh6Xt61ugFKKt2ZAmPsXaOR412wc09NC+wd5v6oeXYnU
         zhF8mNWzaYwD1hLybKn7RzFacyDvp7a22G1DJArrAsS2mqsS7NJdibWSSFmyhm5cM7N2
         dwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EP7H1MD7VG4qY9HkmiP9yxysuw89DmQofTsk0GAt9TA=;
        b=uRdz3l4qBGpHPzi6ULFdcr5myXO/7Mn3ySRGk/lA9ug6a7lkyYAaH9FAGWWMh9m14H
         LS+ISm+qwtDua/ki1ENpFYayYfkDX5ClAQ40YvBHmQY3YkKjpOXvsgRwIIUok23wjM1N
         p+DTCIEWT4HNPfXDlFVYOO0QwSRFj3W87g/coq5h4lpqIVT9CKeDjH30yT2C1FZEL+XL
         uMQSBTp1uE5jOkQsS8gut5VnXW95uP0AMTVJjixxfmVObPsTjBSs00bbsVY6d8613FkE
         5hpCiVRH84UQPar6LsVA+yQAqYVlcYJGtjjsR7aM7lpb3GxFrMyCCJTUuMR87n/6IsII
         HKCA==
X-Gm-Message-State: AOAM533fgGDdGpwGJDDVCHDa7/48MSMi+/Os7H0HSX/RG1xi1vhn2Yws
	hbU9YnBLZc4ouwCK/0puH4w=
X-Google-Smtp-Source: ABdhPJxUnG178fExzwUO0teByZF6fKEsKML/emfdI05MaFrjTpwVBXgA4ZaBfV7eLOU4RhgYAEgLDQ==
X-Received: by 2002:a05:651c:17a2:: with SMTP id bn34mr2779247ljb.34.1643285411317;
        Thu, 27 Jan 2022 04:10:11 -0800 (PST)
Subject: Re: [PATCH V2 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-11-git-send-email-olekstysh@gmail.com>
 <8384b39e-4cd1-95e0-73e0-60b0f2876fe4@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a1d8f32b-1424-8874-dafc-4caeba82772b@gmail.com>
Date: Thu, 27 Jan 2022 14:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8384b39e-4cd1-95e0-73e0-60b0f2876fe4@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.22 13:54, Julien Grall wrote:
> Hi,


Hi Julien


>
> On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> All IOMMU drivers on Arm perform almost the same generic actions in
>> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
>> in order to get rid of code duplication.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> ---
>> Changes V1 -> V2:
>>     - add R-b
>> ---
>>   xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 --------
>>   xen/drivers/passthrough/arm/smmu-v3.c    | 10 ----------
>>   xen/drivers/passthrough/arm/smmu.c       | 10 ----------
>>   4 files changed, 7 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/iommu.c 
>> b/xen/drivers/passthrough/arm/iommu.c
>> index ee653a9..fc45318 100644
>> --- a/xen/drivers/passthrough/arm/iommu.c
>> +++ b/xen/drivers/passthrough/arm/iommu.c
>> @@ -134,6 +134,13 @@ void arch_iommu_domain_destroy(struct domain *d)
>>     void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>   {
>> +    /* Set to false options not supported on ARM. */
>> +    if ( iommu_hwdom_inclusive )
>> +        printk(XENLOG_WARNING "map-inclusive dom0-iommu option is 
>> not supported on ARM\n");
>> +    iommu_hwdom_inclusive = false;
>> +    if ( iommu_hwdom_reserved == 1 )
>> +        printk(XENLOG_WARNING "map-reserved dom0-iommu option is not 
>> supported on ARM\n");
>> +    iommu_hwdom_reserved = 0;
>>   }
>>     /*
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c 
>> b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 1224ea4..64d8ddc 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -1325,14 +1325,6 @@ static int ipmmu_iommu_domain_init(struct 
>> domain *d)
>>     static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
>>   {
>> -    /* Set to false options not supported on ARM. */
>> -    if ( iommu_hwdom_inclusive )
>> -        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu 
>> option is not supported on ARM\n");
>> -    iommu_hwdom_inclusive = false;
>> -    if ( iommu_hwdom_reserved == 1 )
>> -        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option 
>> is not supported on ARM\n");
>> -    iommu_hwdom_reserved = 0;
>> -
>>       arch_iommu_hwdom_init(d);
>>   }
>
> With this change, ipmmu_iommu_domain_init() is just a call to 
> arch_iommu_hwdom_init(). The two functions have the same prototype, so 
> could we simply drop the former and update the .hwdom_init to directly 
> point to the latter?

Yes, good idea, will update. Thank you.


>
>
>>   diff --git a/xen/drivers/passthrough/arm/smmu-v3.c 
>> b/xen/drivers/passthrough/arm/smmu-v3.c
>> index d115df7..ca8b5c7 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -3404,16 +3404,6 @@ static int 
>> arm_smmu_iommu_xen_domain_init(struct domain *d)
>>     static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>   {
>> -    /* Set to false options not supported on ARM. */
>> -    if (iommu_hwdom_inclusive)
>> -        printk(XENLOG_WARNING
>> -        "map-inclusive dom0-iommu option is not supported on ARM\n");
>> -    iommu_hwdom_inclusive = false;
>> -    if (iommu_hwdom_reserved == 1)
>> -        printk(XENLOG_WARNING
>> -        "map-reserved dom0-iommu option is not supported on ARM\n");
>> -    iommu_hwdom_reserved = 0;
>> -
>>       arch_iommu_hwdom_init(d);
>>   }
>
> Same here.
>
>> diff --git a/xen/drivers/passthrough/arm/smmu.c 
>> b/xen/drivers/passthrough/arm/smmu.c
>> index c9dfc4c..ec18df7 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -2851,16 +2851,6 @@ static int arm_smmu_iommu_domain_init(struct 
>> domain *d)
>>     static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>   {
>> -    /* Set to false options not supported on ARM. */
>> -    if ( iommu_hwdom_inclusive )
>> -        printk(XENLOG_WARNING
>> -        "map-inclusive dom0-iommu option is not supported on ARM\n");
>> -    iommu_hwdom_inclusive = false;
>> -    if ( iommu_hwdom_reserved == 1 )
>> -        printk(XENLOG_WARNING
>> -        "map-reserved dom0-iommu option is not supported on ARM\n");
>> -    iommu_hwdom_reserved = 0;
>> -
>>       arch_iommu_hwdom_init(d);
>>   }
>
> Same here.
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


