Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C443F917C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173266.316225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCm-0003Z9-J9; Fri, 27 Aug 2021 00:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173266.316225; Fri, 27 Aug 2021 00:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCl-0003Ic-TN; Fri, 27 Aug 2021 00:58:47 +0000
Received: by outflank-mailman (input) for mailman id 173266;
 Fri, 27 Aug 2021 00:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RkQr=NS=flex--seanjc.bounces.google.com=3jTgoYQYKCa4gSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@srs-us1.protection.inumbo.net>)
 id 1mJQCG-0001Ok-Ha
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:16 +0000
Received: from mail-yb1-xb49.google.com (unknown [2607:f8b0:4864:20::b49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c4118ad-0b03-41e3-ad43-b0d334ef572c;
 Fri, 27 Aug 2021 00:57:50 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 b198-20020a2534cf000000b0059bae206c16so4867074yba.18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:50 -0700 (PDT)
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
X-Inumbo-ID: 7c4118ad-0b03-41e3-ad43-b0d334ef572c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=URtT+dB+jST+gZg2WrKoRMxEnnvOGJ2KoTQrrGCl7oY=;
        b=QMyMyW8S+UdMR+QA1dMUWcj1nvV4awF9BhU25l5pymBfzXZEUMcpGdZL0BxhsVUTrH
         wwnMpXfbLu54yCHCCtgV2+evWSEDbv+dXSyufVgmFg3L3pcb8KjT8SWqp9r8G6c8kSxp
         pLoenRdXaSghZld5WzFyBNBLJKTOW1nT55C2Sva+2Zv2/tE3SOwtK+UMfx8kFjDDzDJK
         t9N4Z7NvWPgoYl3X+kWUq4jXGlgLXhzG/pWtR82HNRigu9ZhzdlUBMpgi1gtDf4WrxBF
         kafWIVt0+yu4zS7kftTHzy2ydn7SjePf/9Jkus2cGK2V680+vkX5sdV4/U0/KQUCmBkV
         IaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=URtT+dB+jST+gZg2WrKoRMxEnnvOGJ2KoTQrrGCl7oY=;
        b=hng29CuruFUB08ZXTswDAJwPV2dnHu3oh+oIPm4DdsHzWJU5cRaDencVYKrTZJANUF
         bAKS7gLlm4WxWke9Foli/FZWc+MOozUZZL/t3xErX4kHL2ETjendZme2FJYpvBnqwOmE
         QTwmN0nFb0i1zbGvq38gvHaBa/P5D5ehKos5Dj1uz9La1T4o+9xCiLJPQ5G4SwZizzpW
         /hWTmdquvqx07Ms5KuioUBK1agJ8aPWwBn3UTsXDh7viBC8DCQPA1fn6HgNPwV6u3Mgc
         GBm9yYAux1QADa2ThWKJD/RX0/ZPFRqxv8NtIJYfJO6SbISOd5F1JwC8WAX7qDWZpBL6
         mu0Q==
X-Gm-Message-State: AOAM530eDd1bTabQsSJr+paWs9V4UiFFCs35qSYQwpWFc/9+qC44r330
	kPgiK+RldSDYL4rr1paQAUXL6d4+1BQ=
X-Google-Smtp-Source: ABdhPJx9DS89m5L71YrEHQukjJpAjWUrBsdJUeHGSEcBnJIrikQ0Z8d/TNTUFittLfnOlgJyGEhI291z6yw=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:afcd:: with SMTP id d13mr1863343ybj.504.1630025869822;
 Thu, 26 Aug 2021 17:57:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:12 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-10-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 09/15] KVM: arm64: Register/unregister perf callbacks at vcpu load/put
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

Register/unregister perf callbacks at vcpu_load()/vcpu_put() instead of
keeping the callbacks registered for all eternity after loading KVM.
This will allow future cleanups and optimizations as the registration
of the callbacks signifies "in guest".  This will also allow moving the
callbacks into common KVM as they arm64 and x86 now have semantically
identical callback implementations.

Note, KVM could likely be more precise in its registration, but that's a
cleanup for the future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 12 ++++++++++-
 arch/arm64/kvm/arm.c              |  5 ++++-
 arch/arm64/kvm/perf.c             | 36 ++++++++++++++-----------------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ed940aec89e0..007c38d77fd9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -671,7 +671,17 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
 void kvm_perf_init(void);
-void kvm_perf_teardown(void);
+
+#ifdef CONFIG_PERF_EVENTS
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+#else
+static inline void kvm_register_perf_callbacks(void) {}
+static inline void kvm_unregister_perf_callbacks(void) {}
+#endif
 
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e9a2b8f27792..ec386971030d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -429,10 +429,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu_ptrauth_disable(vcpu);
 	kvm_arch_vcpu_load_debug_state_flags(vcpu);
+
+	kvm_register_perf_callbacks();
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	kvm_unregister_perf_callbacks();
 	kvm_arch_vcpu_put_debug_state_flags(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
@@ -2155,7 +2158,7 @@ int kvm_arch_init(void *opaque)
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_perf_teardown();
+
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 039fe59399a2..2556b0a3b096 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,33 +13,30 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
+#ifdef CONFIG_PERF_EVENTS
 static int kvm_is_in_guest(void)
 {
-        return kvm_get_running_vcpu() != NULL;
+	return true;
 }
 
 static int kvm_is_user_mode(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	vcpu = kvm_get_running_vcpu();
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	if (vcpu)
-		return !vcpu_mode_priv(vcpu);
-
-	return 0;
+	return !vcpu_mode_priv(vcpu);
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
@@ -48,15 +45,14 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.get_guest_ip	= kvm_get_guest_ip,
 };
 
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+#endif /* CONFIG_PERF_EVENTS*/
+
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
-
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-}
-
-void kvm_perf_teardown(void)
-{
-	perf_unregister_guest_info_callbacks();
 }
-- 
2.33.0.259.gc128427fd7-goog


