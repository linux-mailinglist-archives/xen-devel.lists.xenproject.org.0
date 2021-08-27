Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB983F91CB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173319.316276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFD-0003Sf-Ek; Fri, 27 Aug 2021 01:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173319.316276; Fri, 27 Aug 2021 01:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFD-0003N9-Af; Fri, 27 Aug 2021 01:01:19 +0000
Received: by outflank-mailman (input) for mailman id 173319;
 Fri, 27 Aug 2021 01:01:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tn0W=NS=flex--seanjc.bounces.google.com=3jzgoYQYKCbAiUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@srs-us1.protection.inumbo.net>)
 id 1mJQCL-0001Ok-Ht
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:21 +0000
Received: from mail-qt1-x84a.google.com (unknown [2607:f8b0:4864:20::84a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 604b31e7-1e6a-4254-a4a4-60e33b2b47e2;
 Fri, 27 Aug 2021 00:57:52 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id
 l24-20020ac84a98000000b00298c09593afso3768085qtq.22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:52 -0700 (PDT)
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
X-Inumbo-ID: 604b31e7-1e6a-4254-a4a4-60e33b2b47e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=APlw6FoeYyjS3BPQZoCRIAf0ql6GYvWTuNomlW8snXU=;
        b=LuT11C5Peh4krF2EeyCdRCxcbNvhcakRbKzYpV3qZ6O2Z4PVpX/pEIk2oLYVzCzATI
         LirVe+4RAAMNQA5oiT6FeR7Vf9UzP3TZBQ1RW6eIIDw0eYoqjBIHJCOb3m7m1RgUcZdn
         bOJ3i8Ik5ehFXpmB//AMa+N0DT/avx0k1s6Bh0Z4wQ47vO3Y5BHzjhy1obtH40imLbdg
         1DczFHZq/wmvU1GEirxYMIFLIuwM5dyIeEobru75ofGyf5WLMEq8/LlYDYJwN2l4QhOG
         8GED2Mpk3QJ4QR32vEcxwTxNC2AHBjbOsMdxCn7mUPHsS1u7SGXczKvCreOLUwK7WywP
         dKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=APlw6FoeYyjS3BPQZoCRIAf0ql6GYvWTuNomlW8snXU=;
        b=K5E32FTA8ePKNtBg25hBcdQ/JYgNNU2cv9eNz90RvCBUttyYBDAyL967jLuHAr0rdK
         64NT26RgzWjvgaGeL7KxPttymIafe9p6dq2LI6Y6wMUrx3npSxlxcEIsz8OKSGUOEarl
         EpmsZC/ic811HLhRwY5ojKAhDH0OTpE0RdBS8ht7hpcy9ty5szIPCBGvfZUlAwwSHaPa
         mukcB+GJVaFRKE0z9caQ9fjxgmUZbeqyotQ60kpqKCMMewWDQQ2Y+InrKiilMrfvbOs5
         31MiWt/8newh3WnftJGNm2PrQ+hP22W+JeUxf1pV+oPlxDKg1D5aZyrgat9oVWLq6D87
         ONHw==
X-Gm-Message-State: AOAM530z8eICO9jYo62tqm36ScFi11Pq1On3gRUk82ocPA0v/ZXPY7yM
	PXO25cfDB6V+9MovRdmc4TZ6kkVtv4o=
X-Google-Smtp-Source: ABdhPJxV8SLmQ7eQT1AmY1MtULBcvEHZk3qClIQX5AbSsyjIRBSmPH3McGvB8qU+Qq94IjkJESGPvkRvUxQ=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:2465:: with SMTP id
 im5mr7220558qvb.46.1630025871976; Thu, 26 Aug 2021 17:57:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:13 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-11-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 10/15] KVM: Move x86's perf guest info callbacks to generic KVM
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

Move x86's perf guest callbacks into common KVM, as they are semantically
identical to arm64's callbacks (the only other such KVM callbacks).
arm64 will convert to the common versions in a future patch.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              | 48 +++++----------------------------
 arch/x86/kvm/x86.h              |  6 -----
 include/linux/kvm_host.h        | 12 +++++++++
 virt/kvm/kvm_main.c             | 46 +++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 465b35736d9b..63553a1f43ee 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -36,6 +36,7 @@
 #include <asm/hyperv-tlfs.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_WANT_PERF_CALLBACKS
 
 #define KVM_MAX_VCPUS 288
 #define KVM_SOFT_MAX_VCPUS 240
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e337aef60793..7cb0f04e24ee 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,32 +8264,6 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-static int kvm_is_in_guest(void)
-{
-	/* x86's callbacks are registered only when handling a guest NMI. */
-	return true;
-}
-
-static int kvm_is_user_mode(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return static_call(kvm_x86_get_cpl)(vcpu) != 0;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return kvm_rip_read(vcpu);
-}
-
 static void kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
@@ -8302,19 +8276,6 @@ static void kvm_handle_intel_pt_intr(void)
 			(unsigned long *)&vcpu->arch.pmu.global_status);
 }
 
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest		= kvm_is_in_guest,
-	.is_user_mode		= kvm_is_user_mode,
-	.get_guest_ip		= kvm_get_guest_ip,
-	.handle_intel_pt_intr	= NULL,
-};
-
-void kvm_register_perf_callbacks(void)
-{
-	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
-}
-EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
-
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11069,7 +11030,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	kvm_ops_static_call_update();
 
 	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
-		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
+		kvm_set_intel_pt_intr_handler(kvm_handle_intel_pt_intr);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
@@ -11098,7 +11059,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_guest_cbs.handle_intel_pt_intr = NULL;
+	kvm_set_intel_pt_intr_handler(NULL);
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
@@ -11725,6 +11686,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return vcpu->arch.preempted_in_kernel;
 }
 
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return kvm_rip_read(vcpu);
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index f13f15d2fab8..e1fe738c3827 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -387,12 +387,6 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
-void kvm_register_perf_callbacks(void);
-static inline void kvm_unregister_perf_callbacks(void)
-{
-	__perf_unregister_guest_info_callbacks();
-}
-
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e4d712e9f760..0db9af0b628c 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1163,6 +1163,18 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
 }
 #endif
 
+#ifdef __KVM_WANT_PERF_CALLBACKS
+
+void kvm_set_intel_pt_intr_handler(void (*handler)(void));
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
+
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+#endif
+
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
 void kvm_arch_sync_events(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3e67c93ca403..13c4f58a75e5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5460,6 +5460,52 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
         return &kvm_running_vcpu;
 }
 
+#ifdef __KVM_WANT_PERF_CALLBACKS
+static int kvm_is_in_guest(void)
+{
+	/* Registration of KVM's callback signifies "in guest". */
+	return true;
+}
+
+static int kvm_is_user_mode(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
+
+	return !kvm_arch_vcpu_in_kernel(vcpu);
+}
+
+static unsigned long kvm_get_guest_ip(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
+
+	return kvm_arch_vcpu_get_ip(vcpu);
+}
+
+static struct perf_guest_info_callbacks kvm_guest_cbs = {
+	.is_in_guest		= kvm_is_in_guest,
+	.is_user_mode		= kvm_is_user_mode,
+	.get_guest_ip		= kvm_get_guest_ip,
+	.handle_intel_pt_intr	= NULL,
+};
+
+void kvm_set_intel_pt_intr_handler(void (*handler)(void))
+{
+	kvm_guest_cbs.handle_intel_pt_intr = handler;
+}
+
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
+#endif
+
 struct kvm_cpu_compat_check {
 	void *opaque;
 	int *ret;
-- 
2.33.0.259.gc128427fd7-goog


