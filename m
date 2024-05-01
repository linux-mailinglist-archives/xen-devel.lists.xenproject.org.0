Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C769B8B90CC
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715458.1117100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GrE-0001t6-Cs; Wed, 01 May 2024 20:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715458.1117100; Wed, 01 May 2024 20:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GrE-0001rG-98; Wed, 01 May 2024 20:47:16 +0000
Received: by outflank-mailman (input) for mailman id 715458;
 Wed, 01 May 2024 20:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2GrC-0001Ia-BK
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:47:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbcdffd5-07fb-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:47:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC33B61904;
 Wed,  1 May 2024 20:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C082C072AA;
 Wed,  1 May 2024 20:47:08 +0000 (UTC)
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
X-Inumbo-ID: fbcdffd5-07fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596430;
	bh=IVFlG7/OVVyRn1qxCbkB1eYEoi2tCROExBghLoORPn8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZuKGz8T++r4J9yyT7gooAxbI6V4XYbjjj35r+Q65vhiG00BNIgnMIKVEEdbD00LiV
	 WTmpfZyWtwkyc5OaDFEuAKlTtJwnw7WMMRmTjaVuUXbxUYOgkS5HXHXGTbxg/uRXEq
	 pFuHoFqFlAEri3F2MrPGYRUcAtA/Ofj1g29kUMY4c0RS9j2p4AdQ6iONBQ1pJ684GX
	 I9T1wTkhm4x1Ryd3EVUN4GEAI+t1H0Y1piD53f4jB10ri7ENpPOS179FFMSZP7WYFw
	 YHjlz64D7KgBQVvcBR6xAvOB44IXdQrbhjAPG+PKOsq9pRiiIcux/PS0lk8nA4lZz8
	 K1FaO9fKKT5QQ==
Date: Wed, 1 May 2024 13:47:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 08/17] xen: mapcache: Refactor
 xen_invalidate_map_cache_entry_unlocked
In-Reply-To: <20240430164939.925307-9-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011347000.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-9-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add MapCache argument to xen_invalidate_map_cache_entry_unlocked.
> This is in preparation for supporting multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 6e758eff94..34454da2f6 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -420,7 +420,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>      return xen_ram_addr_from_mapcache_single(mapcache, ptr);
>  }
>  
> -static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
> +static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> +                                                    uint8_t *buffer)
>  {
>      MapCacheEntry *entry = NULL, *pentry = NULL;
>      MapCacheRev *reventry;
> @@ -428,7 +429,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
>      hwaddr size;
>      int found = 0;
>  
> -    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> +    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
>          if (reventry->vaddr_req == buffer) {
>              paddr_index = reventry->paddr_index;
>              size = reventry->size;
> @@ -438,7 +439,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
>      }
>      if (!found) {
>          trace_xen_invalidate_map_cache_entry_unlocked_not_found(buffer);
> -        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> +        QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
>              trace_xen_invalidate_map_cache_entry_unlocked_found(
>                  reventry->paddr_index,
>                  reventry->vaddr_req
> @@ -446,15 +447,15 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
>          }
>          return;
>      }
> -    QTAILQ_REMOVE(&mapcache->locked_entries, reventry, next);
> +    QTAILQ_REMOVE(&mc->locked_entries, reventry, next);
>      g_free(reventry);
>  
> -    if (mapcache->last_entry != NULL &&
> -        mapcache->last_entry->paddr_index == paddr_index) {
> -        mapcache->last_entry = NULL;
> +    if (mc->last_entry != NULL &&
> +        mc->last_entry->paddr_index == paddr_index) {
> +        mc->last_entry = NULL;
>      }
>  
> -    entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
> +    entry = &mc->entry[paddr_index % mc->nr_buckets];
>      while (entry && (entry->paddr_index != paddr_index || entry->size != size)) {
>          pentry = entry;
>          entry = entry->next;
> @@ -488,7 +489,7 @@ static void xen_invalidate_map_cache_entry_bh(void *opaque)
>      XenMapCacheData *data = opaque;
>  
>      mapcache_lock(mapcache);
> -    xen_invalidate_map_cache_entry_unlocked(data->buffer);
> +    xen_invalidate_map_cache_entry_unlocked(mapcache, data->buffer);
>      mapcache_unlock(mapcache);
>  
>      aio_co_wake(data->co);
> @@ -506,7 +507,7 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
>          qemu_coroutine_yield();
>      } else {
>          mapcache_lock(mapcache);
> -        xen_invalidate_map_cache_entry_unlocked(buffer);
> +        xen_invalidate_map_cache_entry_unlocked(mapcache, buffer);
>          mapcache_unlock(mapcache);
>      }
>  }
> -- 
> 2.40.1
> 

