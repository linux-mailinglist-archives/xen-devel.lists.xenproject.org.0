Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E0192EC4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH9Is-0005Js-O2; Wed, 25 Mar 2020 16:54:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH9Ir-0005Jm-Ct
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:54:53 +0000
X-Inumbo-ID: 588f5752-6eb9-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 588f5752-6eb9-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585155292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DHCqbmwOIIBXhHudt5BZhrVK8u16pSEbHh5pAma6fKQ=;
 b=djYIIAqX1DsfUFTCFn/7QtTkFn88eY7IVbD2Fa68jP8BarNe0JdDdcNT
 zVI02o0leiXDUG8jCX8kwPATiyPN4x2GuW3qcqPNSzslFwKOZtfE2aBbA
 U+gLSjIAHV1YcK46FJpGxvpkEcy3TGLRF/hOhjFMYVFHx/Vw7Fyb48JgS k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A6Wn7E6ydA911DTN6AuofNRr1ByquYGpl3wZlA/e93n9FvEIyrWkzpeSy3W9LnL4gn0cGKF37o
 JH0eQZ5VehZcV4T8/mjl095AmPn5dTNtpQw461jm/V+vjWuxh+b5kR20zlv5qAhWc4USRgfuFH
 lbSJ/3/JksDm2uLL6EdC3TyqaCkos+pRm8A/QlXBeEXK8rqqsWE9SJ4JBkbjReF9D2wGV/PEw1
 dHc2qr5V5932K5utbo7BnieoLg8dkRwWl1acvElAlSz//IcdXu3OntGq3CLr39PMtNSUWVU+cK
 AMk=
X-SBRS: 2.7
X-MesageID: 14956599
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14956599"
Date: Wed, 25 Mar 2020 17:54:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200325165444.GF28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Stefano
 Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas.lengyel@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 04:42:07PM +0000, Julien Grall wrote:
> Hi,
> 
> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> > > > diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> > > > index 9f51370327..1ed7d13084 100644
> > > > --- a/xen/arch/x86/mm/p2m.c
> > > > +++ b/xen/arch/x86/mm/p2m.c
> > > > @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
> > > > 
> > > >       mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > > > 
> > > > +    /* Check if we need to fork the page */
> > > > +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> > > > +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> > > > +        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > > > +
> > > > +    /* Check if we need to unshare the page */
> > > >       if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> > > >       {
> > > >           ASSERT(p2m_is_hostp2m(p2m));
> > > > @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> > > >               return page;
> > > > 
> > > >           /* Error path: not a suitable GFN at all */
> > > > -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
> > > > +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
> > > > +             !mem_sharing_is_fork(p2m->domain) )
> > > >               return NULL;
> > > >       }
> > > > 
> > > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > > index b4eb476a9c..62aed53a16 100644
> > > > --- a/xen/common/domain.c
> > > > +++ b/xen/common/domain.c
> > > > @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
> > > > 
> > > >       v->vcpu_info = new_info;
> > > >       v->vcpu_info_mfn = page_to_mfn(page);
> > > > +#ifdef CONFIG_MEM_SHARING
> > > > +    v->vcpu_info_offset = offset;
> > > 
> > > There's no need to introduce this field, you can just use v->vcpu_info
> > > & ~PAGE_MASK AFAICT.
> > 
> > Just doing what you suggest above results in:
> > 
> > mem_sharing.c:1603:55: error: invalid operands to binary & (have
> > ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
> > int’)
> >                                       d_vcpu->vcpu_info & ~PAGE_MASK);
> > 
> > I can of course cast the vcpu_info pointer to (long int), it's just a
> > bit ugly. Thoughts?
> 
> FWIW, I will also need the offset for liveupdate. I have used (unsigned
> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.

I think using:

(vaddr_t)v->vcpu_info & ~PAGE_MASK

is acceptable, but that would require adding a vaddr_t typedef to x86.

Adding a macro to do so would be OK by me, maybe PAGE_OFFSET or some
such?

> So I am all for either a new field or a macro hiding this uglyness.

Macro would be better IMO, as it's redundant to store the offset when
we can obtain it from an existing field.

Thanks, Roger.

