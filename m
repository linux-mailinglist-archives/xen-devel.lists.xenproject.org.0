Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A912908A5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 17:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8158.21706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRoM-0002Rx-VL; Fri, 16 Oct 2020 15:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8158.21706; Fri, 16 Oct 2020 15:38:30 +0000
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
	id 1kTRoM-0002RQ-RK; Fri, 16 Oct 2020 15:38:30 +0000
Received: by outflank-mailman (input) for mailman id 8158;
 Fri, 16 Oct 2020 15:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kTRoK-0002Pk-DK
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:38:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d69e8daf-b759-4cfa-8517-5039ee192ad9;
 Fri, 16 Oct 2020 15:38:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kTRoK-0002Pk-DK
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:38:28 +0000
X-Inumbo-ID: d69e8daf-b759-4cfa-8517-5039ee192ad9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d69e8daf-b759-4cfa-8517-5039ee192ad9;
	Fri, 16 Oct 2020 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602862705;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lSdmjCdnp5DmmGGCXMfRkuOKH6z6+aFF2sEdGlVhs0Q=;
  b=hMaOo/QVlIpC6STV//FOaJatm2zzo81L1SQzY81XTcsyXdGy1N4NAZwn
   sVszpZavhtA/66Qap0exB+1G7/0LdcGJCauGYnYArx+ODYNjTLWJa77Bb
   r7Z3rJ80F7fx83wyPwQZN2Zh7wzxjaIuO9Fn8tRMJptMvGfPKY44wj1T5
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JDYWFBkFk317Y2XP/xaIkbXtnoKGnoHX5RPpuHXdnj+9AzQtlTcIsFRaGtDiPOHstWt6sdob6m
 m1u/d0ZwroF3Lk9ROJJipbnv3/PO+eVcUKaH9TkPHlMBYI0gQBg2gP2NxvGrXwpIOgHnEe+7hy
 DrRrXFpdHnswi3n3kiWCPEg7XveeMV8Je2zXQ+U9ONTT+wHOCx/zetofLEKV1+760yIK0Fy1Hk
 JsudpGnsjMr1uQ0yM1oa9ygNYT7wxKK1S/T7wqhpN2gIREf63INsHE1iJsC3Rw/WLpXksE2mQw
 1F4=
X-SBRS: 2.5
X-MesageID: 29429851
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="29429851"
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
 <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
 <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
 <1786f728-15c2-3877-c01a-035b11bd8504@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <82e64d10-50be-68ab-127b-99d205a0a768@citrix.com>
