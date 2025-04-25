Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62817A9D181
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 21:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968484.1358051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ogn-0000zj-4N; Fri, 25 Apr 2025 19:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968484.1358051; Fri, 25 Apr 2025 19:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ogn-0000wy-0f; Fri, 25 Apr 2025 19:26:21 +0000
Received: by outflank-mailman (input) for mailman id 968484;
 Fri, 25 Apr 2025 19:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8Ogl-0000wq-SL
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 19:26:19 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28bf6834-220b-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 21:26:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C985E4AB4E;
 Fri, 25 Apr 2025 19:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA96C4CEE9;
 Fri, 25 Apr 2025 19:26:15 +0000 (UTC)
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
X-Inumbo-ID: 28bf6834-220b-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609176;
	bh=ljStjEoWpGm0WSufAWVVtJm5j+hefQcxjnFFyz8KcgY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LT2WHXiS7x8kST+KvpcKjeiIby/zhVutCJErxMt2Nx3QNr/im8x+w5hNtSiFxOitR
	 5nX08cmWlZByoviT0y0fLkCTX60zymkAZ8vwFjUGRTezuITKMquwyRqlArkhooIIGt
	 tD3fgbdZReKcl/dhoFyc3jEIVUkzAjb2wifF4KCAO95k4HGCk7LixKfYp0kQ4oJ6++
	 fGgSjcDM979WERKy6tMbyWii80uTCARx96GqnESgkwOe7AER9zg+5NIXIfkJ11Xd77
	 eIiRvLYng5rLc5AutyprwjIGPUGsNYwtWohvrIWDAC1GkbRTkER57dIzhWmnOUnBVL
	 wDGcJVSSHGoAQ==
Date: Fri, 25 Apr 2025 12:26:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, sstabellini@kernel.org, 
    anthony@xenproject.org, paul@xen.org, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] xen: mapcache: Split mapcache_grants by ro and
 rw
In-Reply-To: <20250425143156.204452-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2504251225270.785180@ubuntu-linux-20-04-desktop>
References: <20250425143156.204452-1-edgar.iglesias@gmail.com> <20250425143156.204452-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Apr 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Today, we don't track write-abiliy in the cache, if a user
> requests a readable mapping followed by a writeable mapping
> on the same page, the second lookup will incorrectly hit
> the readable entry.
> 
> Split mapcache_grants by ro and rw access. Grants will now
> have separate ways in the cache depending on writeability.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 2c8f861fdb..e31d379702 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -75,7 +75,8 @@ typedef struct MapCache {
>  } MapCache;
>  
>  static MapCache *mapcache;
> -static MapCache *mapcache_grants;
> +static MapCache *mapcache_grants_ro;
> +static MapCache *mapcache_grants_rw;
>  static xengnttab_handle *xen_region_gnttabdev;
>  
>  static inline void mapcache_lock(MapCache *mc)
> @@ -176,9 +177,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>       * Grant mappings must use XC_PAGE_SIZE granularity since we can't
>       * map anything beyond the number of pages granted to us.
>       */
> -    mapcache_grants = xen_map_cache_init_single(f, opaque,
> -                                                XC_PAGE_SHIFT,
> -                                                max_mcache_size);
> +    mapcache_grants_ro = xen_map_cache_init_single(f, opaque,
> +                                                   XC_PAGE_SHIFT,
> +                                                   max_mcache_size);
> +    mapcache_grants_rw = xen_map_cache_init_single(f, opaque,
> +                                                   XC_PAGE_SHIFT,
> +                                                   max_mcache_size);
>  
>      setrlimit(RLIMIT_AS, &rlimit_as);
>  }
> @@ -456,9 +460,13 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
>                         bool is_write)
>  {
>      bool grant = xen_mr_is_grants(mr);
> -    MapCache *mc = grant ? mapcache_grants : mapcache;
> +    MapCache *mc = mapcache;
>      uint8_t *p;
>  
> +    if (grant) {
> +        mc = is_write ? mapcache_grants_rw : mapcache_grants_ro;
> +    }
> +
>      if (grant && !lock) {
>          /*
>           * Grants are only supported via address_space_map(). Anything
> @@ -523,7 +531,10 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>  
>      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
>      if (addr == RAM_ADDR_INVALID) {
> -        addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
> +        addr = xen_ram_addr_from_mapcache_single(mapcache_grants_ro, ptr);
> +    }
> +    if (addr == RAM_ADDR_INVALID) {
> +        addr = xen_ram_addr_from_mapcache_single(mapcache_grants_rw, ptr);
>      }
>  
>      return addr;
> @@ -626,7 +637,8 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
>  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
>  {
>      xen_invalidate_map_cache_entry_single(mapcache, buffer);
> -    xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> +    xen_invalidate_map_cache_entry_single(mapcache_grants_ro, buffer);
> +    xen_invalidate_map_cache_entry_single(mapcache_grants_rw, buffer);
>  }
>  
>  static void xen_invalidate_map_cache_entry_bh(void *opaque)
> -- 
> 2.43.0
> 

