Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06825AC7550
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 03:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999741.1380360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRuL-000608-Nv; Thu, 29 May 2025 01:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999741.1380360; Thu, 29 May 2025 01:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRuL-0005xK-L6; Thu, 29 May 2025 01:18:09 +0000
Received: by outflank-mailman (input) for mailman id 999741;
 Thu, 29 May 2025 01:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKRuK-0005xC-Rn
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 01:18:08 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c62a66c4-3c2a-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 03:18:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 86729A4FAC9;
 Thu, 29 May 2025 01:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6E9C4CEE3;
 Thu, 29 May 2025 01:18:03 +0000 (UTC)
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
X-Inumbo-ID: c62a66c4-3c2a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748481485;
	bh=57RV3E5A42JGW6ivfifoP2OnwOh3Jp0JTfPxBr5ZSVQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eHYLX4LY67IpYVn3fG7Wfmn0mbO/0Y53eD2GwZ9vlVqCU/v61DlzalPMkSwQGUMGk
	 neFtVuy/YO//zajbCA8rBMLIdCBJ/1yus1KPIvTJPrkRwab8gLGm8nX6C6M3bF6ONl
	 EtsyZ7UWmB5CP+pA5KhFhzYRyUGxD59ZPLKQWqoK/FxG4GQKQB/zhS4LZ8BQp76ur3
	 MvfbIQcM6cRo6/q/3Zcr6zB2zZl9dFphLTO3UfceqEKKVCMpAivcbi5SRBDo01ivZo
	 hgejAnjb/qvveATUdkClg0khUxAIE0avmEvio9s4Jgf4bVqtBBX8v9q/2iG65iF1QF
	 mBOGlFNl5hjgg==
Date: Wed, 28 May 2025 18:18:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to
 common
In-Reply-To: <20250527082117.120214-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505281817560.135336@ubuntu-linux-20-04-desktop>
References: <20250527082117.120214-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Michal Orzel wrote:
> There's nothing Arm specific about this feature. Move it to common as
> part of a larger activity to commonalize device tree related features.
> For now, select it only for ARM until others (e.g. RISC-V) verify it
> works for them too.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Other candidates: static memory, shared memory
> ---
>  xen/arch/arm/Kconfig                                      | 8 --------
>  xen/arch/arm/Makefile                                     | 1 -
>  xen/arch/arm/setup.c                                      | 2 +-
>  xen/common/Kconfig                                        | 8 ++++++++
>  xen/common/device-tree/Makefile                           | 1 +
>  xen/{arch/arm => common/device-tree}/static-evtchn.c      | 3 +--
>  xen/{arch/arm/include/asm => include/xen}/static-evtchn.h | 6 +++---
>  7 files changed, 14 insertions(+), 15 deletions(-)
>  rename xen/{arch/arm => common/device-tree}/static-evtchn.c (99%)
>  rename xen/{arch/arm/include/asm => include/xen}/static-evtchn.h (77%)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a5aad97a688e..57919d8b3ac8 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -253,14 +253,6 @@ config STATIC_SHM
>  	help
>  	  This option enables statically shared memory on a dom0less system.
>  
> -config STATIC_EVTCHN
> -	bool "Static event channel support on a dom0less system"
> -	depends on DOM0LESS_BOOT
> -	default y
> -	help
> -	  This option enables establishing static event channel communication
> -	  between domains on a dom0less system (domU-domU as well as domU-dom0).
> -
>  config PARTIAL_EMULATION
>  	bool "Enable partial emulation of system/coprocessor registers"
>  	default y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 129a109d6ec5..eeeac4e653ec 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -51,7 +51,6 @@ obj-y += setup.o
>  obj-y += shutdown.o
>  obj-y += smp.o
>  obj-y += smpboot.o
> -obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
>  obj-y += sysctl.o
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 10b46d068405..734e23da4408 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -31,6 +31,7 @@
>  #include <xen/version.h>
>  #include <xen/vmap.h>
>  #include <xen/stack-protector.h>
> +#include <xen/static-evtchn.h>
>  #include <xen/trace.h>
>  #include <xen/libfdt/libfdt-xen.h>
>  #include <xen/acpi.h>
> @@ -39,7 +40,6 @@
>  #include <asm/alternative.h>
>  #include <asm/dom0less-build.h>
>  #include <asm/page.h>
> -#include <asm/static-evtchn.h>
>  #include <asm/current.h>
>  #include <asm/setup.h>
>  #include <asm/gic.h>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 3d66d0939738..0951d4c2f286 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>  
>  	  If unsure, say N.
>  
> +config STATIC_EVTCHN
> +	bool "Static event channel support on a dom0less system"
> +	depends on DOM0LESS_BOOT && ARM
> +	default y
> +	help
> +	  This option enables establishing static event channel communication
> +	  between domains on a dom0less system (domU-domU as well as domU-dom0).
> +
>  menu "Speculative hardening"
>  
>  config INDIRECT_THUNK
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 831b91399b74..2df7eb27222e 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
> +obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
> diff --git a/xen/arch/arm/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
> similarity index 99%
> rename from xen/arch/arm/static-evtchn.c
> rename to xen/common/device-tree/static-evtchn.c
> index 49db08d5c6fc..8b82e6b3d8a6 100644
> --- a/xen/arch/arm/static-evtchn.c
> +++ b/xen/common/device-tree/static-evtchn.c
> @@ -1,8 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/event.h>
> -
> -#include <asm/static-evtchn.h>
> +#include <xen/static-evtchn.h>
>  
>  #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
>  
> diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/include/xen/static-evtchn.h
> similarity index 77%
> rename from xen/arch/arm/include/asm/static-evtchn.h
> rename to xen/include/xen/static-evtchn.h
> index f964522f6a62..31ae92741aad 100644
> --- a/xen/arch/arm/include/asm/static-evtchn.h
> +++ b/xen/include/xen/static-evtchn.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#ifndef __ASM_STATIC_EVTCHN_H_
> -#define __ASM_STATIC_EVTCHN_H_
> +#ifndef XEN_STATIC_EVTCHN_H
> +#define XEN_STATIC_EVTCHN_H
>  
>  #ifdef CONFIG_STATIC_EVTCHN
>  
> @@ -13,7 +13,7 @@ static inline void alloc_static_evtchn(void) {};
>  
>  #endif /* CONFIG_STATIC_EVTCHN */
>  
> -#endif /* __ASM_STATIC_EVTCHN_H_ */
> +#endif /* XEN_STATIC_EVTCHN_H */
>  
>  /*
>   * Local variables:
> -- 
> 2.25.1
> 

