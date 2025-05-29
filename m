Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73418AC8099
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000038.1380481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKffC-0000fK-UH; Thu, 29 May 2025 15:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000038.1380481; Thu, 29 May 2025 15:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKffC-0000dJ-RD; Thu, 29 May 2025 15:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1000038;
 Thu, 29 May 2025 15:59:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uKffA-0000dD-S9
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:59:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKffA-008P7g-0O;
 Thu, 29 May 2025 15:59:24 +0000
Received: from [15.248.2.29] (helo=[10.24.66.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKffA-00F2eO-14;
 Thu, 29 May 2025 15:59:24 +0000
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
	bh=mE9O3jWM2USdWBRTBziuxdzcKSsudKHadfdNM/6nhoE=; b=Ob9jKw20RcUvwYM/N0xct+O5+Y
	h8XxBOLzXTaxT/8kKoRnIRKxSBEEW0YM9/OPJidGkuDM6i21spT9zucUg+MoLf70WuxQw8BvVbpry
	ntoS9RZ481npjOzYTmgNs7o70gXUPMr2Ge8CsPzan4XZdrwMiRP0Tc5RxNE89ZN7d1f8=;
Message-ID: <b77eb813-300a-4962-980e-02b236e2c5ca@xen.org>
Date: Thu, 29 May 2025 16:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
 <20250529155024.1284227-2-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250529155024.1284227-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 29/05/2025 16:50, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a per-domain way to optionally disable traps for accesses
> to unmapped addresses.
> 
> The domain flag is general but it's only implemented for ARM for now.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   tools/libs/light/libxl_arm.c  |  3 +++
>   xen/arch/arm/dom0less-build.c |  3 +++
>   xen/arch/arm/domain.c         |  3 ++-
>   xen/arch/arm/domain_build.c   |  3 ++-
>   xen/arch/arm/io.c             | 36 +++++++++++++++++++++++++++++++++--
>   xen/common/domain.c           |  3 ++-
>   xen/include/public/domctl.h   |  4 +++-

Looking at the changelog, I saw you removed the go bindings (although, 
they were in patch 3). But I don't quite understand why.

Also, I think you need to update the OCaml bindings.


>   7 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 75c811053c..9530996e72 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>       }
>   
> +    /* Trap accesses to unmapped areas. */
> +    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +
>       return 0;
>   }
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a49764f0ad..a4e0a33632 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
>           panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>   #endif
>       }
> +
> +    /* Trap accesses to unmapped areas. */
> +    d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
>   }
>   
>   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 45aeb8bddc..be58a23dd7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>       unsigned int max_vcpus;
>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> -                                   XEN_DOMCTL_CDF_xs_domain );
> +                                   XEN_DOMCTL_CDF_xs_domain |
> +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
>       unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>   
>       if ( (config->flags & ~flags_optional) != flags_required )
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae..7ff9c1b584 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2003,7 +2003,8 @@ void __init create_dom0(void)
>   {
>       struct domain *dom0;
>       struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> +                 XEN_DOMCTL_CDF_trap_unmapped_accesses,
>           .max_evtchn_port = -1,
>           .max_grant_frames = gnttab_dom0_frames(),
>           .max_maptrack_frames = -1,
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 5a4b0e8f25..adfc822e7e 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -21,6 +21,32 @@
>   
>   #include "decode.h"
>   
> +/* Handler for unmapped ranges. Writes ignored, reads return all ones.  */
> +static int unmapped_read(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                         void *priv)
> +{
> +    uint64_t mask = GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0);

NIT: Looking at the other part of io.c, we are using GENMASK. Any reason 
to not use the same?

> +
> +    /* Mask off upper bits.  */
> +    *r = UINT64_MAX & mask;
> +    return 1;
> +}
> +
> +static int unmapped_write(struct vcpu *v, mmio_info_t *info, register_t r,
> +                          void *priv)
> +{
> +    return 1;
> +}
> +
> +static const struct mmio_handler_ops unmapped_ops = {
> +    .read = unmapped_read,
> +    .write = unmapped_write
> +};
> +
> +static const struct mmio_handler unmapped_handler = {
> +    .ops = &unmapped_ops
> +};
> +
>   static enum io_state handle_read(const struct mmio_handler *handler,
>                                    struct vcpu *v,
>                                    mmio_info_t *info)
> @@ -175,11 +201,17 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       handler = find_mmio_handler(v->domain, info->gpa);
>       if ( !handler )
>       {
> +        bool trap_unmapped = v->domain->options &
> +                                         XEN_DOMCTL_CDF_trap_unmapped_accesses;
>           rc = try_fwd_ioserv(regs, v, info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> -
> -        return rc;
> +        else if ( rc == IO_UNHANDLED && !trap_unmapped )
> +        {
> +            /* Fallback to the unmapped handler. */
> +            handler = &unmapped_handler;
> +        } else

Style:

else if ( ... )
{
}
else
{
}

> +            return rc;
>       }
>   
>       /*
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..ac4f58f638 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> +           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
>       {
>           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>           return -EINVAL;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 5b2063eed9..be19ab5e26 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
>   #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>   /* Should we expose the vPMU to the guest? */
>   #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* Should we trap guest accesses to unmapped addresses? */
> +#define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>   
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
>   
>       uint32_t flags;
>   

-- 
Julien Grall


