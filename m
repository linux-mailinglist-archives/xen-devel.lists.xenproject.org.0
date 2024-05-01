Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031678B90EF
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715472.1117130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GzG-0005E5-Go; Wed, 01 May 2024 20:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715472.1117130; Wed, 01 May 2024 20:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GzG-0005C3-Dv; Wed, 01 May 2024 20:55:34 +0000
Received: by outflank-mailman (input) for mailman id 715472;
 Wed, 01 May 2024 20:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2GzF-0005Bw-5W
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:55:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23aa7882-07fd-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:55:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2E86ACE139C;
 Wed,  1 May 2024 20:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C551AC072AA;
 Wed,  1 May 2024 20:55:22 +0000 (UTC)
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
X-Inumbo-ID: 23aa7882-07fd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596924;
	bh=rRM5UhhS3g5g91tWUVSmHsobPuVReB0n8SEWKW0JLmw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UOWmAIlwD1ZizziNao5SYkynMT4BK4AhFsid3YYv5lEObtar0/K+d6G/k5KPHuXr5
	 W6Kyw9ojRmZdPPea64jVFbMlgCH/Af/ZmKVcmks+YFDWNX4o2NRbkphtlgzF9yVGip
	 MqakMAGMYpYmFO0c9JCZLeeBjtX4XNG4+W/sOeaP6uojE/wp2EM6EDhNlcK2mDNEun
	 qrkGRu+sQbO/hXaSQlUQGki9OD09QD9wbaI1+i46ZoO+c6TVolEXU/Pt1xsVwjOwUS
	 hLOurVZUunTL6LcXWL6mW1JB1USL+FWr+AES73mkitYKYmCwqBuCoYXCmW4y7m6GvY
	 GbFyjKMNT3NDw==
Date: Wed, 1 May 2024 13:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 11/17] xen: mapcache: Make MCACHE_BUCKET_SHIFT runtime
 configurable
