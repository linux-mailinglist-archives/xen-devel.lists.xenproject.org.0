Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F830ACF49C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007201.1386505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDjg-0006RL-BS; Thu, 05 Jun 2025 16:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007201.1386505; Thu, 05 Jun 2025 16:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDjg-0006Ov-8s; Thu, 05 Jun 2025 16:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1007201;
 Thu, 05 Jun 2025 16:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNDjf-0006Op-EJ
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:46:35 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3f06573-422c-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 18:46:34 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a375888297so832794f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 09:46:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe5b962sm24680645f8f.7.2025.06.05.09.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 09:46:33 -0700 (PDT)
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
X-Inumbo-ID: a3f06573-422c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749141994; x=1749746794; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tF2RYmlrfsihfCJDHABaxRuBbzTraqXR8hxQV/ylMr8=;
        b=gr33vLP4I8lCoR2AWm90kohEu7MqlWwGESCaAHU+XuTnYL3nS+OF+a9tzBWIOgc/xI
         5fJw3SpDCbitdS4ku8/M22Qfeao9H/KV7Y/D5w5w3vJ4wLHLkdY5uaKN36ALx4nX9EC7
         bmonZg2HcBUAxiq/6kRHni1OebIgwrBT3UfQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141994; x=1749746794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2RYmlrfsihfCJDHABaxRuBbzTraqXR8hxQV/ylMr8=;
        b=tCS1GF39+H8KLJkc0feSvHIgOAZz6KjmtAkz0ugI044B40NHYmoV9CMFvxnwoFbWol
         JiMOhh36Nvh6DLaqxofqZKVCYEBtUv7BHa2OSyKHgv6kNYaAp7BxZOigkQ4dBf8x6pG+
         LRgnCMG6MIeDYL03WX9+hy9OZRHjox/D189k4pCMLQIkMsryFgH6PSEQVbKarsvIoR7N
         75AW6NjS2w4uy6pov8VTwHDcSp2T2RlPZAIIKA76jV10uOC0ARimWAlXWZfrhtDmkMVE
         OonP64RrOeJyngbDVMwyC2FZoYmp2WNHFkFEAt3+dJMNzVqFJJFNi5VRFx15GbQ2ccLk
         Ljyg==
X-Gm-Message-State: AOJu0YwgnvNKH0u0MFnVx0TQ8c4+YymWWf4YakrF3w6k1zo3uV7ULtZI
	WPZADywT0BIwCQUVbhObrIGwuZDp2+WTBi/dLXg+wM1jTuC5fvZJ9JOjG7A2R1AmvkQ=
X-Gm-Gg: ASbGncsm8NcsmXF0gUE8Orloj0BaioK7iVHWuHSea2oEGyk+5kh/JOO3wiA2Pm4b2XW
	uVBK2Lj1qehps6O3hDTBBdGrPi4S0azgZeVlyFfgx2J1KeZQuch9SV1TNWaP4TkGCzChnM9WOy7
	F38tUPPD/iWnWCWqC0zg8tij78ZOhLfwGkAOeswGIBHEOCfnS3yF/wlxGe2Q9dzVxDVj6YTw3rN
	7mjNQEsD0jNeSm7+kUZiNUPJCmlxJDy/M4Sn1O7iszoSPoYTG/RwIzHE9Q6ouS9V9YwbuXA+Ppp
	U5tjyQWrcwO9vU8bsTSf+5M1G3Ff6+srSMh13eZL+v1wTxjqjhnBJIY61rSaXX0v0KFkbXK/3cl
	LuMEsDoWzMyGYFwYZ3oM=
X-Google-Smtp-Source: AGHT+IG/mMzq/AsY9m/PASllsxJuaaE8S5HeQ9m4s0iN+w5ISImeeXMzN421WZNvEjhRvXAxvbV+Mw==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a526dcdd91mr3846479f8f.8.1749141994007;
        Thu, 05 Jun 2025 09:46:34 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:46:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/11] xen/page_alloc: Add static per-node counts of free
 pages
Message-ID: <aEHJ6FwvhaMXhVr9@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-4-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-4-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:54PM +0000, Alejandro Vallejo wrote:
> These are effectively the sum of free memory in all zones of each node.
> It's an optimization to avoid doing that operation frequently in
> following patches that introduce exact-node claims.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/page_alloc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 49c3258169db..733b0300a767 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -485,6 +485,9 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
>  static unsigned long *avail[MAX_NUMNODES];
>  static long total_avail_pages;
>  
> +/* Per-node counts of free pages */
> +static unsigned long pernode_avail_pages[MAX_NUMNODES];
> +
>  static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
>  
> @@ -1033,6 +1036,7 @@ static struct page_info *alloc_heap_pages(
>  
>      ASSERT(avail[node][zone] >= request);
>      avail[node][zone] -= request;
> +    pernode_avail_pages[node] -= request;

Since it's done for the per-zone tracking, you might as well add:

ASSERT(pernode_avail_pages[node] >= request);

here?

Thanks, Roger.

