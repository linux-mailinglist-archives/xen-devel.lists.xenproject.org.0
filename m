Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18165ACBD6F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003851.1383466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDri-0002k8-1m; Mon, 02 Jun 2025 22:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003851.1383466; Mon, 02 Jun 2025 22:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDrh-0002i8-VP; Mon, 02 Jun 2025 22:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1003851;
 Mon, 02 Jun 2025 22:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMDrg-0002i2-HH
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:42:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e44a6792-4002-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 00:42:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8719143849;
 Mon,  2 Jun 2025 22:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036B3C4CEEB;
 Mon,  2 Jun 2025 22:42:38 +0000 (UTC)
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
X-Inumbo-ID: e44a6792-4002-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748904160;
	bh=B4MssjLYag38aM6Ga7iI+dTTlyBcVAhFL/tHSZZHnrE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u0U08PcgJODV1ATxoPQ1Wgwx/q8vHKVr1B0pW4scyveF5ZueiiTwm77Q7QiwRP+Mx
	 tEqrCW3BjmwfcqG4ATHgH1BGT7h1awRm/9vbB2mSHijbbRstQ53RQfkQauMZdBl3G5
	 0/2Y4NIYe6yyTMy/tNbNtdTBPd8TGDU16z5KPnvYl2mrQ30JFdqLISQj9U5qVMq0ib
	 N5J5V80N6bNRLKqqKBJgaS4FagIOKKZ0Vnv0/CA2x6/6YDFxvNKNyMVchwIRxizPKa
	 7tTYqSa0JUcW7Libm0Ba4zlYvPsM3LZO1EzP87LyieUYGqgKFXFt5p5qquEt5RgJ1j
	 MQuoNBrcb70/g==
Date: Mon, 2 Jun 2025 15:42:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, edgar.iglesias@amd.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/5] tools/arm: Add the trap_unmapped_accesses xl
 config option
In-Reply-To: <20250530134559.1434255-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506021542290.1147082@ubuntu-linux-20-04-desktop>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com> <20250530134559.1434255-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/man/xl.cfg.5.pod.in         | 9 +++++++++
>  tools/libs/light/libxl_arm.c     | 6 +++---
>  tools/libs/light/libxl_create.c  | 3 +++
>  tools/libs/light/libxl_types.idl | 1 +
>  tools/libs/light/libxl_x86.c     | 6 ++++++
>  tools/xl/xl_parse.c              | 3 +++
>  6 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 7339c44efd..6c303e8efa 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3089,6 +3089,15 @@ will be used for the domain. Otherwise, the value specified by the `nr_spis`
>  parameter will be used. The number of SPIs should match the highest interrupt
>  ID that will be assigned to the domain.
>  
> +=item B<trap_unmapped_accesses=BOOLEAN>
> +
> +An Optional boolean parameter that configures handling of accesses to unmapped
> +address ranges. If enabled, guest accesses will trap. If disabled, guest
> +accesses will read all bits as ones, e.g 0xFFFFFFFF for a 32bit access and
> +writes will be ignored.
> +
> +This option is only implemented for ARM where the default is enabled.
> +
>  =back
>  
>  =head3 x86
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 9530996e72..afc62a5299 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -233,9 +233,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>      }
>  
> -    /* Trap accesses to unmapped areas. */
> -    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> -
>      return 0;
>  }
>  
> @@ -1714,6 +1711,9 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
>  
> +    /* Trapping of unmapped accesses enabled by default.  */
> +    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
> +
>      /* Sanitise SVE parameter */
>      if (b_info->arch_arm.sve_vl) {
>          unsigned int max_sve_vl =
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e03599ea99..38770eea5b 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -667,6 +667,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>          if (libxl_defbool_val(b_info->vpmu))
>              create.flags |= XEN_DOMCTL_CDF_vpmu;
>  
> +        if (libxl_defbool_val(b_info->trap_unmapped_accesses))
> +            create.flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +
>          assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
>          LOG(DETAIL, "passthrough: %s",
>              libxl_passthrough_to_string(info->passthrough));
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 9bb2969931..e33785c661 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -736,6 +736,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("vmtrace_buf_kb", integer),
>  
>      ("vpmu", libxl_defbool),
> +    ("trap_unmapped_accesses", libxl_defbool),
>  
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 0b1c2d3a96..a9d470c9f6 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -26,6 +26,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
> +            LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n");
> +            return ERROR_FAIL;
> +    }
> +
>      return 0;
>  }
>  
> @@ -813,6 +818,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
>  
>      /*
>       * The config parameter "altp2m" replaces the parameter "altp2mhvm".
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 089a88935a..40da75ef74 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2975,6 +2975,9 @@ skip_usbdev:
>      if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
>          b_info->arch_arm.nr_spis = l;
>  
> +    xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
> +                        &b_info->trap_unmapped_accesses, 0);
> +
>      parse_vkb_list(config, d_config);
>  
>      d_config->virtios = NULL;
> -- 
> 2.43.0
> 

