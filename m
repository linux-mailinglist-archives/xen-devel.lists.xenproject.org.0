Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0D1E87A6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 21:21:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jekZ8-0007hn-RE; Fri, 29 May 2020 19:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jekZ7-0007gB-7F
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 19:21:13 +0000
X-Inumbo-ID: 8e1fed7c-a1e1-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e1fed7c-a1e1-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 19:21:11 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:41684
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jekZ2-000OgG-MS (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 20:21:09 +0100
Subject: Re: [PATCH v2 05/14] x86/shstk: Re-layout the stack block for shadow
 stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-6-andrew.cooper3@citrix.com>
 <03cc30f8-4849-f77d-857d-b63248c70a25@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bfa93460-486b-3977-475e-8c92114baa75@citrix.com>
Date: Fri, 29 May 2020 20:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <03cc30f8-4849-f77d-857d-b63248c70a25@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

On 28/05/2020 13:33, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -365,20 +365,15 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
>>  /*
>>   * Notes for get_stack_trace_bottom() and get_stack_dump_bottom()
>>   *
>> - * Stack pages 0 - 3:
>> + * Stack pages 1 - 4:
>>   *   These are all 1-page IST stacks.  Each of these stacks have an exception
>>   *   frame and saved register state at the top.  The interesting bound for a
>>   *   trace is the word adjacent to this, while the bound for a dump is the
>>   *   very top, including the exception frame.
>>   *
>> - * Stack pages 4 and 5:
>> - *   None of these are particularly interesting.  With MEMORY_GUARD, page 5 is
>> - *   explicitly not present, so attempting to dump or trace it is
>> - *   counterproductive.  Without MEMORY_GUARD, it is possible for a call chain
>> - *   to use the entire primary stack and wander into page 5.  In this case,
>> - *   consider these pages an extension of the primary stack to aid debugging
>> - *   hopefully rare situations where the primary stack has effective been
>> - *   overflown.
>> + * Stack pages 0 and 5:
>> + *   Shadow stacks.  These are mapped read-only, and used by CET-SS capable
>> + *   processors.  They will never contain regular stack data.
> I don't mind the comment getting put in place already here, but will it
> reflect reality even when CET-SS is not in use, in that the pages then
> still are mapped r/o rather than being left unmapped to act as guard
> pages not only for stack pushes but also for stack pops?

I can't parse this question.

However, I think it is answered by the following patch which does move
things to unilaterally being r/o even in the non-CET-SS case.

> At which point
> the "dump or trace it is counterproductive" remark would still apply in
> this case, and hence may better be retained.

Well - I'm thinking forwards to cleanup where we'd want to integrate the
shadow stack into stack trace reporting, at which point we would
consider these frames interesting to dump/trace.

>
>> @@ -392,13 +387,10 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
>>  {
>>      switch ( get_stack_page(sp) )
>>      {
>> -    case 0 ... 3:
>> +    case 1 ... 4:
>>          return ROUNDUP(sp, PAGE_SIZE) -
>>              offsetof(struct cpu_user_regs, es) - sizeof(unsigned long);
>>  
>> -#ifndef MEMORY_GUARD
>> -    case 4 ... 5:
>> -#endif
>>      case 6 ... 7:
>>          return ROUNDUP(sp, STACK_SIZE) -
>>              sizeof(struct cpu_info) - sizeof(unsigned long);
>> @@ -412,12 +404,9 @@ unsigned long get_stack_dump_bottom(unsigned long sp)
>>  {
>>      switch ( get_stack_page(sp) )
>>      {
>> -    case 0 ... 3:
>> +    case 1 ... 4:
>>          return ROUNDUP(sp, PAGE_SIZE) - sizeof(unsigned long);
>>  
>> -#ifndef MEMORY_GUARD
>> -    case 4 ... 5:
>> -#endif
>>      case 6 ... 7:
>>          return ROUNDUP(sp, STACK_SIZE) - sizeof(unsigned long);
> The need to adjust these literal numbers demonstrates how fragile
> this is. I admit I can't see a good way to get rid of the literal
> numbers altogether,

Frankly, this is why there is a massive comment, and I really didn't
want to introduce PRIMARY_SHSTK_SLOT to begin with, because the whole
thing is fragile and there is no obvious naming/labelling scheme which
is liable to survive tweaking.

>  but could I talk you into switching to (for
> the latter, as example)
>
>     switch ( get_stack_page(sp) )
>     {
>     case 0: case PRIMARY_SHSTK_SLOT:
>         return 0;
>
>     case 1 ... 4:
>         return ROUNDUP(sp, PAGE_SIZE) - sizeof(unsigned long);
>
>     case 6 ... 7:
>         return ROUNDUP(sp, STACK_SIZE) - sizeof(unsigned long);
>
>     default:
>         return sp - sizeof(unsigned long);
>     }
>
> ? Of course this will need the callers to be aware they may get
> back zero, but there are only very few (which made me notice the
> functions would better be static).

It was definitely needed externally at some point in the past.

>  And the returning of zero may
> then want changing (conditionally upon us using CET-SS) in a
> later patch, where iirc you use the shadow stack for call trace
> generation.
>
> As a positive side effect this will yield a compile error if
> PRIMARY_SHSTK_SLOT gets changed without adjusting these
> functions.

Overall to your question, potentially as future clean-up to how we
express stacks, but not right now for 4.14.

>
>> --- a/xen/include/asm-x86/config.h
>> +++ b/xen/include/asm-x86/config.h
>> @@ -75,6 +75,9 @@
>>  /* Primary stack is restricted to 8kB by guard pages. */
>>  #define PRIMARY_STACK_SIZE 8192
>>  
>> +/* Primary shadow stack is slot 5 of 8, immediately under the primary stack. */
>> +#define PRIMARY_SHSTK_SLOT 5
> Any reason to put it here rather than ...
>
>> --- a/xen/include/asm-x86/current.h
>> +++ b/xen/include/asm-x86/current.h
>> @@ -16,12 +16,12 @@
>>   *
>>   * 7 - Primary stack (with a struct cpu_info at the top)
>>   * 6 - Primary stack
>> - * 5 - Optionally not present (MEMORY_GUARD)
>> - * 4 - Unused; optionally not present (MEMORY_GUARD)
>> - * 3 - Unused; optionally not present (MEMORY_GUARD)
>> - * 2 - MCE IST stack
>> - * 1 - NMI IST stack
>> - * 0 - Double Fault IST stack
>> + * 5 - Primay Shadow Stack (read-only)
>> + * 4 - #DF IST stack
>> + * 3 - #DB IST stack
>> + * 2 - NMI IST stack
>> + * 1 - #MC IST stack
>> + * 0 - IST Shadow Stacks (4x 1k, read-only)
>>   */
> ... right below this comment?

Yes - grouping the related constants.

> Same question as above regarding the "read-only" here.

I'll adjust the commit message to make it clearer that some of the text
here is made true in the next patch.

~Andrew

