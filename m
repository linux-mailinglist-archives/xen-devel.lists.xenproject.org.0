Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA39A5E836
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910961.1317536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVKM-0004vc-8p; Wed, 12 Mar 2025 23:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910961.1317536; Wed, 12 Mar 2025 23:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVKM-0004te-5v; Wed, 12 Mar 2025 23:17:30 +0000
Received: by outflank-mailman (input) for mailman id 910961;
 Wed, 12 Mar 2025 23:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVKK-0004tX-1n
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:17:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28effb5b-ff98-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:17:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 651085C06E1;
 Wed, 12 Mar 2025 23:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958C4C4CEDD;
 Wed, 12 Mar 2025 23:17:23 +0000 (UTC)
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
X-Inumbo-ID: 28effb5b-ff98-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821444;
	bh=O2sr8/6nvxZWzJvQj9pzFJZiuOCkxc8RSxlwXZfGDqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JKJYWonFztb/Ohr1uydYnD5wHisn6ylusuWEOX+6tiDp92JUzrmnALjqsLbNStVP2
	 XM3yHrYsSSef4nNVP7dSHeAhHrUpSvdXIqb2TSQfS48xd5PlQPFwKhYOTGx9axIfuI
	 phBjgYjV1dcR8TMIPP6xT/DFQUlUlaezQcF1UpaYpAmYW8jqONlgpmr7svJ23XXzsA
	 Z8oQcgyxy0OuLc9ZQtVjaaWMSxZ1dV/TjgsGJ6liYPPSJWYi7o6dmh7er4SN0iQizI
	 7EhEyY/c2+WB6G5ldgaI+FexDxjMdzB3He0hJg5p9Y4ox2ESIXCHzDno2rTH4DxgBa
	 vNJs+qpG6Pa0A==
Date: Wed, 12 Mar 2025 16:17:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 10/19] xen/page: fix return type of online_page()
In-Reply-To: <20250312040632.2853485-11-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121617160.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-11-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> This commit fixes return type of online_page(), which shall be int
> to include correct error value.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c | 2 +-
>  xen/include/xen/mm.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 1bf070c8c5..b5ec4bda7d 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1764,7 +1764,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
>   *   The caller should make sure end_pfn <= max_page,
>   *   if not, expand_pages() should be called prior to online_page().
>   */
> -unsigned int online_page(mfn_t mfn, uint32_t *status)
> +int online_page(mfn_t mfn, uint32_t *status)
>  {
>      unsigned long x, nx, y;
>      struct page_info *pg;
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 16f733281a..ae1c48a615 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -144,7 +144,7 @@ unsigned long avail_domheap_pages(void);
>  unsigned long avail_node_heap_pages(unsigned int nodeid);
>  #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
>  #define free_domheap_page(p)  (free_domheap_pages(p,0))
> -unsigned int online_page(mfn_t mfn, uint32_t *status);
> +int online_page(mfn_t mfn, uint32_t *status);
>  int offline_page(mfn_t mfn, int broken, uint32_t *status);
>  int query_page_offline(mfn_t mfn, uint32_t *status);
>  
> -- 
> 2.34.1
> 

