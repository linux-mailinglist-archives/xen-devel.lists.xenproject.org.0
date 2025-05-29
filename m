Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9ABAC7526
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999691.1380320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRL3-0000M5-90; Thu, 29 May 2025 00:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999691.1380320; Thu, 29 May 2025 00:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRL3-0000JT-6Q; Thu, 29 May 2025 00:41:41 +0000
Received: by outflank-mailman (input) for mailman id 999691;
 Thu, 29 May 2025 00:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKRL2-0000JN-E4
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:41:40 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada76993-3c25-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 02:41:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8E0D44ECF;
 Thu, 29 May 2025 00:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664CBC4CEE3;
 Thu, 29 May 2025 00:41:35 +0000 (UTC)
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
X-Inumbo-ID: ada76993-3c25-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748479296;
	bh=ur7Sj8+z5iqkjlIcrw+vBOtDLzll8ASJfxE6g/Urfjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=clfftEDFxTEd3qo+DVbp1lm+yrcewfjdWF8ZCWhc4l4/V60lM3jkI4TS5Hvi3MEpd
	 fkz/w3xwUCb3DhPFTKBvHZpslB4e+T0ZoPmLCMOhIVCCN1ZbQVIoejaqN0+tOmbiys
	 VCFe2o24wv43hUGyv9jwrh/fAfcwlmaLoUuQuoATNY2GmkFKde4OpivA73gUQFWIaZ
	 wHJ/8q8/YCRdtppypRkMKJsxrvIJAyyPn6xbWsvqcO0tEdTgIaOaKI9tcuEICWSNHn
	 oDJXvaI7xYBPZ5eIqMb3EBFS6YMJEbprUCaeebm4e+jmqccu9LUfJuBWOL/+VQVJJJ
	 GDu0r6aHTV4zA==
Date: Wed, 28 May 2025 17:41:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    edgar.iglesias@amd.com
Subject: Re: [PATCH v1 2/3] xen/arm: dom0less: Add
 trap-unmapped-mmio-disabled
In-Reply-To: <20250527195616.874614-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505281736340.135336@ubuntu-linux-20-04-desktop>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com> <20250527195616.874614-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add the trap-unmapped-mmio-disabled per-domain fdt property.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 7 +++++++
>  xen/arch/arm/dom0less-build.c         | 3 ++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 59fa96a82e..75fbb245d1 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -225,6 +225,13 @@ with the following properties:
>      option is provided with a non zero value, but the platform doesn't support
>      SVE.
>  
> +- trap-unmapped-mmio-disabled
> +
> +    Optional. A boolean property that configures handling of accesses to
> +    unmapped MMIO ranges.
> +    If set, guest accesses will read 0xFFFFFFFF and writes ignored.
> +    If not set, guest accesses will trap.

I would prefer that we are consistent with the name of the parameter we
use in libxl and elsewhere so I would stick with trap-unmapped-mmio
without -disabled.

We can still default the property to "enabled" when absent. Although
this is not a common pattern for device tree, it happens and for
instance the property "status" works that way as it is implied to be
"enabled" when absent.


>  - xen,enhanced
>  
>      A string property. Possible property values are:
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index e5e13e07d0..cd1ef05d89 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -344,8 +344,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
>  #endif
>      }
>  
> -    /* Trap accesses to unmapped MMIO. */
>      d_cfg->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
> +    if ( dt_property_read_bool(node, "trap-unmapped-mmio-disabled") )
> +        d_cfg->arch.flags &= ~XEN_ARM_TRAP_UNMAPPED_MMIO;
>  }
>  
>  int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> -- 
> 2.43.0
> 

