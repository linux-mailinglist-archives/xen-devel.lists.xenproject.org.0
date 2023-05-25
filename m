Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB871085B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539451.840331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26yR-0000Kr-Mk; Thu, 25 May 2023 09:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539451.840331; Thu, 25 May 2023 09:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26yR-0000IK-JB; Thu, 25 May 2023 09:09:31 +0000
Received: by outflank-mailman (input) for mailman id 539451;
 Thu, 25 May 2023 09:09:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q26yQ-0000ID-DR
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:09:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q26yP-0000tN-UJ; Thu, 25 May 2023 09:09:29 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q26yP-0005wh-NZ; Thu, 25 May 2023 09:09:29 +0000
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
	bh=9jWPcWgImnzT5Zq/hphNxjVKI52uOxicuBWNvgVmZgg=; b=mRodFwbhjOYXStg4GOqdcSZqxt
	q/NXArX27pXgCEIqUYYAQbZDihM0+Tr16rLEjZrTZbKqLw2MpVQU/0a/2YMZIVKuBeS7ET9CnC+JQ
	emM9PXFcaHBhbJTgYA6Nkd/K1nFLcNzA7E01LgU4pE/0SDOVUIiQOrhA713IZufwD+fI=;
Message-ID: <5b09d5d9-360f-d0ef-06c4-6efe1b660a90@xen.org>
Date: Thu, 25 May 2023 10:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230523074326.3035745-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 23/05/2023 08:43, Luca Fancellu wrote:
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
> +    /*
> +     * Point to the end of Z0-Z31 memory, just before FFR memory, to be kept in
> +     * sync with sve_context_free()

Nit: Missing a full stop.

> +     */
> +    v->arch.vfp.sve_zreg_ctx_end = ctx +
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
> +
> +    v->arch.zcr_el2 = vl_to_zcr(sve_vl_bits);
> +
> +    return 0;
> +}
> +
> +void sve_context_free(struct vcpu *v)
> +{
> +    unsigned int sve_vl_bits;
> +
> +    if ( v->arch.vfp.sve_zreg_ctx_end )
> +        return;
> +
> +    sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
> +
> +    /*
> +    * Point to the end of Z0-Z31 memory, just before FFR memory, to be kept
> +    * in sync with sve_context_init()
> +    */

The spacing looks a bit odd in this comment. Did you miss an extra space?

Also, I notice this comment is the exact same as on top as 
sve_context_init(). I think this is a bit misleading because the logic 
is different. I would suggest the following:

"Currently points to the end of Z0-Z31 memory which is not the start of 
the buffer. To be kept in sync with the sve_context_init()."

Lastly, nit: Missing a full stop.

> +    v->arch.vfp.sve_zreg_ctx_end -=
> +        (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
> +
> +    XFREE(v->arch.vfp.sve_zreg_ctx_end);
> +}
> +

[...]

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

Sorry I only noticed now. But shouldn't this be protected with #ifdef 
CONFIG_SVE? Same...

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

... here.

>       register_t cptr_el2;
>       register_t hcr_el2;
>       register_t mdcr_el2;

Cheers,

-- 
Julien Grall

