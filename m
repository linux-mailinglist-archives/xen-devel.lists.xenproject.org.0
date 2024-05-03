Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4398BAD80
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716433.1118559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sov-0002ET-Lm; Fri, 03 May 2024 13:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716433.1118559; Fri, 03 May 2024 13:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sov-00025T-EY; Fri, 03 May 2024 13:19:25 +0000
Received: by outflank-mailman (input) for mailman id 716433;
 Fri, 03 May 2024 13:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Za+=MG=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1s2sot-0001zB-TP
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:19:23 +0000
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch
 [84.16.66.171]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1139cf1-094f-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 15:19:22 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VWBGd5P4YzRYW;
 Fri,  3 May 2024 15:19:21 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VWBGc5y1CzZ8K; Fri,  3 May 2024 15:19:20 +0200 (CEST)
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
X-Inumbo-ID: c1139cf1-094f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1714742361;
	bh=8e4dNhg8cJXTgu6Tduk1ij3wqe1j+rj2Pu+QmetQRF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fmwx5YE+iW+x7PpDaGWblZGnZb7wurP6ci4Q4GCwAcRMfopzd8vkWkcKtNJT8f84N
	 Z/3rVqdkcn7fTd12tvbQSPZygf9ZLVEBMTWje4Ww7ynKrlLNQKpa+wyL1oCNT0eN5W
	 u0DxKz/b4BPdXsWJpFOgkARSwFxi9QaRNlXFLyRM=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Alexander Graf <graf@amazon.com>,
	Angelina Vu <angelinavu@linux.microsoft.com>,
	Anna Trikalinou <atrikalinou@microsoft.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Forrest Yuan Yu <yuanyu@google.com>,
	James Gowans <jgowans@amazon.com>,
	James Morris <jamorris@linux.microsoft.com>,
	John Andersen <john.s.andersen@intel.com>,
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
	Marian Rotariu <marian.c.rotariu@gmail.com>,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	=?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
	dev@lists.cloudhypervisor.org,
	kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v3 2/5] KVM: x86: Add new hypercall to lock control registers
Date: Fri,  3 May 2024 15:19:07 +0200
Message-ID: <20240503131910.307630-3-mic@digikod.net>
In-Reply-To: <20240503131910.307630-1-mic@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

This enables guests to lock their CR0 and CR4 registers with a subset of
X86_CR0_WP, X86_CR4_SMEP, X86_CR4_SMAP, X86_CR4_UMIP, X86_CR4_FSGSBASE
and X86_CR4_CET flags.

The new KVM_HC_LOCK_CR_UPDATE hypercall takes three arguments.  The
first is to identify the control register, the second is a bit mask to
pin (i.e. mark as read-only), and the third is for optional flags.

These register flags should already be pinned by Linux guests, but once
compromised, this self-protection mechanism could be disabled, which is
not the case with this dedicated hypercall.

Once the CRs are pinned by the guest, if it attempts to change them,
then a general protection fault is sent to the guest.

This hypercall may evolve and support new kind of registers or pinning.
The optional KVM_LOCK_CR_UPDATE_VERSION flag enables guests to know the
supported abilities by mapping the returned version with the related
features.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20240503131910.307630-3-mic@digikod.net
---

Changes since v1:
* Guard KVM_HC_LOCK_CR_UPDATE hypercall with CONFIG_HEKI.
* Move extern cr4_pinned_mask to x86.h (suggested by Kees Cook).
* Move VMX CR checks from vmx_set_cr*() to handle_cr() to make it
  possible to return to user space (see next commit).
* Change the heki_check_cr()'s first argument to vcpu.
* Don't use -KVM_EPERM in heki_check_cr().
* Generate a fault when the guest requests a denied CR update.
* Add a flags argument to get the version of this hypercall. Being able
  to do a preper version check was suggested by Wei Liu.
---
 Documentation/virt/kvm/x86/hypercalls.rst | 17 +++++
 arch/x86/include/uapi/asm/kvm_para.h      |  2 +
 arch/x86/kernel/cpu/common.c              |  7 +-
 arch/x86/kvm/vmx/vmx.c                    |  5 ++
 arch/x86/kvm/x86.c                        | 84 +++++++++++++++++++++++
 arch/x86/kvm/x86.h                        | 22 ++++++
 include/linux/kvm_host.h                  |  5 ++
 include/uapi/linux/kvm_para.h             |  1 +
 8 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/x86/hypercalls.rst b/Documentation/virt/kvm/x86/hypercalls.rst
