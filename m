Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474EF24823C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7yGr-0002Aj-WB; Tue, 18 Aug 2020 09:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7yGq-0002Ae-F3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:51:08 +0000
X-Inumbo-ID: 81e0dc59-d577-4974-a784-a24ce931f4aa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81e0dc59-d577-4974-a784-a24ce931f4aa;
 Tue, 18 Aug 2020 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=13t8NOjDx7k3G+xFcMn+xj3wUFUtxp/fkbF0fxO4Rxw=; b=U0oOqB4OWBQSyh1TqJBfvm3GYf
 BiEXGnwhBHxklLJJY9cL/9EW+Cjq6tITNGZSK3ZdKHcxQDf8C27TejQNWEgzR4YxmNxX/phZiyB56
 CFG1+tmP7VFYzCUASU/Q9rp+AV+St9b/z9lExl+vw3NJ7vDUX88DIbRwMey9vqkCo95s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yGn-00008r-L7; Tue, 18 Aug 2020 09:51:05 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yGn-0001RK-F9; Tue, 18 Aug 2020 09:51:05 +0000
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, steve.capper@arm.com,
 Kaly.Xin@arm.com
References: <20200818031112.7038-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bc3088eb-bb21-bea2-7e24-3a335046525a@xen.org>
Date: Tue, 18 Aug 2020 10:51:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818031112.7038-1-wei.chen@arm.com>
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

Hi Wei,

On 18/08/2020 04:11, Wei Chen wrote:
> Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
> FP/SIMD or not. But currently, this two MACROs only consider value 0

s/this/these/

> of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
> that support FP/SIMD and half-precision floating-point features, the
> ID_AA64PFR0_EL1.FP/SIMD are 1. For these CPUs, xen will treat them as
> no FP/SIMD support. In this case, the vfp_save/restore_state will not
> take effect.
> 
> Unfortunately, Cortex-N1/A76/A75 are the CPUs support FP/SIMD and
> half-precision floatiing-point. 

I am not sure to understand this sentence. Could you clarify?

> Their ID_AA64PFR0_EL1.FP/SMID are 1
> (see Arm ARM DDI0487F.b, D13.2.64). In this case, on N1/A76/A75
> platforms, Xen will always miss the float pointer registers save/restore.

s/float pointer/floating point/?

> If different vCPUs are running on the same pCPU, the float pointer

Likewise?

> registers will be corrupted randomly.
> 
> This patch fixes Xen on these new cores.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-arm/cpufeature.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 674beb0353..588089e5ae 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -13,8 +13,8 @@
>   #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
>   #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
>   #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
> -#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
> -#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
> +#define cpu_has_fp        (boot_cpu_feature64(fp) <= 1)
> +#define cpu_has_simd      (boot_cpu_feature64(simd) <= 1)
>   #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
>   #endif
> 
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

Please configure your e-mail client to remove the disclaimer.

Cheers,

-- 
Julien Grall

