Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC122EC75
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 14:46:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k02Vt-0006XI-AI; Mon, 27 Jul 2020 12:45:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k02Vr-0006XD-Cy
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 12:45:51 +0000
X-Inumbo-ID: 18f499af-d007-11ea-8ab2-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18f499af-d007-11ea-8ab2-bc764e2007e4;
 Mon, 27 Jul 2020 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUPhyrbRxZ9/iZmX05oh+qy6eFjaF0RYmj/4gpOnY9s=; b=lvSwyKcqkWIendRUb6sDmF4lJL
 YtKwNxqQ+kuzzSjnsoMLK6Ffjg6SNXPq7bwEV7G1O2zH1Q4+/PI756sW8Zi5JjN/jS28PUPr2uVs3
 KvTihwkVdSIvjDMUZIYWaPIcqgYwq+0LUhUDWQbJSOM+05iQJwbupfj78qLCkK0ufE4g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k02Vp-0007gT-PY; Mon, 27 Jul 2020 12:45:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=edge-cache-102.e-fra50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k02Vp-0005Sy-EH; Mon, 27 Jul 2020 12:45:49 +0000
Message-ID: <0c421dee1729295eb8504ee81abbc8e57f220b12.camel@xen.org>
Subject: Re: [PATCH v7 09/15] efi: use new page table APIs in copy_mapping
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 27 Jul 2020 13:45:47 +0100
In-Reply-To: <bfe28c9c-af4e-96c2-9e6c-354a5bf626d8@suse.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
 <bfe28c9c-af4e-96c2-9e6c-354a5bf626d8@suse.com>
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
Cc: xen-devel@lists.xenproject.org, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2020-07-14 at 14:42 +0200, Jan Beulich wrote:
> On 29.05.2020 13:11, Hongyan Xia wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> > 
> > After inspection ARM doesn't have alloc_xen_pagetable so this
> > function
> > is x86 only, which means it is safe for us to change.
> 
> Well, it sits inside a "#ifndef CONFIG_ARM" section.
> 
> > @@ -1442,29 +1443,42 @@ static __init void copy_mapping(unsigned
> > long mfn, unsigned long end,
> >                                                   unsigned long
> > emfn))
> >  {
> >      unsigned long next;
> > +    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
> >  
> >      for ( ; mfn < end; mfn = next )
> >      {
> >          l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn <<
> > PAGE_SHIFT)];
> > -        l3_pgentry_t *l3src, *l3dst;
> >          unsigned long va = (unsigned long)mfn_to_virt(mfn);
> >  
> > +        if ( !((mfn << PAGE_SHIFT) & ((1UL << L4_PAGETABLE_SHIFT)
> > - 1)) )
> 
> To be in line with ...
> 
> > +        {
> > +            UNMAP_DOMAIN_PAGE(l3src);
> > +            UNMAP_DOMAIN_PAGE(l3dst);
> > +        }
> >          next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));
> 
> ... this, please avoid the left shift of mfn in the if(). Judgingfrom

What do you mean by "in line" here? It does not look to me that "next
=" can be easily squashed into the if() condition.

Hongyan


