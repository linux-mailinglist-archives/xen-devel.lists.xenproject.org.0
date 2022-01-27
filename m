Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543649ECD0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 21:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261745.453457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDBdx-0001oh-Tt; Thu, 27 Jan 2022 20:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261745.453457; Thu, 27 Jan 2022 20:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDBdx-0001mq-Q2; Thu, 27 Jan 2022 20:45:21 +0000
Received: by outflank-mailman (input) for mailman id 261745;
 Thu, 27 Jan 2022 20:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nDBdw-0001mi-25
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 20:45:20 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b9e7e4-7fb2-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 21:45:18 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id b9so7663660lfq.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 12:45:18 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x5sm591233ljm.62.2022.01.27.12.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 12:45:17 -0800 (PST)
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
X-Inumbo-ID: 09b9e7e4-7fb2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dVzeY1A6roTsVX8jpB/rqTqsnO6LLc1i1ofaQp0t6K8=;
        b=M94ft0BtcvwfbTzMUV3bB+bFN2fVLsNUTNctOhy5ce4eq3LK4B4d6Dri17MXpEaGYo
         yFl0KVqZFuUgHmDvzIaO3HM77Uj3CF6caFUdbRA+uM5OG0NViEeyCcJ4EmkMTDpnW9zA
         WSnF9spu53eeyVyqXmZydRJ5twFc6zBCELABD9lnBVaApKXEJFys2wVuXvl2We+66Cnw
         q4+1Bjp3Pub8dprIoV7E2IpSFIUrcywWx/4jVLkUEnvnQT6C9psMha+TBd9pf/d3k9Ut
         /PZP87sADrO6ZSX8Qfz3Iq/Db0wwnFQOgAO8tnqHUc7+ZyI8HRa/FeHSbmz9hHjbv7cl
         GRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dVzeY1A6roTsVX8jpB/rqTqsnO6LLc1i1ofaQp0t6K8=;
        b=7mSsW19UUWNOjwSLYmnibA7CA8i4JJhhQS35Ppj/MaVdqIs5N3i3e/Lgu3Ly+j9osv
         h6GADIXcnP4AFJtBWKyGBJY7hCdd7Kqw8mI5ZWh1+xV0sgpKw5sx+t2JBOOtWtnhtIqj
         7obdXuZD59gde1+i7qv1Sy3CRigjnxpjoS/xuQ6j1++BmpX1tbwYOl7OeADjyLdBOxcW
         y8dXHVS/gLd0IS2Xy+BxteWECsuhVGQSEYfeWUhjIbQuLQwnikR85Sw9fugowq3yS0+i
         jlHz2Oo4+UWphm3zsWy7NYVrWjR0lEwj1TKe7P5hpBXCW6aBk+GENYqckB4PIV8zofEO
         HYBA==
X-Gm-Message-State: AOAM530MEwHQwGdM4pl/MEgVmVnF4KT56I/+Y5qCVPUvC7dSzBhkzamT
	QfwQYVZAY5qaYEDAlX7c0sE=
X-Google-Smtp-Source: ABdhPJxZxopLv6S8TOEqi73eWBQyfKZppP6kp2fR9BKdzL0d03mfrUQvnu/t2597KT6NRwJZtlxGLg==
X-Received: by 2002:a05:6512:b20:: with SMTP id w32mr4039446lfu.686.1643316318074;
        Thu, 27 Jan 2022 12:45:18 -0800 (PST)
Subject: Re: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
 <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
 <1532ec77-17d3-665b-3c19-ab8fd4147a7d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <148b97bf-792c-1b0e-cfaf-56a5709969a0@gmail.com>
Date: Thu, 27 Jan 2022 22:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1532ec77-17d3-665b-3c19-ab8fd4147a7d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.22 22:03, Julien Grall wrote:
> Hi,


Hi Julien


>
> On 27/01/2022 19:55, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> All IOMMU drivers on Arm perform almost the same generic actions in
>> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
>> in order to get rid of code duplication.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> IMO, the reviewed-by tags should have been dropped with the changes 
> you made. 

