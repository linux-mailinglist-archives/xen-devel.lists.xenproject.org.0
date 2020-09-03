Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D025C23F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 16:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDpwL-0000Dx-Fz; Thu, 03 Sep 2020 14:10:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP6q=CM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kDpwK-0000Ds-AD
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 14:10:12 +0000
X-Inumbo-ID: 2cf016bb-e148-49af-9cf4-e1a3f0d5fbd0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cf016bb-e148-49af-9cf4-e1a3f0d5fbd0;
 Thu, 03 Sep 2020 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599142211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cRfbtsTMld/nXByltJ6yJR3I2OHAtaCxxHG4ixIXBfM=;
 b=eljGtv4aSwEKcQSOA2TB1OlG2M8j1/RPlVZnKBawqdoWhU1f5QJFHx8r
 sFy8igHdlqP7lISWR3m4MXDjfq5vG1PBOkEMnxSRHutm8aI9ivExosuSh
 ZbWp/nok/wqVoKGmtGZRT7jkyMQPeUFgx8Tf2i3Ht9ppvxO3rpVg7p7uV A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TFY5wVikHgKx3F4tO18DJwkyjYSxIXQwUjC358rHRBA8ZxeZm46W0iZ8tL00tJd0Q/zWmXIupq
 ayIlP27FjrNHN/I8vaHtWkLdecEPqsYSLtP/F/tTKjxLXgL640Ikw8yp/ItHqxKyCjAfBLwTX+
 Fe2k88Q5dBiaD7zCssvyDPRWB2eaw2PQ3Q2Zpdtvo7/kl643jmqgWr6Ukhhb46iiFeMfJsBJCY
 UTU+5JHbWQDWxSck/EqhglNhHgJQEk5SCAvGO+2VoNNTiOYbeJL/0BD12Rk4YH8U7ARtwY7f1v
 /pM=
X-SBRS: 2.7
X-MesageID: 25936648
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,387,1592884800"; d="scan'208";a="25936648"
Date: Thu, 3 Sep 2020 16:10:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v3 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
Message-ID: <20200903141002.GL753@Air-de-Roger>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-6-roger.pau@citrix.com>
 <d3a4db9b-2142-b9cb-f84c-2c378f125198@citrix.com>
 <20200903133356.GK753@Air-de-Roger>
 <8d83424a-a561-9741-6478-5c28383ac9dd@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d83424a-a561-9741-6478-5c28383ac9dd@citrix.com>
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

On Thu, Sep 03, 2020 at 03:06:38PM +0100, Andrew Cooper wrote:
> On 03/09/2020 14:33, Roger Pau Monné wrote:
> > On Wed, Sep 02, 2020 at 09:56:48PM +0100, Andrew Cooper wrote:
> >> On 01/09/2020 11:54, Roger Pau Monne wrote:
> >>> Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
> >>> the handling done in VMX code into guest_rdmsr as it can be shared
> >>> between PV and HVM guests that way.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes from v1:
> >>>  - Move the VMX implementation into guest_rdmsr.
> >>> ---
> >>>  xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
> >>>  xen/arch/x86/msr.c         | 13 +++++++++++++
> >>>  2 files changed, 14 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> >>> index 4717e50d4a..f6657af923 100644
> >>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>> @@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >>>      case MSR_IA32_DEBUGCTLMSR:
> >>>          __vmread(GUEST_IA32_DEBUGCTL, msr_content);
> >>>          break;
> >>> -    case MSR_IA32_FEATURE_CONTROL:
> >>> -        *msr_content = IA32_FEATURE_CONTROL_LOCK;
> >>> -        if ( vmce_has_lmce(curr) )
> >>> -            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
> >>> -        if ( nestedhvm_enabled(curr->domain) )
> >>> -            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> >>> -        break;
> >>> +
> >>>      case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
> >>>          if ( !nvmx_msr_read_intercept(msr, msr_content) )
> >>>              goto gp_fault;
> >>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> >>> index e84107ac7b..cc2f111a90 100644
> >>> --- a/xen/arch/x86/msr.c
> >>> +++ b/xen/arch/x86/msr.c
> >>> @@ -25,6 +25,7 @@
> >>>  #include <xen/sched.h>
> >>>  
> >>>  #include <asm/debugreg.h>
> >>> +#include <asm/hvm/nestedhvm.h>
> >>>  #include <asm/hvm/viridian.h>
> >>>  #include <asm/msr.h>
> >>>  #include <asm/setup.h>
> >>> @@ -197,6 +198,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>>          /* Not offered to guests. */
> >>>          goto gp_fault;
> >>>  
> >>> +    case MSR_IA32_FEATURE_CONTROL:
> >>> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> >>> +            goto gp_fault;
> >> The MSR is available if:
> >>
> >> "If any one enumeration
> >> condition for defined bit
> >> field position greater than
> >> bit 0 holds."
> >>
> >> which for us means cp->basic.vmx || cp->feat.lmce at the moment, with
> >> perhaps some smx/sgx in the future.
> > I don't think there's a lmce cpu bit (seems to be signaled in
> > IA32_MCG_CAP[27] = 1), maybe I should just use vmce_has_lmce?
> >
> > if ( !cp->basic.vmx || !vmce_has_lmce(v) )
> >     goto gp_fault;
> 
> Ah yes, sorry.
> 
> Eventually that will be mp->mcg_cap.lmce, but use the predicate for now.
> 
> > Is it fine however to return a #GP if we don't provide any of those
> > features to guests, but the underlying CPU does support them?
> 
> Yes.  That is literally how the availability of the MSR specified by Intel.
> 
> Any code which doesn't follow those rules will find #GP even on some
> recent CPUs.
> 
> > That seems to be slightly different from how we currently handle reads
> > to FEATURE_CONTROL, since it will never fault on Intel (or compliant),
> > even if we just return with bit 0 set alone. The new approach seems
> > closer to what real hardware would do.
> 
> Don't fall into the trap of assuming that the current MSR behaviour is
> perfect, and something we wish to preserve. :)

Sure, I've pointed out the changes on the commit message, since the
behavior will be different now.

Thanks, Roger.

