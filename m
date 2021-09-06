Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD740189B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 11:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179517.325813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAbO-0002U8-M8; Mon, 06 Sep 2021 09:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179517.325813; Mon, 06 Sep 2021 09:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAbO-0002RJ-JD; Mon, 06 Sep 2021 09:07:42 +0000
Received: by outflank-mailman (input) for mailman id 179517;
 Mon, 06 Sep 2021 09:07:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNAbM-0002RD-Ur
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 09:07:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNAbL-0008Ud-RK; Mon, 06 Sep 2021 09:07:39 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNAbL-0003Ez-Ky; Mon, 06 Sep 2021 09:07:39 +0000
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
	bh=qDjbz5x+lhQVqDghklbiyW58OCiSPI+82nSf0BsV7VA=; b=OakPuhnoFXchkbRDXMKpxDoRFi
	aX+BL9NnxJYXfPgvdL5pO8Y5s37h/bctRncqVtK2A0AtwEW3cxXXHHmk3iX/NLB5x5E3vrpRpmkSt
	fqNgdSR0U//Ot8zjxMFXB01pcYTDKjGEpn20/o+1RI6QZvIxFFKxc8YVM5pFxuFFcddM=;
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210729104258.6320-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <24ba08cc-acd4-c64a-1e90-dc4c8efbfe48@xen.org>
Date: Mon, 6 Sep 2021 10:07:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210729104258.6320-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 29/07/2021 11:42, Michal Orzel wrote:
> According to ARMv8A architecture, AArch64 registers
> are 64bit wide even though in many cases the upper
> 32bit is reserved. Therefore there is no need for
> function vreg_emulate_sysreg32 on arm64. This means
> that we can have just one function vreg_emulate_sysreg
> using new function pointer:
> typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>                                register_t *r, bool read);
> 
> Modify vreg_emulate_cp32 to use the new function pointer
> as well.
> 
> This change allows to properly use 64bit registers in AArch64
> state and in case of AArch32 the upper 32 bits of AArch64
> registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/arm64/vsysreg.c    |  2 +-
>   xen/arch/arm/vcpreg.c           | 16 ++++++++++----
>   xen/arch/arm/vgic-v3.c          |  2 +-
>   xen/arch/arm/vtimer.c           | 11 +++++-----
>   xen/include/asm-arm/processor.h |  4 ++--
>   xen/include/asm-arm/vreg.h      | 38 ++++++---------------------------
>   6 files changed, 29 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index caf17174b8..73fa2ca9ae 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -64,7 +64,7 @@ TVM_REG(CONTEXTIDR_EL1)
>       {                                                                   \
>           bool res;                                                       \
>                                                                           \
> -        res = vreg_emulate_sysreg64(regs, hsr, vreg_emulate_##reg);     \
> +        res = vreg_emulate_sysreg(regs, hsr, vreg_emulate_##reg);       \
>           ASSERT(res);                                                    \
>           break;                                                          \
>       }
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index e3ce56d875..be1ec08159 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -57,9 +57,17 @@
>   #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
>   #endif
>   
> +/*
> + * type32_t is defined as register_t due to the vreg_emulate_cp32 and
> + * vreg_emulate_sysreg taking function pointer with register_t type used for
> + * passing register's value.
> + */
> +typedef register_t type32_t;
> +typedef uint64_t type64_t ;

NIT: spurious space before ;.

> +
>   /* The name is passed from the upper macro to workaround macro expansion. */
>   #define TVM_REG(sz, func, reg...)                                           \
> -static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
> +static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)    \
>   {                                                                           \
>       struct vcpu *v = current;                                               \
>       bool cache_enabled = vcpu_has_cache_enabled(v);                         \
> @@ -83,7 +91,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>   
>   #else /* CONFIG_ARM_64 */
>   #define TVM_REG32_COMBINED(lowreg, hireg, xreg)                             \
> -static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
> +static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, register_t *r,  \
>                                   bool read, bool hi)                         \
>   {                                                                           \
>       struct vcpu *v = current;                                               \
> @@ -108,13 +116,13 @@ static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
>       return true;                                                            \
>   }                                                                           \
>                                                                               \
> -static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, uint32_t *r,  \
> +static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, register_t *r,\
>                                     bool read)                                \
>   {                                                                           \
>       return vreg_emulate_##xreg(regs, r, read, false);                       \
>   }                                                                           \
>                                                                               \
> -static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, uint32_t *r,   \
> +static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, register_t *r, \
>                                    bool read)                                 \
>   {                                                                           \
>       return vreg_emulate_##xreg(regs, r, read, true);                        \
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 613f37abab..cb5a70c42e 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1531,7 +1531,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
>       switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
>       {
>       case HSR_SYSREG_ICC_SGI1R_EL1:
> -        return vreg_emulate_sysreg64(regs, hsr, vgic_v3_emulate_sgi1r);
> +        return vreg_emulate_sysreg(regs, hsr, vgic_v3_emulate_sgi1r);
>   
>       default:
>           return false;
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 167fc6127a..0196951af4 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -162,7 +162,8 @@ void virt_timer_restore(struct vcpu *v)
>       WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
>   }
>   
> -static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
> +static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t *r,
> +                            bool read)
>   {
>       struct vcpu *v = current;
>       s_time_t expires;
> @@ -197,7 +198,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
>       return true;
>   }
>   
> -static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
> +static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
>                                bool read)
>   {
>       struct vcpu *v = current;
> @@ -316,11 +317,11 @@ static bool vtimer_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
>       switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
>       {
>       case HSR_SYSREG_CNTP_CTL_EL0:
> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
>       case HSR_SYSREG_CNTP_TVAL_EL0:
> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
>       case HSR_SYSREG_CNTP_CVAL_EL0:
> -        return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_cval);
>   
>       default:
>           return false;
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> index 2577e9a244..2058b69447 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -484,9 +484,9 @@ extern register_t __cpu_logical_map[];
>   #define CNTKCTL_EL1_EL0PTEN  (1u<<9) /* Expose phys timer registers to EL0 */
>   
>   /* Timer control registers */
> -#define CNTx_CTL_ENABLE   (1u<<0)  /* Enable timer */
> +#define CNTx_CTL_ENABLE   (1ul<<0)  /* Enable timer */
>   #define CNTx_CTL_MASK     (1ul<<1)  /* Mask IRQ */
> -#define CNTx_CTL_PENDING  (1u<<2)  /* IRQ pending */
> +#define CNTx_CTL_PENDING  (1ul<<2)  /* IRQ pending */
I would suggest to mention in the commit message why this is necessary. 
AFAICT, it is not strictly necessary because you left ctl defined as a 
uin32_t. So I am guessing you only keep it for hardening purpose?

If so how about adding:

"Take the opportunity to switch CNTx_CTL_* to use UL to avoid any 
surprise with the negation of any bits (as used in vtimer_cntp_ctl)".

The rest of the patch looks fine. So I would be happy to deal with the 
fixes on commit:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