index 10db7924720f..3178576f4c47 100644
--- a/Documentation/virt/kvm/x86/hypercalls.rst
+++ b/Documentation/virt/kvm/x86/hypercalls.rst
@@ -190,3 +190,20 @@ the KVM_CAP_EXIT_HYPERCALL capability. Userspace must enable that capability
 before advertising KVM_FEATURE_HC_MAP_GPA_RANGE in the guest CPUID.  In
 addition, if the guest supports KVM_FEATURE_MIGRATION_CONTROL, userspace
 must also set up an MSR filter to process writes to MSR_KVM_MIGRATION_CONTROL.
+
+9. KVM_HC_LOCK_CR_UPDATE
+------------------------
+
+:Architecture: x86
+:Status: active
+:Purpose: Request some control registers to be restricted.
+
+- a0: identify a control register
+- a1: bit mask to make some flags read-only
+- a2: optional KVM_LOCK_CR_UPDATE_VERSION flag that will return the version of
+      this hypercall. Version 1 supports CR0 and CR4 pinning.
+
+The hypercall lets a guest request control register flags to be pinned for
+itself.
+
+Returns 0 on success or a KVM error code otherwise.
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index a1efa7907a0b..cfc17f3d1877 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -149,4 +149,6 @@ struct kvm_vcpu_pv_apf_data {
 #define KVM_PV_EOI_ENABLED KVM_PV_EOI_MASK
 #define KVM_PV_EOI_DISABLED 0x0
 
+#define KVM_LOCK_CR_UPDATE_VERSION (1 << 0)
+
 #endif /* _UAPI_ASM_X86_KVM_PARA_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 605c26c009c8..69695d9d6e2a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -398,8 +398,11 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
 }
 
 /* These bits should not change their value after CPU init is finished. */
-static const unsigned long cr4_pinned_mask = X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
-					     X86_CR4_FSGSBASE | X86_CR4_CET | X86_CR4_FRED;
+const unsigned long cr4_pinned_mask = X86_CR4_SMEP | X86_CR4_SMAP |
+				      X86_CR4_UMIP | X86_CR4_FSGSBASE |
+				      X86_CR4_CET | X86_CR4_FRED;
+EXPORT_SYMBOL_GPL(cr4_pinned_mask);
+
 static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
 static unsigned long cr4_pinned_bits __ro_after_init;
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 22411f4aff53..7ba970b525f7 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5453,6 +5453,11 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 	case 0: /* mov to cr */
 		val = kvm_register_read(vcpu, reg);
 		trace_kvm_cr_write(cr, val);
+
+		ret = heki_check_cr(vcpu, cr, val);
+		if (ret)
+			return ret;
+
 		switch (cr) {
 		case 0:
 			err = handle_set_cr0(vcpu, val);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 91478b769af0..a5f47be59abc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8281,11 +8281,86 @@ static unsigned long emulator_get_cr(struct x86_emulate_ctxt *ctxt, int cr)
 	return value;
 }
 
