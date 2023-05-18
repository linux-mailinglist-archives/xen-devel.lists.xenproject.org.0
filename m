Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96647087C5
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 20:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536499.834881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziLs-0000VS-1Y; Thu, 18 May 2023 18:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536499.834881; Thu, 18 May 2023 18:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziLr-0000TK-V0; Thu, 18 May 2023 18:27:47 +0000
Received: by outflank-mailman (input) for mailman id 536499;
 Thu, 18 May 2023 18:27:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pziLr-0000TC-5v
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 18:27:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziLq-0001Jf-Fx; Thu, 18 May 2023 18:27:46 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.26.27]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziLq-0007lt-6S; Thu, 18 May 2023 18:27:46 +0000
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
	bh=rJ95ros767tiVD/9rk/xr/iTTMFUGfe1uzd3kHsbOa0=; b=jEMydz+r2otD+Exd5ghSqdh3JN
	fJ73yaMaok/qN34s8RWZu0icII3tiDwlfEcfIaZly46UTc/0K1ZHj8WDpNMzaD9m+4vK9iSs392nM
	ZbjLocuvykf0atWwknlLzu2W1izvvgXhsVdku317LPekG1ySRgyzAeJNBZTiOhAr/Fng=;
Message-ID: <d735e539-a8ad-0c14-2eda-22fbad19191f@xen.org>
Date: Thu, 18 May 2023 19:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230424060248.1488859-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 24/04/2023 07:02, Luca Fancellu wrote:
> Save/restore context switch for SVE, allocate memory to contain
> the Z0-31 registers whose length is maximum 2048 bits each and
> FFR who can be maximum 256 bits, the allocated memory depends on
> how many bits is the vector length for the domain and how many bits
> are supported by the platform.
> 
> Save P0-15 whose length is maximum 256 bits each, in this case the
> memory used is from the fpregs field in struct vfp_state,
> because V0-31 are part of Z0-31 and this space would have been
> unused for SVE domain otherwise.
> 
> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
> creation given the requested vector length and restore it on
> context switch, save/restore ZCR_EL1 value as well.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v5:
>   - use XFREE instead of xfree, keep the headers (Julien)
>   - Avoid math computation for every save/restore, store the computation
>     in struct vfp_state once (Bertrand)
>   - protect access to v->domain->arch.sve_vl inside arch_vcpu_create now
>     that sve_vl is available only on arm64
> Changes from v4:
>   - No changes
> Changes from v3:
>   - don't use fixed len types when not needed (Jan)
>   - now VL is an encoded value, decode it before using.
> Changes from v2:
>   - No changes
> Changes from v1:
>   - No changes
> Changes from RFC:
>   - Moved zcr_el2 field introduction in this patch, restore its
>     content inside sve_restore_state function. (Julien)
> ---
>   xen/arch/arm/arm64/sve-asm.S             | 141 +++++++++++++++++++++++
>   xen/arch/arm/arm64/sve.c                 |  63 ++++++++++
>   xen/arch/arm/arm64/vfp.c                 |  79 +++++++------
>   xen/arch/arm/domain.c                    |   9 ++
>   xen/arch/arm/include/asm/arm64/sve.h     |  13 +++
>   xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
>   xen/arch/arm/include/asm/arm64/vfp.h     |  12 ++
>   xen/arch/arm/include/asm/domain.h        |   2 +
>   8 files changed, 288 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
> index 4d1549344733..8c37d7bc95d5 100644
> --- a/xen/arch/arm/arm64/sve-asm.S
> +++ b/xen/arch/arm/arm64/sve-asm.S

Are all the new helpers added in this patch taken from Linux? If so, it 
would be good to clarify this (again) in the commit message as it helps 
for the review (I can diff with Linux rather than properly reviewing them).

> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 86a5e617bfca..064832b450ff 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2022 ARM Ltd.
>    */
>   
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
>   #include <xen/types.h>
>   #include <asm/arm64/sve.h>
>   #include <asm/arm64/sysregs.h>
> @@ -13,6 +15,24 @@
>   #include <asm/system.h>
>   
>   extern unsigned int sve_get_hw_vl(void);
> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
> +                         int restore_ffr);

 From the use, it is not entirely what restore_ffr/save_ffr is meant to 
