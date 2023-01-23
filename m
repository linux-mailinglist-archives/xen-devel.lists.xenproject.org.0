Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC62678A4C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483282.749352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4xd-0002Rj-4C; Mon, 23 Jan 2023 22:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483282.749352; Mon, 23 Jan 2023 22:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4xd-0002Po-0j; Mon, 23 Jan 2023 22:06:41 +0000
Received: by outflank-mailman (input) for mailman id 483282;
 Mon, 23 Jan 2023 22:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4xb-0002Pi-Ht
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:06:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34738f38-9b6a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 23:06:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5EBC6113C;
 Mon, 23 Jan 2023 22:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77791C433D2;
 Mon, 23 Jan 2023 22:06:34 +0000 (UTC)
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
X-Inumbo-ID: 34738f38-9b6a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674511595;
	bh=CPExy/CVX14ZaDL7i2mDVsKaJL1MKCn9QWrX72FwgUM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ikIrfVP+OIX8IbnrHRUR7ZT9FLzoxEOno2ijoQJnvUkQ749oMerVTkYXd9H2LB/f/
	 3T39Fu+w9A4AhjNlYCgl4mGA3ED4s7wAaTN7vYEXxC6GcDt+yxSlfDrsWez6R09o7V
	 jspHI7eAFmy1TZcBH29ZB8LMISU/JaNr0zy+Gs6v42ci+atBVwrLAxOTUlh+xtnupX
	 93wCZduVehnFdz0iy+oX+5G39m5paMxIJKKudLB66XQQ1VR+5TjWa4mgQLnwlWiiW/
	 c0/Dc4URQ0fXDnLJm1vhcmilioED8DNRefjhxMxtqh90aUEGvEFpmxRqG2aAY62OnN
	 s+ump0w28C2zg==
Date: Mon, 23 Jan 2023 14:06:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 19/22] xen/arm32: mm: Rename 'first' to 'root' in
 init_secondary_pagetables()
In-Reply-To: <20221216114853.8227-20-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231406240.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-20-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The arm32 version of init_secondary_pagetables() will soon be re-used
> for arm64 as well where the root table start at level 0 rather than level 1.
> 
> So rename 'first' to 'root'.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/mm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0fc6f2992dd1..4e208f7d20c8 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -571,32 +571,30 @@ int init_secondary_pagetables(int cpu)
>  #else
>  int init_secondary_pagetables(int cpu)
>  {
> -    lpae_t *first;
> +    lpae_t *root = alloc_xenheap_page();
>  
> -    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
> -
> -    if ( !first )
> +    if ( !root )
>      {
> -        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
> +        printk("CPU%u: Unable to allocate the root page-table\n", cpu);
>          return -ENOMEM;
>      }
>  
>      /* Initialise root pagetable from root of boot tables */
> -    memcpy(first, cpu0_pgtable, PAGE_SIZE);
> -    per_cpu(xen_pgtable, cpu) = first;
> +    memcpy(root, cpu0_pgtable, PAGE_SIZE);
> +    per_cpu(xen_pgtable, cpu) = root;
>  
>      if ( !init_domheap_mappings(cpu) )
>      {
>          printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
>          per_cpu(xen_pgtable, cpu) = NULL;
> -        free_xenheap_page(first);
> +        free_xenheap_page(root);
>          return -ENOMEM;
>      }
>  
>      clear_boot_pagetables();
>  
>      /* Set init_ttbr for this CPU coming up */
> -    init_ttbr = __pa(first);
> +    init_ttbr = __pa(root);
>      clean_dcache(init_ttbr);
>  
>      return 0;
> -- 
> 2.38.1
> 

