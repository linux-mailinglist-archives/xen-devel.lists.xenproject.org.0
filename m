Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505601E60ED
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 14:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeHid-0003ta-SI; Thu, 28 May 2020 12:33:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeHic-0003tU-4u
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 12:33:06 +0000
X-Inumbo-ID: 6083ff82-a0df-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6083ff82-a0df-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 12:33:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 811B2AF0D;
 Thu, 28 May 2020 12:33:03 +0000 (UTC)
Subject: Re: [PATCH v2 05/14] x86/shstk: Re-layout the stack block for shadow
 stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03cc30f8-4849-f77d-857d-b63248c70a25@suse.com>
Date: Thu, 28 May 2020 14:33:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-6-andrew.cooper3@citrix.com>
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

On 27.05.2020 21:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -365,20 +365,15 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
>  /*
>   * Notes for get_stack_trace_bottom() and get_stack_dump_bottom()
>   *
> - * Stack pages 0 - 3:
> + * Stack pages 1 - 4:
>   *   These are all 1-page IST stacks.  Each of these stacks have an exception
>   *   frame and saved register state at the top.  The interesting bound for a
>   *   trace is the word adjacent to this, while the bound for a dump is the
>   *   very top, including the exception frame.
>   *
> - * Stack pages 4 and 5:
> - *   None of these are particularly interesting.  With MEMORY_GUARD, page 5 is
> - *   explicitly not present, so attempting to dump or trace it is
> - *   counterproductive.  Without MEMORY_GUARD, it is possible for a call chain
> - *   to use the entire primary stack and wander into page 5.  In this case,
> - *   consider these pages an extension of the primary stack to aid debugging
> - *   hopefully rare situations where the primary stack has effective been
> - *   overflown.
> + * Stack pages 0 and 5:
> + *   Shadow stacks.  These are mapped read-only, and used by CET-SS capable
> + *   processors.  They will never contain regular stack data.

I don't mind the comment getting put in place already here, but will it
reflect reality even when CET-SS is not in use, in that the pages then
still are mapped r/o rather than being left unmapped to act as guard
pages not only for stack pushes but also for stack pops? At which point
the "dump or trace it is counterproductive" remark would still apply in
this case, and hence may better be retained.

> @@ -392,13 +387,10 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
>  {
>      switch ( get_stack_page(sp) )
>      {
> -    case 0 ... 3:
> +    case 1 ... 4:
>          return ROUNDUP(sp, PAGE_SIZE) -
>              offsetof(struct cpu_user_regs, es) - sizeof(unsigned long);
>  
> -#ifndef MEMORY_GUARD
> -    case 4 ... 5:
> -#endif
>      case 6 ... 7:
>          return ROUNDUP(sp, STACK_SIZE) -
>              sizeof(struct cpu_info) - sizeof(unsigned long);
> @@ -412,12 +404,9 @@ unsigned long get_stack_dump_bottom(unsigned long sp)
>  {
>      switch ( get_stack_page(sp) )
>      {
> -    case 0 ... 3:
> +    case 1 ... 4:
>          return ROUNDUP(sp, PAGE_SIZE) - sizeof(unsigned long);
>  
> -#ifndef MEMORY_GUARD
> -    case 4 ... 5:
> -#endif
>      case 6 ... 7:
>          return ROUNDUP(sp, STACK_SIZE) - sizeof(unsigned long);

The need to adjust these literal numbers demonstrates how fragile
this is. I admit I can't see a good way to get rid of the literal
numbers altogether, but could I talk you into switching to (for
the latter, as example)

    switch ( get_stack_page(sp) )
    {
    case 0: case PRIMARY_SHSTK_SLOT:
        return 0;

    case 1 ... 4:
        return ROUNDUP(sp, PAGE_SIZE) - sizeof(unsigned long);

    case 6 ... 7:
        return ROUNDUP(sp, STACK_SIZE) - sizeof(unsigned long);

    default:
        return sp - sizeof(unsigned long);
    }

? Of course this will need the callers to be aware they may get
back zero, but there are only very few (which made me notice the
functions would better be static). And the returning of zero may
then want changing (conditionally upon us using CET-SS) in a
later patch, where iirc you use the shadow stack for call trace
generation.

As a positive side effect this will yield a compile error if
PRIMARY_SHSTK_SLOT gets changed without adjusting these
functions.

> --- a/xen/include/asm-x86/config.h
> +++ b/xen/include/asm-x86/config.h
> @@ -75,6 +75,9 @@
>  /* Primary stack is restricted to 8kB by guard pages. */
>  #define PRIMARY_STACK_SIZE 8192
>  
> +/* Primary shadow stack is slot 5 of 8, immediately under the primary stack. */
> +#define PRIMARY_SHSTK_SLOT 5

Any reason to put it here rather than ...

> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -16,12 +16,12 @@
>   *
>   * 7 - Primary stack (with a struct cpu_info at the top)
>   * 6 - Primary stack
> - * 5 - Optionally not present (MEMORY_GUARD)
> - * 4 - Unused; optionally not present (MEMORY_GUARD)
> - * 3 - Unused; optionally not present (MEMORY_GUARD)
> - * 2 - MCE IST stack
> - * 1 - NMI IST stack
> - * 0 - Double Fault IST stack
> + * 5 - Primay Shadow Stack (read-only)
> + * 4 - #DF IST stack
> + * 3 - #DB IST stack
> + * 2 - NMI IST stack
> + * 1 - #MC IST stack
> + * 0 - IST Shadow Stacks (4x 1k, read-only)
>   */

... right below this comment?

Same question as above regarding the "read-only" here.

Jan

