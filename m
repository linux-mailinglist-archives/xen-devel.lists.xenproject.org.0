Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4503FA249
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 02:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174046.317563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmLC-0006VP-AU; Sat, 28 Aug 2021 00:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174046.317563; Sat, 28 Aug 2021 00:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmLC-0006Rt-6i; Sat, 28 Aug 2021 00:36:58 +0000
Received: by outflank-mailman (input) for mailman id 174046;
 Sat, 28 Aug 2021 00:36:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ea6Z=NT=flex--seanjc.bounces.google.com=3F4UpYQYKCdYK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-us1.protection.inumbo.net>)
 id 1mJmLA-0003pb-GI
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 00:36:56 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25f6a977-aae4-4981-8c9d-2ee9ffd0d29a;
 Sat, 28 Aug 2021 00:36:39 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 f8-20020a2585480000b02905937897e3daso1666669ybn.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 17:36:39 -0700 (PDT)
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
X-Inumbo-ID: 25f6a977-aae4-4981-8c9d-2ee9ffd0d29a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=0YXYNwfO2nP0d/8tcUlJOlRfQipYSfj6KR9im5qFSzU=;
        b=M/Xe0rMtGmxdkWl9mi5EOW9t7UlutI0HqYiemomWjM6+KLBUeVT3ObS3xgkFOcpBHA
         tjEreWTZww/GaibpuFp3TP6uJw/XXrbB7rgTViYSk8FfdflF+cKbmXPkirpzaUgFSwuF
         vLlNrQEp4R0vbB3TstwUqA/I7NNS4Ui2hk2YFYsQ9QF7i+W+jF4GnB9pW6MAQRukcU/q
         md3KD2Uem7PScXCJD2QVRXMKOLsNPxZapGXO+7H3E2dqptEoTOpWEpWO/03jkHSd2XRu
         P5sFFQ6xUG9CInfC2TWxYV5PcoFZlV4zv4dllrmT/FnIzl+/h7hBbAB8LVIwt89dViD6
         wzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=0YXYNwfO2nP0d/8tcUlJOlRfQipYSfj6KR9im5qFSzU=;
        b=GbyD2D0W6SskeF2WVTPW46DRLtTWM1sCr2DAB6EstlKiK8+bzs5w4TolxcWFvnBugc
         jhJ9Kbhk4yQq+t/VcD/6R7zR+QHn3C6am6cNeAbJWIerioUXzh60GbR73smxhuEe+Ytd
         PDrZcrtfUFkpt3SZ5FlDa/fXVSIz8+vsSGAqTDT/8s0wkEUXkkmC3P2ZUgWnjvkT1pRE
         sKfCh4c37L/XyOgjGzT+c+RHFj8SFOTgX71X+Il8jGImOX0bGhmwq9jy2tF2ANWOgxvW
         V66XJ2HAqozprjcMqSa6q7+Pe6Ghh4ueMchHReWwfBOSBCEr8gluZN2KsASzlokyeRuQ
         Cr5Q==
X-Gm-Message-State: AOAM5305lrd0RhX4FYV4w2ZLRFRd9Nt3tT8cE6JaIpA/Cq67DxnZz5nt
	ISo7C4wGzKqkqU37LAiGaIfst7ww4ds=
X-Google-Smtp-Source: ABdhPJx7+h99mRUNQ5W6YGQDjwrL7hApQN1LKnrNBAh3ncOOeOsVF2BhDlqAamjvA/RKoXSaOf42ZGz737c=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:6545:: with SMTP id z66mr9189208ybb.149.1630110999440;
 Fri, 27 Aug 2021 17:36:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Aug 2021 17:35:51 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-7-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 06/13] perf/core: Rework guest callbacks to prepare for
 static_call support
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

From: Like Xu <like.xu@linux.intel.com>

To prepare for using static_calls to optimize perf's guest callbacks,
replace ->is_in_guest and ->is_user_mode with a new multiplexed hook
->state, tweak ->handle_intel_pt_intr to play nice with being called when
there is no active guest, and drop "guest" from ->is_in_guest.

