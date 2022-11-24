Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A5637091
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 03:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447742.704317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy29P-000524-64; Thu, 24 Nov 2022 02:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447742.704317; Thu, 24 Nov 2022 02:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy29P-00050L-12; Thu, 24 Nov 2022 02:39:43 +0000
Received: by outflank-mailman (input) for mailman id 447742;
 Thu, 24 Nov 2022 02:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4qOg=3Y=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1oy29N-00050F-9R
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 02:39:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1d5e6e-6ba1-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 03:39:39 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D5EA61FC3;
 Thu, 24 Nov 2022 02:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54220C433C1;
 Thu, 24 Nov 2022 02:39:36 +0000 (UTC)
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
X-Inumbo-ID: 3d1d5e6e-6ba1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669257576;
	bh=v/MVsTswqTV6pYQHqN9mCNsFiduQhw05EJKbm6J8B9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqnAV5JxjBhMTnqY+nsEdkJAdIqMvZR6VuuOrh2h8I9tTjoLWtiHgBBOY2p/LTeO5
	 3YNbf4WRvW0FihD+OMLoGtrv+IGs1wE9PkexlM6ybOshYiULCYuLx+FuabWE0Qn2VR
	 tsZTzMZFV7QQGp3alstflhnff41Gqilqe4MxebM3kFf1PwF1ILeZMwVv1V3zrf1hBn
	 yEpi21i7a8rhnjF21bqIGrM/b2+T1HTYE7U5KMWUw25bH9izmkcy2yVOVUenrEXXpL
	 6zOCT7RrE95YnQ7bEHjtOLm2IfSv2A+USxLAuH4UPXotiUB7Tm9MdiiIcF+nqu9aeR
	 oJ9CfKu49phXA==
Date: Wed, 23 Nov 2022 18:39:34 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: objtool warning for next-20221118
Message-ID: <20221124023934.nft3udxelth4lvai@treble>
References: <20221121040736.GA3738360@paulmck-ThinkPad-P17-Gen-1>
 <Y3thrQxfcvZSXFlr@hirez.programming.kicks-ass.net>
 <20221121145215.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221122051605.4hcbslwxez2trdvt@treble>
 <Y3yJxQJ9DwxTx7km@hirez.programming.kicks-ass.net>
 <20221123012350.kelmmadh65lyswqz@treble>
 <Y33gAiFP2IpVdxJu@hirez.programming.kicks-ass.net>
 <2255c45f-d8ba-3f32-9d99-737ad3040dd7@citrix.com>
 <20221123170337.keacggyvn4ykbtsw@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123170337.keacggyvn4ykbtsw@treble>

On Wed, Nov 23, 2022 at 09:03:40AM -0800, Josh Poimboeuf wrote:
> On Wed, Nov 23, 2022 at 10:52:09AM +0000, Andrew Cooper wrote:
> > > Well, if you return from arch_cpu_idle_dead() you're back in the idle
> > > loop -- exactly where you would be if you were to bootstrap the whole
> > > CPU -- provided you have it remember the whole state (easier with a
> > > vCPU).
> 
> play_dead() really needs sane semantics.  Not only does it introduce a
> surprise to the offlining code in do_idle(), it also skips the entire
> hotplug state machine.  Not sure if that introduces any bugs, but at the
> very least it's subtle and surprising.
> 
> > > But maybe I'm missing something, lets add Xen folks on.
> > 
> > Calling VCPUOP_down on oneself always succeeds, but all it does is
> > deschedule the vCPU.
> > 
> > It can be undone at a later point by a different vcpu issuing VCPUOP_up
> > against the previously-downed CPU, at which point the vCPU gets rescheduled.
> > 
> > This is why the VCPUOP_down hypercall returns normally.  All state
> > really is intact.
> > 
> > As for what Linux does, this is how xen_pv_cpu_up() currently behaves. 
> > If you want to make Xen behave more everything else, then bug a BUG()
> > after VCPUOP_down, and adjust xen_pv_cpu_up() to skip its initialised
> > check and always use VCPUOP_initialise to bring the vCPU back online.
> 
> Or we could do what sev_es_play_dead() does and just call start_cpu0()
> after the hypercall returns?

Something like so (untested).  This is only the x86 bits.

I think I convinced myself that start_cpu0() isn't buggy.  I'm looking
at other cleanups, e.g. converging cpu_bringup_and_idle() with
start_secondary().

I can pick it up again next week, post-turkey.

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index b4dbb20dab1a..e6d1d2810e38 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -93,9 +93,10 @@ static inline void __cpu_die(unsigned int cpu)
 	smp_ops.cpu_die(cpu);
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	smp_ops.play_dead();
+	BUG();
 }
 
 static inline void smp_send_reschedule(int cpu)
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 26e8f57c75ad..8e2841deb1eb 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -700,7 +700,7 @@ EXPORT_SYMBOL(boot_option_idle_override);
 static void (*x86_idle)(void);
 
 #ifndef CONFIG_SMP
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55cad72715d9..d8b12ac1a7c5 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1833,9 +1833,12 @@ void native_play_dead(void)
 	play_dead_common();
 	tboot_shutdown(TB_SHUTDOWN_WFS);
 
-	mwait_play_dead();	/* Only returns on failure */
+	mwait_play_dead();	/* Only returns if mwait is not supported */
+
 	if (cpuidle_play_dead())
 		hlt_play_dead();
+
+	BUG();
 }
 
 #else /* ... !CONFIG_HOTPLUG_CPU */
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 480be82e9b7b..30dc904ca990 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -385,17 +385,9 @@ static void xen_pv_play_dead(void) /* used only with HOTPLUG_CPU */
 {
 	play_dead_common();
 	HYPERVISOR_vcpu_op(VCPUOP_down, xen_vcpu_nr(smp_processor_id()), NULL);
-	cpu_bringup();
-	/*
-	 * commit 4b0c0f294 (tick: Cleanup NOHZ per cpu data on cpu down)
-	 * clears certain data that the cpu_idle loop (which called us
-	 * and that we return from) expects. The only way to get that
-	 * data back is to call:
-	 */
-	tick_nohz_idle_enter();
-	tick_nohz_idle_stop_tick_protected();
 
-	cpuhp_online_idle(CPUHP_AP_ONLINE_IDLE);
+	/* FIXME: converge cpu_bringup_and_idle() and start_secondary() */
+	cpu_bringup_and_idle();
 }
 
 #else /* !CONFIG_HOTPLUG_CPU */
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 314802f98b9d..7fbbd1572288 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -185,7 +185,7 @@ void arch_cpu_idle(void);
 void arch_cpu_idle_prepare(void);
 void arch_cpu_idle_enter(void);
 void arch_cpu_idle_exit(void);
-void arch_cpu_idle_dead(void);
+void __noreturn arch_cpu_idle_dead(void);
 
 int cpu_report_state(int cpu);
 int cpu_check_up_prepare(int cpu);
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index f26ab2675f7d..097afe98e53e 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -71,7 +71,7 @@ static noinline int __cpuidle cpu_idle_poll(void)
 void __weak arch_cpu_idle_prepare(void) { }
 void __weak arch_cpu_idle_enter(void) { }
 void __weak arch_cpu_idle_exit(void) { }
-void __weak arch_cpu_idle_dead(void) { }
+void __weak __noreturn arch_cpu_idle_dead(void) { BUG(); }
 void __weak arch_cpu_idle(void)
 {
 	cpu_idle_force_poll = 1;

