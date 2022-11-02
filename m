Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D477615EAA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435674.689339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9dj-0003GS-R2; Wed, 02 Nov 2022 09:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435674.689339; Wed, 02 Nov 2022 09:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9dj-0003Dp-O9; Wed, 02 Nov 2022 09:02:27 +0000
Received: by outflank-mailman (input) for mailman id 435674;
 Wed, 02 Nov 2022 09:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oq9di-0003Dh-69
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9dh-0005xm-Mr; Wed, 02 Nov 2022 09:02:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.26.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9dh-0000Ch-F1; Wed, 02 Nov 2022 09:02:25 +0000
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
	bh=q3YcW/TzJD7jwwibAtb6hLrcF4w4sXqck59Zucbwvms=; b=w4x6A8/WMuAlSutSiirHPwoRjt
	wt1/fF79f4VBxWaMl/0F4BE+8wDVSco4N5x5T+QTRK0vvaeXAalHHs93UwLRM8a+F1PhSZsvagzfE
	hvkgSbwTCyxPPfQaVwGq3Z6O1WcCCOfv1RE0LscQVFOSj8HVfhbdYy8ANIqMTvm/nfI8=;
Message-ID: <f3aaae5f-9404-a8f6-be47-48afc4495c8b@xen.org>
Date: Wed, 2 Nov 2022 09:02:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on
 Aarch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-4-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221031151326.22634-4-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> In some situations (eg GICR_TYPER), the hypervior may need to emulate

Typo: s/eg/e.g./

> 64bit registers in aarch32 mode. In such situations, the hypervisor may
> need to read/modify the lower or upper 32 bits of the 64 bit register.
> 
> In aarch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
> registers.
> 
> The correct approach is to typecast 'mask' based on the size of register access
> (ie uint32_t or uint64_t) instead of using 'unsigned long' as it will not
> generate the correct mask for the upper 32 bits of a 64 bit register.
> Also, 'val' needs to be typecasted so that it can correctly update the upper/

'val' doesn't exist everywhere. But rather than explaining variable by 
variable what needs to be done, I would suggest something like the 
following:

"While we could replace 'unsigned long' by 'uint64_t', it is not 
entirely clear whether a 32-bit compiler would not allocate register for 
the upper 32-bit. Therefore fold vreg_reg_* helper in the size specific 
one and use the appropriate type based on the size requested."

This would also explain why we didn't do a straight replacement of 
"unsigned long" to "uint64_t".

[...]

>   /* N-bit register helpers */
>   #define VREG_REG_HELPERS(sz, offmask)                                   \
>   static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
>                                                   const mmio_info_t *info)\
>   {                                                                       \
> -    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
> -                            info->dabt.size);                           \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +                                                                        \
> +    reg >>= 8 * offset;                                                 \
> +    reg &= VREG_REG_MASK(info->dabt.size);                              \
> +                                                                        \
> +    return reg;                                                         \
>   }                                                                       \
>                                                                           \
>   static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
>                                            register_t val,                \
>                                            const mmio_info_t *info)       \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> -                                                                        \
> -    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
> -                    info->dabt.size);                                   \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \

As you fold it, please switch to "unsigned int".

>                                                                           \
> -    *reg = tmp;                                                         \
> +    *reg &= ~(mask << shift);                                           \
> +    *reg |= ((uint##sz##_t)val & mask) << shift;                        \
>   }                                                                       \
>                                                                           \
>   static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>                                             register_t bits,              \
>                                             const mmio_info_t *info)      \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> -                                                                        \
> -    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
> -                     info->dabt.size);                                  \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \

Same here.

>                                                                           \
> -    *reg = tmp;                                                         \
> +    *reg |= ((uint##sz##_t)bits & mask) << shift;                       \
>   }                                                                       \
>                                                                           \
>   static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>                                               register_t bits,            \
>                                               const mmio_info_t *info)    \
>   {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \

Same here.

>                                                                           \
> -    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
> -                       info->dabt.size);                                \
> -                                                                        \
> -    *reg = tmp;                                                         \
> +    *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
>   }
>   
> -/*
> - * 64 bits registers are only supported on platform with 64-bit long.
> - * This is also allow us to optimize the 32 bit case by using
> - * unsigned long rather than uint64_t
> - */
> -#if BITS_PER_LONG == 64
> -VREG_REG_HELPERS(64, 0x7);
> -#endif
>   VREG_REG_HELPERS(32, 0x3);
> +VREG_REG_HELPERS(64, 0x7);
>   
>   #undef VREG_REG_HELPERS
>   

Cheers,

-- 
Julien Grall

