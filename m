Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEAC8B90BF
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715438.1117069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GmW-00081z-7e; Wed, 01 May 2024 20:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715438.1117069; Wed, 01 May 2024 20:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2GmW-00080Z-4y; Wed, 01 May 2024 20:42:24 +0000
Received: by outflank-mailman (input) for mailman id 715438;
 Wed, 01 May 2024 20:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2GmU-00080J-M2
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:42:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d39d447-07fb-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 22:42:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CD03CCE1397;
 Wed,  1 May 2024 20:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B17DC072AA;
 Wed,  1 May 2024 20:42:14 +0000 (UTC)
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
X-Inumbo-ID: 4d39d447-07fb-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714596137;
	bh=aPj5Km8vv8/JMkrkcHnSlAuBWQc5h+3YCn0oWQVhKgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pw9mN7wE5W0kBjURzYbZPaBpQgGclQKmXA5GVhbirwYjucLiZQSWH7SP3t5q0YiBM
	 80nhotmvGLNq5tsd9pMDfz+KTrGgOouy+4lq1zwK/eTa2xvcecYAIlNOQ1I7iL8g6P
	 /y5EoO/q/FuK8kScb+QtEGdus9bhzjjs0PqDzz0dOiPhXA0sTslGh/P77zDGgASjpt
	 dyWbkanAWsVhV7+zIK8f3pb4LvCKdzNFoRIwIYAQGl+D5T/eeY8dAxf+ZNwK6Ml3Ju
	 WV9eJ3D6Fu/Amw7iz5yMn2Ajf9Lniq6j3iJHgF3cynIsJiiHVpGTpGmN01+BqCBkH+
	 +0BBo1A0RjUaQ==
Date: Wed, 1 May 2024 13:42:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 05/17] xen: mapcache: Refactor xen_remap_bucket for
 multi-instance
In-Reply-To: <20240430164939.925307-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011341590.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add MapCache argument to xen_remap_bucket in preparation
> to support multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 896021d86f..326a9b61ca 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -139,7 +139,8 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>      mapcache->entry = g_malloc0(size);
>  }
>  
> -static void xen_remap_bucket(MapCacheEntry *entry,
> +static void xen_remap_bucket(MapCache *mc,
> +                             MapCacheEntry *entry,
>                               void *vaddr,
>                               hwaddr size,
>                               hwaddr address_index,
> @@ -313,14 +314,14 @@ tryagain:
>      if (!entry) {
>          entry = g_new0(MapCacheEntry, 1);
>          pentry->next = entry;
> -        xen_remap_bucket(entry, NULL, cache_size, address_index, dummy);
> +        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
>      } else if (!entry->lock) {
>          if (!entry->vaddr_base || entry->paddr_index != address_index ||
>                  entry->size != cache_size ||
>                  !test_bits(address_offset >> XC_PAGE_SHIFT,
>                      test_bit_size >> XC_PAGE_SHIFT,
>                      entry->valid_mapping)) {
> -            xen_remap_bucket(entry, NULL, cache_size, address_index, dummy);
> +            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
>          }
>      }
>  
> @@ -587,7 +588,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
>  
>      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
>  
> -    xen_remap_bucket(entry, entry->vaddr_base,
> +    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
>                       cache_size, address_index, false);
>      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
>                  test_bit_size >> XC_PAGE_SHIFT,
> -- 
> 2.40.1
> 

