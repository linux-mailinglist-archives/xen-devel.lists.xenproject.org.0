Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5A3DA076
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 11:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161868.297040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m92Xb-0001TH-6k; Thu, 29 Jul 2021 09:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161868.297040; Thu, 29 Jul 2021 09:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m92Xb-0001Qg-3F; Thu, 29 Jul 2021 09:41:23 +0000
Received: by outflank-mailman (input) for mailman id 161868;
 Thu, 29 Jul 2021 09:41:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m92XZ-0001Qa-Ae
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 09:41:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m92XY-0003c9-1X; Thu, 29 Jul 2021 09:41:20 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m92XX-00065k-Np; Thu, 29 Jul 2021 09:41:19 +0000
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
	bh=Q50/GiUtc6GnMNb8ChBgVPHn3+xq6hlSNkiQo7MwKs0=; b=xee0sMom+vfrmLhN2UjWjtZqc6
	8ZQH8vNTP8KZ2wckOm8qV6SsXLMi8h++Xhmlw6Zl2qJ4jdql2bB77KCPPYSI7aNmDyhFiB/2ehQq7
	114qc877F/5DvSaphivWB0eyTMKDk99xxCHwZTIongAYEzYKk2TAKnQvcfQOeqAgR9kw=;
Subject: Re: [RFC PATCH] xen/arm: Replace vreg_emulate_{sysreg/cp}32 with
 vreg_emulate_{sysreg/cp}
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210727095010.11103-1-michal.orzel@arm.com>
 <57e5bc75-052a-1530-e983-4e52d1527861@xen.org>
 <fb35b5b6-96b7-7677-5ad0-9b2cd00dcca6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <62b30599-4975-07fd-fdbb-43b937b6b17b@xen.org>
