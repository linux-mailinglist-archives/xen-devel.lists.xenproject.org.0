Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10279637DAD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 17:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448001.704739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFGD-0003ZZ-4C; Thu, 24 Nov 2022 16:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448001.704739; Thu, 24 Nov 2022 16:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFGD-0003Wg-0j; Thu, 24 Nov 2022 16:39:37 +0000
Received: by outflank-mailman (input) for mailman id 448001;
 Thu, 24 Nov 2022 16:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4qOg=3Y=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1oyFGB-0003WZ-5g
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 16:39:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93036ac4-6c16-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 17:39:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 363F0B82839;
 Thu, 24 Nov 2022 16:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C5C433C1;
 Thu, 24 Nov 2022 16:39:30 +0000 (UTC)
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
X-Inumbo-ID: 93036ac4-6c16-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669307970;
	bh=OKXY4HOb6tjr1fLTcQMjreoqibQdHiqlX3XPx/NKo9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FF5BWWm70I4oWNIABZDD5ZpFGtfi4xlErQuLbHrchom/bIyjGAbpEMOYVG8rmdXq2
	 6wd7icEHORG3GbzZLud50WsU3LCUvSdfENs1JIYho+TKFacLC+WjnL1qKGuIOziaV6
	 cr14plP3s5Mqnfve1ScQR/NMHdIfZXrlbW6pCyCBrO45F+TD2H29FP7OmVrMnmx+37
	 0pMTWSW3bm/1D/YVt6SapbZaIjNc/Zz8CFvYh3Fs5kmEv8gpsy4teGGd6pXgMcI9Nl
	 spWVSqEETTY2dJ2LUJz7/jgvHdy33n1dmdw+EojgYr23nC6zfKtA1q+kezQE3v0DYe
	 8cBAfQH4M+MfA==
Date: Thu, 24 Nov 2022 08:39:28 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: objtool warning for next-20221118
Message-ID: <20221124163928.dof5ldfer6rswlnx@treble>
References: <20221121145215.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221122051605.4hcbslwxez2trdvt@treble>
 <Y3yJxQJ9DwxTx7km@hirez.programming.kicks-ass.net>
 <20221123012350.kelmmadh65lyswqz@treble>
 <Y33gAiFP2IpVdxJu@hirez.programming.kicks-ass.net>
 <2255c45f-d8ba-3f32-9d99-737ad3040dd7@citrix.com>
 <20221123170337.keacggyvn4ykbtsw@treble>
 <20221124023934.nft3udxelth4lvai@treble>
 <72a4871b-3ee8-42c1-912a-321a45690428@suse.com>
 <68dc479a-6b61-0012-888d-c1b4cc513cdb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68dc479a-6b61-0012-888d-c1b4cc513cdb@suse.com>

On Thu, Nov 24, 2022 at 08:47:47AM +0100, Juergen Gross wrote:
> > > +++ b/arch/x86/xen/smp_pv.c
> > > @@ -385,17 +385,9 @@ static void xen_pv_play_dead(void) /* used only
> > > with HOTPLUG_CPU */
> > >   {
> > >       play_dead_common();
> > >       HYPERVISOR_vcpu_op(VCPUOP_down, xen_vcpu_nr(smp_processor_id()), NULL);
> > > -    cpu_bringup();
> > > -    /*
> > > -     * commit 4b0c0f294 (tick: Cleanup NOHZ per cpu data on cpu down)
> > > -     * clears certain data that the cpu_idle loop (which called us
> > > -     * and that we return from) expects. The only way to get that
> > > -     * data back is to call:
> > > -     */
> > > -    tick_nohz_idle_enter();
> > > -    tick_nohz_idle_stop_tick_protected();
> > > -    cpuhp_online_idle(CPUHP_AP_ONLINE_IDLE);
> > > +    /* FIXME: converge cpu_bringup_and_idle() and start_secondary() */
> > > +    cpu_bringup_and_idle();
> > 
> > I think this will leak stack memory. Multiple cpu offline/online cycles of
> > the same cpu will finally exhaust the idle stack.

Doh!  Of course...

I was actually thinking ahead, to where eventually xen_pv_play_dead()
can call start_cpu0(), which can be changed to automatically reset the
stack pointer like this:

SYM_CODE_START(start_cpu0)
	ANNOTATE_NOENDBR
	UNWIND_HINT_EMPTY
	movq	PER_CPU_VAR(pcpu_hot + X86_top_of_stack), %rax
	leaq	-PTREGS_SIZE(%rax), %rsp
	jmp	.Ljump_to_C_code
SYM_CODE_END(start_cpu0)

but that would only be possible be after more cleanups which converge
cpu_bringup_and_idle() with start_secondary().

> The attached patch seems to work fine.

The patch looks good to me.

It doesn't solve Paul's original issue where arch_cpu_idle_dead() needs
to be __noreturn.  But that should probably be a separate patch anyway.

> The __noreturn annotation seems to trigger an objtool warning, though, in
> spite of the added BUG() at the end of xen_pv_play_dead():
>
> arch/x86/xen/smp_pv.o: warning: objtool: xen_pv_play_dead() falls through to
> next function xen_pv_cpu_die()

You'll need to tell objtool that xen_cpu_bringup_again() is noreturn by
adding "xen_cpu_bringup_again" to global_noreturns[] in
tools/objtool/check.c.

(Yes it's a pain, I'll be working an improved solution to the noreturn
thing...)

-- 
Josh

