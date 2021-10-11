Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4ED428AA7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205693.361071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsMq-0003yQ-EK; Mon, 11 Oct 2021 10:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205693.361071; Mon, 11 Oct 2021 10:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsMq-0003wb-BJ; Mon, 11 Oct 2021 10:17:12 +0000
Received: by outflank-mailman (input) for mailman id 205693;
 Mon, 11 Oct 2021 10:17:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZsMo-0003wV-Vd
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsMo-0002dc-O2; Mon, 11 Oct 2021 10:17:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsMo-0004eR-IP; Mon, 11 Oct 2021 10:17:10 +0000
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
	bh=svzXPsIctWQElQvRlPKgRJGpbwIk95MNcTAuYMFlzYw=; b=Q64D6FLbtM8K7mh1EArSn4jDtR
	FiGhBeFFv1j2tMoVArF8DOTxd25prZaMds0/AjsMueBBFqZrYYD75TKuHcaar2qdGn9wQh60iGme8
	nytU+rUh21VDnIZm2f4RW+Ntem6QTlOucipc3y3sneqNQh+lAa9U6GYEtxAOeFUrdNB4=;
Message-ID: <1a8a16f6-9887-60ec-3c2d-1df906fd90c4@xen.org>
Date: Mon, 11 Oct 2021 11:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/3] xen/arm: Check for PMU platform support
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20211011090047.8878-1-michal.orzel@arm.com>
 <20211011090047.8878-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211011090047.8878-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/10/2021 10:00, Michal Orzel wrote:
> ID_AA64DFR0_EL1/ID_DFR0_EL1 registers provide
> information about PMU support. Replace structure
> dbg64/dbg32 with a union and fill in all the
> register fields according to document:
> ARM Architecture Registers(DDI 0595, 2021-06).
> 
> Add macros boot_dbg_feature64/boot_dbg_feature32
> to check for a debug feature. Add macro
> cpu_has_pmu to check for PMU support.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v3:
> -none
> Changes since v2:
> -none
> Changes since v1:
> -new in v2
> ---
>   xen/include/asm-arm/cpufeature.h | 49 ++++++++++++++++++++++++++++++--
>   1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 5ca09b0bff..4fce23844d 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -4,6 +4,7 @@
>   #ifdef CONFIG_ARM_64
>   #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
>   #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
> +#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
>   
>   #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
>   
> @@ -22,6 +23,7 @@
>   
>   #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
>   #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
> +#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
>   
>   #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
>   #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> @@ -32,8 +34,10 @@
>   
>   #ifdef CONFIG_ARM_32
>   #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> +#define cpu_has_pmu       (boot_dbg_feature32(perfmon) >= 1)

 From my understanding, on Armv7, perfmon == 0 only means PMUv2 is not 
present. IOW, it doesn't say whether PMUv1 is supported.

I think it is OK to treat as the PMU is not supported (ARMv8 treat it 
like that too), but I would like a comment in the code so it is clear 
this is a deliberate choice.

>   #else
>   #define cpu_has_gentimer  (1)
> +#define cpu_has_pmu       (boot_dbg_feature64(pmu_ver) >= 1)
>   #endif
>   #define cpu_has_security  (boot_cpu_feature32(security) > 0)
>   
> @@ -181,8 +185,28 @@ struct cpuinfo_arm {
>           };
>       } pfr64;
>   
> -    struct {
> +    union {
>           register_t bits[2];
> +        struct {
> +            /* DFR0 */
> +            unsigned long debug_ver:4;
> +            unsigned long trace_ver:4;
> +            unsigned long pmu_ver:4;
> +            unsigned long brps:4;
> +            unsigned long __res0:4;
> +            unsigned long wrps:4;
> +            unsigned long __res1:4;
> +            unsigned long ctx_cmps:4;
> +            unsigned long pms_ver:4;
> +            unsigned long double_lock:4;
> +            unsigned long trace_filt:4;
> +            unsigned long __res2:4;
> +            unsigned long mtpmu:4;
> +            unsigned long __res3:12;
> +
> +            /* DFR1 */
> +            unsigned long __res4:64;
> +        };
>       } dbg64;
>   
>       struct {
> @@ -321,8 +345,29 @@ struct cpuinfo_arm {
>           };
>       } pfr32;
>   
> -    struct {
> +    union {
>           register_t bits[2];
> +        struct {
> +            /* DFR0 */
> +            unsigned long copdbg:4;
> +            unsigned long copsdbg:4;
> +            unsigned long mmapdbg:4;
> +            unsigned long coptrc:4;
> +            unsigned long mmaptrc:4;
> +            unsigned long mprofdbg:4;
> +            unsigned long perfmon:4;
> +            unsigned long tracefilt:4;
> +#ifdef CONFIG_ARM_64
> +            unsigned long __res0:32;
> +#endif
> +
> +            /* DFR1 */
> +            unsigned long mtpmu:4;
> +            unsigned long __res1:28;
> +#ifdef CONFIG_ARM_64
> +            unsigned long __res2:32;
> +#endif
> +        };
>       } dbg32;
>   
>       struct {
> 

Cheers,

-- 
Julien Grall

