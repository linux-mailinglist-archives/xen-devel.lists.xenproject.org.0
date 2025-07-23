Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111BB0EE4A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 11:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053643.1422408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVg6-0002el-JL; Wed, 23 Jul 2025 09:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053643.1422408; Wed, 23 Jul 2025 09:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVg6-0002cj-GK; Wed, 23 Jul 2025 09:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1053643;
 Wed, 23 Jul 2025 09:22:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueVg4-0002cd-Jv
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 09:22:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVg3-00EpIv-1l;
 Wed, 23 Jul 2025 09:22:19 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVg3-009KU0-15;
 Wed, 23 Jul 2025 09:22:19 +0000
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
	bh=0vLOveLRRAW+R3fCA80XKyYsutm1zqZzZuRfHXLn/U4=; b=as2X8kW74vItxA+/nDrRaEPuxB
	IWIDtSOplGOi3lzDiziHvPrCMFpP6G0Rt3cINhWt/JQ5SIri9XiYmXAzBeong8iRR1xpGWSH7YzPI
	+oaqadTf3J7zddvD4KX/cj+dvGsqIOPCDxnLGnPQpYvpSOvSECaFFszf1ArwGveAGS0k=;
Message-ID: <a4b971f0-8d96-4917-a9a3-ef08d267327c@xen.org>
Date: Wed, 23 Jul 2025 10:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arm64
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-4-grygorii_strashko@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250723075835.3993182-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/07/2025 08:58, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The vcpu_switch_to_aarch64_mode() is Arm64 specific, so move it in Arm64.
> As part of this change:
> - introduce arm32/arm64 domain.h headers and include them in asm/domain.h
> basing on CONFIG_ARM_xx;
> - declare vcpu_switch_to_aarch64_mode() for arm64;
> - add vcpu_switch_to_aarch64_mode() as empty macro for arm32.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/arm/arm64/domain.c             |  5 +++++
>   xen/arch/arm/domain.c                   |  5 -----
>   xen/arch/arm/include/asm/arm32/domain.h | 17 +++++++++++++++++
>   xen/arch/arm/include/asm/arm64/domain.h | 22 ++++++++++++++++++++++
>   xen/arch/arm/include/asm/domain.h       |  3 ++-
>   5 files changed, 46 insertions(+), 6 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
>   create mode 100644 xen/arch/arm/include/asm/arm64/domain.h
> 
> diff --git a/xen/arch/arm/arm64/domain.c b/xen/arch/arm/arm64/domain.c
> index dd1909892995..1e78986b5a7b 100644
> --- a/xen/arch/arm/arm64/domain.c
> +++ b/xen/arch/arm/arm64/domain.c
> @@ -55,6 +55,11 @@ void vcpu_regs_user_to_hyp(struct vcpu *vcpu,
>   #undef C
>   }
>   
> +void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> +{
> +    v->arch.hcr_el2 |= HCR_RW;
> +}

Strictly speaking arm/domain.c is GPLv2-or-later. But arm64/domain.c 
doesn't have a license. So it would default to GPLv2-only. There have 
been argument in the past on whether we would re-license code from 
GPLv2-or-later to GPLv2-only. But this was never concluded. So I am not 
entirely sure what to do with this change...

Bertrand, Michal,  Stefano?

> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index bbd4a764c696..e785278cdbd7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -605,11 +605,6 @@ void arch_vcpu_destroy(struct vcpu *v)
>       free_xenheap_pages(v->arch.stack, STACK_ORDER);
>   }
>   
> -void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> -{
> -    v->arch.hcr_el2 |= HCR_RW;
> -}
> -
>   int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
>       unsigned int max_vcpus;
> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include/asm/arm32/domain.h
> new file mode 100644
> index 000000000000..4d1251e9c128
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm32/domain.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_ARM32_DOMAIN_H
> +#define ARM_ARM32_DOMAIN_H
> +
> +#define vcpu_switch_to_aarch64_mode(v)

I think you want to "consume" v. IOW (void)(v).  That said, we tend to 
prefer using a static inline whenever it is possible. Have you tried it?

> +
> +#endif /* ARM_ARM32_DOMAIN_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include/asm/arm64/domain.h
> new file mode 100644
> index 000000000000..b5f1177d2508
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/domain.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_ARM64_DOMAIN_H
> +#define ARM_ARM64_DOMAIN_H
> +
> +/*
> + * Set guest execution state to AArch64 (EL1) for selected vcpu
> + *
> + * @vcpu: pointer to the vcpu structure
> + */
> +void vcpu_switch_to_aarch64_mode(struct vcpu *v);
> +
> +#endif /* ARM_ARM64_DOMAIN_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index a3487ca71303..fa258eb8d359 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -24,9 +24,11 @@ enum domain_type {
>   };
>   #define is_32bit_domain(d) ((d)->arch.type == DOMAIN_32BIT)
>   #define is_64bit_domain(d) ((d)->arch.type == DOMAIN_64BIT)
> +#include <asm/arm64/domain.h>
>   #else
>   #define is_32bit_domain(d) (1)
>   #define is_64bit_domain(d) (0)
> +#include <asm/arm64/domain.h>
>   #endif
>   
>   /*
> @@ -246,7 +248,6 @@ struct arch_vcpu
>   }  __cacheline_aligned;
>   
>   void vcpu_show_registers(struct vcpu *v);
> -void vcpu_switch_to_aarch64_mode(struct vcpu *v);
>   
>   /*
>    * Due to the restriction of GICv3, the number of vCPUs in AFF0 is

Cheers,

-- 
Julien Grall