Date: Fri, 16 Oct 2020 16:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1786f728-15c2-3877-c01a-035b11bd8504@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 09:01, Jan Beulich wrote:
> On 14.10.2020 15:57, Andrew Cooper wrote:
>> On 13/10/2020 16:58, Jan Beulich wrote:
>>> On 09.10.2020 17:09, Andrew Cooper wrote:
>>>> At the time of XSA-170, the x86 instruction emulator really was broken, and
>>>> would allow arbitrary non-canonical values to be loaded into %rip.  This was
>>>> fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
>>>> targets".
>>>>
>>>> However, in a demonstration that off-by-one errors really are one of the
>>>> hardest programming issues we face, everyone involved with XSA-170, myself
>>>> included, mistook the statement in the SDM which says:
>>>>
>>>>   If the processor supports N < 64 linear-address bits, bits 63:N must be identical
>>>>
>>>> to mean "must be canonical".  A real canonical check is bits 63:N-1.
>>>>
>>>> VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
>>>> to the boundary condition at 0x0000800000000000.
>>>>
>>>> Now that the emulator has been fixed, revert the XSA-170 change to fix
>>>> architectural behaviour at the boundary case.  The XTF test case for XSA-170
>>>> exercises this corner case, and still passes.
>>>>
>>>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> But why revert the change rather than fix ...
>>>
>>>> @@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>>  out:
>>>>      if ( nestedhvm_vcpu_in_guestmode(v) )
>>>>          nvmx_idtv_handling();
>>>> -
>>>> -    /*
>>>> -     * VM entry will fail (causing the guest to get crashed) if rIP (and
>>>> -     * rFLAGS, but we don't have an issue there) doesn't meet certain
>>>> -     * criteria. As we must not allow less than fully privileged mode to have
>>>> -     * such an effect on the domain, we correct rIP in that case (accepting
>>>> -     * this not being architecturally correct behavior, as the injected #GP
>>>> -     * fault will then not see the correct [invalid] return address).
>>>> -     * And since we know the guest will crash, we crash it right away if it
>>>> -     * already is in most privileged mode.
>>>> -     */
>>>> -    mode = vmx_guest_x86_mode(v);
>>>> -    if ( mode == 8 ? !is_canonical_address(regs->rip)
>>> ... the wrong use of is_canonical_address() here? By reverting
>>> you open up avenues for XSAs in case we get things wrong elsewhere,
>>> including ...
>>>
>>>> -                   : regs->rip != regs->eip )
>>> ... for 32-bit guests.
>> Because the only appropriate alternative would be ASSERT_UNREACHABLE()
>> and domain crash.
>>
>> This logic corrupts guest state.
>>
>> Running with corrupt state is every bit an XSA as hitting a VMEntry
>> failure if it can be triggered by userspace, but the latter safer and
>> much more obvious.
> I disagree. For CPL > 0 we don't "corrupt" guest state any more
> than reporting a #GP fault when one is going to be reported
> anyway (as long as the VM entry doesn't fail, and hence the
> guest won't get crashed). IOW this raising of #GP actually is a
> precautionary measure to _avoid_ XSAs.

It does not remove any XSAs.  It merely hides them.

There are legal states where RIP is 0x0000800000000000 and #GP is the
wrong thing to do.  Any async VMExit (Processor Trace Prefetch in
particular), or with debug traps pending.

> Nor do I agree with the "much more obvious" aspect:

A domain crash is far more likely to be reported to xen-devel/security
than something which bodges state in an almost-silent way.

> A VM entry
> failure requires quite a bit of analysis to recognize what has
> caused it; whether a non-pseudo-canonical RIP is what catches your
> eye right away is simply unknown. The gprintk() that you delete,
> otoh, says very clearly what we have found to be wrong.

Non-canonical values are easier to spot than most of the other rules, IMO.

>> It was the appropriate security fix (give or take the functional bug in
>> it) at the time, given the complexity of retrofitting zero length
>> instruction fetches to the emulator.
>>
>> However, it is one of a very long list of guest-state-induced VMEntry
>> failures, with non-trivial logic which we assert will pass, on a
>> fastpath, where hardware also performs the same checks and we already
>> have a runtime safe way of dealing with errors.  (Hence not actually
>> using ASSERT_UNREACHABLE() here.)
> "Runtime safe" as far as Xen is concerned, I take it. This isn't safe
> for the guest at all, as vmx_failed_vmentry() results in an
> unconditional domain_crash().

Any VMEntry failure is a bug in Xen.  If userspace can trigger it, it is
an XSA, *irrespective* of whether we crash the domain then and there, or
whether we let it try and limp on with corrupted state.

The different is purely in how obviously the bug manifests.

> I certainly buy the fast path aspect of your comment, and if you were
> moving the guest state adjustment into vmx_failed_vmentry(), I'd be
> fine with the deletion here.
>
>> It isn't appropriate for this check to exist on its own (i.e. without
>> other guest state checks),
> Well, if we run into cases where we get things wrong, more checks
> and adjustments may want adding. Sadly each one of those has a fair
> chance of needing an XSA.

We've had plenty of VMEntry failure XSAs, and we will no doubt have
plenty more in the future.  A non-canonical RIP is not special as far as
these go.


We absolutely should not be doing any fixup in debug builds.  I don't
see any security benefit for doing it in release builds, and an
important downside in terms of getting the bug noticed, and therefore fixed.


> As an aside, nvmx_n2_vmexit_handler()'s handling of
> VMX_EXIT_REASONS_FAILED_VMENTRY looks pretty bogus - this is a flag,
> not a separate exit reason. I guess I'll make a patch ...

This is far from the only problem.  I'm not intending to fix any issues
I find, until I can start getting some proper nested virt functionality
tests in place.

~Andrew

