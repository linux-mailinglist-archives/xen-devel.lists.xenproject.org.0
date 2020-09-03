Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1625C1B1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 15:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDpNQ-0004bh-Ua; Thu, 03 Sep 2020 13:34:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP6q=CM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kDpNP-0004bc-2D
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 13:34:07 +0000
X-Inumbo-ID: 1a20d37f-4858-4a16-9994-4fb706782dd0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a20d37f-4858-4a16-9994-4fb706782dd0;
 Thu, 03 Sep 2020 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599140046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FRAPDq0IfR6hc3VwoYGazKWr6UscBv3BJC1OzJHsaC4=;
 b=HOCazn2Au9s/99qk8/4bYw7+q9yeemUsOHwIs3HBicLTrtyogu6t3xPv
 BvSkLjDms1LZlq5Di4wIeWBplyMQ3/uNBLmzTCNPsU0zOgkC8g4dhmtLW
 BbahGTQybk5h4HqTVpEquZfpamrX3Lxdd7YN3jSRBgnD6REauDSYRmJbU o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z3OLn3i0byoj3w14Iu/PhE2V8Du/zki8jQAWC6Yc/PEvXXBzQ1JTt0tPvwSGQyZwj3mfsE2zQd
 6NbOaK+YIbeTbvk43LijvdG7XglShaCdP/dUJTxyBdh0MTy/Fmen4BxsBw0NJt5qMrcGkT87Ep
 03uDmGN6EZ5zVDdSilj1Ho2DJVE1rSoieWg49PzyRcEmfq2VD9G/ga4MAueBlrJedscC3JKs7j
 mcSD9d2SEVGri1rg0CYw2zK2RGUeMgeMjAonEqxM+sKyKs1ak5iH9FZNpUx6kfRO0wE+fyAOB4
 pO8=
X-SBRS: 2.7
X-MesageID: 25907108
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,386,1592884800"; d="scan'208";a="25907108"
Date: Thu, 3 Sep 2020 15:33:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v3 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
Message-ID: <20200903133356.GK753@Air-de-Roger>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-6-roger.pau@citrix.com>
 <d3a4db9b-2142-b9cb-f84c-2c378f125198@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3a4db9b-2142-b9cb-f84c-2c378f125198@citrix.com>
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

On Wed, Sep 02, 2020 at 09:56:48PM +0100, Andrew Cooper wrote:
> On 01/09/2020 11:54, Roger Pau Monne wrote:
> > Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
> > the handling done in VMX code into guest_rdmsr as it can be shared
> > between PV and HVM guests that way.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes from v1:
> >  - Move the VMX implementation into guest_rdmsr.
> > ---
> >  xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
> >  xen/arch/x86/msr.c         | 13 +++++++++++++
> >  2 files changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index 4717e50d4a..f6657af923 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >      case MSR_IA32_DEBUGCTLMSR:
> >          __vmread(GUEST_IA32_DEBUGCTL, msr_content);
> >          break;
> > -    case MSR_IA32_FEATURE_CONTROL:
> > -        *msr_content = IA32_FEATURE_CONTROL_LOCK;
> > -        if ( vmce_has_lmce(curr) )
> > -            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
> > -        if ( nestedhvm_enabled(curr->domain) )
> > -            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> > -        break;
> > +
> >      case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
> >          if ( !nvmx_msr_read_intercept(msr, msr_content) )
> >              goto gp_fault;
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index e84107ac7b..cc2f111a90 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -25,6 +25,7 @@
> >  #include <xen/sched.h>
> >  
> >  #include <asm/debugreg.h>
> > +#include <asm/hvm/nestedhvm.h>
> >  #include <asm/hvm/viridian.h>
> >  #include <asm/msr.h>
> >  #include <asm/setup.h>
> > @@ -197,6 +198,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          /* Not offered to guests. */
> >          goto gp_fault;
> >  
> > +    case MSR_IA32_FEATURE_CONTROL:
> > +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> > +            goto gp_fault;
> 
> The MSR is available if:
> 
> "If any one enumeration
> condition for defined bit
> field position greater than
> bit 0 holds."
> 
> which for us means cp->basic.vmx || cp->feat.lmce at the moment, with
> perhaps some smx/sgx in the future.

I don't think there's a lmce cpu bit (seems to be signaled in
IA32_MCG_CAP[27] = 1), maybe I should just use vmce_has_lmce?

if ( !cp->basic.vmx || !vmce_has_lmce(v) )
    goto gp_fault;

Is it fine however to return a #GP if we don't provide any of those
features to guests, but the underlying CPU does support them?

That seems to be slightly different from how we currently handle reads
to FEATURE_CONTROL, since it will never fault on Intel (or compliant),
even if we just return with bit 0 set alone. The new approach seems
closer to what real hardware would do.

Thanks, Roger.

