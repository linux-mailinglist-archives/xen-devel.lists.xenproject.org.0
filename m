Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C2539A4D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 02:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340075.565016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwBzm-00043U-4h; Wed, 01 Jun 2022 00:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340075.565016; Wed, 01 Jun 2022 00:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwBzm-00041e-1C; Wed, 01 Jun 2022 00:13:54 +0000
Received: by outflank-mailman (input) for mailman id 340075;
 Wed, 01 Jun 2022 00:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwBzj-00041Y-LI
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 00:13:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5739779-e13f-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 02:13:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFF73614B3;
 Wed,  1 Jun 2022 00:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE4CC385A9;
 Wed,  1 Jun 2022 00:13:46 +0000 (UTC)
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
X-Inumbo-ID: b5739779-e13f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654042427;
	bh=ag10k4hTWze4mXNm0kqpInGHiNKVLfIEVeWL4b/oXgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z2WeFA4UGgGptD+7wpRGoVF54rYcHzOPQ+lfrfARxTA+9BO1Nfs2X2fsLZcGKXyYv
	 /5VIpDRuuPWM/tuvb0qfvzFJQ9DGWeex0cOZLWuQRuXg9Gwp5hSFNxemvc4s2nqWNN
	 48fupsDfSuYpTwgoui1FjV9yorfHLJz2LQNUDo9X91a96YA90p9YLWRh2c9XqmBgdA
	 SGGF2SRaXpeNfbFudvCHNkcpoI1NcFoihviHfUFOaXNfAk8DvhFabPY7bGfzWUaj+C
	 EFDnmdepE3x0mLVq76l2UV8vDlOA7cXgoKCbHX2bs01COt895xzl0h1B/KGDNJ3y20
	 /B9yx+fQs7Qxw==
Date: Tue, 31 May 2022 17:13:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] xen: replace xen_remap() with memremap()
In-Reply-To: <20220530082634.6339-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205311713270.1905099@ubuntu-linux-20-04-desktop>
References: <20220530082634.6339-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 May 2022, Juergen Gross wrote:
> xen_remap() is used to establish mappings for frames not under direct
> control of the kernel: for Xenstore and console ring pages, and for
> grant pages of non-PV guests.
> 
> Today xen_remap() is defined to use ioremap() on x86 (doing uncached
> mappings), and ioremap_cache() on Arm (doing cached mappings).
> 
> Uncached mappings for those use cases are bad for performance, so they
> should be avoided if possible. As all use cases of xen_remap() don't
> require uncached mappings (the mapped area is always physical RAM),
> a mapping using the standard WB cache mode is fine.
> 
> As sparse is flagging some of the xen_remap() use cases to be not
> appropriate for iomem(), as the result is not annotated with the
> __iomem modifier, eliminate xen_remap() completely and replace all
> use cases with memremap() specifying the MEMREMAP_WB caching mode.
> 
> xen_unmap() can be replaced with memunmap().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/include/asm/xen/page.h   | 3 ---
>  drivers/tty/hvc/hvc_xen.c         | 2 +-
>  drivers/xen/grant-table.c         | 6 +++---
>  drivers/xen/xenbus/xenbus_probe.c | 8 ++++----
>  include/xen/arm/page.h            | 3 ---
>  5 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
> index 1fc67df50014..fa9ec20783fa 100644
> --- a/arch/x86/include/asm/xen/page.h
> +++ b/arch/x86/include/asm/xen/page.h
> @@ -347,9 +347,6 @@ unsigned long arbitrary_virt_to_mfn(void *vaddr);
>  void make_lowmem_page_readonly(void *vaddr);
>  void make_lowmem_page_readwrite(void *vaddr);
>  
> -#define xen_remap(cookie, size) ioremap((cookie), (size))
> -#define xen_unmap(cookie) iounmap((cookie))
> -
>  static inline bool xen_arch_need_swiotlb(struct device *dev,
>  					 phys_addr_t phys,
>  					 dma_addr_t dev_addr)
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index ebaf7500f48f..7c23112dc923 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -253,7 +253,7 @@ static int xen_hvm_console_init(void)
>  	if (r < 0 || v == 0)
>  		goto err;
>  	gfn = v;
> -	info->intf = xen_remap(gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE);
> +	info->intf = memremap(gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE, MEMREMAP_WB);
>  	if (info->intf == NULL)
>  		goto err;
>  	info->vtermno = HVC_COOKIE;
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 1a1aec0a88a1..2f4f0ed5d8f8 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -632,7 +632,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
>  	if (xen_auto_xlat_grant_frames.count)
>  		return -EINVAL;
>  
> -	vaddr = xen_remap(addr, XEN_PAGE_SIZE * max_nr_gframes);
> +	vaddr = memremap(addr, XEN_PAGE_SIZE * max_nr_gframes, MEMREMAP_WB);
>  	if (vaddr == NULL) {
>  		pr_warn("Failed to ioremap gnttab share frames (addr=%pa)!\n",
>  			&addr);
> @@ -640,7 +640,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
>  	}
>  	pfn = kcalloc(max_nr_gframes, sizeof(pfn[0]), GFP_KERNEL);
>  	if (!pfn) {
> -		xen_unmap(vaddr);
> +		memunmap(vaddr);
>  		return -ENOMEM;
>  	}
>  	for (i = 0; i < max_nr_gframes; i++)
> @@ -659,7 +659,7 @@ void gnttab_free_auto_xlat_frames(void)
>  	if (!xen_auto_xlat_grant_frames.count)
>  		return;
>  	kfree(xen_auto_xlat_grant_frames.pfn);
> -	xen_unmap(xen_auto_xlat_grant_frames.vaddr);
> +	memunmap(xen_auto_xlat_grant_frames.vaddr);
>  
>  	xen_auto_xlat_grant_frames.pfn = NULL;
>  	xen_auto_xlat_grant_frames.count = 0;
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index d367f2bd2b93..58b732dcbfb8 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -752,8 +752,8 @@ static void xenbus_probe(void)
>  	xenstored_ready = 1;
>  
>  	if (!xen_store_interface) {
> -		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
> -						XEN_PAGE_SIZE);
> +		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
> +					       XEN_PAGE_SIZE, MEMREMAP_WB);
>  		/*
>  		 * Now it is safe to free the IRQ used for xenstore late
>  		 * initialization. No need to unbind: it is about to be
> @@ -1009,8 +1009,8 @@ static int __init xenbus_init(void)
>  #endif
>  			xen_store_gfn = (unsigned long)v;
>  			xen_store_interface =
> -				xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
> -					  XEN_PAGE_SIZE);
> +				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
> +					 XEN_PAGE_SIZE, MEMREMAP_WB);
>  			if (xen_store_interface->connection != XENSTORE_CONNECTED)
>  				wait = true;
>  		}
> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> index 7e199c6656b9..e5c84ff28c8b 100644
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -109,9 +109,6 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
>  	return __set_phys_to_machine(pfn, mfn);
>  }
>  
> -#define xen_remap(cookie, size) ioremap_cache((cookie), (size))
> -#define xen_unmap(cookie) iounmap((cookie))
> -
>  bool xen_arch_need_swiotlb(struct device *dev,
>  			   phys_addr_t phys,
>  			   dma_addr_t dev_addr);
> -- 
> 2.35.3
> 

