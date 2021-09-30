Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6841E486
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 01:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200291.354766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW52X-0005tp-00; Thu, 30 Sep 2021 23:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200291.354766; Thu, 30 Sep 2021 23:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW52W-0005r9-T9; Thu, 30 Sep 2021 23:00:32 +0000
Received: by outflank-mailman (input) for mailman id 200291;
 Thu, 30 Sep 2021 23:00:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2g57=OU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW52V-0005r3-NQ
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 23:00:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45095e8e-9b47-42ad-9d34-1e32da525be5;
 Thu, 30 Sep 2021 23:00:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFEEE61A54;
 Thu, 30 Sep 2021 23:00:28 +0000 (UTC)
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
X-Inumbo-ID: 45095e8e-9b47-42ad-9d34-1e32da525be5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633042829;
	bh=92bS3ks99WIDwuP8LmBEJKsSjScFwmh1i0p2cuLpP4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UMesJHxS0qQuToJVR/oT7qcwXlJm4ucSb/7sj44hvjDmBvBspr9b+xjcSGIAtFp9t
	 cJ7D5bUADoSfPTFhRIkJbtCH4YUXsWPUvaWgtbuwH5Qifw3J6IQy2HDmEh9h/awuly
	 DyeBP+r415H/peHrxK4S+ipAHiZmTUn83M1jdfD7tHCyBqsWeFAhESnrOor5G/bOC9
	 g3uyfEKzM8ycJTmLygmxtJGjoC78hVpNVx6kfTmXjDiVwDed0x7KznxIl7lDa7NGUU
	 6NA99boXEhItuCwm00dZ2ZXmk11/oBTAA5FXVUyZnWKVGrXq+4o6WFpBkUGGoYUbpc
	 O1DPpLxew1ntw==
Date: Thu, 30 Sep 2021 16:00:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
In-Reply-To: <1632955927-27911-2-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com> <1632955927-27911-2-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to pass info about maximum supported guest address
> space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequents
> patch.
> 
> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
> hap_paddr_bits.
> 
> As we change the size of structure bump the interface version.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, that review comments for the RFC version [1] haven't been addressed yet.
> It is not forgotten, some clarification is needed. It will be addressed for the next version.
> 
> [1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
> 
> Changes RFC -> V2:
>    - update patch subject/description
>    - replace arch-specific sub-struct with common gpaddr_bits
>      field and update code to reflect that
> 
> Changes V2 -> V3:
>    - make the field uint8_t and add uint8_t pad[7] after
>    - remove leading blanks in libxl.h
> 
> Changes V3 -> V4:
>    - also print gpaddr_bits from output_physinfo()
>    - add Michal's R-b
> ---
>  tools/include/libxl.h            | 7 +++++++
>  tools/libs/light/libxl.c         | 2 ++
>  tools/libs/light/libxl_types.idl | 2 ++
>  tools/xl/xl_info.c               | 2 ++
>  xen/arch/arm/sysctl.c            | 2 ++
>  xen/arch/x86/sysctl.c            | 2 ++
>  xen/include/public/sysctl.h      | 4 +++-
>  7 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d..63f9550 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -856,6 +856,13 @@ typedef struct libxl__ctx libxl_ctx;
>  #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
>  
>  /*
> + * LIBXL_HAVE_PHYSINFO_GPADDR_BITS
> + *
> + * If this is defined, libxl_physinfo has a "gpaddr_bits" field.
> + */
> +#define LIBXL_HAVE_PHYSINFO_GPADDR_BITS 1
> +
> +/*
>   * LIBXL_HAVE_DOMINFO_OUTSTANDING_MEMKB 1
>   *
>   * If this is defined, libxl_dominfo will contain a MemKB type field called
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 204eb0b..c86624f 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -405,6 +405,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_vmtrace =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
>  
> +    physinfo->gpaddr_bits = xcphysinfo.gpaddr_bits;
> +
>      GC_FREE;
>      return 0;
>  }
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff6..bf27fe6 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1061,6 +1061,8 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_shadow", bool),
>      ("cap_iommu_hap_pt_share", bool),
>      ("cap_vmtrace", bool),
> +
> +    ("gpaddr_bits", uint8),
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 8383e4a..dfbbeaa 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -221,6 +221,8 @@ static void output_physinfo(void)
>           info.cap_vmtrace ? " vmtrace" : ""
>          );
>  
> +    maybe_printf("gpaddr_bits            : %d\n", info.gpaddr_bits);
> +
>      vinfo = libxl_get_version_info(ctx);
>      if (vinfo) {
>          i = (1 << 20) / vinfo->pagesize;
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index f87944e..91dca4f 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,6 +15,8 @@
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> +
> +    pi->gpaddr_bits = p2m_ipa_bits;
>  }
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index aff52a1..7b14865 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -135,6 +135,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
> +
> +    pi->gpaddr_bits = hap_paddr_bits;
>  }
>  
>  long arch_do_sysctl(
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 039ccf8..0450a78 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>  #include "domctl.h"
>  #include "physdev.h"
>  
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
>  
>  /*
>   * Read console content from Xen buffer ring.
> @@ -120,6 +120,8 @@ struct xen_sysctl_physinfo {
>      uint64_aligned_t outstanding_pages;
>      uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
>      uint32_t hw_cap[8];
> +    uint8_t gpaddr_bits;
> +    uint8_t pad[7];
>  };
>  
>  /*
> -- 
> 2.7.4
> 

