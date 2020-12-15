Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F212DB38D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 19:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54753.95293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpEvZ-0003GE-CM; Tue, 15 Dec 2020 18:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54753.95293; Tue, 15 Dec 2020 18:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpEvZ-0003Fp-8t; Tue, 15 Dec 2020 18:20:01 +0000
Received: by outflank-mailman (input) for mailman id 54753;
 Tue, 15 Dec 2020 18:19:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpEvX-0003Fk-RN
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 18:19:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpEvX-0004uY-N5; Tue, 15 Dec 2020 18:19:59 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpEvX-00011t-Bq; Tue, 15 Dec 2020 18:19:59 +0000
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
	bh=j4hluyl/wJZlPMsnYC4TRrDdiT8x0rl9+u5M9EYKY7A=; b=jP24mNx5s2yi+6GHYxbc0joK/H
	TWSxamamA/biYQsJdlTSf4g+Ck7HyjBXsrKgolDBjFgZNSWLUh/RKy7K3d0I6QJuWL+qXE/kWXxT9
	Kmy66Ba/8RO3zX7Ne1D5+Vf3CWl2VWEYySx53/MbIox+KZYD3eJ9xyjBEWANDC7IV5AE=;
Subject: Re: [RFC PATCH 1/6] xen/arm: Support detection of CPU features in
 other ID registers
To: Ash Wilding <ash.j.wilding@gmail.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
 <20201105185603.24149-2-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3fb7ab46-cedd-1ce2-03d5-ee4a6c7dab85@xen.org>
Date: Tue, 15 Dec 2020 18:19:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201105185603.24149-2-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ash,

Apologies for the late reply.

On 05/11/2020 18:55, Ash Wilding wrote:
> The current Arm boot_cpu_feature64() and boot_cpu_feature32() macros
> are hardcoded to only detect features in ID_AA64PFR{0,1}_EL1 and
> ID_PFR{0,1} respectively.
> 
> This patch replaces these macros with a new macro, boot_cpu_feature(),
> which takes an explicit ID register name as an argument.
> 
> While we're here, cull cpu_feature64() and cpu_feature32() as they
> have no callers (we only ever use the boot CPU features), and update
> the printk() messages in setup.c to use the new macro.
> 
> Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
> ---
>   xen/arch/arm/setup.c             |  8 +++---
>   xen/include/asm-arm/cpufeature.h | 44 +++++++++++++++-----------------
>   2 files changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7fcff9af2a..5121f06fc5 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -134,16 +134,16 @@ static void __init processor_id(void)
>              cpu_has_gicv3 ? " GICv3-SysReg" : "");
>   
>       /* Warn user if we find unknown floating-point features */
> -    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
> +    if ( cpu_has_fp && (boot_cpu_feature(pfr64, fp) >= 2) )
>           printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
>                  "this may result in corruption on the platform\n",
> -               boot_cpu_feature64(fp));
> +               boot_cpu_feature(pfr64, fp));
>   
>       /* Warn user if we find unknown AdvancedSIMD features */
> -    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
> +    if ( cpu_has_simd && (boot_cpu_feature(pfr64, simd) >= 2) )
>           printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
>                  "this may result in corruption on the platform\n",
> -               boot_cpu_feature64(simd));
> +               boot_cpu_feature(pfr64, simd));
>   
>       printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
>              boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 10878ead8a..f9281ea343 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -1,39 +1,35 @@
>   #ifndef __ASM_ARM_CPUFEATURE_H
>   #define __ASM_ARM_CPUFEATURE_H
>   
> +#define boot_cpu_feature(idreg, feat) (boot_cpu_data.idreg.feat)
> +
>   #ifdef CONFIG_ARM_64
> -#define cpu_feature64(c, feat)         ((c)->pfr64.feat)
> -#define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
> -
> -#define cpu_has_el0_32    (boot_cpu_feature64(el0) == 2)
> -#define cpu_has_el0_64    (boot_cpu_feature64(el0) >= 1)
> -#define cpu_has_el1_32    (boot_cpu_feature64(el1) == 2)
> -#define cpu_has_el1_64    (boot_cpu_feature64(el1) >= 1)
> -#define cpu_has_el2_32    (boot_cpu_feature64(el2) == 2)
> -#define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
> -#define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
> -#define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
> -#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
> -#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
> -#define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
> +#define cpu_has_el0_32          (boot_cpu_feature(pfr64, el0) == 2)
> +#define cpu_has_el0_64          (boot_cpu_feature(pfr64, el0) >= 1)
> +#define cpu_has_el1_32          (boot_cpu_feature(pfr64, el1) == 2)
> +#define cpu_has_el1_64          (boot_cpu_feature(pfr64, el1) >= 1)
> +#define cpu_has_el2_32          (boot_cpu_feature(pfr64, el2) == 2)
> +#define cpu_has_el2_64          (boot_cpu_feature(pfr64, el2) >= 1)
> +#define cpu_has_el3_32          (boot_cpu_feature(pfr64, el3) == 2)
> +#define cpu_has_el3_64          (boot_cpu_feature(pfr64, el3) >= 1)
> +#define cpu_has_fp              (boot_cpu_feature(pfr64, fp) < 8)
> +#define cpu_has_simd            (boot_cpu_feature(pfr64, simd) < 8)
> +#define cpu_has_gicv3           (boot_cpu_feature(pfr64, gic) == 1)

May I ask why the indentation was changed here?

The rest of the patch looks good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

>   #endif
>   
> -#define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> -#define boot_cpu_feature32(feat)       (boot_cpu_data.pfr32.feat)
> -
> -#define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
> -#define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> -#define cpu_has_thumb2    (boot_cpu_feature32(thumb) >= 3)
> -#define cpu_has_jazelle   (boot_cpu_feature32(jazelle) > 0)
> -#define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
> +#define cpu_has_arm       (boot_cpu_feature(pfr32, arm) == 1)
> +#define cpu_has_thumb     (boot_cpu_feature(pfr32, thumb) >= 1)
> +#define cpu_has_thumb2    (boot_cpu_feature(pfr32, thumb) >= 3)
> +#define cpu_has_jazelle   (boot_cpu_feature(pfr32, jazelle) > 0)
> +#define cpu_has_thumbee   (boot_cpu_feature(pfr32, thumbee) == 1)
>   #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
>   
>   #ifdef CONFIG_ARM_32
> -#define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> +#define cpu_has_gentimer  (boot_cpu_feature(pfr32, gentimer) == 1)
>   #else
>   #define cpu_has_gentimer  (1)
>   #endif
> -#define cpu_has_security  (boot_cpu_feature32(security) > 0)
> +#define cpu_has_security  (boot_cpu_feature(pfr32, security) > 0)
>   
>   #define ARM64_WORKAROUND_CLEAN_CACHE    0
>   #define ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE    1
> 

Cheers,

-- 
Julien Grall

