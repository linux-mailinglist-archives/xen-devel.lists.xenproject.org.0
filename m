Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70132CEBB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 09:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93066.175662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHjeq-0002zM-1X; Thu, 04 Mar 2021 08:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93066.175662; Thu, 04 Mar 2021 08:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHjep-0002yx-UP; Thu, 04 Mar 2021 08:48:31 +0000
Received: by outflank-mailman (input) for mailman id 93066;
 Thu, 04 Mar 2021 08:48:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHjeo-0002yq-8q
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 08:48:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99a92e54-bc47-408f-bb67-230ec33923b8;
 Thu, 04 Mar 2021 08:48:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43F78ABE4;
 Thu,  4 Mar 2021 08:48:25 +0000 (UTC)
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
X-Inumbo-ID: 99a92e54-bc47-408f-bb67-230ec33923b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614847705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5CVSiSPtQOZFjLb8netFK9yShe88dLqRGOS/dUHIGo=;
	b=K4EHi8GFmgN/4tETTmCFgfSDmn7jMOpDI4yeGJw5OozUbI58EIdOSvdmJlivwCeJs1BDkr
	mrdEfKfS0TG3wtZ6e9LYPlkjvTTl/MN+TXeZ4LIH7hjLseH5jdNTeWAsaFxtObPEMyU24V
	KtcAIAmbg1VGA0j9yzzzaQP6c5500wY=
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
 <YD5TBSwZWzjlwGxD@Air-de-Roger>
 <62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
 <YD+teWWbeu0XDhqm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e84e84f6-8bc3-6a62-53f7-bf309fafa436@suse.com>
Date: Thu, 4 Mar 2021 09:48:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD+teWWbeu0XDhqm@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.03.2021 16:38, Roger Pau Monné wrote:
> On Tue, Mar 02, 2021 at 04:18:59PM +0100, Jan Beulich wrote:
>> On 02.03.2021 16:00, Roger Pau Monné wrote:
>>> On Tue, Mar 02, 2021 at 12:16:12PM +0100, Jan Beulich wrote:
>>>> On 01.03.2021 17:23, Roger Pau Monne wrote:
>>>>> RFC because there's still some debate as to how we should solve the
>>>>> MSR issue, this is one possible way, but IMO we need to make a
>>>>> decision soon-ish because of the release timeline.
>>>>
>>>> Generally I think it would be far better from a user pov if
>>>> things worked out of the box, at least in cases where it can be
>>>> made work. Arguably for Solaris this isn't going to be possible
>>>> (leaving aside the non-option of fully returning back to original
>>>> behavior), but for the old-Linux-PV case I still think my proposed
>>>> change is better in this regard. I realize Andrew said (on irc)
>>>> that this is making the behavior even weaker. I take a different
>>>> perspective: Considering a guest will install exception handlers
>>>> at some point, I continue to fail to see what good it will do to
>>>> try to inject a #GP(0) when we know the guest will die because of
>>>> not having a handler registered just yet. It is a kernel flaw,
>>>> yes, but they ended up living with it merely because of our odd
>>>> prior behavior, so we can't put all the blame on them.
>>>
>>> My concern with this would mostly be with newer guests, in the sense
>>> that people could come to rely on this behavior of not injecting a
>>> #GP if the handler is not setup, which I think we should try to avoid.
>>>
>>> One option would be to introduce a feature that could be used in the
>>> elfnotes to signal that the kernel doesn't require such workarounds
>>> for MSR #GP handling, maybe:
>>>
>>> /*
>>>  * Signal that the kernel doesn't require suppressing the #GP on
>>>  * unknown MSR accesses if the handler is not setup. New kernels
>>>  * should always have this set.
>>>  */
>>> #define XENFEAT_msr_early_gp   16
>>>
>>> We could try to backport this on the Linux kernel as far as we can
>>> that we know it's safe to do so.
>>
>> I too did consider something like this. While I'm not opposed, it
>> effectively requires well-behaved consumers who haven't been well-
>> behaved in the past.
>>
>>> If this is not acceptable then I guess your solution is fine. Arguably
>>> PV has it's own (weird) architecture, in which it might be safe to say
>>> that no #GP will be injected as a result of a MSR access unless the
>>> handler is setup. Ideally we should document this behaviour somewhere.
>>>
>>> Maybe we could add a rdmsr_safe to your path akin to what's done
>>> here?
>>
>> Probably. Would need trying out on the affected older version,
>> just like ...
>>
>>>>> --- a/docs/man/xl.cfg.5.pod.in
>>>>> +++ b/docs/man/xl.cfg.5.pod.in
>>>>> @@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
>>>>>  
>>>>>  =back
>>>>>  
>>>>> +=item B<msr_legacy_handling=BOOLEAN>
>>>>> +
>>>>> +Select whether to use the legacy behaviour for accesses to MSRs not explicitly
>>>>> +handled by Xen instead of injecting a #GP to the guest.  Such legacy access
>>>>> +mode will force Xen to replicate the behaviour from the hardware it's currently
>>>>> +running on in order to decide whether a #GP is injected to the guest.  Note
>>>>> +that the guest is never allowed access to unhandled MSRs, this option only
>>>>> +changes whether a #GP might be injected or not.
>>>>
>>>> This description is appropriate for reads, but not for writes:
>>>> Whether a write would fault can only be known by trying a write,
>>>> yet for safety reasons we can't risk doing more than a read. An
>>>> option might be to make writes fault is the to be written value
>>>> differs from that which the probing read has returned (i.e. the
>>>> same condition which originally had caused a log message to appear
>>>> in 4.14 for PV guests).
>>>
>>> Read values for unhandled MSRs will always be 0 with the proposed
>>> code, so we would inject a #GP to the guest for any write attempt to
>>> unhandled MSRs with a value different than 0.
>>>
>>> Maybe we should just inject a #GP to the guest for any attempts to
>>> write to unhandled MSRs?
>>
>> ... doing this would need to. Iirc I did add the write side of the
>> handling in my patch just for symmetry. I'd prefer handling to be
>> symmetric, but I can see why we may not want it to be so.
> 
> Kind of in the wrong context, but I will reply here because it's the
> last message related to the MSR stuff.
> 
> Jan: would you be fine with modifying your path to not change the
> behaviour for writes (ie: always inject #GP to the guest for unhandled
> accesses), and then add a rdmsr_safe to the read path in order to
> decide whether to inject a #GP to the guest even if the #GP handler is
> not setup?

