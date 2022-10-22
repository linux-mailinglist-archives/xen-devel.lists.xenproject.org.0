Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AC608C3C
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428205.678134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCIJ-0001Qa-Ao; Sat, 22 Oct 2022 11:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428205.678134; Sat, 22 Oct 2022 11:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCIJ-0001Om-6w; Sat, 22 Oct 2022 11:03:59 +0000
Received: by outflank-mailman (input) for mailman id 428205;
 Sat, 22 Oct 2022 11:03:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCIG-0001Og-VM
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:03:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCIG-0001F9-G2; Sat, 22 Oct 2022 11:03:56 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCIF-0008Hk-V1; Sat, 22 Oct 2022 11:03:56 +0000
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
	bh=i6yQIH5Mj8Y/imZqcOIddzumszrDzdTAVM0D01X/jc8=; b=WAOC0i/oHeg5O/Kme97boyn0PF
	xT+XLMxkjFSqg8KEut90LP+B0VfHa+p8c8GkRCfVcSZBorlUFLsrwzTAPfOFwUdsEifMnpWpxK4CE
	pOvhOr5qgo5gPb0pyf5gm8zxbktYSZ2gJNHm/ns4sUFo8NSi030gGLObSzuBw0Q+r34w=;
Message-ID: <c1290406-9ec4-97f7-efad-8279dec39123@xen.org>
Date: Sat, 22 Oct 2022 12:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-8-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 07/12] Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
In-Reply-To: <20221021153128.44226-8-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Title: Xen doesn't emulate ICH_LR* (we don't expose them to the guest). 
Instead Xen will use the registers and your patch provides wrappers to 
use access the registers on 32-bit host.

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 6841d5de43..f3b4dfbca8 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -62,9 +62,61 @@
>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>   
> +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
> +
> +#define READ_SYSREG_LR(INDEX)    ((((uint64_t) \
> +                                 (READ_SYSREG(ICH_LRC_REG(INDEX)))) << 32) | \
> +                                 (READ_SYSREG(ICH_LR_REG(INDEX))))

This is a bit dense to read. Also, we should use READ_CP64() when 
dealing with arm32 only code. So how about (formatting will need to be 
done):

#define READ_SYSREG_LR(INDEX) ({   \
     uint32_t lrc_ = READ_CP64(ICH_LRC_REG(INDEX)); \
     uint32_t lr_ = READ_CP64(ICH_LR_REG(INDEX));   \
                                                    \
     (uint64_t)(lrc_ << 32) | lr_;
})

> +
> +#define WRITE_SYSREG_LR(INDEX, V) WRITE_SYSREG \
> +                                  (V&0xFFFFFFFF, ICH_LR_REG(INDEX)); \
> +                                  WRITE_SYSREG(V>>32, ICH_LRC_REG(INDEX));
This code is fragile. If V is a function call, then you will call it 
twice. You want something like:

do {
   uint64_t v_ = (V);

   WRITE_SYSREG(v_ & 0xFFFFFFFF, ICH_LR_REG(INDEX));
   WRITE_SYSREG(v_ >> 32, ICH_LRC_REG(INDEX));
} while(0);

And maybe replacing the opencoding Fs with GENMASK.

> +
>   /* MVFR2 is not defined on ARMv7 */
>   #define MVFR2_MAYBE_UNDEFINED
>   
> +#define ___CP32(a,b,c,d,e)   a,b,c,d,e

I am not entirely sure why you need to define __CP32() here. However, 
co-processors registers should be defined in asm/cpregs.h rather than 
arm32/sysregs.h.

> +#define __LR0_EL2(x)              ___CP32(p15,4,c12,c12,x)
> +#define __LR8_EL2(x)              ___CP32(p15,4,c12,c13,x)
> +
> +#define __LRC0_EL2(x)             ___CP32(p15,4,c12,c14,x)
> +#define __LRC8_EL2(x)             ___CP32(p15,4,c12,c15,x)
> +
> +#define ICH_LR0_EL2               __LR0_EL2(0)
> +#define ICH_LR1_EL2               __LR0_EL2(1)
> +#define ICH_LR2_EL2               __LR0_EL2(2)
> +#define ICH_LR3_EL2               __LR0_EL2(3)
> +#define ICH_LR4_EL2               __LR0_EL2(4)
> +#define ICH_LR5_EL2               __LR0_EL2(5)
> +#define ICH_LR6_EL2               __LR0_EL2(6)
> +#define ICH_LR7_EL2               __LR0_EL2(7)
> +#define ICH_LR8_EL2               __LR8_EL2(0)
> +#define ICH_LR9_EL2               __LR8_EL2(1)
> +#define ICH_LR10_EL2              __LR8_EL2(2)
> +#define ICH_LR11_EL2              __LR8_EL2(3)
> +#define ICH_LR12_EL2              __LR8_EL2(4)
> +#define ICH_LR13_EL2              __LR8_EL2(5)
> +#define ICH_LR14_EL2              __LR8_EL2(6)
> +#define ICH_LR15_EL2              __LR8_EL2(7)
> +
> +#define ICH_LRC0_EL2               __LRC0_EL2(0)
> +#define ICH_LRC1_EL2               __LRC0_EL2(1)
> +#define ICH_LRC2_EL2               __LRC0_EL2(2)
> +#define ICH_LRC3_EL2               __LRC0_EL2(3)
> +#define ICH_LRC4_EL2               __LRC0_EL2(4)
> +#define ICH_LRC5_EL2               __LRC0_EL2(5)
> +#define ICH_LRC6_EL2               __LRC0_EL2(6)
> +#define ICH_LRC7_EL2               __LRC0_EL2(7)
> +#define ICH_LRC8_EL2               __LRC8_EL2(0)
> +#define ICH_LRC9_EL2               __LRC8_EL2(1)
> +#define ICH_LRC10_EL2              __LRC8_EL2(2)
> +#define ICH_LRC11_EL2              __LRC8_EL2(3)
> +#define ICH_LRC12_EL2              __LRC8_EL2(4)
> +#define ICH_LRC13_EL2              __LRC8_EL2(5)
> +#define ICH_LRC14_EL2              __LRC8_EL2(6)
> +#define ICH_LRC15_EL2              __LRC8_EL2(7)
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ASM_ARM_ARM32_SYSREGS_H */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 54670084c3..d45fe815f9 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -469,8 +469,11 @@
>       asm volatile("mrs  %0, "__stringify(name) : "=r" (_r));         \
>       _r; })
>   
> -#define READ_SYSREG(name)     READ_SYSREG64(name)
> -#define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
> +#define READ_SYSREG(name)          READ_SYSREG64(name)
> +#define WRITE_SYSREG(v, name)      WRITE_SYSREG64(v, name)

Please don't re-indent existing macro. This is only introducing 
unnecessary extra churn.

> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
> +#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
>   
>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>   
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 48a1bc401e..87115f8b25 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -185,9 +185,9 @@
>   #define ICH_LR_HW_SHIFT              61
>   #define ICH_LR_GRP_MASK              0x1
>   #define ICH_LR_GRP_SHIFT             60
> -#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
> -#define ICH_LR_GRP1                  (1UL<<60)
> -#define ICH_LR_HW                    (1UL<<61)
> +#define ICH_LR_MAINTENANCE_IRQ       (1ULL<<41)
> +#define ICH_LR_GRP1                  (1ULL<<60)
> +#define ICH_LR_HW                    (1ULL<<61)
>   
>   #define ICH_VTR_NRLRGS               0x3f
>   #define ICH_VTR_PRIBITS_MASK         0x7

Cheers,

-- 
Julien Grall

