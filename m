Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B63F9182
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173258.316184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCj-0002aL-1q; Fri, 27 Aug 2021 00:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173258.316184; Fri, 27 Aug 2021 00:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCi-0002Jl-Ob; Fri, 27 Aug 2021 00:58:44 +0000
Received: by outflank-mailman (input) for mailman id 173258;
 Fri, 27 Aug 2021 00:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/N7=NS=flex--seanjc.bounces.google.com=3hDgoYQYKCaUXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@srs-us1.protection.inumbo.net>)
 id 1mJQBw-0001Ok-Gd
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:57:56 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa703dfe-16e9-43fa-a35e-5221fbb173a4;
 Fri, 27 Aug 2021 00:57:41 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 v126-20020a254884000000b005991fd2f912so4925770yba.20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:41 -0700 (PDT)
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
X-Inumbo-ID: aa703dfe-16e9-43fa-a35e-5221fbb173a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=/GNsXDXGxvkLYn64hGgFQXgQU/jMUClIrsjFgTViz1Y=;
        b=tRvkfbrGw8+v7Lr3XLUmzwVcxzAbAizvlsAktjoSUGPxvViNrp9xpwsT+0jULLS0XQ
         QBNR07zqN8UHtCl5MQ4ti3SFRSDkyOQMWk/4FAKgjY0ERaJLZ7e6gc8JstfsQpjdP8pN
         v4l1BG+uDjmM2Bi4xrpkbB1gpGDLl7c4sM4zXvgYmcAkI8bj70Vi0WRIULATvW29c86P
         +1i26kA7dY0yY0Q112IpUA7udaIzNtFpo5eE00IcdfbT6SvKww5RR5G9/2iwQ3ltt6VI
         10Wa1Y40Ho9VSOkSxhKZNCOowxojF7K8qtaH4uV/l7mvCI3KuGMrLb1Qg33vy3GnobZv
         +KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=/GNsXDXGxvkLYn64hGgFQXgQU/jMUClIrsjFgTViz1Y=;
        b=iaLOCwlXXJYlSVIde+WYOzuWqlZsj2dBQ/wyQ88xDbE0BF0hnrECUVNCZpBDkiW+3z
         7G7inM9PIFthBMGociTZFhLTVoxMbnexT7vycyoZeBE2dd4eXoIQexUaI86GwHhx93HQ
         mdfQ6d1OI13IKKSO5QHPVxJ+WMUc7kJfI0CHscbJ4fOI1FX8yU08DlG0CKXdnFEUgKX5
         JrW7WcjFL2OId0zeEDvq/Gr2a8axdvoX0T25oaIVF3q3x67u1ZHijI2QUJGSnrggx6Ny
         Q76LG6MptO0XdB5m7jBNy1qEsY7CyI6Y7sQUvE/jL5UDffi7Mmr3KedhWXh8r2tXnDEw
         0aGw==
X-Gm-Message-State: AOAM530lIcwTcrXZIYIeghy9R/pv5PqFpgQJrwYx7MbAXWk4jgkOTlFg
	BwlReFmKZtbXz6rb72Z0gzDdOqSp/uI=
X-Google-Smtp-Source: ABdhPJwlJCzwV2czahQdIDDwZpv3WILOdy4N6W1GAOIZtI0/OVUnTHcgIFdLrF39Vy4IljF0G9kSbF2BA3s=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:d989:: with SMTP id q131mr1776832ybg.500.1630025860851;
 Thu, 26 Aug 2021 17:57:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:08 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-6-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 05/15] perf: Track guest callbacks on a per-CPU basis
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

Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
the callbacks more precisely and avoid a lurking NULL pointer dereference.
On x86, KVM supports being built as a module and thus can be unloaded.
And because the shared callbacks are referenced from IRQ/NMI context,
unloading KVM can run concurrently with perf, and thus all of perf's
checks for a NULL perf_guest_cbs are flawed as perf_guest_cbs could be
nullified between the check and dereference.

In practice, this has not been problematic because the callbacks are
always guarded with a "perf_guest_cbs && perf_guest_cbs->is_in_guest()"
pattern, and it's extremely unlikely the compiler will choost to reload
perf_guest_cbs in that particular sequence.  Because is_in_guest() is
obviously true only when KVM is running a guest, perf always wins the
race to the guarded code (which does often reload perf_guest_cbs) as KVM
has to stop running all guests and do a heavy teardown before unloading.

Cc: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/perf_callchain.c | 18 ++++++++++++------
 arch/x86/events/core.c             | 17 +++++++++++------
 arch/x86/events/intel/core.c       |  8 +++++---
 include/linux/perf_event.h         |  2 +-
 kernel/events/core.c               | 12 +++++++++---
 5 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 4a72c2727309..38555275c6a2 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -102,7 +102,9 @@ compat_user_backtrace(struct compat_frame_tail __user *tail,
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+
+	if (guest_cbs && guest_cbs->is_in_guest()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -147,9 +149,10 @@ static bool callchain_trace(void *data, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
 	struct stackframe frame;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->is_in_guest()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -160,18 +163,21 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+
+	if (guest_cbs && guest_cbs->is_in_guest())
+		return guest_cbs->get_guest_ip();
 
 	return instruction_pointer(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
 	int misc = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
+	if (guest_cbs && guest_cbs->is_in_guest()) {
+		if (guest_cbs->is_user_mode())
 			misc |= PERF_RECORD_MISC_GUEST_USER;
 		else
 			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 1eb45139fcc6..34155a52e498 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2761,10 +2761,11 @@ static bool perf_hw_regs(struct pt_regs *regs)
 void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
 	struct unwind_state state;
 	unsigned long addr;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->is_in_guest()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2864,10 +2865,11 @@ perf_callchain_user32(struct pt_regs *regs, struct perf_callchain_entry_ctx *ent
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
 	struct stack_frame frame;
 	const struct stack_frame __user *fp;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->is_in_guest()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2944,18 +2946,21 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+
+	if (guest_cbs && guest_cbs->is_in_guest())
+		return guest_cbs->get_guest_ip();
 
 	return regs->ip + code_segment_base(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
 	int misc = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
+	if (guest_cbs && guest_cbs->is_in_guest()) {
+		if (guest_cbs->is_user_mode())
 			misc |= PERF_RECORD_MISC_GUEST_USER;
 		else
 			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index fca7a6e2242f..96001962c24d 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2784,6 +2784,7 @@ static void intel_pmu_reset(void)
 
 static int handle_pmi_common(struct pt_regs *regs, u64 status)
 {
+	struct perf_guest_info_callbacks *guest_cbs;
 	struct perf_sample_data data;
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	int bit;
@@ -2852,9 +2853,10 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 	 */
 	if (__test_and_clear_bit(GLOBAL_STATUS_TRACE_TOPAPMI_BIT, (unsigned long *)&status)) {
 		handled++;
-		if (unlikely(perf_guest_cbs && perf_guest_cbs->is_in_guest() &&
-			perf_guest_cbs->handle_intel_pt_intr))
-			perf_guest_cbs->handle_intel_pt_intr();
+		guest_cbs = this_cpu_read(perf_guest_cbs);
+		if (unlikely(guest_cbs && guest_cbs->is_in_guest() &&
+			     guest_cbs->handle_intel_pt_intr))
+			guest_cbs->handle_intel_pt_intr();
 		else
 			intel_pt_interrupt();
 	}
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5eab690622ca..c98253dae037 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1237,7 +1237,7 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 u16 flags);
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
-extern struct perf_guest_info_callbacks *perf_guest_cbs;
+DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9820df7ee455..9bc1375d6ed9 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6483,17 +6483,23 @@ static void perf_pending_event(struct irq_work *entry)
 }
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
-struct perf_guest_info_callbacks *perf_guest_cbs;
+DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
-	perf_guest_cbs = cbs;
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(perf_guest_cbs, cpu) = cbs;
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
 void perf_unregister_guest_info_callbacks(void)
 {
-	perf_guest_cbs = NULL;
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(perf_guest_cbs, cpu) = NULL;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 #endif
-- 
2.33.0.259.gc128427fd7-goog


