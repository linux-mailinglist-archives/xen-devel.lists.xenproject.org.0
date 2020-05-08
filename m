Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5B1CB5DC
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 19:25:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX6jV-0004qj-N0; Fri, 08 May 2020 17:24:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ij8=6W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jX6jU-0004qe-Qo
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 17:24:20 +0000
X-Inumbo-ID: c011ce5a-9150-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c011ce5a-9150-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588958660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a4Rvv8S+IPmbc9kmP71z6n6Wz2alFja5VdgAXPtIEI8=;
 b=Y7tr7/lRfg9utwYEcKnSKDtN4DHxpJHU9z8gtjf6FkOz18k1eFNa/LnB
 18A+xD4vwK4flNZ3HZ2NcA5A86sOhX7qHpRrKE0vunBz7G2o26x3c92Un
 T016lSADGZfNdFzOkWWL5byb1IbD2bqS2LRKZTbENipKIS4gPeYt2dMhG 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: VNt+codr5fEJdm6Hnyif6ikrWE1lGnEJpLq42oPIZ1+vcN9YRMNhuwhh1LqLN+LSoy1hkwxAFV
 hkRkMPp2qx19H+la4OjEdBbqV4kTXAnML+PFSrnaT0zBT4QDKBPf591Y7BEp+jmcjGCMHZ3KbB
 yAlATYXhL/4G4wUSnDbf7/ihwhow1tEBZpFKCj6Ka8O958j/iiFWOQPzhmz3iDwnbz1XOvlIkA
 uh8Db20KVYyznnk9AKYj/6XTQE4dhqqHsfiXFNNbffhtV8RFomPm9iFtbIskw2TSDUPsvV+EEl
 zIs=
X-SBRS: 2.7
X-MesageID: 17109192
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17109192"
Date: Fri, 8 May 2020 19:24:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/idle: prevent entering C6 with in service interrupts
 on Intel
Message-ID: <20200508172411.GM1353@Air-de-Roger>
References: <20200507132236.26010-1-roger.pau@citrix.com>
 <3d147b74-81dd-83b8-7035-67c5ceb72c5f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3d147b74-81dd-83b8-7035-67c5ceb72c5f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 08, 2020 at 03:46:08PM +0200, Jan Beulich wrote:
> On 07.05.2020 15:22, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> > index b83446e77d..5023fea148 100644
> > --- a/xen/arch/x86/acpi/cpu_idle.c
> > +++ b/xen/arch/x86/acpi/cpu_idle.c
> > @@ -573,6 +573,25 @@ static bool errata_c6_eoi_workaround(void)
> >      return (fix_needed && cpu_has_pending_apic_eoi());
> >  }
> >  
> > +static int8_t __read_mostly disable_c6_isr = -1;
> > +boolean_param("disable-c6-isr", disable_c6_isr);
> > +
> > +/*
> > + * Errata CLX30: A Pending Fixed Interrupt May Be Dispatched Before an
> > + * Interrupt of The Same Priority Completes.
> > + *
> > + * Prevent entering C6 if there are pending lapic interrupts, or else the
> > + * processor might dispatch further pending interrupts before the first one has
> > + * been completed.
> > + */
> > +bool errata_c6_isr_workaround(void)
> > +{
> > +    if ( unlikely(disable_c6_isr == -1) )
> > +        disable_c6_isr = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
> > +
> > +    return disable_c6_isr && cpu_has_pending_apic_eoi();
> 
> This check being the same as in errata_c6_eoi_workaround(),
> why don't you simply extend that function? (See also below.)
> Also both variable and command line option descriptor could
> go inside the function, to limit their scopes.

Since this is actually a superset (as it covers all Intel CPUs), I
should delete the previous (more restricted) workaround matching
logic.

> > @@ -676,7 +695,8 @@ static void acpi_processor_idle(void)
> >          return;
> >      }
> >  
> > -    if ( (cx->type == ACPI_STATE_C3) && errata_c6_eoi_workaround() )
> > +    if ( (cx->type == ACPI_STATE_C3) &&
> > +         (errata_c6_eoi_workaround() || errata_c6_isr_workaround()) )
> >          cx = power->safe_state;
> 
> I realize you only add to existing code, but I'm afraid this
> existing code cannot be safely added to. Already prior to
> your change there was a curious mismatch of C3 and c6 on this
> line, and I don't see how ACPI_STATE_C3 correlates with
> "core C6" state. Now this may have been the convention for
> Nehalem/Westmere systems, but already the mwait-idle entries
> for these CPU models have 4 entries (albeit such that they
> match this scheme). As a result I think this at the very
> least needs to be >=, not ==, even more so now that you want
> to cover all Intel CPUs.

Hm, I think this is because AFAICT acpi_processor_idle only
understands up to ACPI_STATE_C3, passing a type > ACPI_STATE_C3 will
just cause it to fallback to C0. I've adjusted the comparison to use
>= instead, as a safety imporvement in case we add support for more
states to acpi_processor_idle.

> Obviously (I think) it is a mistake that mwait-idle doesn't
> also activate this workaround, which imo is another reason to
> stick to just errata_c6_eoi_workaround().

I assumed the previous workaround didn't apply to any of the CPUs
supported by the mwait-idle driver, since it seems to only support
recent-ish models.

> > --- a/xen/arch/x86/cpu/mwait-idle.c
> > +++ b/xen/arch/x86/cpu/mwait-idle.c
> > @@ -770,6 +770,9 @@ static void mwait_idle(void)
> >  		return;
> >  	}
> >  
> > +	if (cx->type == ACPI_STATE_C3 && errata_c6_isr_workaround())
> > +		cx = power->safe_state;
> 
> Here it becomes even more relevant I think that == not be
> used, as the static tables list deeper C-states; it's just
> that the SKX table, which also gets used for CLX afaict, has
> no entries beyond C6-SKX. Others with deeper ones presumably
> have the deeper C-states similarly affected (or not) by this
> erratum.
> 
> For reference, mwait_idle_cpu_init() has
> 
> 		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
> 		state = MWAIT_HINT2CSTATE(hint) + 1;
>                 ...
> 		cx->type = state;
> 
> i.e. the value you compare against is derived from the static
> table entries. For Nehalem/Westmere this means that what goes
> under ACPI_STATE_C3 is indeed C6-NHM, and this looks to match
> for all the non-Atoms, but for none of the Atoms. Now Atoms
> could easily be unaffected, but (just to take an example) if
> C6-SNB was affected, surely C7-SNB would be, too.

Yes, I've adjusted this to use cx->type >= 3 instead. I have to admit
I'm confused by the name of the states being C6-* while the cstate
value reported by Xen will be 3 (I would instead expect the type to be
6 in order to match the name).

Thanks, Roger.

