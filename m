Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B073997D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553373.863883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFeF-0007PD-Rw; Thu, 22 Jun 2023 08:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553373.863883; Thu, 22 Jun 2023 08:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFeF-0007NV-P2; Thu, 22 Jun 2023 08:26:35 +0000
Received: by outflank-mailman (input) for mailman id 553373;
 Thu, 22 Jun 2023 08:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waO+=CK=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qCFeD-0007NB-3z
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:26:34 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d91e09e-10d6-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 10:26:31 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qCFdq-0014SH-0S; Thu, 22 Jun 2023 08:26:10 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 454FA300222;
 Thu, 22 Jun 2023 10:26:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2646E2421619E; Thu, 22 Jun 2023 10:26:07 +0200 (CEST)
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
X-Inumbo-ID: 7d91e09e-10d6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mbXA79XLHxERspEGgZH6j4YxWqZ7fFJ3tIvi+rSHyOk=; b=jljuonf4K1sLymfrWeTD2/MMUL
	6Jvei8fLyJRLPO2xhFRkPTEX/P9cws5G9NRNZSBrXELNh4ejlE7fXvYInygAh8kHXg1ncBXdf8+Im
	8o8avMslqDvCS1YoFewmeCMd9YkBnLf5BGNzROXRLYsUr2V+T4VBcNmEIvHkRQOXSoQOd3kOgR9iV
	SaDAqSk0I1fb0D4nIcLLuHZfNv1AaNYBqVwd076jGXF1F+NEb6iMrrXtNzBeEcK1cOSJOpndElzOx
	son3dUox7JxXjSQmsyKBkBia3Twhiff5TZYa2+H6WM2MGT3azXZJItdB/tnxfGFbuhQ90NOWIxz2B
	V8NSddeQ==;
Date: Thu, 22 Jun 2023 10:26:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Per Bilse <Per.Bilse@citrix.com>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"open list:X86 ENTRY CODE" <linux-kernel@vger.kernel.org>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Updates to Xen hypercall preemption
Message-ID: <20230622082607.GD4253@hirez.programming.kicks-ass.net>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
 <20230621164038.GM2053369@hirez.programming.kicks-ass.net>
 <6523f3e2-8dfc-c2dd-6d14-9e0c3ac93cc8@citrix.com>
 <20230621200409.GC4253@hirez.programming.kicks-ass.net>
 <a8cd2788-a695-964a-3311-dbecb669bb72@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8cd2788-a695-964a-3311-dbecb669bb72@suse.com>

On Thu, Jun 22, 2023 at 07:22:53AM +0200, Juergen Gross wrote:

> The hypercalls we are talking of are synchronous ones. They are running
> in the context of the vcpu doing the call (like a syscall from userland is
> running in the process context).

(so time actually passes from the guest's pov?)

> The hypervisor will return to guest context from time to time by modifying
> the registers such that the guest will do the hypercall again with different
> input values for the hypervisor, resulting in a proper continuation of the
> hypercall processing.

Eeeuw.. that's pretty terrible. And changing this isn't in the cards,
like at all?

That is, why isn't this whole thing written like:

	for (;;) {
		ret = hypercall(foo);
		if (ret == -EAGAIN) {
			cond_resched();
			continue;
		}
		break;
	}

> It is an awful interface and I agree that switching to full preemption in
> dom0 seems to be the route which we should try to take.

Well, I would very strongly suggest the route to take is to scrap the
whole thing and invest in doing something saner so we don't have to jump
through hoops like this.

This is quite possibly the worst possible interface for this Xen could
have come up with -- awards material for sure.

> The downside would be that some workloads might see worse performance
> due to backend I/O handling might get preempted.

Is that an actual concern? Mark this a legaxy inteface and anybody who
wants to get away from it updates.

> Just thinking - can full preemption be enabled per process?

Nope, that's a system wide thing. Preemption is something that's driven
by the requirements of the tasks that preempt, not something by the
tasks that get preempted.

Andy's idea of having that thing intercepted as an exception (EXTABLE
like) and relocating the IP to a place that does cond_resched() before
going back is an option.. gross, but possibly better, dunno.

Quite the mess indeed :/

