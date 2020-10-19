Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E13292B46
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 18:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8773.23578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUXmx-0005BU-6S; Mon, 19 Oct 2020 16:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8773.23578; Mon, 19 Oct 2020 16:13:35 +0000
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
	id 1kUXmx-0005B5-2Z; Mon, 19 Oct 2020 16:13:35 +0000
Received: by outflank-mailman (input) for mailman id 8773;
 Mon, 19 Oct 2020 16:13:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUXmv-0005B0-3N
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 16:13:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0547481b-1c9d-4318-8fd8-2b9ec8910443;
 Mon, 19 Oct 2020 16:13:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUXmv-0005B0-3N
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 16:13:33 +0000
X-Inumbo-ID: 0547481b-1c9d-4318-8fd8-2b9ec8910443
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0547481b-1c9d-4318-8fd8-2b9ec8910443;
	Mon, 19 Oct 2020 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603124011;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XhaqLBrbFS3MUcwH6e0X4EW+qzzLQQducc+2zEuq/Aw=;
  b=WgU/uuwtmOBF6pcoGypjO4VfaJrwWPZG7uevdqIy686FT/93Yjpp7jog
   L3E6IuxWjGqZlQkTPSSSD2pzbG004YtYnKhqwOo9D8tkmr9GEfhNyWyXr
   jVjqtP8NIBPhlW9QIiw4RX11qM2InE/ZLPwyT53Fli+1N0tayhcskhu/I
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kTVhxl+dGOPb+HXnJ4yqb4Ch19FveEYE2poqENH3DEZCnk09vUVHfOChSHEwq6pQrs1dgHOIty
 J1k46BZkHB87eVJmc+Yl9sC6/gh5dTmDtvSxtqPhJ97I2fE1IEBe5kmD8xj6QSVuolRl6UVsMh
 gzf/uL8cw6o5KKF+3fP+ftRwIYDrDcs+CBPsbqNqeLLaIDN7GMgdO3SBHvjmRTwNsWFXbBflWd
 ySqYC9aaQ4S2UVUQ46irB4SOkqWwy61JJewWJzrphsHCnNEgXIS+ldUX7MMrvH8IZfo02dIyMk
 JIs=
X-SBRS: None
X-MesageID: 29319364
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29319364"
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
 <82e64d10-50be-68ab-127b-99d205a0a768@citrix.com>
 <6430fef8-23f1-f4ef-8741-5e089eaa0df9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8b618252-4535-a8d9-efb9-0c1fba176ff4@citrix.com>
