Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F38B90BB
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715435.1117059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gl9-0007SN-TR; Wed, 01 May 2024 20:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715435.1117059; Wed, 01 May 2024 20:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gl9-0007QU-Qe; Wed, 01 May 2024 20:40:59 +0000
Received: by outflank-mailman (input) for mailman id 715435;
 Wed, 01 May 2024 20:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Gl9-0007P3-AV
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:40:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c33cf47-07fb-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:40:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADA1D61794;
 Wed,  1 May 2024 20:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A961C072AA;
 Wed,  1 May 2024 20:40:53 +0000 (UTC)
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
X-Inumbo-ID: 1c33cf47-07fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596055;
	bh=j96WBr+ckAnpUbK5HVQ29fNPUdvYgDjm1+efAxcME4o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AyQCOV9bZWw7X5lI/JknkOTUGFJ2UwMM84H3RXHkjTrS9gkV7qZhRp4Om0qse5P4Z
	 5Ir0k/Q5EKxOSLKvN/W3mKyD5YhzelyVKlJ+lYtJBG76ypj2WDHVC3EwdTslruBGma
	 YZfBjjX9fb++VU2fCnZgpdE9UScdwLps7Q9gHNtbXTYP+eRBVlV8nS/NDXiiN7NleU
	 CBqY4PSmIj/x7reYitY4Kde/3rn9mO4DBIzaFDwKtSC2XduleO/eUbMfBZlP/WEAm+
	 eIy+WXIJCtobo+GdLvMCDQmPgMioCLzz8kFvRX/cQ6dQv9DzY7CwxsryecaYlAaL9J
	 vmo/oeRRN6O6w==
Date: Wed, 1 May 2024 13:40:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 04/17] xen: mapcache: Refactor xen_map_cache for
 multi-instance
In-Reply-To: <20240430164939.925307-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011340460.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make xen_map_cache take a MapCache as argument. This is in
> prepaparation to support multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 3f11562075..896021d86f 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -240,7 +240,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>      g_free(err);
>  }
>  
> -static uint8_t *xen_map_cache_unlocked(hwaddr phys_addr, hwaddr size,
> +static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> +                                       hwaddr phys_addr, hwaddr size,
>                                         uint8_t lock, bool dma)
>  {
>      MapCacheEntry *entry, *pentry = NULL,
> @@ -269,16 +270,16 @@ tryagain:
>          test_bit_size = XC_PAGE_SIZE;
>      }
>  
> -    if (mapcache->last_entry != NULL &&
> -        mapcache->last_entry->paddr_index == address_index &&
> +    if (mc->last_entry != NULL &&
> +        mc->last_entry->paddr_index == address_index &&
>          !lock && !size &&
>          test_bits(address_offset >> XC_PAGE_SHIFT,
>                    test_bit_size >> XC_PAGE_SHIFT,
> -                  mapcache->last_entry->valid_mapping)) {
> +                  mc->last_entry->valid_mapping)) {
>          trace_xen_map_cache_return(
> -            mapcache->last_entry->vaddr_base + address_offset
> +            mc->last_entry->vaddr_base + address_offset
>          );
> -        return mapcache->last_entry->vaddr_base + address_offset;
> +        return mc->last_entry->vaddr_base + address_offset;
>      }
>  
>      /* size is always a multiple of MCACHE_BUCKET_SIZE */
> @@ -291,7 +292,7 @@ tryagain:
>          cache_size = MCACHE_BUCKET_SIZE;
>      }
>  
> -    entry = &mapcache->entry[address_index % mapcache->nr_buckets];
> +    entry = &mc->entry[address_index % mc->nr_buckets];
>  
>      while (entry && (lock || entry->lock) && entry->vaddr_base &&
>              (entry->paddr_index != address_index || entry->size != cache_size ||
> @@ -326,10 +327,10 @@ tryagain:
>      if(!test_bits(address_offset >> XC_PAGE_SHIFT,
>                  test_bit_size >> XC_PAGE_SHIFT,
>                  entry->valid_mapping)) {
> -        mapcache->last_entry = NULL;
> +        mc->last_entry = NULL;
>  #ifdef XEN_COMPAT_PHYSMAP
> -        if (!translated && mapcache->phys_offset_to_gaddr) {
> -            phys_addr = mapcache->phys_offset_to_gaddr(phys_addr, size);
> +        if (!translated && mc->phys_offset_to_gaddr) {
> +            phys_addr = mc->phys_offset_to_gaddr(phys_addr, size);
>              translated = true;
>              goto tryagain;
>          }
> @@ -342,7 +343,7 @@ tryagain:
>          return NULL;
>      }
>  
> -    mapcache->last_entry = entry;
> +    mc->last_entry = entry;
>      if (lock) {
>          MapCacheRev *reventry = g_new0(MapCacheRev, 1);
>          entry->lock++;
> @@ -352,16 +353,16 @@ tryagain:
>              abort();
>          }
>          reventry->dma = dma;
> -        reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
> -        reventry->paddr_index = mapcache->last_entry->paddr_index;
> +        reventry->vaddr_req = mc->last_entry->vaddr_base + address_offset;
> +        reventry->paddr_index = mc->last_entry->paddr_index;
>          reventry->size = entry->size;
> -        QTAILQ_INSERT_HEAD(&mapcache->locked_entries, reventry, next);
> +        QTAILQ_INSERT_HEAD(&mc->locked_entries, reventry, next);
>      }
>  
>      trace_xen_map_cache_return(
> -        mapcache->last_entry->vaddr_base + address_offset
> +        mc->last_entry->vaddr_base + address_offset
>      );
> -    return mapcache->last_entry->vaddr_base + address_offset;
> +    return mc->last_entry->vaddr_base + address_offset;
>  }
>  
>  uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
> @@ -370,7 +371,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
>      uint8_t *p;
>  
>      mapcache_lock(mapcache);
> -    p = xen_map_cache_unlocked(phys_addr, size, lock, dma);
> +    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma);
>      mapcache_unlock(mapcache);
>      return p;
>  }
> -- 
> 2.40.1
> 

