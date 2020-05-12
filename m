Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E31CF80E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWKU-00049n-IF; Tue, 12 May 2020 14:56:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYWKS-00049i-Eh
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:56:20 +0000
X-Inumbo-ID: bbdf7843-9460-11ea-a2c2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbdf7843-9460-11ea-a2c2-12813bfff9fa;
 Tue, 12 May 2020 14:56:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02876AC58;
 Tue, 12 May 2020 14:56:19 +0000 (UTC)
Subject: Re: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-16-andrew.cooper3@citrix.com>
 <2df78612-2c24-32de-186a-c402e188478c@suse.com>
 <70d7b0e0-a599-6a19-5ace-af4f169545b3@citrix.com>
 <fa78f626-18a1-bd95-b446-8ade5e9282a6@suse.com>
 <b2afaa93-c738-dcfd-cbc7-147e48cd24ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a99236c-4f7b-7cf0-a4a8-f505ef64356d@suse.com>
Date: Tue, 12 May 2020 16:56:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b2afaa93-c738-dcfd-cbc7-147e48cd24ee@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 23:45, Andrew Cooper wrote:
> On 07/05/2020 17:15, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>>> @@ -194,6 +194,15 @@ restore_all_guest:
>>>>>          movq  8(%rsp),%rcx            # RIP
>>>>>          ja    iret_exit_to_guest
>>>>>  
>>>>> +        /* Clear the supervisor shadow stack token busy bit. */
>>>>> +.macro rag_clrssbsy
>>>>> +        push %rax
>>>>> +        rdsspq %rax
>>>>> +        clrssbsy (%rax)
>>>>> +        pop %rax
>>>>> +.endm
>>>>> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>>>> In principle you could get away without spilling %rax:
>>>>
>>>>         cmpl  $1,%ecx
>>>>         ja    iret_exit_to_guest
>>>>
>>>>         /* Clear the supervisor shadow stack token busy bit. */
>>>> .macro rag_clrssbsy
>>>>         rdsspq %rcx
>>>>         clrssbsy (%rcx)
>>>> .endm
>>>>         ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>>>>         movq  8(%rsp),%rcx            # RIP
>>>>         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
>>>>         movq  32(%rsp),%rsp           # RSP
>>>>         je    1f
>>>>         sysretq
>>>> 1:      sysretl
>>>>
>>>>         ALIGN
>>>> /* No special register assumptions. */
>>>> iret_exit_to_guest:
>>>>         movq  8(%rsp),%rcx            # RIP
>>>>         andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
>>>>         ...
>>>>
>>>> Also - what about CLRSSBSY failing? It would seem easier to diagnose
>>>> this right here than when getting presumably #DF upon next entry into
>>>> Xen. At the very least I think it deserves a comment if an error case
>>>> does not get handled.
>>> I did consider this, but ultimately decided against it.
>>>
>>> You can't have an unlikely block inside a alternative block because the
>>> jmp's displacement doesn't get fixed up.
>> We do fix up unconditional JMP/CALL displacements; I don't
>> see why we couldn't also do so for conditional ones.
> 
> Only for the first instruction in the block.
> 
> We do not decode the entire block of instructions and fix up each
> displacement.

Right, but that's not overly difficult to overcome - simply split
the ALTERNATIVE in two.

>>>   Keeping everything inline puts
>>> an incorrect statically-predicted branch in program flow.
>>>
>>> Most importantly however, is that the SYSRET path is vastly less common
>>> than the IRET path.  There is no easy way to proactively spot problems
>>> in the IRET path, which means that conditions leading to a problem are
>>> already far more likely to manifest as #DF, so there is very little
>>> value in adding complexity to the SYSRET path in the first place.
>> The SYSRET path being uncommon is a problem by itself imo, if
>> that's indeed the case. I'm sure I've suggested before that
>> we convert frames to TRAP_syscall ones whenever possible,
>> such that we wouldn't go the slower IRET path.
> 
> It is not possible to convert any.
> 
> The opportunistic SYSRET logic in Linux loses you performance in
> reality.  Its just that the extra conditionals are very highly predicted
> and totally dominated by the ring transition cost.
> 
> You can create a synthetic test case where the opportunistic logic makes
> a performance win, but the chances of encountering real world code where
> TRAP_syscall is clear and %r11 and %rcx match flags/rip is 2 ^ 128.
> 
> It is very much not worth the extra code and cycles taken to implement.

Oops, yes, for a moment I forgot this minor detail of %rcx/%r11.

>>>> Somewhat similar for SETSSBSY, except there things get complicated by
>>>> it raising #CP instead of setting EFLAGS.CF: Aiui it would require us
>>>> to handle #CP on an IST stack in order to avoid #DF there.
>>> Right, but having #CP as IST gives us far worse problems.
>>>
>>> Being able to spot #CP vs #DF doesn't help usefully.  Its still some
>>> arbitrary period of time after the damage was done.
>>>
>>> Any nesting of #CP (including fault on IRET out) results in losing
>>> program state and entering an infinite loop.
>>>
>>> The cases which end up as #DF are properly fatal to the system, and we
>>> at least get a clean crash out it.
>> May I suggest that all of this gets spelled out in at least
>> the description of the patch, so that it can be properly
>> understood (and, if need be, revisited) later on?
> 
> Is this really the right patch to do that?
> 
> I do eventually plan to put a whole load of this kinds of details into
> the hypervisor guide.

Well, as you can see having some of these considerations and
decisions spelled out would already have helped review here.
Whether this is exactly the right patch I'm not sure, but I'd
find it quite helpful if such was available at least for
cross referencing.

Jan

