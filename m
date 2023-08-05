Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95FB77123E
	for <lists+xen-devel@lfdr.de>; Sat,  5 Aug 2023 23:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577625.904585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSOQW-0003IM-0o; Sat, 05 Aug 2023 21:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577625.904585; Sat, 05 Aug 2023 21:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSOQV-0003G1-UY; Sat, 05 Aug 2023 21:03:07 +0000
Received: by outflank-mailman (input) for mailman id 577625;
 Sat, 05 Aug 2023 21:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHJJ=DW=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qSOQT-0003Fu-MR
 for xen-devel@lists.xenproject.org; Sat, 05 Aug 2023 21:03:05 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761ea207-33d3-11ee-8613-37d641c3527e;
 Sat, 05 Aug 2023 23:03:01 +0200 (CEST)
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
X-Inumbo-ID: 761ea207-33d3-11ee-8613-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1691269380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSbKeXLBsgKqGj/TwqTJ9+PojQPLuVRP6JDwmEEGuoE=;
	b=G1L7HlLWpNbkQsJ5hzO4fWWiZ+FtA0lxn/PDsGsygDHKd82Z1Dlrc+/V4zug84FWYwNTBe
	/MysUkkx5IjU9x62KFTC8slW5q048LdNDfzZMBpZeqJSQy/30me7wEOUXlVjdPRelQbtal
	PO6QKSTMLwFh1ZFT3SgL5IaxVVsyZYXcDeEnOPSs4sdPvE0UEVxtoBueWh4tk9uHJSamI+
	i5R7rN+6OmoKEx9+5sfv1irx9EVO+J6UgKEYv/QSZ6F+D6Pqc9F5j/CSbBB3bfKsrm+o38
	IuwmqsyUupUM8g7ufi9tYo9fYSwRTi7bhGAE78K3uoeRUpbdCG8xwWbO1DDugQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1691269380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSbKeXLBsgKqGj/TwqTJ9+PojQPLuVRP6JDwmEEGuoE=;
	b=tJDGqJG9ZGL0jQfrmZogiEnjYq0oxLwLymgfLwSzBNsVGW5UDfDiT9E9gA4oG6BZEn37Qr
	KJ2/cN0ZZLuWxOCA==
To: Peter Zijlstra <peterz@infradead.org>, "Li, Xin3" <xin3.li@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Lutomirski, Andy" <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "Gross, Jurgen" <jgross@suse.com>, "Ostrovsky, Boris"
 <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 1/1] x86/traps: Get rid of exception handlers'
 second argument error code
In-Reply-To: <20230804190120.GP212435@hirez.programming.kicks-ass.net>
References: <20230804075734.8372-1-xin3.li@intel.com>
 <20230804101321.GH214207@hirez.programming.kicks-ass.net>
 <SA1PR11MB67349385C20E8D3B0C960432A809A@SA1PR11MB6734.namprd11.prod.outlook.com>
 <20230804190120.GP212435@hirez.programming.kicks-ass.net>
Date: Sat, 05 Aug 2023 23:02:59 +0200
Message-ID: <87o7jlmccc.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 04 2023 at 21:01, Peter Zijlstra wrote:
> On Fri, Aug 04, 2023 at 05:35:11PM +0000, Li, Xin3 wrote:
>> > > The commit d99015b1abbad ("x86: move entry_64.S register saving out of
>> > > the macros") introduced the changes to set orig_ax to -1, but I can't
>> > > see why it's required. Our tests on x86_64 and x86_32 seem fine if
>> > > orig_ax is left unchanged instead of set to -1.
>> > 
>> > That means that SYSCALL_NUM(regs) get to be garbage; or something like that.
>> 
>> I find SYSCALL_NUM(regs) in tools/testing/selftests/seccomp/seccomp_bpf.c,
>> but nothing obvious to me.
>> 
>> I think it's clear that once exceptions and IRQs are handled, the original
>> context will be fully recovered in a normal case.
>> 
>> Is it related to preemption after such a event?
>> 
>> I must have missed something; can you please elaborate it?
>
> arch/x86/include/asm/syscall.h
>
> syscall_get_nr() syscall_rollback()

Specifically it breaks signal handling. See arch_do_signal_or_restart()
and handle_signal().

So, no. This cannot be changed nilly willy especially not because
orig_ax is part of the UABI.

Even if it would work, this patch is completely unreviewable. There are
smarter ways to make such a change in digestable chunks.

I also looked at the latest FRED series and that's broken vs. orig_ax in
the same way.

Aside of it the series is not applying to any tree I'm aware of. It
fails because its based on a tree which has IRQ_MOVE_CLEANUP_VECTOR
removed, but that's nowhere in mainline or tip. This is not the way it
works, really.

Back to the problem at hand. I'm absolutely not understanding why this
all is so complicated.

FRED pushs the error code or 0 (in case there is no error code) right
into orig_ax. That's where the ERET[US] frame starts. ERT[US] do not
care at all about the error code location, they skip it by adding 8 to
RSP.

So the obvious thing to do is:

fred_entry_from_xxxx(struct pt_regs *regs)
{
        unsigned long error_code = regs->orig_ax;

        regs->orig_ax = -1;

        dispatch_1st_level(regs->type, regs, error_code);
}

Now the dispatching code in your series looks nice and shiny with all
those tables, but in practice it's not so shiny at all.

For one this code forces indirect calls even in places where there are
no indirect calls required.

But what's worse it causes you to make everything uniform one way or the
other and adding all this dispatch_table_##func muck, which is fully
duplicated code for absolutely zero reason. That's error prone and a
maintainence mess.

The vast majority of exceptions, interrupts whatever is not special at
all neither on FRED nor on IDT. The ones which need special treatment
are those which store additional information in the stack frame and
these are the exception - not the rule. And those require special
treatment anyway whether you make the rest look uniform or not.

IOW, your approach of making everything uniform is completely
wrong. There is a reason why some system vectors are not using
DEFINE_IDTENTRY_SYSVEC().  Particularly the RESCHEDULE_VECTOR. This has
been performance optimized with a lot of effort and no, we are not going
to sacrifice that just because it makes it sooo simple for FRED.

This is not about simplicity. This is about sane and maintainable code
which preserves the carefully optimized code paths which are hotpath no
matter whether there is IDT or FRED.

I'm going to reply on your last failed resend attempt after creating a
sane mail thread out of the mess you created (including the insanely
large and inappropriate cc list).

Thanks,

        tglx

