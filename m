Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F94274BA
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 02:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204994.360243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ0Mi-0006er-3D; Sat, 09 Oct 2021 00:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204994.360243; Sat, 09 Oct 2021 00:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ0Mi-0006cG-07; Sat, 09 Oct 2021 00:37:28 +0000
Received: by outflank-mailman (input) for mailman id 204994;
 Sat, 09 Oct 2021 00:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mZ0Mg-0006cA-3t
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 00:37:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c493cccf-a3d4-4f06-b696-e5f478628dd7;
 Sat, 09 Oct 2021 00:37:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF3B60F6F;
 Sat,  9 Oct 2021 00:37:23 +0000 (UTC)
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
X-Inumbo-ID: c493cccf-a3d4-4f06-b696-e5f478628dd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633739843;
	bh=dfC4Vb0G9MF2ZFADLY6LBFXb4ZyLpGFqaXMghqVmisI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nn0HtiqK/ryN/kGsIBbP9ga0oxd6GdL+KWTfhKHNC6zvE+cGrD5ntxkVur7QxYLWl
	 jpkHtUB8gJeNob77cbgjmN2EMTn/5kHUp9f2oHOXqo1dwTWZg+ZIFrVXvhN2WfN5o9
	 nKqVJlrIiRBDD2LwWbf8OZfp+qGhUEpxYVPoiLqNBdjCrfdHGWg8kCYQzPqnHE50mr
	 /f1gciNgpsN6Iafx43hl+G5JBrGCxtLlfl09qUtd2irB1rryrP1dF38zPD5FUemnyA
	 SuxE48EIoIlkRIS3oCMKjm5nIFswqe8TcUadlRfIp0Nanz3HNCnSGdCdUYvP+6qtWS
	 UiOgeU7Co6b4w==
Date: Fri, 8 Oct 2021 17:37:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Nick Rosbrook <rosbrookn@ainfosec.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/3] xen: Expose the PMU to the guests
In-Reply-To: <20211008081933.18546-4-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2110081729550.25528@sstabellini-ThinkPad-T480s>
References: <20211008081933.18546-1-michal.orzel@arm.com> <20211008081933.18546-4-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Oct 2021, Michal Orzel wrote:
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
> 
> The current status is that the PMU registers are not
> virtualized and the physical registers are directly
> accessible when this parameter is enabled. There is no
> interrupt support and Xen will not save/restore the
> register values on context switches.
> 
> Please note that this feature is experimental.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <julien@xen.org>

The patch needs rebasing


