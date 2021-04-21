Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49123669F3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114428.218076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB6a-0007vP-5E; Wed, 21 Apr 2021 11:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114428.218076; Wed, 21 Apr 2021 11:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB6a-0007v0-23; Wed, 21 Apr 2021 11:33:16 +0000
Received: by outflank-mailman (input) for mailman id 114428;
 Wed, 21 Apr 2021 11:33:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZB6Y-0007uv-SL
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:33:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZB6T-0006bq-Pj; Wed, 21 Apr 2021 11:33:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZB6T-00011H-8c; Wed, 21 Apr 2021 11:33:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=juYVv4d3TsbZwECgzB5+Fg64OH98X8D4BCQCHjNsMpM=; b=O44/ZpYsu2HVCN6TuiIkk43CsF
	qpVWC/a/w5eG6luThFXyrA0uf/gXxOH4fA6lPQSau2Epe45fxL5SCVC545JVSlh0iwqwwtqXS4SrY
	zyUxIXJaOc7+//qGQFIdxiCcatyOm60avmbQzCNa9c1N55sJVsT5lx/IL9SfaybNrlR8=;
Message-ID: <2ceae314e9e634ef7e9bebf7f64653f25fa97dd6.camel@xen.org>
Subject: Re: [PATCH v9 01/13] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
	=?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Date: Wed, 21 Apr 2021 12:33:05 +0100
In-Reply-To: <fbc4a42f-549b-515f-279f-92466f89af79@suse.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
	 <b70cc7c0854a6a25b00624b5fa83684a20916ca3.1617706782.git.hongyxia@amazon.com>
	 <fbc4a42f-549b-515f-279f-92466f89af79@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2021-04-20 at 14:17 +0200, Jan Beulich wrote:
> On 06.04.2021 13:05, Hongyan Xia wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> > 
> > Rewrite those functions to use the new APIs. Modify its callers to
> > unmap
> > the pointer returned. Since alloc_xen_pagetable_new() is almost
> > never
> > useful unless accompanied by page clearing and a mapping, introduce
> > a
> > helper alloc_map_clear_xen_pt() for this sequence.
> > 
> > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > 
> > ---
> > Changed in v9:
> > - use domain_page_map_to_mfn() around the L3 table locking logic.
> > - remove vmap_to_mfn() changes since we now use xen_map_to_mfn().
> > 
> > Changed in v8:
> > - s/virtual address/linear address/.
> > - BUG_ON() on NULL return in vmap_to_mfn().
> > 
> > Changed in v7:
> > - remove a comment.
> > - use l1e_get_mfn() instead of converting things back and forth.
> > - add alloc_map_clear_xen_pt().
> 
> I realize this was in v7 already, but at v6 time the name I suggested
> was
> 
> void *alloc_mapped_pagetable(mfn_t *mfn);
> 
> "alloc_map_clear_xen", for my taste at least, is too strange. It
> doesn't really matter whether it's a page table for Xen's own use
> (it typically will be), so "xen" could be dropped. Clearing of a
> page table ought to also be the rule rather than the exception, so
> I'd see "clear" also dropped. I'd be fine with alloc_map_pt() or
> about any intermediate variant between that and my originally
> suggested name.

Sounds reasonable. I will go with alloc_mapped_pagetable().

> 
> > @@ -5108,7 +5140,8 @@ int map_pages_to_xen(
> >      unsigned int flags)
> >  {
> >      bool locking = system_state > SYS_STATE_boot;
> > -    l2_pgentry_t *pl2e, ol2e;
> > +    l3_pgentry_t *pl3e = NULL, ol3e;
> > +    l2_pgentry_t *pl2e = NULL, ol2e;
> >      l1_pgentry_t *pl1e, ol1e;
> >      unsigned int  i;
> >      int rc = -ENOMEM;
> > @@ -5132,15 +5165,16 @@ int map_pages_to_xen(
> >  
> >      while ( nr_mfns != 0 )
> >      {
> > -        l3_pgentry_t *pl3e, ol3e;
> > -
> > +        /* Clean up the previous iteration. */
> >          L3T_UNLOCK(current_l3page);
> > +        UNMAP_DOMAIN_PAGE(pl3e);
> > +        UNMAP_DOMAIN_PAGE(pl2e);
> 
> Doing this here suggests the lower-case equivalent is needed at the
> out label, even without looking at the rest of the function (doing
> so confirms the suspicion, as there's at least one "goto out" with
> pl2e clearly still mapped).
> 
> > @@ -5305,6 +5339,8 @@ int map_pages_to_xen(
> >                  pl1e = virt_to_xen_l1e(virt);
> >                  if ( pl1e == NULL )
> >                      goto out;
> > +
> > +                UNMAP_DOMAIN_PAGE(pl1e);
> >              }
> 
> Unmapping the page right after mapping it looks suspicious. I see
> that
> further down we have
> 
>             pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);
> 
> but don't you need to also change that? Actually, you do in patch 2,
> but the latest then the double mapping should imo be avoided.

I would say the code was already suspicious to begin with, since pl1e
would be overwritten immediately below even before this patch. The
purpose of the virt_to_xen_l1e() is only to populate the L1 table.

Performance-wise the double map should be pretty harmless since the
mapping is in the cache, so I actually prefer it as is. Alternatively,
I can initialise pl1e to NULL at the beginning of the block and only do
the

pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);

when the pl1e is still NULL. If you are okay I will go with this.

> 
> > @@ -5505,6 +5542,7 @@ int populate_pt_range(unsigned long virt,
> > unsigned long nr_mfns)
> >  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned
> > int nf)
> >  {
> >      bool locking = system_state > SYS_STATE_boot;
> > +    l3_pgentry_t *pl3e = NULL;
> >      l2_pgentry_t *pl2e;
> >      l1_pgentry_t *pl1e;
> >      unsigned int  i;
> 
> And here we have the opposite situation: You don't set pl2e to NULL
> and the function only uses l3e_to_l2e() to initialize the variable,
> yet ...
> 
> > @@ -5761,6 +5799,8 @@ int modify_xen_mappings(unsigned long s,
> > unsigned long e, unsigned int nf)
> >  
> >   out:
> >      L3T_UNLOCK(current_l3page);
> > +    unmap_domain_page(pl2e);
> > +    unmap_domain_page(pl3e);
> 
> ... here you try to unmap it. Did the two respective hunks somehow
> magically get swapped?

Since the +-3 contexts of the two hunks are exactly the same, I have
strong suspicion what you said is exactly what happened. Thank you for
spotting this.

> 
> > --- a/xen/common/vmap.c
> > +++ b/xen/common/vmap.c
> > @@ -1,6 +1,7 @@
> >  #ifdef VMAP_VIRT_START
> >  #include <xen/bitmap.h>
> >  #include <xen/cache.h>
> > +#include <xen/domain_page.h>
> 
> Why is this needed? (Looks like a now stale change.)

Stale change indeed. Will be removed.

Hongyan


