Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB1B0992B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 03:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047741.1418103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZye-0007XU-Rj; Fri, 18 Jul 2025 01:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047741.1418103; Fri, 18 Jul 2025 01:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZye-0007VR-PA; Fri, 18 Jul 2025 01:33:32 +0000
Received: by outflank-mailman (input) for mailman id 1047741;
 Fri, 18 Jul 2025 01:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucZye-0007VL-7d
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 01:33:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 353f97a2-6377-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 03:33:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EC88EA544E3;
 Fri, 18 Jul 2025 01:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60FBC4CEE3;
 Fri, 18 Jul 2025 01:33:26 +0000 (UTC)
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
X-Inumbo-ID: 353f97a2-6377-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752802408;
	bh=XDDXv9OGMiJAkUlLjWLqKv5Z3w5ZMRc91MzcacS+Ago=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UdtAGWwsjV6KJlXurlPwLxF3QQDjw3pcnsMlz0Jb5kTe3JkF/9Rs1zpV/xfg9VNA+
	 pzfpDZJxjQjBcT+VWcu9XmsFD3C0bPxcgyDOmvWLaU1Uybc91FzBPPKlfFxQbiB6vA
	 0mjc8PBE6htYkDG1S5kH8wv98ltrUnQHVu2XcEJqJPNNUBQV7WX8Xdw3+m6kIiFPfj
	 /g5G/7Es9K6fYh0SodzAnKX5YMKY5ss5fLSQKV3WpGdTdWn04+EZscj/ZAHfCB6rNK
	 QX09nT/cvdWj5gLhG26gqEWB4NHlc/+ktc0JHxgrVw97WEunkFHu2ApILnhyjbZ6Nd
	 XoQylGBHP4v6Q==
Date: Thu, 17 Jul 2025 18:33:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
In-Reply-To: <20250716211504.291104-5-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171823410.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-5-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> Add a new create domain flag  to indicate if a domain can be the target
> of hypercalls.  By default all domains can be targetted - subject to any
> other permission checks.
> 
> This property is useful in a safety environment to isolate domains for
> freedom from interference.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> DOMAIN_CAPS_NOT_HYPERCALL_TARGET duplicates the hypercall-untargetable
> DT property, so it could be removed.  Leaving it here for now to at
> least illustrate the alternate approach.
> ---
>  docs/misc/arm/device-tree/booting.txt   |  6 ++++++
>  tools/ocaml/libs/xc/xenctrl.ml          |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli         |  1 +
>  xen/arch/arm/domain.c                   |  3 ++-
>  xen/common/device-tree/dom0less-build.c |  6 ++++++
>  xen/common/domain.c                     |  2 +-
>  xen/include/public/bootfdt.h            | 10 ++++++++--
>  xen/include/public/domctl.h             |  4 +++-
>  xen/include/xen/sched.h                 | 12 ++++++++++++
>  xen/include/xsm/dummy.h                 |  4 ++++
>  10 files changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 07acc7ba64..963dd81912 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -307,6 +307,12 @@ with the following properties:
>      passed through. This option is the default if this property is missing
>      and the user does not provide the device partial device tree for the domain.
>  
> +- hypercall-untargetable
> +
> +    Optional.  An empty property to specify the domain cannot be the target
> +    of hypercalls.  This protects a domain for freedom of interference from
> +    other domains.

This protects a domain from interference

or

This protects a domain ensuring freedom of interference from other
domains


