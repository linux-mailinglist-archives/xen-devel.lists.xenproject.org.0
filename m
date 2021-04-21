Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF87B366910
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114331.217871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9xn-00087J-61; Wed, 21 Apr 2021 10:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114331.217871; Wed, 21 Apr 2021 10:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9xn-00086x-2Q; Wed, 21 Apr 2021 10:20:07 +0000
Received: by outflank-mailman (input) for mailman id 114331;
 Wed, 21 Apr 2021 10:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZ9xl-0007uo-BG
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:20:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ9xk-0005Li-4D; Wed, 21 Apr 2021 10:20:04 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ9xj-00037g-UT; Wed, 21 Apr 2021 10:20:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1Ve6H2tMHVjkc2t1o2MMy7p052SleOZOwUXS6lOK5Qo=; b=aU9J0gr3bzAkwAK3qR4eB6tVzT
	gNPgx/6RdNU78JyWHhUdCNm4mfHsXbtYRqR5AAorirFjWEihifORPPTzJpS+r06lkByQdAgrgLYCs
	3KiumCxfQ0/BDMRBnGl38ThsTN167DnOJJXMctn2PjH9BIJGYOie7qR3oRyHqyI26ws0=;
Subject: Re: [PATCH 2/9] arm/domain: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-3-michal.orzel@arm.com>
 <80f89abe-d81f-8b56-583c-470289abae0b@xen.org>
 <fabfcd90-a46b-c496-2db4-258c47d0991f@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e6e437eb-c986-48d4-90a9-fe6e04cec966@xen.org>
Date: Wed, 21 Apr 2021 11:20:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <fabfcd90-a46b-c496-2db4-258c47d0991f@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 21/04/2021 08:36, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 20.04.2021 15:12, Julien Grall wrote:
>> Hi Michal,
>>
>> On 20/04/2021 08:08, Michal Orzel wrote:
>>> AArch64 system registers are 64bit whereas AArch32 ones
>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>> we should get rid of helpers READ/WRITE_SYSREG32
>>> in favour of using READ/WRITE_SYSREG.
>>> We should also use register_t type when reading sysregs
>>> which can correspond to uint64_t or uint32_t.
>>> Even though many AArch64 sysregs have upper 32bit reserved
>>> it does not mean that they can't be widen in the future.
>>>
>>> Modify type of registers: actlr, cntkctl to register_t.
>>
>> ACTLR is implementation defined, so in theory there might already bits already defined in the range [32:63]. So I would consider to split it from the patch so we can backport it.
>>
> You mean not to touch it at all in this series or to create a seperate patch only for ACTLR?

I meant creating a separate patch for ACTLR as part of this series.


>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>    xen/arch/arm/domain.c        | 20 ++++++++++----------
>>>    xen/include/asm-arm/domain.h |  4 ++--
>>>    2 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index bdd3d3e5b5..c021a03c61 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -113,13 +113,13 @@ static void ctxt_switch_from(struct vcpu *p)
>>>        p->arch.tpidr_el1 = READ_SYSREG(TPIDR_EL1);
>>>          /* Arch timer */
>>> -    p->arch.cntkctl = READ_SYSREG32(CNTKCTL_EL1);
>>> +    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
>>>        virt_timer_save(p);
>>>          if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
>>>        {
>>> -        p->arch.teecr = READ_SYSREG32(TEECR32_EL1);
>>> -        p->arch.teehbr = READ_SYSREG32(TEEHBR32_EL1);
>>> +        p->arch.teecr = READ_SYSREG(TEECR32_EL1);
>>> +        p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
>>
>> It feels strange you converted cntkctl and actlr to use register_t but not teecr and teehbr. Can you explain why?
>>
> Because thumbee and its registers do not appear in any of ARMv8 ARM version.

This was defined on the very first version of the ARMv8-A spec (issue 
a.a) but was dropped on subsequent versinos. Hence why the compiler 
doesn't shout at you when finding TEECR32_EL1 and TEEHBR32_EL1.

> This means that this code could be protected even with #ifdef CONFIG_ARM_32 as AArch64 do not have them.

+1. The feature was completely dropped for Armv8 (even if it appeared in 
earlier version of the spec). I have checked AMD Seattle, QEMU and the 
Foundation model to confirm the feature is not exposed.

Cheers,

-- 
Julien Grall

