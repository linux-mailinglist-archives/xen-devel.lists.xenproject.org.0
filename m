Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB09428AB3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205701.361082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsQk-0005NU-W8; Mon, 11 Oct 2021 10:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205701.361082; Mon, 11 Oct 2021 10:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsQk-0005L9-SH; Mon, 11 Oct 2021 10:21:14 +0000
Received: by outflank-mailman (input) for mailman id 205701;
 Mon, 11 Oct 2021 10:21:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZsQj-0005L3-Jk
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:21:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsQi-0002i0-A6; Mon, 11 Oct 2021 10:21:12 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsQh-00057F-Vx; Mon, 11 Oct 2021 10:21:12 +0000
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
	bh=jQ+J47ZBtfEUJVKNc8yjSwvOSv8AXyEiJiTZyF0JpyY=; b=t6v0mEijFeIK7nRnm1xFW0xcxw
	e/O1nTHQ8zvTvyVWaElKK2eqvm1VLzlrs444yUVup/T6y+CbQ62zTBIeBzU41DLtCEu4Z9ShWSo/m
	8Z7kkimiYIjLG4NnmzPV+UVqWCGPJMv6JCyrW2wHxecNJSKrdb8L0mbpCYdjzzt0gAQ0=;
Message-ID: <a91ddbf4-d1bc-40b5-b971-35dbcdc4d8a3@xen.org>
Date: Mon, 11 Oct 2021 11:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/3] xen: Expose the PMU to the guests
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211011090047.8878-1-michal.orzel@arm.com>
 <20211011090047.8878-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211011090047.8878-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/10/2021 10:00, Michal Orzel wrote:
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
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v3:
> -fail if vpmu is set but not supported
> -rebase on top of latest staging
> Changes since v2:
> -remove redundant check from x86 code
> -do not define bit position and mask separately
> Changes since v1:
> -modify vpmu parameter to be common rather than arch specific
> ---
>   docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
>   tools/golang/xenlight/helpers.gen.go |  6 ++++++
>   tools/golang/xenlight/types.gen.go   |  1 +
>   tools/include/libxl.h                |  6 ++++++
>   tools/libs/light/libxl_create.c      | 10 ++++++++++
>   tools/libs/light/libxl_types.idl     |  2 ++
>   tools/ocaml/libs/xc/xenctrl.ml       |  1 +
>   tools/ocaml/libs/xc/xenctrl.mli      |  1 +
>   tools/xl/xl_parse.c                  |  2 ++
>   xen/arch/arm/domain.c                | 12 +++++++++---
>   xen/arch/arm/setup.c                 |  1 +
>   xen/common/domain.c                  | 10 +++++++++-
>   xen/include/asm-arm/domain.h         |  1 +
>   xen/include/public/domctl.h          |  4 +++-
>   14 files changed, 69 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..55c4881205 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -690,6 +690,23 @@ default.
>   B<NOTE>: Acceptable values are platform specific.  For Intel Processor
>   Trace, this value must be a power of 2 between 4k and 16M.
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

Please update SUPPORT.MD to mention the support of this feature.

