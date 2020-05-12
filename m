Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B211CF53A
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 15:07:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYUbJ-0002Do-8c; Tue, 12 May 2020 13:05:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYUbH-0002Dj-GX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 13:05:35 +0000
X-Inumbo-ID: 43da84f4-9451-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43da84f4-9451-11ea-9887-bc764e2007e4;
 Tue, 12 May 2020 13:05:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BBAEAC64;
 Tue, 12 May 2020 13:05:36 +0000 (UTC)
Subject: Re: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-4-andrew.cooper3@citrix.com>
 <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
 <a397dd69-2384-a4af-d127-9189a730a554@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afd75bde-9adf-d8cf-f8cf-24cb1b753253@suse.com>
Date: Tue, 12 May 2020 15:05:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a397dd69-2384-a4af-d127-9189a730a554@citrix.com>
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

On 11.05.2020 17:14, Andrew Cooper wrote:
> On 04/05/2020 14:20, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>>            trapnr, vec_name(trapnr), regs->error_code);
>>>  }
>>>  
>>> +static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>> +{
>>> +    unsigned long fixup = search_exception_table(regs);
>>> +
>>> +    if ( unlikely(fixup == 0) )
>>> +        return false;
>>> +
>>> +    /* Can currently be triggered by guests.  Make sure we ratelimit. */
>>> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )
>> I didn't think we consider dprintk()-s a possible security issue.
>> Why would we consider so a printk() hidden behind
>> IS_ENABLED(CONFIG_DEBUG)? IOW I think one of XENLOG_GUEST and
>> IS_ENABLED(CONFIG_DEBUG) wants dropping.
> 
> Who said anything about a security issue?

The need to rate limit is (among other aspects) to prevent a
(logspam) security issue, isn't it?

> I'm deliberately not using dprintk() for the reasons explained in the
> commit message, so IS_ENABLED(CONFIG_DEBUG) is to cover that.

Which is fine, and which I understood.

> XENLOG_GUEST is because everything (other than the boot path) hitting
> this caused directly by a guest action, and needs rate-limiting.  This
> was not consistent before.

But why do we need both CONFIG_DEBUG and XENLOG_GUEST? In a debug
build I think we'd better know of such events under the control
of the general log level setting, not under that of guest specific
messages.

>>> @@ -1466,12 +1468,11 @@ void do_page_fault(struct cpu_user_regs *regs)
>>>          if ( pf_type != real_fault )
>>>              return;
>>>  
>>> -        if ( likely((fixup = search_exception_table(regs)) != 0) )
>>> +        if ( likely(exception_fixup(regs, false)) )
>>>          {
>>>              perfc_incr(copy_user_faults);
>>>              if ( unlikely(regs->error_code & PFEC_reserved_bit) )
>>>                  reserved_bit_page_fault(addr, regs);
>>> -            regs->rip = fixup;
>> I'm afraid this modification can't validly be pulled ahead -
>> show_execution_state(), as called from reserved_bit_page_fault(),
>> wants to / should print the original RIP, not the fixed up one.
> 
> This path is bogus to begin with.  Any RSVD pagefault (other than the
> Shadow MMIO fastpath, handled earlier) is a bug in Xen and should be
> fatal rather than just a warning on extable-tagged instructions.

I could see reasons to convert to a fatal exception (without looking
up fixups), but then in a separate change with suitable justification.
I'd like to point out though that this would convert a logspam kind
of DoS to a Xen crash one, in case such a PTE would indeed be created
anywhere by mistake.

However, it is not helpful to the diagnosis of such a problem if the
logged address points at the fixup code rather than the faulting one.

Jan

