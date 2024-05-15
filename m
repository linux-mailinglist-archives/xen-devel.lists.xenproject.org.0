Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F798C6EE4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722657.1126816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Njo-0005TR-8A; Wed, 15 May 2024 23:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722657.1126816; Wed, 15 May 2024 23:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Njo-0005RH-5W; Wed, 15 May 2024 23:08:44 +0000
Received: by outflank-mailman (input) for mailman id 722657;
 Wed, 15 May 2024 23:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Njm-0005RB-3C
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:08:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1f9c52-1310-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:08:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D735CE17F2;
 Wed, 15 May 2024 23:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED724C116B1;
 Wed, 15 May 2024 23:08:30 +0000 (UTC)
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
X-Inumbo-ID: 0f1f9c52-1310-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715814512;
	bh=XqjCuxiB2MnS1WYIMeDQH7gJ6WD9EqRTdV+F492/gLw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VWypi5lBK2x7yQ0NI1MMlBECA0+HSqVfaNaMDHLNjucNrkXxCM8VrigYggHzitAIA
	 N4O5OnwFrkHb265DvcSHDoSEePIJ2LSHn/9zH9ck+tQ7+JK8Q1fLW2X5UUanfaANLd
	 KBcko0Eue4dM5TTYB+oW9Xvhb7X6czPsx52iBjV0FZy/hP5N5JMKxuKn/3FT/Rs756
	 BWrq5QnpbWfD7C/64/udGSu2n2gwwpoza5/oPAxQX/W1X/ZVp7B08A/xGQ7XB/EUDn
	 BWjYZeQuCtnK84i7M4UWGPsamo1o6oHthmo1Fx+/XQza4D55f18c4/xxPGV2nAAqdo
	 BQJo+rNMlFynQ==
Date: Wed, 15 May 2024 16:08:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 6/8] xen: mapcache: Pass the ram_addr offset to
 xen_map_cache()
In-Reply-To: <20240503014449.1046238-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405151605550.2544314@ubuntu-linux-20-04-desktop>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com> <20240503014449.1046238-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Pass the ram_addr offset to xen_map_cache.
> This is in preparation for adding grant mappings that need
> to compute the address within the RAMBlock.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/xen/xen-mapcache.c         | 16 +++++++++++-----
>  include/sysemu/xen-mapcache.h |  2 ++
>  system/physmem.c              |  9 +++++----
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index ec95445696..26bc38a9e3 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -167,7 +167,8 @@ static void xen_remap_bucket(MapCache *mc,
>                               void *vaddr,
>                               hwaddr size,
>                               hwaddr address_index,
> -                             bool dummy)
> +                             bool dummy,
> +                             ram_addr_t ram_offset)
>  {
>      uint8_t *vaddr_base;
>      xen_pfn_t *pfns;
> @@ -266,6 +267,7 @@ static void xen_remap_bucket(MapCache *mc,
>  
>  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
>                                         hwaddr phys_addr, hwaddr size,
> +                                       ram_addr_t ram_offset,
>                                         uint8_t lock, bool dma, bool is_write)
>  {
>      MapCacheEntry *entry, *pentry = NULL,
> @@ -337,14 +339,16 @@ tryagain:
>      if (!entry) {
>          entry = g_new0(MapCacheEntry, 1);
>          pentry->next = entry;
> -        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
> +        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
> +                         ram_offset);
>      } else if (!entry->lock) {
>          if (!entry->vaddr_base || entry->paddr_index != address_index ||
>                  entry->size != cache_size ||
>                  !test_bits(address_offset >> XC_PAGE_SHIFT,
>                      test_bit_size >> XC_PAGE_SHIFT,
>                      entry->valid_mapping)) {
> -            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
> +            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
> +                             ram_offset);
>          }
>      }
>  
> @@ -391,13 +395,15 @@ tryagain:
>  
>  uint8_t *xen_map_cache(MemoryRegion *mr,
>                         hwaddr phys_addr, hwaddr size,
> +                       ram_addr_t ram_addr_offset,
>                         uint8_t lock, bool dma,
>                         bool is_write)
>  {
>      uint8_t *p;
>  
>      mapcache_lock(mapcache);
> -    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma, is_write);
> +    p = xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_offset,
> +                               lock, dma, is_write);
>      mapcache_unlock(mapcache);
>      return p;
>  }
> @@ -632,7 +638,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
>      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
>  
>      xen_remap_bucket(mc, entry, entry->vaddr_base,
> -                     cache_size, address_index, false);
> +                     cache_size, address_index, false, new_phys_addr);

Everything else makes sense, but I don't understand how can it be that
new_phys_addr is the block->offset here?


>      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
>                  test_bit_size >> XC_PAGE_SHIFT,
>                  entry->valid_mapping)) {
> diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
> index 1ec9e66752..b5e3ea1bc0 100644
> --- a/include/sysemu/xen-mapcache.h
> +++ b/include/sysemu/xen-mapcache.h
> @@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
>  void xen_map_cache_init(phys_offset_to_gaddr_t f,
>                          void *opaque);
>  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
> +                       ram_addr_t ram_addr_offset,
>                         uint8_t lock, bool dma,
>                         bool is_write);
>  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
> @@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
>  static inline uint8_t *xen_map_cache(MemoryRegion *mr,
>                                       hwaddr phys_addr,
>                                       hwaddr size,
> +                                     ram_addr_t ram_addr_offset,
>                                       uint8_t lock,
>                                       bool dma,
>                                       bool is_write)
> diff --git a/system/physmem.c b/system/physmem.c
> index b7847db1a2..33d09f7571 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2231,13 +2231,14 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>           */
>          if (xen_mr_is_memory(block->mr)) {
>              return xen_map_cache(block->mr, block->offset + addr,
> -                                 len, lock, lock,
> -                                 is_write);
> +                                 len, block->offset,
> +                                 lock, lock, is_write);
>          }
>  
>          block->host = xen_map_cache(block->mr, block->offset,
> -                                    block->max_length, 1,
> -                                    lock, is_write);
> +                                    block->max_length,
> +                                    block->offset,
> +                                    1, lock, is_write);
>      }

This is OK but it is really making it clear that there is a mistake in
the code. OK for now but it is something to fix in the future.


>      return ramblock_ptr(block, addr);
> -- 
> 2.40.1
> 

