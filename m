Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8BA462C3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896711.1305469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIPQ-0003Ya-Oo; Wed, 26 Feb 2025 14:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896711.1305469; Wed, 26 Feb 2025 14:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIPQ-0003We-LX; Wed, 26 Feb 2025 14:29:12 +0000
Received: by outflank-mailman (input) for mailman id 896711;
 Wed, 26 Feb 2025 14:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnIPP-0003WY-20
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:29:11 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04cefd34-f44e-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:29:00 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2233622fdffso12082905ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:29:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2232c798213sm12410115ad.73.2025.02.26.06.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 06:28:58 -0800 (PST)
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
X-Inumbo-ID: 04cefd34-f44e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740580139; x=1741184939; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQEf11I6bVKD8mP1k41RioRswwQRrslQZGI8GsAEfbA=;
        b=CNEodNDwkltWjndeciyHg2SFFYE5MN8WBzG7glK7gkLtjvJmTgoW4xVbPkm4a5f62W
         zF5O1JtOa3nAo0NnWp05upP7TBEGgjzxhYiHBlgeCXLKkiiE8GudzSodtoetYu6iyFQ8
         2cFxosXphf6QK4BzltGHCjqtHZUsLXoqPSq7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580139; x=1741184939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQEf11I6bVKD8mP1k41RioRswwQRrslQZGI8GsAEfbA=;
        b=GnKBjOGwk32WgBhRibN8Ks1kDkmEU4dBayuUy02EhkKONcN0Mwu3KNeaTsk0ffRgmg
         4pX11iif3Q67bbDO+9goTyWqeHmhwYMLIFze9zzWmA6auifSiSlLYOo/pY/QJZOUePR7
         E+T7JVH0gfRIRnmzpChywRFt5TxB9G9+qwKfywrgwi1OijcoaXiS30g7qhl4D3lgmZrC
         LJJTbxY0AA41OOicVDv/dWg9j7ZMCOFuSunihjgddZK8e1s/hPsKeqjs8dXIGkaSVZBa
         3vnMJGPzopfeSwQyzZeYQtZ7UD6kAVzFgyLzgKOONFpwzi1w2w0dL2vNsW4vKso3N+jD
         ilGQ==
X-Gm-Message-State: AOJu0YwBzUNw2FlIuFQjJdCEGKiGq82qrhB2alg3sTDJI4xcvQnH0ZmA
	+oPBxTKnVMd3JlK4A6lAdGWZExaNP7QWQb4XaKULMEYMp8iNNxipGGwlY1A8l4A=
X-Gm-Gg: ASbGnct2+wh6Om5q6X0LRel97AnuQMUe0443rCyYvJd7XIcPSiUTFvyV7ZTmfcFXYDs
	oxnh3v3nrKdrwzmurzeWISM1y4EY8lfNS8vHqkEqj01/CZhY9aTRO26qSTg9FyAah3vV+IiuPRE
	sin4O1ksAbGKv/McecVm0t5DD/1FxKaiZn8ylvsEqhdwf8QzDdTODYcGreZV46xfYmWT6Ri97+T
	v4O5ZNEmKGMzxjthRh+T9vYE9r5d6VOT4KpUVv40BMXArDV1/m+pKjWIzAMhf7aT9wILgHMRTai
	po4YydWMUflM5cTvBdCnBuAt5LfkLxQ=
X-Google-Smtp-Source: AGHT+IFRhbDnKcjs19UiC3HTtQ4/VlCpBvbxB7lXn5fKkZXyMj3v16Wuv0sNVvL5XyfvlX8dGV8Jmg==
X-Received: by 2002:a17:902:fc43:b0:220:be86:a421 with SMTP id d9443c01a7336-22307e6581emr142922365ad.38.1740580139083;
        Wed, 26 Feb 2025 06:28:59 -0800 (PST)
Date: Wed, 26 Feb 2025 15:28:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z78lJfzqH9btDMrM@macbook.local>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>

On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
> On 26.02.2025 14:56, Roger Pau Monné wrote:
> > On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
> >> --- a/xen/common/page_alloc.c
> >> +++ b/xen/common/page_alloc.c
> >> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
> >>  
> >>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> >>  {
> >> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
> >> -
> >>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
> >>      d->tot_pages += pages;
> >>  
> >>      /*
> >> -     * can test d->claimed_pages race-free because it can only change
> >> +     * can test d->outstanding_pages race-free because it can only change
> >>       * if d->page_alloc_lock and heap_lock are both held, see also
> >>       * domain_set_outstanding_pages below
> >>       */
> >> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> >>          goto out;
> > 
> > I think you can probably short-circuit the logic below if pages == 0?
> > (and avoid taking the heap_lock)
> 
> Are there callers passing in 0?

Not sure, but if there are no callers expected we might add an ASSERT
to that effect then.

> >>      spin_lock(&heap_lock);
> >> -    /* adjust domain outstanding pages; may not go negative */
> >> -    dom_before = d->outstanding_pages;
> >> -    dom_after = dom_before - pages;
> >> -    BUG_ON(dom_before < 0);
> >> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
> >> -    d->outstanding_pages = dom_claimed;
> >> -    /* flag accounting bug if system outstanding_claims would go negative */
> >> -    sys_before = outstanding_claims;
> >> -    sys_after = sys_before - (dom_before - dom_claimed);
> >> -    BUG_ON(sys_after < 0);
> >> -    outstanding_claims = sys_after;
> >> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >> +    if ( pages > 0 && d->outstanding_pages < pages )
> >> +    {
> >> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> >> +        outstanding_claims -= d->outstanding_pages;
> >> +        d->outstanding_pages = 0;
> >> +    } else {
> >> +        outstanding_claims -= pages;
> >> +        d->outstanding_pages -= pages;
> > 
> > I wonder if it's intentional for a pages < 0 value to modify
> > outstanding_claims and d->outstanding_pages, I think those values
> > should only be set from domain_set_outstanding_pages().
> > domain_adjust_tot_pages() should only decrease the value, but never
> > increase either outstanding_claims or d->outstanding_pages.
> > 
> > At best the behavior is inconsistent, because once
> > d->outstanding_pages reaches 0 there will be no further modification
> > from domain_adjust_tot_pages().
> 
> Right, at that point the claim has run out. While freeing pages with an
> active claim means that the claim gets bigger (which naturally needs
> reflecting in the global).

domain_adjust_tot_pages() is not exclusively called when freeing
pages, see steal_page() for example.

When called from steal_page() it's wrong to increase the claim, as
it assumes that the page removed from d->tot_pages is freed, but
that's not the case.  The domain might end up in a situation where
the claim is bigger than the available amount of memory.

Thanks, Roger.

