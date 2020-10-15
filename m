Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48828EE19
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7134.18695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyCb-0008Gi-9b; Thu, 15 Oct 2020 08:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7134.18695; Thu, 15 Oct 2020 08:01:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyCb-0008GJ-6B; Thu, 15 Oct 2020 08:01:33 +0000
Received: by outflank-mailman (input) for mailman id 7134;
 Thu, 15 Oct 2020 08:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyCZ-0008GA-Iq
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:01:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d064306-5a4e-4caa-908e-984941194d87;
 Thu, 15 Oct 2020 08:01:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B05FDAEEB;
 Thu, 15 Oct 2020 08:01:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyCZ-0008GA-Iq
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:01:31 +0000
X-Inumbo-ID: 3d064306-5a4e-4caa-908e-984941194d87
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3d064306-5a4e-4caa-908e-984941194d87;
	Thu, 15 Oct 2020 08:01:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602748887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WA7A7TgUHP+AB/O7+hhVzxaGDyCzojagDUVxHGcH1j8=;
	b=EEFptd1/JfFVhJO/VJfOV6TNSiWI76xdTQqcAQMf9ZyxTyfoI7VVn/HuMKzldmis9K0yH/
	6ag+w6wdyBhVC9LKys/eEl5JZ+O3fSG7ai0gadgTG5TWQWX1fcRI+eqC1CBLXwv6z/ABGa
	NyKBuPZ5+FehivcOK2voQ+UyOgp+oE4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B05FDAEEB;
	Thu, 15 Oct 2020 08:01:27 +0000 (UTC)
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
 <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
 <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1786f728-15c2-3877-c01a-035b11bd8504@suse.com>
Date: Thu, 15 Oct 2020 10:01:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.2020 15:57, Andrew Cooper wrote:
> On 13/10/2020 16:58, Jan Beulich wrote:
>> On 09.10.2020 17:09, Andrew Cooper wrote:
>>> At the time of XSA-170, the x86 instruction emulator really was broken, and
>>> would allow arbitrary non-canonical values to be loaded into %rip.  This was
>>> fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
>>> targets".
>>>
>>> However, in a demonstration that off-by-one errors really are one of the
>>> hardest programming issues we face, everyone involved with XSA-170, myself
>>> included, mistook the statement in the SDM which says:
>>>
>>>   If the processor supports N < 64 linear-address bits, bits 63:N must be identical
>>>
>>> to mean "must be canonical".  A real canonical check is bits 63:N-1.
>>>
>>> VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
>>> to the boundary condition at 0x0000800000000000.
>>>
>>> Now that the emulator has been fixed, revert the XSA-170 change to fix
>>> architectural behaviour at the boundary case.  The XTF test case for XSA-170
>>> exercises this corner case, and still passes.
>>>
>>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> But why revert the change rather than fix ...
>>
>>> @@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>  out:
>>>      if ( nestedhvm_vcpu_in_guestmode(v) )
>>>          nvmx_idtv_handling();
>>> -
>>> -    /*
>>> -     * VM entry will fail (causing the guest to get crashed) if rIP (and
>>> -     * rFLAGS, but we don't have an issue there) doesn't meet certain
>>> -     * criteria. As we must not allow less than fully privileged mode to have
>>> -     * such an effect on the domain, we correct rIP in that case (accepting
>>> -     * this not being architecturally correct behavior, as the injected #GP
>>> -     * fault will then not see the correct [invalid] return address).
>>> -     * And since we know the guest will crash, we crash it right away if it
>>> -     * already is in most privileged mode.
>>> -     */
>>> -    mode = vmx_guest_x86_mode(v);
>>> -    if ( mode == 8 ? !is_canonical_address(regs->rip)
>> ... the wrong use of is_canonical_address() here? By reverting
>> you open up avenues for XSAs in case we get things wrong elsewhere,
>> including ...
>>
>>> -                   : regs->rip != regs->eip )
>> ... for 32-bit guests.
> 
> Because the only appropriate alternative would be ASSERT_UNREACHABLE()
> and domain crash.
> 
> This logic corrupts guest state.
> 
> Running with corrupt state is every bit an XSA as hitting a VMEntry
> failure if it can be triggered by userspace, but the latter safer and
> much more obvious.

I disagree. For CPL > 0 we don't "corrupt" guest state any more
than reporting a #GP fault when one is going to be reported
anyway (as long as the VM entry doesn't fail, and hence the
guest won't get crashed). IOW this raising of #GP actually is a
precautionary measure to _avoid_ XSAs.

Nor do I agree with the "much more obvious" aspect: A VM entry
failure requires quite a bit of analysis to recognize what has
caused it; whether a non-pseudo-canonical RIP is what catches your
eye right away is simply unknown. The gprintk() that you delete,
otoh, says very clearly what we have found to be wrong.

> It was the appropriate security fix (give or take the functional bug in
> it) at the time, given the complexity of retrofitting zero length
> instruction fetches to the emulator.
> 
> However, it is one of a very long list of guest-state-induced VMEntry
> failures, with non-trivial logic which we assert will pass, on a
> fastpath, where hardware also performs the same checks and we already
> have a runtime safe way of dealing with errors.  (Hence not actually
> using ASSERT_UNREACHABLE() here.)

"Runtime safe" as far as Xen is concerned, I take it. This isn't safe
for the guest at all, as vmx_failed_vmentry() results in an
unconditional domain_crash().

I certainly buy the fast path aspect of your comment, and if you were
moving the guest state adjustment into vmx_failed_vmentry(), I'd be
fine with the deletion here.

> It isn't appropriate for this check to exist on its own (i.e. without
> other guest state checks),

Well, if we run into cases where we get things wrong, more checks
and adjustments may want adding. Sadly each one of those has a fair
chance of needing an XSA.

As an aside, nvmx_n2_vmexit_handler()'s handling of
VMX_EXIT_REASONS_FAILED_VMENTRY looks pretty bogus - this is a flag,
not a separate exit reason. I guess I'll make a patch ...

Jan

