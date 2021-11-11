Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4541144CFF4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224586.388003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzeK-0005zD-T6; Thu, 11 Nov 2021 02:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224586.388003; Thu, 11 Nov 2021 02:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzeK-0005rX-Ny; Thu, 11 Nov 2021 02:17:12 +0000
Received: by outflank-mailman (input) for mailman id 224586;
 Thu, 11 Nov 2021 02:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKvj=P6=flex--seanjc.bounces.google.com=3BXuMYQYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1mkzVY-0004E5-29
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:08:08 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 355f8803-4294-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 03:08:07 +0100 (CET)
Received: by mail-pg1-x54a.google.com with SMTP id
 j18-20020a63fc12000000b002dd2237eb1cso2508252pgi.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:08:07 -0800 (PST)
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
X-Inumbo-ID: 355f8803-4294-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=/YIqAIDcHFuwAQfZoGFGpCQkR+bed1xlNZgqyVQf28E=;
        b=e7isaWxZT/WwPXJW8Qx7YWkAPbx8+WwYXnyULWOmnQdcxssVcaIQUjV7l9ocfrzj/1
         z1dBSLWak0xiQCBEw4pQBZlvDqmdEqTRJUP+Z40PCX/NEachrYFN0ukP1ZGzNNDz6hC8
         ypXPhlkEqsMB53P1s/G0Q8Dg2n01FI0WXWYQbrYIvGu6VNt899fuhgkx/Wx+L0fumdK0
         DgUKSgQ9NGEeMAWRcQat/qxuE6PEmuWNOgqyoFgMMRQ8e+j8axNSLg3wwL/mVfqWCfju
         QtZrvT4+EtSeFefALo6da9zs6M611OWSowxrRuYjpqYPmBtDlX0Y/PjaKJe2gSlYH6Gm
         X8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=/YIqAIDcHFuwAQfZoGFGpCQkR+bed1xlNZgqyVQf28E=;
        b=diyZP+EqWc/AHfEph704YUtq3F6Vn9j46zuZFtgStta1/c0gAphCQYp05dsottdD6w
         2++Ppy8ySCXyLPIn5TZj06Xf0s2GJ6PUQwjjWPcDd7iNEtCGxh908eTCij3uzXizTkxV
         RgrMeKyti3f3Js4H1n8MnlgV8nTS5BaZJxILIw8302oQjBs6RVl/xFMlVsCTk1XNYG5v
         CoSnwDd9DRLmOJgXDIdF/K2egw0nepOiUX1fEojaoHQtja1UuOHocJHc2iargouUW3V2
         Qjjqtn8obFxBFCm8bApcXXmGE288uH4LHOuZ5DCUtYh70S8HBXRqNyYkBbAxtRNAtEug
         KHZw==
X-Gm-Message-State: AOAM532h9WzU1qZVvbIZhu4+tNHs9+IfAP0LHDI0ziljPhdpfi108M+z
	IzorTxPCdXI4P6lThsHs3s4a7HVbh/k=
X-Google-Smtp-Source: ABdhPJzNTXRg0manAu6ukUacQ/aIuXahOUAgZ+nsuAEIEEiY7jrc1n1CQ1z/uBehVd+2Ly8STcnpos0K1ss=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:e88a:b0:141:dfde:eed7 with SMTP id
 w10-20020a170902e88a00b00141dfdeeed7mr4246270plg.17.1636596485366; Wed, 10
 Nov 2021 18:08:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:36 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-16-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 15/17] KVM: arm64: Hide kvm_arm_pmu_available behind CONFIG_HW_PERF_EVENTS=y
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

Move the definition of kvm_arm_pmu_available to pmu-emul.c and, out of
"necessity", hide it behind CONFIG_HW_PERF_EVENTS.  Provide a stub for
the key's wrapper, kvm_arm_support_pmu_v3().  Moving the key's definition
out of perf.c will allow a future commit to delete perf.c entirely.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/image-vars.h |  2 ++
 arch/arm64/kvm/perf.c          |  2 --
 arch/arm64/kvm/pmu-emul.c      |  2 ++
 include/kvm/arm_pmu.h          | 19 ++++++++++++-------
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c96a9a0043bf..7eaf1f7c4168 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -102,7 +102,9 @@ KVM_NVHE_ALIAS(__stop___kvm_ex_table);
 KVM_NVHE_ALIAS(kvm_arm_hyp_percpu_base);
 
 /* PMU available static key */
+#ifdef CONFIG_HW_PERF_EVENTS
 KVM_NVHE_ALIAS(kvm_arm_pmu_available);
+#endif
 
 /* Position-independent library routines */
 KVM_NVHE_ALIAS_HYP(clear_page, __pi_clear_page);
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 374c496a3f1d..52cfab253c65 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -11,8 +11,6 @@
 
 #include <asm/kvm_emulate.h>
 
-DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
 void kvm_perf_init(void)
 {
 	kvm_register_perf_callbacks(NULL);
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a5e4bbf5e68f..3308ceefa129 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -14,6 +14,8 @@
 #include <kvm/arm_pmu.h>
 #include <kvm/arm_vgic.h>
 
+DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
 static void kvm_pmu_create_perf_event(struct kvm_vcpu *vcpu, u64 select_idx);
 static void kvm_pmu_update_pmc_chained(struct kvm_vcpu *vcpu, u64 select_idx);
 static void kvm_pmu_stop_counter(struct kvm_vcpu *vcpu, struct kvm_pmc *pmc);
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 90f21898aad8..f9ed4c171d7b 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -13,13 +13,6 @@
 #define ARMV8_PMU_CYCLE_IDX		(ARMV8_PMU_MAX_COUNTERS - 1)
 #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
 
-DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
-static __always_inline bool kvm_arm_support_pmu_v3(void)
-{
-	return static_branch_likely(&kvm_arm_pmu_available);
-}
-
 #ifdef CONFIG_HW_PERF_EVENTS
 
 struct kvm_pmc {
@@ -36,6 +29,13 @@ struct kvm_pmu {
 	struct irq_work overflow_work;
 };
 
+DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
+static __always_inline bool kvm_arm_support_pmu_v3(void)
+{
+	return static_branch_likely(&kvm_arm_pmu_available);
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -65,6 +65,11 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
+static inline bool kvm_arm_support_pmu_v3(void)
+{
+	return false;
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	(false)
 static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 					    u64 select_idx)
-- 
2.34.0.rc0.344.g81b53c2807-goog


