Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67F1CD6EB
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY65z-0007PM-7c; Mon, 11 May 2020 10:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XH06=6Z=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jY65y-0007PH-9F
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:55:38 +0000
X-Inumbo-ID: f27d400a-9375-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f27d400a-9375-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HAToxlyt/mFYVlJ7+5L4GLnIWhxntlLpjFjlfawAXfM=; b=coif0YvS/myvScrZfU0V8kmzMd
 wWq6eHqILV/Pc9KmZEHzCNp3b2xUBusgWBtB4r2OFahUuU8+Ib3QQ82DwFiyMNpaoRSgUpAHnEIuG
 /N3SjgLkBF1g4C1TuomPAQ49hV16CmEJqAIyWKX9jGz/Qz1EGqwl0tQN5nQbnEVZ//zE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jY65v-0003n3-Ff; Mon, 11 May 2020 10:55:35 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jY65v-0002pC-4V; Mon, 11 May 2020 10:55:35 +0000
Message-ID: <ade804fe6e456f68db4cb01e005e02ce7c2976b7.camel@xen.org>
Subject: Re: [PATCH v6 12/15] x86/smpboot: switch pl*e to use new APIs in
 clone_mapping
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 11 May 2020 11:55:33 +0100
In-Reply-To: <88709097-661e-ce7b-1a46-1dcecf029428@suse.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <a1c29e58a5d40748413e8088ad88ba4319a328d4.1587735799.git.hongyxia@amazon.com>
 <88709097-661e-ce7b-1a46-1dcecf029428@suse.com>
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

On Thu, 2020-04-30 at 17:15 +0200, Jan Beulich wrote:
> On 24.04.2020 16:09, Hongyan Xia wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> 
> Nit: Why the emphasis on pl*e in the title? Is there anything left
> unconverted in the function? IOW how about "switch clone_mapping()
> to new page table APIs"?

The title seems stale. Will fix.

> ...
> > @@ -724,48 +724,61 @@ static int clone_mapping(const void *ptr,
> > root_pgentry_t *rpt)
> >          }
> >      }
> >  
> > +    UNMAP_DOMAIN_PAGE(pl1e);
> > +    UNMAP_DOMAIN_PAGE(pl2e);
> > +    UNMAP_DOMAIN_PAGE(pl3e);
> > +
> >      if ( !(root_get_flags(rpt[root_table_offset(linear)]) &
> > _PAGE_PRESENT) )
> >      {
> > -        pl3e = alloc_xen_pagetable();
> > -        if ( !pl3e )
> > +        mfn_t l3mfn = alloc_xen_pagetable_new();
> > +
> > +        if ( mfn_eq(l3mfn, INVALID_MFN) )
> >              goto out;
> > +
> > +        pl3e = map_domain_page(l3mfn);
> 
> Seeing this recur (from other patches) I wonder whether we wouldn't
> better make map_domain_page() accept INVALID_MFN and return NULL in
> this case. In cases like the one here it would eliminate the need
> for several local variables. Of course the downside of this is that
> then we'll have to start checking map_domain_page()'s return value.
> A middle ground could be to have
> 
> void *alloc_mapped_pagetable(mfn_t *mfn);
> 
> allowing to pass in NULL if the MFN is of no interest.

I would say that when the caller requires a new Xen page table
allocation, almost all the time both the mfn and the virt are needed
(on top of my head I cannot think of a case where we pass in NULL, you
almost always need the mfn to write new page table entries), so I think
the benefit of this is just compressing two calls into one, which I am
not quite sure is worth it.

> > @@ -781,6 +794,9 @@ static int clone_mapping(const void *ptr,
> > root_pgentry_t *rpt)
> >  
> >      rc = 0;
> >   out:
> > +    UNMAP_DOMAIN_PAGE(pl1e);
> > +    UNMAP_DOMAIN_PAGE(pl2e);
> > +    UNMAP_DOMAIN_PAGE(pl3e);
> >      return rc;
> >  }
> 
> I don't think the writing of NULL into the variables is necessary
> here. And if the needed if()-s are of concern, then perhaps we
> should consider making unmap_domain_page() finally accept NULL as
> input?

I usually don't have a problem with this because a sane compiler would
definitely remove the unnecessary clearing, so I would use the macro
version as much as possible. I am okay with moving the NULL check into
unmap() itself, but note that this also needs changes on Arm side.

Hongyan