> ---
> Changes since v2:
> -remove redundant check from x86 code
> -do not define bit position and mask separately
> Changes since v1:
> -modify vpmu parameter to be common rather than arch specific
> ---
>  docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  6 ++++++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  6 ++++++
>  tools/libs/light/libxl_create.c      |  4 ++++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/ocaml/libs/xc/xenctrl.ml       |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli      |  1 +
>  tools/xl/xl_parse.c                  |  2 ++
>  xen/arch/arm/domain.c                | 10 ++++++++--
>  xen/arch/arm/setup.c                 |  1 +
>  xen/common/domain.c                  |  9 ++++++++-
>  xen/include/asm-arm/domain.h         |  1 +
>  xen/include/public/domctl.h          |  4 +++-
>  14 files changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..55c4881205 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -690,6 +690,23 @@ default.
>  B<NOTE>: Acceptable values are platform specific.  For Intel Processor
>  Trace, this value must be a power of 2 between 4k and 16M.
>  
> +=item B<vpmu=BOOLEAN>
> +
> +Currently ARM only.
> +
> +Specifies whether to enable the access to PMU registers by disabling
> +the PMU traps.
> +
> +The PMU registers are not virtualized and the physical registers are directly
> +accessible when this parameter is enabled. There is no interrupt support and
> +Xen will not save/restore the register values on context switches.
> +
> +vPMU, by design and purpose, exposes system level performance
> +information to the guest. Only to be used by sufficiently privileged
> +domains. This feature is currently in experimental state.
> +
> +If this option is not specified then it will default to B<false>.
> +
>  =back
>  
>  =head2 Devices
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index c8669837d8..2449580bad 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1119,6 +1119,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
>  x.Altp2M = Altp2MMode(xc.altp2m)
>  x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
> +if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>  
>   return nil}
>  
> @@ -1600,6 +1603,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
>  xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>  xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
> +if err := x.Vpmu.toC(&xc.vpmu); err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 45f2cba3d2..b2e8bd1a85 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -521,6 +521,7 @@ MsrRelaxed Defbool
>  }
>  Altp2M Altp2MMode
>  VmtraceBufKb int
> +Vpmu Defbool
>  }
>  
>  type DomainBuildInfoTypeUnion interface {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index ec5e3badae..ee73eb06f1 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -508,6 +508,12 @@
>   */
>  #define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
>  
> +/*
> + * LIBXL_HAVE_VPMU indicates that libxl_domain_build_info has a vpmu parameter,
> + * which allows to enable the access to PMU registers.
> + */
> +#define LIBXL_HAVE_VPMU 1
> +
>  /*
>   * libxl ABI compatibility
>   *
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e356b2106d..d123c2f703 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -91,6 +91,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      }
>  
>      libxl_defbool_setdefault(&b_info->device_model_stubdomain, false);
> +    libxl_defbool_setdefault(&b_info->vpmu, false);
>  
>      if (libxl_defbool_val(b_info->device_model_stubdomain) &&
>          !b_info->device_model_ssidref)
> @@ -622,6 +623,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                  create.flags |= XEN_DOMCTL_CDF_nested_virt;
>          }
>  
> +        if ( libxl_defbool_val(b_info->vpmu) )
> +            create.flags |= XEN_DOMCTL_CDF_vpmu;

As Andrew recently pointed out in another thread
(https://marc.info/?l=xen-devel&m=163372953907637), it would be good to
check that vpmu is actually available from Xen before setting
XEN_DOMCTL_CDF_vpmu. You have already added XEN_SYSCTL_PHYSCAP_vpmu in
patch #1, so it should be only a matter of checking for it.

So that we can fail explicitly if vpmu is set in the config file but
XEN_SYSCTL_PHYSCAP_vpmu is not available.

Everything else looks fine to me.



>          assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
>          LOG(DETAIL, "passthrough: %s",
>              libxl_passthrough_to_string(info->passthrough));
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 993e83acca..b96fb5c47e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -655,6 +655,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      # Use zero value to disable this feature.
>      ("vmtrace_buf_kb", integer),
>  
> +    ("vpmu", libxl_defbool),
> +
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
>  )
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 6da3ed3c6f..addcf4cc59 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -69,6 +69,7 @@ type domain_create_flag =
>  	| CDF_XS_DOMAIN
>  	| CDF_IOMMU
>  	| CDF_NESTED_VIRT
> +	| CDF_VPMU
>  
>  type domain_create_iommu_opts =
>  	| IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index b8faff6721..0a5ce529e9 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -62,6 +62,7 @@ type domain_create_flag =
>    | CDF_XS_DOMAIN
>    | CDF_IOMMU
>    | CDF_NESTED_VIRT
> +  | CDF_VPMU
>  
>  type domain_create_iommu_opts =
>    | IOMMU_NO_SHAREPT
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..c503b9be00 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2750,6 +2750,8 @@ skip_usbdev:
>                      "If it fixes an issue you are having please report to "
>                      "xen-devel@lists.xenproject.org.\n");
>  
> +    xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> +
>      xlu_cfg_destroy(config);
>  }
>  
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..2dd474da09 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -276,6 +276,8 @@ static void ctxt_switch_to(struct vcpu *n)
>       * timer. The interrupt needs to be injected into the guest. */
>      WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>      virt_timer_restore(n);
> +
> +    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
>  }
>  
>  /* Update per-VCPU guest runstate shared memory area (if registered). */
> @@ -586,6 +588,10 @@ int arch_vcpu_create(struct vcpu *v)
>  
>      v->arch.hcr_el2 = get_default_hcr_flags();
>  
> +    v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> +    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
> +        v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
> +
>      if ( (rc = vcpu_vgic_init(v)) != 0 )
>          goto fail;
>  
> @@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  {
>      unsigned int max_vcpus;
>  
> -    /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
> +    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
> +    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu)) !=
>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>      {
>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 49dc90d198..85386a765a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -108,6 +108,7 @@ static void __init processor_id(void)
>  
>      identify_cpu(c);
>      current_cpu_data = *c;
> +    vpmu_is_available = cpu_has_pmu;
>  
>      if ( c->midr.implementer < ARRAY_SIZE(processor_implementers) &&
>           processor_implementers[c->midr.implementer] )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 4d0e909eec..8b53c49d1e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -480,12 +480,13 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>      bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
> +    bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
>  
>      if ( config->flags &
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> @@ -534,6 +535,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( vpmu && !vpmu_is_available )
> +    {
> +        dprintk(XENLOG_INFO, "vpmu requested but cannot be enabled this way\n");
> +        return -EINVAL;
> +    }
> +
>      return arch_sanitise_domain_config(config);
>  }
>  
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..14e575288f 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -166,6 +166,7 @@ struct arch_vcpu
>  
>      /* HYP configuration */
>      register_t hcr_el2;
> +    register_t mdcr_el2;
>  
>      uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
>  #ifdef CONFIG_ARM_32
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..238384b5ae 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +/* Should we expose the vPMU to the guest? */
> +#define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>  
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
>  
>      uint32_t flags;
>  
> -- 
> 2.29.0
> 

