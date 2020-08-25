Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DF25174A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:18:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWy3-0000Mm-9x; Tue, 25 Aug 2020 11:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAWy1-0000Mc-Mz
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:18:17 +0000
X-Inumbo-ID: cc527f84-64ed-4200-aa9e-79747dc5a324
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc527f84-64ed-4200-aa9e-79747dc5a324;
 Tue, 25 Aug 2020 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Kj1zjiG+JGU9/I2O7l5qmyam95JER/PllMFX3zNiCCg=; b=ehu4A4gHHNwJwyjPGJmGUBLmjm
 O4MWV8cCzR7OAbVaQ9sydMHVREyhrLGbuqT481l2Zob+DiEget+4xIUcxk3DB8wL29aldOI+ksRb0
 sICQkalaITgctOvRJS0UAqMKVxxJM53PGL7fFAro5SWAiYuVzyFHCnsROhamKaEwZKeE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAWy0-0004Kp-Ba; Tue, 25 Aug 2020 11:18:16 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAWy0-0005UJ-4q; Tue, 25 Aug 2020 11:18:16 +0000
Subject: Re: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Penny.Zheng@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20200825100847.27988-1-wei.chen@arm.com>
 <20200825100847.27988-3-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <232c39d0-cae6-3b5b-1046-c5bc9f6b448e@xen.org>
Date: Tue, 25 Aug 2020 12:18:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825100847.27988-3-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 25/08/2020 11:08, Wei Chen wrote:
> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> FP/SIMD implementations. Currently, we exactly know the meaning of
> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> features presented. If there is a value 0x2 bumped in the future,
> Xen behaviors for value <= 0x1 can also take effect. But what Xen
> done for value <= 0x1 may not always cover new value 0x2 required.
> We throw these messages to break the silence when Xen detected
> unknown FP/SIMD IDs to notice user to check.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

OOI, is this reviewed-by coming from internal review?

> ---
>   xen/arch/arm/setup.c             | 12 ++++++++++++
>   xen/include/asm-arm/cpufeature.h |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..ef39ce1ec6 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -133,6 +133,18 @@ static void __init processor_id(void)
>              cpu_has_simd ? " AdvancedSIMD" : "",
>              cpu_has_gicv3 ? " GICv3-SysReg" : "");
>   
> +    /* Warn user if we find unknown floating-point features */
> +    if ( cpu_has_unknown_fp )
> +        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
> +               "this may result to corruption on the platform\n",
> +               boot_cpu_feature64(fp));
> +
> +    /* Warn user if we find unknown AdvancedSIMD features */
> +    if ( cpu_has_unknown_simd )
> +        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
> +               "this may result to corruption on the platform\n",
> +               boot_cpu_feature64(simd));
> +
>       printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
>              boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
>       printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 10878ead8a..a32309986e 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -16,6 +16,8 @@
>   #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
>   #define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
>   #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
> +#define cpu_has_unknown_fp   (cpu_has_fp && (boot_cpu_feature64(fp) >= 2))
> +#define cpu_has_unknown_simd (cpu_has_simd && (boot_cpu_feature64(simd) >= 2))

I would rather prefer if we don't introduce cpu_has_unknown_{fp, simd} 
but open-code directly in the 'if'.

Other than that the code looks ok to me.

Cheers,

-- 
Julien Grall

