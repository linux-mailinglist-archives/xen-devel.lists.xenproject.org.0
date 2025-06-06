Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B988BACFE66
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008160.1387383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSZC-0002Ra-6a; Fri, 06 Jun 2025 08:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008160.1387383; Fri, 06 Jun 2025 08:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSZC-0002Ox-3B; Fri, 06 Jun 2025 08:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1008160;
 Fri, 06 Jun 2025 08:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSZA-0002Or-Pp
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:36:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6009e1c3-42b1-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:36:43 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1309511f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:36:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532435b16sm1202100f8f.46.2025.06.06.01.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:36:42 -0700 (PDT)
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
X-Inumbo-ID: 6009e1c3-42b1-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749199003; x=1749803803; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dT8fO8t9WtIEPvhYjTWhihtqz0QAIwi8CBDgqTH75jk=;
        b=p95YxYZIncr0xFSJMJqz848F7T8jeRmICc4lFUz6laR3CtUpWPNi96XBAyUduwG9yt
         1umxvxPDBUDtQHXA0AZipzCEE01v5iS6dP8sp2OLVKXAW3sPfnU3KV/B+am8UdeVSuD8
         5qstCG7SR2nKvrTR01U1Rn/0cBjx3AyA4/H4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199003; x=1749803803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT8fO8t9WtIEPvhYjTWhihtqz0QAIwi8CBDgqTH75jk=;
        b=kJR08h/JQeSHRc7M7ME744XzUp61RSF+7cIKHdo4aCuHuGPIC4oEIdawGBTCyY73a7
         rTBvUiQ7CSSekmIrNh2B6U57nFNcdLr0N9bykoKteE+vwrnG7kPZ1kaLDv+N7TSihrV7
         LZ1N65a6eDwAOvaIgbUxTQjvcfguw8833ZuQjzOyASbQOILL7YJf0gIdotmLL3G1zTae
         97KYCiV/zUYquFa/Asf1M++1Qna/pEHMaUqaziGZq0/uQBB/dZSM+u3gzeeMb22a3f2L
         v7JHWPWZqOizM8aoc59gRgBSmApKUf8GMBoQ97/Ckj+dnpdNS6JjukqKuhhfGNJ/xYeG
         Sgfw==
X-Gm-Message-State: AOJu0Yx5OAjievCwO4mO7RFO7/Iw8z6l6t2vL24Z99fxJUEN+G2yi/t3
	WmDr4OdPuDwk6zfgfsyPmvtTFF2yskD1rbiKtAu/G6XfZNC02MgUCI1PV7HUExE8h572HEZ1fwp
	LKaR8
X-Gm-Gg: ASbGncuE5pS4H9RzA96dVi4yXlxSqiWMsINYAadpSDmKzUyaptfo5puYTOWmkTinlc1
	LC1yLi4QP0JDQZOzcnLXV+zrsGSN77kYgyTMt34Y9EKucIPgcMUzPl2Y76N+7xgPNkvQh9e4iCK
	mM9XbDkhHUB9unocWAg0eJHoVE1MvBeqN1lIrOkoQ5k3ExjkLAbFz6QNYexm8dv3eyWGfCvs/jz
	XqyxbNvn1rg4t9TJ2x1iK+oG9+iVTA7Fo2kBy5EVBWnWODDFjP4u8HCVz3VPOkH/vUsd0bBu6kc
	6tp/XFu/XqaRb+FHgs19LSOzw/5clCXH+HV9Or6a3whsF+FJBk9wk0CkzSHO80KpPhDeXhGmNL5
	tD4T7bt0Gd679f7EdvY1BiqBX
X-Google-Smtp-Source: AGHT+IFinnKEf16aL0QNgiL1hnTdntYyv77jqIBgjz/WlrYHb9jKNVyH/2R+z3q83R+hfzrSQYW5hA==
X-Received: by 2002:a05:6000:2512:b0:3a3:67bb:8f46 with SMTP id ffacd0b85a97d-3a531abd9c3mr2087026f8f.57.1749199003150;
        Fri, 06 Jun 2025 01:36:43 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:36:42 +0200
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
Message-ID: <aEKoms3vfn0b7rwT@macbook.local>
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

Forgot to mention in my previous reply, should there be some sanity
check that node < MAX_NUMNODES?  It's hard to tell whether it should
be an assert or an if check, as there are no callers here that pass
node != NUMA_NO_NODE.

Thanks, Roger.

