Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE93D924D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 17:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161712.296783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8llF-0000sC-LP; Wed, 28 Jul 2021 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161712.296783; Wed, 28 Jul 2021 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8llF-0000qE-IN; Wed, 28 Jul 2021 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 161712;
 Wed, 28 Jul 2021 15:46:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m8llD-0000q6-Uz
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 15:46:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8llC-0004Op-SW; Wed, 28 Jul 2021 15:46:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8llC-0002yx-IX; Wed, 28 Jul 2021 15:46:18 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=fDmED7vjMgB3ACOoP7BxckhnA5zeMREBQ1r4LweSBTM=; b=IsMAiECkItjcO/IrdDJG5Scix7
	2os1us0g2LsiJFCTlWU7q6SGu6tObonJKtW47iyXcyMcsifUiff1qvz6Y8f3dlAySFX4EkXKJGiS1
	WtiWhonZRi/JepWl/YGpkq/CwCWd+xgNIPGzIMqrXOCEYXO6MKAIv6FcoUzET1rZMBMk=;
Subject: Re: [RFC PATCH] xen/arm: Replace vreg_emulate_{sysreg/cp}32 with
 vreg_emulate_{sysreg/cp}
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210727095010.11103-1-michal.orzel@arm.com>
 <57e5bc75-052a-1530-e983-4e52d1527861@xen.org>
Message-ID: <440093c1-ee6e-762b-8d8d-6cbb1e270746@xen.org>
Date: Wed, 28 Jul 2021 16:46:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <57e5bc75-052a-1530-e983-4e52d1527861@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/07/2021 15:59, Julien Grall wrote:
> Hi Michal,
> 
> On 27/07/2021 10:50, Michal Orzel wrote:
>> According to ARMv8A architecture, AArch64 registers
>> are 64bit wide even though in many cases the upper
>> 32bit is reserved. Therefore there is no need for
>> function vreg_emulate_sysreg32 on arm64.
>>
>> Ideally on arm64 there should be only one function
>> vreg_emulate_sysreg(using register_t) or
>> vreg_emulate_sysreg64(using uint64_t) but in the Xen code
>> there is a lot of functions passed both to the
>> vreg_emulate_cp* and vreg_emulate_sysreg*.
>> This would require to duplicate them which is not
>> a good solution.
> 
> I think you can drop vreg_emulate_sysreg64() completely. On arm64, 
> register_t is an alias to uint64_t so you could interchangeably use the 
> type in the callback.
> 
> For arm32, we would still need to keep vreg_emulate_cp64.
> 
>>
>> The easiest/minimal solution to fix this issue is
>> to replace vreg_emulate_{sysreg/cp}32 with
>> vreg_emulate_{sysreg/cp}. The modifed functions
>> are now taking function pointer:
>> -typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>>                                register_t *r, bool read);
>> instead of:
>> -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs,
>>                                  uint32_t *r, bool read);
>>
>> This change allows to properly use 64bit registers on arm64
>> and in case of 32bit guest the cast is done by the hardware
>> due to the 32bit registers being the lower part of 64bit ones.
> 
> The HW doesn't do any cast. From the Arm Arm (D1.19.1 in ARM DDI 0487F.c):
> 
> "Any modifications made to AArch32 System registers affects only those 
> parts of those AArch64 registers that are
> mapped to the AArch32 System registers. Bits[63:32] of AArch64 
> registers, where they are not mapped to AArch32
> registers, are unchanged by AArch32 state execution."

Actually, I quoted the paragraph for the system registers. Sorry :/

I should have quoted the section "Mapping of the general-purpose 
registers between the Execution states". But this is not really a cast, 
it would be a zero extend. Although, it is not 100% whether this is what 
happen because just above the section it is written:

"In AArch32 state, the upper 32 bits of AArch64 registers are 
inaccessible and are ignored.
"

