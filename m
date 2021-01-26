Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29503038A5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74665.134183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KIH-0003jZ-Ol; Tue, 26 Jan 2021 09:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74665.134183; Tue, 26 Jan 2021 09:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KIH-0003jA-La; Tue, 26 Jan 2021 09:05:49 +0000
Received: by outflank-mailman (input) for mailman id 74665;
 Tue, 26 Jan 2021 09:05:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KIG-0003j5-Ry
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:05:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71ddebb8-8588-4943-84e9-b2ebc4c68f67;
 Tue, 26 Jan 2021 09:05:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28C21AC4F;
 Tue, 26 Jan 2021 09:05:47 +0000 (UTC)
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
X-Inumbo-ID: 71ddebb8-8588-4943-84e9-b2ebc4c68f67
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611651947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQbG2i0s6glfTvEwzk61lTurV0fPoGhE6eRPysHAcZQ=;
	b=Lkzb19jssbVHihrpsDfeMK45FUp5Vxcqq0+sWPc2CiKC8ptHRzcMn9Xg5ctBJfGsaE/Z3n
	71VfgUaJ1U3IlbwYn3dAWs/GhJtckNBFWnhWY+2cAZY1r7uPRxu6mnpCMnIG2ZOCdXen66
	3jxRGHVeHeSzctuNo+DeUMQXAHaCrk4=
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
 <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
 <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com> <YA8RCGy6Zj5rE2R8@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f16e5d7-41b5-1a11-c444-11aab52a8891@suse.com>
Date: Tue, 26 Jan 2021 10:05:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YA8RCGy6Zj5rE2R8@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 19:42, Boris Ostrovsky wrote:
> On 21-01-25 11:22:08, Jan Beulich wrote:
>> On 22.01.2021 20:52, Boris Ostrovsky wrote:
>>> On 1/22/21 7:51 AM, Jan Beulich wrote:
>>>> On 20.01.2021 23:49, Boris Ostrovsky wrote:
>>>>> +
>>>>> +    /*
>>>>> +     * Accesses to unimplemented MSRs as part of emulation of instructions
>>>>> +     * other than guest's RDMSR/WRMSR should never succeed.
>>>>> +     */
>>>>> +    if ( !is_guest_msr_access )
>>>>> +        ignore_msrs = MSR_UNHANDLED_NEVER;
>>>>
>>>> Wouldn't you better "return true" here? Such accesses also
>>>> shouldn't be logged imo (albeit I agree that's a change from
>>>> current behavior).
>>>
>>>
>>> Yes, that's why I didn't return here. We will be here in !is_guest_msr_access case most likely due to a bug in the emulator so I think we do want to see the error logged.
>>
>> Why "most likely"?
> 
> 
> OK, definitely ;-)

Oops - I was thinking the other way around, considering such
to possibly be legitimate. It just so happens that curently
we have no such path.

> But I still think logging these accesses would be helpful.

Because of the above I continue to question this.

>>>>> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
>>>>> +        *val = 0;
>>>>
>>>> I don't understand the conditional here, even more so with
>>>> the respective changelog entry. In any event you don't
>>>> want to clobber the value ahead of ...
>>>>
>>>>> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
>>>>> +    {
>>>>> +        if ( is_write )
>>>>> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
>>>>> +                    " unimplemented\n", msr, *val);
>>>>
>>>> ... logging it.
>>>
>>>
>>> True. I dropped !is_write from v1 without considering this.
>>>
>>> As far as the conditional --- dropping it too would be a behavior change. 
>>
>> Albeit an intentional one then? Plus I think I have trouble
>> seeing what behavior it would be that would change.
> 
> 
> Currently callers of, say, read_msr() don't expect the argument that they pass in to change. Granted, they shouldn't (and AFAICS don't) look at it but it's a change nonetheless.

Hmm, I'm confused: The purpose of read_msr() is to change the
value pointed at by the passed in argument. And for write_msr()
the users of the hook pass the argument by value, i.e. wouldn't
observe the changed value (it would only possibly be
intermediate layers which might observe the change, but those
ought to not care).

>>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>>>> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>>>>      ctxt->event = (struct x86_event){};
>>>>>  }
>>>>>  
>>>>> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
>>>>
>>>> The parameter wants to be pointer-to-const. In addition I wonder
>>>> whether this wouldn't better be a sibling to
>>>> x86_insn_is_cr_access() (without a "state" parameter, which
>>>> would be unused and unavailable to the callers), which may end
>>>> up finding further uses down the road.
>>>
>>>
>>> "Sibling" in terms of name (yes, it would be) or something else?
>>
>> Name and (possible) purpose - a validate hook could want to
>> make use of this, for example.
> 
> A validate hook? 

Quoting from struct x86_emulate_ops:

    /*
     * validate: Post-decode, pre-emulate hook to allow caller controlled
     * filtering.
     */
    int (*validate)(
        const struct x86_emulate_state *state,
        struct x86_emulate_ctxt *ctxt);

Granted to be directly usable the function would need to have a
"state" parameter. As that's unused, having it have one and
passing NULL in your case might be acceptable. But I also could
see arguments towards this not being a good idea.

>>>> I notice you use this function only from PV priv-op emulation.
>>>> What about the call paths through hvmemul_{read,write}_msr()?
>>>> (It's also questionable whether the write paths need this -
>>>> the only MSR written outside of WRMSR emulation is
>>>> MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
>>>> logic anywhere. But maybe better to be future proof here in
>>>> case new MSR writes appear in the emulator, down the road.)
>>>
>>>
>>> Won't we end up in hvm_funcs.msr_write_intercept ops which do call it?
>>
>> Of course we will - the boolean will very likely need
>> propagating (a possible alternative being a per-vCPU flag
>> indicating "in emulator").
> 
> 
> Oh, I see what you mean. By per-vcpu flag you mean arch_vcpu field I assume?

Yes, a boolean in one of the arch-specific per-vCPU structs.
Whether that's arch_vcpu or perhaps something HVM specific is
another question.

Jan

