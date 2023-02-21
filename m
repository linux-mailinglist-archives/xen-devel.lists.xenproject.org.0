Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7E69DCA9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 10:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498640.769521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOjj-0006h3-Qh; Tue, 21 Feb 2023 09:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498640.769521; Tue, 21 Feb 2023 09:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOjj-0006dg-Nb; Tue, 21 Feb 2023 09:14:59 +0000
Received: by outflank-mailman (input) for mailman id 498640;
 Tue, 21 Feb 2023 09:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKgZ=6R=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pUOji-0006dX-4o
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 09:14:58 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34e0b8bb-b1c8-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 10:14:56 +0100 (CET)
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
X-Inumbo-ID: 34e0b8bb-b1c8-11ed-933d-83870f6b2ba8
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1676970894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQRPfdgwcRjmMWw+0c3Jqrn1sLC4pxLEI/ts5BFfWNs=;
	b=4lf3ncTbyGCsTdGUMTqu/8+wSbuNleK+TbpU3r1IdUq+q0A8dPmqfuMqgFUrgK+BVYs6jF
	GqyO2ZGmz7OeDLnw8JALhMHC3a0xUJOrh2Rq246Ucifk2KKegpYE662PTjWVdcXZrXhqj7
	buf/aXZSZCks/cuLzH0p74hDqrEWtnrmgs0/dtxVUzrqSCE1npxYSP2PV8oK7Um2VJkh16
	+xqbGFVrSNALd6q1fvQlYTKNae+b3TvpxnhIg1p0tY7+N75t/DRF5UeGtyXOC3tuW9b5BH
	oLGfKsgVpo5CsMbqxuk9B8gL6TuyVkCPUiQkwgH2k/UbjqU0AQL94Vtr3F+9Kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1676970894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQRPfdgwcRjmMWw+0c3Jqrn1sLC4pxLEI/ts5BFfWNs=;
	b=EznI/8jSHUDF8pTcrVH0UpZYp+I9czzXdCCXp84xzi5hwNqJ6pSl8TemI6OPnMvmLMPuR6
	9AI94MLXooTH4xCQ==
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Anthony Liguori <aliguori@amazon.com>, David Reaver
 <me@davidreaver.com>, Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next 2/2] x86/xen/time: cleanup
 xen_tsc_safe_clocksource
In-Reply-To: <20230221055117.GA1934@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx> <20230221041440.GA1934@templeofstupid.com>
 <20230221055117.GA1934@templeofstupid.com>
Date: Tue, 21 Feb 2023 10:14:54 +0100
Message-ID: <871qmjpegh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 20 2023 at 21:51, Krister Johansen wrote:
> On Mon, Feb 20, 2023 at 08:14:40PM -0800, Krister Johansen wrote:
>> > static bool __init xen_tsc_safe_clocksource(void)
>> > {
>> > 	u32 eax, ebx. ecx, edx;
>> >  
>> > 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
>> > 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
>> > 
>> > 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
>> > }
>> 
>> I'm all for simplifying.  I'm happy to clean up that return to be more
>> idiomatic.  I was under the impression, perhaps mistaken, though, that
>> the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
>> check_tsc_unstable() checks were actually serving a purpose: to ensure
>> that we don't rely on the tsc in environments where it's being emulated
>> and the OS would be better served by using a PV clock.  Specifically,
>> kvmclock_init() makes a very similar set of checks that I also thought
>> were load-bearing.
>
> Bah, what I meant to say was emulated, unstable, or otherwise unsuitable
> for use as a clocksource.  IOW, even if TSC_MODE_NEVER_EMULATE is
> set, it's possible that a user is attempting a migration from a cpu
> that's not invariant, and we'd still want to check for that case and
> fall back to a PV clocksource, correct?

Sure. But a life migration from a NEVER_EMULATE to a non-invariant host
is a patently bad idea and has nothing to do with the __init function,
which is gone at that point already.

What I wanted to say:

static bool __init xen_tsc_safe_clocksource(void)
{
        ......        

	/* Leaf 4, sub-leaf 0 (0x40000x03) */
	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);

	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
}

I didn't have the full context and was just looking at the condition.
Now I checked the full context and I think that except for the

	if (check_tsc_unstable())

check everything else can go away unless you do not trust the hypervisor
that it only sets the NEVER_EMULATE bit when CONSTANT and NONSTOP are
set as well. But yeah, you might prefer to be paranoid. It's virt after
all.

Thanks,

        tglx

