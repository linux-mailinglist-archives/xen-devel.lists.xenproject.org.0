Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11A47798B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248095.427902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxttF-0005K2-Hn; Thu, 16 Dec 2021 16:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248095.427902; Thu, 16 Dec 2021 16:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxttF-0005IE-Dx; Thu, 16 Dec 2021 16:45:57 +0000
Received: by outflank-mailman (input) for mailman id 248095;
 Thu, 16 Dec 2021 16:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQEQ=RB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxttE-0005I8-Dg
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:45:56 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cf7118-5e8f-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 17:45:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so2218647wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Dec 2021 08:45:54 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c7sm6245964wrq.81.2021.12.16.08.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:45:54 -0800 (PST)
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
X-Inumbo-ID: a2cf7118-5e8f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+etdRS/daZdfb1kFunIAs+E4JtTtbruMLbJELxTBUH4=;
        b=MrDuzVVdPXhJYwE7iIUbjH0/jQk5ILZP5e0VgnaAn+g+Ous1eTZvL0pLpMfB6UOg5y
         kk83oTvtwDZOF01VyC12Jx8OoydW8fk6+1EMUuEz8sBvoJIC5ooSIIUdRlW1jVzdYtAK
         wwuQh00ha6FUI+W3fsRAWDPHgd/OPD+cltbPe8RhGK5nG2QzztErbJdBZJHI9oZkynb+
         Aky+XTubPhParojArPgqUBNqMaePhgquYm2VTbrAxYROQSOWFqFXXAf2ZsMW6rgxeyN5
         dKWSb37S4YdiSoDhzrwBhs6eXlS2f435OJCsm05yDBeZg5uPc1mGYEbDyACpPlTFPpCO
         zfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+etdRS/daZdfb1kFunIAs+E4JtTtbruMLbJELxTBUH4=;
        b=72q51LSnFA8lCHpiNC3SMea1zH2+zeXtNlMU95QLL9nQ8HQzT7R0njdbD1Rl0pnxiu
         SZnGFGZ+r7hB4kPjwAobsp6KDYO73aDy5y5CqOD8U7bfFg0Txc+SHRQnjgsCoVBU1KH6
         BjKfrci/V5/DgfSo61PuXHj/nyjjK6+5GQQXmvrckv7E6SLJIvXc4gH0yTMtylcDuc42
         AXgGjupQnBjMnxTuUFJ5XIqWdxDsX/eJpA059u9H5rGXDAhND37OfCGJMV1RUhkdVXxe
         bsDgftrH+hCMCTfY8cpXDuTZOd21A9HfT/uohi3A11nrQHb57mKp532lphisANeEUlYr
         upcg==
X-Gm-Message-State: AOAM533v3+E3Z0TC8IVQJcs9I6G1QyB9uwzXyzlvj0upr/5uDJBIEfSq
	QDNYvzGa0B/Vw0sQGKvPtznlb8+CkP4=
X-Google-Smtp-Source: ABdhPJyTwEMkuooS+OVJiIAsQWhsyVnTl6tkPtWi5tAz9DdnZauYDouEZZQFaWx+G0YE2G2zWZdqGQ==
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr5767899wmq.32.1639673154301;
        Thu, 16 Dec 2021 08:45:54 -0800 (PST)
Subject: Re: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP
 to 0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
 <TY2PR01MB369226FC51154F6E9BA37886D8779@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <80abfe7e-154c-6698-465b-e317d8f5c156@gmail.com>
Date: Thu, 16 Dec 2021 18:45:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB369226FC51154F6E9BA37886D8779@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.12.21 14:48, Yoshihiro Shimoda wrote:
> Hello Oleksandr-san,

Hello Shimoda-san,


>
> Thank you for the patch!

Thank you for the review!


