Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36964BBF09F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 20:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138346.1474067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qNP-0001F3-1o; Mon, 06 Oct 2025 18:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138346.1474067; Mon, 06 Oct 2025 18:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qNO-0001Bv-V6; Mon, 06 Oct 2025 18:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1138346;
 Mon, 06 Oct 2025 18:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLxi=4P=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1v5qNM-0001Bp-5h
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 18:56:01 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17f26b88-a2e6-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 20:55:59 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v5qNE-0000000032U-1idK; Mon, 06 Oct 2025 18:55:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 32E9B300212; Mon, 06 Oct 2025 20:55:53 +0200 (CEST)
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
X-Inumbo-ID: 17f26b88-a2e6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xJnkiQBZCdwaEp7zJFwkvtRIj+U9D3ctR20ZvgQtseA=; b=aNxeQASXnfJQhH8Kt1lDapgDuO
	/nLSwzuTyZczIZWbUw/GxPxulgAKifQX/YTBEcF2PpOgcA8zbdM08XCyICg5Re1UfO7w5ymPFmCP/
	n0FD5aka8eHWY/311/pPH43sSouBte46ZOQhJDA9CGOoKAfdLpb0KN/hMATIZTM7hF0vIg3yh5fiC
	dmLK6nRTRIyNI8e2gDDqXJobztx0Cz/g9DAUtnoQOElCjZWtE3G/d7m5AT6x9NpwKOYCYg+9GzCnm
	zm+BqJMijhENmoaaVUDk57dfyPtAOpGy6Bad3brAnuT3oj2wNt8IE/OKUAQ23YxGAQWrJVAi1AaTk
	ikxHoFow==;
Date: Mon, 6 Oct 2025 20:55:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 15/21] x86/xen: Drop xen_irq_ops
Message-ID: <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006074606.1266-16-jgross@suse.com>

On Mon, Oct 06, 2025 at 09:46:00AM +0200, Juergen Gross wrote:
> Instead of having a pre-filled array xen_irq_ops for Xen PV paravirt
> functions, drop the array and assign each element individually.

Same comment for the next few patches; this changelog is a little light
on *why*. I mean, I don't mind the change, but supposedly we should
justify things at least a little, right? :-)

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>  arch/x86/xen/irq.c    | 20 +++++++-------------
>  tools/objtool/check.c |  1 -
>  2 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
> index 39982f955cfe..d8678c3d3971 100644
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -40,20 +40,14 @@ static void xen_halt(void)
>  		xen_safe_halt();
>  }
>  
> -static const typeof(pv_ops) xen_irq_ops __initconst = {
> -	.irq = {
> -		/* Initial interrupt flag handling only called while interrupts off. */
> -		.save_fl = __PV_IS_CALLEE_SAVE(paravirt_ret0),
> -		.irq_disable = __PV_IS_CALLEE_SAVE(paravirt_nop),
> -		.irq_enable = __PV_IS_CALLEE_SAVE(BUG_func),
> -
> -		.safe_halt = xen_safe_halt,
> -		.halt = xen_halt,
> -	},
> -};
> -
>  void __init xen_init_irq_ops(void)
>  {
> -	pv_ops.irq = xen_irq_ops.irq;
> +	/* Initial interrupt flag handling only called while interrupts off. */
> +	pv_ops.irq.save_fl = __PV_IS_CALLEE_SAVE(paravirt_ret0);
> +	pv_ops.irq.irq_disable = __PV_IS_CALLEE_SAVE(paravirt_nop);
> +	pv_ops.irq.irq_enable = __PV_IS_CALLEE_SAVE(BUG_func);
> +	pv_ops.irq.safe_halt = xen_safe_halt;
> +	pv_ops.irq.halt = xen_halt;
> +
>  	x86_init.irqs.intr_init = xen_init_IRQ;
>  }
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index a72059fcbc83..d66eb37ff294 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -593,7 +593,6 @@ static int init_pv_ops(struct objtool_file *file)
>  	static const char *pv_ops_tables[] = {
>  		"pv_ops",
>  		"xen_cpu_ops",
> -		"xen_irq_ops",
>  		"xen_mmu_ops",
>  		NULL,
>  	};
> -- 
> 2.51.0
> 

