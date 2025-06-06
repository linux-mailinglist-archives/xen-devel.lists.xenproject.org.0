Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7DBACFE0E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008089.1387303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSDW-000470-Lk; Fri, 06 Jun 2025 08:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008089.1387303; Fri, 06 Jun 2025 08:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSDW-000453-Hb; Fri, 06 Jun 2025 08:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1008089;
 Fri, 06 Jun 2025 08:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSDU-00044Y-UF
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:14:20 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ecf7775-42ae-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:14:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so20418015e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:14:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45209ce0b97sm15915745e9.9.2025.06.06.01.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:14:18 -0700 (PDT)
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
X-Inumbo-ID: 3ecf7775-42ae-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749197659; x=1749802459; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/nGcUxEK+SuKmowKg4XVxySr0bBKdS76bK7pSzUDSE=;
        b=bTmUBwNNYQoXtWjKgnzjSo8ZsUeAN9PPS32sq6uVI4FFco4uqE6BaPNYHVjbYPTwyx
         /oZDsz6GrNUr1HghWDmA7Yr6GuWqLXMmcils8J610vk8pVzmRqLX1UxRLSziEEBatpjN
         j7j/HVCOY1XM2w29+eCz72nWCMuaIZxswIfdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749197659; x=1749802459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/nGcUxEK+SuKmowKg4XVxySr0bBKdS76bK7pSzUDSE=;
        b=WeWOMxzKi4retnoHL3r7wf7Cdm46LyP/hxIXrDwUO9l8BQNVNT3FCbTGM+xKsmV2iK
         TKR+DT9Sl16O3TbHCqSX+oMarqEenqfGzlw5AJnzLOzHqTI5JnhgvuKtaVerLpQmmgxI
         hV7XjYtrKwS5NpFOsSC6//ICqHSfAG4u2vCMcvFB34GJKxnbfJEoEHpHZR1T+nBUwtZx
         Tb6dnbhn5MK2BEWwngxwGL8Amer2UvVfF3IlsQJyC7qnXfmrg8PvEkVQ9gLErwT3UGkr
         p/kQAljfQqK0UJ+lhaHQyDXz7PJLvTqPoGWp7qbFLrB/ur6xtZf2zRlUEYFIkkk8VmNP
         yFMw==
X-Gm-Message-State: AOJu0YxRbhd+apt1Ib146tSkDVJbF6acYmf5XKmyWIoR+aUsskWaIc7t
	D0Sq73fqgVfy6IfDBgJHfcQQR7rnJnMkLIeXP9AvZ89qEG+etfwb8W2pm6BATRIDtOY=
X-Gm-Gg: ASbGnctzpgb4PknOQxxKLEgCecGEN3cc/z2WeTeuiXXJ4hH7djjTcuhVtSv0LTWY8jO
	BP1wqzFf4LMsPCLDy6TbVctI37LcbdxwFtSfLn68YloAFDCfZX91d5ZNs5GI33jcP1yFW0/P/lS
	yi1NTU+om5IYPEdgzSbor3gWgfAcR07QTpWqeH29wr8ZePCCQSIwOeZcYBrG7Xm5tb3HetF8N+t
	sp2xxz2opcXkrns+EnxjHxmqJdu1KALFQGg7zq0f34pkLbu/FGDDlfivVR2JNj7oyaG0aL5755g
	CNj/goJ/SOCZkXSMuWjNvFmeJh3VisnCYDXD9g2XEtJJOJLAfsM27yXs1nJjazdpshQzaTrR2zP
	UJY1nYJE24N762z3UBfJTUtsRQwgN2A==
X-Google-Smtp-Source: AGHT+IF/1F3RsuJWsGXxmuB7HnlsS8mPbZFuIiUG+pKNCKu8rKvucsSpCE7Wt1mnPATcavGdCZF62Q==
X-Received: by 2002:a05:600c:1c92:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-451f88bead1mr76413145e9.13.1749197658847;
        Fri, 06 Jun 2025 01:14:18 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:14:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 05/11] xen: Create per-node outstanding claims