>
>> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Based on the following commits from the Renesas BSP:
>> 8fba83d97cca709a05139c38e29408e81ed4cf62
>> a8d93bc07da89a7fcf4d85f34d119a030310efa5
>> located at:
> <snip>
>> Original commit messages:
>>   commit 8fba83d97cca709a05139c38e29408e81ed4cf62
>>   Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>>   Date:   Wed Apr 28 18:54:44 2021 +0700
>>
>>    iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>>
>>    Need to set bit IMSCTLR_USE_SECGRP to 0
>>    because H/W initial value is unknown, without this
>>    dma-transfer cannot be done due to address translation doesn't work.
>>
>>    Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>>
>>   commit a8d93bc07da89a7fcf4d85f34d119a030310efa5
>>   Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>>   Date:   Tue Sep 7 14:46:12 2021 +0700
>>
>>    iommu/ipmmu-vmsa: Update IMSCTLR register offset address for R-Car S4
>>
>>    Update IMSCTLR register offset address to align with R-Car S4 H/W UM.
>>
>>    Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>>
>> **********
>>
>> It is still a question whether this really needs to be done in Xen,
>> rather in firmware, but better to be on the safe side. After all,
>> if firmware already takes care of clearing this bit, nothing bad
>> will happen.
> IIUC, we need this for IPMMU-DS0.

Yes, we have confirmed that by running dmatest app over SYS-DMAC1/2 
channels in the Guest on S4 w/ and w/o current patch.
So this clearing is definitely needed.


>
>> Please note the following:
>> 1. I decided to squash both commits since the first commit adds clearing
>> code and only the second one makes it functional on S4. Moreover, this is
>> not a direct port. So it would be better to introduce complete solution
>> by a single patch.
> I agree.
> However, I realized IMSCTLR and IMSAUXCTLR registers' offset differs
> between Gen3 and Gen4. About BSP patch of 07/10, it seems to take care
> of the offset. But, Linux upstream based code doesn't take care of it.


Yes, I assume this is because Linux upstream driver doesn't support S4 
yet, so there is no need to clear the USE_SECGRP bit in IMSCTLR so far
and Linux upstream driver doesn't use stage2 translation table format, 
so there is no need to set the S2PTE bit in IMSAUXCTLR.


> So, we have to add a new member (maybe "control_offset_base" is a good name?)
> to calculate the address.

Agree here, control_offset_base sounds perfectly fine to me, will do. I 
already had to diverge from Linux in 07/10 patch by introducing 
imuctr_ttsel_mask member (which is (15 << 4) on Gen3
and (31 << 4) on S4 due to the larger number of context supported by the 
latter) as Xen driver has an additional hardening code in 
ipmmu_utlb_enable().


>
>> 2. Although patch indeed does what it claims in the subject,
>> the implementation is different in comparison with original changes.
>> On Linux the clearing is done at runtime in ipmmu_domain_setup_context().
>> On Xen the clearing is done at boot time in ipmmu_probe().
>>
>> The IMSCTLR is not a MMU "context" register at all, so I think there is
>> no point in performing the clearing each time we initialize the context,
>> instead perform the clearing at once during initialization.
> ipmmu_domain_setup_context() is called in probing and resuming.
> So, it's enough to clear in ipmmu_probe() I think.

great, thank you for confirming.


>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 8dfdae8..22dd84e 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -229,6 +229,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>>   #define IMUASID0(n)            (0x0308 + ((n) * 16))
>>   #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
>>
>> +#define IMSCTLR             0x0500
>> +#define IMSCTLR_USE_SECGRP  (1 << 28)
>> +
>>   #define IMSAUXCTLR          0x0504
>>   #define IMSAUXCTLR_S2PTE    (1 << 3)
> As I mentioned above, we have to adjust these registers' offset for
> both Gen3 (+0) and Gen4 (+0x1000) somehow.

Yes, I will take care of it.


>
>> @@ -979,6 +982,10 @@ static int ipmmu_probe(struct dt_device_node *node)
>>           set_bit(0, mmu->ctx);
>>       }
>>
>> +    /* Do not use security group function. */
>> +    reg = IMSCTLR + mmu->features->ctx_offset_stride_adj;
>> +    ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
> If we modify the 07/10 patch, we cannot use ctx_offset_stride_adj.
> # But, using "ctx_offset" here seems to be abused though because
> # the register is not context.

I agree, it is an abuse. I believe, this will be solved by your 
suggestion to introduce control_offset_base member with proper values 
for Gen3 and S4, will do.


>
> Best regards,
> Yoshihiro Shimoda
>
-- 
Regards,

Oleksandr Tyshchenko


