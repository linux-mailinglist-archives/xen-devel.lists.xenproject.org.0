Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18A608B54
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 12:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428169.678050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBVS-0001t0-4E; Sat, 22 Oct 2022 10:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428169.678050; Sat, 22 Oct 2022 10:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBVS-0001qf-0d; Sat, 22 Oct 2022 10:13:30 +0000
Received: by outflank-mailman (input) for mailman id 428169;
 Sat, 22 Oct 2022 10:13:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omBVQ-0001qZ-7H
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 10:13:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBVP-0000Nx-SC; Sat, 22 Oct 2022 10:13:27 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBVP-00069L-Jg; Sat, 22 Oct 2022 10:13:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=upKHsJJcUik/JV2PMLlgWajEp2ZMzINyoWgNkr25668=; b=Yy1lmDCzAQOGtohL8ArhKXRdH2
	6IKx1DU0cd1V8lmc3vIZlFBdPPhHt37BF2KqPdQ9VfAApiDX+PmL/waqyd6v5re6YMYDEkKVrXwTl
	HMuCNVSkydOA3GVW0bVMHV2lgxmd3QleO1LqVW0RFrM0L/j2W8WJbOJ/m99jXcvkiAuM=;
Message-ID: <19fc76cf-cdf2-0321-8336-7c5a7fb09406@xen.org>
Date: Sat, 22 Oct 2022 11:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-4-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 03/12] Arm: GICv3: Enable vreg_reg64_* macros for
 AArch32
In-Reply-To: <20221021153128.44226-4-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Title: The code you are modifying below is not GICv3 specific. I would 
suggest the following title:

xen/arm: vreg: Support vreg_reg64_* helpers on Aarch32

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> In some situations (eg GICR_TYPER), the hypervior may need to emulate
> 64bit registers in aarch32 mode. In such situations, the hypervisor may
> need to read/modify the lower or upper 32 bits of the 64 bit register.
> 
> In aarch32, 64 bit is represented by unsigned long long. Thus, we need
> to change the prototype accordingly.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index f26a70d024..ac6e702c5c 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
>    * Note that the alignment fault will always be taken in the guest
>    * (see B3.12.7 DDI0406.b).
>    */
> -static inline register_t vreg_reg_extract(unsigned long reg,
> +static inline register_t vreg_reg_extract(unsigned long long reg,
>                                             unsigned int offset,
>                                             enum dabt_size size)
>   {
> @@ -105,7 +105,7 @@ static inline register_t vreg_reg_extract(unsigned long reg,
>       return reg;
>   }
>   
> -static inline void vreg_reg_update(unsigned long *reg, register_t val,
> +static inline void vreg_reg_update(unsigned long long *reg, register_t val,
>                                      unsigned int offset,
>                                      enum dabt_size size)
>   {
> @@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned long *reg, register_t val,
>       *reg |= ((unsigned long)val & mask) << shift;
>   }
>   
> -static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
> +static inline void vreg_reg_setbits(unsigned long long *reg, register_t bits,
>                                       unsigned int offset,
>                                       enum dabt_size size)
>   {
> @@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
>       *reg |= ((unsigned long)bits & mask) << shift;
>   }
>   
> -static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
> +static inline void vreg_reg_clearbits(unsigned long long *reg, register_t bits,
>                                         unsigned int offset,
>                                         enum dabt_size size)
>   {
> @@ -149,7 +149,7 @@ static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
>                                            register_t val,                \
>                                            const mmio_info_t *info)       \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> +    unsigned long long tmp = *reg;                                      \
>                                                                           \
>       vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
>                       info->dabt.size);                                   \
> @@ -161,7 +161,7 @@ static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>                                             register_t bits,              \
>                                             const mmio_info_t *info)      \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> +    unsigned long long tmp = *reg;                                      \
>                                                                           \
>       vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
>                        info->dabt.size);                                  \
> @@ -173,7 +173,7 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>                                               register_t bits,            \
>                                               const mmio_info_t *info)    \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> +    unsigned long long tmp = *reg;                                      \
>                                                                           \
>       vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
>                          info->dabt.size);                                \
> @@ -181,15 +181,8 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>       *reg = tmp;                                                         \
>   }
>   
> -/*
> - * 64 bits registers are only supported on platform with 64-bit long.
> - * This is also allow us to optimize the 32 bit case by using
> - * unsigned long rather than uint64_t
> - */

The comment above explain why we never use uint64_t in the helpers 
above. IIRC, the compiler would end up to use 2 registers on AArch32 
even for the vreg_reg32_* helpers. I wanted to avoid that and would like 
like to today. Can you check the code generated?

For other options, I would consider to either:
   1) Fold vreg_reg_* in the macros.
   2) Write a separate vreg_reg64_*

My preference would be 1).

If we are planning to keep the code with "unsigned long long", then I 
think this should be addressed in the commit message.

> -#if BITS_PER_LONG == 64
> -VREG_REG_HELPERS(64, 0x7);
> -#endif
>   VREG_REG_HELPERS(32, 0x3);
> +VREG_REG_HELPERS(64, 0x7);

Regardless what I wrote above, the code movement seems to be unwarranted.
>   
>   #undef VREG_REG_HELPERS
>   

Cheers,

-- 
Julien Grall

