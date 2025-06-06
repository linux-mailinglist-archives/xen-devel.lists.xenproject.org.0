Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD51ACFE63
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008150.1387373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSWb-0001nM-NR; Fri, 06 Jun 2025 08:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008150.1387373; Fri, 06 Jun 2025 08:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSWb-0001lm-JF; Fri, 06 Jun 2025 08:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1008150;
 Fri, 06 Jun 2025 08:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSWa-0001ld-0i
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:34:04 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff90ff0e-42b0-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:34:02 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso1781820f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:34:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5323ab1a2sm1188690f8f.28.2025.06.06.01.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:34:00 -0700 (PDT)
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
X-Inumbo-ID: ff90ff0e-42b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749198841; x=1749803641; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/mxGPzUIk+ckZet2Chr7DDg9OAclwNjuncsWCHNZ08=;
        b=tyfqTlkGbXrbmR4JiGDYW9FRuTrKzgo7ll1hN1XUd5LmTsVBzE+y8mP6YA+jO1DCks
         rc+MlEAlxj8CVZCxMPkOS4EUThdXHidA9bd7XBAx3Fg1sBglY9n+TFZcKYOnkeCkaiTw
         z40Luu2+0PZ3L2sIxEK0o8WojEDfHUTq5GTgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198841; x=1749803641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/mxGPzUIk+ckZet2Chr7DDg9OAclwNjuncsWCHNZ08=;
        b=Zb4Qn5RJG4gfZ50GwyE54vInTNeDRKw08aIZCsSpCud8Vpy9eTZdLkiKzOg+FHAXEX
         ZmKVr2uCUK36xldfvw+3jj/Fr/W9nxbGSIswgNV9YJbxoN+viQtnbrn2UTXtnwVH6iei
         LzvZp6DAABlnOGHgI5Tp3kzi4W1SmKWb5ICV+DYHrWi0FIh17CYDo7QcoQRVQXjWJuIV
         DrlEVd8+lHsiMYM6bfGw8aqcvvSlLK1HueDCE17hrxZEidEkqxDycZvroeOgDW0o2nWS
         9ZkPPwuAWe9CBP8t6YlX29j2gDuYly1q7eafe1bTVi5081B7NXq/1lvPXLTLCP6wD4tx
         lVCg==
X-Gm-Message-State: AOJu0Yw6Ki5un5IaDnx5wtAT6GIjZ6mru8Vi7iijic6JwZyMCvCQERzD
	DzxNyVeekTd1/xfP6EmCEMi+X7KOVjwaqWGU/dPFNRMpx5NBghVKU8UWQj5h5+FvG9I=
X-Gm-Gg: ASbGnct9P06Yc2TaxX+4K+GgaQMPYbynpZlZ0GD6rvvsnnNIIabU6AWNHLvSN60lFpl
	/8MtZoe1k3Ogf1dv41O3voVnX8tuEgQeZttnbFRhVk+Q9aVrPfLn2ziEIEg8GiuL5SodEK/FROQ
	/9LrHvyfagvTCn88O4eMqHI3Ckhsp11z2cY6jPfg8+ojyT6gTqDAykCUfXGQLmXbonOtH3jFq/M
	mYP4AQL33ltS5is2UkWV+OV0kInt5uPeAIHY5/Ee8J3HSxbtrCR1jCyaFU0pQoPyclcPuUYGp/s
	z+WrYpJCIoonTL7duCR6fu2ih0SoZ6BxDz5Kc+kKWx6lxSQBalJFMjP2Oq22WbwXVnMhBymstSH
	JJBoLIEb0p0217CcKvn4ajvaS1m88ZQ==
X-Google-Smtp-Source: AGHT+IEBdPNi/syLaKKYtpbhxofPgsueHrL8usQGc/yYQ53Qw4lBFk0cK5NOLo95e3oZcoptw+wnHA==
X-Received: by 2002:a05:6000:18ac:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a531cb07b8mr2134316f8f.48.1749198841270;
        Fri, 06 Jun 2025 01:34:01 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:34:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 07/11] xen/page_alloc: Set node affinity when claiming
 pages from an exact node
Message-ID: <aEKn-DDBSl1FnyCB@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-8-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-8-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:58PM +0000, Alejandro Vallejo wrote:
> Set the domain's node affinity to the claimed node if the claim
> specified an exact node. Do it immediately before making any changes in
> case setting the affinity fails (even though it shouldn't).
> 
> This allows preferentially allocating from the closest NUMA node when
> "exact" is not specified (e.g: p2m tables, etc).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Toolstacks can just do it themselves, but it's more error prone. If it
> claimed pages from an exact node (and remember we can only hold a single
> claim at a time) it makes no sense for the domain to be intentionally
> allocating from NUMA nodes other than its home node.
> ---
>  xen/common/page_alloc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index cfaa64d3b858..e69a5fcc8d31 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -586,10 +586,16 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
>  
>      if ( node != NUMA_NO_NODE )
>      {
> -        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
> +        nodemask_t affinity = NODE_MASK_NONE;
>  
> +        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
>          if ( pages > avail_pages )
>              goto out;
> +
> +        node_set(node, affinity);
> +        ret = domain_set_node_affinity(d, &affinity);

You can use nodemask_of_node(node) here?

> +        if ( ret )
> +            goto out;

This seems a bit too much, specially failing the claim if the affinity
cannot be fulfilled.

If would maybe print a message if the claim is made against a
non-affine node, but that would be it.

Thanks, Roger.

