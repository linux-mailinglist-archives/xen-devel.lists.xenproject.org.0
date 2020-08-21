Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BA224D702
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 16:09:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k97jK-00035v-W5; Fri, 21 Aug 2020 14:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJET=B7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k97jJ-00035q-2e
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 14:09:17 +0000
X-Inumbo-ID: b78b7d8a-7225-467e-9834-c318185e71ed
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b78b7d8a-7225-467e-9834-c318185e71ed;
 Fri, 21 Aug 2020 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598018955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MvTI4GCrqU8QCpcRH2TZ1aJeIUfRaP3iBExWnxE1K7Y=;
 b=VIO1XzHEuJDsXKyCTn2mINwchWsgA2rx0bBa/VCzLrhudNRGxRFXuApV
 ip1yz6zUrYeolh9k6oTpNFkuJl7XGrzh4mAYBv6CTyJu98ib8oBXXnpgE
 9u/eOkgOw72g/B+UV/kuLQ9H2AujbxL7SmjyJuyUgOF5wkE8GmCGS9HrY E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LG5Xareh6zOr1vGErC2r+q5Sz2+bh0TW/3t9BD0GMKPYhGKF2WJsBgNkz2Q7aDgRO29lS/07CG
 ohiiw+qWUCYDnszkRmMHccD0mVt07Jk4zE1CV9Mitw03IvescGBWdjshOiNQcez22EjpQ0IVj1
 Sj186m3jsgaucRB7YjPBr5KZiJeooE34gqmCcuhARlgaRt0PfD2jsbO+BVKKh4F1A0+sQKAf6s
 B1RhweeI3NkAllVFoNQOovZxTIBnDLzLBz//uEivFPp/TXdD2OZq3YSjkhdZvO1j7J53LJX2Xq
 h+k=
X-SBRS: 2.7
X-MesageID: 25966188
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,335,1592884800"; d="scan'208";a="25966188"
Date: Fri, 21 Aug 2020 16:09:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v2 3/8] x86/msr: explicitly handle AMD DE_CFG
Message-ID: <20200821140904.GB1587@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-4-roger.pau@citrix.com>
 <50eef25c-8054-89e7-3b83-a233a0faa6f8@citrix.com>
 <20200821115218.GA1587@Air-de-Roger>
 <587e06b2-17f7-918d-1aad-fe14bc90f4f5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587e06b2-17f7-918d-1aad-fe14bc90f4f5@citrix.com>
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

On Fri, Aug 21, 2020 at 03:03:08PM +0100, Andrew Cooper wrote:
> On 21/08/2020 12:52, Roger Pau Monné wrote:
> > On Thu, Aug 20, 2020 at 06:08:53PM +0100, Andrew Cooper wrote:
> >> On 20/08/2020 16:08, Roger Pau Monne wrote:
> >>
> >>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> >>> index ca4307e19f..a890cb9976 100644
> >>> --- a/xen/arch/x86/msr.c
> >>> +++ b/xen/arch/x86/msr.c
> >>> @@ -274,6 +274,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>>          *val = msrs->tsc_aux;
> >>>          break;
> >>>  
> >>> +    case MSR_AMD64_DE_CFG:
> >>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> >>> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> >>> +                                           X86_VENDOR_HYGON)) ||
> >>> +             rdmsr_safe(MSR_AMD64_DE_CFG, *val) )
> >>> +            goto gp_fault;
> >>> +        break;
> >> Ah.  What I intended was to read just bit 2 and nothing else.
> >>
> >> Leaking the full value is non-ideal from a migration point of view, and
> >> in this case, you can avoid querying hardware entirely.
> >>
> >> Just return AMD64_DE_CFG_LFENCE_SERIALISE here.  The only case where it
> >> won't be true is when the hypervisor running us (i.e. Xen) failed to set
> >> it up, and the CPU boot path failed to adjust it, at which point the
> >> whole system has much bigger problems.
> > Right, the rest are just model specific workarounds AFAICT, so it's
> > safe to not display them. A guest might attempt to set them, but we
> > should simply drop the write, see below.
> 
> Most of the layout is model specific.  It's only by chance that the
> LFENCE bits line up in all generations.
> 
> The bit used to work around Speculative Store Bypass in LS_CFG doesn't
> line up across generations.
> 
> >>> +
> >>>      case MSR_AMD64_DR0_ADDRESS_MASK:
> >>>      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
> >>>          if ( !cp->extd.dbext )
> >>> @@ -499,6 +507,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >>>              wrmsr_tsc_aux(val);
> >>>          break;
> >>>  
> >>> +    case MSR_AMD64_DE_CFG:
> >>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> >>> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >>> +            goto gp_fault;
> >>> +        break;
> >> There should be no problem yielding #GP here (i.e. dropping this hunk).
> >>
> >> IIRC, it was the behaviour of certain hypervisors when Spectre hit, so
> >> all guests ought to cope.  (And indeed, not try to redundantly set the
> >> bit to start with).
> > It seems like OpenBSD will try to do so unconditionally, see:
> >
> > https://www.illumos.org/issues/12998
> >
> > According to the report there returning #GP when trying to WRMSR
> > DE_CFG will cause OpenBSD to panic, so I think we need to keep this
> > behavior of silently dropping writes.
> 
> /sigh - there is always one.  Comment please, and lets leave it as
> write-discard.
> 
> As for the vendor-ness, drop the checks to just cp->x86_vendor.  There
> is no boot_cpu_data interaction how that you've taken the rdmsr() out.

Sure, will wait for comments on other patches before sending the
updated version.

Thanks, Roger.

