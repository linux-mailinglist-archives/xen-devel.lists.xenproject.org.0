Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D204739081
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 22:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553125.863500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC44C-0006IA-Rm; Wed, 21 Jun 2023 20:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553125.863500; Wed, 21 Jun 2023 20:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC44C-0006GJ-PA; Wed, 21 Jun 2023 20:04:36 +0000
Received: by outflank-mailman (input) for mailman id 553125;
 Wed, 21 Jun 2023 20:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lY41=CJ=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qC44A-0006GD-63
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 20:04:35 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c8f8ea-106e-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 22:04:31 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qC43n-00058b-2F; Wed, 21 Jun 2023 20:04:11 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7BABC30031B;
 Wed, 21 Jun 2023 22:04:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5DAED213E05DC; Wed, 21 Jun 2023 22:04:09 +0200 (CEST)
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
X-Inumbo-ID: d5c8f8ea-106e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jivk2cvZYtRDS6c1ZZTS2atKicw7SGBfxJ5V2QQO2lc=; b=bOmVP8i8J+qXbFKXBmni1/ADKR
	0YU839Jcfdu6iaEVAPZRHL/ocHT7HLuVKEmCWaw1mH4SYKTKJGbB6dLcSsM2G5Aae35IMV4dAsCZL
	BQWMY2KrD0/D/RebgdbfICwS00zU4L1H3cK0bBvgHQEIs1hbMxIUe/9rkJWxXV69mIWJIXAoLZjq2
	Ptzy0VI2xGHRtAUO1UNLSyqA37mM2GRInLrNpRmUIO1oBlU9SoyEgxvD6izFUCbLQ7JlwpsM1PjKt
	DQE0MF/mBc559+i7jQ1HtmMA7QeS6ST1GXTuWjuponAg+bUH0jQJ2nGVXYgiOPy0PtquEKS9XJKXV
	E5IWpmcQ==;
Date: Wed, 21 Jun 2023 22:04:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Per Bilse <Per.Bilse@citrix.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"open list:X86 ENTRY CODE" <linux-kernel@vger.kernel.org>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Updates to Xen hypercall preemption
Message-ID: <20230621200409.GC4253@hirez.programming.kicks-ass.net>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
 <20230621164038.GM2053369@hirez.programming.kicks-ass.net>
 <6523f3e2-8dfc-c2dd-6d14-9e0c3ac93cc8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6523f3e2-8dfc-c2dd-6d14-9e0c3ac93cc8@citrix.com>

On Wed, Jun 21, 2023 at 07:19:21PM +0000, Per Bilse wrote:
> On 6/21/2023 5:40 PM, Peter Zijlstra wrote:
> > I don't understand it -- fundamentally, how can linux schedule when the
> > guest isn't even running? Hypercall transfers control to the
> > host/hypervisor and leaves the guest suspended.
> 
> Hi Peter, as noted in earlier note to Andy, this is essentially existing
> code that other commits have rendered ineffective over time.  Hence,
> the finer details of how or why it works haven't changed since it was
> first introduced.

That doesn't mean you don't have to explain how stuff works.

> > This makes no sense; the race that warning warns about is:
> > 
> > 	CPU0			CPU1
> > 	per-cpu write
> > 	<preempt-out>
> > 				<preempt-in>
> > 				do-hypercall
> > 
> > So you wrote the value on CPU0, got migrated to CPU1 because you had
> > preemptioned enabled, and then continue with the percpu value of CPU1
> > because that's where you're at now.
> 
> This issue was raised internally, and it was noted that the only way
> for the preemptible code to switch task is via an interrupt that goes
> through xen_pv_evtchn_do_upcall(), which handles this.  I'm happy to
> check with my sources, but it's holiday season right now.

Then it should have all sorts of comments on and a comprehensive
changelog.

> >> 4) Update irqentry_exit_cond_resched() to raw_irqentry_exit_cond_resched().
> >> The code will call irqentry_exit_cond_resched() if the flag (as noted
> >> above) is set, but the dynamic preemption feature will livepatch that
> >> function to a no-op unless full preemption is selected.  The code is
> >> therefore updated to call raw_irqentry_exit_cond_resched().
> > 
> > That, again meeds more explanation. Why do you want this if not
> > preemptible?
> 
> I'm not quite sure what you mean here.  Dynamic preemption
> will livepatch irqentry_exit_cond_resched() to be a no-op, while
> raw_irqentry_exit_cond_resched() remains functional.  This was 
> introduced in commit 4624a14f4daa last year which was said to fix
> the problem, but doesn't.  You may remember, it was signed off by 
> yourself and Mark Rutland.

I don't see the relation; what you're doing is making dynamic preempt
that's not configured for full preempt do preemption. That's weird, and
again no comments.

I'm with Andy in that simply forcing full preemption would make far more
sense -- but I'm still missing something fundamental, see below.

> > You're doing 4 things, that should be 4 patches. Also, please give more
> > clues for how this is supposed to work at all.
> 
> I respectfully have to disagree with that.  The fixes here are very
> closely related, and we're not introducing anything new, we're merely
> re-enabling code which has been rendered ineffective due to oversights
> in commits made after the code was first introduced.  How the code is
> supposed to work hasn't changed, and is beyond the scope of these fixes;
> I'm sure it must have been discussed at great length at the time (commit 
> fdfd811ddde3).

You didn't even so much as reference that commit, nor provide any other
explanation. And having now read that commit, I'm not much enlightend.

*HOW* can a hypercall, something that exits the Guest and has the
Host/Hypervisor run get preempted in the Guest -- that isn't running.

Or are you calling apples pears?

