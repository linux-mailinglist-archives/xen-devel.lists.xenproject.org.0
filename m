Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AD413E52
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191991.342230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmC-0002te-HM; Wed, 22 Sep 2021 00:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191991.342230; Wed, 22 Sep 2021 00:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmC-0002qP-Cz; Wed, 22 Sep 2021 00:06:16 +0000
Received: by outflank-mailman (input) for mailman id 191991;
 Wed, 22 Sep 2021 00:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SVWJ=OM=flex--seanjc.bounces.google.com=3YnNKYQYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@srs-us1.protection.inumbo.net>)
 id 1mSpmA-0000pt-Pp
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:06:14 +0000
Received: from mail-qv1-xf4a.google.com (unknown [2607:f8b0:4864:20::f4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee500b0c-3974-4a24-9c6a-6a6ae796ebe4;
 Wed, 22 Sep 2021 00:05:54 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id
 e8-20020a0cf348000000b0037a350958f2so7985730qvm.7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:05:54 -0700 (PDT)
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
X-Inumbo-ID: ee500b0c-3974-4a24-9c6a-6a6ae796ebe4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=uGRLtrGbpD3S6B/7zzXt3L9N6QvZuu1UjnfG14mJ8ek=;
        b=RFIhbvEyvYMragxwcAv1E8u094o6TR3aNC++WUaaLMbpX1lKaGuAbXr4UQ4DnYHp6f
         0izeMTfNi3w+g5sbRJ0zA7LvF+2NsrCBFGIUyCyWEOC9wn70vrrhnoT3jtw95SZHu/KS
         NX/NMJBJ9rL02BAnaFZcMgeOgQTyJ3QXygCXEu9hwHwMFitHgFFJeLNMjteHVUzmBk3C
         gxJ7A5VIKod2bScVarg0Ti81qTfwhFhcVvMp3krZctVE206zQUgs8jQ7G+Dz7hdiV3WH
         q42Zv28O4z7mAPyMIHk2g1A40W19Qiluvr7IjkcHSYgiI2bp3YLj+WcuS1yfVh40dAHd
         TYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=uGRLtrGbpD3S6B/7zzXt3L9N6QvZuu1UjnfG14mJ8ek=;
        b=CPFLqGLNZwYEK1h50vrwpS8+ZLJ6WlnpOb7PcWc7Po1MV712TINIHK09BD9r112FMC
         TynkThy9thOlIFIJxwnRGwyvLz6+34pSkogM08ENlEQpBqBzi3a2U8TcaUyyeQofFNFK
         ycxm0gJ2GqbcSbhAXmUNzusXvfnMVjTM5Y+UoZ+qXKkusq5oOCYD2VUzBqu2TV3Af9Yt
         vBg4IaTVXmi0Vl5lkPzOsq9/q/uYc4DfnLWAUp9GM480FMjMt/1yus5gANfFciaVm7tk
         kuHBEUs1/e2xKbez8GAxsDRPgmxuVgen2nsSlzI+nEY/GaErimz39xBiuVqAwZkx/V9v
         dKyA==
X-Gm-Message-State: AOAM530/vRys+CmwDaMVXUlE4deCiDMUlp/ZiPb4NdlRDjdDXlcXAf59
	N3JZfjTfTQOAWfZoyBwQ2rosv0ikLmE=
X-Google-Smtp-Source: ABdhPJx1/jRpojAUuj4tkfVy2mNumpkwTOY4qlI3JrC7x6zrnCf19L4LA34wG9xOt6d1Anx3BB/t4F42q7U=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6214:2e7:: with SMTP id
 h7mr34209194qvu.39.1632269154568; Tue, 21 Sep 2021 17:05:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:22 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-6-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 05/16] perf: Drop dead and useless guest "support" from
 arm, csky, nds32 and riscv
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop "support" for guest callbacks from architctures that don't implement
the guest callbacks.  Future patches will convert the callbacks to
static_call; rather than churn a bunch of arch code (that was presumably
copy+pasted from x86), remove it wholesale as it's useless and at best
wasting cycles.

A future patch will also add a Kconfig to force architcture to opt into
the callbacks to make it more difficult for uses "support" to sneak in in
the future.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm/kernel/perf_callchain.c   | 33 ++++-------------------------
 arch/csky/kernel/perf_callchain.c  | 12 -----------
 arch/nds32/kernel/perf_event_cpu.c | 34 ++++--------------------------
 arch/riscv/kernel/perf_callchain.c | 13 ------------
 4 files changed, 8 insertions(+), 84 deletions(-)

diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 1626dfc6f6ce..bc6b246ab55e 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -62,14 +62,8 @@ user_backtrace(struct frame_tail __user *tail,
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct frame_tail __user *tail;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ARM_pc);
 
 	if (!current->mm)
@@ -99,44 +93,25 @@ callchain_trace(struct stackframe *fr,
 void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe fr;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	int misc = 0;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		if (guest_cbs->is_user_mode())
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
diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
index 35318a635a5f..92057de08f4f 100644
--- a/arch/csky/kernel/perf_callchain.c
+++ b/arch/csky/kernel/perf_callchain.c
@@ -86,13 +86,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	unsigned long fp = 0;
 
-	/* C-SKY does not support virtualization. */
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->regs[4];
 	perf_callchain_store(entry, regs->pc);
 
@@ -111,15 +106,8 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe fr;
 
-	/* C-SKY does not support virtualization. */
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		pr_warn("C-SKY does not support perf in guest mode!");
-		return;
-	}
-
 	fr.fp = regs->regs[4];
 	fr.lr = regs->lr;
 	walk_stackframe(&fr, entry);
diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
index f38791960781..a78a879e7ef1 100644
--- a/arch/nds32/kernel/perf_event_cpu.c
+++ b/arch/nds32/kernel/perf_event_cpu.c
@@ -1363,7 +1363,6 @@ void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 		    struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	unsigned long fp = 0;
 	unsigned long gp = 0;
 	unsigned long lp = 0;
@@ -1372,11 +1371,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 
 	leaf_fp = 0;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ipc);
 	fp = regs->fp;
 	gp = regs->gp;
@@ -1480,13 +1474,8 @@ void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 		      struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe fr;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
 	fr.fp = regs->fp;
 	fr.lp = regs->lp;
 	fr.sp = regs->sp;
@@ -1495,32 +1484,17 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	/* However, NDS32 does not support virtualization */
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	int misc = 0;
 
-	/* However, NDS32 does not support virtualization */
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		if (guest_cbs->is_user_mode())
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
index 8ecfc4c128bc..1fc075b8f764 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -56,13 +56,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	unsigned long fp = 0;
 
-	/* RISC-V does not support perf in guest mode. */
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->s0;
 	perf_callchain_store(entry, regs->epc);
 
@@ -79,13 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	/* RISC-V does not support perf in guest mode. */
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		pr_warn("RISC-V does not support perf in guest mode!");
-		return;
-	}
-
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
-- 
2.33.0.464.g1972c5931b-goog


