Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11267424C92
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 06:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203293.358388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYLHi-000739-F7; Thu, 07 Oct 2021 04:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203293.358388; Thu, 07 Oct 2021 04:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYLHi-00071H-Bx; Thu, 07 Oct 2021 04:45:34 +0000
Received: by outflank-mailman (input) for mailman id 203293;
 Thu, 07 Oct 2021 04:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYLHg-00071B-S1
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 04:45:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66a58120-2729-11ec-bfbc-12813bfff9fa;
 Thu, 07 Oct 2021 04:45:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DF7260F48;
 Thu,  7 Oct 2021 04:45:30 +0000 (UTC)
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
X-Inumbo-ID: 66a58120-2729-11ec-bfbc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633581930;
	bh=bsZjrqCjcDJAfsMIrdbFh6u0y2b5AKa0xeAv8SHBnN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OVAo9w0GRx5XILoiuOSFETQp5I+goK81w8pJDhw9F0azM9jbWcB8Eyt3byl27HwFG
	 0os56uzJswPzx4Fpy3qQeQEa1fetjfb0Bp0sffUGqD7G3mBa8RUUrOjI8Lrowe3n4E
	 tp9b0TTIBEt8vGF9pi722vkVUuQzsO8+nhapqulPAJ40Ws/818If3eb7gyRs/KnDKl
	 VRdJnTM6X2VowzTxEAMK0M6gDsJpApsFXa8QPRgnFfXv3eqC7KCXhY1JkHQkKxmhe6
	 0PgADBjFiE9l19pz3Dp3/J9rmldwMEAlQNNA5ZqELrbsMH/Z3KkN95LjrgAauTyjPg
	 YmPKAiZASHsDQ==
Date: Wed, 6 Oct 2021 21:45:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
    Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, bertrand.marquis@arm.com
