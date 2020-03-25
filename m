Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32433192F0A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 18:19:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH9du-00076Y-1C; Wed, 25 Mar 2020 17:16:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH9dt-00076T-7y
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 17:16:37 +0000
X-Inumbo-ID: 60e27d3c-6ebc-11ea-8677-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60e27d3c-6ebc-11ea-8677-12813bfff9fa;
 Wed, 25 Mar 2020 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585156596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Tg5vMp/X4JQiT6I7vRSfkGIUKZwCIsLHxiqkNv6fk4Y=;
 b=fjALVSphc4Vn5FApS9rAZIGZr/DMeVdyCOpNTDnZeyOzOKHwsrOm7pAi
 hvRvOg/t1ogfRraSlqec49mXAIHHwxvEHQyzRYRfPUR0jbhbQrgAXN392
 pvYgd5oO2QBN9gb1S1DtQfShOuPlvlT/T7TuaOFYFLsLjsqQjUUonmDg0 Q=;
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
IronPort-SDR: rUIZKo84Cbde3R4+USVTGY8b16TZ0X5kAmgNwpXzYNy05Fm6mQ6KxW4sBTI68moPJ96CeNnaLt
 hPmdflZBzPyuT2WonDq5sDRCXm5tF+by+JxwM8LzGFm61Wsr/qZog9U0w5qq8X+BeOxcVJCy6t
 knoYnyBiG3Mps3SKgeOutYjH1+ZXuwaIa/v/VegPvolendISNceTnaLDLuu5/uQfu6owP+yol0
 wB5A9x71dTcqG4J7p07T/bHwU4Yv0mbvCJcqdUyhNqzSE6HgLm4mk7Bor5QCJTQu2R5dTKFywO
 1G0=
X-SBRS: 2.7
X-MesageID: 14607850
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,305,1580792400"; d="scan'208";a="14607850"
Date: Wed, 25 Mar 2020 18:16:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200325171627.GG28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
 <95a7c1bf-9b2f-f0e8-1463-3cf8afb74041@xen.org>
 <CABfawh=VFH6t3++-zn0PdANcpev=Utop1f5xLDNH44oxUbGpXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawh=VFH6t3++-zn0PdANcpev=Utop1f5xLDNH44oxUbGpXA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 11:00:05AM -0600, Tamas K Lengyel wrote:
> On Wed, Mar 25, 2020 at 10:52 AM Julien Grall <julien@xen.org> wrote:
> >
> >
> >
> > On 25/03/2020 16:47, Tamas K Lengyel wrote:
> > > On Wed, Mar 25, 2020 at 10:42 AM Julien Grall <julien@xen.org> wrote:
> > >>
> > >> Hi,
> > >>
> > >> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> > >>>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> > >>>>> index 9f51370327..1ed7d13084 100644
> > >>>>> --- a/xen/arch/x86/mm/p2m.c
> > >>>>> +++ b/xen/arch/x86/mm/p2m.c
> > >>>>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
> > >>>>>
> > >>>>>        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > >>>>>
> > >>>>> +    /* Check if we need to fork the page */
> > >>>>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> > >>>>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> > >>>>> +        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > >>>>> +
> > >>>>> +    /* Check if we need to unshare the page */
> > >>>>>        if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> > >>>>>        {
> > >>>>>            ASSERT(p2m_is_hostp2m(p2m));
> > >>>>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> > >>>>>                return page;
> > >>>>>
> > >>>>>            /* Error path: not a suitable GFN at all */
> > >>>>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
> > >>>>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
> > >>>>> +             !mem_sharing_is_fork(p2m->domain) )
> > >>>>>                return NULL;
> > >>>>>        }
> > >>>>>
> > >>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> > >>>>> index b4eb476a9c..62aed53a16 100644
> > >>>>> --- a/xen/common/domain.c
> > >>>>> +++ b/xen/common/domain.c
> > >>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
> > >>>>>
> > >>>>>        v->vcpu_info = new_info;
> > >>>>>        v->vcpu_info_mfn = page_to_mfn(page);
> > >>>>> +#ifdef CONFIG_MEM_SHARING
> > >>>>> +    v->vcpu_info_offset = offset;
> > >>>>
> > >>>> There's no need to introduce this field, you can just use v->vcpu_info
> > >>>> & ~PAGE_MASK AFAICT.
> > >>>
> > >>> Just doing what you suggest above results in:
> > >>>
> > >>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
> > >>> ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
> > >>> int’)
> > >>>                                        d_vcpu->vcpu_info & ~PAGE_MASK);
> > >>>
> > >>> I can of course cast the vcpu_info pointer to (long int), it's just a
> > >>> bit ugly. Thoughts?
> > >>
> > >> FWIW, I will also need the offset for liveupdate. I have used (unsigned
> > >> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
> > >>
> > >> So I am all for either a new field or a macro hiding this uglyness.
> > >
> > > A macro sounds like a good way to go, no need for an extra field if we
> > > can calculate it based on the currently existing one. How about
> > >
> > > #define VCPU_INFO_OFFSET(v) (((unsigned long)v->vcpu_info) & ~PAGE_MASK)
> >
> > I was more thinking a generic macro to find the offset in a page.
> >
> > PAGE_OFFSET(ptr) ((unsigned long)(ptr) & ~PAGE_MASK)
> 
> LGTM. Should we stuff this into xen/sched.h or asm/page.h?

page.h would be better, albeit you will have to duplicate it for x86
and Arm. There's xen/pfn.h which is not arch specific, but feels a bit
weird to place it there.

Thanks, Roger.

