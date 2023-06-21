Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5866738BBB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553007.863311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0tA-0001Fw-TH; Wed, 21 Jun 2023 16:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553007.863311; Wed, 21 Jun 2023 16:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0tA-0001DT-Pa; Wed, 21 Jun 2023 16:41:00 +0000
Received: by outflank-mailman (input) for mailman id 553007;
 Wed, 21 Jun 2023 16:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lY41=CJ=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qC0t8-0001DE-Mn
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:40:59 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6485235f-1052-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:40:56 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qC0sq-00HaPO-2N; Wed, 21 Jun 2023 16:40:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 55932300274;
 Wed, 21 Jun 2023 18:40:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3DB482130B3BB; Wed, 21 Jun 2023 18:40:38 +0200 (CEST)
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
X-Inumbo-ID: 6485235f-1052-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q8ZpFd9zhJ6vbE7RC8xwAURukdS6rBx4YiofuzrByd8=; b=mpUuWq+T2KEHGEgVKWj10ELKCz
	RJDgr2Qe8zmvnwKiugBusbRYyOc5Ln+Cd9vXiQ20G/U57IC9UXEI0htlLw3JOs+bChUIkR15xEqx4
	RHFQqKdXb2TnlCdi7o+5jABPENEBlQ4yjhqXjzpH2B8LtnV3QNYMkvLiUvh3YbrKUBGVQzlPhlTHu
	GQt8CdgE5hfCutdqilwWM4+tDzV3FdCMiOXl97eXC8ORKD3M4zcdsJKzo7/TAZ1DVIzbZ7AWUUQxM
	rFvOleEU91DCsYoLwnQlv6RxRUI268mIHeMP9aIs7EDbiIgyROsIgXIVQklKLkOHSiMJlq6qxEPg0
	zDf1a9fQ==;
Date: Wed, 21 Jun 2023 18:40:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Per Bilse <per.bilse@citrix.com>
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
Message-ID: <20230621164038.GM2053369@hirez.programming.kicks-ass.net>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621151442.2152425-1-per.bilse@citrix.com>

On Wed, Jun 21, 2023 at 03:14:42PM +0000, Per Bilse wrote:
> Some Xen hypercalls issued by dom0 guests may run for many 10s of
> seconds, potentially causing watchdog timeouts and other problems.
> It's rare for this to happen, but it does in extreme circumstances,
> for instance when shutting down VMs with very large memory allocations
> (> 0.5 - 1TB).  These hypercalls are preemptible, but the fixes in the
> kernel to ensure preemption have fallen into a state of disrepair, and
> are currently ineffective.  This patch brings things up to date by way of:

I don't understand it -- fundamentally, how can linux schedule when the
guest isn't even running? Hypercall transfers control to the
host/hypervisor and leaves the guest suspended.

> 1) Update general feature selection from XEN_PV to XEN_DOM0.
> The issue is unique to dom0 Xen guests, but isn't unique to PV dom0s,
> and will occur in future PVH dom0s.  XEN_DOM0 depends on either PV or PVH,
> as well as the appropriate details for dom0.
> 
> 2) Update specific feature selection from !PREEMPTION to !PREEMPT.
> The following table shows the relationship between different preemption
> features and their indicators/selectors (Y = "=Y", N = "is not set",
> . = absent):
> 
>                             | np-s | np-d | vp-s | vp-d | fp-s | fp-d
>     CONFIG_PREEMPT_DYNAMIC      N      Y      N      Y      N      Y
>          CONFIG_PREEMPTION      .      Y      .      Y      Y      Y
>             CONFIG_PREEMPT      N      N      N      N      Y      Y
>   CONFIG_PREEMPT_VOLUNTARY      N      N      Y      Y      N      N
>        CONFIG_PREEMPT_NONE      Y      Y      N      N      N      N
> 
> Unless PREEMPT is set, we need to enable the fixes.
> 
> 3) Update flag access from __this_cpu_XXX() to raw_cpu_XXX().
> The long-running hypercalls are flagged by way of a per-cpu variable
> which is set before and cleared after the relevant calls.  This elicits
> a warning "BUG: using __this_cpu_write() in preemptible [00000000] code",
> but xen_pv_evtchn_do_upcall() deals specifically with this.  For
> consistency, flag testing is also updated, and the code is simplified
> and tidied accordingly.

This makes no sense; the race that warning warns about is:

	CPU0			CPU1
	per-cpu write
	<preempt-out>
				<preempt-in>
				do-hypercall

So you wrote the value on CPU0, got migrated to CPU1 because you had
preemptioned enabled, and then continue with the percpu value of CPU1
because that's where you're at now.

Simply making the warning go away doesn't help, CPU1 does hypercall
while store was on CPU0.

> 4) Update irqentry_exit_cond_resched() to raw_irqentry_exit_cond_resched().
> The code will call irqentry_exit_cond_resched() if the flag (as noted
> above) is set, but the dynamic preemption feature will livepatch that
> function to a no-op unless full preemption is selected.  The code is
> therefore updated to call raw_irqentry_exit_cond_resched().

That, again meeds more explanation. Why do you want this if not
preemptible?

You're doing 4 things, that should be 4 patches. Also, please give more
clues for how this is supposed to work at all.



