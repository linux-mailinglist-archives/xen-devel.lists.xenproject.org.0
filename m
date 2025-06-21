Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED69AE26E0
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 03:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021436.1397434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSnIe-0006Tp-8G; Sat, 21 Jun 2025 01:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021436.1397434; Sat, 21 Jun 2025 01:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSnIe-0006Ro-5I; Sat, 21 Jun 2025 01:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1021436;
 Sat, 21 Jun 2025 01:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSnIc-0006Ri-Vy
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 01:45:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e8b83ea-4e41-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 03:45:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 229CA5C4B0E;
 Sat, 21 Jun 2025 01:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8205C4CEE3;
 Sat, 21 Jun 2025 01:45:35 +0000 (UTC)
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
X-Inumbo-ID: 6e8b83ea-4e41-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750470337;
	bh=B05BnrrnHkToI2xcJNO3aBbCs9U0bPLSSbH1/6h83is=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBGfSFl2Owv60UpdS5wtUkZcsRJXak2aVrYDqkyZDkZUMXY7525A4LfimSf7HxuwI
	 4sWr85SelienwDUKL6uul8lVpDkhqTdNPG/RDNTAi5l5PR9V2aYf+3xKS/dlTzfGus
	 wr8fPPK4L8euXSdtcMPknsjo0o7UlL+ambY2kGMJ+awSgCKvRCozYLtxRDF+fKA9FN
	 VmvYc30IasJwaJR4gPd0fSiXhDPHyJGU36LSG7Mh35t0zRzQ/yfspYz4zcT+4FFGwD
	 Ozg1jB2kCkpitArDgTe45t26hErK3SD536ptlrAwvH6+mgOg44IQZAz9IRjWDry/Ru
	 fV1iO+2A2wx5A==
Date: Fri, 20 Jun 2025 18:45:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 12/12] xen/dt: Remove DOM0LESS_BOOT's requirement on
 HAS_DEVICE_TREE_DISCOVERY
In-Reply-To: <20250620182859.23378-13-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201835410.2978375@ubuntu-linux-20-04-desktop>
References: <20250620182859.23378-1-agarciav@amd.com> <20250620182859.23378-13-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Alejandro Vallejo wrote:
> This effectively means that DOM0LESS_BOOT on platforms without
> HAS_DEVICE_TREE_DISCOVERY (i.e: x86) acts as a selector for a
> stripped-down version of DT code.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

This is so much better than before. Thank you and all the reviewers for
making the integration so much smoother. This patch is so much simpler
and readable compared to before.

I think we need to plan for renaming DOM0LESS_BOOT into something
better, such as PREDEFINED_DOMS, but I would keep it as a separate
patch in any case. So I think this is OK for now.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/Kconfig.debug               | 2 +-
>  xen/common/Kconfig              | 3 ++-
>  xen/common/Makefile             | 1 +
>  xen/common/device-tree/Makefile | 8 ++++----
>  4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 9192d593a7..89b0af53a2 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -92,7 +92,7 @@ config VERBOSE_DEBUG
>  
>  config DEVICE_TREE_DEBUG
>  	bool "Device tree debug messages"
> -	depends on HAS_DEVICE_TREE_DISCOVERY
> +	depends on DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY
>  	help
>  	  Device tree parsing and DOM0 device tree building messages are
>  	  logged in the Xen ring buffer.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 6294cd7939..1ac28a4e78 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -14,7 +14,8 @@ config CORE_PARKING
>  
>  config DOM0LESS_BOOT
>  	bool "Dom0less boot support" if EXPERT
> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS
> +	select LIBFDT
> +	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
>  	default y
>  	help
>  	  Dom0less boot support enables Xen to create and start domU guests during
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index d541fbcf49..19d6ff7a90 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
> +obj-$(CONFIG_DOM0LESS_BOOT) += device-tree/

nice trick


>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
>  obj-y += event_2l.o
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 8abc069c4b..4a10b0508f 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,11 +1,11 @@
>  obj-y += bootfdt.init.o
> -obj-y += bootinfo-fdt.init.o
> -obj-y += bootinfo.init.o
> -obj-y += device-tree.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> -obj-y += intc.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
> -- 
> 2.43.0
> 

