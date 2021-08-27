Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B23F9180
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173256.316176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCi-0002L0-GX; Fri, 27 Aug 2021 00:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173256.316176; Fri, 27 Aug 2021 00:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCi-00026K-3G; Fri, 27 Aug 2021 00:58:44 +0000
Received: by outflank-mailman (input) for mailman id 173256;
 Fri, 27 Aug 2021 00:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZ1t=NS=flex--seanjc.bounces.google.com=3gjgoYQYKCaMVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@srs-us1.protection.inumbo.net>)
 id 1mJQBr-0001Ok-Gb
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:57:51 +0000
Received: from mail-qk1-x74a.google.com (unknown [2607:f8b0:4864:20::74a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 610a2fc4-60b5-4db5-a642-08feb4db275e;
 Fri, 27 Aug 2021 00:57:38 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id
 d202-20020a3768d3000000b003d30722c98fso2434520qkc.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:38 -0700 (PDT)
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
X-Inumbo-ID: 610a2fc4-60b5-4db5-a642-08feb4db275e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=7WpldovdtqBjPyUEkww2XiVMcgw0iocdpFhT3fL9Y/E=;
        b=fgDxSxTGTxcZLWwdesQTHrLRjD48WNg8cXGu/5JrJXiO1lVZNcp1mJi1KnKIamoUIb
         GUG8jeA412h0q7WsWgcUMG9CfTqF/7lbyUHH3CZvO1OjwSOjAze/zxZOCD4XiOHY2vOg
         ZCWJG+tM9Q4MHZrfySnWFFnlm5S90oVlRjLiaugYI/2lPWiqDzv3nfIPXhy7Ca8xvfgg
         X3UHfVEYDtxZC7ZyDhLnFUlHOhDlqL09y4XS39FuuYOKJH+x2JAvhFvXscuMtwc/X5A9
         NOLbM318OIpQ2G7/g+etioE3kJRbZ/bYAvBYfY38LpHgCH+BIfcvqB1GyewBrxueUUcA
         RPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=7WpldovdtqBjPyUEkww2XiVMcgw0iocdpFhT3fL9Y/E=;
        b=GmlBtvPwGoMcWqwKyVFqFwG6SFHHQcDQZst9azNvuJ0OJrR+2s6sucmskvm/Sb0yRq
         KHSWPW+aDnjIG+JlUtsacfzDzE6zZXvYFSq5aXEWWLU9aQo3rXlNBTC6b49ggHD+6uTo
         Eep96TqLo4zBt8zTK5Gdenk61qIu+3p0KE0LRN3XNN4yRf99OzpW0xxxpBGaQAxRBwhB
         ZUdVtiGKjjCfZRho1QYGRiExneMTECpNiGnbeEzSktrkcMIjF8/DO/AnK16suyv7qaGF
         nimBq4ANXnl1X1V3WyFAWeCUnzwyzIkbC50xgsABrRm63tsMOJX+XPC58e+fy03YoAfP
         vOkg==
X-Gm-Message-State: AOAM532eHX5skB/ncogVRBFNrbSiIGswJBXRC2vE3vPrpDZQm2aZPerI
	IxKbQKHDJxscT0eyMTJO7JZy9l41LpI=
X-Google-Smtp-Source: ABdhPJy/Z8J/7Ce+UZRUTjxGB4/tm5OJ2fdY2ZzHJtwz3NXqGQKt+XYwzsRhryc5v6fwBU31D6XFJg8/ijw=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:29cd:: with SMTP id
 gh13mr7215357qvb.25.1630025858489; Thu, 26 Aug 2021 17:57:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:07 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-5-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 04/15] perf: Force architectures to opt-in to guest callbacks
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
	Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Introduce HAVE_GUEST_PERF_EVENTS and require architectures to select it
to allow register guest callbacks in perf.  Future patches will convert
the callbacks to per-CPU definitions.  Rather than churn a bunch of arch
code (that was presumably copy+pasted from x86), remove it wholesale as
it's useless and at best wasting cycles.

Wrap even the stubs with an #ifdef to avoid an arch sneaking in a bogus
registration with CONFIG_PERF_EVENTS=n.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm/kernel/perf_callchain.c   | 28 ++++------------------------
 arch/arm64/Kconfig                 |  1 +
 arch/csky/kernel/perf_callchain.c  | 10 ----------
 arch/nds32/kernel/perf_event_cpu.c | 29 ++++-------------------------
 arch/riscv/kernel/perf_callchain.c | 10 ----------
 arch/x86/Kconfig                   |  1 +
 include/linux/perf_event.h         |  4 ++++
 init/Kconfig                       |  3 +++
 kernel/events/core.c               |  2 ++
 9 files changed, 19 insertions(+), 69 deletions(-)

diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 3b69a76d341e..bc6b246ab55e 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -64,11 +64,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs
 {
 	struct frame_tail __user *tail;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ARM_pc);
 
 	if (!current->mm)
@@ -100,20 +95,12 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 {
 	struct stackframe fr;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
@@ -121,17 +108,10 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	int misc = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	if (user_mode(regs))
+		misc |= PERF_RECORD_MISC_USER;
+	else
+		misc |= PERF_RECORD_MISC_KERNEL;
 
 	return misc;
 }
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5b13a932561..72a201a686c5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -190,6 +190,7 @@ config ARM64
 	select HAVE_NMI
 	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_GUEST_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
index ab55e98ee8f6..92057de08f4f 100644
--- a/arch/csky/kernel/perf_callchain.c
+++ b/arch/csky/kernel/perf_callchain.c
@@ -88,10 +88,6 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	unsigned long fp = 0;
 
-	/* C-SKY does not support virtualization. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->regs[4];
 	perf_callchain_store(entry, regs->pc);
 
@@ -112,12 +108,6 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe fr;
 
-	/* C-SKY does not support virtualization. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		pr_warn("C-SKY does not support perf in guest mode!");
-		return;
-	}
-
 	fr.fp = regs->regs[4];
 	fr.lr = regs->lr;
 	walk_stackframe(&fr, entry);
diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
index 0ce6f9f307e6..a78a879e7ef1 100644
--- a/arch/nds32/kernel/perf_event_cpu.c
+++ b/arch/nds32/kernel/perf_event_cpu.c
@@ -1371,11 +1371,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 
 	leaf_fp = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ipc);
 	fp = regs->fp;
 	gp = regs->gp;
@@ -1481,10 +1476,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe fr;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
 	fr.fp = regs->fp;
 	fr.lp = regs->lp;
 	fr.sp = regs->sp;
@@ -1493,10 +1484,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	/* However, NDS32 does not support virtualization */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
@@ -1504,18 +1491,10 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	int misc = 0;
 
-	/* However, NDS32 does not support virtualization */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	if (user_mode(regs))
+		misc |= PERF_RECORD_MISC_USER;
+	else
+		misc |= PERF_RECORD_MISC_KERNEL;
 
 	return misc;
 }
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 0bb1854dce83..1fc075b8f764 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -58,10 +58,6 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	unsigned long fp = 0;
 