> 
> The registers can be set by:
>    * The toolstack (via XEN_DOMCTL_set_vcpucontext). We rely on the top 
> bits to always be 0. Ideally, we should 0 it in vcpu_regs_user_to_hyp() 
> just for safety.
>    * The PSCI CPU ON call: They should always be 0.
> 
> For the rest of Xen, we expect that the top 32-bit will either be 
> untouched or never be changed.
> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> The reason for this change is to clean up the mess related to types.
>> This patch achieves that but it does not reduce the code size.
>> I'm not sure whether we want such change hence it is pushed as RFC.
>> ---
>>   xen/arch/arm/vcpreg.c      | 16 +++++++++++-----
>>   xen/arch/arm/vtimer.c      | 18 +++++++++---------
>>   xen/include/asm-arm/vreg.h | 14 +++++++-------
>>   3 files changed, 27 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index e3ce56d875..376a1ceee2 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -57,9 +57,12 @@
>>   #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, 
>> sysreg)
>>   #endif
>> +#define type32_t register_t
>> +#define type64_t uint64_t
> 
> Please use typedef rather than define for type. Also, please add a 
> comment explaining why type32_t is defined as register_t.
> 
>> +
>>   /* The name is passed from the upper macro to workaround macro 
>> expansion. */
>>   #define TVM_REG(sz, func, 
>> reg...)                                           \
>> -static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool 
>> read)    \
>> +static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool 
>> read)    \
>>   
>> {                                                                           
>> \
>>       struct vcpu *v = 
>> current;                                               \
>>       bool cache_enabled = 
>> vcpu_has_cache_enabled(v);                         \
>> @@ -83,7 +86,7 @@ static bool func(struct cpu_user_regs *regs, 
>> uint##sz##_t *r, bool read)    \
>>   #else /* CONFIG_ARM_64 */
>>   #define TVM_REG32_COMBINED(lowreg, hireg, 
>> xreg)                             \
>> -static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t 
>> *r,    \
>> +static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, 
>> register_t *r,  \
>>                                   bool read, bool 
>> hi)                         \
>>   
>> {                                                                           
>> \
>>       struct vcpu *v = 
>> current;                                               \
>> @@ -108,13 +111,13 @@ static bool vreg_emulate_##xreg(struct 
>> cpu_user_regs *regs, uint32_t *r,    \
>>       return 
>> true;                                                            \
>>   
>> }                                                                           
>> \
>>                                                                               
>> \
>> -static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, 
>> uint32_t *r,  \
>> +static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, 
>> register_t *r,\
>>                                     bool 
>> read)                                \
>>   
>> {                                                                           
>> \
>>       return vreg_emulate_##xreg(regs, r, read, 
>> false);                       \
>>   
>> }                                                                           
>> \
>>                                                                               
>> \
>> -static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, uint32_t 
>> *r,   \
>> +static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, 
>> register_t *r, \
>>                                    bool 
>> read)                                 \
>>   
>> {                                                                           
>> \
>>       return vreg_emulate_##xreg(regs, r, read, 
>> true);                        \
>> @@ -154,13 +157,16 @@ TVM_REG32_COMBINED(MAIR0, MAIR1, MAIR_EL1)
>>   TVM_REG32_COMBINED(AMAIR0, AMAIR1, AMAIR_EL1)
>>   TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>> +#define VREG_EMULATE_CP32(regs, hsr, fn)  vreg_emulate_cp(regs, hsr, fn)
>> +#define VREG_EMULATE_CP64(regs, hsr, fn)  vreg_emulate_cp64(regs, 
>> hsr, fn)
>> +
>>   /* Macro to generate easily case for co-processor emulation. */
>>   #define GENERATE_CASE(reg, sz)                                      \
>>       case HSR_CPREG##sz(reg):                                        \
>>       {                                                               \
>>           bool res;                                                   \
>>                                                                       \
>> -        res = vreg_emulate_cp##sz(regs, hsr, vreg_emulate_##reg);   \
>> +        res = VREG_EMULATE_CP##sz(regs, hsr, vreg_emulate_##reg);   \
>>           ASSERT(res);                                                \
>>           break;                                                      \
>>       }
>> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
>> index 167fc6127a..17b5649a05 100644
>> --- a/xen/arch/arm/vtimer.c
>> +++ b/xen/arch/arm/vtimer.c
>> @@ -162,7 +162,7 @@ void virt_timer_restore(struct vcpu *v)
>>       WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
>>   }
>> -static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, 
>> bool read)
>> +static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t 
>> *r, bool read)
>>   {
>>       struct vcpu *v = current;
>>       s_time_t expires;
>> @@ -176,7 +176,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs 
>> *regs, uint32_t *r, bool read)
>>       }
>>       else
>>       {
>> -        uint32_t ctl = *r & ~CNTx_CTL_PENDING;
>> +        register_t ctl = *r & ~CNTx_CTL_PENDING;
> You will still end up to mask the top 32-bit because CTx_CTL_PENDING is 
> an unsigned 32-bit. I think we should not touch them top 32-bit at all 
> so CNTx_CTL_PENDING (and probably CNT_x_CTL_ENABLE) should be defined as 
> 1UL << X.
> 
>>           if ( ctl & CNTx_CTL_ENABLE )
>>               ctl |= v->arch.phys_timer.ctl & CNTx_CTL_PENDING;
>>           v->arch.phys_timer.ctl = ctl;
>> @@ -197,7 +197,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs 
>> *regs, uint32_t *r, bool read)
>>       return true;
>>   }
>> -static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
>> +static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
>>                                bool read)
>>   {
>>       struct vcpu *v = current;
>> @@ -211,11 +211,11 @@ static bool vtimer_cntp_tval(struct 
>> cpu_user_regs *regs, uint32_t *r,
>>       if ( read )
>>       {
>> -        *r = (uint32_t)((v->arch.phys_timer.cval - cntpct) & 
>> 0xffffffffull);
>> +        *r = (register_t)((v->arch.phys_timer.cval - cntpct) & 
>> 0xffffffffull);
> 
> This is computing the TimerVal is held in the first 32-bit of the 
> registers. So I think this should stick to (uint32_t) here.
> 
>>       }
>>       else
>>       {
>> -        v->arch.phys_timer.cval = cntpct + (uint64_t)(int32_t)*r;
>> +        v->arch.phys_timer.cval = cntpct + (uint64_t)(register_t)*r;
> 
> This is not quite the same as before. We were using the first 32-bit as 
> a signed value. Now, you are using the full register as a unsigned value.
> 
>>           if ( v->arch.phys_timer.ctl & CNTx_CTL_ENABLE )
>>           {
>>               v->arch.phys_timer.ctl &= ~CNTx_CTL_PENDING;
>> @@ -274,10 +274,10 @@ static bool vtimer_emulate_cp32(struct 
>> cpu_user_regs *regs, union hsr hsr)
>>       switch ( hsr.bits & HSR_CP32_REGS_MASK )
>>       {
>>       case HSR_CPREG32(CNTP_CTL):
>> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_ctl);
>> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_ctl);
>>       case HSR_CPREG32(CNTP_TVAL):
>> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_tval);
>> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_tval);
>>       default:
>>           return false;
>> @@ -316,9 +316,9 @@ static bool vtimer_emulate_sysreg(struct 
>> cpu_user_regs *regs, union hsr hsr)
>>       switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
>>       {
>>       case HSR_SYSREG_CNTP_CTL_EL0:
>> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
>> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
>>       case HSR_SYSREG_CNTP_TVAL_EL0:
>> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
>> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
>>       case HSR_SYSREG_CNTP_CVAL_EL0:
>>           return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
>> diff --git a/xen/include/asm-arm/vreg.h b/xen/include/asm-arm/vreg.h
>> index 1253753833..cef55aabea 100644
>> --- a/xen/include/asm-arm/vreg.h
>> +++ b/xen/include/asm-arm/vreg.h
>> @@ -4,13 +4,13 @@
>>   #ifndef __ASM_ARM_VREG__
>>   #define __ASM_ARM_VREG__
>> -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs, uint32_t *r,
>> +typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>>                                      bool read);
>>   typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t 
>> *r,
>>                                      bool read);
>> -static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, 
>> union hsr hsr,
>> -                                     vreg_reg32_fn_t fn)
>> +static inline bool vreg_emulate_cp(struct cpu_user_regs *regs, union 
>> hsr hsr,
>> +                                     vreg_reg_fn_t fn)
> 
> The new name will add some confusion because now we have 
> vreg_emulate_cp() (for 32-bit access) and vreg_emulate_c64() (for 64-bit 
> access).
> 
> So I would rather keep the current naming.
> 
>>   {
>>       struct hsr_cp32 cp32 = hsr.cp32;
>>       /*
>> @@ -18,7 +18,7 @@ static inline bool vreg_emulate_cp32(struct 
>> cpu_user_regs *regs, union hsr hsr,
>>        * implementation error in the emulation (such as not correctly
>>        * setting r).
>>        */
>> -    uint32_t r = 0;
>> +    register_t r = 0;
>>       bool ret;
>>       if ( !cp32.read )
>> @@ -64,11 +64,11 @@ static inline bool vreg_emulate_cp64(struct 
>> cpu_user_regs *regs, union hsr hsr,
>>   }
>>   #ifdef CONFIG_ARM_64
>> -static inline bool vreg_emulate_sysreg32(struct cpu_user_regs *regs, 
>> union hsr hsr,
>> -                                         vreg_reg32_fn_t fn)
>> +static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, 
>> union hsr hsr,
>> +                                         vreg_reg_fn_t fn)
>>   {
>>       struct hsr_sysreg sysreg = hsr.sysreg;
>> -    uint32_t r = 0;
>> +    register_t r = 0;
>>       bool ret;
>>       if ( !sysreg.read )
>>
> 
> Cheers,
> 

-- 
Julien Grall

