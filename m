Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0524FE9E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACJr-0001E2-TA; Mon, 24 Aug 2020 13:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G0tX=CC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kACJq-0001Dx-ST
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:15:26 +0000
X-Inumbo-ID: 5556b772-a6db-4dfd-a8e7-e23b7d7eaa94
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5556b772-a6db-4dfd-a8e7-e23b7d7eaa94;
 Mon, 24 Aug 2020 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=6arqW8Kt0g2KTVGrNQp85bdfjv/QTZxKSZTsOYucmow=; b=Mdk9uTHIdAOMcC0xxQYCz4MwQs
 cE07ldhnm5e7U3ADHVv6ucHAqiGVANXwmBhqY8eES8zKlLi9S43DjSDliEgVYRhNI6fwXdGQOKAnE
 31+qURtQIHJTbeYFvBSSwEBDS+liEJm7O48PetfvSgacRhFXpbKlcpNOyd7WCkHtIIKs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kACJo-0002YE-Rj; Mon, 24 Aug 2020 13:15:24 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kACJo-0001pR-2M; Mon, 24 Aug 2020 13:15:24 +0000
Subject: Re: [PATCH v2 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Penny.Zheng@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8f8e576-8e83-4ff0-ace6-a67c8121a911@xen.org>
Date: Mon, 24 Aug 2020 14:15:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824032825.18368-2-wei.chen@arm.com>
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

On 24/08/2020 04:28, Wei Chen wrote:
> Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
> FP/SIMD or not. But currently, these two MACROs only consider value 0
> of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
> that support FP/SIMD and half-precision floating-point arithmetic, the
> ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
> For these CPUs, xen will treat them as no FP/SIMD supporti, the

s/supporti/support/

> vfp_save/restore_state will not take effect.
> 
>  From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
> basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
> this case, on N1/A76/A75 platforms, Xen will always miss the floating
> pointer registers save/restore. If different vCPUs are running on the
> same pCPU, the floating pointer registers will be corrupted randomly.
> 
> This patch fixes Xen on these new cores.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/include/asm-arm/cpufeature.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 674beb0353..10878ead8a 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -13,8 +13,8 @@
>   #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
>   #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
>   #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
> -#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
> -#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
> +#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
> +#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
>   #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
>   #endif
>   
> 

-- 
Julien Grall

