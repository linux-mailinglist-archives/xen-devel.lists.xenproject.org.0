Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F183EF9E6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 07:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168074.306852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGDv3-0008Ar-Ja; Wed, 18 Aug 2021 05:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168074.306852; Wed, 18 Aug 2021 05:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGDv3-00087e-Ep; Wed, 18 Aug 2021 05:15:17 +0000
Received: by outflank-mailman (input) for mailman id 168074;
 Wed, 18 Aug 2021 05:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Bg=NJ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mGDv1-00087Y-Fr
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 05:15:15 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77d7db9f-1cfc-4f7c-aa0f-615060bd064f;
 Wed, 18 Aug 2021 05:15:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y6so2812932lje.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 22:15:14 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id c19sm413013ljn.75.2021.08.17.22.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 22:15:12 -0700 (PDT)
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
X-Inumbo-ID: 77d7db9f-1cfc-4f7c-aa0f-615060bd064f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5kE/EtV3LMXfGJtOkDiJg/rGe0/2iWhqoJv49Qxz95s=;
        b=ol4l2TzorBRL8vwLoCC5HMyg6gEvbKs3NP7IZI90XnEoRDh0C9vctC10YmCM3rnI9w
         VGJEMpxtpZ/lZwoffR/zhUYnMqRjQUPpl+faagcklMJInpgB3o/j+whazZkh8XSZu1Ad
         nJdILFD12EdwFTVlWUVM4zSRGHO1lemSSRtCG2PbKpzgGuFFUJVYOxwWLh5/4rraktk9
         xcRdqHhMSklMsffEov+JHgdDzz/m9IvrntI1bcOcCpOeUWJ+ADXqgIqUQwikSMfiAcOz
         p12mTu0W9qXic6mDOdVcAUPdYM87wE5ojQJGmPVr/7E7tLFiRsGWnaFPVPVjKOG+m+B4
         fkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5kE/EtV3LMXfGJtOkDiJg/rGe0/2iWhqoJv49Qxz95s=;
        b=imWq/GmsNGefJIw15XoiCUVRz7Z/67MLBkjk1zs8H4GmcgJisKs828hnzvcGyQn/LL
         a9Rejd6QsTIUVdRCyAH4Z4mu+S8GfuRoarGaDjl7szWUsvNty/ULlbrTPhOIEkc1Cxyb
         ZfbiWHTWL66gjwm3LmjlmRvv84gR6VsGHOjDwOF5a0By1KHT2LP9UufvA1q+6z2Tgjq3
         ZGnzBifgB/yCW8d9ahSkpbF2Ogwc5Rhm6KyZy3l5VNJEuRtQO7AVjbyiezilUoRy38OG
         KeiGTymCBuv1gPvY7Aw8MbByrUQP150zJ2jKoQcu4cm603tmrXXIk9Nr0ZQyWyKAq7aN
         oq2A==
X-Gm-Message-State: AOAM533r/p4n6HHtF4T2ltm8E4IB9SSROZm87F43C38+imk1uT6+mDwj
	1+zRbt85ZwsQmeNOIWHdPeo=
X-Google-Smtp-Source: ABdhPJwxwCiPmTjp554icpA6ORWUWsFQUPztFOyjvkgDL08CmZzugfRcxtpXv8o9dkOfJLHs7RZTeg==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr6283353ljg.150.1629263712942;
        Tue, 17 Aug 2021 22:15:12 -0700 (PDT)
Subject: Re: [PATCH] xen/arm: smmu: Set/clear IOMMU domain for device
To: Julien Grall <julien@xen.org>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210811130356.1143743-1-andr2000@gmail.com>
 <c964783e-73ee-a971-58f2-e2bc4b78a5ff@xen.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <9c60a24b-eee2-d863-73ab-4883d7b030a4@gmail.com>
Date: Wed, 18 Aug 2021 08:15:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c964783e-73ee-a971-58f2-e2bc4b78a5ff@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi, Julien!

On 17.08.21 20:21, Julien Grall wrote:
> Hi Oleksandr,
>
> Apologies for the late answer.
>
> On 11/08/2021 14:03, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> When a device is assigned/de-assigned it is required to properly set
>> IOMMU domain used to protect the device. This assignment was missing,
>> thus it was not possible to de-assign the device:
>>
>> (XEN) Deassigning device 0000:03:00.0 from dom2
>> (XEN) smmu: 0000:03:00.0:  not attached to domain 2
>> (XEN) d2: deassign (0000:03:00.0) failed (-3)
>>
>> Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
>> to NULL on arm_smmu_deassign_dev.
> I think this was introduced by commit 06d1f7a278dd "xen/arm: smmuv1: Keep track of S2CR state". If so, please add:
>
> Fixes: 06d1f7a278dd ("xen/arm: smmuv1: Keep track of S2CR state")
Will do
>
> Looking at the commit message, the IOMMU domain used to be set/unset in arm_smmu_{attach, detach}_dev() but Linux drop it because they now rely in the core IOMMU framework to track the domain.
>
> So I agree with the new position for...
>
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/drivers/passthrough/arm/smmu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index c234ad9c7f1e..373d9d4d123a 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -2768,6 +2768,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>>               arm_smmu_destroy_iommu_domain(domain);
>>       } else {
>>           atomic_inc(&domain->ref);
>> +        dev_iommu_domain(dev) = domain;
>
> ... this one. However...
>
>>       }
>>     out:
>> @@ -2794,7 +2795,10 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>>       atomic_dec(&domain->ref);
>>         if (domain->ref.counter == 0)
>> +    {
>>           arm_smmu_destroy_iommu_domain(domain);
>> +        dev_iommu_domain(dev) = NULL;
>> +    }
>
> ... I think this one is incorrect because you would only unset dev_iommu_domain() is the refcount drop to 0. You can have multiple device in the same domain, so the ref.counter may not be 0.
>
> So I think this needs to be moved outside of the if.
Yes, absolutely
> Note that it is also a good practice to remove any reference (e.g. set to NULL) before freeing even if it doesn't much matter here.
>
> Lastly, the file is using the Linux coding style. So { needs to be on the same line as the if.
>
> Cheers,
>
Thanks,

Oleksandr


