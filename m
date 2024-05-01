Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8038B90F7
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 23:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715484.1117150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2H6s-0007c4-Ig; Wed, 01 May 2024 21:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715484.1117150; Wed, 01 May 2024 21:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2H6s-0007ZZ-FV; Wed, 01 May 2024 21:03:26 +0000
Received: by outflank-mailman (input) for mailman id 715484;
 Wed, 01 May 2024 21:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2H6r-0007ZR-3N
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 21:03:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee31c6d-07fe-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 23:03:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B783619BA;
 Wed,  1 May 2024 21:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E7EC072AA;
 Wed,  1 May 2024 21:03:20 +0000 (UTC)
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
X-Inumbo-ID: 3ee31c6d-07fe-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714597402;
	bh=2WZWdYOx2khYwwOaLHZ6CakoHF0il4iSJg/sGKO5QtE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nx5Np+7/aKvpOiUcx2oJgi2mzU3PYHgVuYzyb3Iqwl7JARmd9X4N7n8oxT2O6+2w3
	 VDq+EMHWrRdxOuIqoVli5GZiP8e+zDFrlXHXQs1ZnI6EskAjIfJVTU3TBil4ztZt0i
	 YNaCjcBaXqo3aHAPONO6oo740BP5/YfL1OZNFYHJn207gWtwv3lmk8Fp1uYTd2WoMG
	 6TpUB1Mec9Zkw9Iumm93EzqamFpn4E//rHZAyimCB0UFClAUaCqjIaqmBP8me18+LC
	 IBqKEWfr9NsHlyC5kFciUNsNnx+cqe8mNVK+JKT4PA/WXc5o314hzu47qyUebU0abg
	 ceO+Y9SdheO8Q==
Date: Wed, 1 May 2024 14:03:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 13/17] softmmu: Pass RAM MemoryRegion and is_write
 xen_map_cache()
In-Reply-To: <20240430164939.925307-14-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011403120.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-14-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Propagate MR and is_write to xen_map_cache().
> This is in preparation for adding support for grant mappings.
> 
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c         | 10 ++++++----
>  include/sysemu/xen-mapcache.h | 11 +++++++----
>  system/physmem.c              | 31 +++++++++++++++++++++++--------
>  3 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 0365311788..09b5f36d9c 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -264,7 +264,7 @@ static void xen_remap_bucket(MapCache *mc,
>  
>  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
>                                         hwaddr phys_addr, hwaddr size,
> -                                       uint8_t lock, bool dma)
> +                                       uint8_t lock, bool dma, bool is_write)
>  {
>      MapCacheEntry *entry, *pentry = NULL,
>                    *free_entry = NULL, *free_pentry = NULL;
> @@ -387,13 +387,15 @@ tryagain:
>      return mc->last_entry->vaddr_base + address_offset;
>  }
>  
> -uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
> -                       uint8_t lock, bool dma)
> +uint8_t *xen_map_cache(MemoryRegion *mr,
> +                       hwaddr phys_addr, hwaddr size,
> +                       uint8_t lock, bool dma,
> +                       bool is_write)
>  {
>      uint8_t *p;
>  
>      mapcache_lock(mapcache);
> -    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma);
> +    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma, is_write);
>      mapcache_unlock(mapcache);
>      return p;
>  }
> diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
> index 10c2e3082a..1ec9e66752 100644
> --- a/include/sysemu/xen-mapcache.h
> +++ b/include/sysemu/xen-mapcache.h
> @@ -18,8 +18,9 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
>  
>  void xen_map_cache_init(phys_offset_to_gaddr_t f,
>                          void *opaque);
> -uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
> -                       uint8_t lock, bool dma);
> +uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
> +                       uint8_t lock, bool dma,
> +                       bool is_write);
>  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
>  void xen_invalidate_map_cache_entry(uint8_t *buffer);
>  void xen_invalidate_map_cache(void);
> @@ -33,10 +34,12 @@ static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
>  {
>  }
>  
> -static inline uint8_t *xen_map_cache(hwaddr phys_addr,
> +static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> +                                     hwaddr phys_addr,
>                                       hwaddr size,
>                                       uint8_t lock,
> -                                     bool dma)
> +                                     bool dma,
> +                                     bool is_write)
>  {
>      abort();
>  }
> diff --git a/system/physmem.c b/system/physmem.c
> index f114b972a5..ad7a8c7d95 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2190,11 +2190,22 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
>  
>  /*
>   * Return a host pointer to guest's ram.
> + * For Xen, foreign mappings get created if they don't already exist.
> + *
> + * @block: block for the RAM to lookup (optional and may be NULL).
> + * @addr: address within the memory region.
> + * @size: pointer to requested size (optional and may be NULL).
> + *        size may get modified and return a value smaller than
> + *        what was requested.
> + * @lock: wether to lock the mapping in xen-mapcache until invalidated.
> + * @is_write: hint wether to map RW or RO in the xen-mapcache.
> + *            (optional and may always be set to true).
>   *
>   * Called within RCU critical section.
>   */
>  static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
> -                                 hwaddr *size, bool lock)
> +                                 hwaddr *size, bool lock,
> +                                 bool is_write)
>  {
>      hwaddr len = 0;
>  
> @@ -2217,10 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>           * In that case just map the requested area.
>           */
>          if (block->offset == 0) {
> -            return xen_map_cache(addr, len, lock, lock);
> +            return xen_map_cache(block->mr, addr, len, lock, lock,
> +                                 is_write);
>          }
>  
> -        block->host = xen_map_cache(block->offset, block->max_length, 1, lock);
> +        block->host = xen_map_cache(block->mr, block->offset,
> +                                    block->max_length, 1,
> +                                    lock, is_write);
>      }
>  
>      return ramblock_ptr(block, addr);
> @@ -2236,7 +2250,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>   */
>  void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr)
>  {
> -    return qemu_ram_ptr_length(ram_block, addr, NULL, false);
> +    return qemu_ram_ptr_length(ram_block, addr, NULL, false, true);
>  }
>  
>  /* Return the offset of a hostpointer within a ramblock */
> @@ -2746,7 +2760,7 @@ static MemTxResult flatview_write_continue_step(MemTxAttrs attrs,
>      } else {
>          /* RAM case */
>          uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
> -                                               false);
> +                                               false, true);
>  
>          memmove(ram_ptr, buf, *l);
>          invalidate_and_set_dirty(mr, mr_addr, *l);
> @@ -2839,7 +2853,7 @@ static MemTxResult flatview_read_continue_step(MemTxAttrs attrs, uint8_t *buf,
>      } else {
>          /* RAM case */
>          uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
> -                                               false);
> +                                               false, false);
>  
>          memcpy(buf, ram_ptr, *l);
>  
> @@ -3233,7 +3247,7 @@ void *address_space_map(AddressSpace *as,
>      *plen = flatview_extend_translation(fv, addr, len, mr, xlat,
>                                          l, is_write, attrs);
>      fuzz_dma_read_cb(addr, *plen, mr);
> -    return qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
> +    return qemu_ram_ptr_length(mr->ram_block, xlat, plen, true, is_write);
>  }
>  
>  /* Unmaps a memory region previously mapped by address_space_map().
> @@ -3329,7 +3343,8 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
>          l = flatview_extend_translation(cache->fv, addr, len, mr,
>                                          cache->xlat, l, is_write,
>                                          MEMTXATTRS_UNSPECIFIED);
> -        cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true);
> +        cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true,
> +                                         is_write);
>      } else {
>          cache->ptr = NULL;
>      }
> -- 
> 2.40.1
> 

