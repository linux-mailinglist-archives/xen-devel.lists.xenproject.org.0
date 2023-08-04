Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4C76FE3A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577069.903911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRroc-000757-Dk; Fri, 04 Aug 2023 10:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577069.903911; Fri, 04 Aug 2023 10:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRroc-00072j-B5; Fri, 04 Aug 2023 10:13:50 +0000
Received: by outflank-mailman (input) for mailman id 577069;
 Fri, 04 Aug 2023 10:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xMif=DV=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qRroY-00072d-U4
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:13:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a5c82e-32af-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 12:13:44 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qRroA-009Hn5-6s; Fri, 04 Aug 2023 10:13:22 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 400A730020C;
 Fri,  4 Aug 2023 12:13:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1F03F2107C447; Fri,  4 Aug 2023 12:13:21 +0200 (CEST)
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
X-Inumbo-ID: 95a5c82e-32af-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GYK9+OGfxviHr18NI+B7bkONaqcCERrPUSZDWZMRPEQ=; b=Si4qEE3c+HJrS2LkWUpXkEpwIY
	z2QG84d95tw+UddPI6rUzadRriq2PDZYJ6XXgw1x4zVAysI26DpGR+v731iLeXUZpRG2lgIbPY72I
	85Z6xFBogTIWFnZfNZ3S5QtL+ki4RcsOQiafmnH+Ad4fikMc2BFW263jmaF+Yq1RI6wmtI2QFGM9e
	ynZc/AAqQWPF0jP6VORFQ68/nqLS5sz5Lw9voBgJBLLNR9+ghPabvhaxhVI/lrVi2pG/Art4rrfjP
	Ipm/2XkF12gk117ch8cTn0cq83XETEzdbxKMmrQET7kTOkjlN6SKIYhgKMGA8v/MhBhxLtLPW2cf8
	KqI33mSw==;
Date: Fri, 4 Aug 2023 12:13:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 1/1] x86/traps: Get rid of exception handlers' second
 argument error code
Message-ID: <20230804101321.GH214207@hirez.programming.kicks-ass.net>
References: <20230804075734.8372-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804075734.8372-1-xin3.li@intel.com>

On Fri, Aug 04, 2023 at 12:57:34AM -0700, Xin Li wrote:
> The IDT event delivery of X86_TRAP_DF, X86_TRAP_TS, X86_TRAP_NP,
> X86_TRAP_SS, X86_TRAP_GP, X86_TRAP_AC and X86_TRAP_CP pushes an error
> code into the orig_ax member of the pt_regs structure, and the error
> code is passed as the second argument of their C-handlers, although
> the pt_regs structure is already passed as the first argument.
> 
> The asm entry code of such faults does the following
> 
>   movq ORIG_RAX(%rsp), %rsi	/* get error code into 2nd argument*/
>   movq $-1, ORIG_RAX(%rsp)	/* no syscall to restart */
> 
> to set the orig_ax member to -1 just before calling the C-handler.
> 
> In addition, the IRQ entry code uses the second error code argument
> as its IRQ vector, as the IRQ asm entry code pushes its IRQ vector
> into the orig_ax member.
> 
> The commit d99015b1abbad ("x86: move entry_64.S register saving out of
> the macros") introduced the changes to set orig_ax to -1, but I can't
> see why it's required. Our tests on x86_64 and x86_32 seem fine if
> orig_ax is left unchanged instead of set to -1.

That means that SYSCALL_NUM(regs) get to be garbage; or something like
that.

