Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239EAC98B1
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001766.1381885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAVf-0000Ju-2c; Sat, 31 May 2025 00:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001766.1381885; Sat, 31 May 2025 00:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAVf-0000HA-01; Sat, 31 May 2025 00:55:39 +0000
Received: by outflank-mailman (input) for mailman id 1001766;
 Sat, 31 May 2025 00:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAVd-0000H4-FB
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:55:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f07b0ee9-3db9-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 02:55:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 704164A322;
 Sat, 31 May 2025 00:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834EFC4CEEB;
 Sat, 31 May 2025 00:55:23 +0000 (UTC)
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
X-Inumbo-ID: f07b0ee9-3db9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652925;
	bh=AGzpspSlrGYs7O09bZXm7XNixHEROU6oB55p3C+UMSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iIj+ZRyLPZ0+U7svoGlZG2mIkaXp05agAhhbQX5dbFNztvXMivHWZ+UAK6JxJf3MW
	 s8XLVB6s0lIbBUWAVnTutYDVpuElTYy8rHC1FnhYhuCNCpu1evYyGeHTBW8fqZ2nRY
	 CuU2+YKFxZ978A8jYqmpn6UVimyvwTCNkVMPXDiauGhM6gZNG/slPVMufEeGLq7ZhM
	 4QJBUCW9nmvGNP/E9qcJ40wB285y0aoQy2GW/Xr7/6wdxkd3job6BEvFTqq/GZKePH
	 OODlJxbu2R8MKz4U4hBjNn2TUmNtQdjD5MIj/W+VFx8pHgEXQDigAzrhkIVqmFxEL6
	 NvKge+0EvJjiA==
Date: Fri, 30 May 2025 17:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
In-Reply-To: <20250530120242.39398-7-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301755080.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-7-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> There's some pretense this header may be used without
> CONFIG_HAS_DEVICE_TREE, but that's just wishful thinking. Only x86 lacks
> that option, and it fully overrides this header, typedeffing struct
> pci_dev to be device_t.
> 
> Furthermore there's an include for xen/device_tree.h halfway through the
> header, but that header already includes asm/device.h, creating a cycle.
> 
> Clean up the header removing ifdef guards, merging the typedef onto the
> struct definition for device_t and removing the spurious include.
> 
> The only affected file is aplic.c, in riscv, which is forced now to
> include device_tree.h directly.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/riscv/aplic.c           |  3 ++-
>  xen/include/asm-generic/device.h | 18 ++----------------
>  2 files changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index caba8f8993..90bf222eeb 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,12 +9,13 @@
>   * Copyright (c) 2024-2025 Vates
>   */
>  
> +#include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/lib.h>
>  #include <xen/sections.h>
>  #include <xen/types.h>
>  
> -#include <asm/device.h>
>  #include <asm/intc.h>
>  
>  static struct intc_info __ro_after_init aplic_info = {
> diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
> index 1acd1ba1d8..d485fb97dc 100644
> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -6,9 +6,7 @@
>  
>  enum device_type
>  {
> -#ifdef CONFIG_HAS_DEVICE_TREE
>      DEV_DT,
> -#endif
>      DEV_PCI
>  };
>  
> @@ -23,23 +21,15 @@ enum device_class
>  };
>  
>  /* struct device - The basic device structure */
> -struct device
> +typedef struct device
>  {
>      enum device_type type;
> -#ifdef CONFIG_HAS_DEVICE_TREE
>      struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> -#endif
>  #ifdef CONFIG_HAS_PASSTHROUGH
>      void *iommu; /* IOMMU private data */;
>      struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
>  #endif
> -};
> -
> -typedef struct device device_t;
> -
> -#ifdef CONFIG_HAS_DEVICE_TREE
> -
> -#include <xen/device_tree.h>
> +} device_t;
>  
>  #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
>  
> @@ -87,10 +77,6 @@ struct device_desc {
>      int (*init)(struct dt_device_node *dev, const void *data);
>  };
>  
> -#else /* !CONFIG_HAS_DEVICE_TREE */
> -#define dev_is_dt(dev) ((void)(dev), false)
> -#endif /* CONFIG_HAS_DEVICE_TREE */
> -
>  #define dev_is_pci(dev) ((dev)->type == DEV_PCI)
>  
>  #ifdef CONFIG_ACPI
> -- 
> 2.43.0
> 

