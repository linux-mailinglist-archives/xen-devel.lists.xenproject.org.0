Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BC5955CC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 11:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388107.624679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsUg-00030x-D3; Tue, 16 Aug 2022 09:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388107.624679; Tue, 16 Aug 2022 09:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsUg-0002xx-9J; Tue, 16 Aug 2022 09:04:14 +0000
Received: by outflank-mailman (input) for mailman id 388107;
 Tue, 16 Aug 2022 09:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/fw=YU=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oNsUd-0002xr-TR
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 09:04:12 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 638cccd1-1d42-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 11:04:10 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oNsUL-002uhh-D6; Tue, 16 Aug 2022 09:03:55 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8A763980163; Tue, 16 Aug 2022 11:03:52 +0200 (CEST)
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
X-Inumbo-ID: 638cccd1-1d42-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N3rr8Ih/OydanFv1CV/YUpYdg2xo/RO8uoYUBb7azUE=; b=NeI5iJNKMM5exB1dec5OXgnxuR
	IjrRsj1TQ/c1iNcZdivLGlMbNMXyssN41VvmWeI8YNYt2AfMpXSs1ldnjmoL/hXXGcAwZf6Pj4Sgy
	QvR/TF/nsr9wYQYgSoW2PFLeHhWHEVxK5xQWhiJD3jjysvXRm+NNUbup2wNjDfv2yVlhNTZvGogAq
	yKlKCb7gAeHrxfvs+Qto/Uzjnad3oKmifKdSBvhSV4TP7dHUa+1MmhPkOH7SAdtMfv3pKJjbeTN6f
	1k/fIwntE3/ao9NgFoXj+HuJM5xlV2xaof+6kEv4TKRKF+LSb1Mx685frlfLVJGzhq6f+8HB4bbGn
	IlMHL/ww==;
Date: Tue, 16 Aug 2022 11:03:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH] x86/entry: fix entry_INT80_compat for Xen PV guests
Message-ID: <YvtdeNYtBdSsNqWV@worktop.programming.kicks-ass.net>
References: <20220816071137.4893-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816071137.4893-1-jgross@suse.com>

On Tue, Aug 16, 2022 at 09:11:37AM +0200, Juergen Gross wrote:
> Commit c89191ce67ef ("x86/entry: Convert SWAPGS to swapgs and remove
> the definition of SWAPGS") missed one use case of SWAPGS in
> entry_INT80_compat. Removing of the SWAPGS macro led to asm just
> using "swapgs", as it is accepting instructions in capital letters,
> too.
> 
> This in turn leads to splats in Xen PV guests like:
> 
> [   36.145223] general protection fault, maybe for address 0x2d: 0000 [#1] PREEMPT SMP NOPTI
> [   36.145794] CPU: 2 PID: 1847 Comm: ld-linux.so.2 Not tainted 5.19.1-1-default #1 openSUSE Tumbleweed f3b44bfb672cdb9f235aff53b57724eba8b9411b
> [   36.146608] Hardware name: HP ProLiant ML350p Gen8, BIOS P72 11/14/2013
> [   36.148126] RIP: e030:entry_INT80_compat+0x3/0xa3
> 
> Fix that by open coding this single instance of the SWAPGS macro.
> 
> Cc: <stable@vger.kernel.org> # 5.19
> Fixes: c89191ce67ef ("x86/entry: Convert SWAPGS to swapgs and remove the definition of SWAPGS")
> Signed-off-by: Juergen Gross <jgross@suse.com>

It's a little unfortunate int80 is different from the other compat entry
points, but that's life I suppose.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  arch/x86/entry/entry_64_compat.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
> index 682338e7e2a3..4dd19819053a 100644
> --- a/arch/x86/entry/entry_64_compat.S
> +++ b/arch/x86/entry/entry_64_compat.S
> @@ -311,7 +311,7 @@ SYM_CODE_START(entry_INT80_compat)
>  	 * Interrupts are off on entry.
>  	 */
>  	ASM_CLAC			/* Do this early to minimize exposure */
> -	SWAPGS
> +	ALTERNATIVE "swapgs", "", X86_FEATURE_XENPV
>  
>  	/*
>  	 * User tracing code (ptrace or signal handlers) might assume that
> -- 
> 2.35.3
> 

