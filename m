Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921056789CD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483250.749291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Xs-0005Cl-QQ; Mon, 23 Jan 2023 21:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483250.749291; Mon, 23 Jan 2023 21:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Xs-00057c-NB; Mon, 23 Jan 2023 21:40:04 +0000
Received: by outflank-mailman (input) for mailman id 483250;
 Mon, 23 Jan 2023 21:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4Xr-0004u2-Lu
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:40:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d6f33bb-9b66-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 22:40:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6827C61119;
 Mon, 23 Jan 2023 21:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80206C433D2;
 Mon, 23 Jan 2023 21:39:58 +0000 (UTC)
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
X-Inumbo-ID: 7d6f33bb-9b66-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674509999;
	bh=7z4gMYKOdsyiK4P1pFGZ62cPu6iRIegwPcJ767kAfzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XEsxf5WHwY0gbrOKaK/w97t3oUuLByo4dkrp1ZIyHVrt2Erx3ZkPgR3fVXL7hj/n2
	 mfF2NGfsZ4m2Zh0ZcvMeS7f3yGntwEL1rFDLrtsI/oB61Afy101Ui9DzTh0YnbtFMt
	 fVCXIGfnCrLayTMGHGDwB1xCQ1Avk+qMqTp2Vi5cnEnrCJY9jcXOjZyOcBnBvibdqZ
	 tQyy2mcSQiFXOl459YHhqiuJ938PYOmUl/ohYgP0/w0J5D+pwMJw3JSUyxOcG0+2F6
	 M2Sv6DZDW9gJTeCpUS9HBRi+TQMeGtj6qHdUxhovLoNJOuyK8pIW67QtHAKCRnXcry
	 H09o3ExWcfnag==
Date: Mon, 23 Jan 2023 13:39:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH 03/22] acpi: vmap pages in acpi_os_alloc_memory
In-Reply-To: <20221216114853.8227-4-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231339310.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-4-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also, introduce a wrapper around vmap that maps a contiguous range for
> boot allocations. Unfortunately, the new helper cannot be a static inline
> because the dependences are a mess. We would need to re-include
> asm/page.h (was removed in aa4b9d1ee653 "include: don't use asm/page.h
> from common headers") and it doesn't look to be enough anymore
> because bits from asm/cpufeature.h is used in the definition of PAGE_NX.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I saw Jan's comments and I agree with them but I also wanted to track
that I reviewed this patch and looks OK:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ----
> 
>     Changes since Hongyan's version:
>         * Rename vmap_boot_pages() to vmap_contig_pages()
>         * Move the new helper in vmap.c to avoid compilation issue
>         * Don't use __pa() to translate the virtual address
> ---
>  xen/common/vmap.c      |  5 +++++
>  xen/drivers/acpi/osl.c | 13 +++++++++++--
>  xen/include/xen/vmap.h |  2 ++
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 1340c7c6faf6..78f051a67682 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -244,6 +244,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
>      return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>  }
>  
> +void *vmap_contig_pages(mfn_t mfn, unsigned int nr_pages)
> +{
> +    return __vmap(&mfn, nr_pages, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> +}
> +
>  void vunmap(const void *va)
>  {
>      unsigned long addr = (unsigned long)va;
> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 389505f78666..44a9719b0dcf 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>  	void *ptr;
>  
>  	if (system_state == SYS_STATE_early_boot)
> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> +	{
> +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> +
> +		return vmap_contig_pages(mfn, PFN_UP(sz));
> +	}
>  
>  	ptr = xmalloc_bytes(sz);
>  	ASSERT(!ptr || is_xmalloc_memory(ptr));
> @@ -246,5 +250,10 @@ void __init acpi_os_free_memory(void *ptr)
>  	if (is_xmalloc_memory(ptr))
>  		xfree(ptr);
>  	else if (ptr && system_state == SYS_STATE_early_boot)
> -		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> +	{
> +		paddr_t addr = mfn_to_maddr(vmap_to_mfn(ptr));
> +
> +		vunmap(ptr);
> +		init_boot_pages(addr, addr + PAGE_SIZE);
> +	}
>  }
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index b0f7632e8985..3c06c7c3ba30 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -23,6 +23,8 @@ void *vmalloc_xen(size_t size);
>  void *vzalloc(size_t size);
>  void vfree(void *va);
>  
> +void *vmap_contig_pages(mfn_t mfn, unsigned int nr_pages);
> +
>  void __iomem *ioremap(paddr_t, size_t);
>  
>  static inline void iounmap(void __iomem *va)
> -- 
> 2.38.1
> 

