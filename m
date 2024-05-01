Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD48B90B5
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715432.1117049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gk0-00065K-Kc; Wed, 01 May 2024 20:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715432.1117049; Wed, 01 May 2024 20:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gk0-000634-I5; Wed, 01 May 2024 20:39:48 +0000
Received: by outflank-mailman (input) for mailman id 715432;
 Wed, 01 May 2024 20:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Gjy-00062y-Pd
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:39:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee6e6828-07fa-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:39:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 27D46CE11C4;
 Wed,  1 May 2024 20:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CD8C4AF48;
 Wed,  1 May 2024 20:39:33 +0000 (UTC)
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
X-Inumbo-ID: ee6e6828-07fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714595976;
	bh=5YO3GsemN4rW6B3DAytQmffj94Xk9tr4gbh/SLOBsHg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GLA4JLQv/NLSloJATnzmE7UGLXbdc+YRL7PWuDpmsuVStnK6/wFWikcw+hH3IhoH2
	 mSFcU6w3+iUJZb8D2/FvYZLsCsBYVuROXk5gcAjyGZIAGSNjGrzDFS5lfCYxUZwN0x
	 jBLeOZhzYk6hI1jnu5BbYv3n7xaO07oWZvl74q/0nya1xjti+7jAKNSOZ+Jyi06pqt
	 Hes89G5+2+MuwyyV/0kDftApgbKnRDwGi8XB3rY/BBKxy/SawSfrwifptapw/QT2q8
	 fXpYV9jhPSFqaSj2ThOCFW9J3pIt2j6HTbPIyeglcfKe3wykBzY5QWEKH+u1r5qNde
	 XxYsyNTJbiXPg==
Date: Wed, 1 May 2024 13:39:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 03/17] xen: mapcache: Refactor lock functions for
 multi-instance
In-Reply-To: <20240430164939.925307-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011339230.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make the lock functions take MapCache * as argument. This is
> in preparation for supporting multiple caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index b7cefb78f7..3f11562075 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -74,14 +74,14 @@ typedef struct MapCache {
>  
>  static MapCache *mapcache;
>  
> -static inline void mapcache_lock(void)
> +static inline void mapcache_lock(MapCache *mc)
>  {
> -    qemu_mutex_lock(&mapcache->lock);
> +    qemu_mutex_lock(&mc->lock);
>  }
>  
> -static inline void mapcache_unlock(void)
> +static inline void mapcache_unlock(MapCache *mc)
>  {
> -    qemu_mutex_unlock(&mapcache->lock);
> +    qemu_mutex_unlock(&mc->lock);
>  }
>  
>  static inline int test_bits(int nr, int size, const unsigned long *addr)
> @@ -369,9 +369,9 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
>  {
>      uint8_t *p;
>  
> -    mapcache_lock();
> +    mapcache_lock(mapcache);
>      p = xen_map_cache_unlocked(phys_addr, size, lock, dma);
> -    mapcache_unlock();
> +    mapcache_unlock(mapcache);
>      return p;
>  }
>  
> @@ -384,7 +384,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>      ram_addr_t raddr;
>      int found = 0;
>  
> -    mapcache_lock();
> +    mapcache_lock(mapcache);
>      QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
>          if (reventry->vaddr_req == ptr) {
>              paddr_index = reventry->paddr_index;
> @@ -394,7 +394,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          }
>      }
>      if (!found) {
> -        mapcache_unlock();
> +        mapcache_unlock(mapcache);
>          return RAM_ADDR_INVALID;
>      }
>  
> @@ -409,7 +409,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
>               ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
>      }
> -    mapcache_unlock();
> +    mapcache_unlock(mapcache);
>      return raddr;
>  }
>  
> @@ -480,9 +480,9 @@ static void xen_invalidate_map_cache_entry_bh(void *opaque)
>  {
>      XenMapCacheData *data = opaque;
>  
> -    mapcache_lock();
> +    mapcache_lock(mapcache);
>      xen_invalidate_map_cache_entry_unlocked(data->buffer);
> -    mapcache_unlock();
> +    mapcache_unlock(mapcache);
>  
>      aio_co_wake(data->co);
>  }
> @@ -498,9 +498,9 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
>                                  xen_invalidate_map_cache_entry_bh, &data);
>          qemu_coroutine_yield();
>      } else {
> -        mapcache_lock();
> +        mapcache_lock(mapcache);
>          xen_invalidate_map_cache_entry_unlocked(buffer);
> -        mapcache_unlock();
> +        mapcache_unlock(mapcache);
>      }
>  }
>  
> @@ -512,7 +512,7 @@ void xen_invalidate_map_cache(void)
>      /* Flush pending AIO before destroying the mapcache */
>      bdrv_drain_all();
>  
> -    mapcache_lock();
> +    mapcache_lock(mapcache);
>  
>      QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
>          if (!reventry->dma) {
> @@ -546,7 +546,7 @@ void xen_invalidate_map_cache(void)
>  
>      mapcache->last_entry = NULL;
>  
> -    mapcache_unlock();
> +    mapcache_unlock(mapcache);
>  }
>  
>  static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
> @@ -606,8 +606,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>  {
>      uint8_t *p;
>  
> -    mapcache_lock();
> +    mapcache_lock(mapcache);
>      p = xen_replace_cache_entry_unlocked(old_phys_addr, new_phys_addr, size);
> -    mapcache_unlock();
> +    mapcache_unlock(mapcache);
>      return p;
>  }
> -- 
> 2.40.1
> 

