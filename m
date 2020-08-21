Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A589B24D47E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 13:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k95av-000899-VA; Fri, 21 Aug 2020 11:52:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJET=B7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k95au-000894-0c
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 11:52:28 +0000
X-Inumbo-ID: a309185f-afb8-4cdd-b515-1513c21739b0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a309185f-afb8-4cdd-b515-1513c21739b0;
 Fri, 21 Aug 2020 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598010746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z38vuIPx6xc4gczITLwdNUTz5OILtCpJvVckL5753aQ=;
 b=V6rL+pGeaPFlen/Dzcgw/QVjIbjaSTA12U1TqOjLj0LorCeTw+axb1+E
 Ov9GQqW3jvuy1ULaTARHE25JnCRpy8erV/do0UalTNv8kDNPkBmfzUT+9
 aV4cI848V0UYbBqwXSq68smT1uWanSbjWRWB0WABVQnIzrOvDebYa0wua A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2m3GBH7EJsYNpkiwgJhC3QvYZXiHe+HbCpUDn4WtfwElFM8ELvNpT3A908LmuqYQ721pEaAkmh
 l7bS4xB8DlFCGtwRXi43Nz544tW8gSEMkOu6drwB1VGbqlPcImT3vZMmW4rPnP/+DCPRDSXUcT
 znS5HwtvQMJ2iJTbwiPtvhWo1nIUXQveQgm+HuzUs/YMl8ye8h2+/kx5G4npf7/lWJ1WzGkBiH
 rhLPRUOQNId3K8WwRm1UVqz6l9BqsDWMoW6r3FKbLAgXv+F0L/xNMs1JnvyT/XyDXEPuvvBR92
 lCY=
X-SBRS: 2.7
X-MesageID: 25359424
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,335,1592884800"; d="scan'208";a="25359424"
Date: Fri, 21 Aug 2020 13:52:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v2 3/8] x86/msr: explicitly handle AMD DE_CFG
Message-ID: <20200821115218.GA1587@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-4-roger.pau@citrix.com>
 <50eef25c-8054-89e7-3b83-a233a0faa6f8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50eef25c-8054-89e7-3b83-a233a0faa6f8@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 06:08:53PM +0100, Andrew Cooper wrote:
> On 20/08/2020 16:08, Roger Pau Monne wrote:
> 
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index ca4307e19f..a890cb9976 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -274,6 +274,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          *val = msrs->tsc_aux;
> >          break;
> >  
> > +    case MSR_AMD64_DE_CFG:
> > +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> > +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> > +                                           X86_VENDOR_HYGON)) ||
> > +             rdmsr_safe(MSR_AMD64_DE_CFG, *val) )
> > +            goto gp_fault;
> > +        break;
> 
> Ah.  What I intended was to read just bit 2 and nothing else.
> 
> Leaking the full value is non-ideal from a migration point of view, and
> in this case, you can avoid querying hardware entirely.
> 
> Just return AMD64_DE_CFG_LFENCE_SERIALISE here.  The only case where it
> won't be true is when the hypervisor running us (i.e. Xen) failed to set
> it up, and the CPU boot path failed to adjust it, at which point the
> whole system has much bigger problems.

Right, the rest are just model specific workarounds AFAICT, so it's
safe to not display them. A guest might attempt to set them, but we
should simply drop the write, see below.

> 
> > +
> >      case MSR_AMD64_DR0_ADDRESS_MASK:
> >      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
> >          if ( !cp->extd.dbext )
> > @@ -499,6 +507,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >              wrmsr_tsc_aux(val);
> >          break;
> >  
> > +    case MSR_AMD64_DE_CFG:
> > +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> > +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> > +            goto gp_fault;
> > +        break;
> 
> There should be no problem yielding #GP here (i.e. dropping this hunk).
> 
> IIRC, it was the behaviour of certain hypervisors when Spectre hit, so
> all guests ought to cope.  (And indeed, not try to redundantly set the
> bit to start with).

It seems like OpenBSD will try to do so unconditionally, see:

https://www.illumos.org/issues/12998

According to the report there returning #GP when trying to WRMSR
DE_CFG will cause OpenBSD to panic, so I think we need to keep this
behavior of silently dropping writes.

Thanks, Roger.

