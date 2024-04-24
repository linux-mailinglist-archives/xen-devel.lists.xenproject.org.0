Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5A8B06E9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711302.1111168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZW8-00005D-Qi; Wed, 24 Apr 2024 10:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711302.1111168; Wed, 24 Apr 2024 10:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZW8-0008Sz-Mj; Wed, 24 Apr 2024 10:06:20 +0000
Received: by outflank-mailman (input) for mailman id 711302;
 Wed, 24 Apr 2024 10:06:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzZW8-0008Ql-2E
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:06:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzZW7-0007GR-Ih; Wed, 24 Apr 2024 10:06:19 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzZW7-0001dD-9U; Wed, 24 Apr 2024 10:06:19 +0000
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
	bh=Wu5rRE3YbC3tq9tVPX5Y6Aj62ZvtpoxLzJYE+L5ogag=; b=1lSTRDT3imDUgX5I9jSh75teqK
	1q89Y068f0KY0O9DQHntWnpi2HPkoiQSlJeE8T7ex3CibQ+dIKyXSlEK1nN3gfPDnHG8oQ422BxLA
	gpQFghVCDwvlnb6Tq0bOn92dLHk40GagKhgxrs5bY/aKLfErRnOf7k6VTUlsY9TsE9Q4=;
Message-ID: <f6150a28-1aea-4c99-b696-f8b278eb685a@xen.org>
Date: Wed, 24 Apr 2024 11:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
 <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
 <CAHUa44FMsdn8LVc782EYno7fiFDBe7RSaiNgEnnzoc-Bozt05A@mail.gmail.com>
 <931F0F76-3A3F-43D9-84F3-5AF9CDDB7708@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <931F0F76-3A3F-43D9-84F3-5AF9CDDB7708@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand & Jens,

On 24/04/2024 07:53, Bertrand Marquis wrote:
> Hi Jens,
> 
>> On 23 Apr 2024, at 17:26, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Hi Julien,
>>
>> On Mon, Apr 22, 2024 at 1:40 PM Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Jens,
>>>
>>> This is not a full review of the code. I will let Bertrand doing it.
>>>
>>> On 22/04/2024 08:37, Jens Wiklander wrote:
>>>> +void ffa_notif_init(void)
>>>> +{
>>>> +    const struct arm_smccc_1_2_regs arg = {
>>>> +        .a0 = FFA_FEATURES,
>>>> +        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
>>>> +    };
>>>> +    struct arm_smccc_1_2_regs resp;
>>>> +    unsigned int irq;
>>>> +    int ret;
>>>> +
>>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>>> +    if ( resp.a0 != FFA_SUCCESS_32 )
>>>> +        return;
>>>> +
>>>> +    irq = resp.a2;
>>>> +    if ( irq >= NR_GIC_SGI )
>>>> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
>>>> +    ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
>>>
>>> If I am not mistaken, ffa_notif_init() is only called once on the boot
>>> CPU. However, request_irq() needs to be called on every CPU so the
>>> callback is registered every where and the interrupt enabled.
>>>
>>> I know the name of the function is rather confusing. So can you confirm
>>> this is what you expected?
>>
>> Good catch, no this wasn't what I expected. I'll need to change this.
>>
>>>
>>> [...]
>>>
>>>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
>>>> index 98236cbf14a3..ef8ffd4526bd 100644
>>>> --- a/xen/arch/arm/tee/ffa_private.h
>>>> +++ b/xen/arch/arm/tee/ffa_private.h
>>>> @@ -25,6 +25,7 @@
>>>>   #define FFA_RET_DENIED                  -6
>>>>   #define FFA_RET_RETRY                   -7
>>>>   #define FFA_RET_ABORTED                 -8
>>>> +#define FFA_RET_NO_DATA                 -9
>>>>
>>>>   /* FFA_VERSION helpers */
>>>>   #define FFA_VERSION_MAJOR_SHIFT         16U
>>>> @@ -97,6 +98,18 @@
>>>>    */
>>>>   #define FFA_MAX_SHM_COUNT               32
>>>>
>>>> +/*
>>>> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
>>>> + * unused, but that may change.
>>>
>>> Are the value below intended for the guests? If so, can they be moved in
>>> public/arch-arm.h along with the others guest interrupts?
>>
>> Yes, I'll move it.
>>
>>>
>>>> + *
>>>> + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not used
>>>> + * by a guest as they in a non-virtualized system typically are assigned to
>>>> + * the secure world. Here we're free to use SGI 8-15 since they are virtual
>>>> + * and have nothing to do with the secure world.
>>>
>>> Do you have a pointer to the specification?
>>
>> There's one at the top of arch/arm/tee/ffa.c,
>> https://developer.arm.com/documentation/den0077/e
>> Do you want the link close to the defines when I've moved them to
>> public/arch-arm.h?
>> Or is it perhaps better to give a link to "Arm Base System
>> Architecture v1.0C", https://developer.arm.com/documentation/den0094/
>> instead?
> 
> I would say we need the link to Arm Base System Architecture in arch-arm.

+1

Cheers,

-- 
Julien Grall