I don't mind as long as it ends up making things work (I have no
reason to believe it won't). I'll give that a try.

> I can modify the option introduced on this patch to always inject #GP
> on unhandled writes and only inject #GP on reads if the physical MSR
> access on the hardware also triggers a #GP. HVM guests with broken
> behavior will require having the option enabled in order to work,
> but I think that's likely OK as long term we expect all HVM guests to
> be well behaved.
> 
> My main worry with this approach is that we end up requiring half of
> the common HVM guests OSes to have the 'legacy MSR handling' option
> enabled in order to work. I think it's unlikely for this to happen, as
> we are only aware of Solaris requiring it at the moment.
> 
> It also raises the question whether we will allow any more exceptions
> to the MSR policy, like we did for Windows and OpenBSD in:
> 
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=ca88a43e660c75796656a544e54a648c60d26ef0
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4175fd3ccd17face664036fa98e9329aa317f7b6
> 
> Or if we are just going to require those guests to enable the legacy
> MSR handling instead.

It is my understanding that Andrew's view is that adding such special
cases is the only acceptable thing. As voiced before I don't share
this view, as it means we're going to be entirely reactive to people
reporting issues, when I think we should be pro-active as far as is
reasonable. Independent of any pro-active measures there'll still be
enough reasons for reactive changes - for example I assume Linux
would now issue the log message from

	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {

		if (c->x86 > 0x10 ||
		    (c->x86 == 0x10 && c->x86_model >= 0x2)) {
			u64 val;

			rdmsrl(MSR_K7_HWCR, val);
			if (!(val & BIT(24)))
				pr_warn(FW_BUG "TSC doesn't count with P0 frequency!\n");
		}
	}

since we surface a zero value right now (but I didn't verify this in
practice yet).

Jan

