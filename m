Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C931DAE1A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 10:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKWa-0001zO-UT; Wed, 20 May 2020 08:56:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbKWZ-0001zJ-UH
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 08:56:27 +0000
X-Inumbo-ID: c9db357c-9a77-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9db357c-9a77-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 08:56:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDCF1AF2D;
 Wed, 20 May 2020 08:56:28 +0000 (UTC)
Subject: Re: [PATCH] x86: refine guest_mode()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
 <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
 <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
 <5ce12c86-c894-4a2c-9fa6-1c2a6007ca28@suse.com>
 <20200518145101.GV54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d58ec87e-a871-2e65-4a69-b73a168a6afa@suse.com>
Date: Wed, 20 May 2020 10:56:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518145101.GV54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.2020 16:51, Roger Pau Monné wrote:
> On Tue, Apr 28, 2020 at 08:30:12AM +0200, Jan Beulich wrote:
>> On 27.04.2020 22:11, Andrew Cooper wrote:
>>> On 27/04/2020 16:15, Jan Beulich wrote:
>>>> On 27.04.2020 16:35, Andrew Cooper wrote:
>>>>> On 27/04/2020 09:03, Jan Beulich wrote:
>>>>>> --- a/xen/include/asm-x86/regs.h
>>>>>> +++ b/xen/include/asm-x86/regs.h
>>>>>> @@ -10,9 +10,10 @@
>>>>>>      /* Frame pointer must point into current CPU stack. */                    \
>>>>>>      ASSERT(diff < STACK_SIZE);                                                \
>>>>>>      /* If not a guest frame, it must be a hypervisor frame. */                \
>>>>>> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
>>>>>> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
>>>>>> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
>>>>>>      /* Return TRUE if it's a guest frame. */                                  \
>>>>>> -    (diff == 0);                                                              \
>>>>>> +    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
>>>>> The (diff == 0) already worried me before because it doesn't fail safe,
>>>>> but this makes things more problematic.  Consider the case back when we
>>>>> had __HYPERVISOR_CS32.
>>>> Yes - if __HYPERVISOR_CS32 would ever have been to be used for
>>>> anything, it would have needed checking for here.
>>>>
>>>>> Guest mode is strictly "(r)->cs & 3".
>>>> As long as CS (a) gets properly saved (it's a "manual" step for
>>>> SYSCALL/SYSRET as well as #VMEXIT) and (b) didn't get clobbered. I
>>>> didn't write this code, I don't think, so I can only guess that
>>>> there were intentions behind this along these lines.
>>>
>>> Hmm - the VMExit case might be problematic here, due to the variability
>>> in the poison used.
>>
>> "Variability" is an understatement - there's no poisoning at all
>> in release builds afaics (and to be honest it seems a somewhat
>> pointless to write the same values over and over again in debug
>> mode). With this, ...
>>
>>>>> Everything else is expectations about how things ought to be laid out,
>>>>> but for safety in release builds, the final judgement should not depend
>>>>> on the expectations evaluating true.
>>>> Well, I can switch to a purely CS.RPL based approach, as long as
>>>> we're happy to live with the possible downside mentioned above.
>>>> Of course this would then end up being a more intrusive change
>>>> than originally intended ...
>>>
>>> I'd certainly prefer to go for something which is more robust, even if
>>> it is a larger change.
>>
>> ... what's your suggestion? Basing on _just_ CS.RPL obviously won't
>> work. Not even if we put in place the guest's CS (albeit that
>> somewhat depends on the meaning we assign to the macro's returned
>> value).
> 
> Just to check I'm following this correctly, using CS.RPL won't work
> for HVM guests, as HVM can legitimately use a RPL of 0 (which is not
> the case for PV guests). Doesn't the same apply to the usage of
> __HYPERVISOR_CS? (A HVM guest could also use the same code segment
> value as Xen?)

Of course (and in particular Xen as a guest would). My "Basing on
_just_ CS.RPL" wasn't meant to exclude the rest of the selector,
but to contrast this to the case where "diff" also is involved in
the calculation (which looks to be what Andrew would prefer to see
go away).

>> Using current inside the macro to determine whether the
>> guest is HVM would also seem fragile to me - there are quite a few
>> uses of guest_mode(). Which would leave passing in a const struct
>> vcpu * (or domain *), requiring to touch all call sites, including
>> Arm's.
> 
> Fragile or slow? Are there corner cases where guest_mode is used where
> current is not reliable?

This question is why I said "there are quite a few uses of
guest_mode()" - auditing them all is just one side of the medal.
The other is to prevent a new use appearing in the future that
can be reached by a call path in the time window where a lazy
context switch is pending (i.e. when current has already been
updated, but register state hasn't been yet).

>> Compared to this it would seem to me that the change as presented
>> is a clear improvement without becoming overly large of a change.
> 
> Using the cs register is already part of the guest_mode code, even if
> just in debug mode, hence I don't see it as a regression from existing
> code. It however feels weird to me that the reporter of the issue
> doesn't agree with the fix, and hence would like to know if there's a
> way we could achieve consensus on this.

Indeed. I'd be happy to make further adjustments, if only I had a
clear understanding of what is wanted (or why leaving things as
they are is better than a little bit of an improvement).

Jan

