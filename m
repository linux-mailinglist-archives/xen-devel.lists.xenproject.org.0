Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3040263FD0B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 01:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451319.709007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ttu-0007w1-TG; Fri, 02 Dec 2022 00:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451319.709007; Fri, 02 Dec 2022 00:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ttu-0007tz-QU; Fri, 02 Dec 2022 00:27:34 +0000
Received: by outflank-mailman (input) for mailman id 451319;
 Fri, 02 Dec 2022 00:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9ZM=4A=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1p0ttt-0007tt-JY
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 00:27:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c03c021-71d8-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 01:27:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C851B82042;
 Fri,  2 Dec 2022 00:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53B2C433D7;
 Fri,  2 Dec 2022 00:27:29 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 6F2CA5C05F8; Thu,  1 Dec 2022 16:27:29 -0800 (PST)
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
X-Inumbo-ID: 1c03c021-71d8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669940849;
	bh=4+GONiQ/AgWXJflOZcfrIazckOnz8zEYC5LwIR4qzFc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=m786yjpMnIlWcyF2c7wB/JwsF4E0aqByzi7s9gXXFXe1qB87EBBjNJ5o/Y560Mr8h
	 V2yN9iVKRVtAJmHzAkW43rHlvxHQupPfcFjAiSOurJu+zzm5xc0dFY4P386NhqNY1F
	 R9b+8ci6ZHl5/eN4YtRlLQ+IFaeHb1Rud5+Y+cqfqMDWz0ApuMyB5Uak1MqGBfv1Qo
	 81GkScrta0ugxe6AUMqBgKidrnIFIi7cqVL+cm4uFz2AdTgzE/wdjmi1I6Wg9d/ZPW
	 WThf7Do16BmM8PFTbNVADSrdYC7lEWhCMYUJ7bFlfVKjnIRObMPdHknYeMrrqUezja
	 cSnJhm01KP/kg==
Date: Thu, 1 Dec 2022 16:27:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: objtool warning for next-20221118
Message-ID: <20221202002729.GA1524469@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221123012350.kelmmadh65lyswqz@treble>
 <Y33gAiFP2IpVdxJu@hirez.programming.kicks-ass.net>
 <2255c45f-d8ba-3f32-9d99-737ad3040dd7@citrix.com>
 <20221123170337.keacggyvn4ykbtsw@treble>
 <20221124023934.nft3udxelth4lvai@treble>
 <72a4871b-3ee8-42c1-912a-321a45690428@suse.com>
 <68dc479a-6b61-0012-888d-c1b4cc513cdb@suse.com>
 <20221124163928.dof5ldfer6rswlnx@treble>
 <d047c478-d905-7022-0caa-c9b7b0780823@suse.com>
 <20221129195655.GA826794@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221129195655.GA826794@paulmck-ThinkPad-P17-Gen-1>

On Tue, Nov 29, 2022 at 11:56:55AM -0800, Paul E. McKenney wrote:
> On Fri, Nov 25, 2022 at 06:30:35AM +0100, Juergen Gross wrote:
> > On 24.11.22 17:39, Josh Poimboeuf wrote:
> > > On Thu, Nov 24, 2022 at 08:47:47AM +0100, Juergen Gross wrote:
> > > > > > +++ b/arch/x86/xen/smp_pv.c
> > > > > > @@ -385,17 +385,9 @@ static void xen_pv_play_dead(void) /* used only
> > > > > > with HOTPLUG_CPU */
> > > > > >    {
> > > > > >        play_dead_common();
> > > > > >        HYPERVISOR_vcpu_op(VCPUOP_down, xen_vcpu_nr(smp_processor_id()), NULL);
> > > > > > -    cpu_bringup();
> > > > > > -    /*
> > > > > > -     * commit 4b0c0f294 (tick: Cleanup NOHZ per cpu data on cpu down)
> > > > > > -     * clears certain data that the cpu_idle loop (which called us
> > > > > > -     * and that we return from) expects. The only way to get that
> > > > > > -     * data back is to call:
> > > > > > -     */
> > > > > > -    tick_nohz_idle_enter();
> > > > > > -    tick_nohz_idle_stop_tick_protected();
> > > > > > -    cpuhp_online_idle(CPUHP_AP_ONLINE_IDLE);
> > > > > > +    /* FIXME: converge cpu_bringup_and_idle() and start_secondary() */
> > > > > > +    cpu_bringup_and_idle();
> > > > > 
> > > > > I think this will leak stack memory. Multiple cpu offline/online cycles of
> > > > > the same cpu will finally exhaust the idle stack.
> > > 
> > > Doh!  Of course...
> > > 
> > > I was actually thinking ahead, to where eventually xen_pv_play_dead()
> > > can call start_cpu0(), which can be changed to automatically reset the
> > > stack pointer like this:
> > > 
> > > SYM_CODE_START(start_cpu0)
> > > 	ANNOTATE_NOENDBR
> > > 	UNWIND_HINT_EMPTY
> > > 	movq	PER_CPU_VAR(pcpu_hot + X86_top_of_stack), %rax
> > > 	leaq	-PTREGS_SIZE(%rax), %rsp
> > > 	jmp	.Ljump_to_C_code
> > > SYM_CODE_END(start_cpu0)
> > > 
> > > but that would only be possible be after more cleanups which converge
> > > cpu_bringup_and_idle() with start_secondary().
> > > 
> > > > The attached patch seems to work fine.
> > > 
> > > The patch looks good to me.
> > > 
> > > It doesn't solve Paul's original issue where arch_cpu_idle_dead() needs
> > > to be __noreturn.  But that should probably be a separate patch anyway.
> > 
> > Okay, I'll split this off.
> > 
> > > 
> > > > The __noreturn annotation seems to trigger an objtool warning, though, in
> > > > spite of the added BUG() at the end of xen_pv_play_dead():
> > > > 
> > > > arch/x86/xen/smp_pv.o: warning: objtool: xen_pv_play_dead() falls through to
> > > > next function xen_pv_cpu_die()
> > > 
> > > You'll need to tell objtool that xen_cpu_bringup_again() is noreturn by
> > > adding "xen_cpu_bringup_again" to global_noreturns[] in
> > > tools/objtool/check.c.
> > 
> > Ah, okay. Will do that.
> > 
> > > (Yes it's a pain, I'll be working an improved solution to the noreturn
> > > thing...)
> > 
> > Should be fairly easy, no?
> > 
> > "Just" extend the __noreturn macro to put the function into a ".text.noreturn"
> > section, which can be handled in a special way by objtool. This would need
> > an __init_noreturn macro, of course, for a ".init.text.noreturn" section.
> 
> And in last night's -next run, that diagnostic was gone!
> 
> But of course another appeared in its place:
> 
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: check_relocations+0xd1: stack state mismatch: cfa1=4+32 cfa2=-1+0
> 
> The .config file is shown below.  Thoughts?

And it is back.  Which makes no sense, but there it is.

							Thanx, Paul