be. Are they bool? If so, maybe use bool? At mimimum, they probably want 
to be unsigned int.

> +
> +static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
> +{
> +    /*
> +     * Z0-31 registers size in bytes is computed from VL that is in bits, so VL
> +     * in bytes is VL/8.
> +     */
> +    return (vl / 8U) * 32U;
> +}
> +
> +static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
> +{
> +    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
> +    return (vl / 64U);
> +}
>   
>   register_t compute_max_zcr(void)
>   {
> @@ -60,3 +80,46 @@ unsigned int get_sys_vl_len(void)
>       return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>               SVE_VL_MULTIPLE_VAL;
>   }
> +
> +int sve_context_init(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
> +    uint64_t *ctx = _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
> +                             sve_ffrreg_ctx_size(sve_vl_bits),
> +                             L1_CACHE_BYTES);
> +
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    /* Point to the end of Z0-Z31 memory, just before FFR memory */

NIT: I would add that the logic should be kept in sync with 
sve_context_free(). Same...

> +    v->arch.vfp.sve_zreg_ctx_end = ctx +
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
> +
> +    return 0;
> +}
> +
> +void sve_context_free(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
> +
> +    /* Point back to the beginning of Z0-Z31 + FFR memory */

... here (but with sve_context_init()). So it is clearer that if the 
logic change in one place then it needs to be changed in the other.

> +    v->arch.vfp.sve_zreg_ctx_end -=
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));

 From my understanding, sve_context_free() could be called with 
sve_zreg_ctxt_end equal to NULL (i.e. because sve_context_init() 
failed). So wouldn't we end up to substract the value to NULL and 
therefore...

> +
> +    XFREE(v->arch.vfp.sve_zreg_ctx_end);

... free a random pointer?

