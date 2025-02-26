Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06982A465F6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896957.1305707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJtR-0007He-S9; Wed, 26 Feb 2025 16:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896957.1305707; Wed, 26 Feb 2025 16:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJtR-0007Fx-OX; Wed, 26 Feb 2025 16:04:17 +0000
Received: by outflank-mailman (input) for mailman id 896957;
 Wed, 26 Feb 2025 16:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnJtQ-0007Fj-G4
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:04:16 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 536c535d-f45b-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 17:04:15 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5452ca02bdbso6528428e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:04:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1d6967csm348689766b.71.2025.02.26.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 08:04:13 -0800 (PST)
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
X-Inumbo-ID: 536c535d-f45b-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740585854; x=1741190654; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWHicHw574PDyyNI2yWKPxLMNMhEh7JCnZq/rZ9yVmI=;
        b=bJaZCwoGliGg0a0VoEgJWqbcACKyxIwQ2dMIuQ666E6hjqNbeGALOWRfMPJUo3bbuF
         jw+nr87b+IbE4H8N55yxsajpPcmODUSeocM3nKH+GI3JP/lRfALvGbzNyWlCd3F79Xx4
         Z2kU0Jgi4nFcUeWfqwhCbL40NMiuE2JEfSQ4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585854; x=1741190654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWHicHw574PDyyNI2yWKPxLMNMhEh7JCnZq/rZ9yVmI=;
        b=BdKCaRP0tQtlzft8eHxLixfn0q1iEpgvVkY03jWiROw/rUv+Z4ZsGkLvIEOLg2TEs2
         MYlJL6jahP6HXRzO9KA2bXB421CegiQGLsyVa0rHXgDytG3q8+5j5MQyujl0Rj+J1YGY
         UfwgrGzocCdCFakgkAIYfNAwKeGG4wmHpYImGcpD4U3nrYzSZjYk7yzFuQhpEeQQlnqf
         8XVFaeRwpEhskAV8p03MD6JUePf6eXOJfOmF9Xm63yfkUw67kkQRAgrhCMJDlEJOrXMr
         9/7nRoeB/LJohxKg2LE4PQ4zNyV80sT/UC+BT0GDNxDlUPMPHY0epqXGGSz0XVBHDWt+
         aN6w==
X-Gm-Message-State: AOJu0YyL38IKg1TYSPwef9jAdez52+x5aa4LFn2tTsENWeovX30RBz+5
	05VHfgBbdmi4j2T4b1KHxWpVW3ATvH46p64oexkKLCdtZRkcKfLJ/qAjE0hlZU0=
X-Gm-Gg: ASbGncsrcVrdgmq2z4xvlLEQr4p6xYVTMgJy1HTpK6I4v3pIh8Ihyz0WQxb7dSr1Qjx
	ZDVSWQw3yPOlxl/Q/nqDuao1WUOgZc+ar7o4BEc4Lb1c2GNZz0BIHLsbiBhhrjP9FK+FXDFOuME
	KleoXrnGniT16LauTVO/pfmA896fuGpHNGnpH0005KgJW1XoRGMhscQb+CNfszcv9EjYUEdsUka
	glY/QlPVkeoUcxd4ZLXFbKc3GcRKK9ySqZ8HWiKnuN5DDxl1oIH0sj0q+PgkFK6mjYVHXssoPPz
	AzA1/TsnFMqsRdiTIthYxkNPsPETLvs=
X-Google-Smtp-Source: AGHT+IGyxX8IXNU9Y3ML3/dVi+Ftju6Yjfp1gAKtEzUUj05b3MKTRN0afGXjmITwW7juHf8PoGRvuw==
X-Received: by 2002:a05:6512:6d0:b0:542:2190:9d99 with SMTP id 2adb3069b0e04-548510ccf83mr5241463e87.6.1740585854286;
        Wed, 26 Feb 2025 08:04:14 -0800 (PST)
