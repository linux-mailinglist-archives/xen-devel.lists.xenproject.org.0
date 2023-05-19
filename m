Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86F709A51
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 16:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537132.835959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01NI-0003tw-Pv; Fri, 19 May 2023 14:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537132.835959; Fri, 19 May 2023 14:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01NI-0003s0-Lm; Fri, 19 May 2023 14:46:32 +0000
Received: by outflank-mailman (input) for mailman id 537132;
 Fri, 19 May 2023 14:46:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q01NI-0003rs-4m
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 14:46:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q01NH-0005eB-Lk; Fri, 19 May 2023 14:46:31 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.127]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q01NH-0007Wl-GI; Fri, 19 May 2023 14:46:31 +0000
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
	bh=evzsQn0cxznW7Q5CwHPtUbJ0lQbK8eu+IxdLYMEyEtE=; b=pXIUUsNIoFpv1AkWZGrdSmaDQt
	yKNR2Q1h1GEsQi0cHKiIF0gxKmX5iKfeWqX4AddUtBefWhelsYgrTag6lOJW3oHRBCS7TWHE6fucU
	Ie3i7804o7V7YOUbpqFYUlrHwTK/Yx3ZpJwTGs5J8AR7l4rrmNx0qzrh30BkbeP6yfwg=;
Message-ID: <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
Date: Fri, 19 May 2023 15:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 19/05/2023 15:26, Luca Fancellu wrote:
>> On 18 May 2023, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>    /*
>>>     * Comment from Linux:
>>>     * Userspace may perform DC ZVA instructions. Mismatched block sizes
>>> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
>>> new file mode 100644
>>> index 000000000000..4d1549344733
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/sve-asm.S
>>> @@ -0,0 +1,48 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Arm SVE assembly routines
>>> + *
>>> + * Copyright (C) 2022 ARM Ltd.
>>> + *
>>> + * Some macros and instruction encoding in this file are taken from linux 6.1.1,
>>> + * file arch/arm64/include/asm/fpsimdmacros.h, some of them are a modified
>>> + * version.
>> AFAICT, the only modified version is _sve_rdvl, but it is not clear to me why we would want to have a modified version?
>>
>> I am asking this because without an explanation, it would be difficult to know how to re-sync the code with Linux.
> 
> In this patch the macros are exactly equal to Linux, apart from the coding style that uses spaces instead of tabs,
> I was not expecting to keep them in sync as they seems to be not prone to change soon, let me know if I need to
> use also tabs and be 100% equal to Linux.

The file is small enough, so I think it would be OK if this is converted 
to the Xen coding style.

> 
> The following macros that are coming in patch 5 are equal apart from sve_save/sve_load, that are different because
> of the construction differences between the storage buffers here and in Linux, if you want I can put a comment on them
> to explain this difference in patch 5

That would be good. Also, can you update 
arch/arm/README.LinuxPrimitives? The file is listing primitives imported 
from Linux and when.

> 
>>>
>>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>>> new file mode 100644
>>> index 000000000000..6f3fb368c59b
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -0,0 +1,50 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>
>> Above, you are using GPL-2.0-only, but here GPL-2.0. We favor the former now. Happy to deal it on commit if there is nothing else to address.
> 
> No problem, I will fix in the next push
> 
>>
>>> +/*
>>> + * Arm SVE feature code
>>> + *
>>> + * Copyright (C) 2022 ARM Ltd.
>>> + */
>>> +
>>> +#include <xen/types.h>
>>> +#include <asm/arm64/sve.h>
>>> +#include <asm/arm64/sysregs.h>
>>> +#include <asm/processor.h>
>>> +#include <asm/system.h>
>>> +
>>> +extern unsigned int sve_get_hw_vl(void);
>>> +
>>> +register_t compute_max_zcr(void)
>>> +{
>>> +    register_t cptr_bits = get_default_cptr_flags();
>>> +    register_t zcr = vl_to_zcr(SVE_VL_MAX_BITS);
>>> +    unsigned int hw_vl;
>>> +
>>> +    /* Remove trap for SVE resources */
>>> +    WRITE_SYSREG(cptr_bits & ~HCPTR_CP(8), CPTR_EL2);
>>> +    isb();
>>> +
>>> +    /*
>>> +     * Set the maximum SVE vector length, doing that we will know the VL
>>> +     * supported by the platform, calling sve_get_hw_vl()
>>> +     */
>>> +    WRITE_SYSREG(zcr, ZCR_EL2);
>>
>>  From my reading of the Arm (D19-6331, ARM DDI 0487J.a), a direct write to a system register would need to be followed by an context synchronization event (e.g. isb()) before the software can rely on the value.
>>
>> In this situation, AFAICT, the instruciton in sve_get_hw_vl() will use the content of ZCR_EL2. So don't we need an ISB() here?
> 
>  From what I’ve read in the manual for ZCR_ELx:
> 
> An indirect read of ZCR_EL2.LEN appears to occur in program order relative to a direct write of
> the same register, without the need for explicit synchronization
> 
> I’ve interpreted it as “there is no need to sync before write” and I’ve looked into Linux and it does not
> Appear any synchronisation mechanism after a write to that register, but if I am wrong I can for sure
> add an isb if you prefer.

Ah, I was reading the generic section about synchronization and didn't 
realize there was a paragraph in the ZCR_EL2 section as well.

Reading the new section, I agree with your understanding. The isb() is 
not necessary.

So please ignore this comment :).

>>>       /* XXX MPU */
>>>         /* Fault Status */
>>> @@ -234,6 +231,7 @@ static void ctxt_switch_to(struct vcpu *n)
>>>       p2m_restore_state(n);
>>>         /* Control Registers */
>>> +    WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>>
>> I would prefer if this called closer to vfp_restore_state(). So the dependency between the two is easier to spot.
>>
>>>       WRITE_SYSREG(n->arch.cpacr, CPACR_EL1);
>>>         /*
>>> @@ -258,6 +256,9 @@ static void ctxt_switch_to(struct vcpu *n)
>>>   #endif
>>>       isb();
>>>   +    /* VFP */
>>
>> Please document in the code that vfp_restore_state() have to be called after CPTR_EL2() + a synchronization event.
>>
>> Similar docoumentation on top of at least CPTR_EL2 and possibly isb(). This would help if we need to re-order the code in the future.
> 
> I will put comments on top of CPTR_EL2 and vfp_restore_state to explain the sequence and the synchronisation.

Just to clarify, does this mean you will keep CPTR_EL2 where it 
currently is? (See my comment just above in the previous e-mail)

Cheers,

-- 
Julien Grall

