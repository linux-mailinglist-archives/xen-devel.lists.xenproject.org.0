Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD91EBC33
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6UH-0002Vz-Do; Tue, 02 Jun 2020 12:57:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6UG-0002Vu-AU
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:57:48 +0000
X-Inumbo-ID: a81d0a42-a4d0-11ea-abee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a81d0a42-a4d0-11ea-abee-12813bfff9fa;
 Tue, 02 Jun 2020 12:57:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABAA7ABD1;
 Tue,  2 Jun 2020 12:57:48 +0000 (UTC)
Subject: Re: [PATCH v2 10/14] x86/extable: Adjust extable handling to be
 shadow stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-11-andrew.cooper3@citrix.com>
 <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
 <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79074c8d-adf0-7df5-e13b-bfa6551112e5@suse.com>
Date: Tue, 2 Jun 2020 14:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 29.05.2020 21:43, Andrew Cooper wrote:
> On 28/05/2020 17:15, Jan Beulich wrote:
>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>> @@ -763,6 +775,56 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>>            trapnr, vec_name(trapnr), regs->error_code);
>>>  }
>>>  
>>> +static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
>>> +{
>>> +    unsigned long ssp, *ptr, *base;
>>> +
>>> +    asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
>>> +    if ( ssp == 1 )
>>> +        return;
>>> +
>>> +    ptr = _p(ssp);
>>> +    base = _p(get_shstk_bottom(ssp));
>>> +
>>> +    for ( ; ptr < base; ++ptr )
>>> +    {
>>> +        /*
>>> +         * Search for %rip.  The shstk currently looks like this:
>>> +         *
>>> +         *   ...  [Likely pointed to by SSP]
>>> +         *   %cs  [== regs->cs]
>>> +         *   %rip [== regs->rip]
>>> +         *   SSP  [Likely points to 3 slots higher, above %cs]
>>> +         *   ...  [call tree to this function, likely 2/3 slots]
>>> +         *
>>> +         * and we want to overwrite %rip with fixup.  There are two
>>> +         * complications:
>>> +         *   1) We cant depend on SSP values, because they won't differ by 3
>>> +         *      slots if the exception is taken on an IST stack.
>>> +         *   2) There are synthetic (unrealistic but not impossible) scenarios
>>> +         *      where %rip can end up in the call tree to this function, so we
>>> +         *      can't check against regs->rip alone.
>>> +         *
>>> +         * Check for both reg->rip and regs->cs matching.
>>> +         */
>>> +
>>> +        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
>>> +        {
>>> +            asm ( "wrssq %[fix], %[stk]"
>>> +                  : [stk] "=m" (*ptr)
>> Could this be ptr[0], to match the if()?
>>
>> Considering how important it is that we don't fix up the wrong stack
>> location here, I continue to wonder if we wouldn't better also
>> include the SSP value on the stack in the checking, at the very
>> least by way of an ASSERT() or BUG_ON().
> 
> Well no, for the reason discussed in point 1.

I don't see my suggestion in conflict with that point. I didn't
suggest an check using == ; instead what I'm thinking about here
is something as weak as "Does this point somewhere into the
stack range for this CPU?" After all there are only a limited
set of classes of entries that can be on a shadow stack:
- LIP (Xen .text, livepatching area)
- CS  (<= 0xffff)
- SSP (within stack range for the CPU)
- supervisor token (a single precise address)
- padding (zero)
The number ranges covered by these classes are entirely disjoint,
so qualifying all three slots accordingly can be done without any
risk of getting an entry wrong.

> Its not technically an issue right now, but there is no possible way to
> BUILD_BUG_ON() someone turning an exception into IST, or stopping the
> use of the extable infrastructure on a #DB.
> 
> Such a check would lie in wait and either provide an unexpected tangent
> to someone debugging a complicated issue (I do use #DB for a fair bit),
> or become a security vulnerability.
> 
>> Since, with how the code is
>> currently written, this would require a somewhat odd looking ptr[-1]
>> I also wonder whether "while ( ++ptr < base )" as the loop header
>> wouldn't be better. The first entry on the stack can't be the RIP
>> we look for anyway, can it?
> 
> Yes it can.

How, when there's the return address of this function plus
an SSP value preceding it?

Jan

