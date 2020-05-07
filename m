Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF881C962E
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 18:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWjB9-0001bU-HA; Thu, 07 May 2020 16:15:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWjB7-0001bP-L9
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 16:15:17 +0000
X-Inumbo-ID: efbf1174-907d-11ea-9f47-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efbf1174-907d-11ea-9f47-12813bfff9fa;
 Thu, 07 May 2020 16:15:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 082CFABCE;
 Thu,  7 May 2020 16:15:17 +0000 (UTC)
Subject: Re: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-16-andrew.cooper3@citrix.com>
 <2df78612-2c24-32de-186a-c402e188478c@suse.com>
 <70d7b0e0-a599-6a19-5ace-af4f169545b3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa78f626-18a1-bd95-b446-8ade5e9282a6@suse.com>
Date: Thu, 7 May 2020 18:15:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <70d7b0e0-a599-6a19-5ace-af4f169545b3@citrix.com>
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

On 07.05.2020 17:50, Andrew Cooper wrote:
> On 07/05/2020 15:12, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/x86_64/compat/entry.S
>>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>>> @@ -198,7 +198,7 @@ ENTRY(cr4_pv32_restore)
>>>  
>>>  /* See lstar_enter for entry register state. */
>>>  ENTRY(cstar_enter)
>>> -        /* sti could live here when we don't switch page tables below. */
>>> +        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
>> I don't see why you delete the comment here (or elsewhere). While
>> I recall you not really wanting them there, I still think they're
>> useful to have, and they shouldn't be deleted as a side effect of
>> an entirely unrelated change. Of course they need to live after
>> your insertions then.
> 
> Do you not remember Juergen performance testing results concerning this
> comment?  The results were provably worse.
> 
> It is a useless comment.  Sure, its technically accurate, but so are an
> arbitrarily large number of other comments about how we could permute
> the code.
> 
> It has already been concluded that we won't be making the suggested
> change.  Having a /* TODO - doing X will make the system slower */ isn't
> something we should have adding to the complexity of the code, and
> tricking people into thinking that something should be done.

A separate patch is still the way to go then, with reference to
the claimed performance testing results.

>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -194,6 +194,15 @@ restore_all_guest:
>>>          movq  8(%rsp),%rcx            # RIP
>>>          ja    iret_exit_to_guest
>>>  
>>> +        /* Clear the supervisor shadow stack token busy bit. */
>>> +.macro rag_clrssbsy
>>> +        push %rax
>>> +        rdsspq %rax
>>> +        clrssbsy (%rax)
>>> +        pop %rax
>>> +.endm
>>> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>> In principle you could get away without spilling %rax:
>>
>>         cmpl  $1,%ecx
>>         ja    iret_exit_to_guest
>>
>>         /* Clear the supervisor shadow stack token busy bit. */
>> .macro rag_clrssbsy
>>         rdsspq %rcx
>>         clrssbsy (%rcx)
>> .endm
>>         ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>>         movq  8(%rsp),%rcx            # RIP
>>         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
>>         movq  32(%rsp),%rsp           # RSP
>>         je    1f
>>         sysretq
>> 1:      sysretl
>>
>>         ALIGN
>> /* No special register assumptions. */
>> iret_exit_to_guest:
>>         movq  8(%rsp),%rcx            # RIP
>>         andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
>>         ...
>>
>> Also - what about CLRSSBSY failing? It would seem easier to diagnose
>> this right here than when getting presumably #DF upon next entry into
>> Xen. At the very least I think it deserves a comment if an error case
>> does not get handled.
> 
> I did consider this, but ultimately decided against it.
> 
> You can't have an unlikely block inside a alternative block because the
> jmp's displacement doesn't get fixed up.

We do fix up unconditional JMP/CALL displacements; I don't
see why we couldn't also do so for conditional ones.

>  Keeping everything inline puts
> an incorrect statically-predicted branch in program flow.
> 
> Most importantly however, is that the SYSRET path is vastly less common
> than the IRET path.  There is no easy way to proactively spot problems
> in the IRET path, which means that conditions leading to a problem are
> already far more likely to manifest as #DF, so there is very little
> value in adding complexity to the SYSRET path in the first place.

The SYSRET path being uncommon is a problem by itself imo, if
that's indeed the case. I'm sure I've suggested before that
we convert frames to TRAP_syscall ones whenever possible,
such that we wouldn't go the slower IRET path.

>> Somewhat similar for SETSSBSY, except there things get complicated by
>> it raising #CP instead of setting EFLAGS.CF: Aiui it would require us
>> to handle #CP on an IST stack in order to avoid #DF there.
> 
> Right, but having #CP as IST gives us far worse problems.
> 
> Being able to spot #CP vs #DF doesn't help usefully.  Its still some
> arbitrary period of time after the damage was done.
> 
> Any nesting of #CP (including fault on IRET out) results in losing
> program state and entering an infinite loop.
> 
> The cases which end up as #DF are properly fatal to the system, and we
> at least get a clean crash out it.

May I suggest that all of this gets spelled out in at least
the description of the patch, so that it can be properly
understood (and, if need be, revisited) later on?

Jan

