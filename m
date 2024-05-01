Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C98B90C3
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715443.1117079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Go8-0000gG-Hl; Wed, 01 May 2024 20:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715443.1117079; Wed, 01 May 2024 20:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Go8-0000e2-FB; Wed, 01 May 2024 20:44:04 +0000
Received: by outflank-mailman (input) for mailman id 715443;
 Wed, 01 May 2024 20:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Go7-0000cC-89
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:44:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8895d4c5-07fb-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:44:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30EFACE13A1;
 Wed,  1 May 2024 20:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C9AC072AA;
 Wed,  1 May 2024 20:43:54 +0000 (UTC)
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
X-Inumbo-ID: 8895d4c5-07fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596236;
	bh=dMPFSioNpeKX2paci1uyX5JomVV7+chkLPnWnqSos4g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kaD1Ev+gEHDi1RM3cxVcWSCs1dGKiF7D6a4EEPW01+V2qzesATeYhJtscbgpusFWj
	 WZ0b84Wlrnw+W+nPG/R8jiLTiRUihlQaFtdPpwJh7hq0MkXQpdmFaI4IERTa3c5xX0
	 +zoAUdmoHAA4Fz18zF82DnmDI6V6vs8ATDbtDaOoodBL9OmlYBkfKLY9psFSo6Rlbl
	 Qzpi5NoRJvRrf/7rq/0dithiLHVzGz7EtIgwPm2EeQWB0BuxWoTbj21x3oW3Eexp14
	 8V/Kxs7WITjcqm2EdaiwDRGwUsLhce7VVyBnSdkxaW0p9tP7a7632d/UZ0Y2WFv6Ok
	 lXiUWh9A3P23g==
Date: Wed, 1 May 2024 13:43:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 06/17] xen: mapcache: Break out
 xen_ram_addr_from_mapcache_single
In-Reply-To: <20240430164939.925307-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011343460.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out xen_ram_addr_from_mapcache_single(), a multi-cache
> aware version of xen_ram_addr_from_mapcache.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 326a9b61ca..d2deff70c8 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -377,7 +377,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
>      return p;
>  }
>  
> -ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> +static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
>  {
>      MapCacheEntry *entry = NULL;
>      MapCacheRev *reventry;
> @@ -386,8 +386,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>      ram_addr_t raddr;
>      int found = 0;
>  
> -    mapcache_lock(mapcache);
> -    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> +    mapcache_lock(mc);
> +    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
>          if (reventry->vaddr_req == ptr) {
>              paddr_index = reventry->paddr_index;
>              size = reventry->size;
> @@ -396,11 +396,11 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          }
>      }
>      if (!found) {
> -        mapcache_unlock(mapcache);
> +        mapcache_unlock(mc);
>          return RAM_ADDR_INVALID;
>      }
>  
> -    entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
> +    entry = &mc->entry[paddr_index % mc->nr_buckets];
>      while (entry && (entry->paddr_index != paddr_index || entry->size != size)) {
>          entry = entry->next;
>      }
> @@ -411,10 +411,15 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
>               ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
>      }
> -    mapcache_unlock(mapcache);
> +    mapcache_unlock(mc);
>      return raddr;
>  }
>  
> +ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> +{
> +    return xen_ram_addr_from_mapcache_single(mapcache, ptr);
> +}
> +
>  static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
>  {
>      MapCacheEntry *entry = NULL, *pentry = NULL;
> -- 
> 2.40.1
> 

