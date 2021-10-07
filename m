Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D432D424C8F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 06:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203284.358378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYLFE-0006QC-1g; Thu, 07 Oct 2021 04:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203284.358378; Thu, 07 Oct 2021 04:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYLFD-0006OO-Ug; Thu, 07 Oct 2021 04:42:59 +0000
Received: by outflank-mailman (input) for mailman id 203284;
 Thu, 07 Oct 2021 04:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYLFC-0006OI-BD
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 04:42:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3265f9f2-8c92-44db-b2b5-91cf1a696b86;
 Thu, 07 Oct 2021 04:42:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C62860F48;
 Thu,  7 Oct 2021 04:42:56 +0000 (UTC)
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
X-Inumbo-ID: 3265f9f2-8c92-44db-b2b5-91cf1a696b86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633581776;
	bh=rHu53fwSWBMXmFdSyaTkqI/1Yk5EfR0T2AckmGfzY9A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ikxO1T8rWfqe5ITMh+/YYB6Ts3Tim91OCqgxWro2KM92Qjr2eNVURQdImnPRGzPxz
	 NTQ8M1FHJnOqG+c/aWdvjT81qymzWGMGdM32haNIod2kxJSARS+5U1tTsM0g88D+9F
	 6cN0qJdWJYDiAtJ2sj+tKX3TGrFlx6ij+Iq0qFU2NIfJLquHFWiMjLtKiuEziEX9YU
	 P9/gPVvgZSqY9rUiNfxkeKXcCMea88A1GQsGNdmqboWuE8ATC23+APRvN2a6QPaoTM
	 W6+Ju46f1WdjrKiEcJIENB3RWrbqShWmrvkGeNy+rkO4qQ6iXgVrCIsiQ//n6zOHtl
	 AiImOW1awfM8w==
Date: Wed, 6 Oct 2021 21:42:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v2 2/3] xen/arm: Check for PMU platform support
In-Reply-To: <20211006105827.15217-3-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2110062137050.3209@sstabellini-ThinkPad-T480s>
References: <20211006105827.15217-1-michal.orzel@arm.com> <20211006105827.15217-3-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Michal Orzel wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/asm-arm/cpufeature.h | 49 ++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 5ca09b0bff..4fce23844d 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -4,6 +4,7 @@
>  #ifdef CONFIG_ARM_64
>  #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
>  #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
> +#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
>  
>  #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
>  
> @@ -22,6 +23,7 @@
>  
>  #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
>  #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
> +#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
>  
>  #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
>  #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> @@ -32,8 +34,10 @@
>  
>  #ifdef CONFIG_ARM_32
>  #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> +#define cpu_has_pmu       (boot_dbg_feature32(perfmon) >= 1)
>  #else
>  #define cpu_has_gentimer  (1)
> +#define cpu_has_pmu       (boot_dbg_feature64(pmu_ver) >= 1)
>  #endif
>  #define cpu_has_security  (boot_cpu_feature32(security) > 0)
>  
> @@ -181,8 +185,28 @@ struct cpuinfo_arm {
>          };
>      } pfr64;
>  
> -    struct {
> +    union {
>          register_t bits[2];
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
>      } dbg64;
>  
>      struct {
> @@ -321,8 +345,29 @@ struct cpuinfo_arm {
>          };
>      } pfr32;
>  
> -    struct {
> +    union {
>          register_t bits[2];
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
>      } dbg32;
>  
>      struct {
> -- 
> 2.29.0
> 

