Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A954E5C2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 17:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350659.577122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1rBb-0003tr-UI; Thu, 16 Jun 2022 15:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350659.577122; Thu, 16 Jun 2022 15:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1rBb-0003rF-Qn; Thu, 16 Jun 2022 15:13:31 +0000
Received: by outflank-mailman (input) for mailman id 350659;
 Thu, 16 Jun 2022 15:13:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1rBa-0003r5-TP
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 15:13:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1rBa-0004lB-42; Thu, 16 Jun 2022 15:13:30 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.152.232]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1rBZ-0006ge-US; Thu, 16 Jun 2022 15:13:30 +0000
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
	bh=g9TslAzVbdz+fosdKYYeZ1z0yLhfuYxU8pge/Uaom6g=; b=15Sp7z9eMe1BOT86EYIMLuC6AE
	k6rGQ2LD+MG+eAxE0oYfWTg6q+itvG7drjnBRYLtuny4fOq9yL7lxJ8D3//h3Tuv/D64F1EbG+E1H
	nBCwvvCSCnRbCEyGqaSm2hwTj9XQKVqLg40dLx3vcRRCYOao7tjTgo2fPBAylRN10B2k=;
Message-ID: <0c6d58ae-bd8d-a3d8-d8d9-2b7a5340b4dd@xen.org>
Date: Thu, 16 Jun 2022 16:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-2-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
 <20220615155825.GA30639@jade> <588f9903-2a0e-a546-912a-24d2a13c3c6f@xen.org>
 <20220615220901.GA43803@jade>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220615220901.GA43803@jade>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jens,

On 15/06/2022 23:09, Jens Wiklander wrote:
> On Wed, Jun 15, 2022 at 08:01:28PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 15/06/2022 16:58, Jens Wiklander wrote:
>>> On Fri, Jun 10, 2022 at 05:41:33PM -0700, Stefano Stabellini wrote:
>>>>>    #endif /* __ASSEMBLY__ */
>>>>>    /*
>>>>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>>>>> index 676740ef1520..6f90c08a6304 100644
>>>>> --- a/xen/arch/arm/vsmc.c
>>>>> +++ b/xen/arch/arm/vsmc.c
>>>>> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>>>>>        switch ( fid )
>>>>>        {
>>>>>        case ARM_SMCCC_VERSION_FID:
>>>>> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
>>>>> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>>>>>            return true;
>>>> This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
>>>> is unimplemented on ARM32. If there is an ARM32 implementation in Linux
>>>> for ARM_SMCCC_VERSION_1_2 you might as well import it too.
>>>>
>>>> Otherwise we'll have to abstract it away, e.g.:
>>>>
>>>> #ifdef CONFIG_ARM_64
>>>> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
>>>> #else
>>>> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
>>>> #endif
>>>
>>> I couldn't find an ARM32 implementation for ARM_SMCCC_VERSION_1_2. But
>>> I'm not sure it's needed at this point. From what I've understood r4-17
>>> are either preserved or updated by the function ID in question. So
>>> claiming ARM_SMCCC_VERSION_1_2 shouldn't break anything.
>>
>> So in Xen, we always take a snapshot of the registers on entry to the
>> hypervisor and only touch it when necessary. Therefore, it doesn't matter
>> whether we claim to be complaient with 1.1 or 1.2 based on the argument
>> passing convention.
>>
>> However, the spec is not only about arguments. For instance, SMCCC v1.1 also
>> added some mandatory functions (e.g. detection the version). I haven't
>> looked closely on whether the SMCCC v1.2 introduced such thing. Can you
>> confirm what mandatory feature comes with 1.2?
> 
> There's a nice summary in a table at the end of the C version of DEN0028
> you linked below. For SMCCC v1.2:
> Argument/Result register set:
> Permits calls to use R4—R7 as return register (Section 4.1).
> Permits calls to use X4—X17 as return registers(Section3.1).
> Permits calls to use X8—X17 as argument registers (Section 3.1).
> Introduces:
> SMCCC_ARCH_SOC_ID (Section 7.4)
> Deprecates:
> UID, Revision Queries on Arm Architecture Service (Section 6.2)
> Count Query on all services (Section 6.2)

Thanks for posting here!

> 
> As far a I can tell nothing mandatory is introduced with version 1.2.

Agree. So it is safe to expose 1.2 unconditionally to the VMs.

Cheers,

-- 
Julien Grall