Message-ID: <aEKjWSkRXO099bRb@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-6-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-6-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:56PM +0000, Alejandro Vallejo wrote:
> Extends domain_set_outstanding_claims() to allow staking claims on an
> exact node. Also creates global per-node claim counts analogous to
> `outstanding_claims`. Note that the per-node counts can't replace the
> global one if we want exact-node claims to coexist with non-exact
> claims.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/page_alloc.c | 32 +++++++++++++++++++++++++++++++-
>  xen/include/xen/sched.h |  3 +++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 9243c4f51370..7fe574b29407 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -490,6 +490,7 @@ static unsigned long pernode_avail_pages[MAX_NUMNODES];
>  
>  static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
> +static unsigned long pernode_oc[MAX_NUMNODES]; /* per-node outstanding claims */
>  
>  unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
>                                        long pages)
> @@ -501,20 +502,31 @@ unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
>       * can test d->outstanding_pages race-free because it can only change
>       * if d->page_alloc_lock and heap_lock are both held, see also
>       * domain_set_outstanding_pages below
> +     *
> +     * If `d` has an exact-node claim, we must exit early if this is an
> +     * adjustment attributed to another node.
>       */
> -    if ( !d->outstanding_pages || pages <= 0 )
> +    if ( !d->outstanding_pages || pages <= 0 ||
> +         (d->claim_node != NUMA_NO_NODE && d->claim_node != node) )
>          goto out;
>  
> +
>      spin_lock(&heap_lock);
>      BUG_ON(outstanding_claims < d->outstanding_pages);
>      if ( d->outstanding_pages < pages )
>      {
>          /* `pages` exceeds the domain's outstanding count. Zero it out. */
> +        if ( d->claim_node != NUMA_NO_NODE )
> +            pernode_oc[d->claim_node] -= d->outstanding_pages;
> +
>          outstanding_claims -= d->outstanding_pages;
>          d->outstanding_pages = 0;
>      }
>      else
>      {
> +        if ( d->claim_node != NUMA_NO_NODE )
> +            pernode_oc[d->claim_node] -= pages;
> +
>          outstanding_claims -= pages;
>          d->outstanding_pages -= pages;
>      }
> @@ -542,6 +554,10 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
>      if ( pages == 0 )
>      {
>          outstanding_claims -= d->outstanding_pages;
> +
> +        if ( d->claim_node != NUMA_NO_NODE )
> +            pernode_oc[d->claim_node] -= d->outstanding_pages;
> +
>          d->outstanding_pages = 0;
>          ret = 0;
>          goto out;
> @@ -564,12 +580,26 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
>      /* how much memory is available? */
>      avail_pages = total_avail_pages - outstanding_claims;
>  
> +    /* This check can't be skipped for the NUMA case, or we may overclaim */
>      if ( pages > avail_pages )
>          goto out;
>  
> +    if ( node != NUMA_NO_NODE )
> +    {
> +        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
> +
> +        if ( pages > avail_pages )
> +            goto out;
> +    }
> +
>      /* yay, claim fits in available memory, stake the claim, success! */
>      d->outstanding_pages = pages;
>      outstanding_claims += d->outstanding_pages;
> +    d->claim_node = node;
> +
> +    if ( node != NUMA_NO_NODE )
> +        pernode_oc[node] += pages;
> +
>      ret = 0;
>  
>  out:
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c7e..307a9d749f5d 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -406,6 +406,9 @@ struct domain
>      unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
>      unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
>  
> +    /* NUMA node from which outstanding pages have been reserved */
> +    unsigned int     claim_node;

This should possibly be nodeid_t rather than unsigned int?

But why is this a single node?  The interface should allow for a
domain to claim memory from multiple different nodes.

The interface here seems to be focused on domains only being allowed
to allocate from a single node, or otherwise you must first allocate
memory from a node before moving to the next one (which defeats the
purpose of claims?).

I think we want to instead convert d->outstanding_pages into a
per-node array, so that a domain can have outstanding claims for
multiple NUMA nodes?

The hypercall interface becomes a bit awkward then, as the toolstack
has to perform a different hypercall for each memory claim from a
different node (and rollback in case of failure).  Ideally we would
need to introduce a new hypercall that allows making claims from
multiple nodes in a single locked region, as to ensure success or
failure in an atomic way.

Thanks, Roger.