+#ifdef CONFIG_HEKI
+
+#define HEKI_ABI_VERSION 1
+
+static int heki_lock_cr(struct kvm_vcpu *const vcpu, const unsigned long cr,
+			unsigned long pin, unsigned long flags)
+{
+	if (flags) {
+		if ((flags == KVM_LOCK_CR_UPDATE_VERSION) && !cr && !pin)
+			return HEKI_ABI_VERSION;
+		return -KVM_EINVAL;
+	}
+
+	if (!pin)
+		return -KVM_EINVAL;
+
+	switch (cr) {
+	case 0:
+		/* Cf. arch/x86/kernel/cpu/common.c */
+		if (!(pin & X86_CR0_WP))
+			return -KVM_EINVAL;
+
+		if ((pin & read_cr0()) != pin)
+			return -KVM_EINVAL;
+
+		atomic_long_or(pin, &vcpu->kvm->heki_pinned_cr0);
+		return 0;
+	case 4:
+		/* Checks for irrelevant bits. */
+		if ((pin & cr4_pinned_mask) != pin)
+			return -KVM_EINVAL;
+
+		/* Ignores bits not present in host. */
+		pin &= __read_cr4();
+		atomic_long_or(pin, &vcpu->kvm->heki_pinned_cr4);
+		return 0;
+	}
+	return -KVM_EINVAL;
+}
+
+int heki_check_cr(struct kvm_vcpu *const vcpu, const unsigned long cr,
+		  const unsigned long val)
+{
+	unsigned long pinned;
+
+	switch (cr) {
+	case 0:
+		pinned = atomic_long_read(&vcpu->kvm->heki_pinned_cr0);
+		if ((val & pinned) != pinned) {
+			pr_warn_ratelimited(
+				"heki: Blocked CR0 update: 0x%lx\n", val);
+			kvm_inject_gp(vcpu, 0);
+			return 1;
+		}
+		return 0;
+	case 4:
+		pinned = atomic_long_read(&vcpu->kvm->heki_pinned_cr4);
+		if ((val & pinned) != pinned) {
+			pr_warn_ratelimited(
+				"heki: Blocked CR4 update: 0x%lx\n", val);
+			kvm_inject_gp(vcpu, 0);
+			return 1;
+		}
+		return 0;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(heki_check_cr);
+
+#endif /* CONFIG_HEKI */
+
 static int emulator_set_cr(struct x86_emulate_ctxt *ctxt, int cr, ulong val)
 {
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
 	int res = 0;
 
+	res = heki_check_cr(vcpu, cr, val);
+	if (res)
+		return res;
+
 	switch (cr) {
 	case 0:
 		res = kvm_set_cr0(vcpu, mk_cr_64(kvm_read_cr0(vcpu), val));
@@ -10142,6 +10217,15 @@ int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 		vcpu->arch.complete_userspace_io = complete_hypercall_exit;
 		return 0;
 	}
+#ifdef CONFIG_HEKI
+	case KVM_HC_LOCK_CR_UPDATE:
+		if (a0 > U32_MAX) {
+			ret = -KVM_EINVAL;
+		} else {
+			ret = heki_lock_cr(vcpu, a0, a1, a2);
+		}
+		break;
+#endif /* CONFIG_HEKI */
 	default:
 		ret = -KVM_ENOSYS;
 		break;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index a8b71803777b..ade7d68ddaff 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -290,6 +290,26 @@ static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
 	return !(kvm->arch.disabled_quirks & quirk);
 }
 
+#ifdef CONFIG_HEKI
+
+int heki_check_cr(struct kvm_vcpu *vcpu, unsigned long cr, unsigned long val);
+
+#else /* CONFIG_HEKI */
+
+static inline int heki_check_cr(struct kvm_vcpu *vcpu, unsigned long cr,
+				unsigned long val)
+{
+	return 0;
+}
+
+static inline int heki_lock_cr(struct kvm_vcpu *const vcpu, unsigned long cr,
+			       unsigned long pin)
+{
+	return 0;
+}
+
+#endif /* CONFIG_HEKI */
+
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
@@ -327,6 +347,8 @@ extern u64 host_xcr0;
 extern u64 host_xss;
 extern u64 host_arch_capabilities;
 
+extern const unsigned long cr4_pinned_mask;
+
 extern struct kvm_caps kvm_caps;
 
 extern bool enable_pmu;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 48f31dcd318a..6ff13937929a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -836,6 +836,11 @@ struct kvm {
 	bool vm_bugged;
 	bool vm_dead;
 
+#ifdef CONFIG_HEKI
+	atomic_long_t heki_pinned_cr0;
+	atomic_long_t heki_pinned_cr4;
+#endif /* CONFIG_HEKI */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 	struct notifier_block pm_notifier;
 #endif
diff --git a/include/uapi/linux/kvm_para.h b/include/uapi/linux/kvm_para.h
index 960c7e93d1a9..2ed418704603 100644
--- a/include/uapi/linux/kvm_para.h
+++ b/include/uapi/linux/kvm_para.h
@@ -30,6 +30,7 @@
 #define KVM_HC_SEND_IPI		10
 #define KVM_HC_SCHED_YIELD		11
 #define KVM_HC_MAP_GPA_RANGE		12
+#define KVM_HC_LOCK_CR_UPDATE		13
 
 /*
  * hypercalls use architecture specific
-- 
2.45.0


