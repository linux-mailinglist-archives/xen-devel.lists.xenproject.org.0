Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE1A4616C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896635.1305400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHts-0002ZT-Or; Wed, 26 Feb 2025 13:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896635.1305400; Wed, 26 Feb 2025 13:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHts-0002WL-Lb; Wed, 26 Feb 2025 13:56:36 +0000
Received: by outflank-mailman (input) for mailman id 896635;
 Wed, 26 Feb 2025 13:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnHtq-0002WD-My
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:56:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c20cf26-f449-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:56:32 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so1701775a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:56:32 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abefe713bbesm46456566b.69.2025.02.26.05.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 05:56:31 -0800 (PST)
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
X-Inumbo-ID: 7c20cf26-f449-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740578192; x=1741182992; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewazTHnMaXUet36Ijlc4tPkDrTHIgx7OpNW5OBdADuk=;
        b=V2HGTKkgM/HL/y9m1STVbUB8VL0BZSv0RRK1KIUoMXOgj5m+Uh1rTHxmlIyJ2r1T3L
         RqmriUJyeuaFo3ICy5q9nFfIQtJYe8MSTQkJ6XACZhhzF3MK4ow6q/q0PNKMWDD0qrx1
         SfWjIi4P/gFXTezLw9uf7HujQFgze3dsjCOjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578192; x=1741182992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewazTHnMaXUet36Ijlc4tPkDrTHIgx7OpNW5OBdADuk=;
        b=ks+hfKdXjRPChUO7bKXRQOUky4TgN3js/f76XfudstPBY4hjcFhjuoIldDpkH/U8zM
         6cWnA2bLIc7ZF92QqrmKAajk5d1Nw6esP7vLhIvhqNxy2XtnTBCeCcbFHHIRQzaOHWAR
         BuJxHzxQhQskYu3uz8Xi7SSEvq64aVoj73PxwUPrKZI+9/MsjVfCIiXYZv9fYKcsgV5w
         syFeWCIJcgkzQgbp/V1yiwhPJLgTtPD8ECOkrQphc/n7oNKpT1cYN/DTmtKXEY/iFXut
         8vkPKUI2hYDgGHKJx9KCBTHBReQAa3NZeh/SUN7N8px9OiauKA7uK7Z9Np/YfPSJRcc3
         X9Vw==
X-Gm-Message-State: AOJu0YxLqZbmDKOGlsdL7+xzIdWVJJVUwI2oe1ynzsC1N4r6cnWMsWYz
	r6upiiJ/m1+Hk7SFac6YEiCg92Ln7m5NbqiGYxeEBv45ErGdeKaxEMqx+gwI4hY=
X-Gm-Gg: ASbGncuLdq5KQWp4hAZlu7xU2dNXuP/mvdDmEhxmK140EUKGE/+/iSWjXTgFdTDiCjE
	khQKyi6NNDy/80K76u9JDfd8Oa1n/EPe/GlXqmlPrVlH0E/hwhA0FKLFxSnOKxWtiglSotg0dGM
	C/tJcIimgGRW+RBNe9P/6xTQ7721lKkvAf0fofrNjhXJ7wTSKMN864SN5Ybe+xmoJxZOBUwlCPJ
	Dmi2CiQGYAr7FVTwpQePgt8i9nhO9oAp/Ecwdmvtnl/RmKar5U+llf5VRbDgbwjWZY2KDBA++rb
	1DZloMEStLp0LLsOJcWACPz0GiGRrWg=
X-Google-Smtp-Source: AGHT+IE5V4w4VGKrK5GUpSevmzzu12rfaNMTp9RDDGZne/D3FFu9nPTgo/kSDHkLihKDl91+LsP8gA==
X-Received: by 2002:a17:907:c80f:b0:abe:cfbf:3da6 with SMTP id a640c23a62f3a-abecfbf4065mr583261166b.19.1740578191919;
        Wed, 26 Feb 2025 05:56:31 -0800 (PST)
Date: Wed, 26 Feb 2025 14:56:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z78djoAU7vjGepjr@macbook.local>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224132724.9074-1-alejandro.vallejo@cloud.com>

On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
> The logic has too many levels of indirection and it's very hard to
> understand it its current form. Split it between the corner case where
> the adjustment is bigger than the current claim and the rest to avoid 5
> auxiliary variables.
> 
> While at it, fix incorrect field name in nearby comment.
> 
> Not a functional change (although by its nature it might not seem
> immediately obvious at first).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/page_alloc.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 1bf070c8c5df..4306753f0bd2 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>  
>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>  {
> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
> -
>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>      d->tot_pages += pages;
>  
>      /*
> -     * can test d->claimed_pages race-free because it can only change
> +     * can test d->outstanding_pages race-free because it can only change
>       * if d->page_alloc_lock and heap_lock are both held, see also
>       * domain_set_outstanding_pages below
>       */
> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>          goto out;

I think you can probably short-circuit the logic below if pages == 0?
(and avoid taking the heap_lock)

>  
>      spin_lock(&heap_lock);
> -    /* adjust domain outstanding pages; may not go negative */
> -    dom_before = d->outstanding_pages;
> -    dom_after = dom_before - pages;
> -    BUG_ON(dom_before < 0);
> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
> -    d->outstanding_pages = dom_claimed;
> -    /* flag accounting bug if system outstanding_claims would go negative */
> -    sys_before = outstanding_claims;
> -    sys_after = sys_before - (dom_before - dom_claimed);
> -    BUG_ON(sys_after < 0);
> -    outstanding_claims = sys_after;
> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> +    if ( pages > 0 && d->outstanding_pages < pages )
> +    {
> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> +        outstanding_claims -= d->outstanding_pages;
> +        d->outstanding_pages = 0;
> +    } else {
> +        outstanding_claims -= pages;
> +        d->outstanding_pages -= pages;

I wonder if it's intentional for a pages < 0 value to modify
outstanding_claims and d->outstanding_pages, I think those values
should only be set from domain_set_outstanding_pages().
domain_adjust_tot_pages() should only decrease the value, but never
increase either outstanding_claims or d->outstanding_pages.

At best the behavior is inconsistent, because once
d->outstanding_pages reaches 0 there will be no further modification
from domain_adjust_tot_pages().

I think it would be best if outstanding_claims and
d->outstanding_pages was only modified if pages > 0.

Thanks, Roger.

