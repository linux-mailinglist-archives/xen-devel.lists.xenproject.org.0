Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6625C22B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 16:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDpt1-0007nQ-OZ; Thu, 03 Sep 2020 14:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKAy=CM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kDpt0-0007nF-5h
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 14:06:46 +0000
X-Inumbo-ID: 0a43c592-2b63-4e0b-a66c-f2172f21b4e5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a43c592-2b63-4e0b-a66c-f2172f21b4e5;
 Thu, 03 Sep 2020 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599142004;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RYy6d9U0GScOKRROWHbyFQCaxql5u/Gy/IbQ9Z76/BY=;
 b=BqKWwES+O8RFALGc7fbrS6M2ZzoGCx6LvkpNs36QuFo3aeuqgTROuBta
 Nsq4Cus3dUSM2Gw8G1PV9fKqmU+0nQgt+UWbXo1yUENKlDaF1o5rx7w57
 N+KDb7kKng0/uZ2215oY6Bg7v+d1UWfrctwIrZb4HU4NIhfJlJbQKKiX7 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VHX1MOVM5maCKYOjTdD32fdSCo6bQRN7oKXcvW3OxAnhn6pwU1brhNrUTA1AzTY37LJB2rVpMg
 a/kv6iFufW4IlONXGTF4u44PsbmZslJ1iarGEyowyFTBU5vZagtYBXHiLEKzs85AhlzZ52gwOA
 0jn9D7WGn7plGjt1MY3NDu/ob8Ps0f6jaUtiRkcJSVuwGinLR481g50Z3W6df02yY0Ecputy/D
 Y6j9JJxKCjHUkrgr8aS/FdF5QVaWCSpxsd2DSgspZv0yNn2aOhKkXOXL8KXHuHHhT7Fv5FsKai
 cAM=
X-SBRS: 2.7
X-MesageID: 26224317
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,387,1592884800"; d="scan'208";a="26224317"
Subject: Re: [PATCH v3 5/8] x86/pv: allow reading FEATURE_CONTROL MSR
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-6-roger.pau@citrix.com>
 <d3a4db9b-2142-b9cb-f84c-2c378f125198@citrix.com>
 <20200903133356.GK753@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8d83424a-a561-9741-6478-5c28383ac9dd@citrix.com>
Date: Thu, 3 Sep 2020 15:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903133356.GK753@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 03/09/2020 14:33, Roger Pau Monné wrote:
> On Wed, Sep 02, 2020 at 09:56:48PM +0100, Andrew Cooper wrote:
>> On 01/09/2020 11:54, Roger Pau Monne wrote:
>>> Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
>>> the handling done in VMX code into guest_rdmsr as it can be shared
>>> between PV and HVM guests that way.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes from v1:
>>>  - Move the VMX implementation into guest_rdmsr.
>>> ---
>>>  xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
>>>  xen/arch/x86/msr.c         | 13 +++++++++++++
>>>  2 files changed, 14 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>> index 4717e50d4a..f6657af923 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>>      case MSR_IA32_DEBUGCTLMSR:
>>>          __vmread(GUEST_IA32_DEBUGCTL, msr_content);
>>>          break;
>>> -    case MSR_IA32_FEATURE_CONTROL:
>>> -        *msr_content = IA32_FEATURE_CONTROL_LOCK;
>>> -        if ( vmce_has_lmce(curr) )
>>> -            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
>>> -        if ( nestedhvm_enabled(curr->domain) )
>>> -            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
>>> -        break;
>>> +
>>>      case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
>>>          if ( !nvmx_msr_read_intercept(msr, msr_content) )
>>>              goto gp_fault;
>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>> index e84107ac7b..cc2f111a90 100644
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -25,6 +25,7 @@
>>>  #include <xen/sched.h>
>>>  
>>>  #include <asm/debugreg.h>
>>> +#include <asm/hvm/nestedhvm.h>
>>>  #include <asm/hvm/viridian.h>
>>>  #include <asm/msr.h>
>>>  #include <asm/setup.h>
>>> @@ -197,6 +198,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>          /* Not offered to guests. */
>>>          goto gp_fault;
>>>  
>>> +    case MSR_IA32_FEATURE_CONTROL:
>>> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
>>> +            goto gp_fault;
>> The MSR is available if:
>>
>> "If any one enumeration
>> condition for defined bit
>> field position greater than
>> bit 0 holds."
>>
>> which for us means cp->basic.vmx || cp->feat.lmce at the moment, with
>> perhaps some smx/sgx in the future.
> I don't think there's a lmce cpu bit (seems to be signaled in
> IA32_MCG_CAP[27] = 1), maybe I should just use vmce_has_lmce?
>
> if ( !cp->basic.vmx || !vmce_has_lmce(v) )
>     goto gp_fault;

Ah yes, sorry.

Eventually that will be mp->mcg_cap.lmce, but use the predicate for now.

> Is it fine however to return a #GP if we don't provide any of those
> features to guests, but the underlying CPU does support them?

Yes.  That is literally how the availability of the MSR specified by Intel.

Any code which doesn't follow those rules will find #GP even on some
recent CPUs.

> That seems to be slightly different from how we currently handle reads
> to FEATURE_CONTROL, since it will never fault on Intel (or compliant),
> even if we just return with bit 0 set alone. The new approach seems
> closer to what real hardware would do.

Don't fall into the trap of assuming that the current MSR behaviour is
perfect, and something we wish to preserve. :)

~Andrew

