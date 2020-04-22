Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81331B4922
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 17:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRHdX-0000vE-4W; Wed, 22 Apr 2020 15:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRHdV-0000gt-87
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 15:50:05 +0000
X-Inumbo-ID: ee2ea666-84b0-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee2ea666-84b0-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587570604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rlpauxDm9qoGYqy2SW+9vPdrfTG1GPO/Be0nzwvZITc=;
 b=PdDh9Gm57qzMj9BfbR0O0UyP0xJ46G8+duEcNfBhBjHFOQpJh/bcrlkp
 pJR2bsPpQ8Y/aivOJFgIh62tJ3qWEW0sPocG0G4f1QTGxMNnbWtrfIy8p
 lyVbJgOFtUQA5Zi3l0KCjGsFoO7w/fPLG+HHf9tgx7H420aP/klMAf6ls o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G16WzRWnYbXJERv/lI+rCbf12v3M7TUdB9z1D83A8vwm9JXCLM+XkeSQkJN7W/c3GfxJxPRiNU
 6Kkg2mQe1skCKaY4B6JokvVpctghmrSW6B9BLXw+b7riNww8L6k71qFC697hJ4Q8pheOdkdtK6
 ZTCylv30GGhr+9ZbzSE24kKaFYVxAVa3Vwy9J96OpmYzMTizlR4gPhWKh3h8TH0XSHnwGcsK3t
 3C+4c+owuEQdAPfXpVfuzO9JMS03XIrC2o00syahbYCE5VrvoGz+TWHqcpvnd1wq3DzgYvYZhw
 pSU=
X-SBRS: 2.7
X-MesageID: 16062577
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,303,1583211600"; d="scan'208";a="16062577"
Date: Wed, 22 Apr 2020 17:49:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v16 1/3] mem_sharing: fix sharability check during fork
 reset
Message-ID: <20200422154956.GE28601@Air-de-Roger>
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
 <20200422085953.GB28601@Air-de-Roger>
 <CABfawhmBW4kiv_mCUrH_JTdCDZWdbb7Qf65_i350apx-q7NXbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmBW4kiv_mCUrH_JTdCDZWdbb7Qf65_i350apx-q7NXbg@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 06:42:42AM -0600, Tamas K Lengyel wrote:
> On Wed, Apr 22, 2020 at 3:00 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Apr 21, 2020 at 10:47:23AM -0700, Tamas K Lengyel wrote:
> > > @@ -666,20 +670,31 @@ static int page_make_sharable(struct domain *d,
> > >       */
> > >      if ( page->count_info != (PGC_allocated | (2 + expected_refcnt)) )
> > >      {
> > > -        spin_unlock(&d->page_alloc_lock);
> > >          /* Return type count back to zero */
> > >          put_page_and_type(page);
> > > -        return -E2BIG;
> > > +        rc = -E2BIG;
> > > +        goto out;
> > > +    }
> > > +
> > > +    rc = 0;
> > > +
> > > +    if ( validate_only )
> > > +    {
> > > +        put_page_and_type(page);
> >
> > You seem to check some page attributes but then put the page again,
> > which looks racy to me. Since you put the page, couldn't the checks
> > that you have performed be stale by the point the data is consumed by
> > the caller?
> 
> During fork reset when this is called with validate_only = true the
> domain is paused. Furthermore, fork reset is only for forks that have
> no device model running, so nothing is interacting with its memory
> that could acquire extra references. So no, this isn't racy since
> there is nothing to race against that I'm aware of. Also, this check
> is really to check for special pages, all of which are setup during
> the initial fork process, not during runtime of the fork.

Right, it would feel safer to me however if you just return from
page_make_sharable while having a page reference, and drop it in
mem_sharing_fork_reset if the page shouldn't be removed from the fork.

This way you could also avoid having to take an extra reference just
after returning from nominate_page in mem_sharing_fork_reset.
page_make_sharable already returns while having taken an extra
reference to the page in the non validate only case anyway.

> >
> > > +        goto out;
> > >      }
> > >
> > >      page_set_owner(page, dom_cow);
> > >      drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> > >      page_list_del(page, &d->page_list);
> > > -    spin_unlock(&d->page_alloc_lock);
> > >
> > > +out:
> > > +    if ( !validate_only )
> > > +        spin_unlock(&d->page_alloc_lock);
> > >      if ( drop_dom_ref )
> > >          put_domain(d);
> > > -    return 0;
> > > +
> > > +    return rc;
> > >  }
> > >
> > >  static int page_make_private(struct domain *d, struct page_info *page)
> > > @@ -809,8 +824,8 @@ static int debug_gref(struct domain *d, grant_ref_t ref)
> > >      return debug_gfn(d, gfn);
> > >  }
> > >
> > > -static int nominate_page(struct domain *d, gfn_t gfn,
> > > -                         int expected_refcnt, shr_handle_t *phandle)
> > > +static int nominate_page(struct domain *d, gfn_t gfn, int expected_refcnt,
> >
> > Is there any reason for expected_refcnt to be signed? All callers use
> > unsigned values.
> 
> No reason. It's just how the code was written by the original author
> and we never changed it.

Since you are already changing those lines, can I ask you to also
change it to unsigned in the places that you touch?

Thanks, Roger.