In-Reply-To: <20240430164939.925307-12-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011355140.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-12-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make MCACHE_BUCKET_SHIFT runtime configurable per cache instance.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 52 ++++++++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 72a7e25e3e..4f98d284dd 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -23,13 +23,10 @@
>  
>  
>  #if HOST_LONG_BITS == 32
> -#  define MCACHE_BUCKET_SHIFT 16
>  #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
>  #else
> -#  define MCACHE_BUCKET_SHIFT 20
>  #  define MCACHE_MAX_SIZE     (1UL<<35) /* 32GB Cap */
>  #endif
> -#define MCACHE_BUCKET_SIZE (1UL << MCACHE_BUCKET_SHIFT)
>  
>  /* This is the size of the virtual address space reserve to QEMU that will not
>   * be use by MapCache.
> @@ -65,7 +62,8 @@ typedef struct MapCache {
>      /* For most cases (>99.9%), the page address is the same. */
>      MapCacheEntry *last_entry;
>      unsigned long max_mcache_size;
> -    unsigned int mcache_bucket_shift;
> +    unsigned int bucket_shift;
> +    unsigned long bucket_size;
>  
>      phys_offset_to_gaddr_t phys_offset_to_gaddr;
>      QemuMutex lock;
> @@ -95,6 +93,7 @@ static inline int test_bits(int nr, int size, const unsigned long *addr)
>  
>  static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
>                                             void *opaque,
> +                                           unsigned int bucket_shift,
>                                             unsigned long max_size)
>  {
>      unsigned long size;
> @@ -108,12 +107,14 @@ static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
>  
>      QTAILQ_INIT(&mc->locked_entries);
>  
> +    mc->bucket_shift = bucket_shift;
> +    mc->bucket_size = 1UL << bucket_shift;
>      mc->max_mcache_size = max_size;
>  
>      mc->nr_buckets =
>          (((mc->max_mcache_size >> XC_PAGE_SHIFT) +
> -          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
> -         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
> +          (1UL << (bucket_shift - XC_PAGE_SHIFT)) - 1) >>
> +         (bucket_shift - XC_PAGE_SHIFT));
>  
>      size = mc->nr_buckets * sizeof(MapCacheEntry);
>      size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
> @@ -126,6 +127,13 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>  {
>      struct rlimit rlimit_as;
>      unsigned long max_mcache_size;
> +    unsigned int bucket_shift;
> +
> +    if (HOST_LONG_BITS == 32) {
> +        bucket_shift = 16;
> +    } else {
> +        bucket_shift = 20;
> +    }
>  
>      if (geteuid() == 0) {
>          rlimit_as.rlim_cur = RLIM_INFINITY;
> @@ -146,7 +154,9 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>          }
>      }
>  
> -    mapcache = xen_map_cache_init_single(f, opaque, max_mcache_size);
> +    mapcache = xen_map_cache_init_single(f, opaque,
> +                                         bucket_shift,
> +                                         max_mcache_size);
>      setrlimit(RLIMIT_AS, &rlimit_as);
>  }
>  
> @@ -195,7 +205,7 @@ static void xen_remap_bucket(MapCache *mc,
>      entry->valid_mapping = NULL;
>  
>      for (i = 0; i < nb_pfn; i++) {
> -        pfns[i] = (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT)) + i;
> +        pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
>      }
>  
>      /*
> @@ -266,8 +276,8 @@ static uint8_t *xen_map_cache_unlocked(MapCache *mc,
>      bool dummy = false;
>  
>  tryagain:
> -    address_index  = phys_addr >> MCACHE_BUCKET_SHIFT;
> -    address_offset = phys_addr & (MCACHE_BUCKET_SIZE - 1);
> +    address_index  = phys_addr >> mc->bucket_shift;
> +    address_offset = phys_addr & (mc->bucket_size - 1);
>  
>      trace_xen_map_cache(phys_addr);
>  
> @@ -294,14 +304,14 @@ tryagain:
>          return mc->last_entry->vaddr_base + address_offset;
>      }
>  
> -    /* size is always a multiple of MCACHE_BUCKET_SIZE */
> +    /* size is always a multiple of mc->bucket_size */
>      if (size) {
>          cache_size = size + address_offset;
> -        if (cache_size % MCACHE_BUCKET_SIZE) {
> -            cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
> +        if (cache_size % mc->bucket_size) {
> +            cache_size += mc->bucket_size - (cache_size % mc->bucket_size);
>          }
>      } else {
> -        cache_size = MCACHE_BUCKET_SIZE;
> +        cache_size = mc->bucket_size;
>      }
>  
>      entry = &mc->entry[address_index % mc->nr_buckets];
> @@ -419,7 +429,7 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
>          trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
>          raddr = RAM_ADDR_INVALID;
>      } else {
> -        raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
> +        raddr = (reventry->paddr_index << mc->bucket_shift) +
>               ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
>      }
>      mapcache_unlock(mc);
> @@ -582,8 +592,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
>      hwaddr address_index, address_offset;
>      hwaddr test_bit_size, cache_size = size;
>  
> -    address_index  = old_phys_addr >> MCACHE_BUCKET_SHIFT;
> -    address_offset = old_phys_addr & (MCACHE_BUCKET_SIZE - 1);
> +    address_index  = old_phys_addr >> mc->bucket_shift;
> +    address_offset = old_phys_addr & (mc->bucket_size - 1);
>  
>      assert(size);
>      /* test_bit_size is always a multiple of XC_PAGE_SIZE */
> @@ -592,8 +602,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
>          test_bit_size += XC_PAGE_SIZE - (test_bit_size % XC_PAGE_SIZE);
>      }
>      cache_size = size + address_offset;
> -    if (cache_size % MCACHE_BUCKET_SIZE) {
> -        cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
> +    if (cache_size % mc->bucket_size) {
> +        cache_size += mc->bucket_size - (cache_size % mc->bucket_size);
>      }
>  
>      entry = &mc->entry[address_index % mc->nr_buckets];
> @@ -606,8 +616,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
>          return NULL;
>      }
>  
> -    address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
> -    address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
> +    address_index  = new_phys_addr >> mc->bucket_shift;
> +    address_offset = new_phys_addr & (mc->bucket_size - 1);
>  
>      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
>  
> -- 
> 2.40.1
> 

