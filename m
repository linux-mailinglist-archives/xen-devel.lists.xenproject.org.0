Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E556419A
	for <lists+xen-devel@lfdr.de>; Sat,  2 Jul 2022 18:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359384.588803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7gFx-0005Q3-Tm; Sat, 02 Jul 2022 16:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359384.588803; Sat, 02 Jul 2022 16:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7gFx-0005OH-Qi; Sat, 02 Jul 2022 16:46:05 +0000
Received: by outflank-mailman (input) for mailman id 359384;
 Sat, 02 Jul 2022 16:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVQg=XH=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o7gFw-0005OB-6t
 for xen-devel@lists.xenproject.org; Sat, 02 Jul 2022 16:46:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742e18fd-fa26-11ec-bd2d-47488cf2e6aa;
 Sat, 02 Jul 2022 18:46:02 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so5422207wmp.3
 for <xen-devel@lists.xenproject.org>; Sat, 02 Jul 2022 09:46:01 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b0021018642ff8sm27361345wrm.76.2022.07.02.09.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 09:45:59 -0700 (PDT)
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
X-Inumbo-ID: 742e18fd-fa26-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=meb/BRY4yeRhFjn0PwBz4K63lWMtc3ivi4vwL+W878s=;
        b=qVoRRq71Gv97X0/guuVC59ykQUuIwJkmbE4uWo49bnAFPHorwSS+6ZuiEKTs++u8pv
         5AWZ6pQepEBREKRipdF+pGu9MHXK11kHP2s8YmoeQDaRCAYkBTptQ7Hi2DzkQjjFL6hJ
         dAlpm1VZ/AxtZnLN2jnB4NwViItV5yW7CB9wzSKo2hPMhbel+7ADvgj5X2B+6bzqQ1bx
         0mWdGIrVaZtMc3BI3XXkVGpSpL7P8JVh4FRhtouK6Oc51qVsrssw37A4RZeRVX91VDRD
         slFLgIlOexg/OKwx6HL//mGGLsYN4Xo5+tFMOy2rZZn0vpA0p46rlIYTAtgEorpDN/Qq
         OU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=meb/BRY4yeRhFjn0PwBz4K63lWMtc3ivi4vwL+W878s=;
        b=cWZ0zkz4VZZMKtOM3yNtRvHclZJhk8AZAwpleJvWzjucIL1VEyjyrZfMMC5cIwU3IP
         nHzw1tnYssLxhhYKYt8INCqDOr5sIVy5qfYVRMIOQv/0um0tqdNLrQmcCdte4/8EIrpM
         AhG1mKtiMz9iAUxunDO8men/nPzopv4dMsb7XWiCpVBbUfZZ8TgOfSBEPIuBEUJ5tx4U
         zYf0JhS3mkbk5p44Ilb/kubKywRYFQKAdXgKaHaG6CdA6N9ZtclvcsqWqgnm0JuqTMeB
         Q/v1f0YW94EBAJz+8d8H4U9ZZb2VzThhULXTScOehCSZVwHPBncAKP7bkbBnlOlctpPQ
         AfSQ==
X-Gm-Message-State: AJIora94eIyoGqUsIxoek0m7OhSzOMaR4lQTZlMmYF9bQLHRVLFthifD
	tlymKOs5GlEBbHUb1iQXnuI=
X-Google-Smtp-Source: AGRyM1vqhnWyk5QClPDYeE1wEwMKHjZLYMEDz3GbGgJ/RjqSZUfh8ByTlcxm7quOajWW6BYBYCsWrQ==
X-Received: by 2002:a05:600c:1c9d:b0:3a0:4e04:9475 with SMTP id k29-20020a05600c1c9d00b003a04e049475mr23815799wms.87.1656780360051;
        Sat, 02 Jul 2022 09:46:00 -0700 (PDT)
Message-ID: <468ea656-a03c-8591-f5f8-4d0d329ae187@gmail.com>
Date: Sat, 2 Jul 2022 19:45:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
 <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
 <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
 <D8C0B798-C736-45CC-A723-1535131F1323@arm.com>
 <E0AD2430-78DB-454B-9D76-EB2E24E80E1F@arm.com>
 <1e53136a-0675-6a0f-e06c-6ffb390d9399@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <1e53136a-0675-6a0f-e06c-6ffb390d9399@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/22 18:02, Julien Grall wrote:
