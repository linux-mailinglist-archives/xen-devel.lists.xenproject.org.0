Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C6B28738
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083886.1443339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005dA-Lf; Fri, 15 Aug 2025 20:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083886.1443339; Fri, 15 Aug 2025 20:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005ZF-Eq; Fri, 15 Aug 2025 20:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1083886;
 Fri, 15 Aug 2025 20:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Er-0005E7-5P
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:25 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35c20d56-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:25 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9e7437908so2303324f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:24 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:23 -0700 (PDT)
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
X-Inumbo-ID: 35c20d56-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290484; x=1755895284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwxm9dtR34acjMnkNswLFgfroPyNnvaszlLLiRIs7JA=;
        b=Fg3xKeNl+tdHAlFxJ+jHdJl0ooyutdeRvhCRLEPoxNPp3TGOK7xvF4VX1zJ0hINaQu
         6Xf1lZrUvpYZ6J5gRNPwx+efYMI80xGR+8pWhsmYJ+iRtYewW/O2TXlLhMFGY+LrpOc8
         EiTGVc2+o5O/hqxUnWb31tzydvyY8c+3el7OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290484; x=1755895284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwxm9dtR34acjMnkNswLFgfroPyNnvaszlLLiRIs7JA=;
        b=NDUmRwJkzRyt+H8p+emvsOj3rN7Z2XRT7EaZpuK6zTxfTZ9DE3A8zLT3kiczlbQqeM
         V57r+5q7Zt5hkTHkfLQYvWVzvzLEidbbF/6UZS9RWOMrzHhjaiTGKexLY0uPa5c8UC7F
         2wJCNCt+XOplgqvBxJqZ83Ngaz3wrmEd0JLRSaowOzlvsCoxOsazfkGPMdZIKsQK4x7R
         kf7VRvgSwqHMzn8NiKPqLDpnj2MEeGpd79ovWBv4QzwCwYMmYRzOLDb69KhNhO6Dhwct
         kUnRoyG6OtMyw4wkxjZa9ePyidXcTxNmUJZYE7ZqhYXqvf6Gy9DqlHiI7ReW9KrDxar4
         ID8g==
X-Gm-Message-State: AOJu0Yz94UNZq3BZg/1iUs0NvtWRhq4KsPX0wvUbtYS6YdcdX/VDPCXP
	NGEEp6wcMj+q+7Bb+GfL0P63dw3LWUkf10u4OdGYaAtzvAfVFzWuEQ0ypZs673VEV380htsX07Z
	A3fcZ
X-Gm-Gg: ASbGnct6YmldGqQ+EfA1e8MvKy2hsmnY5TY5ndQ4CNn56WMLBF7zkzGmZgY7KO9V96M
	kihZohmpdHZr17wv9+On+KtQflPf20caje53PBHWFKwpy0BhD+JhhEoyE5ryupzr08udAv2v8FJ
	gsQl6PtRdQIvmE5skbL7TAi2kLtBcgHpVlje5yxrvdsjQbRFH6LQdIhITzL76AwMh05lQcAqcPZ
	GE4LbB7wwq+p9IQ0t4TrGFm0jFECYhiRH/SrHWDcGlEDCU9TSlkxzc1JB52m1X+RpYA6gAGws6l
	j7xGQZr/wSxRw3elASdYH91wyLkSiVSYiEUw4aQt68iGPF1aFst8pppIGeFKCjIgR9iP0UIycat
	uVStKg4zyAsVke1Qt5rsQWOQqoJ/y5tfHYnFNRttLOMtacqiHsYuIH4O8gcrtNxM05Bl8C94q9G
	O7
X-Google-Smtp-Source: AGHT+IHIU9YezxkPwbQPSJ2CWP0/AaAL4ACtTJxCWrUwlc9hoG1CWVqPiJe5VELgZbY9axUZezHXXg==
X-Received: by 2002:a05:6000:400b:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3bc6a280040mr330177f8f.45.1755290483766;
        Fri, 15 Aug 2025 13:41:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/16] x86/msr: Split out guest-msr.h