>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index f5835e7d95..00c29199dc 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -72,6 +72,7 @@ type domain_create_flag =
>    | CDF_VPMU
>    | CDF_TRAP_UNMAPPED_ACCESSES
>    | CDF_DEVICE_MODEL
> +  | CDF_NOT_HYPERCALL_TARGET
>  
>  type domain_create_iommu_opts =
>    | IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index b9471a56a8..daf6686f4d 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -65,6 +65,7 @@ type domain_create_flag =
>    | CDF_VPMU
>    | CDF_TRAP_UNMAPPED_ACCESSES
>    | CDF_DEVICE_MODEL
> +  | CDF_NOT_HYPERCALL_TARGET
>  
>  type domain_create_iommu_opts =
>    | IOMMU_NO_SHAREPT
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 57eecbd250..5f6358096f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -614,7 +614,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
>                                     XEN_DOMCTL_CDF_xs_domain |
>                                     XEN_DOMCTL_CDF_trap_unmapped_accesses |
> -                                   XEN_DOMCTL_CDF_device_model);
> +                                   XEN_DOMCTL_CDF_device_model |
> +                                   XEN_DOMCTL_CDF_not_hypercall_target);
>      unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>  
>      if ( (config->flags & ~flags_optional) != flags_required )
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index bb52291dfb..22af043aa5 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -886,6 +886,9 @@ void __init create_domUs(void)
>  
>              if ( val & DOMAIN_CAPS_DEVICE_MODEL )
>                  d_cfg.flags |= XEN_DOMCTL_CDF_device_model;
> +
> +            if ( val & DOMAIN_CAPS_NOT_HYPERCALL_TARGET )
> +                d_cfg.flags |= XEN_DOMCTL_CDF_not_hypercall_target;
>          }
>  
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
> @@ -896,6 +899,9 @@ void __init create_domUs(void)
>              flags |= CDF_staticmem;
>          }
>  
> +        if ( dt_property_read_bool(node, "hypercall-untargetable") )
> +            d_cfg.flags |= XEN_DOMCTL_CDF_not_hypercall_target;
> +
>          if ( dt_property_read_bool(node, "direct-map") )
>          {
>              if ( !(flags & CDF_staticmem) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 42c590b8d7..c347de4335 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -723,7 +723,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>             XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
>             XEN_DOMCTL_CDF_trap_unmapped_accesses |
> -           XEN_DOMCTL_CDF_device_model) )
> +           XEN_DOMCTL_CDF_device_model | XEN_DOMCTL_CDF_not_hypercall_target) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
> index c6b5afc76a..1eba1cc487 100644
> --- a/xen/include/public/bootfdt.h
> +++ b/xen/include/public/bootfdt.h
> @@ -32,8 +32,14 @@
>   * Hardware domain for running QEMU.
>   */
>  #define DOMAIN_CAPS_DEVICE_MODEL (1U << 3)
> +/*
> + * Domain cannot be the target of hypercalls.  This provides the domain
> + * freedom from interference from other domains.
> + */
> +#define DOMAIN_CAPS_NOT_HYPERCALL_TARGET (1U << 4)
>  
> -#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
> -                              DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL )
> +#define DOMAIN_CAPS_MASK    (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
> +                             DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL | \
> +                             DOMAIN_CAPS_NOT_HYPERCALL_TARGET)
>  
>  #endif /* __XEN_PUBLIC_BOOTFDT_H__ */
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 88a294c5be..f1f6f96bc2 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>  /* Allow domain to provide device model for multiple other domains */
>  #define XEN_DOMCTL_CDF_device_model   (1U << 9)
> +/* Domain cannot be the target of hypercalls */
> +#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
>  
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target
>  
>      uint32_t flags;
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9863603d93..8a32f9a1b6 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1157,6 +1157,18 @@ static always_inline bool is_dm_domain(const struct domain *d)
>      return evaluate_nospec(d->options & XEN_DOMCTL_CDF_device_model);
>  }
>  
> +/*
> + * Return whether this domain can be the target of hypercalls from other
> + * domains.
> + */
> +static always_inline bool is_hypercall_target(const struct domain *d)
> +{
> +    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
> +        return true;
> +
> +    return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_not_hypercall_target));
> +}
> +
>  #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
>  
>  static always_inline bool is_pv_domain(const struct domain *d)
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 0b341efd18..f2205575ed 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
>              return 0;
>          fallthrough;
>      case XSM_DM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;
>          if ( is_dm_domain(src) )
>              return 0;
>          if ( target && evaluate_nospec(src->target == target) )
>              return 0;
>          fallthrough;
>      case XSM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;
>          if ( is_control_domain(src) )
>              return 0;
>          return -EPERM;
> -- 
> 2.50.0
> 
> 