> On 29/06/2022 15:10, Bertrand Marquis wrote:
>> Hi,
> 
> Hi Bertrand,
> 
>> In fact the patch was committed before we started this discussion as 
>> Rahul R-b was enough.
> 
> It was probably merged a bit too fast. When there are multiple 
> maintainers responsible for the code, I tend to prefer to wait a bit 
> just in case there are extra comments.
> 
>> But I would still be interested to have other maintainers view on this.
> 
> Rahul and you are the official maintainers for that code. I think 
> Stefano and I are only CCed because we maintain the Arm code 
> (get_maintainers.pl doesn't automatically remove maintainers from upper 
> directory).
> 
>>
>>> On 29 Jun 2022, at 10:03, Bertrand Marquis <Bertrand.Marquis@arm.com> 
>>> wrote:
>>>
>>> Hi Xenia,
>>>
>>>> On 29 Jun 2022, at 09:55, xenia <burzalodowa@gmail.com> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On 6/29/22 10:24, Bertrand Marquis wrote:
>>>>> Hi Xenia,
>>>>>
>>>>>> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>>>> wrote:
>>>>>>
>>>>>> The expression 1 << 31 produces undefined behaviour because the 
>>>>>> type of integer
>>>>>> constant 1 is (signed) int and the result of shifting 1 by 31 bits 
>>>>>> is not
>>>>>> representable in the (signed) int type.
>>>>>> Change the type of 1 to unsigned int by adding the U suffix.
>>>>>>
>>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>>> ---
>>>>>> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
>>>>>> For GBPA_UPDATE I will submit a patch.
>>>>>>
>>>>>> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c 
>>>>>> b/xen/drivers/passthrough/arm/smmu-v3.c
>>>>>> index 1e857f915a..f2562acc38 100644
>>>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>>>> @@ -338,7 +338,7 @@ static int 
>>>>>> platform_get_irq_byname_optional(struct device *dev,
>>>>>> #define CR2_E2H                (1 << 0)
>>>>>>
>>>>>> #define ARM_SMMU_GBPA            0x44
>>>>>> -#define GBPA_UPDATE            (1 << 31)
>>>>>> +#define GBPA_UPDATE            (1U << 31)
>>>>>> #define GBPA_ABORT            (1 << 20)
>>>>>>
>>>>>> #define ARM_SMMU_IRQ_CTRL        0x50
>>>>>> @@ -410,7 +410,7 @@ static int 
>>>>>> platform_get_irq_byname_optional(struct device *dev,
>>>>>>
>>>>>> #define Q_IDX(llq, p)            ((p) & ((1 << (llq)->max_n_shift) 
>>>>>> - 1))
>>>>>> #define Q_WRP(llq, p)            ((p) & (1 << (llq)->max_n_shift))
>>>>> Could also make sense to fix those 2 to be coherent.
>>>> According to the spec, the maximum value that max_n_shift can take 
>>>> is 19.
>>>> Hence, 1 << (llq)->max_n_shift cannot produce undefined behavior.
>>>
>>> I agree with that but my preference would be to not rely on deep 
>>> analysis on the code for those kind of cases and use 1U whenever 
>>> possible.
>>>
>>> What other maintainers think on this ?
> 
> In general, I prefer if we use 1U (or 1UL/1ULL) so it is clearer that 
> the code is correct and consistent (I always find odd when we use 1U << 
> 31 but 1 << 20).
> 
> In this case, even if you use 1U, it is not really clear whether 
> max_n_shift can be greater than 31. That said, I would not suggest to 
> use ULL unless this is strictly necessary.
> 
>>>
>>>>
>>>> Personally, I have no problem to submit another patch that adds U/UL 
>>>> suffixes to all shifted integer constants in the file :) but ...
>>>> It seems that this driver has been ported from linux and this file 
>>>> still uses linux coding style, probably because deviations will 
>>>> reduce its maintainability.
>>>> Adding a U suffix to those two might be considered an unjustified 
>>>> deviation.
> 
> This can be solved by sending patch to Linux as well. This will also 
> help Linux to reduce the number MISRA violations (I guess SMMUv3 will be 
> part of the safety certification scope).

Linux relies on -fno-strict-overflow (implementation-defined behavior). 
Nevertheless, a patch changing all of them to BIT() has some chances to 
get accepted.

> 
>>>
>>> At this stage the SMMU code is starting to deviate a lot from Linux 
>>> so it will not be possible to update it easily to sync with latest 
>>> linux code.
>>> And the decision should be are we fixing it or should we fully skip 
>>> this file saying that it is coming from linux and should not be fixed.
>>> We started to have a discussion during the FuSa meeting on this but 
>>> we need to come up with a conclusion per file.
>>>
>>> On this one I would say keeping it with linux code style and near 
>>> from the linux one is not needed.
> 
> I will address both point separately.
> 
> In general, we don't want to mix coding style within a file. As the file 
> started with the Linux one, then we should keep it like that. Otherwise, 
> you will end up with a mix and it will be difficult for the contributor 
> to know how to write new code. That said, I would not necessarily 
> consider using "1 << ..." as part of the code style we want to keep.
> 
> This brings to the second part (i.e. keeping the code near Linux). Linux 
> has a much larger user/developper base than us. Therefore there are more 
> chance for them to find bugs and fix them. By diverging, then we could 
> end up to add new bugs and also increase the maintainance.
> 
> I have tried both way with the SMMUv{1,2} driver. The first attempt was 
> to fully adapt the code to Xen (coding style...). But this made 
> difficult to keep track of bugs. A few months we removed it completely 
> and then tried to keep as close as to Linux. Since then Linux reworked 
> the IOMMU subsystem, so port needs to be adapted. It is more difficult 
> but likely less than if we had our own port.
> 
> So overall, I think it was beneficials for our version of the SMMU{v1, 
> v2} drivers to be close to Linux. I haven't looked very close to the 
> SMMUv3 to state whether we should stay close or not.
> 
>>> Rahul, Julien, Stefano: what do you think here ?
> 
> Rahul and you are the maintainers. I can share my preference/experience, 
> but I think this is your call on how you want to maintain the driver.
> 
> Cheers,
> 

-- 
Xenia

