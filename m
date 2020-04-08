Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A511A1E10
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 11:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM74f-0002d3-Km; Wed, 08 Apr 2020 09:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jM74e-0002cy-DR
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 09:32:44 +0000
X-Inumbo-ID: e5553a91-797b-11ea-81c8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5553a91-797b-11ea-81c8-12813bfff9fa;
 Wed, 08 Apr 2020 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+4HWmtllqDCRx1xPuUnILUMTVv4l5Lmhf8TpyvyUk8=; b=4+EJJtiXcl3w73LbqwI6cGQmmx
 jlDUXdD1Vo5FhaPiIUce6eZUnSxRxeI9gFQHC9HIdaDdW7wLvO7hdrzI+PYGmAVlmFfFehYR4dg1s
 7cCridNj7ZHauS7yiAQ92PomfblsPFzmH+czBRJt0oml1hv8J+R4euvImzy+aps0vD2g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jM74b-0000Ep-Cm; Wed, 08 Apr 2020 09:32:41 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jM74b-0006Jp-2D; Wed, 08 Apr 2020 09:32:41 +0000
Message-ID: <e4f62e4ce7aba9c4b64437864859181f67e07d3d.camel@xen.org>
Subject: Re: [PATCH 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 08 Apr 2020 10:32:39 +0100
In-Reply-To: <f1537005-cac8-cd74-e19c-043219ccab56@suse.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <2fa83ef5818805c179757caac99ccf7ab4f7ba3a.1584955616.git.hongyxia@amazon.com>
 <f1537005-cac8-cd74-e19c-043219ccab56@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-04-01 at 14:29 +0200, Jan Beulich wrote:
> On 23.03.2020 10:41, Hongyan Xia wrote:
> > --- a/xen/include/asm-x86/page.h
> > +++ b/xen/include/asm-x86/page.h
> > @@ -196,6 +196,24 @@ static inline l4_pgentry_t
> > l4e_from_paddr(paddr_t pa, unsigned int flags)
> >  #define map_l2t_from_l3e(x)        (l2_pgentry_t
> > *)map_domain_page(l3e_get_mfn(x))
> >  #define map_l3t_from_l4e(x)        (l3_pgentry_t
> > *)map_domain_page(l4e_get_mfn(x))
> >  
> > +#define l1e_from_l2e(l2e, off) ({                   \
> > +        l1_pgentry_t *l1t = map_l1t_from_l2e(l2e);  \
> > +        l1_pgentry_t l1e = l1t[off];                \
> > +        UNMAP_DOMAIN_PAGE(l1t);                     \
> > +        l1e; })
> > +
> > +#define l2e_from_l3e(l3e, off) ({                   \
> > +        l2_pgentry_t *l2t = map_l2t_from_l3e(l3e);  \
> > +        l2_pgentry_t l2e = l2t[off];                \
> > +        UNMAP_DOMAIN_PAGE(l2t);                     \
> > +        l2e; })
> > +
> > +#define l3e_from_l4e(l4e, off) ({                   \
> > +        l3_pgentry_t *l3t = map_l3t_from_l4e(l4e);  \
> > +        l3_pgentry_t l3e = l3t[off];                \
> > +        UNMAP_DOMAIN_PAGE(l3t);                     \
> > +        l3e; })
> 
> There's a reason these are macros rather than inline functions,
> I assume? (This reason would be nice to be stated in the
> description.)

While converting them into inline functions, I realised I cannot do
that due to the header mess. Converting into inline functions needs the
domain_page.h header, which opens a can of worms if I include it here
(page.h). Keeping them as macros works around this issue.

I will add this in the description.

Hongyan


