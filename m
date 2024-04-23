Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC058AEA8B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710818.1110352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHsa-0004Oz-Le; Tue, 23 Apr 2024 15:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710818.1110352; Tue, 23 Apr 2024 15:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHsa-0004MH-Iz; Tue, 23 Apr 2024 15:16:20 +0000
Received: by outflank-mailman (input) for mailman id 710818;
 Tue, 23 Apr 2024 15:16:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzHsZ-0004M6-RR
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:16:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzHsY-0002nD-Fl; Tue, 23 Apr 2024 15:16:18 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzHsY-0006Ks-9X; Tue, 23 Apr 2024 15:16:18 +0000
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
	bh=E9Sp/zcLuCwq/Jq+7B7qxRfozJWFaKuP6eFByv+Cq30=; b=Dvm1WTY4kDYeeSoXfH6xeAJWK9
	Dp2LqyF8xLtGJtVYvOUaz0KEwe4MwfR8Q3+wLPa2v93SCrJkh7RgSH8nJlunc8bA4NgzDqqoRcctQ
	0IGMi2vQMKhyP3HikAgOvTfW56VeXsXz9vUb2oZ1VZKOu2q9JWW08Ha9c38qULTaC+5M=;
Message-ID: <bf1b49aa-1651-4913-89c3-f523a91ae39b@xen.org>
Date: Tue, 23 Apr 2024 16:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
 <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
 <7B792228-17C6-412C-B0E6-950433FE6C11@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7B792228-17C6-412C-B0E6-950433FE6C11@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 23/04/2024 16:12, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 22 Apr 2024, at 13:40, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jens,
>>
>> This is not a full review of the code. I will let Bertrand doing it.
>>
>> On 22/04/2024 08:37, Jens Wiklander wrote:
>>> +void ffa_notif_init(void)
>>> +{
>>> +    const struct arm_smccc_1_2_regs arg = {
>>> +        .a0 = FFA_FEATURES,
>>> +        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +    unsigned int irq;
>>> +    int ret;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +    if ( resp.a0 != FFA_SUCCESS_32 )
>>> +        return;
>>> +
>>> +    irq = resp.a2;
>>> +    if ( irq >= NR_GIC_SGI )
>>> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
>>> +    ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
>>
>> If I am not mistaken, ffa_notif_init() is only called once on the boot CPU. However, request_irq() needs to be called on every CPU so the callback is registered every where and the interrupt enabled.
>>
>> I know the name of the function is rather confusing. So can you confirm this is what you expected?
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
>>> index 98236cbf14a3..ef8ffd4526bd 100644
>>> --- a/xen/arch/arm/tee/ffa_private.h
>>> +++ b/xen/arch/arm/tee/ffa_private.h
>>> @@ -25,6 +25,7 @@
>>>   #define FFA_RET_DENIED                  -6
>>>   #define FFA_RET_RETRY                   -7
>>>   #define FFA_RET_ABORTED                 -8
>>> +#define FFA_RET_NO_DATA                 -9
>>>     /* FFA_VERSION helpers */
>>>   #define FFA_VERSION_MAJOR_SHIFT         16U
>>> @@ -97,6 +98,18 @@
>>>    */
>>>   #define FFA_MAX_SHM_COUNT               32
>>>   +/*
>>> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
>>> + * unused, but that may change.
>>
>> Are the value below intended for the guests? If so, can they be moved in public/arch-arm.h along with the others guest interrupts?
> 
> The values are to be used by the guest but they will discover them through the FFA_FEATURES ABI so I do not think those
> should belong the public headers.

Sorry I should have been clearer. The values in the public headers are 
not meant for the guest. They are meant for a common understanding 
between the toolstack and Xen of the guest layout (memory + interrupts).

I know that some of the guests started to rely on it. But this is 
against our policy:

  * These are defined for consistency between the tools and the
  * hypervisor. Guests must not rely on these hardcoded values but
  * should instead use the FDT.

In this case, even if this is only used by Xen (today), I would argue 
they should defined at the same place because it is easier to understand 
the layout if it is in one place.

Cheers,

-- 
Julien Grall

