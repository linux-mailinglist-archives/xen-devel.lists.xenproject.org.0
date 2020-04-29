Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46771BD829
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 11:26:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTiz3-0000KN-8f; Wed, 29 Apr 2020 09:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QE4t=6N=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jTiz1-0000KG-J1
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 09:26:23 +0000
X-Inumbo-ID: 7dec2310-89fb-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dec2310-89fb-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YgStSeu4NexQHRS0NB9VnK+4/BDFKBvIfbBLjZnjZjs=; b=vtlJZKEfCrBI8ebJ29AZhXZUmJ
 tnAFPt8yY4llVvkSop9gYTsrlGHMrdKUujJCTiZyE1HHVR76IjMpZ5zuXpLkKQb3vU7OFftn3bpeL
 OmfP2bQqaRkTL4WqQlbFhjRxiDHr8ZxLmC1MJw/geikG1uY4ilxs8ppdyydue8v6+7aw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jTiyz-0005eH-EN; Wed, 29 Apr 2020 09:26:21 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=s3-prod-r2d2-p7995.iad7.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jTiyz-0008Sx-2W; Wed, 29 Apr 2020 09:26:21 +0000
Message-ID: <e18871ea997a304394adbbc92e724ae0ec56d87a.camel@xen.org>
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Date: Wed, 29 Apr 2020 10:26:19 +0100
In-Reply-To: <c33dcaee9c8796da8816de9168f91ce90de61fc5.camel@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
 <9df9c5163fde5d25ceb756b20714c58be93b2c6c.camel@xen.org>
 <c33dcaee9c8796da8816de9168f91ce90de61fc5.camel@xen.org>
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2020-04-28 at 16:59 +0100, Hongyan Xia wrote:
> On Tue, 2020-04-28 at 16:55 +0100, Hongyan Xia wrote:
> > On Tue, 2020-04-28 at 17:33 +0200, Jan Beulich wrote:
> > > On 17.04.2020 11:52, Hongyan Xia wrote:
> > > > --- a/xen/arch/x86/pv/dom0_build.c
> > > > +++ b/xen/arch/x86/pv/dom0_build.c
> > > > @@ -50,17 +50,17 @@ static __init void
> > > > mark_pv_pt_pages_rdonly(struct domain *d,
> > > >      unsigned long count;
> > > >      struct page_info *page;
> > > >      l4_pgentry_t *pl4e;
> > > > -    l3_pgentry_t *pl3e;
> > > > -    l2_pgentry_t *pl2e;
> > > > -    l1_pgentry_t *pl1e;
> > > > +    l3_pgentry_t *pl3e, *l3t;
> > > > +    l2_pgentry_t *pl2e, *l2t;
> > > > +    l1_pgentry_t *pl1e, *l1t;
> > > 
> > > I don't quite see why the new local variables get introduced:
> > > unmap_domain_page(), iirc, is quite fine with a non-page-
> > > aligned argument.
> > 
> > You are right, although in this function, where plXe points to may
> > not
> > be the page we want to unmap. When plXe becomes aligned and points
> > to
> > a
> > new page, we actually want to unmap the page before it increments
> > to
> > an
> > aligned value.
> 
> Hmm, we can just unmap(plXe - 1) if my logic is correct, and save 3
> local variables.

Sorry for monologuing, but I still prefer separating plXe and lXt
because it makes it clear what we are unmapping. Unmapping plXe - 1 is
a bit hackish.

But if people do not have a problem with plXe - 1, I will post a new
revision for that.

Hongyan