Date: Fri, 15 Aug 2025 21:41:05 +0100
Message-Id: <20250815204117.3312742-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct vcpu_msrs has a very different purpose to everything else in msr.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c            |   1 +
 xen/arch/x86/cpuid.c                 |   1 +
 xen/arch/x86/debug.c                 |   1 +
 xen/arch/x86/domain.c                |   1 +
 xen/arch/x86/domctl.c                |   1 +
 xen/arch/x86/hvm/hvm.c               |   1 +
 xen/arch/x86/hvm/svm/svm.c           |   1 +
 xen/arch/x86/hvm/svm/vmcb.c          |   1 +
 xen/arch/x86/hvm/vmx/vmx.c           |   1 +
 xen/arch/x86/hvm/vmx/vvmx.c          |   1 +
 xen/arch/x86/include/asm/guest-msr.h | 155 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr.h       | 145 -------------------------
 xen/arch/x86/msr.c                   |   1 +
 xen/arch/x86/pv/emulate.h            |   1 +
 xen/arch/x86/x86_64/asm-offsets.c    |   1 +
 15 files changed, 168 insertions(+), 145 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/guest-msr.h

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 60f3c9a29e67..530b9eb39abc 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -9,6 +9,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
+#include <asm/guest-msr.h>
 #include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/match-cpu.h>
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8dc68945f7ae..b63a82dd3815 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -7,6 +7,7 @@
 
 #include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/viridian.h>
 #include <asm/xstate.h>
 
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 71755dea6ff2..11b0a7e5475a 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -9,6 +9,7 @@
 
 #include <asm/current.h>
 #include <asm/debugreg.h>
