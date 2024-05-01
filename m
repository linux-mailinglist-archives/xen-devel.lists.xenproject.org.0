Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4F8B90DE
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715461.1117110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GsQ-0002Rm-La; Wed, 01 May 2024 20:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715461.1117110; Wed, 01 May 2024 20:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GsQ-0002Q5-II; Wed, 01 May 2024 20:48:30 +0000
Received: by outflank-mailman (input) for mailman id 715461;
 Wed, 01 May 2024 20:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2GsP-0002Pv-Ti
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:48:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286287b2-07fc-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 22:48:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7214FCE139C;
 Wed,  1 May 2024 20:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA10C072AA;
 Wed,  1 May 2024 20:48:21 +0000 (UTC)
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
X-Inumbo-ID: 286287b2-07fc-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596504;
	bh=uB6XjGflA6a/Z9KWVzsfz+aOYvxcUGxBLL/TwR9pkFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iwekIfW4ncfiIJmnmkdKgjvkep1Mtu/5PqdNUKPK4DjotSAhdrFGNF15yY5//N7/e
	 K1VxqOgnLkfoPkk7xTCOf3hqRoMNcNOp7lygw2QHtsdXBJxT6I2yvkqJ2Wo3nyYrk7
	 tPfeP5kbp9W0CJMn/JyMClbtqLB8fh0JTlQB+1ENg3lBinJIuSiqRZK8dxkT1IubrX
	 G89QC/1Yvu1uwQOGTyG1nnNkHcRIFpYGCoknkppuwhJhH5Oem/i8Lf5XIX+flZ7aeM
	 MIs9DuoSsHZ/Oejv41Dd4d6wxqPf4Pxldgze/ZZp1BayZUT/v86E5WlG5NS2gPUX8A
	 vNR0wxzo+Fi2Q==
Date: Wed, 1 May 2024 13:48:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 09/17] xen: mapcache: Break out
 xen_invalidate_map_cache_single()
In-Reply-To: <20240430164939.925307-10-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011348130.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-10-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out xen_invalidate_map_cache_single().
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 34454da2f6..dd08cd296b 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -512,17 +512,14 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
>      }
>  }
>  
> -void xen_invalidate_map_cache(void)
> +static void xen_invalidate_map_cache_single(MapCache *mc)
>  {
>      unsigned long i;
>      MapCacheRev *reventry;
>  
> -    /* Flush pending AIO before destroying the mapcache */
> -    bdrv_drain_all();
> -
> -    mapcache_lock(mapcache);
> +    mapcache_lock(mc);
>  
> -    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> +    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
>          if (!reventry->dma) {
>              continue;
>          }
> @@ -530,8 +527,8 @@ void xen_invalidate_map_cache(void)
>                                         reventry->vaddr_req);
>      }
>  
> -    for (i = 0; i < mapcache->nr_buckets; i++) {
> -        MapCacheEntry *entry = &mapcache->entry[i];
> +    for (i = 0; i < mc->nr_buckets; i++) {
> +        MapCacheEntry *entry = &mc->entry[i];
>  
>          if (entry->vaddr_base == NULL) {
>              continue;
> @@ -552,9 +549,17 @@ void xen_invalidate_map_cache(void)
>          entry->valid_mapping = NULL;
>      }
>  
> -    mapcache->last_entry = NULL;
> +    mc->last_entry = NULL;
>  
> -    mapcache_unlock(mapcache);
> +    mapcache_unlock(mc);
> +}
> +
> +void xen_invalidate_map_cache(void)
> +{
> +    /* Flush pending AIO before destroying the mapcache */
> +    bdrv_drain_all();
> +
> +    xen_invalidate_map_cache_single(mapcache);
>  }
>  
>  static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> -- 
> 2.40.1
> 

