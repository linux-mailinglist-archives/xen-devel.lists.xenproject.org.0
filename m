Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA488B90F4
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 23:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715480.1117139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2H4w-00070l-48; Wed, 01 May 2024 21:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715480.1117139; Wed, 01 May 2024 21:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2H4w-0006yS-1L; Wed, 01 May 2024 21:01:26 +0000
Received: by outflank-mailman (input) for mailman id 715480;
 Wed, 01 May 2024 21:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2H4u-0006yM-QH
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 21:01:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6777847-07fd-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 23:01:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C679861904;
 Wed,  1 May 2024 21:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5CDC072AA;
 Wed,  1 May 2024 21:01:18 +0000 (UTC)
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
X-Inumbo-ID: f6777847-07fd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714597280;
	bh=dtQxKmYbUUAzg4PTwI2TWD3iTTIdynxCbqah4NU3uMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VdMU18FGFqxEyNw0aTaOPXv3Ul/pct0Iux+iBqKTrtj4cklV45ZUfU02ttl+Kcou1
	 v2UD5KcbOZPVKahSrDO4YFe+mv9tOe2afCiRtm+bw+Yf7rJPNwX0EgTJtwXMsTAhmz
	 J0GwF1MF6Ob/tMTgNFRoALk6BfmfY0VI6D8GKxWecK7bOfKwBlFFQAhIQI/00ciHYf
	 0eCkPb2QQpktbhCP4bXySCiz1vyREpiFg+NURL3RAN6m+s1+NnkdJvSxAf5rd3MO0e
	 bJCG9DCYMa6q0xVYkZgJq8Ou206Tkke9AEmhioil3oASgMlz6f18c/lpkR/NEMUKRJ
	 xAotpSCdUaKrQ==
Date: Wed, 1 May 2024 14:01:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 12/17] xen: mapcache: Unmap first entries in buckets
In-Reply-To: <20240430164939.925307-13-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011401110.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-13-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> When invalidating memory ranges, if we happen to hit the first
> entry in a bucket we were never unmapping it. This was harmless
> for foreign mappings but now that we're looking to reuse the
> mapcache for transient grant mappings, we must unmap entries
> when invalidated.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 4f98d284dd..0365311788 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -486,18 +486,22 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          return;
>      }
>      entry->lock--;
> -    if (entry->lock > 0 || pentry == NULL) {
> +    if (entry->lock > 0) {
>          return;
>      }
>  
> -    pentry->next = entry->next;
>      ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
>      if (munmap(entry->vaddr_base, entry->size) != 0) {
>          perror("unmap fails");
>          exit(-1);
>      }
> -    g_free(entry->valid_mapping);
> -    g_free(entry);
> +    if (pentry) {
> +        pentry->next = entry->next;
> +        g_free(entry->valid_mapping);
> +        g_free(entry);
> +    } else {
> +        memset(entry, 0, sizeof *entry);
> +    }
>  }
>  
>  typedef struct XenMapCacheData {
> -- 
> 2.40.1
> 

