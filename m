Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F34B12743
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058686.1426180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufRjS-0000qz-CH; Fri, 25 Jul 2025 23:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058686.1426180; Fri, 25 Jul 2025 23:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufRjS-0000ox-9N; Fri, 25 Jul 2025 23:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1058686;
 Fri, 25 Jul 2025 23:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ufRjQ-0000or-L4
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:21:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14e26d62-69ae-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:21:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E42FBA56774;
 Fri, 25 Jul 2025 23:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3785DC4CEE7;
 Fri, 25 Jul 2025 23:21:22 +0000 (UTC)
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
X-Inumbo-ID: 14e26d62-69ae-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485683;
	bh=RaVCVVZ41HMDWof9ezdn4WBfLCiXxIXNqS/RAVBBbnM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qr5JDmdDHFdBIzRHlqMYD0Ju3Tnx36WFEgnd+qZvoxqn7sdOgU6v9RBQDiZBvL7bO
	 +W42/oKgmwT/YDv5i2GEa/oI0auvKPGzXccedgC0urDkLTRXFxY5T2RjzhY/r57txR
	 cLEtXdxwKPU5Ss41U90vCK/Y/HnwUMog8jOqxFgr+LJc51bz8R5QMlruI4DQaSLTFm
	 ueow+oPoGn3FK83tzotQBO5/cU/QnjaAnz6k322Ct0vZsY6vR1DaXDakpDYVFI8OsI
	 NvB1ysX19T2mARvPF9PqRsi3RwT8hPLUOO4u1firiCjVFnzr5uWJNN0ZgDTQa1rcYR
	 x9+8jS6q4wlYg==
Date: Fri, 25 Jul 2025 16:21:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] xen/cache-col: Remove bogus cast in
 domain_llc_coloring_free()
In-Reply-To: <8d23b930-0abf-42d1-a634-4d9f898375f2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507251618010.2578571@ubuntu-linux-20-04-desktop>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com> <20250724162306.2978741-2-andrew.cooper3@citrix.com> <8d23b930-0abf-42d1-a634-4d9f898375f2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jul 2025, Jan Beulich wrote:
> On 24.07.2025 18:23, Andrew Cooper wrote:
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -309,11 +309,8 @@ int domain_set_llc_colors(struct domain *d,
> >  
> >  void domain_llc_coloring_free(struct domain *d)
> >  {
> > -    if ( !llc_coloring_enabled || d->llc_colors == default_colors )
> > -        return;
> > -
> > -    /* free pointer-to-const using __va(__pa()) */
> > -    xfree(__va(__pa(d->llc_colors)));
> > +    if ( d->llc_colors != default_colors )
> > +        xfree(d->llc_colors);
> >  }
> >  
> >  int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index fe53d4fab7ba..df23411869e6 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -649,7 +649,7 @@ struct domain
> >  
> >  #ifdef CONFIG_LLC_COLORING
> >      unsigned int num_llc_colors;
> > -    const unsigned int *llc_colors;
> > +    unsigned int *llc_colors;
> >  #endif
> >  
> >      /* Console settings. */
> 
> Ah yes, I see. Yet no, I don't agree. The only sane course of action
> to avoid odd transformations like the above (without using casts to
> cast away const-ness) is to finally make xfree() et al take pointers
> to const void. Arguments towards why this makes sense were given
> before; I don't think they need repeating. Dropping the const here is
> rather undesirable: Once set, the colors shouldn't be altered anymore.
> Pointers like this hence want to be pointer-to-const, to make
> accidental modification less likely. Which in turn calls for the
> mentioned adjustment to xfree().

I agree that "Once set, the colors shouldn't be altered anymore.
Pointers like this hence want to be pointer-to-const, to make accidental
modification less likely".

However, I also think that the following is worse than risking
accidental unwanted modifications of llc_colors:

    /* free pointer-to-const using __va(__pa()) */
    xfree(__va(__pa(d->llc_colors)));

So in my opinion this patch is good. If/when xfree becomes able to deal
with const pointers, then we can change llc_colors to be const again.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

