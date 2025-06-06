Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2B9ACFE2D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008102.1387312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSLs-0005wL-JL; Fri, 06 Jun 2025 08:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008102.1387312; Fri, 06 Jun 2025 08:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSLs-0005tS-GW; Fri, 06 Jun 2025 08:23:00 +0000
Received: by outflank-mailman (input) for mailman id 1008102;
 Fri, 06 Jun 2025 08:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSLr-0005tM-4j
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:22:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73f84b8b-42af-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:22:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so15842945e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:22:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45213726c44sm16165835e9.28.2025.06.06.01.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:22:57 -0700 (PDT)
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
X-Inumbo-ID: 73f84b8b-42af-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749198178; x=1749802978; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEqruCKXtuU4GhnlLVJr9x+2zLD92RBcnIFW5NVEHPQ=;
        b=X5DDI6jvnPX7Y5WXbLuEI+FlmwhhQK8+o7JCXkKOhzz6U9GW09cYD1ZP13D+X+hYWL
         nMejrG1Xy2QTDPhQv8gFql/pBbj2VT0/ZYlauiTJMaQey/ZNe0MnNRVkGv8v2iXi6lYm
         3x3uYOi8fSokqK46rKDqeKrf1YrmrDXMTP0H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198178; x=1749802978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEqruCKXtuU4GhnlLVJr9x+2zLD92RBcnIFW5NVEHPQ=;
        b=w+GoBiP8C5P34BJgv11/RC/PyQcIgSQ6QX/K7LILN5Q0rW58U4BsCW/hUptG6ajfny
         6iu3CycDC7aZ0YIAS7uUkqNZM+LENHXG/O/zD50qloQhRd6UwTNM0JGrSdpz4EoJF167
         KiIvTlfKBmoXcpPim93BcUvE4QCbnjpiWcPohppjxoP8Z6aLtAzeMSoKamkjjQdG1hTy
         e9zT0ROcSMtnXuACYUASXNOVbFX6dbEyB2DUBiDv4pkVWVAq8bgdfdwsZYVI8xygjd+g
         9ePHYOILeV0BH1Vg8B6iB+agfUxy/g22r+Fm0rigtfZAMVLkSnPDRwoPByWVxA1povfH
         6kQg==
X-Gm-Message-State: AOJu0YzJAjH6XiAlHhSwM1URuTGFwfqhvgriUgIF/W0aE5zXMbHnamC5
	UUqQxYMuJymRfEV4ADJJ69AZp2Kh9HHkMU/1a95S5XN9rK/u5TY3WpWM60wACUGRKyc=
X-Gm-Gg: ASbGnctYue4HM6Blyk1htkXvigOD+n1phDFdw+aMUbYslnIoen57ge+dFFG99Ff+F5u
	cU3Zf4Jdm7pdWW2ZEGLoOzivSEeCqn+3kK3MX+iQYFfQljUz05DofjGSNznYG74Kq/NWZECcMcj
	Y2tAA2saYT4BGz25eEsnr6UFaYpNwsbRKNxkQogeljIjU1jIBvBXmqrurGH8V7GT1k7+o3C0x8R
	Pj3viWIPmjUYbmwpV9g5vx88INq7i1GIUec+VeNRFfkJiTj0FjzrWx4Q4YwlTui56008PvJ6K+a
	daJ2ImMg9jdqZwbDpgRRt8U8/XyPdNHE8Ht4ZRjOn8FqqD3rlXKNatiSd6j1/jvlPKfLQ2KKHDu
	KXn20cyMUsS8Y4ggWWJ6tu2zU1q/ncQ==
X-Google-Smtp-Source: AGHT+IExsMr2tJqj8pWknFB5DxVstQonM3TFEcr+WvfBdd9KWPgathayxMCgZs/udbEnSOB5ErwIjw==
X-Received: by 2002:a05:600c:6099:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-452013bb38dmr31216295e9.17.1749198177596;
        Fri, 06 Jun 2025 01:22:57 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:22:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 06/11] xen/page_alloc: Hook per-node claims to
 alloc_heap_pages()
Message-ID: <aEKlYAp3PkXC5OsE@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-7-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-7-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:57PM +0000, Alejandro Vallejo wrote:
> Extend the claim checks in alloc_heap_pages() to exact-node claims. The
> logic is slightly more complicated, so the patch moves it all to an
> auxiliary function.
> 
> exact-node claims also follow global claims in order to ensure both can
> coexist in the same system.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/page_alloc.c | 44 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 7fe574b29407..cfaa64d3b858 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -991,6 +991,46 @@ static void init_free_page_fields(struct page_info *pg)
>      page_set_owner(pg, NULL);
>  }
>  
> +/*
> + * Determine whether a heap allocation is allowed after considering all
> + * outstanding claims in the system.
> + *
> + * Exact-node allocations must also take into account global claims!
> + *
> + * e.g:
> + *   Consider a domain for which toolstack issued a non-exact claim of 75% of
> + *   host memory and another domain for which toolstack tries to issue an
> + *   exact-node claim of 50% of host memory. If the exact claim didn't consider
> + *   non-exact claims too we would overallocate, which is exactly what claims

s/overallocate/overclaim/ or maybe "attempt to overallocate".

> + *   are trying to prevent.
> + */
> +static bool can_alloc(struct domain *d, unsigned int memflags,

d can be const here, this helper is just a checker that doesn't modify
anything.

> +                      unsigned long request)
> +{
> +    nodeid_t node = (memflags & MEMF_exact_node) ? MEMF_get_node(memflags) :
> +                                                   NUMA_NO_NODE;
> +
> +    if ( outstanding_claims + request <= total_avail_pages )
> +    {
> +        if ( node == NUMA_NO_NODE )
> +            return true;
> +
> +        if ( pernode_oc[node] + request <= pernode_avail_pages[node] )
> +            return true;
> +    }

You can possibly join all conditions in a single clause?

if ( outstanding_claims + request <= total_avail_pages &&
     (node == NUMA_NO_NODE ||
      pernode_oc[node] + request <= pernode_avail_pages[node]) )
    return true;

> +
> +    /*
> +     * Not enough unclaimed memory. Only allow if it's already claimed on the
> +     * right node. d->claim_node == NUMA_NO_NODE if the claim isn't on an
> +     * exact node.
> +     *
> +     * Only refcounted allocs attributed to domains may have been claimed

Nit: missing full stop at the end of the sentence.

Thanks, Roger.