+#include <asm/guest-msr.h>
 
 /*
  * Merge new bits into dr6.  'new' is always given in positive polarity,
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6e3fd35c934e..1bbe53e36b59 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -44,6 +44,7 @@
 #include <asm/cpuidle.h>
 #include <asm/debugreg.h>
 #include <asm/desc.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d7781b7dc5fd..6153e3c07e2d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -25,6 +25,7 @@
 #include <asm/acpi.h>
 #include <asm/cpu-policy.h>
 #include <asm/gdbsx.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/io_apic.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6d2b937b62ba..bd64faf2071c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -38,6 +38,7 @@
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/e820.h>
+#include <asm/guest-msr.h>
 #include <asm/hap.h>
 #include <asm/hvm/cacheattr.h>
 #include <asm/hvm/emulate.h>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a807cab305aa..4fc6206edac0 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -19,6 +19,7 @@
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/gdbsx.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e4c797608f25..334950709f69 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -14,6 +14,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <asm/guest-msr.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c6bf435b744a..4664a014bc8a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -23,6 +23,7 @@
 #include <asm/debugreg.h>
 #include <asm/event.h>
 #include <asm/gdbsx.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/monitor.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 95d3c2ee7b79..6201665d9f4c 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -10,6 +10,7 @@
 
 #include <xen/ioreq.h>
 
+#include <asm/guest-msr.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/asm/guest-msr.h
new file mode 100644
index 000000000000..5f0cb0a93995
--- /dev/null
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_GUEST_MSR_H
+#define X86_GUEST_MSR_H
+
+#include <xen/types.h>
+
+/* Container object for per-vCPU MSRs */
+struct vcpu_msrs
+{
+    /*
+     * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
+     *
+     * For PV guests, this holds the guest kernel value.  It is accessed on
+     * every entry/exit path.
+     *
+     * For VT-x guests, one of two situations exist:
+     *
+     * - If hardware supports virtualized MSR_SPEC_CTRL, it is active by
+     *   default and the guest value lives in the VMCS.
+     * - Otherwise, the guest value is held in the MSR load/save list.
+     *
+     * For SVM, the guest value lives in the VMCB, and hardware saves/restores
+     * the host value automatically.  However, guests run with the OR of the
+     * host and guest value, which allows Xen to set protections behind the
+     * guest's back.
+     *
+     * We must clear/restore Xen's value before/after VMRUN to avoid unduly
+     * influencing the guest.  In order to support "behind the guest's back"
+     * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
+     */
+    struct {
+        uint32_t raw;
+    } spec_ctrl;
+
+    /*
+     * 0x00000140 - MSR_INTEL_MISC_FEATURES_ENABLES
+     *
+     * This MSR is non-architectural, but for simplicy we allow it to be read
+     * unconditionally.  The CPUID Faulting bit is the only writeable bit, and
+     * only if enumerated by MSR_PLATFORM_INFO.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            bool cpuid_faulting:1;
+        };
+    } misc_features_enables;
+
+    /*
+     * 0x00000560 ... 57x - MSR_RTIT_*
+     *
+     * "Real Time Instruction Trace", now called Processor Trace.
+     *
+     * These MSRs are not exposed to guests.  They are controlled by Xen
+     * behind the scenes, when vmtrace is enabled for the domain.
+     *
+     * MSR_RTIT_OUTPUT_BASE not stored here.  It is fixed per vcpu, and
+     * derived from v->vmtrace.buf.
+     */
+    struct {
+        /*
+         * Placed in the MSR load/save lists.  Only modified by hypercall in
+         * the common case.
+         */
+        uint64_t ctl;
+
+        /*
+         * Updated by hardware in non-root mode.  Synchronised here on vcpu
+         * context switch.
+         */
+        uint64_t status;
+        union {
+            uint64_t output_mask;
+            struct {
+                uint32_t output_limit;
+                uint32_t output_offset;
+            };
+        };
+    } rtit;
+
+    /*
+     * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
+     *
+     * Exposed R/W to guests.  Xen doesn't use PKS yet, so only context
+     * switched per vcpu.  When in current context, live value is in hardware,
+     * and this value is stale.
+     */
+    uint32_t pkrs;
+
+    /* 0x00000da0 - MSR_IA32_XSS */
+    struct {
+        uint64_t raw;
+    } xss;
+
+    /*
+     * 0xc0000103 - MSR_TSC_AUX
+     *
+     * Value is guest chosen, and always loaded in vcpu context.  Guests have
+     * no direct MSR access, and the value is accessible to userspace with the
+     * RDTSCP and RDPID instructions.
+     */
+    uint32_t tsc_aux;
+
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only, used on Zen1 and older hardware (pre-AMD_SSBD).  Holds the
+     * the guests value.
+     *
+     * In the default case, Xen doesn't protect itself from SSB, and guests
+     * are expected to use VIRT_SPEC_CTRL.SSBD=1 sparingly.  Xen therefore
+     * runs in the guest kernel's choice of SSBD.
+     *
+     * However, if the global enable `spec-ctrl=ssbd` is selected, hardware is
+     * always configured with SSBD=1 and the guest's setting is never loaded
+     * into hardware.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
+    /*
+     * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
+     *
+     * Loaded into hardware for guests which have active %dr7 settings.
+     * Furthermore, HVM guests are offered direct access, meaning that the
+     * values here may be stale in current context.
+     */
+    uint32_t dr_mask[4];
+};
+
+struct vcpu;
+struct cpu_policy;
+
+int init_vcpu_msr_policy(struct vcpu *v);
+
+/*
+ * Below functions can return X86EMUL_UNHANDLEABLE which means that MSR is
+ * not (yet) handled by it and must be processed by legacy handlers. Such
+ * behaviour is needed for transition period until all rd/wrmsr are handled
+ * by the new MSR infrastructure.
+ *
+ * These functions are also used by the migration logic, so need to cope with
+ * being used outside of v's context.
+ */
+int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
+int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
+
+uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp);
+
+#endif /* X86_GUEST_MSR_H */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 6a97b41bae07..787517802d9d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -299,149 +299,4 @@ static inline void wrmsr_tsc_aux(uint32_t val)
     }
 }
 
-uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp);
-
-/* Container object for per-vCPU MSRs */
-struct vcpu_msrs
-{
-    /*
-     * 0x00000048 - MSR_SPEC_CTRL
-     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
-     *
-     * For PV guests, this holds the guest kernel value.  It is accessed on
-     * every entry/exit path.
-     *
-     * For VT-x guests, one of two situations exist:
-     *
-     * - If hardware supports virtualized MSR_SPEC_CTRL, it is active by
-     *   default and the guest value lives in the VMCS.
-     * - Otherwise, the guest value is held in the MSR load/save list.
-     *
-     * For SVM, the guest value lives in the VMCB, and hardware saves/restores
-     * the host value automatically.  However, guests run with the OR of the
-     * host and guest value, which allows Xen to set protections behind the
-     * guest's back.
-     *
-     * We must clear/restore Xen's value before/after VMRUN to avoid unduly
-     * influencing the guest.  In order to support "behind the guest's back"
-     * protections, we load this value (commonly 0) before VMRUN.
-     *
-     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
-     * if the guest sets VIRT_SPEC_CTRL.SSBD.
-     */
-    struct {
-        uint32_t raw;
-    } spec_ctrl;
-
-    /*
-     * 0x00000140 - MSR_INTEL_MISC_FEATURES_ENABLES
-     *
-     * This MSR is non-architectural, but for simplicy we allow it to be read
-     * unconditionally.  The CPUID Faulting bit is the only writeable bit, and
-     * only if enumerated by MSR_PLATFORM_INFO.
-     */
-    union {
-        uint32_t raw;
-        struct {
-            bool cpuid_faulting:1;
-        };
-    } misc_features_enables;
-
-    /*
-     * 0x00000560 ... 57x - MSR_RTIT_*
-     *
-     * "Real Time Instruction Trace", now called Processor Trace.
-     *
-     * These MSRs are not exposed to guests.  They are controlled by Xen
-     * behind the scenes, when vmtrace is enabled for the domain.
-     *
-     * MSR_RTIT_OUTPUT_BASE not stored here.  It is fixed per vcpu, and
-     * derived from v->vmtrace.buf.
-     */
-    struct {
-        /*
-         * Placed in the MSR load/save lists.  Only modified by hypercall in
-         * the common case.
-         */
-        uint64_t ctl;
-
-        /*
-         * Updated by hardware in non-root mode.  Synchronised here on vcpu
-         * context switch.
-         */
-        uint64_t status;
-        union {
-            uint64_t output_mask;
-            struct {
-                uint32_t output_limit;
-                uint32_t output_offset;
-            };
-        };
-    } rtit;
-
-    /*
-     * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
-     *
-     * Exposed R/W to guests.  Xen doesn't use PKS yet, so only context
-     * switched per vcpu.  When in current context, live value is in hardware,
-     * and this value is stale.
-     */
-    uint32_t pkrs;
-
-    /* 0x00000da0 - MSR_IA32_XSS */
-    struct {
-        uint64_t raw;
-    } xss;
-
-    /*
-     * 0xc0000103 - MSR_TSC_AUX
-     *
-     * Value is guest chosen, and always loaded in vcpu context.  Guests have
-     * no direct MSR access, and the value is accessible to userspace with the
-     * RDTSCP and RDPID instructions.
-     */
-    uint32_t tsc_aux;
-
-    /*
-     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
-     *
-     * AMD only, used on Zen1 and older hardware (pre-AMD_SSBD).  Holds the
-     * the guests value.
-     *
-     * In the default case, Xen doesn't protect itself from SSB, and guests
-     * are expected to use VIRT_SPEC_CTRL.SSBD=1 sparingly.  Xen therefore
-     * runs in the guest kernel's choice of SSBD.
-     *
-     * However, if the global enable `spec-ctrl=ssbd` is selected, hardware is
-     * always configured with SSBD=1 and the guest's setting is never loaded
-     * into hardware.
-     */
-    struct {
-        uint32_t raw;
-    } virt_spec_ctrl;
-
-    /*
-     * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
-     *
-     * Loaded into hardware for guests which have active %dr7 settings.
-     * Furthermore, HVM guests are offered direct access, meaning that the
-     * values here may be stale in current context.
-     */
-    uint32_t dr_mask[4];
-};
-
-int init_vcpu_msr_policy(struct vcpu *v);
-
-/*
- * Below functions can return X86EMUL_UNHANDLEABLE which means that MSR is
- * not (yet) handled by it and must be processed by legacy handlers. Such
- * behaviour is needed for transition period until all rd/wrmsr are handled
- * by the new MSR infrastructure.
- *
- * These functions are also used by the migration logic, so need to cope with
- * being used outside of v's context.
- */
-int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
-int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
-
 #endif /* __ASM_MSR_H */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b301143ed2d4..ad75a2e10855 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -15,6 +15,7 @@
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/debugreg.h>
+#include <asm/guest-msr.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
diff --git a/xen/arch/x86/pv/emulate.h b/xen/arch/x86/pv/emulate.h
index 49a4d34832df..c74e45e50c08 100644
--- a/xen/arch/x86/pv/emulate.h
+++ b/xen/arch/x86/pv/emulate.h
@@ -3,6 +3,7 @@
 
 #include <xen/sched.h>
 
+#include <asm/guest-msr.h>
 #include <asm/processor.h>
 #include <asm/x86_emulate.h>
 
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 2258b4ce1b95..9d4536402661 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -15,6 +15,7 @@
 #include <asm/hardirq.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
+#include <asm/guest-msr.h>
 
 #ifdef CONFIG_VIDEO
 # include "../boot/video.h"
-- 
2.39.5


