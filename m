Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19863F917F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173260.316195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCk-0002pI-24; Fri, 27 Aug 2021 00:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173260.316195; Fri, 27 Aug 2021 00:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCj-0002Zb-Gk; Fri, 27 Aug 2021 00:58:45 +0000
Received: by outflank-mailman (input) for mailman id 173260;
 Fri, 27 Aug 2021 00:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p99U=NS=flex--seanjc.bounces.google.com=3hzgoYQYKCagaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@srs-us1.protection.inumbo.net>)
 id 1mJQC1-0001Ok-Go
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:01 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f18ca08-29d9-4037-8392-b6975ecc59cb;
 Fri, 27 Aug 2021 00:57:43 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 83-20020a251956000000b0059948f541cbso4913038ybz.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:43 -0700 (PDT)
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
X-Inumbo-ID: 1f18ca08-29d9-4037-8392-b6975ecc59cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=BKACFpkyclmSNZOzZCvoQ85Q5j0ibf+pUktwZSnA2VE=;
        b=uDGNAKy3X8wgG4FPiD0TolBumhb9mvdkmZ5pXk9jMiSPuEv6IzBrAY2yREw0PMXzi4
         9KSpq/MIGbNRkWH+90XdYBr08BMNemkexcswrPOoxwAVc9eNlnrdscRQYZv1qWj5RVJQ
         Uu5cGBTR2dLrVmB+fbyQ0f2saIhD4/u6CJuZoKrKwJgASrh55N/fvDtm72qpzzHlRHHS
         5MsttnXx7/8NWuUSXTy9DIxqvoIYMeSt7SrSLZoZYq6Cz9pNjweGfVRu94/2EucLJNq+
         age0a4QpYT7qPSqnVfS8AXaoz7sVZQi9saQiXGh1vd9lEsvZMwvUn3vvO8JTj1WmcE1u
         xE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=BKACFpkyclmSNZOzZCvoQ85Q5j0ibf+pUktwZSnA2VE=;
        b=kyee9irAyYlVkexsHLveXHcWJ0AnvqKykb+R0DJjRyfrZZbhMWtDunbKrAb9fvOUIX
         QF92YRXKU1fEhxstxMd3Gr0TwJD++UvwRDccnd/3w+PJoforqwB78Eof76e3Si7CgBh9
         4RfXWiy1czRAiB7t9AlUkvOi1Q/yxQ57rURela80dxRLuljiSYdA84MRAoUOYAlcObCe
         Ira1kgtQq/T2vrCPkCvT5NkoHEy3ogxUTrbdG/P4YPt6rkSnZqb4sobPksQoXnAhAHPX
         OEOOKvxSAFbVMOmhKK0ENtO3s+AfN5A0tA0vnOwr1KbQZSx4UiKRxBd8yOwHS5cre2QH
         TuCQ==
X-Gm-Message-State: AOAM532gtGVLoE9BYP/gcl7hGYIKYJErK8gxH9SoD2HOY3P+uZBuLnPa
	yZvg3lenQkrWsSf0TkcFygqRLS5WWVc=
X-Google-Smtp-Source: ABdhPJw0TCNYmfMyjk3pp1TIQWtZYYXC1+CmXfKBRCTWftHhXnIexf6rTbOO9IR4Dc7O+dyoa9Bys+IIj5k=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:4f8a:: with SMTP id d132mr1902818ybb.486.1630025863019;
 Thu, 26 Aug 2021 17:57:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:09 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-7-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 06/15] KVM: x86: Register perf callbacks only when actively
 handling interrupt
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

Register KVM's perf callback only when handling an interrupt that may be
a PMI (sadly this includes IRQs), and unregister the callback immediately
after handling the interrupt (or closing the window).  Registering the
callback on a per-CPU basis (with preemption disabled!), fixes a mostly
theoretical bug where perf could dereference a NULL pointer due to KVM
unloading and unregistering the callbacks in between perf queries of the
callback functions.  The precise registration will also allow for future
cleanups and optimizations, e.g. the existence of the callbacks can serve
as the "in guest" check.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c         | 27 +++++++++++++++++----------
 arch/x86/kvm/x86.h         | 10 ++++++++++
 include/linux/perf_event.h |  2 ++
 kernel/events/core.c       | 12 ++++++++++++
 4 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bae951344e28..bc4ee6ea7752 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8274,28 +8274,31 @@ int kvm_is_in_guest(void)
 
 static int kvm_is_user_mode(void)
 {
-	int user_mode = 3;
+	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
-	if (__this_cpu_read(current_vcpu))
-		user_mode = static_call(kvm_x86_get_cpl)(__this_cpu_read(current_vcpu));
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	return user_mode != 0;
+	return static_call(kvm_x86_get_cpl)(vcpu) != 0;
 }
 
 static unsigned long kvm_get_guest_ip(void)
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
 
 static void kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
 	kvm_make_request(KVM_REQ_PMI, vcpu);
 	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
 			(unsigned long *)&vcpu->arch.pmu.global_status);
@@ -8308,6 +8311,12 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.handle_intel_pt_intr	= NULL,
 };
 
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
+
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11063,7 +11072,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
 		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
@@ -11092,7 +11100,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	perf_unregister_guest_info_callbacks();
 	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 7d66d63dc55a..5cedc0e8a5d5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -387,15 +387,25 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+
 DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
 {
 	__this_cpu_write(current_vcpu, vcpu);
+
+	kvm_register_perf_callbacks();
 }
 
 static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 {
+	kvm_unregister_perf_callbacks();
+
 	__this_cpu_write(current_vcpu, NULL);
 }
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index c98253dae037..7a367bf1b78d 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,6 +1238,8 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
+extern void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
+extern void __perf_unregister_guest_info_callbacks(void);
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9bc1375d6ed9..2f28d9d8dc94 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6485,6 +6485,18 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 
+void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+{
+	__this_cpu_write(perf_guest_cbs, cbs);
+}
+EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
+
+void __perf_unregister_guest_info_callbacks(void)
+{
+	__this_cpu_write(perf_guest_cbs, NULL);
+}
+EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	int cpu;
-- 
2.33.0.259.gc128427fd7-goog


