Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027B770874
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 21:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577289.904291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS03s-0004jH-Jr; Fri, 04 Aug 2023 19:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577289.904291; Fri, 04 Aug 2023 19:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS03s-0004gj-Gy; Fri, 04 Aug 2023 19:02:08 +0000
Received: by outflank-mailman (input) for mailman id 577289;
 Fri, 04 Aug 2023 19:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xMif=DV=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qS03p-0004gd-Aq
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 19:02:06 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65acac0f-32f9-11ee-b270-6b7b168915f2;
 Fri, 04 Aug 2023 21:02:03 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qS037-000YFD-23; Fri, 04 Aug 2023 19:01:22 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 991C330007E;
 Fri,  4 Aug 2023 21:01:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7A46721FA7AFF; Fri,  4 Aug 2023 21:01:20 +0200 (CEST)
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
X-Inumbo-ID: 65acac0f-32f9-11ee-b270-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qVJ80sMcFC+VhDcYrAkI2SgTfMYHIJ7m/A06T6Wu06Q=; b=hfKY/spEx8pQzuYmLSdq9dv+ju
	EYFl2ED+zOu6Mv2khT5qlOwja516BIIBhqMT3r/zi9lu6hIsIuoUw0bMw9HjPvKUqrfV3uMAvnG1f
	h//f5x7xEABRlxHBwLGdCly3AewzeXENjeUblyU2y5wR72h6zRh6TTHV9QUOS4dxuGUTP7XtB6rYF
	8fkqXYfhcnQ0sZpGPcbt50Et/9WXTzGTSUOGp6srdNJQqx9taX0rm9HxRZzhEIGKHdFsyiZqwvQKY
	GbiXAbKL+HTKGvUNNuShKatS7IwrlDoy0NGqZjXaRH927d7WFo7U0oM1j8GX2hWmlIk17X+h6wZB6
	Cdhp5gOA==;
Date: Fri, 4 Aug 2023 21:01:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Li, Xin3" <xin3.li@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Lutomirski, Andy" <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Gross, Jurgen" <jgross@suse.com>,
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 1/1] x86/traps: Get rid of exception handlers' second
 argument error code
Message-ID: <20230804190120.GP212435@hirez.programming.kicks-ass.net>
References: <20230804075734.8372-1-xin3.li@intel.com>
 <20230804101321.GH214207@hirez.programming.kicks-ass.net>
 <SA1PR11MB67349385C20E8D3B0C960432A809A@SA1PR11MB6734.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB67349385C20E8D3B0C960432A809A@SA1PR11MB6734.namprd11.prod.outlook.com>

On Fri, Aug 04, 2023 at 05:35:11PM +0000, Li, Xin3 wrote:
> > > The IDT event delivery of X86_TRAP_DF, X86_TRAP_TS, X86_TRAP_NP,
> > > X86_TRAP_SS, X86_TRAP_GP, X86_TRAP_AC and X86_TRAP_CP pushes an error
> > > code into the orig_ax member of the pt_regs structure, and the error
> > > code is passed as the second argument of their C-handlers, although
> > > the pt_regs structure is already passed as the first argument.
> > >
> > > The asm entry code of such faults does the following
> > >
> > >   movq ORIG_RAX(%rsp), %rsi	/* get error code into 2nd argument*/
> > >   movq $-1, ORIG_RAX(%rsp)	/* no syscall to restart */
> > >
> > > to set the orig_ax member to -1 just before calling the C-handler.
> > >
> > > In addition, the IRQ entry code uses the second error code argument as
> > > its IRQ vector, as the IRQ asm entry code pushes its IRQ vector into
> > > the orig_ax member.
> > >
> > > The commit d99015b1abbad ("x86: move entry_64.S register saving out of
> > > the macros") introduced the changes to set orig_ax to -1, but I can't
> > > see why it's required. Our tests on x86_64 and x86_32 seem fine if
> > > orig_ax is left unchanged instead of set to -1.
> > 
> > That means that SYSCALL_NUM(regs) get to be garbage; or something like that.
> 
> I find SYSCALL_NUM(regs) in tools/testing/selftests/seccomp/seccomp_bpf.c,
> but nothing obvious to me.
> 
> I think it's clear that once exceptions and IRQs are handled, the original
> context will be fully recovered in a normal case.
> 
> Is it related to preemption after such a event?
> 
> I must have missed something; can you please elaborate it?

arch/x86/include/asm/syscall.h

syscall_get_nr() syscall_rollback()

