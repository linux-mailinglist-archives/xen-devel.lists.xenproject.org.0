Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14028E1C3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 15:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6755.17770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kShHQ-0006WJ-TX; Wed, 14 Oct 2020 13:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6755.17770; Wed, 14 Oct 2020 13:57:24 +0000
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
	id 1kShHQ-0006Vy-QG; Wed, 14 Oct 2020 13:57:24 +0000
Received: by outflank-mailman (input) for mailman id 6755;
 Wed, 14 Oct 2020 13:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kShHO-0006Vt-Uy
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 13:57:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b40573-b13e-4974-87ae-0555cc73369a;
 Wed, 14 Oct 2020 13:57:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kShHO-0006Vt-Uy
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 13:57:23 +0000
X-Inumbo-ID: e3b40573-b13e-4974-87ae-0555cc73369a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e3b40573-b13e-4974-87ae-0555cc73369a;
	Wed, 14 Oct 2020 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602683841;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=JJyQ7tUp+FCSQm7uoVm5LWpXqpz9Gw0sQv0caoKYOBI=;
  b=b0z3NeRE6vzNo3FaArBvdzmsjIywBJ1+VBMS4IB0TmMqDqx2D6R38LyF
   kft1hDX2ImevcBUPqTLDdvL+ntNu4oPgkBg1CXsoITDP9fOQMwitn3htr
   SSHDOCQ9iCnC2W+dMQLV0l5haj1sUnSZyDxFJYilSxc3gP+TVxq2orAMO
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hbvgQmFay1opfKYEpyyup9fMjxU35xHRqW4Qt5PkxPJphQD1TdJtu48Wl6TB3wRbc+yCQRfD7T
 vwAY/m9clL5Nf6Ug0MB4vkzjkiMrEtFHo3IyKgwl9xONa0FsVRiZrYTiLkQX57ZQ+C3FAoaJKr
 Frblsf46cToQ0FJrHuFJSI9C9ls3Nqi03VUKu2IYUQFpfcGvXMJV4sxCC0lsmHY6rP5ZDmZxVg
 kxxWIS3a0es9rYT2hbpEeBuMPgpNyDVrkDunK5MF2e3ZZaaCaRWuxUxynUHTQfV+eSIPnr18lA
 qB8=
X-SBRS: 2.5
X-MesageID: 29236849
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29236849"
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
 <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
Date: Wed, 14 Oct 2020 14:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 13/10/2020 16:58, Jan Beulich wrote:
> On 09.10.2020 17:09, Andrew Cooper wrote:
>> At the time of XSA-170, the x86 instruction emulator really was broken, and
>> would allow arbitrary non-canonical values to be loaded into %rip.  This was
>> fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
>> targets".
>>
>> However, in a demonstration that off-by-one errors really are one of the
>> hardest programming issues we face, everyone involved with XSA-170, myself
>> included, mistook the statement in the SDM which says:
>>
>>   If the processor supports N < 64 linear-address bits, bits 63:N must be identical
>>
>> to mean "must be canonical".  A real canonical check is bits 63:N-1.
>>
>> VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
>> to the boundary condition at 0x0000800000000000.
>>
>> Now that the emulator has been fixed, revert the XSA-170 change to fix
>> architectural behaviour at the boundary case.  The XTF test case for XSA-170
>> exercises this corner case, and still passes.
>>
>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> But why revert the change rather than fix ...
>
>> @@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>  out:
>>      if ( nestedhvm_vcpu_in_guestmode(v) )
>>          nvmx_idtv_handling();
>> -
>> -    /*
>> -     * VM entry will fail (causing the guest to get crashed) if rIP (and
>> -     * rFLAGS, but we don't have an issue there) doesn't meet certain
>> -     * criteria. As we must not allow less than fully privileged mode to have
>> -     * such an effect on the domain, we correct rIP in that case (accepting
>> -     * this not being architecturally correct behavior, as the injected #GP
>> -     * fault will then not see the correct [invalid] return address).
>> -     * And since we know the guest will crash, we crash it right away if it
>> -     * already is in most privileged mode.
>> -     */
>> -    mode = vmx_guest_x86_mode(v);
>> -    if ( mode == 8 ? !is_canonical_address(regs->rip)
> ... the wrong use of is_canonical_address() here? By reverting
> you open up avenues for XSAs in case we get things wrong elsewhere,
> including ...
>
>> -                   : regs->rip != regs->eip )
> ... for 32-bit guests.

Because the only appropriate alternative would be ASSERT_UNREACHABLE()
and domain crash.

This logic corrupts guest state.

Running with corrupt state is every bit an XSA as hitting a VMEntry
failure if it can be triggered by userspace, but the latter safer and
much more obvious.

It was the appropriate security fix (give or take the functional bug in
it) at the time, given the complexity of retrofitting zero length
instruction fetches to the emulator.

However, it is one of a very long list of guest-state-induced VMEntry
failures, with non-trivial logic which we assert will pass, on a
fastpath, where hardware also performs the same checks and we already
have a runtime safe way of dealing with errors.  (Hence not actually
using ASSERT_UNREACHABLE() here.)

It isn't appropriate for this check to exist on its own (i.e. without
other guest state checks), and it isn't appropriate to live in a
fastpath.  In principle, some logic like this could live on the vmentry
failure path to try a second time, but then you're still creating an XSA
situation which is less obvious, and therefore isn't a clever move IMO.

~Andrew

