Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C38B90CB
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715449.1117090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GqE-0001L5-W7; Wed, 01 May 2024 20:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715449.1117090; Wed, 01 May 2024 20:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GqE-0001Ii-SY; Wed, 01 May 2024 20:46:14 +0000
Received: by outflank-mailman (input) for mailman id 715449;
 Wed, 01 May 2024 20:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2GqD-0001Ia-Dd
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:46:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5656890-07fb-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:46:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC645CE139B;
 Wed,  1 May 2024 20:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F93AC072AA;
 Wed,  1 May 2024 20:46:02 +0000 (UTC)
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
X-Inumbo-ID: d5656890-07fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596365;
	bh=NArfGwWOnY6xyqS3W5ubl410JY9KsJxvONK6riU3GOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HHwNvdY2yKMVzPmRX8GkA9qORm2TkcII9FkOlpbsMceq9wUHFpeUG6DwZbn/75m7S
	 gSwRdvKsTLBYG0tW540NuLGw4WW32Sm2ojn5QCMbmQReQelL/s9u1cSsa6dOzCud+E
	 1RDEjW/MvHQdXBM8oNZOl9uOC+TCcP2cpFuknsM+7kd9eI/d3fnyILqbc5iRvnRKox
	 uCcTy3cCvjL7wn2P/DMFPzq81WK3qNmqY9Q3tcchT4N6juZoco/8ZoRhINDZXIHdCG
	 4/Ny13TpMRNKoqa/WH4whayB+NiNSmP/C87BkFDTXqDkWZhupOslvWrD/MYY3nddtQ
	 0+dEZAM3hh95Q==
Date: Wed, 1 May 2024 13:46:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 07/17] xen: mapcache: Refactor
 xen_replace_cache_entry_unlocked
In-Reply-To: <20240430164939.925307-8-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011345140.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-8-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add MapCache argument to xen_replace_cache_entry_unlocked in
> preparation for supporting multiple map caches.
> 
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/xen/xen-mapcache.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index d2deff70c8..6e758eff94 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -556,7 +556,8 @@ void xen_invalidate_map_cache(void)
>      mapcache_unlock(mapcache);
>  }
>  
> -static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
> +static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> +                                                 hwaddr old_phys_addr,
>                                                   hwaddr new_phys_addr,
>                                                   hwaddr size)
>  {
> @@ -578,7 +579,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
>          cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
>      }
>  
> -    entry = &mapcache->entry[address_index % mapcache->nr_buckets];
> +    entry = &mc->entry[address_index % mc->nr_buckets];
>      while (entry && !(entry->paddr_index == address_index &&
>                        entry->size == cache_size)) {
>          entry = entry->next;

There is still a global mapcache pointer in use in this function:

  xen_remap_bucket(mapcache, entry, entry->vaddr_base,


> @@ -614,7 +615,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>      uint8_t *p;
>  
>      mapcache_lock(mapcache);
> -    p = xen_replace_cache_entry_unlocked(old_phys_addr, new_phys_addr, size);
> +    p = xen_replace_cache_entry_unlocked(mapcache, old_phys_addr,
> +                                         new_phys_addr, size);
>      mapcache_unlock(mapcache);
>      return p;
>  }
> -- 
> 2.40.1
> 

