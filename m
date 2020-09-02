Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15325B584
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 22:57:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDZoQ-0004HN-LF; Wed, 02 Sep 2020 20:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9C4+=CL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kDZoO-0004HI-Om
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 20:56:56 +0000
X-Inumbo-ID: a96f99a4-1d9b-43b0-87ee-77e2d894d3a8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a96f99a4-1d9b-43b0-87ee-77e2d894d3a8;
 Wed, 02 Sep 2020 20:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599080215;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Or7QAPJq6vrd2Iw+NZzlrd2wzvpNqOc1TNbCkKWe+M0=;
 b=Aii84yoxtLAEKuNpgOo4R7dQUYknDJyPJjIkYWS7ZSAQhUHKlhc8taEu
 0YYPYtHHOEtEuHiibRaEVWh7+XRK9xuXGAbB9D8ubecaVlhJsDR+jwV6W
 2kkeSFBdubJACYrlzObJoqykejJINlCl+WnmkYlN+x09DFO+Y9GhD32fa w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tfdocGE6COSyrQjeLVwVqe1pCRD2/U/xUl0zuLN/Y5skz1Cx+otHA11CszMdvIcgvGVp+XS1Ok
 2jGhR5IL+OB9hcJpFrQThV3BGuynoD+HwwDWCar0nB7Hw6iCRiNVUCNyAYcU04Z0dCXnpHvyqH
 3H8CG1l3/YDl9JBvVGTy0xDBnjBekoCS//LKQZLB6cnTEsXIaX/cgQm2nSRD4wtP+Fhaq2nYQd
 wn6bF73DS7ZFpBzAx2GV3zWfP5S5TPkw+tW++rSwLI5/Av2BiK0SxC7/cRHqiSr5ZTo+hTR/hv
 I18=
X-SBRS: 2.7
X-MesageID: 25881828
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,384,1592884800"; d="scan'208";a="25881828"
Subject: Re: [PATCH v3 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-6-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d3a4db9b-2142-b9cb-f84c-2c378f125198@citrix.com>
Date: Wed, 2 Sep 2020 21:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-6-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 01/09/2020 11:54, Roger Pau Monne wrote:
> Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
> the handling done in VMX code into guest_rdmsr as it can be shared
> between PV and HVM guests that way.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes from v1:
>  - Move the VMX implementation into guest_rdmsr.
> ---
>  xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
>  xen/arch/x86/msr.c         | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 4717e50d4a..f6657af923 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>      case MSR_IA32_DEBUGCTLMSR:
>          __vmread(GUEST_IA32_DEBUGCTL, msr_content);
>          break;
> -    case MSR_IA32_FEATURE_CONTROL:
> -        *msr_content = IA32_FEATURE_CONTROL_LOCK;
> -        if ( vmce_has_lmce(curr) )
> -            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
> -        if ( nestedhvm_enabled(curr->domain) )
> -            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> -        break;
> +
>      case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
>          if ( !nvmx_msr_read_intercept(msr, msr_content) )
>              goto gp_fault;
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index e84107ac7b..cc2f111a90 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -25,6 +25,7 @@
>  #include <xen/sched.h>
>  
>  #include <asm/debugreg.h>
> +#include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/viridian.h>
>  #include <asm/msr.h>
>  #include <asm/setup.h>
> @@ -197,6 +198,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          /* Not offered to guests. */
>          goto gp_fault;
>  
> +    case MSR_IA32_FEATURE_CONTROL:
> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> +            goto gp_fault;

The MSR is available if:

"If any one enumeration
condition for defined bit
field position greater than
bit 0 holds."

which for us means cp->basic.vmx || cp->feat.lmce at the moment, with
perhaps some smx/sgx in the future.

In particular, this MSR is available on Centaur and Shanghai, which
implement VT-x.

~Andrew

> +
> +        *val = IA32_FEATURE_CONTROL_LOCK;
> +        if ( vmce_has_lmce(v) )
> +            *val |= IA32_FEATURE_CONTROL_LMCE_ON;
> +        if ( nestedhvm_enabled(d) )
> +            *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> +        break;
> +
> +
>      case MSR_IA32_PLATFORM_ID:
>          if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
>               !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )


