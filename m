Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEB92AC76
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 01:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755654.1164076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQxad-0005dH-Sr; Mon, 08 Jul 2024 23:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755654.1164076; Mon, 08 Jul 2024 23:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQxad-0005bW-P0; Mon, 08 Jul 2024 23:16:11 +0000
Received: by outflank-mailman (input) for mailman id 755654;
 Mon, 08 Jul 2024 23:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgpN=OI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sQxac-0005bJ-16
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 23:16:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e8a5fb2-3d80-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 01:16:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCC3B60B21;
 Mon,  8 Jul 2024 23:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B49BC116B1;
 Mon,  8 Jul 2024 23:16:06 +0000 (UTC)
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
X-Inumbo-ID: 0e8a5fb2-3d80-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720480567;
	bh=7GbhKYDsPcu4phzCxhMkluoCv88SVKjt2IIeSl0eL1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fuhRzxhtTlYg6/uMZ0zBVf8q2tH+55oFRpsD4wePGRGAwDbqRAIKrNKElayxuVPIg
	 trGxzlKBdczBoiiHzGduvNlsjuyBIRF+OxfLxKEhDOQI1yt4enBJcMHIXWdczlseJj
	 Q2I7/SmEBxzMXeUxtRV7xulu/IuCoGDF5mJwhNI3drTL7E711tON5swKQ7iKXck1el
	 im4YQaOwcwav3Wl6Vp15p3HO7Psl1zdXLST8+NiEyEOFoToaXAtvpjdogGQJEaxTvA
	 Q7TUKpb239tEzFQGYswTu1UQhCKR6gPlL/oIL+CjTUPbS1YsXIXLJXgpGqCAECGE/3
	 jA46/mW3IiKBA==
Date: Mon, 8 Jul 2024 16:16:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in
 buckets
In-Reply-To: <20240701224421.1432654-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2407081615590.3635@ubuntu-linux-20-04-desktop>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com> <20240701224421.1432654-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jul 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> This fixes the clobbering of the entry->next pointer when
> unmapping the first entry in a bucket of a mapcache.
> 
> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 5f23b0adbe..18ba7b1d8f 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          pentry->next = entry->next;
>          g_free(entry);
>      } else {
> -        memset(entry, 0, sizeof *entry);
> +        /*
> +         * Invalidate mapping but keep entry->next pointing to the rest
> +         * of the list.
> +         *
> +         * Note that lock is already zero here, otherwise we don't unmap.
> +         */
> +        entry->paddr_index = 0;
> +        entry->vaddr_base = NULL;
> +        entry->valid_mapping = NULL;
> +        entry->flags = 0;
> +        entry->size = 0;
>      }
>  }
>  
> -- 
> 2.43.0
> 