Date: Wed, 26 Feb 2025 17:04:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z787fHY6L0ssFDjG@macbook.local>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local>
 <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>

On Wed, Feb 26, 2025 at 03:36:33PM +0100, Jan Beulich wrote:
> On 26.02.2025 15:28, Roger Pau Monné wrote:
> > On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
> >> On 26.02.2025 14:56, Roger Pau Monné wrote:
> >>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
> >>>> --- a/xen/common/page_alloc.c
> >>>> +++ b/xen/common/page_alloc.c
> >>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
> >>>>  
> >>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> >>>>  {
> >>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
> >>>> -
> >>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
> >>>>      d->tot_pages += pages;
> >>>>  
> >>>>      /*
> >>>> -     * can test d->claimed_pages race-free because it can only change
> >>>> +     * can test d->outstanding_pages race-free because it can only change
> >>>>       * if d->page_alloc_lock and heap_lock are both held, see also
> >>>>       * domain_set_outstanding_pages below
> >>>>       */
> >>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> >>>>          goto out;
> >>>
> >>> I think you can probably short-circuit the logic below if pages == 0?
> >>> (and avoid taking the heap_lock)
> >>
> >> Are there callers passing in 0?
> > 
> > Not sure, but if there are no callers expected we might add an ASSERT
> > to that effect then.
> > 
> >>>>      spin_lock(&heap_lock);
> >>>> -    /* adjust domain outstanding pages; may not go negative */
> >>>> -    dom_before = d->outstanding_pages;
> >>>> -    dom_after = dom_before - pages;
> >>>> -    BUG_ON(dom_before < 0);
> >>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
> >>>> -    d->outstanding_pages = dom_claimed;
> >>>> -    /* flag accounting bug if system outstanding_claims would go negative */
> >>>> -    sys_before = outstanding_claims;
> >>>> -    sys_after = sys_before - (dom_before - dom_claimed);
> >>>> -    BUG_ON(sys_after < 0);
> >>>> -    outstanding_claims = sys_after;
> >>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >>>> +    if ( pages > 0 && d->outstanding_pages < pages )
> >>>> +    {
> >>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> >>>> +        outstanding_claims -= d->outstanding_pages;
> >>>> +        d->outstanding_pages = 0;
> >>>> +    } else {
> >>>> +        outstanding_claims -= pages;
> >>>> +        d->outstanding_pages -= pages;
> >>>
> >>> I wonder if it's intentional for a pages < 0 value to modify
> >>> outstanding_claims and d->outstanding_pages, I think those values
> >>> should only be set from domain_set_outstanding_pages().
> >>> domain_adjust_tot_pages() should only decrease the value, but never
> >>> increase either outstanding_claims or d->outstanding_pages.
> >>>
> >>> At best the behavior is inconsistent, because once
> >>> d->outstanding_pages reaches 0 there will be no further modification
> >>> from domain_adjust_tot_pages().
> >>
> >> Right, at that point the claim has run out. While freeing pages with an
> >> active claim means that the claim gets bigger (which naturally needs
> >> reflecting in the global).
> > 
> > domain_adjust_tot_pages() is not exclusively called when freeing
> > pages, see steal_page() for example.
> 
> Or also when pages were allocated. steal_page() ...
> 
> > When called from steal_page() it's wrong to increase the claim, as
> > it assumes that the page removed from d->tot_pages is freed, but
> > that's not the case.  The domain might end up in a situation where
> > the claim is bigger than the available amount of memory.
> 
> ... is a case that likely wasn't considered when the feature was added.
> 
> I never really liked this; I'd be quite happy to see it ripped out, as
> long as we'd be reasonably certain it isn't in active use by people.

What do you mean with 'it' in the above sentence, the whole claim
stuff?  Or just getting rid of allowing the claim to increase as a
result of pages being removed from a domain?

Thanks, Roger.