Return '0' from ->state and ->handle_intel_pt_intr to indicate "not in
guest" so that DEFINE_STATIC_CALL_RET0 can be used to define the static
calls, i.e. no callback == !guest.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
[sean: extracted from static_call patch, fixed get_ip() bug, wrote changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/perf_callchain.c | 13 +++++-----
 arch/arm64/kvm/perf.c              | 35 +++++++++++---------------
 arch/x86/events/core.c             | 13 +++++-----
 arch/x86/events/intel/core.c       |  5 +---
 arch/x86/include/asm/kvm_host.h    |  2 +-
 arch/x86/kvm/pmu.c                 |  2 +-
 arch/x86/kvm/x86.c                 | 40 ++++++++++++++++--------------
 arch/x86/xen/pmu.c                 | 32 ++++++++++--------------
 include/linux/perf_event.h         | 10 +++++---
 kernel/events/core.c               |  1 +
 10 files changed, 74 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 86d9f2013172..274dc3e11b6d 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -104,7 +104,7 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->state()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -152,7 +152,7 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe frame;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->state()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -165,8 +165,8 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return guest_cbs->get_guest_ip();
+	if (guest_cbs && guest_cbs->state())
+		return guest_cbs->get_ip();
 
 	return instruction_pointer(regs);
 }
@@ -174,10 +174,11 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
+	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
 	int misc = 0;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		if (guest_cbs->is_user_mode())
+	if (guest_state) {
+		if (guest_state & PERF_GUEST_USER)
 			misc |= PERF_RECORD_MISC_GUEST_USER;
 		else
 			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 039fe59399a2..893de1a51fea 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,39 +13,34 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-static int kvm_is_in_guest(void)
+static unsigned int kvm_guest_state(void)
 {
-        return kvm_get_running_vcpu() != NULL;
-}
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned int state;
 
-static int kvm_is_user_mode(void)
-{
-	struct kvm_vcpu *vcpu;
-
-	vcpu = kvm_get_running_vcpu();
+	if (!vcpu)
+		return 0;
 
-	if (vcpu)
-		return !vcpu_mode_priv(vcpu);
+	state = PERF_GUEST_ACTIVE;
+	if (!vcpu_mode_priv(vcpu))
+		state |= PERF_GUEST_USER;
 
-	return 0;
+	return state;
 }
 
 static unsigned long kvm_get_guest_ip(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	vcpu = kvm_get_running_vcpu();
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	if (vcpu)
-		return *vcpu_pc(vcpu);
-
-	return 0;
+	return *vcpu_pc(vcpu);
 }
 
 static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest	= kvm_is_in_guest,
-	.is_user_mode	= kvm_is_user_mode,
-	.get_guest_ip	= kvm_get_guest_ip,
+	.state		= kvm_guest_state,
+	.get_ip		= kvm_get_guest_ip,
 };
 
 void kvm_perf_init(void)
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index ffb3e6c0d367..3a7630fdd340 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2765,7 +2765,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	struct unwind_state state;
 	unsigned long addr;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2869,7 +2869,7 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs
 	struct stack_frame frame;
 	const struct stack_frame __user *fp;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs && guest_cbs->state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2948,8 +2948,8 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 
-	if (guest_cbs && guest_cbs->is_in_guest())
-		return guest_cbs->get_guest_ip();
+	if (guest_cbs && guest_cbs->state())
+		return guest_cbs->get_ip();
 
 	return regs->ip + code_segment_base(regs);
 }
@@ -2957,10 +2957,11 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
+	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
 	int misc = 0;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
-		if (guest_cbs->is_user_mode())
+	if (guest_state) {
+		if (guest_state & PERF_GUEST_USER)
 			misc |= PERF_RECORD_MISC_GUEST_USER;
 		else
 			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 9baa46185d94..524ad1f747bd 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2855,10 +2855,7 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 		handled++;
 
 		guest_cbs = perf_get_guest_cbs();
-		if (unlikely(guest_cbs && guest_cbs->is_in_guest() &&
-			     guest_cbs->handle_intel_pt_intr))
-			guest_cbs->handle_intel_pt_intr();
-		else
+		if (likely(!guest_cbs || !guest_cbs->handle_intel_pt_intr()))
 			intel_pt_interrupt();
 	}
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1ea4943a73d7..1080166fc0cf 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1874,7 +1874,7 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu);
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err);
 void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu);
 
