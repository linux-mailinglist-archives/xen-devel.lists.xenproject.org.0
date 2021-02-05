Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E5310C0F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81724.151114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81QV-00042g-1V; Fri, 05 Feb 2021 13:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81724.151114; Fri, 05 Feb 2021 13:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81QU-00042H-Ui; Fri, 05 Feb 2021 13:45:34 +0000
Received: by outflank-mailman (input) for mailman id 81724;
 Fri, 05 Feb 2021 13:45:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l81QT-00042C-Cn
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:45:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59741112-2f91-4ed3-8bf1-fbd139107c0a;
 Fri, 05 Feb 2021 13:45:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A30F6ACAC;
 Fri,  5 Feb 2021 13:45:30 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 59741112-2f91-4ed3-8bf1-fbd139107c0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612532730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LpACkC7WkcjdBI3CtAMqNLbyfyrzIv4qwUP8sIonvg=;
	b=f9OWEjZSxTyONKkJimAYuiHwfuaUZuBrC29jXmBXAo1XBwr1eSALeryH4ogkkazcp6Q/AW
	6UzWWWqZXOAXk/8EudROmsvpGd0EIqBYFUWd6CHXjCQHmzVDnLASEoHOQcGV3eEWIADI2u
	/UB8dmpygB4ehOMNCFmA4KLCkKPi5BQ=
Subject: Re: [PATCH] x86/HVM: support emulated UMIP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tamas K Lengyel
 <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
 <c717bd30-27b2-625d-576e-eb41a7192c55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b544830f-4104-264e-77da-ebe6cd811fe1@suse.com>
Date: Fri, 5 Feb 2021 14:45:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c717bd30-27b2-625d-576e-eb41a7192c55@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.02.2021 15:10, Andrew Cooper wrote:
> On 29/01/2021 11:45, Jan Beulich wrote:
>> There are three noteworthy drawbacks:
>> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>>    now have to emulate certain instructions for ring 0.
>> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>>    complete there.
>> 3) The CR4 write intercept on SVM is lower priority than all exception
>>    checks, so we need to intercept #GP.
>> Therefore this emulation doesn't get offered to guests by default.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I wonder if it would be helpful for this to be 3 patches, simply because
> of the differing complexity of the VT-x and SVM pieces.

If so, then three or even four. One each for SVM/VMX, and
a final one for the enabling in vendor independent code.
For the possible 4th one, see below in the
hvm_descriptor_access_intercept() related part.

>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -453,6 +453,13 @@ static void __init calculate_hvm_max_pol
>>      __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
>>  
>>      /*
>> +     * Xen can often provide UMIP emulation to HVM guests even if the host
>> +     * doesn't have such functionality.
>> +     */
>> +    if ( hvm_funcs.set_descriptor_access_exiting )
> 
> No need for this check.  Exiting is available on all generations and
> vendors.

VMX code treats this as optional, and I think it validly
does so at least in case we're running virtualized ourselves
and the lower hypervisor doesn't emulate this.

> Also, the header file probably wants a ! annotation for UMIP to signify
> that we doing something special with it.

I can do so, sure. I'm never really sure how wide the scope
of "special" is here.

>> @@ -3731,6 +3732,13 @@ int hvm_descriptor_access_intercept(uint
>>      struct vcpu *curr = current;
>>      struct domain *currd = curr->domain;
>>  
>> +    if ( (is_write || curr->arch.hvm.guest_cr[4] & X86_CR4_UMIP) &&
> 
> Brackets for & expression?

Oops.

>> +         hvm_get_cpl(curr) )
>> +    {
>> +        hvm_inject_hw_exception(TRAP_gp_fault, 0);
>> +        return X86EMUL_OKAY;
>> +    }
> 
> I believe this is a logical change for monitor - previously, non-ring0
> events would go all the way to userspace.
> 
> I don't expect this to be an issue - monitoring agents really shouldn't
> be interested in userspace actions the guest kernel is trying to turn
> into #GP.

Isn't the present behavior flawed, in that UMIP (if supported
by hardware and enabled by the guest) doesn't get honored,
and the access _instead_ gets forwarded to the monitor?
Looking at public/vm_event.h I can't seem to be able to spot
any means by which the monitor could say "I want an exception
here" in response. IOW - shouldn't this hunk be split out as
a prereq bug fix (i.e. aforementioned 4th patch)?

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -547,6 +547,28 @@ void svm_update_guest_cr(struct vcpu *v,
>>              value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
>>          }
>>  
>> +        if ( v->domain->arch.cpuid->feat.umip && !cpu_has_umip )
> 
> Throughout the series, examples like this should have the !cpu_has_umip
> clause first.  It is static per host, rather than variable per VM, and
> will improve the branch prediction.
> 
> Where the logic is equivalent, it is best to have the clauses in
> stability order, as this will prevent a modern CPU from even evaluating
> the CPUID policy.
> 
>> +        {
>> +            u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>> +
>> +            if ( v->arch.hvm.guest_cr[4] & X86_CR4_UMIP )
>> +            {
>> +                value &= ~X86_CR4_UMIP;
>> +                ASSERT(vmcb_get_cr_intercepts(vmcb) & CR_INTERCEPT_CR0_READ);
> 
> It occurs to me that adding CR0 read exiting adds a lot of complexity
> for very little gain.
> 
> From a practical standpoint, UMIP exists to block SIDT/SGDT which are
> the two instructions which confer an attacker with useful information
> (linear addresses of the IDT/GDT respectively).  SLDT/STR only confer a
> 16 bit index within the GDT (fixed per OS), and SMSW is as good as a
> constant these days.
> 
> Given that Intel cannot intercept SMSW at all and we've already accepted
> that as a limitation vs architectural UMIP, I don't think extra
> complexity on AMD is worth the gain.

Hmm, I didn't want to make this emulation any less complete
than is necessary because of external restrictions. As an
intermediate solution, how about hiding this behind a
default-off command line option, e.g. "svm=full-umip"?

>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -1537,6 +1552,7 @@ static void vmx_update_guest_cr(struct v
>>                                               (X86_CR4_PSE | X86_CR4_SMEP |
>>                                                X86_CR4_SMAP)
>>                                               : 0;
>> +            v->arch.hvm.vmx.cr4_host_mask |= cpu_has_umip ? 0 : X86_CR4_UMIP;
> 
> if ( !cpu_has_umip )
>      v->arch.hvm.vmx.cr4_host_mask |= X86_CR4_UMIP;

This wouldn't be in line with immediately preceding code
(visible in context), and subsequent code using if() is, aiui,
because the conditions are (textually) more complex there. So
if I was to make the change, I'd at least like to understand
why adjacent code is fine doing differently, even more so that
iirc it was often you to introduce such constructs in favor of
if()-s.

Jan

