Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84529367A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 10:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8964.24132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUmiF-0008B1-KZ; Tue, 20 Oct 2020 08:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8964.24132; Tue, 20 Oct 2020 08:09:43 +0000
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
	id 1kUmiF-0008Ac-HY; Tue, 20 Oct 2020 08:09:43 +0000
Received: by outflank-mailman (input) for mailman id 8964;
 Tue, 20 Oct 2020 08:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUmiD-0008AW-Ki
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:09:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bcebfb7-c15e-4e9f-8460-b0d60cee3510;
 Tue, 20 Oct 2020 08:09:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8138B2B1;
 Tue, 20 Oct 2020 08:09:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUmiD-0008AW-Ki
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:09:41 +0000
X-Inumbo-ID: 4bcebfb7-c15e-4e9f-8460-b0d60cee3510
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4bcebfb7-c15e-4e9f-8460-b0d60cee3510;
	Tue, 20 Oct 2020 08:09:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603181379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlkD+PpM+3EgdR7gKys/vxIhMN4702yOowUMx0BeWDc=;
	b=jgfPuOKq5p+ruQZA2Qjbpn5/plOU4UHUQGd4GDJ5nS5wQier6T1Q1Qklcr8eZsvSzX83F9
	neRRiBBSohqZWVXOouF/zZG5bcXS0fQ+sQqa2uTtSxAYErkSeysdOR15SxCcFVV0w+rpGv
	YUn/ksiielHeM3kv6eR6xylPsc03Fnc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A8138B2B1;
	Tue, 20 Oct 2020 08:09:39 +0000 (UTC)
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
 <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
 <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
 <1786f728-15c2-3877-c01a-035b11bd8504@suse.com>
 <82e64d10-50be-68ab-127b-99d205a0a768@citrix.com>
 <6430fef8-23f1-f4ef-8741-5e089eaa0df9@suse.com>
 <8b618252-4535-a8d9-efb9-0c1fba176ff4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4eb096ab-7052-f6a9-a5ee-74d18683dde3@suse.com>
Date: Tue, 20 Oct 2020 10:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <8b618252-4535-a8d9-efb9-0c1fba176ff4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.10.2020 18:12, Andrew Cooper wrote:
> On 19/10/2020 10:09, Jan Beulich wrote:
>> On 16.10.2020 17:38, Andrew Cooper wrote:
>>> On 15/10/2020 09:01, Jan Beulich wrote:
>>>> On 14.10.2020 15:57, Andrew Cooper wrote:
>>>>> Running with corrupt state is every bit an XSA as hitting a VMEntry
>>>>> failure if it can be triggered by userspace, but the latter safer and
>>>>> much more obvious.
>>>> I disagree. For CPL > 0 we don't "corrupt" guest state any more
>>>> than reporting a #GP fault when one is going to be reported
>>>> anyway (as long as the VM entry doesn't fail, and hence the
>>>> guest won't get crashed). IOW this raising of #GP actually is a
>>>> precautionary measure to _avoid_ XSAs.
>>> It does not remove any XSAs.  It merely hides them.
>> How that? If we convert the ability of guest user mode to crash
>> the guest into deliver of #GP(0), how is there a hidden XSA then?
> 
> Because userspace being able to triggering this fixup is still an XSA.

How do you know without a specific case at hand? It may well be
that all that's impacted is guest user space, in which case I
don't see why there would need to be an XSA. It's still a bug
then, sure.

>>>>> It was the appropriate security fix (give or take the functional bug in
>>>>> it) at the time, given the complexity of retrofitting zero length
>>>>> instruction fetches to the emulator.
>>>>>
>>>>> However, it is one of a very long list of guest-state-induced VMEntry
>>>>> failures, with non-trivial logic which we assert will pass, on a
>>>>> fastpath, where hardware also performs the same checks and we already
>>>>> have a runtime safe way of dealing with errors.  (Hence not actually
>>>>> using ASSERT_UNREACHABLE() here.)
>>>> "Runtime safe" as far as Xen is concerned, I take it. This isn't safe
>>>> for the guest at all, as vmx_failed_vmentry() results in an
>>>> unconditional domain_crash().
>>> Any VMEntry failure is a bug in Xen.  If userspace can trigger it, it is
>>> an XSA, *irrespective* of whether we crash the domain then and there, or
>>> whether we let it try and limp on with corrupted state.
>> Allowing the guest to continue with corrupted state is not a
>> useful thing to do, I agree. However, what falls under
>> "corrupted" seems to be different for you and me. I'd not call
>> delivery of #GP "corruption" in any way.
> 
> I can only repeat my previous statement:
> 
>> There are legal states where RIP is 0x0000800000000000 and #GP is the
>> wrong thing to do.
> 
> Blindly raising #GP in is not always the right thing to do.

Again - we're in agreement about "blindly". Let's be less blind.

>>  The primary goal ought
>> to be that we don't corrupt the guest kernel view of the world.
>> It may then have the opportunity to kill the offending user
>> mode process.
> 
> By the time we have hit this case, all bets are off, because Xen *is*
> malfunctioning.  We have no idea if kernel context is still intact.  You
> don't even know that current user context is the correct offending
> context to clobber, and might be creating a user=>user DoS vulnerability.
> 
> We definitely have an XSA to find and fix, and we can either make it
> very obvious and likely to be reported, or hidden and liable to go
> unnoticed for a long period of time.

Why would it go unnoticed when we log the incident? I very much
hope people inspect their logs at least every once in a while ...

And as per above - I disagree with your use of "definitely" here.
We have a bug to analyze and fix, yes. Whether it's an XSA-worthy
one isn't known ahead of time, unless we crash the guest in such
a case.

In any event I think it's about time that the VMX maintainers
voice their views here, as they're the ones to approve of
whichever change we end up with. Kevin, Jun?

Jan