Yes, you are right.  I apologize, my fault.


> So I would like both reviewer to confirm they are happy with the change.
>
> This also technically needs an ack from Bertrand/Rahul.

Yes, for the SMMU V3.


>
>> ---
>> Changes V1 -> V2:
>>     - add R-b
>>
>> Changes V2 -> V3:
>>     - drop platform specific *_iommu_hwdom_init(), make .hwdom_init
>>       to directly point to the common arch_iommu_hwdom_init()
>> ---
>>   xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 15 +--------------
>>   xen/drivers/passthrough/arm/smmu-v3.c    | 17 +----------------
>>   xen/drivers/passthrough/arm/smmu.c       | 17 +----------------
>>   4 files changed, 10 insertions(+), 46 deletions(-)
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
>> index c912120..d2572bc 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -1329,19 +1329,6 @@ static int ipmmu_iommu_domain_init(struct 
>> domain *d)
>>       return 0;
>>   }
>>   -static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
>> -{
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
>> -    arch_iommu_hwdom_init(d);
>> -}
>> -
>>   static void ipmmu_iommu_domain_teardown(struct domain *d)
>>   {
>>       struct ipmmu_vmsa_xen_domain *xen_domain = 
>> dom_iommu(d)->arch.priv;
>> @@ -1369,7 +1356,7 @@ static void ipmmu_iommu_domain_teardown(struct 
>> domain *d)
>>   static const struct iommu_ops ipmmu_iommu_ops =
>>   {
>>       .init            = ipmmu_iommu_domain_init,
>> -    .hwdom_init      = ipmmu_iommu_hwdom_init,
>> +    .hwdom_init      = arch_iommu_hwdom_init,
>>       .teardown        = ipmmu_iommu_domain_teardown,
>>       .iotlb_flush     = ipmmu_iotlb_flush,
>>       .iotlb_flush_all = ipmmu_iotlb_flush_all,
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c 
>> b/xen/drivers/passthrough/arm/smmu-v3.c
>> index d115df7..71b022f 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -3402,21 +3402,6 @@ static int 
>> arm_smmu_iommu_xen_domain_init(struct domain *d)
>>     }
>>   -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>> -{
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
>> -    arch_iommu_hwdom_init(d);
>> -}
>> -
>>   static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>   {
>>       struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> @@ -3427,7 +3412,7 @@ static void 
>> arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>     static const struct iommu_ops arm_smmu_iommu_ops = {
>>       .init        = arm_smmu_iommu_xen_domain_init,
>> -    .hwdom_init        = arm_smmu_iommu_hwdom_init,
>> +    .hwdom_init        = arch_iommu_hwdom_init,
>>       .teardown        = arm_smmu_iommu_xen_domain_teardown,
>>       .iotlb_flush        = arm_smmu_iotlb_flush,
>>       .iotlb_flush_all    = arm_smmu_iotlb_flush_all,
>> diff --git a/xen/drivers/passthrough/arm/smmu.c 
>> b/xen/drivers/passthrough/arm/smmu.c
>> index c9dfc4c..b186c28 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -2849,21 +2849,6 @@ static int arm_smmu_iommu_domain_init(struct 
>> domain *d)
>>       return 0;
>>   }
>>   -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>> -{
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
>> -    arch_iommu_hwdom_init(d);
>> -}
>> -
>>   static void arm_smmu_iommu_domain_teardown(struct domain *d)
>>   {
>>       struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> @@ -2874,7 +2859,7 @@ static void 
>> arm_smmu_iommu_domain_teardown(struct domain *d)
>>     static const struct iommu_ops arm_smmu_iommu_ops = {
>>       .init = arm_smmu_iommu_domain_init,
>> -    .hwdom_init = arm_smmu_iommu_hwdom_init,
>> +    .hwdom_init = arch_iommu_hwdom_init,
>>       .add_device = arm_smmu_dt_add_device_generic,
>>       .teardown = arm_smmu_iommu_domain_teardown,
>>       .iotlb_flush = arm_smmu_iotlb_flush,
>
-- 
Regards,

Oleksandr Tyshchenko