Subject: Re: [PATCH v2 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
In-Reply-To: <20211006105827.15217-2-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2110062145110.3209@sstabellini-ThinkPad-T480s>
References: <20211006105827.15217-1-michal.orzel@arm.com> <20211006105827.15217-2-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Michal Orzel wrote:
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
> 
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly uses (1<<6)
> instead of (1u<<6) and does not follow the standard
> of using separate macro for a flag field.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

From the xen/ part:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  tools/golang/xenlight/helpers.gen.go | 2 ++
>  tools/golang/xenlight/types.gen.go   | 1 +
>  tools/include/libxl.h                | 6 ++++++
>  tools/libs/light/libxl.c             | 1 +
>  tools/libs/light/libxl_types.idl     | 1 +
>  tools/ocaml/libs/xc/xenctrl.ml       | 1 +
>  tools/ocaml/libs/xc/xenctrl.mli      | 1 +
>  tools/xl/xl_info.c                   | 5 +++--
>  xen/common/domain.c                  | 2 ++
>  xen/common/sysctl.c                  | 3 +++
>  xen/include/public/sysctl.h          | 8 ++++++--
>  xen/include/xen/domain.h             | 2 ++
>  12 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index bfc1e7f312..c8669837d8 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3360,6 +3360,7 @@ x.CapHap = bool(xc.cap_hap)
>  x.CapShadow = bool(xc.cap_shadow)
>  x.CapIommuHapPtShare = bool(xc.cap_iommu_hap_pt_share)
>  x.CapVmtrace = bool(xc.cap_vmtrace)
> +x.CapVpmu = bool(xc.cap_vpmu)
>  
>   return nil}
>  
> @@ -3391,6 +3392,7 @@ xc.cap_hap = C.bool(x.CapHap)
>  xc.cap_shadow = C.bool(x.CapShadow)
>  xc.cap_iommu_hap_pt_share = C.bool(x.CapIommuHapPtShare)
>  xc.cap_vmtrace = C.bool(x.CapVmtrace)
> +xc.cap_vpmu = C.bool(x.CapVpmu)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 09a3bb67e2..45f2cba3d2 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -1008,6 +1008,7 @@ CapHap bool
>  CapShadow bool
>  CapIommuHapPtShare bool
>  CapVmtrace bool
> +CapVpmu bool
>  }
>  
>  type Connectorinfo struct {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..ec5e3badae 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -502,6 +502,12 @@
>   */
>  #define LIBXL_HAVE_X86_MSR_RELAXED 1
>  
> +/*
> + * LIBXL_HAVE_PHYSINFO_CAP_VPMU indicates that libxl_physinfo has a cap_vpmu
> + * field, which indicates the availability of vPMU functionality.
> + */
> +#define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
> +
>  /*
>   * libxl ABI compatibility
>   *
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 204eb0be2d..a032723fde 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -404,6 +404,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share);
>      physinfo->cap_vmtrace =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
> +    physinfo->cap_vpmu = !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vpmu);
>  
>      GC_FREE;
>      return 0;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff653a..993e83acca 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1061,6 +1061,7 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_shadow", bool),
>      ("cap_iommu_hap_pt_share", bool),
>      ("cap_vmtrace", bool),
> +    ("cap_vpmu", bool),
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index a5588c643f..6da3ed3c6f 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -121,6 +121,7 @@ type physinfo_cap_flag =
>  	| CAP_Shadow
>  	| CAP_IOMMU_HAP_PT_SHARE
>  	| CAP_Vmtrace
> +	| CAP_Vpmu
>  
>  type physinfo =
>  {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index 6e94940a8a..b8faff6721 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -106,6 +106,7 @@ type physinfo_cap_flag =
>    | CAP_Shadow
>    | CAP_IOMMU_HAP_PT_SHARE
>    | CAP_Vmtrace
> +  | CAP_Vpmu
>  
>  type physinfo = {
>    threads_per_core : int;
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 8383e4a6df..2c86b317b7 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -210,7 +210,7 @@ static void output_physinfo(void)
>           info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
>          );
>  
> -    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s\n",
> +    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s\n",
>           info.cap_pv ? " pv" : "",
>           info.cap_hvm ? " hvm" : "",
>           info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
> @@ -218,7 +218,8 @@ static void output_physinfo(void)
>           info.cap_hap ? " hap" : "",
>           info.cap_shadow ? " shadow" : "",
>           info.cap_iommu_hap_pt_share ? " iommu_hap_pt_share" : "",
> -         info.cap_vmtrace ? " vmtrace" : ""
> +         info.cap_vmtrace ? " vmtrace" : "",
> +         info.cap_vpmu ? " vpmu" : ""
>          );
>  
>      vinfo = libxl_get_version_info(ctx);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6ee5d033b0..4d0e909eec 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -84,6 +84,8 @@ vcpu_info_t dummy_vcpu_info;
>  
>  bool __read_mostly vmtrace_available;
>  
> +bool __read_mostly vpmu_is_available;
> +
>  static void __domain_finalise_shutdown(struct domain *d)
>  {
>      struct vcpu *v;
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 3558641cd9..6e7189bb3c 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -280,6 +280,9 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          if ( vmtrace_available )
>              pi->capabilities |= XEN_SYSCTL_PHYSCAP_vmtrace;
>  
> +        if ( vpmu_is_available )
> +            pi->capabilities |= XEN_SYSCTL_PHYSCAP_vpmu;
> +
>          if ( copy_to_guest(u_sysctl, op, 1) )
>              ret = -EFAULT;
>      }
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 039ccf885c..546e673409 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,10 +100,14 @@ struct xen_sysctl_tbuf_op {
>  #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>  #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>      (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
> -#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
> +#define _XEN_SYSCTL_PHYSCAP_vmtrace      6
> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1u<<_XEN_SYSCTL_PHYSCAP_vmtrace)
> +/* The platform supports vPMU. */
> +#define _XEN_SYSCTL_PHYSCAP_vpmu         7
> +#define XEN_SYSCTL_PHYSCAP_vpmu          (1u<<_XEN_SYSCTL_PHYSCAP_vpmu)
>  
>  /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
> -#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_vmtrace
> +#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_vpmu
>  
>  struct xen_sysctl_physinfo {
>      uint32_t threads_per_core;
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1708c36964..160c8dbdab 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -133,4 +133,6 @@ static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
>  
>  extern bool vmtrace_available;
>  
> +extern bool vpmu_is_available;
> +
>  #endif /* __XEN_DOMAIN_H__ */
> -- 
> 2.29.0
> 

