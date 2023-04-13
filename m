Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F89B6E0E2E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520719.808614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwjt-0001EJ-EJ; Thu, 13 Apr 2023 13:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520719.808614; Thu, 13 Apr 2023 13:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwjt-0001Av-BY; Thu, 13 Apr 2023 13:11:49 +0000
Received: by outflank-mailman (input) for mailman id 520719;
 Thu, 13 Apr 2023 13:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmwjr-0001Al-Jp
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwjr-0002wV-9t; Thu, 13 Apr 2023 13:11:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwjr-0006lZ-2G; Thu, 13 Apr 2023 13:11:47 +0000
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
	bh=cB0gGg5I8BEmRP1ArCMDNiP+A+rPj1v4EFP5w+9h0Ag=; b=NOCJdMWRKxQvB1M3A+YCfXQXle
	CdjRmnSswtmSpUGuO6gjgVFOieDVNsyHCp4I9L7QfifT5P85vtia+FvbJjM04vzyyNBhBVemU0LF2
	Jhwwvj5JFrv45+scamQYgya016BvJfvc+SU9itteOZdqXubltOTY9e6n/3K7ImXvVtfk=;
Message-ID: <b1c77bdf-6979-83b6-f5e4-ac5b3e751a3d@xen.org>
Date: Thu, 13 Apr 2023 14:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230412094938.2693890-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/04/2023 10:49, Luca Fancellu wrote:
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
> Remove headers from sve.c that are already included using
> xen/sched.h.
I dislike this because ...

> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 78f7482619da..5485648850a0 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -5,14 +5,29 @@
>    * Copyright (C) 2022 ARM Ltd.
>    */
>   
> -#include <xen/types.h>
> -#include <asm/cpufeature.h>

... it is not entirely obvious that sched.h will import 
asm/cpufeatures.h. This could easily change in the future and would only 
require us to re-add those includes.

> +#include <xen/sched.h>
> +#include <xen/sizes.h> >   #include <asm/arm64/sve.h>
> -#include <asm/arm64/sysregs.h>
> -#include <asm/processor.h>
> -#include <asm/system.h>
>   
>   extern unsigned int sve_get_hw_vl(void);
> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
> +                         int restore_ffr);
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
> @@ -60,3 +75,46 @@ unsigned int get_sys_vl_len(void)
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
> +    v->arch.vfp.sve_context = ctx;
> +
> +    return 0;
> +}
> +
> +void sve_context_free(struct vcpu *v)
> +{
> +    xfree(v->arch.vfp.sve_context);
> +}

Please use XFREE().

Cheers,

-- 
Julien Grall

