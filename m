Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F71A24B1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 17:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMCM7-0008Uk-E2; Wed, 08 Apr 2020 15:11:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R2Jl=5Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jMCM6-0008Uf-GB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 15:11:06 +0000
X-Inumbo-ID: 2aafcacc-79ab-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aafcacc-79ab-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586358665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=47sudtv4L0YN5eAfyUUWFTWPESVTDToDhDV7GhOaRlM=;
 b=TXsycODaIWXOaaDOhk4O5583pwTKfKhQzQZJd+Is03aRVNWrISGcYUPS
 4ITZ7TljbfaDpI8X+8XCj5F/Qxi6JJeoIrVB3aqhamHWx+2lkHsudtjWB
 SzDXe0A9anwU6E8MVVfwgydl5exKCn+SYlNWJGTdxFbDl6imTzd10ZOlj c=;
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
IronPort-SDR: bPu/vWIgR6pI1yXfJ9AMTd90z7/PxywPQTwz7BHxR6exy9oXngoM0Dugf1mI6LmOIwI/OjY4Qz
 YJHjbWHtpxvWGlyD6lWm1VH7w3SLjsdbMy6nRTo+2+ru9X6+i3A0+ZlVE/tn5eGOXDaOoAXaIr
 wh7t0myf3A6JWlHKZJHsl5JKFLCbSPk59l83S1kb05wRi1lBEb8deBdo4Zncfot5jZBRKZUheK
 1TKrmdTRbT6DEdMd0IRtr2G8cygaljC18hbwz9cNAZ+Ts4HWMrwJhU0QCDIdk7TlrvJgL9nC35
 PRI=
X-SBRS: 2.7
X-MesageID: 15700857
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,359,1580792400"; d="scan'208";a="15700857"
Date: Wed, 8 Apr 2020 17:10:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200408151055.GB28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 01:25:14PM +0200, Jan Beulich wrote:
> On 06.04.2020 12:57, Roger Pau Monne wrote:
> > Introduce a specific flag to request a HVM guest linear TLB flush,
> > which is an ASID/VPID tickle that forces a guest linear to guest
> > physical TLB flush for all HVM guests.
> > 
> > This was previously unconditionally done in each pre_flush call, but
> > that's not required: HVM guests not using shadow don't require linear
> > TLB flushes as Xen doesn't modify the guest page tables in that case
> > (ie: when using HAP). Note that shadow paging code already takes care
> > of issuing the necessary flushes when the shadow page tables are
> > modified.
> > 
> > In order to keep the previous behavior modify all shadow code TLB
> > flushes to also flush the guest linear to physical TLB if the guest is
> > HVM. I haven't looked at each specific shadow code TLB flush in order
> > to figure out whether it actually requires a guest TLB flush or not,
> > so there might be room for improvement in that regard.
> > 
> > Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> > requirement for AMD hardware. Finally keep the flush in
> > switch_cr3_cr4, as it's not clear whether code could rely on
> > switch_cr3_cr4 also performing a guest linear TLB flush. A following
> > patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> > not be necessary.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one really minor remark:
> 
> > --- a/xen/arch/x86/mm/paging.c
> > +++ b/xen/arch/x86/mm/paging.c
> > @@ -613,7 +613,8 @@ void paging_log_dirty_range(struct domain *d,
> >  
> >      p2m_unlock(p2m);
> >  
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    flush_mask(d->dirty_cpumask, (!hap_enabled(d) ? FLUSH_TLB : 0) |
> > +                                 FLUSH_HVM_ASID_CORE);
> 
> In cases where one case is assumed to be more likely than the other
> putting the more likely one first can be viewed as a mild hint to
> the compiler, and hence an extra ! may be warranted in an if() or
> a conditional expression. Here, however, I don't think we can
> really consider one case more likely than the other, and hence I'd
> suggest to avoid the !, flipping the other two expressions
> accordingly. I may take the liberty to adjust this while committing
> (if I'm to be the one).

That's fine, thanks. Somehow '!hap -> flush' was clearer in my mind.

Roger.

