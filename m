Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA63FA247
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 02:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174042.317542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmL1-0005Eh-IK; Sat, 28 Aug 2021 00:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174042.317542; Sat, 28 Aug 2021 00:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmL1-0005CG-DO; Sat, 28 Aug 2021 00:36:47 +0000
Received: by outflank-mailman (input) for mailman id 174042;
 Sat, 28 Aug 2021 00:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcDt=NT=flex--seanjc.bounces.google.com=3EoUpYQYKCdEF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@srs-us1.protection.inumbo.net>)
 id 1mJmL0-0003pb-Fq
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 00:36:46 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94b81192-71cf-4eed-a225-1c8fcfa64295;
 Sat, 28 Aug 2021 00:36:35 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 q80-20020a25d953000000b0059a45a5f834so8330542ybg.22
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 17:36:35 -0700 (PDT)
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
X-Inumbo-ID: 94b81192-71cf-4eed-a225-1c8fcfa64295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=l+qrTcHHbVOVfx3csFqTQJW+sIvVNtSUAKnqiNDseGU=;
        b=YeIUfDPPv26/qQ9C6zbTR90RkfDch9YFOKAlHKUjSEVddL4Hpoya9tjkJY3A1wbIBn
         QolRIg0F84AYiP8jYQF3PWlN+ULQv1tmI4e/BbUmbvQ35zPcx2ZQSqLKQ5AVao+1UhgO
         fkWFWktVzgenJwImxC38FiwFCxzMEKkS1qQUUdmj1KFZcMw9Lyq83HZeYJH/euP/cfqF
         3aiAClPO6WWDoE2XklbezJvqEtsZgyUPgX+DMcdLAHn5l7sHl4CT18xkeTalHsiGr3MZ
         YjN79LXtHsUEDIVLT82BEQrYcZmX8jMYXoxZPFQJObu1cRhSKHjBMlVs35/os2e+0Sxl
         Ec7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=l+qrTcHHbVOVfx3csFqTQJW+sIvVNtSUAKnqiNDseGU=;
        b=FadraA6fQQ7E4pnke6eG5diGfG6ShMjYSKB6dPDhyYHAhLRb1rJBDzYynlsH72M22s
         A0/HHKK7114Yt4ZJYgzyK9moW+J++tFCNg0dHZMfAw0B/7+639coq6CDi/+l9AGtmZs4
         9OX0+jPxIftYcPfaT5maX+lZA3DcemHHd6h5kCTb+hM0iPUCxqHpLN5Bx1xT0LVKwnaD
         j4ZODp9r9Fy1VMsG/+D8CvGhjP5NPrq3DPeu05MJnBeg9zXugphCo/HBbdyByyob/YwC
         9sH/sRSCJl99PYnF+PO9sN0oxDGczts2MmrDpPvXMHvZbmx7dBtnSYNASv4Csen4dnhs
         QTwA==
X-Gm-Message-State: AOAM531FeAd6ywjzPKu7fes/PfTIqZ5LI+IuZowuf7J7NNVevBWXZDmv
	ngwsT2qQM7PpOZ2/Wd/NkULzBCOPv0M=
X-Google-Smtp-Source: ABdhPJx5idLVf7lCndwsU5Ce4jbb5QTi9k0wtLEJzPA1boh4/EA6RmmuRvKiVHeqlDtlM2jyABObo3ywihc=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:7cc3:: with SMTP id x186mr8484190ybc.227.1630110994660;
 Fri, 27 Aug 2021 17:36:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Aug 2021 17:35:49 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-5-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 04/13] perf: Stop pretending that perf can handle multiple
 guest callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>
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

Drop the 'int' return value from the perf (un)register callbacks helpers
and stop pretending perf can support multiple callbacks.  The 'int'
returns are not future proofing anything as none of the callers take
action on an error.  It's also not obvious that there will ever be
co-tenant hypervisors, and if there are, that allowing multiple callbacks
to be registered is desirable or even correct.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  4 ++--
 arch/arm64/kvm/perf.c             |  8 ++++----
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/perf_event.h        | 11 +++++------
 kernel/events/core.c              | 14 +++-----------
 5 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 41911585ae0c..ed940aec89e0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -670,8 +670,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
-int kvm_perf_init(void);
-int kvm_perf_teardown(void);
+void kvm_perf_init(void);
+void kvm_perf_teardown(void);
 
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 151c31fb9860..039fe59399a2 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -48,15 +48,15 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.get_guest_ip	= kvm_get_guest_ip,
 };
 
-int kvm_perf_init(void)
+void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
 
-	return perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 
-int kvm_perf_teardown(void)
+void kvm_perf_teardown(void)
 {
-	return perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	perf_unregister_guest_info_callbacks();
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ffc6c2d73508..bae951344e28 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11092,7 +11092,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	perf_unregister_guest_info_callbacks();
 	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 6b0405e578c1..2b77e2154b61 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1245,8 +1245,8 @@ static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
 	/* Prevent reloading between a !NULL check and dereferences. */
 	return READ_ONCE(perf_guest_cbs);
 }
-extern int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
-extern int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_unregister_guest_info_callbacks(void);
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
@@ -1489,10 +1489,9 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
 static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
-static inline int perf_register_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
-static inline int perf_unregister_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
+static inline void perf_register_guest_info_callbacks
+(struct perf_guest_info_callbacks *callbacks)				{ }
+static inline void perf_unregister_guest_info_callbacks(void)		{ }
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2126f6327321..1be95d9ace46 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,29 +6482,21 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
-/*
- * We assume there is only KVM supporting the callbacks.
- * Later on, we might change it to a list if there is
- * another virtualization implementation supporting the callbacks.
- */
 struct perf_guest_info_callbacks *perf_guest_cbs;
-
-int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(perf_guest_cbs))
-		return -EBUSY;
+		return;
 
 	WRITE_ONCE(perf_guest_cbs, cbs);
 	synchronize_rcu();
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
-int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_unregister_guest_info_callbacks(void)
 {
 	WRITE_ONCE(perf_guest_cbs, NULL);
 	synchronize_rcu();
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 
-- 
2.33.0.259.gc128427fd7-goog


