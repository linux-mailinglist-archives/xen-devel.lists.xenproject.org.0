Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6222E88C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:10:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzz8f-0003Xv-6G; Mon, 27 Jul 2020 09:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jzz8d-0003Xq-Lu
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:09:39 +0000
X-Inumbo-ID: e5fa0d86-cfe8-11ea-a776-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5fa0d86-cfe8-11ea-a776-12813bfff9fa;
 Mon, 27 Jul 2020 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCuh2KFv5piuBc1L+35MIJLc0EbntaZ4unEdO6wadUs=; b=QB13JIGKx7FKaQH7I1nu7ATXzP
 ftlrz2VnnSn5LBDXWbTzAzcLvyYmNUkCbb3/W4Wcf7LX8GHl3RbgsQWX8aH929sC9bGadWrohIwsV
 QtuV+aC4J47jAcPfIo+orCI6SbXvzAV7i4LDDw9/RPZrsNcm/Ly2s6jEKMCWbXAy+QxM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jzz8a-0003B8-Vm; Mon, 27 Jul 2020 09:09:36 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=edge-cache-102.e-fra50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jzz8a-0001mB-If; Mon, 27 Jul 2020 09:09:36 +0000
Message-ID: <bbd18a2f7d86d451f529292c627616044955a84c.camel@xen.org>
Subject: Re: [PATCH v7 03/15] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 27 Jul 2020 10:09:33 +0100
In-Reply-To: <826d5a28-c391-dd30-d588-6f730b454c18@suse.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <fd5d98198d9539b232a570a83e7a24be2407e739.1590750232.git.hongyxia@amazon.com>
 <826d5a28-c391-dd30-d588-6f730b454c18@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2020-07-14 at 12:47 +0200, Jan Beulich wrote:
> On 29.05.2020 13:11, Hongyan Xia wrote:
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
> > Note that the change of virt_to_xen_l1e() also requires
> > vmap_to_mfn() to
> > unmap the page, which requires domain_page.h header in vmap.
> > 
> > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two further small adjustments:
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -4948,8 +4948,28 @@ void free_xen_pagetable_new(mfn_t mfn)
> >          free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
> >  }
> >  
> > +void *alloc_map_clear_xen_pt(mfn_t *pmfn)
> > +{
> > +    mfn_t mfn = alloc_xen_pagetable_new();
> > +    void *ret;
> > +
> > +    if ( mfn_eq(mfn, INVALID_MFN) )
> > +        return NULL;
> > +
> > +    if ( pmfn )
> > +        *pmfn = mfn;
> > +    ret = map_domain_page(mfn);
> > +    clear_page(ret);
> > +
> > +    return ret;
> > +}
> > +
> >  static DEFINE_SPINLOCK(map_pgdir_lock);
> >  
> > +/*
> > + * For virt_to_xen_lXe() functions, they take a virtual address
> > and return a
> > + * pointer to Xen's LX entry. Caller needs to unmap the pointer.
> > + */
> >  static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
> 
> May I suggest s/virtual/linear/ to at least make the new comment
> correct?
> 
> > --- a/xen/include/asm-x86/page.h
> > +++ b/xen/include/asm-x86/page.h
> > @@ -291,7 +291,13 @@ void copy_page_sse2(void *, const void *);
> >  #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
> >  #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
> >  #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
> > -#define
> > vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned
> > long)(va))))
> > +
> > +#define vmap_to_mfn(va)
> > ({                                                  \
> > +        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned
> > long)(va));   \
> > +        mfn_t mfn_ =
> > l1e_get_mfn(*pl1e_);                                   \
> > +        unmap_domain_page(pl1e_);                                 
> >           \
> > +        mfn_; })
> 
> Just like is already the case in domain_page_map_to_mfn() I think
> you want to add "BUG_ON(!pl1e)" here to limit the impact of any
> problem to DoS (rather than a possible privilege escalation).
> 
> Or actually, considering the only case where virt_to_xen_l1e()
> would return NULL, returning INVALID_MFN here would likely be
> even more robust. There looks to be just a single caller, which
> would need adjusting to cope with an error coming back. In fact -
> it already ASSERT()s, despite NULL right now never coming back
> from vmap_to_page(). I think the loop there would better be
> 
>     for ( i = 0; i < pages; i++ )
>     {
>         struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);
> 
>         if ( page )
>             page_list_add(page, &pg_list);
>         else
>             printk_once(...);
>     }
> 
> Thoughts?

To be honest, I think the current implementation of vmap_to_mfn() is
just incorrect. There is simply no guarantee that a vmap is mapped with
small pages, so IMO we just cannot do virt_to_xen_x1e() here. The
correct way is to have a generic page table walking function which
walks from the base and can stop at any level, and properly return code
to indicate level or any error.

I am inclined to BUG_ON() here, and upstream a proper fix later to
vmap_to_mfn() as an individual patch.

Am I missing anything here?

Hongyan