> +}
> +
> +void sve_save_state(struct vcpu *v)
> +{
> +    v->arch.zcr_el1 = READ_SYSREG(ZCR_EL1);
> +
> +    sve_save_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
> +}
> +
> +void sve_restore_state(struct vcpu *v)
> +{
> +    WRITE_SYSREG(v->arch.zcr_el1, ZCR_EL1);
> +    WRITE_SYSREG(v->arch.zcr_el2, ZCR_EL2);

AFAIU, this value will be used for the restore below. So don't we need 
an isb()?

> +
> +    sve_load_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
> +}
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index 47885e76baae..2d0d7c2e6ddb 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -2,29 +2,35 @@
>   #include <asm/processor.h>
>   #include <asm/cpufeature.h>
>   #include <asm/vfp.h>
> +#include <asm/arm64/sve.h>
>   
>   void vfp_save_state(struct vcpu *v)
>   {
>       if ( !cpu_has_fp )
>           return;
>   
> -    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> -                 "stp q2, q3, [%1, #16 * 2]\n\t"
> -                 "stp q4, q5, [%1, #16 * 4]\n\t"
> -                 "stp q6, q7, [%1, #16 * 6]\n\t"
> -                 "stp q8, q9, [%1, #16 * 8]\n\t"
> -                 "stp q10, q11, [%1, #16 * 10]\n\t"
> -                 "stp q12, q13, [%1, #16 * 12]\n\t"
> -                 "stp q14, q15, [%1, #16 * 14]\n\t"
> -                 "stp q16, q17, [%1, #16 * 16]\n\t"
> -                 "stp q18, q19, [%1, #16 * 18]\n\t"
> -                 "stp q20, q21, [%1, #16 * 20]\n\t"
> -                 "stp q22, q23, [%1, #16 * 22]\n\t"
> -                 "stp q24, q25, [%1, #16 * 24]\n\t"
> -                 "stp q26, q27, [%1, #16 * 26]\n\t"
> -                 "stp q28, q29, [%1, #16 * 28]\n\t"
> -                 "stp q30, q31, [%1, #16 * 30]\n\t"
> -                 : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
> +    if ( is_sve_domain(v->domain) )
> +        sve_save_state(v);
> +    else
> +    {
> +        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +                     "stp q2, q3, [%1, #16 * 2]\n\t"
> +                     "stp q4, q5, [%1, #16 * 4]\n\t"
> +                     "stp q6, q7, [%1, #16 * 6]\n\t"
> +                     "stp q8, q9, [%1, #16 * 8]\n\t"
> +                     "stp q10, q11, [%1, #16 * 10]\n\t"
> +                     "stp q12, q13, [%1, #16 * 12]\n\t"
> +                     "stp q14, q15, [%1, #16 * 14]\n\t"
> +                     "stp q16, q17, [%1, #16 * 16]\n\t"
> +                     "stp q18, q19, [%1, #16 * 18]\n\t"
> +                     "stp q20, q21, [%1, #16 * 20]\n\t"
> +                     "stp q22, q23, [%1, #16 * 22]\n\t"
> +                     "stp q24, q25, [%1, #16 * 24]\n\t"
> +                     "stp q26, q27, [%1, #16 * 26]\n\t"
> +                     "stp q28, q29, [%1, #16 * 28]\n\t"
> +                     "stp q30, q31, [%1, #16 * 30]\n\t"
> +                     : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
> +    }
>   
>       v->arch.vfp.fpsr = READ_SYSREG(FPSR);
>       v->arch.vfp.fpcr = READ_SYSREG(FPCR);
> @@ -37,23 +43,28 @@ void vfp_restore_state(struct vcpu *v)
>       if ( !cpu_has_fp )
>           return;
>   
> -    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> -                 "ldp q2, q3, [%1, #16 * 2]\n\t"
> -                 "ldp q4, q5, [%1, #16 * 4]\n\t"
> -                 "ldp q6, q7, [%1, #16 * 6]\n\t"
> -                 "ldp q8, q9, [%1, #16 * 8]\n\t"
> -                 "ldp q10, q11, [%1, #16 * 10]\n\t"
> -                 "ldp q12, q13, [%1, #16 * 12]\n\t"
> -                 "ldp q14, q15, [%1, #16 * 14]\n\t"
> -                 "ldp q16, q17, [%1, #16 * 16]\n\t"
> -                 "ldp q18, q19, [%1, #16 * 18]\n\t"
> -                 "ldp q20, q21, [%1, #16 * 20]\n\t"
> -                 "ldp q22, q23, [%1, #16 * 22]\n\t"
> -                 "ldp q24, q25, [%1, #16 * 24]\n\t"
> -                 "ldp q26, q27, [%1, #16 * 26]\n\t"
> -                 "ldp q28, q29, [%1, #16 * 28]\n\t"
> -                 "ldp q30, q31, [%1, #16 * 30]\n\t"
> -                 : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
> +    if ( is_sve_domain(v->domain) )
> +        sve_restore_state(v);
> +    else
> +    {
> +        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> +                     "ldp q2, q3, [%1, #16 * 2]\n\t"
> +                     "ldp q4, q5, [%1, #16 * 4]\n\t"
> +                     "ldp q6, q7, [%1, #16 * 6]\n\t"
> +                     "ldp q8, q9, [%1, #16 * 8]\n\t"
> +                     "ldp q10, q11, [%1, #16 * 10]\n\t"
> +                     "ldp q12, q13, [%1, #16 * 12]\n\t"
> +                     "ldp q14, q15, [%1, #16 * 14]\n\t"
> +                     "ldp q16, q17, [%1, #16 * 16]\n\t"
> +                     "ldp q18, q19, [%1, #16 * 18]\n\t"
> +                     "ldp q20, q21, [%1, #16 * 20]\n\t"
> +                     "ldp q22, q23, [%1, #16 * 22]\n\t"
> +                     "ldp q24, q25, [%1, #16 * 24]\n\t"
> +                     "ldp q26, q27, [%1, #16 * 26]\n\t"
> +                     "ldp q28, q29, [%1, #16 * 28]\n\t"
> +                     "ldp q30, q31, [%1, #16 * 30]\n\t"
> +                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
> +    }
>   
>       WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
>       WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 143359d0f313..24c722a4a11e 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -552,7 +552,14 @@ int arch_vcpu_create(struct vcpu *v)
>   
>       v->arch.cptr_el2 = get_default_cptr_flags();
>       if ( is_sve_domain(v->domain) )
> +    {
> +        if ( (rc = sve_context_init(v)) != 0 )
> +            goto fail;
>           v->arch.cptr_el2 &= ~HCPTR_CP(8);
> +#ifdef CONFIG_ARM64_SVE

This #ifdef reads a bit odd to me because you are protecting 
v->arch.zcr_el2 but not the rest. This is one of the case where I would 
surround the full if with the #ifdef because it makes clearer that there 
is no way the rest of the code can be reached if !CONFIG_ARM64_SVE.

That said, I would actually prefer if...

> +        v->arch.zcr_el2 = vl_to_zcr(sve_decode_vl(v->domain->arch.sve_vl));

... this line is moved in sve_context_init() because this is related to 
the SVE context.

> +#endif
> +    }
>   
>       v->arch.hcr_el2 = get_default_hcr_flags();
>   
> @@ -582,6 +589,8 @@ fail:
>   
>   void arch_vcpu_destroy(struct vcpu *v)
>   {
> +    if ( is_sve_domain(v->domain) )
> +        sve_context_free(v);
>       vcpu_timer_destroy(v);
>       vcpu_vgic_free(v);
>       free_xenheap_pages(v->arch.stack, STACK_ORDER);
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
> index 730c3fb5a9c8..582405dfdf6a 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -26,6 +26,10 @@ static inline unsigned int sve_decode_vl(unsigned int sve_vl)
>   register_t compute_max_zcr(void);
>   register_t vl_to_zcr(unsigned int vl);
>   unsigned int get_sys_vl_len(void);
> +int sve_context_init(struct vcpu *v);
> +void sve_context_free(struct vcpu *v);
> +void sve_save_state(struct vcpu *v);
> +void sve_restore_state(struct vcpu *v);
>   
>   #else /* !CONFIG_ARM64_SVE */
>   
> @@ -46,6 +50,15 @@ static inline unsigned int get_sys_vl_len(void)
>       return 0;
>   }
>   
> +static inline int sve_context_init(struct vcpu *v)
> +{
> +    return 0;
> +}
> +
> +static inline void sve_context_free(struct vcpu *v) {}
> +static inline void sve_save_state(struct vcpu *v) {}
> +static inline void sve_restore_state(struct vcpu *v) {}
> +
>   #endif /* CONFIG_ARM64_SVE */
>   
>   #endif /* _ARM_ARM64_SVE_H */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 4cabb9eb4d5e..3fdeb9d8cdef 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -88,6 +88,9 @@
>   #ifndef ID_AA64ISAR2_EL1
>   #define ID_AA64ISAR2_EL1            S3_0_C0_C6_2
>   #endif
> +#ifndef ZCR_EL1
> +#define ZCR_EL1                     S3_0_C1_C2_0
> +#endif
>   
>   /* ID registers (imported from arm64/include/asm/sysreg.h in Linux) */
>   
> diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/asm/arm64/vfp.h
> index e6e8c363bc16..4aa371e85d26 100644
> --- a/xen/arch/arm/include/asm/arm64/vfp.h
> +++ b/xen/arch/arm/include/asm/arm64/vfp.h
> @@ -6,7 +6,19 @@
>   
>   struct vfp_state
>   {
> +    /*
> +     * When SVE is enabled for the guest, fpregs memory will be used to
> +     * save/restore P0-P15 registers, otherwise it will be used for the V0-V31
> +     * registers.
> +     */
>       uint64_t fpregs[64] __vfp_aligned;
> +    /*
> +     * When SVE is enabled for the guest, sve_zreg_ctx_end points to memory
> +     * where Z0-Z31 registers and FFR can be saved/restored, it points at the
> +     * end of the Z0-Z31 space and at the beginning of the FFR space, it's done
> +     * like that to ease the save/restore assembly operations.
> +     */
> +    uint64_t *sve_zreg_ctx_end;
>       register_t fpcr;
>       register_t fpexc32_el2;
>       register_t fpsr;
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 331da0f3bcc3..814652d92568 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -195,6 +195,8 @@ struct arch_vcpu
>       register_t tpidrro_el0;
>   
>       /* HYP configuration */
> +    register_t zcr_el1;
> +    register_t zcr_el2;
>       register_t cptr_el2;
>       register_t hcr_el2;
>       register_t mdcr_el2;

Cheers,

-- 
Julien Grall

