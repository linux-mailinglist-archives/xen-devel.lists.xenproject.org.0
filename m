Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7103F91CD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173324.316294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFL-0006Eu-C4; Fri, 27 Aug 2021 01:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173324.316294; Fri, 27 Aug 2021 01:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFL-00066e-2w; Fri, 27 Aug 2021 01:01:27 +0000
Received: by outflank-mailman (input) for mailman id 173324;
 Fri, 27 Aug 2021 01:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6/I=NS=flex--seanjc.bounces.google.com=3ljgoYQYKCbcpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@srs-us1.protection.inumbo.net>)
 id 1mJQCa-0001Ok-Ia
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:36 +0000
Received: from mail-yb1-xb49.google.com (unknown [2607:f8b0:4864:20::b49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ab3a2a6-1df2-41eb-83ac-ec6047aa3f43;
 Fri, 27 Aug 2021 00:57:58 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 f64-20020a2538430000b0290593bfc4b046so4871411yba.9
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:58 -0700 (PDT)
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
X-Inumbo-ID: 9ab3a2a6-1df2-41eb-83ac-ec6047aa3f43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=2Yb1yGb5fDFVhiHzotpZzkExCo5t0u5SIR8VcomG6Y8=;
        b=oWsDHoiAgF+Rhb3fLUc6FI/hmLn3kcWZvx8XtETflRRGA0RhU5jY1yIZDAGsQhoBpp
         1GJBEG0ciVc5J+SUb8a+Ao9XHC+o6ePIJEaj6rwWcsyMNZs4gGZqc7lzXXQCKUD4cl0c
         TRH/cFXEm6Rx0y/hBRfKtUfta8tkBrKjcdPY8umqV9V9fsCKuHTQ7mSyJMBSrgahXH0x
         lar1IXWEl6SGlmj++N0CiAloA9rKj68iYW0I4yXj2kb3Jns102ph3m6+Q2Bdd5QiIhz6
         k5kD3EQUqFV+FChTG+7KKqC3KPQuPp+dCSp1iLM55DlUy2uQ6DK+nKRfDfTvKe6dg2+c
         5JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=2Yb1yGb5fDFVhiHzotpZzkExCo5t0u5SIR8VcomG6Y8=;
        b=JwinZL+vmvOcRzJ/YT63vGnwZPwCqZZ7jSJLompRLVdL3oEwQy2FIXjjOLDVKKo6TK
         46UR4cMrhQN3/MlUiHks+Z3r93nuzCDpyGv4rXy/RcZoZ2eIdQ3QOwfqbuRotqhMvDTy
         QINLSRu+EComn7hpC7btmHGY9UAWDHAySxdtI5d9ILvwu1ypjEXNq4J07HPZbWlNRmCm
         vx8w9VCrO3UEZLhXG//eOkAliCxPkFGJxpikgr3OxDUyIDx2rnz4zSno4xYYGs/zzVl7
         u01GZXyhq+RuDkgxkRnKZZta41jXZWJ5LUxVJdQlxcPvzr47cizbhyZBCwv5Hcvb+gwP
         e7Sw==
X-Gm-Message-State: AOAM533oimQRxsGeOGSeqNyMac7LKZ82PY3IrUm3a+mKR+4saTCyImiP
	vLoZYDb0sgICuTqZ6b/3/TdeyPCvi2c=
X-Google-Smtp-Source: ABdhPJyKOmCo1JFta7E0dfGCF9Bd2CrFpGk6nB1tappPD2rgxLfvtZsunCu2ZMBBzPSrD7zu0QWkL018uCA=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a5b:c0a:: with SMTP id f10mr1802450ybq.353.1630025878542;
 Thu, 26 Aug 2021 17:57:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:16 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-14-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 13/15] KVM: arm64: Drop perf.c and fold its tiny bit of code
 into pmu.c
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

Fold that last few remnants of perf.c into pmu.c and rename the init
helper as appropriate.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/arm.c              |  3 ++-
 arch/arm64/kvm/perf.c             | 20 --------------------
 arch/arm64/kvm/pmu.c              |  8 ++++++++
 include/kvm/arm_pmu.h             |  1 +
 6 files changed, 12 insertions(+), 24 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 12e8d789e1ac..86c0fdd11ad2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -670,8 +670,6 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
-void kvm_perf_init(void);
-
 #ifdef CONFIG_PERF_EVENTS
 #define __KVM_WANT_PERF_CALLBACKS
 #else
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
index dfc8078dd4f9..57e637dee71d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1747,7 +1747,8 @@ static int init_subsystems(void)
 	if (err)
 		goto out;
 
-	kvm_perf_init();
+	kvm_pmu_init();
+
 	kvm_sys_reg_table_init();
 
 out:
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
deleted file mode 100644
index ad9fdc2f2f70..000000000000
--- a/arch/arm64/kvm/perf.c
+++ /dev/null
@@ -1,20 +0,0 @@
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
2.33.0.259.gc128427fd7-goog


