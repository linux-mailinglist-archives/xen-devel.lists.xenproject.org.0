Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FC6661CA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475658.737416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFetL-0005DI-SC; Wed, 11 Jan 2023 17:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475658.737416; Wed, 11 Jan 2023 17:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFetL-0005AZ-P8; Wed, 11 Jan 2023 17:27:59 +0000
Received: by outflank-mailman (input) for mailman id 475658;
 Wed, 11 Jan 2023 17:27:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFetK-0005AT-Pj
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:27:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFetK-000664-DN; Wed, 11 Jan 2023 17:27:58 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFetK-00081C-5p; Wed, 11 Jan 2023 17:27:58 +0000
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
	bh=vx4ET+fi0wgacgZzFl1B6OvOIT/Q1T/uIXWJTLhiJ8Q=; b=5J+JVCemmfBxg9Q1/lVjUbiCzh
	WsVQFLjqhgkuxqdU8/t02lCHRd7GRsg/OsLkrPjMNiEXub9hHbnJ56l8dV454aAs7sizhMCEN9oXD
	PWlvaA3z2bbnPcACg/oX4XsdpQBhnMzAUxzS6IlZP5nKYow7YR/yWlTTrHP7L3MARm5c=;
Message-ID: <91b5c7db-ec9b-efa6-f5cf-dc5e8b176db6@xen.org>
Date: Wed, 11 Jan 2023 17:27:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230111143826.3224-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/01/2023 14:38, Luca Fancellu wrote:
> Add sve_vl_bits field to arch_domain and xen_arch_domainconfig
> structure, to allow the domain to have an information about the
> SVE feature and the number of SVE register bits that are allowed
> for this domain.
> 
> The field is used also to allow or forbid a domain to use SVE,
> because a value equal to zero means the guest is not allowed to
> use the feature.
> 
> When the guest is allowed to use SVE, the zcr_el2 register is
> updated on context switch to restict the domain on the allowed
> number of bits chosen, this value is the minimum among the chosen
> value and the platform supported value.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/arm64/sve.c             |  9 ++++++
>   xen/arch/arm/domain.c                | 45 ++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/sve.h | 12 ++++++++
>   xen/arch/arm/include/asm/domain.h    |  6 ++++
>   xen/include/public/arch-arm.h        |  2 ++
>   xen/include/public/domctl.h          |  2 +-
>   6 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 326389278292..b7695834f4ba 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <xen/types.h>
> +#include <asm/cpufeature.h>
>   #include <asm/arm64/sve.h>
>   #include <asm/arm64/sysregs.h>
>   
> @@ -36,3 +37,11 @@ register_t vl_to_zcr(uint16_t vl)
>   {
>       return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
>   }
> +
> +/* Get the system sanitized value for VL in bits */
> +uint16_t get_sys_vl_len(void)
> +{
> +    /* ZCR_ELx len field is ((len+1) * 128) = vector bits length */
> +    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
> +            SVE_VL_MULTIPLE_VAL;
> +}
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8ea3843ea8e8..27f38729302b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -13,6 +13,7 @@
>   #include <xen/wait.h>
>   
>   #include <asm/alternative.h>
> +#include <asm/arm64/sve.h>
>   #include <asm/cpuerrata.h>
>   #include <asm/cpufeature.h>
>   #include <asm/current.h>
> @@ -183,6 +184,11 @@ static void ctxt_switch_to(struct vcpu *n)
>   
>       WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>   
> +#ifdef CONFIG_ARM64_SVE
> +    if ( is_sve_domain(n->domain) )
> +        WRITE_SYSREG(n->arch.zcr_el2, ZCR_EL2);
> +#endif

I would actually expect that is_sve_domain() returns false when the SVE 
is not enabled. So can we simply remove the #ifdef?

