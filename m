Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DA86FB28
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688178.1072074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3AF-00008U-Ca; Mon, 04 Mar 2024 07:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688178.1072074; Mon, 04 Mar 2024 07:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3AF-00005y-8z; Mon, 04 Mar 2024 07:55:11 +0000
Received: by outflank-mailman (input) for mailman id 688178;
 Mon, 04 Mar 2024 07:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OdVH=KK=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1rh3AD-00005e-HW
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:55:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e7ea96-d9fc-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 08:55:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0C11CE09CC;
 Mon,  4 Mar 2024 07:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DCDC433C7;
 Mon,  4 Mar 2024 07:54:55 +0000 (UTC)
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
X-Inumbo-ID: 83e7ea96-d9fc-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709538901;
	bh=p6Urnz+2Ta3f7kOkPM5DbFuLip3NAfCMXzcs08p4wBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahcrYj1dyiqeI3FybO9o3aXX0MLEyrxXvIg4Hq/LjLd/8bn5nhNwjUoq8uYLe0Ml7
	 NxC0ub4AubKaEjlt054LymegP0FHpoZStH80tU0a4A9ScXeQaUWHHXAgxHoLhCkMvL
	 Bu2BAHGQ7bqf5hL2B6L8oVg3E8otol7ZUbWn+JAWyUncSvpeq/oY5CR1JqVbPoHMJg
	 nZC0lhtkuq5rgdsQ3/3ZKHAzdFJ+YjLfDbjA9rTgRRX4h0gqWIJsqQ+dI+40IIdbqZ
	 cCX6EN1NiDFXsxM1L/qOAsSFM2iWNfoSeHnvaeyVtw+UOJBZU3FWPizOY1HNOE+V7Q
	 shceRKWhU9xIg==
Date: Mon, 4 Mar 2024 09:54:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
	hch@infradead.org, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Subject: Re: [PATCH v2 bpf-next 2/3] mm, xen: Separate xen use cases from
 ioremap.
Message-ID: <ZeV-IE-65yiIwFSY@kernel.org>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-3-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223235728.13981-3-alexei.starovoitov@gmail.com>

On Fri, Feb 23, 2024 at 03:57:27PM -0800, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> xen grant table and xenbus ring are not ioremap the way arch specific code is using it,
> so let's add VM_XEN flag to separate them from VM_IOREMAP users.
> xen will not and should not be calling ioremap_page_range() on that range.
> /proc/vmallocinfo will print such region as "xen" instead of "ioremap" as well.
> 
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---
>  arch/x86/xen/grant-table.c         | 2 +-
>  drivers/xen/xenbus/xenbus_client.c | 2 +-
>  include/linux/vmalloc.h            | 1 +
>  mm/vmalloc.c                       | 7 +++++--
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
> index 1e681bf62561..b816db0349c4 100644
> --- a/arch/x86/xen/grant-table.c
> +++ b/arch/x86/xen/grant-table.c
> @@ -104,7 +104,7 @@ static int arch_gnttab_valloc(struct gnttab_vm_area *area, unsigned nr_frames)
>  	area->ptes = kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_KERNEL);
>  	if (area->ptes == NULL)
>  		return -ENOMEM;
> -	area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_IOREMAP);
> +	area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_XEN);
>  	if (!area->area)
>  		goto out_free_ptes;
>  	if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index 32835b4b9bc5..b9c81a2d578b 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -758,7 +758,7 @@ static int xenbus_map_ring_pv(struct xenbus_device *dev,
>  	bool leaked = false;
>  	int err = -ENOMEM;
>  
> -	area = get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_IOREMAP);
> +	area = get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_XEN);
>  	if (!area)
>  		return -ENOMEM;
>  	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index c720be70c8dd..223e51c243bc 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -28,6 +28,7 @@ struct iov_iter;		/* in uio.h */
>  #define VM_FLUSH_RESET_PERMS	0x00000100	/* reset direct map and flush TLB on unmap, can't be freed in atomic context */
>  #define VM_MAP_PUT_PAGES	0x00000200	/* put pages and free array in vfree */
>  #define VM_ALLOW_HUGE_VMAP	0x00000400      /* Allow for huge pages on archs with HAVE_ARCH_HUGE_VMALLOC */
> +#define VM_XEN			0x00000800	/* xen use cases */
>  
>  #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
>  	!defined(CONFIG_KASAN_VMALLOC)

There's also VM_DEFER_KMEMLEAK a line below:

#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
	!defined(CONFIG_KASAN_VMALLOC)
#define VM_DEFER_KMEMLEAK	0x00000801	/* defer kmemleak object creation */
#else
#define VM_DEFER_KMEMLEAK	0
#endif

It should be adjusted as well.
I think it makes sense to use an enumeration for vm_flags, just like as
Suren did for GFP
(https://lore.kernel.org/linux-mm/20240224015800.2569851-1-surenb@google.com/)

-- 
Sincerely yours,
Mike.

