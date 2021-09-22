Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95199413E95
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192032.342297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwd-0000I7-C2; Wed, 22 Sep 2021 00:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192032.342297; Wed, 22 Sep 2021 00:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwd-0000G2-65; Wed, 22 Sep 2021 00:17:03 +0000
Received: by outflank-mailman (input) for mailman id 192032;
 Wed, 22 Sep 2021 00:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFIr=OM=flex--seanjc.bounces.google.com=3eHNKYQYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@srs-us1.protection.inumbo.net>)
 id 1mSpnS-0000pt-SV
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:07:34 +0000
Received: from mail-qv1-xf49.google.com (unknown [2607:f8b0:4864:20::f49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1332bf12-5f7c-4a6e-a8fc-38bad2e7c2d1;
 Wed, 22 Sep 2021 00:06:17 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id
 w10-20020a0cb54a000000b0037a9848b92fso8990393qvd.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:06:17 -0700 (PDT)
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
X-Inumbo-ID: 1332bf12-5f7c-4a6e-a8fc-38bad2e7c2d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=6Icjr/ACV1XsfVUfKjKZi9JPiJa8aiN8zAxRj7zkg58=;
        b=lodyKSv5s5L9FuAs5M0G0kMx/zVrl93Ee68EIaXohxy+LQ+d8m+TXXDCkue1vWSnVV
         ViQYh0dHzV9iJNwFB6yjTYg0JxCSrOowA0Ye/c7r2V2aOqrV/LmltE8U0Zt+k8GFxu9h
         2la1t1UJWIkOSVjh2yV0uEzAZiwrdvHA0zHKk46Dq/OX6UEK0uGcCRXWfsZIO3eQTKqS
         ConZVcLZT+4wy0TFLTPjpjtLAOIGL9YLutbbFVl73zcBDJOID6vgd5v4Ln2GZlWHiqop
         o86J2gkYFymM8L2O6tTywYJkqskrpEBIkrTz73Gvpj/PmQ5jYyO0eaPS4tdU3c0It1S4
         A6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=6Icjr/ACV1XsfVUfKjKZi9JPiJa8aiN8zAxRj7zkg58=;
        b=RsC5Gw6fMmWMVJXp8G2aWGu5Ze4LxGdkgbGhLx9XVmK59ItRuoJ3pQKG6mJK1/VBjo
         EvJ85ntvKc/LZBIsumKDg05fmcEKytKWbWKOFNk1yaN8qdXlIFTG+toslNwq1nhFsJI2
         nR0sJlCyxmq6FZj7jQOUrMWmxi82tyQBBeLvz4g6TdP1DBMUaiaU8tHIG/vUGxVeG5tZ
         TkzRQQm9n7VCCDTE4cDFF6rPjlKBpRqcz0CypoTvTA8/7G9wch91pjBvMvC3dLkwGnec
         RvydSoxBZZHgf7lzImG9hUDQXwudZpU7AkJghYGlWmtnsJHn/92T/fyIliWGMbo5qDso
         9jeg==
X-Gm-Message-State: AOAM533RCwWVe7c5h2bXhq31HBrCBq2A9PyT8+hZRgLvSInnHv8Bg2pB
	uvnj2j3s2/K8kD4mEP4hJHmBXJegEKc=
X-Google-Smtp-Source: ABdhPJzlQAzmSdl3nY/YBM5ZcGipBomoLCiu3CqrYXxVZ0o44Jz0iqe4JnQizT8BW9SKS2QFzZIdD02YgoQ=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a25:7350:: with SMTP id o77mr39621975ybc.549.1632269176658;
 Tue, 21 Sep 2021 17:06:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:32 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-16-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 15/16] KVM: arm64: Drop perf.c and fold its tiny bits of
 code into arm.c / pmu.c
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

Call KVM's (un)register perf callbacks helpers directly from arm.c, and
move the PMU bits into pmu.c and rename the related helper accordingly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ---
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/arm.c              |  6 ++++--
 arch/arm64/kvm/perf.c             | 27 ---------------------------
 arch/arm64/kvm/pmu.c              |  8 ++++++++
 include/kvm/arm_pmu.h             |  1 +
 6 files changed, 14 insertions(+), 33 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 828b6eaa2c56..f141ac65f4f1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -670,9 +670,6 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
-void kvm_perf_init(void);
-void kvm_perf_teardown(void);
-
 #ifdef CONFIG_GUEST_PERF_EVENTS
 static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..0bcc378b7961 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_KVM) += hyp/
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 $(KVM)/vfio.o $(KVM)/irqchip.o $(KVM)/binary_stats.o \
-	 arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
+	 arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 inject_fault.o va_layout.o handle_exit.o \
 	 guest.o debug.o reset.o sys_regs.o \
 	 vgic-sys-reg-v3.o fpsimd.o pmu.o \
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2b542fdc237e..48f89d80f464 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1744,7 +1744,9 @@ static int init_subsystems(void)
 	if (err)
 		goto out;
 
-	kvm_perf_init();
+	kvm_pmu_init();
+	kvm_register_perf_callbacks(NULL);
+
 	kvm_sys_reg_table_init();
 
 out:
@@ -2160,7 +2162,7 @@ int kvm_arch_init(void *opaque)
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_perf_teardown();
+	kvm_unregister_perf_callbacks();
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
deleted file mode 100644
index 0b902e0d5b5d..000000000000
--- a/arch/arm64/kvm/perf.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Based on the x86 implementation.
- *
- * Copyright (C) 2012 ARM Ltd.
- * Author: Marc Zyngier <marc.zyngier@arm.com>
- */
-
-#include <linux/perf_event.h>
-#include <linux/kvm_host.h>
-
-#include <asm/kvm_emulate.h>
-
-DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
-void kvm_perf_init(void)
-{
-	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
-		static_branch_enable(&kvm_arm_pmu_available);
-
-	kvm_register_perf_callbacks(NULL);
-}
-
-void kvm_perf_teardown(void)
-{
-	kvm_unregister_perf_callbacks();
-}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 03a6c1f4a09a..d98b57a17043 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -7,6 +7,14 @@
 #include <linux/perf_event.h>
 #include <asm/kvm_hyp.h>
 
+DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
+void kvm_pmu_init(void)
+{
+	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
+		static_branch_enable(&kvm_arm_pmu_available);
+}
+
 /*
  * Given the perf event attributes and system type, determine
  * if we are going to need to switch counters at guest entry/exit.
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 864b9997efb2..42270676498d 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -14,6 +14,7 @@
 #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
 
 DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+void kvm_pmu_init(void);
 
 static __always_inline bool kvm_arm_support_pmu_v3(void)
 {
-- 
2.33.0.464.g1972c5931b-goog


