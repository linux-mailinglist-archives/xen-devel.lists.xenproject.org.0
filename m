Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D793F9183
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173254.316163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCh-00027A-Oh; Fri, 27 Aug 2021 00:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173254.316163; Fri, 27 Aug 2021 00:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCh-0001v0-Ib; Fri, 27 Aug 2021 00:58:43 +0000
Received: by outflank-mailman (input) for mailman id 173254;
 Fri, 27 Aug 2021 00:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0OVl=NS=flex--seanjc.bounces.google.com=3gDgoYQYKCaETFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@srs-us1.protection.inumbo.net>)
 id 1mJQBm-0001Ok-GI
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:57:46 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3372db26-7083-4b2e-a5f9-6f1583949114;
 Fri, 27 Aug 2021 00:57:36 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 f8-20020a2585480000b02905937897e3daso1585674ybn.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:36 -0700 (PDT)
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
X-Inumbo-ID: 3372db26-7083-4b2e-a5f9-6f1583949114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=eP9YaQYNW7r9kDgd3qsENCfayArScJUKtUCsIWC6thw=;
        b=gOniotWtk3lF6UxW7PdX3cKBegQhQ5iSNPyRKiZnf7i4heaRZqrQ1XCsGWban4SbR3
         zT78dU1sNSEA3eGttRbFIpH02VqDw13xoWcy7Sfk4tIv++vO+etrK6M3ti5f11KLiaWk
         1daQFTv1q/kqM0brBtb0nHD2u0m8MDQpM5+8PsH3w6Z05mKqPfmuHjU7qM9+5Sj+kcBb
         gAYqeA/M/6f3cWOzErOPhZXRkPntcLBBVHGFfK6lCV5FFCTaXib0sUPQGN6FqPZYEFCR
         UHQKuNrOdNIpgxqKsPRBI3amPjQd+V9fPU7ixqHBNtOzNWjW5HvPxd+EPsCi/2nrvxhZ
         DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=eP9YaQYNW7r9kDgd3qsENCfayArScJUKtUCsIWC6thw=;
        b=gHLiPJonmHyBm3ZoO54+Ydg82T3Ek1w/72jYsdhHcVjxrKJ1rDikzmJm161Gw/3sUl
         qW0vYymuMnT/8Pk/bvCLd9nzmvshjUUkwXWDjeX1H66W4mYybH/gN+ZgIEyOIiyv9DMG
         jFnK8oEdaMjQmg96l+D9DiV82XwgcOukZE4PqPCLxC/MCtHHxjTvgB7DVWqWHrG+Siux
         It0rEIYFh3rHaICwYTzg8t/M5NVmwl5HjAtkfjGXtdUelF4I19K7vY/b6eejk4DxDk01
         90tmbz0q3EiWXl+h1gacRJaK1d75Ub8xbSLya8OnueBiPX6YU/4uYvmMfTVcyWBlOtng
         me4Q==
X-Gm-Message-State: AOAM531u1jS6BjvsjOGfJXqvIukoDYYGzN2TJHn4FOqgpoOOs7bsynE1
	floGSm4kfayXybAcXLnSRKe3/TYql2k=
X-Google-Smtp-Source: ABdhPJwZRp53eRz0Z/v+xyvl25SCOdBtWAUo/SC0imtmbIVISGgjbBGEInyTeCMf+kN6ORdJxMuSSuIsoks=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:2785:: with SMTP id n127mr1853573ybn.235.1630025856235;
 Thu, 26 Aug 2021 17:57:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:06 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 03/15] perf: Stop pretending that perf can handle multiple
 guest callbacks
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

Drop the 'int' return value from the perf (un)register callbacks helpers
and stop pretending perf can support multiple callbacks.  The 'int'
returns are not future proofing anything as none of the callers take
action on an error.  It's also not obvious that there will ever be
cotenant hypervisors, and if there are, that allowing multiple callbacks
to be registered is desirable or even correct.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  4 ++--
 arch/arm64/kvm/perf.c             |  8 ++++----
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/perf_event.h        | 11 +++++------
 kernel/events/core.c              | 11 ++---------
 5 files changed, 14 insertions(+), 22 deletions(-)

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
index 2d510ad750ed..05c0efba3cd1 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1237,8 +1237,8 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 u16 flags);
 
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
-extern int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
-extern int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_unregister_guest_info_callbacks(void);
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
@@ -1481,10 +1481,9 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
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
index 464917096e73..baae796612b9 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,24 +6482,17 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
-/*
- * We assume there is only KVM supporting the callbacks.
- * Later on, we might change it to a list if there is
- * another virtualization implementation supporting the callbacks.
- */
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
-int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	perf_guest_cbs = cbs;
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
-int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_unregister_guest_info_callbacks(void)
 {
 	perf_guest_cbs = NULL;
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 
-- 
2.33.0.259.gc128427fd7-goog