Date: Thu, 29 Jul 2021 10:41:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fb35b5b6-96b7-7677-5ad0-9b2cd00dcca6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 29/07/2021 10:34, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 28.07.2021 16:59, Julien Grall wrote:
>> Hi Michal,
>>
>> On 27/07/2021 10:50, Michal Orzel wrote:
>>> According to ARMv8A architecture, AArch64 registers
>>> are 64bit wide even though in many cases the upper
>>> 32bit is reserved. Therefore there is no need for
>>> function vreg_emulate_sysreg32 on arm64.
>>>
>>> Ideally on arm64 there should be only one function
>>> vreg_emulate_sysreg(using register_t) or
>>> vreg_emulate_sysreg64(using uint64_t) but in the Xen code
>>> there is a lot of functions passed both to the
>>> vreg_emulate_cp* and vreg_emulate_sysreg*.
>>> This would require to duplicate them which is not
>>> a good solution.
>>
>> I think you can drop vreg_emulate_sysreg64() completely. On arm64, register_t is an alias to uint64_t so you could interchangeably use the type in the callback.
>>
> Yes, you are right.
>> For arm32, we would still need to keep vreg_emulate_cp64.
>>
>>>
>>> The easiest/minimal solution to fix this issue is
>>> to replace vreg_emulate_{sysreg/cp}32 with
>>> vreg_emulate_{sysreg/cp}. The modifed functions
>>> are now taking function pointer:
>>> -typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>>>                                 register_t *r, bool read);
>>> instead of:
>>> -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs,
>>>                                   uint32_t *r, bool read);
>>>
>>> This change allows to properly use 64bit registers on arm64
>>> and in case of 32bit guest the cast is done by the hardware
>>> due to the 32bit registers being the lower part of 64bit ones.
>>
>> The HW doesn't do any cast. From the Arm Arm (D1.19.1 in ARM DDI 0487F.c):
>>
>> "Any modifications made to AArch32 System registers affects only those parts of those AArch64 registers that are
>> mapped to the AArch32 System registers. Bits[63:32] of AArch64 registers, where they are not mapped to AArch32
>> registers, are unchanged by AArch32 state execution."
>>
>> The registers can be set by:
>>    * The toolstack (via XEN_DOMCTL_set_vcpucontext). We rely on the top bits to always be 0. Ideally, we should 0 it in vcpu_regs_user_to_hyp() just for safety.
>>    * The PSCI CPU ON call: They should always be 0.
>>
>> For the rest of Xen, we expect that the top 32-bit will either be untouched or never be changed.
>>
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>> The reason for this change is to clean up the mess related to types.
>>> This patch achieves that but it does not reduce the code size.
>>> I'm not sure whether we want such change hence it is pushed as RFC.
>>> ---
>>>    xen/arch/arm/vcpreg.c      | 16 +++++++++++-----
>>>    xen/arch/arm/vtimer.c      | 18 +++++++++---------
>>>    xen/include/asm-arm/vreg.h | 14 +++++++-------
>>>    3 files changed, 27 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>> index e3ce56d875..376a1ceee2 100644
>>> --- a/xen/arch/arm/vcpreg.c
>>> +++ b/xen/arch/arm/vcpreg.c
>>> @@ -57,9 +57,12 @@
>>>    #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
>>>    #endif
>>>    +#define type32_t register_t
>>> +#define type64_t uint64_t
>>
>> Please use typedef rather than define for type. Also, please add a comment explaining why type32_t is defined as register_t.
>>
>>> +
>>>    /* The name is passed from the upper macro to workaround macro expansion. */
>>>    #define TVM_REG(sz, func, reg...)                                           \
>>> -static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>> +static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)    \
>>>    {                                                                           \
>>>        struct vcpu *v = current;                                               \
>>>        bool cache_enabled = vcpu_has_cache_enabled(v);                         \
>>> @@ -83,7 +86,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>>      #else /* CONFIG_ARM_64 */
>>>    #define TVM_REG32_COMBINED(lowreg, hireg, xreg)                             \
>>> -static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
>>> +static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, register_t *r,  \
>>>                                    bool read, bool hi)                         \
>>>    {                                                                           \
>>>        struct vcpu *v = current;                                               \
>>> @@ -108,13 +111,13 @@ static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
>>>        return true;                                                            \
>>>    }                                                                           \
>>>                                                                                \
>>> -static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, uint32_t *r,  \
>>> +static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, register_t *r,\
>>>                                      bool read)                                \
>>>    {                                                                           \
>>>        return vreg_emulate_##xreg(regs, r, read, false);                       \
>>>    }                                                                           \
>>>                                                                                \
>>> -static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, uint32_t *r,   \
>>> +static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, register_t *r, \
>>>                                     bool read)                                 \
>>>    {                                                                           \
>>>        return vreg_emulate_##xreg(regs, r, read, true);                        \
>>> @@ -154,13 +157,16 @@ TVM_REG32_COMBINED(MAIR0, MAIR1, MAIR_EL1)
>>>    TVM_REG32_COMBINED(AMAIR0, AMAIR1, AMAIR_EL1)
>>>    TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>>>    +#define VREG_EMULATE_CP32(regs, hsr, fn)  vreg_emulate_cp(regs, hsr, fn)
>>> +#define VREG_EMULATE_CP64(regs, hsr, fn)  vreg_emulate_cp64(regs, hsr, fn)
>>> +
>>>    /* Macro to generate easily case for co-processor emulation. */
>>>    #define GENERATE_CASE(reg, sz)                                      \
>>>        case HSR_CPREG##sz(reg):                                        \
>>>        {                                                               \
>>>            bool res;                                                   \
>>>                                                                        \
>>> -        res = vreg_emulate_cp##sz(regs, hsr, vreg_emulate_##reg);   \
>>> +        res = VREG_EMULATE_CP##sz(regs, hsr, vreg_emulate_##reg);   \
>>>            ASSERT(res);                                                \
>>>            break;                                                      \
>>>        }
>>> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
>>> index 167fc6127a..17b5649a05 100644
>>> --- a/xen/arch/arm/vtimer.c
>>> +++ b/xen/arch/arm/vtimer.c
>>> @@ -162,7 +162,7 @@ void virt_timer_restore(struct vcpu *v)
>>>        WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
>>>    }
>>>    -static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
>>> +static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t *r, bool read)
>>>    {
>>>        struct vcpu *v = current;
>>>        s_time_t expires;
>>> @@ -176,7 +176,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
>>>        }
>>>        else
>>>        {
>>> -        uint32_t ctl = *r & ~CNTx_CTL_PENDING;
>>> +        register_t ctl = *r & ~CNTx_CTL_PENDING;
>> You will still end up to mask the top 32-bit because CTx_CTL_PENDING is an unsigned 32-bit. I think we should not touch them top 32-bit at all so CNTx_CTL_PENDING (and probably CNT_x_CTL_ENABLE) should be defined as 1UL << X.
>>
> Ok I will not modify the timer functions apart from changing the argument's type.
> I will modify CNTx_CTL_PENDING and CNT_x_CTL_ENABLE to be ul.
>>>            if ( ctl & CNTx_CTL_ENABLE )
>>>                ctl |= v->arch.phys_timer.ctl & CNTx_CTL_PENDING;
>>>            v->arch.phys_timer.ctl = ctl;
>>> @@ -197,7 +197,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
>>>        return true;
>>>    }
>>>    -static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
>>> +static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
>>>                                 bool read)
>>>    {
>>>        struct vcpu *v = current;
>>> @@ -211,11 +211,11 @@ static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
>>>          if ( read )
>>>        {
>>> -        *r = (uint32_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffull);
>>> +        *r = (register_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffull);
>>
>> This is computing the TimerVal is held in the first 32-bit of the registers. So I think this should stick to (uint32_t) here.
>>
>>>        }
>>>        else
>>>        {
>>> -        v->arch.phys_timer.cval = cntpct + (uint64_t)(int32_t)*r;
>>> +        v->arch.phys_timer.cval = cntpct + (uint64_t)(register_t)*r;
>>
>> This is not quite the same as before. We were using the first 32-bit as a signed value. Now, you are using the full register as a unsigned value.
>>
>>>            if ( v->arch.phys_timer.ctl & CNTx_CTL_ENABLE )
>>>            {
>>>                v->arch.phys_timer.ctl &= ~CNTx_CTL_PENDING;
>>> @@ -274,10 +274,10 @@ static bool vtimer_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr)
>>>        switch ( hsr.bits & HSR_CP32_REGS_MASK )
>>>        {
>>>        case HSR_CPREG32(CNTP_CTL):
>>> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_ctl);
>>> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_ctl);
>>>          case HSR_CPREG32(CNTP_TVAL):
>>> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_tval);
>>> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_tval);
>>>          default:
>>>            return false;
>>> @@ -316,9 +316,9 @@ static bool vtimer_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
>>>        switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
>>>        {
>>>        case HSR_SYSREG_CNTP_CTL_EL0:
>>> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
>>> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
>>>        case HSR_SYSREG_CNTP_TVAL_EL0:
>>> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
>>> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
>>>        case HSR_SYSREG_CNTP_CVAL_EL0:
>>>            return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
>>>    diff --git a/xen/include/asm-arm/vreg.h b/xen/include/asm-arm/vreg.h
>>> index 1253753833..cef55aabea 100644
>>> --- a/xen/include/asm-arm/vreg.h
>>> +++ b/xen/include/asm-arm/vreg.h
>>> @@ -4,13 +4,13 @@
>>>    #ifndef __ASM_ARM_VREG__
>>>    #define __ASM_ARM_VREG__
>>>    -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs, uint32_t *r,
>>> +typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>>>                                       bool read);
>>>    typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>>>                                       bool read);
>>>    -static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
>>> -                                     vreg_reg32_fn_t fn)
>>> +static inline bool vreg_emulate_cp(struct cpu_user_regs *regs, union hsr hsr,
>>> +                                     vreg_reg_fn_t fn)
>>
>> The new name will add some confusion because now we have vreg_emulate_cp() (for 32-bit access) and vreg_emulate_c64() (for 64-bit access).
>>
>> So I would rather keep the current naming.
>>
> We can do like that:
> -on arm32 there will be vreg_emulate_cp32 with register_t and vreg_emulate_cp64.
> -on arm64 there will be only vreg_emulate_sysreg with register_t.
> Does it sound ok or do you want to drop this change completely?

That's fine with me. It is a good move to drop vreg_emulate_sysreg32() 
completely.

Cheers,

-- 
Julien Grall

