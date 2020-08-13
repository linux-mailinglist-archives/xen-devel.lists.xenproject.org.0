Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671A243D04
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 18:09:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Fm6-00076S-JT; Thu, 13 Aug 2020 16:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i/wp=BX=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k6Fm5-00076N-Kd
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 16:08:17 +0000
X-Inumbo-ID: 5930b436-51a6-47c9-9e2c-bf788eb8fffe
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5930b436-51a6-47c9-9e2c-bf788eb8fffe;
 Thu, 13 Aug 2020 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=fRXsCMnHeCL45oRiqTqbmcw2ZCFsrC4CUPxeyTuRxro=; b=uQXgvqaX8g31PFspvHsmkR+gyQ
 xXTQ4swqMDgDpqgs9llujRCqj96tUX9c4ZYoyc9YBGkHw7/gdk4tSollhKr8aCMmG6dJFSLMVxcva
 4HKZZVVZm3Dns4tYqSWfQ9sPaB7wG4o+LlHGgZbIU1uxC/EOa17f7g9IybXvqe0U31H8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k6Fm2-0005cW-Id; Thu, 13 Aug 2020 16:08:14 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=iad7-dhcp-95-154-75.iad7.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k6Fm2-0002Eu-3i; Thu, 13 Aug 2020 16:08:14 +0000
Message-ID: <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 13 Aug 2020 17:08:11 +0100
In-Reply-To: <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
> On 27.07.2020 16:21, Hongyan Xia wrote:
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
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > ---
> > Changed in v8:
> > - s/virtual address/linear address/.
> > - BUG_ON() on NULL return in vmap_to_mfn().
> 
> The justification for this should be recorded in the description. In

Will do.

> reply to v7 I did even suggest how to easily address the issue you
> did notice with large pages, as well as alternative behavior for
> vmap_to_mfn().

One thing about adding SMALL_PAGES is that vmap is common code and I am
not sure if the Arm side is happy with it.

> 
> > --- a/xen/include/asm-x86/page.h
> > +++ b/xen/include/asm-x86/page.h
> > @@ -291,7 +291,15 @@ void copy_page_sse2(void *, const void *);
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
> > +        mfn_t
> > mfn_;                                                         \
> > +        BUG_ON(!pl1e_);                                           
> >           \
> > +        mfn_ =
> > l1e_get_mfn(*pl1e_);                                         \
> > +        unmap_domain_page(pl1e_);                                 
> >           \
> > +        mfn_; })
> 
> Additionally - no idea why I only notice this now, this wants some
> further formatting adjustment: Either
> 
> #define vmap_to_mfn(va)
> ({                                                \
>         const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned
> long)(va)); \
>         mfn_t
> mfn_;                                                       \
>         BUG_ON(!pl1e_);                                              
>      \
>         mfn_ =
> l1e_get_mfn(*pl1e_);                                       \
>         unmap_domain_page(pl1e_);                                    
>      \
>         mfn_;                                                        
>      \
>     })
> 
> or (preferably imo)
> 
> #define vmap_to_mfn(va)
> ({                                            \
>     const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va));
> \
>     mfn_t
> mfn_;                                                       \
>     BUG_ON(!pl1e_);                                                  
>  \
>     mfn_ =
> l1e_get_mfn(*pl1e_);                                       \
>     unmap_domain_page(pl1e_);                                        
>  \
>     mfn_;                                                            
>  \
> })

Will do so in the next rev.

Hongyan