> +
>       /* VFP */
>       vfp_restore_state(n);
>   
> @@ -551,6 +557,11 @@ int arch_vcpu_create(struct vcpu *v)
>       v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>   
>       v->arch.cptr_el2 = get_default_cptr_flags();
> +    if ( is_sve_domain(v->domain) )
> +    {
> +        v->arch.cptr_el2 &= ~HCPTR_CP(8);
> +        v->arch.zcr_el2 = vl_to_zcr(v->domain->arch.sve_vl_bits);
> +    }
>   
>       v->arch.hcr_el2 = get_default_hcr_flags();
>   
> @@ -595,6 +606,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>       unsigned int max_vcpus;
>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
> +    unsigned int sve_vl_bits = config->arch.sve_vl_bits;
>   
>       if ( (config->flags & ~flags_optional) != flags_required )
>       {
> @@ -603,6 +615,36 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    /* Check feature flags */
> +    if ( sve_vl_bits > 0 ) {
> +        unsigned int zcr_max_bits;
> +
> +        if ( !cpu_has_sve )
> +        {
> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
> +            return -EINVAL;
> +        }
> +        else if ( !is_vl_valid(sve_vl_bits) )
> +        {
> +            dprintk(XENLOG_INFO, "Unsupported SVE vector length (%u)\n",
> +                    sve_vl_bits);
> +            return -EINVAL;
> +        }
> +        /*
> +         * get_sys_vl_len() is the common safe value among all cpus, so if the
> +         * value specified by the user is above that value, use the safe value
> +         * instead.
> +         */
> +        zcr_max_bits = get_sys_vl_len();
> +        if ( sve_vl_bits > zcr_max_bits )
> +        {
> +            config->arch.sve_vl_bits = zcr_max_bits;
> +            dprintk(XENLOG_INFO,
> +                    "SVE vector length lowered to %u, safe value among CPUs\n",
> +                    zcr_max_bits);
> +        }

I don't think Xen should "downgrade" the value. Instead, this should be 
the decision from the tools. So we want to find a different way to 
reproduce the value (Andrew may have some ideas here as he was looking 
at it).

> +    }
> +
>       /* The P2M table must always be shared between the CPU and the IOMMU */
>       if ( config->iommu_opts & XEN_DOMCTL_IOMMU_no_sharept )
>       {
> @@ -745,6 +787,9 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = domain_vpci_init(d)) != 0 )
>           goto fail;
>   
> +    /* Copy sve_vl_bits to the domain configuration */
> +    d->arch.sve_vl_bits = config->arch.sve_vl_bits;
> +
>       return 0;
>   
>   fail:
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
> index bd56e2f24230..f4a660e402ca 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -13,10 +13,17 @@
>   /* Vector length must be multiple of 128 */
>   #define SVE_VL_MULTIPLE_VAL (128U)
>   
> +static inline bool is_vl_valid(uint16_t vl)
> +{
> +    /* SVE vector length is multiple of 128 and maximum 2048 */
> +    return ((vl % SVE_VL_MULTIPLE_VAL) == 0) && (vl <= SVE_VL_MAX_BITS);
> +}
> +
>   #ifdef CONFIG_ARM64_SVE
>   
>   register_t compute_max_zcr(void);
>   register_t vl_to_zcr(uint16_t vl);
> +uint16_t get_sys_vl_len(void);
>   
>   #else /* !CONFIG_ARM64_SVE */
>   
> @@ -30,6 +37,11 @@ static inline register_t vl_to_zcr(uint16_t vl)
>       return 0;
>   }
>   
> +static inline uint16_t get_sys_vl_len(void)
> +{
> +    return 0;
> +}
> +
>   #endif
>   
>   #endif /* _ARM_ARM64_SVE_H */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 42eb5df320a7..e4794a9fd2ab 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,8 @@ enum domain_type {
>   
>   #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>   
> +#define is_sve_domain(d) ((d)->arch.sve_vl_bits > 0)
> +
>   /*
>    * Is the domain using the host memory layout?
>    *
> @@ -114,6 +116,9 @@ struct arch_domain
>       void *tee;
>   #endif
>   
> +    /* max SVE vector length in bits */
> +    uint16_t sve_vl_bits;
> +
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> @@ -190,6 +195,7 @@ struct arch_vcpu
>       register_t tpidrro_el0;
>   
>       /* HYP configuration */
> +    register_t zcr_el2;
>       register_t cptr_el2;
>       register_t hcr_el2;
>       register_t mdcr_el2;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 1528ced5097a..e18a075105f0 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -304,6 +304,8 @@ struct xen_arch_domainconfig {
>       uint16_t tee_type;
>       /* IN */
>       uint32_t nr_spis;
> +    /* IN */
> +    uint16_t sve_vl_bits;

Please spell out the padding clearly (even though I know there is one in 
this structure that is not mentioned).

>       /*
>        * OUT
>        * Based on the property clock-frequency in the DT timer node.
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 51be28c3de7c..616d7a1c070d 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>   #include "hvm/save.h"
>   #include "memory.h"
>   
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.

Cheers,

-- 
Julien Grall