Date: Mon, 19 Oct 2020 17:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6430fef8-23f1-f4ef-8741-5e089eaa0df9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 19/10/2020 10:09, Jan Beulich wrote:
> On 16.10.2020 17:38, Andrew Cooper wrote:
>> On 15/10/2020 09:01, Jan Beulich wrote:
>>> On 14.10.2020 15:57, Andrew Cooper wrote:
>>>> On 13/10/2020 16:58, Jan Beulich wrote:
>>>>> On 09.10.2020 17:09, Andrew Cooper wrote:
>>>>>> At the time of XSA-170, the x86 instruction emulator really was broken, and
>>>>>> would allow arbitrary non-canonical values to be loaded into %rip.  This was
>>>>>> fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
>>>>>> targets".
>>>>>>
>>>>>> However, in a demonstration that off-by-one errors really are one of the
>>>>>> hardest programming issues we face, everyone involved with XSA-170, myself
>>>>>> included, mistook the statement in the SDM which says:
>>>>>>
>>>>>>   If the processor supports N < 64 linear-address bits, bits 63:N must be identical
>>>>>>
>>>>>> to mean "must be canonical".  A real canonical check is bits 63:N-1.
>>>>>>
>>>>>> VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
>>>>>> to the boundary condition at 0x0000800000000000.
>>>>>>
>>>>>> Now that the emulator has been fixed, revert the XSA-170 change to fix
>>>>>> architectural behaviour at the boundary case.  The XTF test case for XSA-170
>>>>>> exercises this corner case, and still passes.
>>>>>>
>>>>>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> But why revert the change rather than fix ...
>>>>>
>>>>>> @@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>>>>  out:
>>>>>>      if ( nestedhvm_vcpu_in_guestmode(v) )
>>>>>>          nvmx_idtv_handling();
>>>>>> -
>>>>>> -    /*
>>>>>> -     * VM entry will fail (causing the guest to get crashed) if rIP (and
>>>>>> -     * rFLAGS, but we don't have an issue there) doesn't meet certain
>>>>>> -     * criteria. As we must not allow less than fully privileged mode to have
>>>>>> -     * such an effect on the domain, we correct rIP in that case (accepting
>>>>>> -     * this not being architecturally correct behavior, as the injected #GP
>>>>>> -     * fault will then not see the correct [invalid] return address).
>>>>>> -     * And since we know the guest will crash, we crash it right away if it
>>>>>> -     * already is in most privileged mode.
>>>>>> -     */
>>>>>> -    mode = vmx_guest_x86_mode(v);
>>>>>> -    if ( mode == 8 ? !is_canonical_address(regs->rip)
>>>>> ... the wrong use of is_canonical_address() here? By reverting
>>>>> you open up avenues for XSAs in case we get things wrong elsewhere,
>>>>> including ...
>>>>>
>>>>>> -                   : regs->rip != regs->eip )
>>>>> ... for 32-bit guests.
>>>> Because the only appropriate alternative would be ASSERT_UNREACHABLE()
>>>> and domain crash.
>>>>
>>>> This logic corrupts guest state.
>>>>
>>>> Running with corrupt state is every bit an XSA as hitting a VMEntry
>>>> failure if it can be triggered by userspace, but the latter safer and
>>>> much more obvious.
>>> I disagree. For CPL > 0 we don't "corrupt" guest state any more
>>> than reporting a #GP fault when one is going to be reported
>>> anyway (as long as the VM entry doesn't fail, and hence the
>>> guest won't get crashed). IOW this raising of #GP actually is a
>>> precautionary measure to _avoid_ XSAs.
>> It does not remove any XSAs.  It merely hides them.
> How that? If we convert the ability of guest user mode to crash
> the guest into deliver of #GP(0), how is there a hidden XSA then?

Because userspace being able to triggering this fixup is still an XSA.

>> There are legal states where RIP is 0x0000800000000000 and #GP is the
>> wrong thing to do.  Any async VMExit (Processor Trace Prefetch in
>> particular), or with debug traps pending.
> You realize we're in agreement about this pseudo-canonical check
> needing fixing?

Anything other than deleting this clause does not fix the bugs above.

>>>> It was the appropriate security fix (give or take the functional bug in
>>>> it) at the time, given the complexity of retrofitting zero length
>>>> instruction fetches to the emulator.
>>>>
>>>> However, it is one of a very long list of guest-state-induced VMEntry
>>>> failures, with non-trivial logic which we assert will pass, on a
>>>> fastpath, where hardware also performs the same checks and we already
>>>> have a runtime safe way of dealing with errors.  (Hence not actually
>>>> using ASSERT_UNREACHABLE() here.)
>>> "Runtime safe" as far as Xen is concerned, I take it. This isn't safe
>>> for the guest at all, as vmx_failed_vmentry() results in an
>>> unconditional domain_crash().
>> Any VMEntry failure is a bug in Xen.  If userspace can trigger it, it is
>> an XSA, *irrespective* of whether we crash the domain then and there, or
>> whether we let it try and limp on with corrupted state.
> Allowing the guest to continue with corrupted state is not a
> useful thing to do, I agree. However, what falls under
> "corrupted" seems to be different for you and me. I'd not call
> delivery of #GP "corruption" in any way.

I can only repeat my previous statement:

> There are legal states where RIP is 0x0000800000000000 and #GP is the
> wrong thing to do.

Blindly raising #GP in is not always the right thing to do.

>  The primary goal ought
> to be that we don't corrupt the guest kernel view of the world.
> It may then have the opportunity to kill the offending user
> mode process.

By the time we have hit this case, all bets are off, because Xen *is*
malfunctioning.  We have no idea if kernel context is still intact.  You
don't even know that current user context is the correct offending
context to clobber, and might be creating a user=>user DoS vulnerability.

We definitely have an XSA to find and fix, and we can either make it
very obvious and likely to be reported, or hidden and liable to go
unnoticed for a long period of time.

Every rational argument is on the side of killing the domain in an
obvious way.

~Andrew