-	/* RISC-V does not support perf in guest mode. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->s0;
 	perf_callchain_store(entry, regs->epc);
 
@@ -78,11 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	/* RISC-V does not support perf in guest mode. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		pr_warn("RISC-V does not support perf in guest mode!");
-		return;
-	}
-
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 49270655e827..a4de4aa7a3df 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -229,6 +229,7 @@ config X86
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select HAVE_GUEST_PERF_EVENTS
 	select HAVE_PCI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 05c0efba3cd1..5eab690622ca 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1236,9 +1236,11 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 enum perf_bpf_event_type type,
 				 u16 flags);
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
+#endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
@@ -1481,9 +1483,11 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
 static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 static inline void perf_register_guest_info_callbacks
 (struct perf_guest_info_callbacks *callbacks)				{ }
 static inline void perf_unregister_guest_info_callbacks(void)		{ }
+#endif
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
 
diff --git a/init/Kconfig b/init/Kconfig
index 55f9f7738ebb..9ef51ae53977 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1776,6 +1776,9 @@ config HAVE_PERF_EVENTS
 	help
 	  See tools/perf/design.txt for details.
 
+config HAVE_GUEST_PERF_EVENTS
+	bool
+
 config PERF_USE_VMALLOC
 	bool
 	help
diff --git a/kernel/events/core.c b/kernel/events/core.c
index baae796612b9..9820df7ee455 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,6 +6482,7 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
@@ -6495,6 +6496,7 @@ void perf_unregister_guest_info_callbacks(void)
 	perf_guest_cbs = NULL;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+#endif
 
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
-- 
2.33.0.259.gc128427fd7-goog


