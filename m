Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530941D0BED
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 11:23:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYnb6-0000NR-R7; Wed, 13 May 2020 09:22:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYnb6-0000NM-0g
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 09:22:40 +0000
X-Inumbo-ID: 49f142b0-94fb-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49f142b0-94fb-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 09:22:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3C01AE35;
 Wed, 13 May 2020 09:22:40 +0000 (UTC)
Subject: Re: [PATCH 12/16] x86/extable: Adjust extable handling to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-13-andrew.cooper3@citrix.com>
 <1e80c672-9308-f7ad-67ea-69d83d69bc03@suse.com>
 <974f631e-3a82-3da4-124d-f4bf2bef89e2@citrix.com>
 <59fcdaf0-f877-7a90-9bf4-9e41b1bbcea7@suse.com>
 <876b7c21-8354-8461-12b2-baf19b0426de@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c59aafd-77ab-5c89-9c09-1a657e16ed0b@suse.com>
Date: Wed, 13 May 2020 11:22:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <876b7c21-8354-8461-12b2-baf19b0426de@citrix.com>
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

On 12.05.2020 18:14, Andrew Cooper wrote:
> On 12/05/2020 15:31, Jan Beulich wrote:
>> On 11.05.2020 23:09, Andrew Cooper wrote:
>>> On 07/05/2020 14:35, Jan Beulich wrote:
>>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/traps.c
>>>>> +++ b/xen/arch/x86/traps.c
>>>>> @@ -778,6 +778,28 @@ static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>>>>                 vec_name(regs->entry_vector), regs->error_code,
>>>>>                 _p(regs->rip), _p(regs->rip), _p(fixup));
>>>>>  
>>>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>>>>> +    {
>>>>> +        unsigned long ssp;
>>>>> +
>>>>> +        asm ("rdsspq %0" : "=r" (ssp) : "0" (1) );
>>>>> +        if ( ssp != 1 )
>>>>> +        {
>>>>> +            unsigned long *ptr = _p(ssp);
>>>>> +
>>>>> +            /* Search for %rip in the shadow stack, ... */
>>>>> +            while ( *ptr != regs->rip )
>>>>> +                ptr++;
>>>> Wouldn't it be better to bound the loop, as it shouldn't search past
>>>> (strictly speaking not even to) the next page boundary? Also you
>>>> don't care about the top of the stack (being the to be restored SSP),
>>>> do you? I.e. maybe
>>>>
>>>>             while ( *++ptr != regs->rip )
>>>>                 ;
>>>>
>>>> ?
>>>>
>>>> And then - isn't searching for a specific RIP value alone prone to
>>>> error, in case a it matches an ordinary return address? I.e.
>>>> wouldn't you better search for a matching RIP accompanied by a
>>>> suitable pointer into the shadow stack and a matching CS value?
>>>> Otherwise, ...
>>>>
>>>>> +            ASSERT(ptr[1] == __HYPERVISOR_CS);
>>>> ... also assert that ptr[-1] points into the shadow stack?
>>> So this is the problem I was talking about that the previous contexts
>>> SSP isn't stored anywhere helpful.
>>>
>>> What we are in practice doing is looking 2 or 3 words up the shadow
>>> stack (depending on exactly how deep our call graph is), to the shadow
>>> IRET frame matching the real IRET frame which regs is pointing to.
>>>
>>> Both IRET frames were pushed in the process of generating the exception,
>>> and we've already matched regs->rip to the exception table record.  We
>>> need to fix up regs->rip and the shadow lip to the fixup address.
>>>
>>> As we are always fixing up an exception generated from Xen context, we
>>> know that ptr[1] == __HYPERVISOR_CS, and *ptr[-1] = &ptr[2], as we
>>> haven't switched shadow stack as part of taking this exception. 
>>> However, this second point is fragile to exception handlers moving onto IST.
>>>
>>> We can't encounter regs->rip in the shadow stack between the current SSP
>>> and the IRET frame we're looking to fix up, or we would have taken a
>>> recursive fault and not reached exception_fixup() to begin with.
>> I'm afraid I don't follow here. Consider a function (also)
>> involved in exception handling having this code sequence:
>>
>>     call    func
>>     mov     (%rax), %eax
>>
>> If the fault we're handling occured on the MOV and
>> exception_fixup() is a descendant of func(), then the first
>> instance of an address on the shadow stack pointing at this
>> MOV is going to be the one which did not fault.
> 
> No.  The moment `call func` returns, the address you're looking to match
> is rubble no longer on the stack.  Numerically, it will be located at
> SSP-8 when the fault for MOV is generated.

I think I still didn't explain the scenario sufficiently well:

In some function, say test(), we have above code sequence and
the MOV faults. The exception handling then goes
- assembly entry
- C entry
- test()
- exception_fixup()
in order of (nesting) call sequence, i.e. with _all_ respective
return addresses still on the stack. Since your lookup starts
from SSP, there'll be two active frames on the stack which both
have the same return address.

We may not actively have such a code structure right now, but
it would seem shortsighted to me to not account for the
possibility.

Jan

