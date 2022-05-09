Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B127F5206BD
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 23:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324823.547090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noB66-00082z-7L; Mon, 09 May 2022 21:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324823.547090; Mon, 09 May 2022 21:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noB66-0007zg-3b; Mon, 09 May 2022 21:39:18 +0000
Received: by outflank-mailman (input) for mailman id 324823;
 Mon, 09 May 2022 21:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1noB64-0007ym-9u
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 21:39:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7865f89e-cfe0-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 23:39:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0D8E61746;
 Mon,  9 May 2022 21:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EC9C385BA;
 Mon,  9 May 2022 21:39:12 +0000 (UTC)
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
X-Inumbo-ID: 7865f89e-cfe0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132353;
	bh=H2dwaPwrXL4nxxXBdrMYB4OYXvEzLLPVoM3JTYQ5/l8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Me4tlFG4jGnLbuMeyoXfSkn5ct7XSBu3oHjHxskr6Fpm7aFmYoNMlvHM6QLhqvMbc
	 tPpOOo4ntqvnBaahgw60upteBF05PNLgjTAaVZ2BBJHkP+xenkUOZG5P9BVoZqmJ4V
	 6QXU5VSj2B6uogMr4U+u4JWx4vTnEhF0hoVHBGXueVpLhsyHQj3wTA70E/R0ZcRCCw
	 jWBsrRIBUu6+2LgYxAeipVJBCaiFtAaq9O3LEtz5tnxSAhfRpuUoT4x8BZHKQkamXy
	 ZgZ5DkQWP2ewyhCNgnsUHZxThyGny2cUFN7u3HrvAbNSua7hViTu0JF2ItIrLlX8Ol
	 feJ9kW4H8CUWw==
Date: Mon, 9 May 2022 14:39:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Julien Grall <julien@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 4/7] xen/virtio: Enable restricted memory access using
 Xen grant mappings
In-Reply-To: <1651947548-4055-5-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205091426080.43560@ubuntu-linux-20-04-desktop>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com> <1651947548-4055-5-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 May 2022, Oleksandr Tyshchenko wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> In order to support virtio in Xen guests add a config option XEN_VIRTIO
> enabling the user to specify whether in all Xen guests virtio should
> be able to access memory via Xen grant mappings only on the host side.
> 
> Also set PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS feature from the guest
> initialization code on Arm and x86 if CONFIG_XEN_VIRTIO is enabled.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The patch looks OK to me

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes V1 -> V2:
>    - new patch, split required changes from commit:
>     "[PATCH V1 3/6] xen/virtio: Add option to restrict memory access under Xen"
>    - rework according to new platform_has() infrastructure
> ---
>  arch/arm/xen/enlighten.c     |  2 ++
>  arch/x86/xen/enlighten_hvm.c |  2 ++
>  arch/x86/xen/enlighten_pv.c  |  2 ++
>  drivers/xen/Kconfig          | 11 +++++++++++
>  include/xen/xen.h            |  8 ++++++++
>  5 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 07eb69f..1f9c3ba 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -443,6 +443,8 @@ static int __init xen_guest_init(void)
>  	if (!xen_domain())
>  		return 0;
>  
> +	xen_set_restricted_virtio_memory_access();
> +
>  	if (!acpi_disabled)
>  		xen_acpi_guest_init();
>  	else
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index 517a9d8..8b71b1d 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -195,6 +195,8 @@ static void __init xen_hvm_guest_init(void)
>  	if (xen_pv_domain())
>  		return;
>  
> +	xen_set_restricted_virtio_memory_access();
> +
>  	init_hvm_pv_info();
>  
>  	reserve_shared_info();
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 5038edb..fcd5d5d 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -109,6 +109,8 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
>  
>  static void __init xen_pv_init_platform(void)
>  {
> +	xen_set_restricted_virtio_memory_access();
> +
>  	populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
>  
>  	set_fixmap(FIX_PARAVIRT_BOOTMAP, xen_start_info->shared_info);
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 313a9127..a7bd8ce 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -339,4 +339,15 @@ config XEN_GRANT_DMA_OPS
>  	bool
>  	select DMA_OPS
>  
> +config XEN_VIRTIO
> +	bool "Xen virtio support"
> +	depends on VIRTIO
> +	select XEN_GRANT_DMA_OPS
> +	help
> +	  Enable virtio support for running as Xen guest. Depending on the
> +	  guest type this will require special support on the backend side
> +	  (qemu or kernel, depending on the virtio device types used).
> +
> +	  If in doubt, say n.
> +
>  endmenu
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index a99bab8..0780a81 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -52,6 +52,14 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
>  extern u64 xen_saved_max_mem_size;
>  #endif
>  
> +#include <linux/platform-feature.h>
> +
> +static inline void xen_set_restricted_virtio_memory_access(void)
> +{
> +	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
> +		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
> +}
> +
>  #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>  int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>  void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);

