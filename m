Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C944CFA7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224518.387944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVW-0007yY-RW; Thu, 11 Nov 2021 02:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224518.387944; Thu, 11 Nov 2021 02:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVW-0007lR-E1; Thu, 11 Nov 2021 02:08:06 +0000
Received: by outflank-mailman (input) for mailman id 224518;
 Thu, 11 Nov 2021 02:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jdj=P6=flex--seanjc.bounces.google.com=3AHuMYQYKCTspbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@srs-se1.protection.inumbo.net>)
 id 1mkzVS-0004E5-Pa
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:08:03 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3254a87b-4294-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 03:08:01 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 mv1-20020a17090b198100b001a67d5901d2so2244890pjb.7
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:08:01 -0800 (PST)
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
X-Inumbo-ID: 3254a87b-4294-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=oYnqia9YA7bVBDeaVlw55plLCAqayCSEP3xux84BJdM=;
        b=IsKmUd/J87iw1VFStQflHD/2Sh0pdsf3hhMP98JSsjPzS8VAeZPT9/XiMMgynwDGIx
         GUOuoRcoAF/EWulmlEBFNA4SF48sxIzDCetM5TBZndJ5S/ZOc7jpm4WEvBtYJAeMUGgb
         /3vZ6Hu0BOxKJ2Z38aNlDAoo8VeXhVG2Jgd4ptB9gH/OdtP3qZR4FetIBTjJqtCIbHAK
         Ccr04SlDCfXtcHrWHVFv0GuZuWe/OROBoA5xmyooPgpMMRmAK4w2V4/PpUgItN1qHNnq
         iH6NXnt1NZvq3zk7IWL5Z/M48RyPPrUHQk5LiG0ORjorZ5ZMUuS7o8paCFWSMiCCecp/
         4qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=oYnqia9YA7bVBDeaVlw55plLCAqayCSEP3xux84BJdM=;
        b=pCAOoZM2TNMKlglcuQAVuxVKoCo7Y16crgjMWPMxq0iJHjIItde/YwGTYagxvgZz09
         VWq5he74YC5jpj6QU715BuU1PO9kr8Jm78fmU0BQEjbaInbt0B4NwNCegUGsnFEHKqmB
         YXbP1IHk2QH1R6vLF/fn7097Q0HAJKsQdNqk+/yt+CJr11hv+PwfprnHX0loI2wJ1uTr
         AsKO+Sd0cO5xcr0MQo6CJJHGZYfoSp3Pm7n8EpePAzydpuihJEhNnBJqdz/fEk9WanWn
         XpvezsBiC2aSOOe7YaaMhEkyh6HqHwwNtg4IUeanoPo/nk9YUO+gMum+cRVAwdfUtNeu
         mYtA==
X-Gm-Message-State: AOAM533UV//mGgcvHoLHnmwni3HAIBcNBFs5rJkZTBTyXGS7mA9siHQH
	1uVAWeyZF2SEuOReIoAPHkLXf1znxt0=
X-Google-Smtp-Source: ABdhPJyq+sLPy+WJsNtaXEKOEBJ7ASAo6Br6LHZ97zNyZrIxCpdFo+uofVdj3X8YU3/GaaJw+V1rFU9AZzw=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:654b:b0:13d:c967:9cbd with SMTP id
 d11-20020a170902654b00b0013dc9679cbdmr3761037pln.88.1636596480287; Wed, 10
 Nov 2021 18:08:00 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:33 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-13-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 12/17] KVM: Move x86's perf guest info callbacks to generic KVM
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move x86's perf guest callbacks into common KVM, as they are semantically
identical to arm64's callbacks (the only other such KVM callbacks).
arm64 will convert to the common versions in a future patch.

Implement the necessary arm64 arch hooks now to avoid having to provide
stubs or a temporary #define (from x86) to avoid arm64 compilation errors
when CONFIG_GUEST_PERF_EVENTS=y.

Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 10 ++++++
 arch/arm64/kvm/arm.c              |  5 +++
 arch/x86/include/asm/kvm_host.h   |  3 ++
 arch/x86/kvm/x86.c                | 53 +++++++------------------------
 include/linux/kvm_host.h          | 10 ++++++
 virt/kvm/kvm_main.c               | 44 +++++++++++++++++++++++++
 6 files changed, 83 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5a76d9a76fd9..72e2afe6e8e3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -678,6 +678,16 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 void kvm_perf_init(void);
 void kvm_perf_teardown(void);
 
