Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B0260C58
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 09:47:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFYKS-0007pc-KN; Tue, 08 Sep 2020 07:46:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPGa=CR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFYKR-0007pX-NL
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 07:46:11 +0000
X-Inumbo-ID: d671599f-3803-4a5e-a33d-badc2fbbe726
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d671599f-3803-4a5e-a33d-badc2fbbe726;
 Tue, 08 Sep 2020 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599551168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ajhIf7O3zq1c3W3pVCYeizTgCFrlAJr0kUjEXr4E+hw=;
 b=L8zqMj+EcJgV6HMc1MNbuM4S5TRTRuVs24V/mu2TfBM9ZOHdtgkXBqIB
 WSTJVxOJXG4MotQUrl8kkV4eHs/9BDVO0pf05W30EshAC0lTZWfuEvyl1
 TUVn5Qk5cIFMEqrr7RVc8O1DTaBDZd9DQu8V5xkE+pSc9wELgsacSuuR8 A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sWM6UpE9DITOmZKbZy+Za8PK+3R8Sy8pZljeTem4b8H5BQz2elaVaFS+lpx9pEz3UqhuB2hDjV
 uOXwD1N3VPKza8zHDM6mnm9wrp0pH9voX/5RAD83AzHvPjLkSfh7ZegiV78M7/pLwFlcdvSd3m
 /+dAP6eL2y5hACjF6oZQWp3oyD+5C+UiOp03n5vE3/v1EF+OT0p2W3ruiIKqzLODR9iSKCAuG4
 rWh2Buo10ZKPmG5htV480C/R7LSTvWgkOUv2VpVZNiU7dWTGgJ0luAqueaQ+Hw8AleaTQwYtfM
 APw=
X-SBRS: 2.7
X-MesageID: 27131167
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,405,1592884800"; d="scan'208";a="27131167"
Date: Tue, 8 Sep 2020 09:45:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()"
Message-ID: <20200908074551.GT753@Air-de-Roger>
References: <20200907170916.61693-1-roger.pau@citrix.com>
 <004801d685ab$e0452ce0$a0cf86a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004801d685ab$e0452ce0$a0cf86a0$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 08, 2020 at 07:47:09AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 07 September 2020 18:09
> > To: xen-devel@lists.xenproject.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Subject: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()"
> > 
> > This reverts commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750.
> > 
> > Original commit only takes into account the APIC access page being a
> > 'special' page, but when running a PVH dom0 there are other pages that
> > also fulfill the 'special' page check but shouldn't have it's cache
> > type set to WB.
> > 
> > For example the ACPI regions are identity mapped into the guest but
> > are also Xen heap pages, and forcing those to WB cache type is wrong.
> 
> I don't understand why reversion of this patch alone is sufficient then...
>  
> > 
> > I've discovered this while trying to boot a PVH dom0, which fail to
> > boot with this commit applied.
> > 
> > Revert the commit while this is sorted out: either we settle that the
> > current code is correct, or we modify the way ACPI regions are mapped
> > into a PVH dom0.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Paul Durrant <paul@xen.org>
> > ---
> >  xen/arch/x86/hvm/mtrr.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
> > index fb051d59c3..2bd64e8025 100644
> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -815,13 +815,23 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
> >          return -1;
> >      }
> > 
> > +    if ( direct_mmio )
> > +    {
> > +        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) >> order )
> > +            return MTRR_TYPE_UNCACHABLE;
> > +        if ( order )
> > +            return -1;
> > +        *ipat = 1;
> > +        return MTRR_TYPE_WRBACK;
> > +    }
> > +
> >      if ( !mfn_valid(mfn) )
> >      {
> >          *ipat = 1;
> >          return MTRR_TYPE_UNCACHABLE;
> >      }
> > 
> > -    if ( !direct_mmio && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> > +    if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> >      {
> >          *ipat = 1;
> >          return MTRR_TYPE_WRBACK;
> 
> ... since just below this hunk, commit ca24b2ffdbd9 "x86/hvm: set 'ipat' in EPT for special pages" introduced the check:

ACPI identity mapped regions in a PVH dom0 don't even get there since
they are handled by the 'if ( direct_mmio )' chunk above.

> +    for ( i = 0; i < (1ul << order); i++ )
> +    {
> +        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
> +        {
> +            if ( order )
> +                return -1;
> +            *ipat = 1;
> +            return MTRR_TYPE_WRBACK;
> +        }
> +    }
> +
> 
> So, would that not be catching the ACPI regions?

No, because on a PVH dom0 ACPI regions are MMIO identity mapped, and
thus direct_mmio is true for them, and hence they get handled by the
first chunk that the original patch removed.

> 
> Also, why is it ok for ACPI regions to be WB if the IOMMU is not enabled? I know that this will never be the case for PVH dom0 but why do domUs also have to suffer? I think we need a more targeted patch.

domUs don't have ACPI tables mapped as MMIO, as the ACPI tables in
that case are created by the toolstack and reside in a RAM region.

I'm not completely convinced that using UC unconditionally for ACPI
identity mapped regions is fully correct, I will think of a better way
to handled them but in the meantime we need to keep this working.

Thanks, Roger.

