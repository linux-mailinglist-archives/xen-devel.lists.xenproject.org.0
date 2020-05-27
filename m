Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06B1E46C0
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:02:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxZ7-0005oP-7y; Wed, 27 May 2020 15:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSSa=7J=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jdxZ5-0005oJ-D1
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:01:55 +0000
X-Inumbo-ID: 00ae6ba6-a02b-11ea-a75c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ae6ba6-a02b-11ea-a75c-12813bfff9fa;
 Wed, 27 May 2020 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rjr/fnn1r9nNNDmy/mckjFtMS52K4ZK3kk14ndKqHwA=; b=s6qPhnaoWtIroM/W19Qp3qPcgm
 ucfHgmuL+AECd+KMScnPkZZgsLEWmQK8uEwjFAYl3uYBFG91v9U6unIRkxBOunSqFuwxaYEOEMiZZ
 UhWxDs86uZjvPo3p5GtE3xe5nxqExzkOfY55VdKPA3BUa9RW3UoXnKiSURCYrCtl52zs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jdxZ2-0005rk-Sp; Wed, 27 May 2020 15:01:52 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jdxZ2-0002DH-Ie; Wed, 27 May 2020 15:01:52 +0000
Message-ID: <27611cd2c6f04431d3e0fe99824cc844fed96e40.camel@xen.org>
Subject: Re: [PATCH v6 07/15] x86_64/mm: switch to new APIs in paging_init
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 27 May 2020 16:01:50 +0100
In-Reply-To: <80d185d4-c7c3-53b9-d851-ab56ea4bc755@suse.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <0655cc2d3dc27141ef102076c4ad390a37191b37.1587735799.git.hongyxia@amazon.com>
 <80d185d4-c7c3-53b9-d851-ab56ea4bc755@suse.com>
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-05-20 at 11:46 +0200, Jan Beulich wrote:
> On 24.04.2020 16:08, Hongyan Xia wrote:
> > @@ -493,22 +494,28 @@ void __init paging_init(void)
> >          if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
> >                _PAGE_PRESENT) )
> >          {
> > -            l3_pgentry_t *pl3t = alloc_xen_pagetable();
> > +            l3_pgentry_t *pl3t;
> > +            mfn_t l3mfn = alloc_xen_pagetable_new();
> >  
> > -            if ( !pl3t )
> > +            if ( mfn_eq(l3mfn, INVALID_MFN) )
> >                  goto nomem;
> > +
> > +            pl3t = map_domain_page(l3mfn);
> >              clear_page(pl3t);
> >              l4e_write(&idle_pg_table[l4_table_offset(va)],
> > -                      l4e_from_paddr(__pa(pl3t),
> > __PAGE_HYPERVISOR_RW));
> > +                      l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR_RW));
> > +            unmap_domain_page(pl3t);
> 
> This can be moved up, and once it is you'll notice that you're
> open-coding clear_domain_page(). I wonder whether I didn't spot
> the same in other patches of this series.
> 
> Besides the previously raised point of possibly having an
> allocation function that returns a mapping of the page right
> away (not needed here) - are there many cases where allocation
> of a new page table isn't accompanied by clearing the page? If
> not, should the function perhaps do so (and then, once it has
> a mapping anyway, it would be even more so natural to return
> it for users wanting a mapping anyway)?

I grepped through all alloc_xen_pagetable(). Except the page shattering
logic in x86/mm.c where the whole page table page is written
immediately, all other call sites clear the page right away, so it is
useful to have a helper that clears it for you. I also looked at the
use of VA and MFN from the call. MFN is almost always needed while VA
is not, and if we bundle clearing into the alloc() itself, a lot of
call sites don't even need the VA.

Similar to what you suggested before, we can do:
void* alloc_map_clear_xen_pagetable(mfn_t* mfn)
which needs to be paired with an unmap call, of course.

> > @@ -662,6 +677,8 @@ void __init paging_init(void)
> >      return;
> >  
> >   nomem:
> > +    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
> > +    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
> >      panic("Not enough memory for m2p table\n");
> >  }
> 
> I don't think this is a very useful addition.

I was trying to avoid further mapping leaks in the panic path, but it
does not look like panic() does mappings, so these can be removed.

Hongyan