-int kvm_is_in_guest(void);
+unsigned int kvm_guest_state(void);
 
 void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				     u32 size);
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0772bad9165c..5b68d4188de0 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -87,7 +87,7 @@ static void kvm_perf_overflow_intr(struct perf_event *perf_event,
 		 * woken up. So we should wake it, but this is impossible from
 		 * NMI context. Do it from irq work instead.
 		 */
-		if (!kvm_is_in_guest())
+		if (!kvm_guest_state())
 			irq_work_queue(&pmc_to_pmu(pmc)->irq_work);
 		else
 			kvm_make_request(KVM_REQ_PMI, pmc->vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bae951344e28..b2a4d085aa4f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8267,44 +8267,48 @@ static void kvm_timer_init(void)
 DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
 
-int kvm_is_in_guest(void)
+unsigned int kvm_guest_state(void)
 {
-	return __this_cpu_read(current_vcpu) != NULL;
-}
+	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	unsigned int state;
 
-static int kvm_is_user_mode(void)
-{
-	int user_mode = 3;
+	if (!vcpu)
+		return 0;
 
-	if (__this_cpu_read(current_vcpu))
-		user_mode = static_call(kvm_x86_get_cpl)(__this_cpu_read(current_vcpu));
+	state = PERF_GUEST_ACTIVE;
+	if (static_call(kvm_x86_get_cpl)(vcpu))
+		state |= PERF_GUEST_USER;
 
-	return user_mode != 0;
+	return state;
 }
 
-static unsigned long kvm_get_guest_ip(void)
+static unsigned long kvm_guest_get_ip(void)
 {
-	unsigned long ip = 0;
+	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
-	if (__this_cpu_read(current_vcpu))
-		ip = kvm_rip_read(__this_cpu_read(current_vcpu));
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	return ip;
+	return kvm_rip_read(vcpu);
 }
 
-static void kvm_handle_intel_pt_intr(void)
+static unsigned int kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
+	/* '0' on failure so that the !PT case can use a RET0 static call. */
+	if (!vcpu)
+		return 0;
+
 	kvm_make_request(KVM_REQ_PMI, vcpu);
 	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
 			(unsigned long *)&vcpu->arch.pmu.global_status);
+	return 1;
 }
 
 static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest		= kvm_is_in_guest,
-	.is_user_mode		= kvm_is_user_mode,
-	.get_guest_ip		= kvm_get_guest_ip,
+	.state			= kvm_guest_state,
+	.get_ip			= kvm_guest_get_ip,
 	.handle_intel_pt_intr	= NULL,
 };
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index e13b0b49fcdf..89dd6b1708b0 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -413,34 +413,29 @@ int pmu_apic_update(uint32_t val)
 }
 
 /* perf callbacks */
-static int xen_is_in_guest(void)
+static unsigned int xen_guest_state(void)
 {
 	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
+	unsigned int state = 0;
 
 	if (!xenpmu_data) {
 		pr_warn_once("%s: pmudata not initialized\n", __func__);
-		return 0;
+		return state;
 	}
 
 	if (!xen_initial_domain() || (xenpmu_data->domain_id >= DOMID_SELF))
-		return 0;
+		return state;
 
-	return 1;
-}
+	state |= PERF_GUEST_ACTIVE;
 
-static int xen_is_user_mode(void)
-{
-	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
-
-	if (!xenpmu_data) {
-		pr_warn_once("%s: pmudata not initialized\n", __func__);
-		return 0;
+	if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_PV) {
+		if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_USER)
+			state |= PERF_GUEST_USER;
+	} else if (xenpmu_data->pmu.r.regs.cpl & 3) {
+		state |= PERF_GUEST_USER;
 	}
 
-	if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_PV)
-		return (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_USER);
-	else
-		return !!(xenpmu_data->pmu.r.regs.cpl & 3);
+	return state;
 }
 
 static unsigned long xen_get_guest_ip(void)
@@ -456,9 +451,8 @@ static unsigned long xen_get_guest_ip(void)
 }
 
 static struct perf_guest_info_callbacks xen_guest_cbs = {
-	.is_in_guest            = xen_is_in_guest,
-	.is_user_mode           = xen_is_user_mode,
-	.get_guest_ip           = xen_get_guest_ip,
+	.state                  = xen_guest_state,
+	.get_ip			= xen_get_guest_ip,
 };
 
 /* Convert registers from Xen's format to Linux' */
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index e75971f85cc8..a5d5893b80b0 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -26,11 +26,13 @@
 # include <asm/local64.h>
 #endif
 
+#define PERF_GUEST_ACTIVE	0x01
+#define PERF_GUEST_USER	0x02
+
 struct perf_guest_info_callbacks {
-	int				(*is_in_guest)(void);
-	int				(*is_user_mode)(void);
-	unsigned long			(*get_guest_ip)(void);
-	void				(*handle_intel_pt_intr)(void);
+	unsigned int			(*state)(void);
+	unsigned long			(*get_ip)(void);
+	unsigned int			(*handle_intel_pt_intr)(void);
 };
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
diff --git a/kernel/events/core.c b/kernel/events/core.c
index d7f606e06446..ec36e7aded89 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6484,6 +6484,7 @@ static void perf_pending_event(struct irq_work *entry)
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(perf_guest_cbs))
-- 
2.33.0.259.gc128427fd7-goog


