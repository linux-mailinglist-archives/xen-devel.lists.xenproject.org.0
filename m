Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38518B90EA
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715467.1117120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gvl-0003wh-3H; Wed, 01 May 2024 20:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715467.1117120; Wed, 01 May 2024 20:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gvl-0003ty-07; Wed, 01 May 2024 20:51:57 +0000
Received: by outflank-mailman (input) for mailman id 715467;
 Wed, 01 May 2024 20:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Gvj-0003ts-DG
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:51:55 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1eefdbd-07fc-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:51:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D12F2CE138D;
 Wed,  1 May 2024 20:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42476C4AF14;
 Wed,  1 May 2024 20:51:45 +0000 (UTC)
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
X-Inumbo-ID: a1eefdbd-07fc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596707;
	bh=HR+a7o2ZkxIM6jzJQZXWaVSl9k5NgRnHGAuDGSr6slg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ALDUNZnM70fk4wzKcV3eCENzn3/uRATGRYE9br0E6W/ZkmBon8cgKpqJAmU9vbObQ
	 WlS/uOTMmhm1sKXutTcz4jFYzdWB+MgZzttC9peCq3XBbJ3/NDy+rYmH5YDqrvC+M2
	 AO8nSPOOA7xV9fbNpjAxhNiNxhjaEHkGD7xVT+tJnTWAhGEZysQEGOlIpHg2hBLl3d
	 5OSFAGdVu+ZqvWwC8XYYX/qBrXeYHYq2sII0WXKkIzG+IuGxK4/ZfLcfdZIbQtBGYs
	 b1lin2VhOMhQVDLPERnDqnzZsZslla+hsEZCFgvqDKhta23jaqJrc9HEQ46K9xZqtm
	 iE74nsTNQYaNg==
Date: Wed, 1 May 2024 13:51:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 10/17] xen: mapcache: Break out
 xen_map_cache_init_single()
In-Reply-To: <20240430164939.925307-11-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011351380.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-11-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out xen_map_cache_init_single() in preparation for
> adding multiple map caches.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 53 ++++++++++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index dd08cd296b..72a7e25e3e 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -93,23 +93,44 @@ static inline int test_bits(int nr, int size, const unsigned long *addr)
>          return 0;
>  }
>  
> -void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
> +static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
> +                                           void *opaque,
> +                                           unsigned long max_size)
>  {
>      unsigned long size;
> -    struct rlimit rlimit_as;
> +    MapCache *mc;
> +
> +    mc = g_new0(MapCache, 1);
> +
> +    mc->phys_offset_to_gaddr = f;
> +    mc->opaque = opaque;
> +    qemu_mutex_init(&mc->lock);
> +
> +    QTAILQ_INIT(&mc->locked_entries);
>  
> -    mapcache = g_new0(MapCache, 1);
> +    mc->max_mcache_size = max_size;
>  
> -    mapcache->phys_offset_to_gaddr = f;
> -    mapcache->opaque = opaque;
> -    qemu_mutex_init(&mapcache->lock);
> +    mc->nr_buckets =
> +        (((mc->max_mcache_size >> XC_PAGE_SHIFT) +
> +          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
> +         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
>  
> -    QTAILQ_INIT(&mapcache->locked_entries);
> +    size = mc->nr_buckets * sizeof(MapCacheEntry);
> +    size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
> +    trace_xen_map_cache_init(mc->nr_buckets, size);
> +    mc->entry = g_malloc0(size);
> +    return mc;
> +}
> +
> +void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
> +{
> +    struct rlimit rlimit_as;
> +    unsigned long max_mcache_size;
>  
>      if (geteuid() == 0) {
>          rlimit_as.rlim_cur = RLIM_INFINITY;
>          rlimit_as.rlim_max = RLIM_INFINITY;
> -        mapcache->max_mcache_size = MCACHE_MAX_SIZE;
> +        max_mcache_size = MCACHE_MAX_SIZE;
>      } else {
>          getrlimit(RLIMIT_AS, &rlimit_as);
>          rlimit_as.rlim_cur = rlimit_as.rlim_max;
> @@ -119,24 +140,14 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>                          " memory is not infinity");
>          }
>          if (rlimit_as.rlim_max < MCACHE_MAX_SIZE + NON_MCACHE_MEMORY_SIZE) {
> -            mapcache->max_mcache_size = rlimit_as.rlim_max -
> -                NON_MCACHE_MEMORY_SIZE;
> +            max_mcache_size = rlimit_as.rlim_max - NON_MCACHE_MEMORY_SIZE;
>          } else {
> -            mapcache->max_mcache_size = MCACHE_MAX_SIZE;
> +            max_mcache_size = MCACHE_MAX_SIZE;
>          }
>      }
>  
> +    mapcache = xen_map_cache_init_single(f, opaque, max_mcache_size);
>      setrlimit(RLIMIT_AS, &rlimit_as);
> -
> -    mapcache->nr_buckets =
> -        (((mapcache->max_mcache_size >> XC_PAGE_SHIFT) +
> -          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
> -         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
> -
> -    size = mapcache->nr_buckets * sizeof (MapCacheEntry);
> -    size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
> -    trace_xen_map_cache_init(mapcache->nr_buckets, size);
> -    mapcache->entry = g_malloc0(size);
>  }
>  
>  static void xen_remap_bucket(MapCache *mc,
> -- 
> 2.40.1
> 

