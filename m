Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40214AC751B
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999675.1380310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKREX-00077o-Jp; Thu, 29 May 2025 00:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999675.1380310; Thu, 29 May 2025 00:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKREX-00076B-H8; Thu, 29 May 2025 00:34:57 +0000
Received: by outflank-mailman (input) for mailman id 999675;
 Thu, 29 May 2025 00:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKREW-00075g-Ve
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:34:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc65578-3c24-11f0-a2fe-13f23c93f187;
 Thu, 29 May 2025 02:34:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0BE484AC60;
 Thu, 29 May 2025 00:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E8FC4CEE3;
 Thu, 29 May 2025 00:34:52 +0000 (UTC)
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
X-Inumbo-ID: bdc65578-3c24-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748478893;
	bh=9E+tUPglm98TAeqlfezwhuChyuy9OI2l/1fAH1GgeEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oPvmCondM85/MIBwtUCPaj1cvHy9qcoQ3+FO1k6VQihHayACPYmZ65EG9un2c4j0T
	 Qs3EnCP4duti8ERHnmfA4TLh51HT2iNBRm6szkQuqQpBDi9u/lHJ+3Gvmi8SYuGJvR
	 pn9kmsM5p7W1KRg7ranriQc2w+3/8e05MuIRPSdds1NsJRNo9vnLnpeQ70ZgQLizag
	 H2sCxYEA7qIY2d9anTWdd9mUqgiGgR4wUYXeTRxPt/Yb0uxkz88ifkj9pmhDK0AZBU
	 c6ZgafPp2aNcPzpjadfIHgsi7+ofnVtZqN7jJVSg8E6R/c89MHUtRqjB4ojUeDUiXp
	 L7dcnmoNFiQSQ==
Date: Wed, 28 May 2025 17:34:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1 1/3] xen/arm: Add a way to disable traps on unmapped
 MMIO
In-Reply-To: <20250527195616.874614-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505281734110.135336@ubuntu-linux-20-04-desktop>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com> <20250527195616.874614-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a per-domain way to optionally disable traps on unmapped MMIO.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

The ARM changes look OK; I'll ack the next version when the option
becomes arch common as Andrew suggested


> ---
>  tools/libs/light/libxl_arm.c      |  3 +++
>  xen/arch/arm/dom0less-build.c     |  3 +++
>  xen/arch/arm/domain.c             |  2 ++
>  xen/arch/arm/domain_build.c       |  3 +++
>  xen/arch/arm/include/asm/domain.h |  2 ++
>  xen/arch/arm/io.c                 | 33 +++++++++++++++++++++++++++++--
>  xen/include/public/arch-arm.h     |  9 +++++++++
>  7 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 75c811053c..40cd005619 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>      }
>  
> +    /* Trap accesses to unmapped MMIO. */
> +    config->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
> +
>      return 0;
>  }
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a49764f0ad..e5e13e07d0 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
>          panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>  #endif
>      }
> +
> +    /* Trap accesses to unmapped MMIO. */
> +    d_cfg->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
>  }
>  
>  int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 45aeb8bddc..54c6ae7678 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -714,6 +714,8 @@ int arch_domain_create(struct domain *d,
>      ioreq_domain_init(d);
>  #endif
>  
> +    d->arch.trap_unmapped_mmio = config->arch.flags & XEN_ARM_TRAP_UNMAPPED_MMIO;
> +
>      /* p2m_init relies on some value initialized by the IOMMU subsystem */
>      if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>          goto fail;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae..c3c8212260 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2018,6 +2018,9 @@ void __init create_dom0(void)
>      dom0_cfg.arch.tee_type = tee_get_type();
>      dom0_cfg.max_vcpus = dom0_max_vcpus();
>  
> +    /* Dom0 always traps on unmapped MMIO.  */
> +    dom0_cfg.arch.flags |= XEN_ARM_TRAP_UNMAPPED_MMIO;
> +
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index a3487ca713..4d1a180ce2 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -121,6 +121,8 @@ struct arch_domain
>      void *tee;
>  #endif
>  
> +    bool trap_unmapped_mmio;
> +
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 5a4b0e8f25..11ffa48969 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -21,6 +21,32 @@
>  
>  #include "decode.h"
>  
> +/* Handler for unmapped ranges. Writes ignored, reads return all ones.  */
> +static int unmapped_read(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                         void *priv)
> +{
> +    uint64_t mask = GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0);
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
>  static enum io_state handle_read(const struct mmio_handler *handler,
>                                   struct vcpu *v,
>                                   mmio_info_t *info)
> @@ -178,8 +204,11 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          rc = try_fwd_ioserv(regs, v, info);
>          if ( rc == IO_HANDLED )
>              return handle_ioserv(regs, v);
> -
> -        return rc;
> +        else if ( rc == IO_UNHANDLED && !v->domain->arch.trap_unmapped_mmio ) {
> +            /* Fallback to the unmapped handler. */
> +            handler = &unmapped_handler;
> +        } else
> +            return rc;
>      }
>  
>      /*
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e2412a1747..32b023504d 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -350,6 +350,15 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /*
> +     * IN
> +     *
> +     * XEN_ARM_TRAP_UNMAPPED_MMIO enables trapping of memory accesses
> +     * into unmapped ranges. When disabled, Xen will handle the access
> +     * by reading 0xFFFFFFFF and ignoring writes.
> +     */
> +#define XEN_ARM_TRAP_UNMAPPED_MMIO (1U << 0)
> +    uint32_t flags;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
> -- 
> 2.43.0
> 