+/*
+ * Returns true if a Performance Monitoring Interrupt (PMI), a.k.a. perf event,
+ * arrived in guest context.  For arm64, any event that arrives while a vCPU is
+ * loaded is considered to be "in guest".
+ */
+static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
+{
+	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
+}
+
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
 void kvm_update_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f5490afe1ebf..93c952375f3b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -496,6 +496,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return vcpu_mode_priv(vcpu);
 }
 
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return *vcpu_pc(vcpu);
+}
+
 /* Just ensure a guest exit from a particular CPU */
 static void exit_vm_noop(void *info)
 {
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 812c08e797fe..ec16f645cb8c 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1565,6 +1565,9 @@ static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define kvm_arch_pmi_in_guest(vcpu) \
+	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
+
 int kvm_mmu_module_init(void);
 void kvm_mmu_module_exit(void);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e9e1a4bb1d00..bafd2e78ad04 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8410,43 +8410,12 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-static inline bool kvm_pmi_in_guest(struct kvm_vcpu *vcpu)
-{
-	return vcpu && vcpu->arch.handling_intr_from_guest;
-}
-
-static unsigned int kvm_guest_state(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	unsigned int state;
-
-	if (!kvm_pmi_in_guest(vcpu))
-		return 0;
-
-	state = PERF_GUEST_ACTIVE;
-	if (static_call(kvm_x86_get_cpl)(vcpu))
-		state |= PERF_GUEST_USER;
-
-	return state;
-}
-
-static unsigned long kvm_guest_get_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
-	if (WARN_ON_ONCE(!kvm_pmi_in_guest(vcpu)))
-		return 0;
-
-	return kvm_rip_read(vcpu);
-}
-
 static unsigned int kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	/* '0' on failure so that the !PT case can use a RET0 static call. */
-	if (!kvm_pmi_in_guest(vcpu))
+	if (!kvm_arch_pmi_in_guest(vcpu))
 		return 0;
 
 	kvm_make_request(KVM_REQ_PMI, vcpu);
@@ -8455,12 +8424,6 @@ static unsigned int kvm_handle_intel_pt_intr(void)
 	return 1;
 }
 
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.state			= kvm_guest_state,
-	.get_ip			= kvm_guest_get_ip,
-	.handle_intel_pt_intr	= NULL,
-};
-
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11153,9 +11116,11 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	/* Temporary ugliness. */
 	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
-		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+		kvm_register_perf_callbacks(kvm_handle_intel_pt_intr);
+	else
+		kvm_register_perf_callbacks(NULL);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
@@ -11184,8 +11149,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
-	kvm_guest_cbs.handle_intel_pt_intr = NULL;
+	kvm_unregister_perf_callbacks();
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
@@ -11776,6 +11740,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
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
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 60a35d9fe259..da843044e0c1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1162,6 +1162,16 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
 }
 #endif
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
+
+void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
+void kvm_unregister_perf_callbacks(void);
+#else
+static inline void kvm_register_perf_callbacks(void *ign) {}
+static inline void kvm_unregister_perf_callbacks(void) {}
+#endif /* CONFIG_GUEST_PERF_EVENTS */
+
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
 void kvm_arch_sync_events(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3f6d450355f0..75d32fc031b5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5479,6 +5479,50 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
         return &kvm_running_vcpu;
 }
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
+static unsigned int kvm_guest_state(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned int state;
+
+	if (!kvm_arch_pmi_in_guest(vcpu))
+		return 0;
+
+	state = PERF_GUEST_ACTIVE;
+	if (!kvm_arch_vcpu_in_kernel(vcpu))
+		state |= PERF_GUEST_USER;
+
+	return state;
+}
+
+static unsigned long kvm_guest_get_ip(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
+	if (WARN_ON_ONCE(!kvm_arch_pmi_in_guest(vcpu)))
+		return 0;
+
+	return kvm_arch_vcpu_get_ip(vcpu);
+}
+
+static struct perf_guest_info_callbacks kvm_guest_cbs = {
+	.state			= kvm_guest_state,
+	.get_ip			= kvm_guest_get_ip,
+	.handle_intel_pt_intr	= NULL,
+};
+
+void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
+{
+	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+void kvm_unregister_perf_callbacks(void)
+{
+	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+}
+#endif
+
 struct kvm_cpu_compat_check {
 	void *opaque;
 	int *ret;
-- 
2.34.0.rc0.344.g81b53c2807-goog