> +
> +If this option is not specified then it will default to B<false>.
> +
>   =back
>   
>   =head2 Devices
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index c8669837d8..2449580bad 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1119,6 +1119,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>   }
>   x.Altp2M = Altp2MMode(xc.altp2m)
>   x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
> +if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>   
>    return nil}
>   
> @@ -1600,6 +1603,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>   }
>   xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>   xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
> +if err := x.Vpmu.toC(&xc.vpmu); err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>   
>    return nil
>    }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 45f2cba3d2..b2e8bd1a85 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -521,6 +521,7 @@ MsrRelaxed Defbool
>   }
>   Altp2M Altp2MMode
>   VmtraceBufKb int
> +Vpmu Defbool
>   }
>   
>   type DomainBuildInfoTypeUnion interface {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index ec5e3badae..ee73eb06f1 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -508,6 +508,12 @@
>    */
>   #define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
>   
> +/*
> + * LIBXL_HAVE_VPMU indicates that libxl_domain_build_info has a vpmu parameter,
> + * which allows to enable the access to PMU registers.
> + */
> +#define LIBXL_HAVE_VPMU 1
> +
>   /*
>    * libxl ABI compatibility
>    *
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e356b2106d..2a0234ec16 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -91,6 +91,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>       }
>   
>       libxl_defbool_setdefault(&b_info->device_model_stubdomain, false);
> +    libxl_defbool_setdefault(&b_info->vpmu, false);
>   
>       if (libxl_defbool_val(b_info->device_model_stubdomain) &&
>           !b_info->device_model_ssidref)
> @@ -622,6 +623,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                   create.flags |= XEN_DOMCTL_CDF_nested_virt;
>           }
>   
> +        if ( libxl_defbool_val(b_info->vpmu) )
> +            create.flags |= XEN_DOMCTL_CDF_vpmu;
> +
>           assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
>           LOG(DETAIL, "passthrough: %s",
>               libxl_passthrough_to_string(info->passthrough));
> @@ -1199,6 +1203,12 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
>           goto error_out;
>       }
>   
> +    if (libxl_defbool_val(d_config->b_info.vpmu) && !physinfo.cap_vpmu) {
> +        ret = ERROR_INVAL;
> +        LOGD(ERROR, domid, "vpmu not supported on this platform\n");
> +        goto error_out;
> +    }
> +
>       ret = 0;
>    error_out:
>       return ret;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 993e83acca..b96fb5c47e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -655,6 +655,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       # Use zero value to disable this feature.
>       ("vmtrace_buf_kb", integer),
>   
> +    ("vpmu", libxl_defbool),
> +
>       ], dir=DIR_IN,
>          copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
>   )
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7a4030a192..86758babb3 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -70,6 +70,7 @@ type domain_create_flag =
>   	| CDF_IOMMU
>   	| CDF_NESTED_VIRT
>   	| CDF_VPCI
> +	| CDF_VPMU
>   
>   type domain_create_iommu_opts =
>   	| IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index 6900513e7f..0fdb0cc169 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -63,6 +63,7 @@ type domain_create_flag =
>     | CDF_IOMMU
>     | CDF_NESTED_VIRT
>     | CDF_VPCI
> +  | CDF_VPMU
>   
>   type domain_create_iommu_opts =
>     | IOMMU_NO_SHAREPT
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..c503b9be00 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2750,6 +2750,8 @@ skip_usbdev:
>                       "If it fixes an issue you are having please report to "
>                       "xen-devel@lists.xenproject.org.\n");
>   
> +    xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> +
>       xlu_cfg_destroy(config);
>   }
>   
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index aae4472479..2f988c790e 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -276,6 +276,8 @@ static void ctxt_switch_to(struct vcpu *n)
>        * timer. The interrupt needs to be injected into the guest. */
>       WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>       virt_timer_restore(n);
> +
> +    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
>   }
>   
>   /* Update per-VCPU guest runstate shared memory area (if registered). */
> @@ -586,6 +588,10 @@ int arch_vcpu_create(struct vcpu *v)
>   
>       v->arch.hcr_el2 = get_default_hcr_flags();
>   
> +    v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> +    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
> +        v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
> +
>       if ( (rc = vcpu_vgic_init(v)) != 0 )
>           goto fail;
>   
> @@ -622,9 +628,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
>       unsigned int max_vcpus;
>   
> -    /* HVM and HAP must be set. IOMMU and VPCI may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci) !=
> -         (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
> +    /* HVM and HAP must be set. IOMMU, VPCI and VPMU may or may not be */
> +    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpci |
> +          XEN_DOMCTL_CDF_vpmu)) != (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )

The split here is not easy to read. Can you introduce two masks (one for 
the flags that must be set and the other optional) so we don't need to 
split the optional options over two lines.

>       {
>           dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
>                   config->flags);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 49dc90d198..85386a765a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -108,6 +108,7 @@ static void __init processor_id(void)
>   
>       identify_cpu(c);
>       current_cpu_data = *c;
> +    vpmu_is_available = cpu_has_pmu;

This wants to be set after the ID registers are sanitized (i.e. after 
the secondary CPUs have been brought).

Also, on Armv8, the features supported by 64-bit and 32-bit exception 
level are separate. I couldn't find anything in the Arm that suggest 
that if the PMU is implemented by the former, then the latter must be. 
Do you have the page in hand?

>   
>       if ( c->midr.implementer < ARRAY_SIZE(processor_implementers) &&
>            processor_implementers[c->midr.implementer] )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 262b6c0c3c..8543fb54fd 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -480,12 +480,14 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>       bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>       bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>       bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
> +    bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
>   
>       if ( config->flags &
>            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci |
> +           XEN_DOMCTL_CDF_vpmu) )
>       {
>           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>           return -EINVAL;
> @@ -534,6 +536,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( vpmu && !vpmu_is_available )
> +    {
> +        dprintk(XENLOG_INFO, "vpmu requested but cannot be enabled this way\n");
> +        return -EINVAL;
> +    }
> +
>       return arch_sanitise_domain_config(config);
>   }
>   
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..14e575288f 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -166,6 +166,7 @@ struct arch_vcpu
>   
>       /* HYP configuration */
>       register_t hcr_el2;
> +    register_t mdcr_el2;
>   
>       uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
>   #ifdef CONFIG_ARM_32
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 4cb3f662c2..a53cbd16f4 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -71,9 +71,11 @@ struct xen_domctl_createdomain {
>   #define _XEN_DOMCTL_CDF_nested_virt   6
>   #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>   #define XEN_DOMCTL_CDF_vpci           (1U << 7)
> +/* Should we expose the vPMU to the guest? */
> +#define XEN_DOMCTL_CDF_vpmu           (1U << 8)
>   
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpci
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
>   
>       uint32_t flags;
>   
> 

Cheers,

-- 
Julien Grall

