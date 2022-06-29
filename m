Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEF5603C7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 17:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357922.586802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ZD1-00017y-0m; Wed, 29 Jun 2022 15:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357922.586802; Wed, 29 Jun 2022 15:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ZD0-00016C-U7; Wed, 29 Jun 2022 15:02:26 +0000
Received: by outflank-mailman (input) for mailman id 357922;
 Wed, 29 Jun 2022 15:02:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6ZCz-00015n-22
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 15:02:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6ZCy-0005Fd-Hi; Wed, 29 Jun 2022 15:02:24 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6ZCy-0000fQ-8n; Wed, 29 Jun 2022 15:02:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lywU+qnXAnogvgk9qTspWsxzTHhKuRc8BOUBuQExzps=; b=RpKT3YElscYWah6+nFgyzkKAIq
	EeBT4wTb5jFmXKpwHgpGwgtJDNg8hKmHFM0ujNqioqRZAhqoJG9dinLdD2AEC79MzpIN+pvs/+7Uz
	jBxJ21ZBVzrgLHsK2bs1mQl0dWmBpZB2wLVJAbsaUkJqDnwEEsg5ERjzFWRbFa4xGCQo=;
Message-ID: <1e53136a-0675-6a0f-e06c-6ffb390d9399@xen.org>
Date: Wed, 29 Jun 2022 16:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, xenia <burzalodowa@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
 <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
 <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
 <D8C0B798-C736-45CC-A723-1535131F1323@arm.com>
 <E0AD2430-78DB-454B-9D76-EB2E24E80E1F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E0AD2430-78DB-454B-9D76-EB2E24E80E1F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/06/2022 15:10, Bertrand Marquis wrote:
> Hi,

Hi Bertrand,

> In fact the patch was committed before we started this discussion as Rahul R-b was enough.

It was probably merged a bit too fast. When there are multiple 
maintainers responsible for the code, I tend to prefer to wait a bit 
just in case there are extra comments.

> But I would still be interested to have other maintainers view on this.

Rahul and you are the official maintainers for that code. I think 
Stefano and I are only CCed because we maintain the Arm code 
(get_maintainers.pl doesn't automatically remove maintainers from upper 
directory).

> 
>> On 29 Jun 2022, at 10:03, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Xenia,
>>
>>> On 29 Jun 2022, at 09:55, xenia <burzalodowa@gmail.com> wrote:
>>>
>>> Hi Bertrand,
>>>
>>> On 6/29/22 10:24, Bertrand Marquis wrote:
>>>> Hi Xenia,
>>>>
>>>>> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>>>>
>>>>> The expression 1 << 31 produces undefined behaviour because the type of integer
>>>>> constant 1 is (signed) int and the result of shifting 1 by 31 bits is not
>>>>> representable in the (signed) int type.
>>>>> Change the type of 1 to unsigned int by adding the U suffix.
>>>>>
>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>> ---
>>>>> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
>>>>> For GBPA_UPDATE I will submit a patch.
>>>>>
>>>>> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>>>> index 1e857f915a..f2562acc38 100644
>>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>>> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
>>>>> #define CR2_E2H				(1 << 0)
>>>>>
>>>>> #define ARM_SMMU_GBPA			0x44
>>>>> -#define GBPA_UPDATE			(1 << 31)
>>>>> +#define GBPA_UPDATE			(1U << 31)
>>>>> #define GBPA_ABORT			(1 << 20)
>>>>>
>>>>> #define ARM_SMMU_IRQ_CTRL		0x50
>>>>> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
>>>>>
>>>>> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>>>>> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
>>>> Could also make sense to fix those 2 to be coherent.
>>> According to the spec, the maximum value that max_n_shift can take is 19.
>>> Hence, 1 << (llq)->max_n_shift cannot produce undefined behavior.
>>
>> I agree with that but my preference would be to not rely on deep analysis on the code for those kind of cases and use 1U whenever possible.
>>
>> What other maintainers think on this ?

In general, I prefer if we use 1U (or 1UL/1ULL) so it is clearer that 
the code is correct and consistent (I always find odd when we use 1U << 
31 but 1 << 20).

In this case, even if you use 1U, it is not really clear whether 
max_n_shift can be greater than 31. That said, I would not suggest to 
use ULL unless this is strictly necessary.

>>
>>>
>>> Personally, I have no problem to submit another patch that adds U/UL suffixes to all shifted integer constants in the file :) but ...
>>> It seems that this driver has been ported from linux and this file still uses linux coding style, probably because deviations will reduce its maintainability.
>>> Adding a U suffix to those two might be considered an unjustified deviation.

This can be solved by sending patch to Linux as well. This will also 
help Linux to reduce the number MISRA violations (I guess SMMUv3 will be 
part of the safety certification scope).

>>
>> At this stage the SMMU code is starting to deviate a lot from Linux so it will not be possible to update it easily to sync with latest linux code.
>> And the decision should be are we fixing it or should we fully skip this file saying that it is coming from linux and should not be fixed.
>> We started to have a discussion during the FuSa meeting on this but we need to come up with a conclusion per file.
>>
>> On this one I would say keeping it with linux code style and near from the linux one is not needed.

I will address both point separately.

In general, we don't want to mix coding style within a file. As the file 
started with the Linux one, then we should keep it like that. Otherwise, 
you will end up with a mix and it will be difficult for the contributor 
to know how to write new code. That said, I would not necessarily 
consider using "1 << ..." as part of the code style we want to keep.

This brings to the second part (i.e. keeping the code near Linux). Linux 
has a much larger user/developper base than us. Therefore there are more 
chance for them to find bugs and fix them. By diverging, then we could 
end up to add new bugs and also increase the maintainance.

I have tried both way with the SMMUv{1,2} driver. The first attempt was 
to fully adapt the code to Xen (coding style...). But this made 
difficult to keep track of bugs. A few months we removed it completely 
and then tried to keep as close as to Linux. Since then Linux reworked 
the IOMMU subsystem, so port needs to be adapted. It is more difficult 
but likely less than if we had our own port.

So overall, I think it was beneficials for our version of the SMMU{v1, 
v2} drivers to be close to Linux. I haven't looked very close to the 
SMMUv3 to state whether we should stay close or not.

>> Rahul, Julien, Stefano: what do you think here ?

Rahul and you are the maintainers. I can share my preference/experience, 
but I think this is your call on how you want to maintain the driver.

Cheers,

-- 
Julien Grall

