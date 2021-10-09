Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E854274B9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 02:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204995.360255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ0Mo-0006wT-G7; Sat, 09 Oct 2021 00:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204995.360255; Sat, 09 Oct 2021 00:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ0Mo-0006ts-CU; Sat, 09 Oct 2021 00:37:34 +0000
Received: by outflank-mailman (input) for mailman id 204995;
 Sat, 09 Oct 2021 00:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mZ0Mn-0006ta-Ax
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 00:37:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a9c8d8e-a434-43fc-8bd4-0f5ffacd81e7;
 Sat, 09 Oct 2021 00:37:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33A9A60C4B;
 Sat,  9 Oct 2021 00:37:31 +0000 (UTC)
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
X-Inumbo-ID: 6a9c8d8e-a434-43fc-8bd4-0f5ffacd81e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633739851;
	bh=HQLf1cKJnHQZqhOjtkFphnS/bj1Ya5U31p3mtLc2WA8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GV5bQtCVGM003TzyGC42l4rSj1vA4FVhcec3JwnVPIqd0IDTfb6/YSTswZe1M3f3i
	 gqpL6xK4Fhw2iONoWEzNUlkqNW9lBcuOzXsUZbKJHKqmN4eXoT2IRHvRXtDfvmuwDu
	 2IzzEQ2IigZGyfLBke7g2hs54Z11+jJf2R9SA5y1sesqjp/7gyNHKFLo15nT9Zs3gY
	 L/U9FpZkjEeFr88f507IYACaz5VwKvJYylk0v4D5imc4HpR1ovbVo7JVIfh5bWFMQG
	 ZF4h0jlkGb+omL+1FqdzNgoW4nCOiOO5YEfpbK7oObwV61cKXN2JjHR0HGDvYowtz1
	 R5yQVCS0nukgQ==
Date: Fri, 8 Oct 2021 17:37:30 -0700 (PDT)
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
    David Scott <dave@recoil.org>
Subject: Re: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
In-Reply-To: <20211008081933.18546-2-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2110081724400.25528@sstabellini-ThinkPad-T480s>
References: <20211008081933.18546-1-michal.orzel@arm.com> <20211008081933.18546-2-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Oct 2021, Michal Orzel wrote:
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
> 
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly use (1<<6)
> instead of (1u<<6).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Aside from the minor style issue Jan pointed out:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v2:
> -do not define bit position and mask separately
> Changes since v1:
> -new in v2
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
>  xen/include/public/sysctl.h          | 6 ++++--
>  xen/include/xen/domain.h             | 2 ++
>  12 files changed, 27 insertions(+), 4 deletions(-)
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
> index 039ccf885c..b794c9d351 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,10 +100,12 @@ struct xen_sysctl_tbuf_op {
>  #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>  #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>      (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
> -#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1u<<6)
> +/* The platform supports vPMU. */
> +#define XEN_SYSCTL_PHYSCAP_vpmu          (1u<<7)
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

