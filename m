Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA7A45035
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896020.1304698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3TN-0000nN-Te; Tue, 25 Feb 2025 22:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896020.1304698; Tue, 25 Feb 2025 22:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3TN-0000l6-Qn; Tue, 25 Feb 2025 22:32:17 +0000
Received: by outflank-mailman (input) for mailman id 896020;
 Tue, 25 Feb 2025 22:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3TM-0007iP-Ui
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:32:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d79a710-f3c8-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 23:32:16 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso177718f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:32:16 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e7322sm3724378f8f.64.2025.02.25.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:32:13 -0800 (PST)
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
X-Inumbo-ID: 5d79a710-f3c8-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522735; x=1741127535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJvEgOKJFmhOHYKbUSsUNmrGfAdUBBvhqavn40IDmlA=;
        b=MdfmyupDGXWJg7wTx/FjG/x1cGAKJDnXBkRhf5Y3IXIyn+/JCBkUSq4HbgkLJEf6fy
         QzNeaVYuOy+exfEjMdrQ/Sc/GvJ6L1D+9hky9ukcD+lc26K+YQcqycsdJxEceDhyGXEl
         fjQWtrS4JbdcImEx2kENCFvg/SEwvrtAJAYL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522735; x=1741127535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJvEgOKJFmhOHYKbUSsUNmrGfAdUBBvhqavn40IDmlA=;
        b=ePqkCAPsdcgbPRB6TKdxtFRFtFoNFS8UxVNL/M6+NhT/Gd3loglkEYRHbc6dCNeQhO
         evQ1aOEyU6Uorp/1FLP/3G3WDvxd3jdHC194ZAocLhqKKlzVTtyk32b4ny+0FLkCE+5r
         t/vuPgLC/YID3TnJQNh5/VCbYhyyc06ywwrgh7AhCOmYfevMQxe1bCxv69Bj67adoA3N
         xyI162GgE2grQnAy1zLYdqx+SNc2eUq73dUjmnaPYisP9uF4djkzXpWtnOSZXgH8AHeK
         z+I/Yb1O5O/38I9AIUYdKRmwuMXka/gOp0WBfvXXglGDeZx7t9qXRv7tp2wcg+wuPEzE
         s/2A==
X-Gm-Message-State: AOJu0Yzpy7R5naiFX9gZo/Lvt0Enx5hRP2kGz9Mxs38N9gHrv1fE9vTt
	hfCy6rkvuCUtgscbSD60baR6sU9k2KD49+tMCc5IJ+jBcIoBacabMfo4PF3/7vY0hTs/qdauKZ2
	W
X-Gm-Gg: ASbGnctJ+Vk0P0VBajbxBaQFSJ0hc2eIatNUGCo56YNqwvbL4V/16tpMpNxlBWBCItV
	w5TURGi6vuq0mhVGFz6KtHhmiNylvVt+v0ktIzqXwbMtoTa0Zd6VlMLkHiHidUTNBiaPRkSXIv0
	fNcVSNGXnMIUEXEmW3yvEHgTUmcVIkO61873OTVHDnfu7XJQmtc55EaotBbrl1rG5Pp8RObwgef
	OdMGppus7k4CvLZnslOVzxpBR5nurLD7d3iQsQMaJLhKycS1fEciVczsTx/BSHlzgXaSXOyi2Q6
	f+HHdhQ+wZ9aFk8ifF/i/7OCjuAILiyE+oGShVUn1sxvwQbhHr5MmIQwg4BgurbmOCo81JixdJy
	ZIQBtwQ==
X-Google-Smtp-Source: AGHT+IHwLEzxy+3Vwdpcyyd9LJlu7ZHC0dM/W6We1gbLUWQwCYV6A9+YL1jBVm5VpDWIY3iu0M829g==
X-Received: by 2002:a05:6000:1862:b0:38d:b349:2db2 with SMTP id ffacd0b85a97d-38f6f515313mr14262651f8f.22.1740522733666;
        Tue, 25 Feb 2025 14:32:13 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/traps: Move cpuid_hypervisor_leaves() into cpuid.c
Date: Tue, 25 Feb 2025 22:31:37 +0000
Message-Id: <20250225223137.1183313-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's out of place in traps.c, and only has a single caller.  Make it static
inside cpuid.c.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpuid.c                 | 136 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/processor.h |   2 -
 xen/arch/x86/traps.c                 | 136 ---------------------------
 3 files changed, 136 insertions(+), 138 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2a777436ee27..8dc68945f7ae 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1,6 +1,8 @@
 #include <xen/sched.h>
 #include <xen/types.h>
+#include <xen/version.h>
 
+#include <public/arch-x86/cpuid.h>
 #include <public/hvm/params.h>
 
 #include <asm/cpu-policy.h>
@@ -32,6 +34,140 @@ bool recheck_cpu_features(unsigned int cpu)
     return okay;
 }
 
+static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
+                                    uint32_t subleaf, struct cpuid_leaf *res)
+{
+    const struct domain *d = v->domain;
+    const struct cpu_policy *p = d->arch.cpu_policy;
+    uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
+    uint32_t idx  = leaf - base;
+    unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
+
+    if ( limit == 0 )
+        /* Default number of leaves */
+        limit = XEN_CPUID_MAX_NUM_LEAVES;
+    else
+        /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
+        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
+
+    if ( idx > limit )
+        return;
+
+    switch ( idx )
+    {
+    case 0:
+        res->a = base + limit; /* Largest leaf */
+        res->b = XEN_CPUID_SIGNATURE_EBX;
+        res->c = XEN_CPUID_SIGNATURE_ECX;
+        res->d = XEN_CPUID_SIGNATURE_EDX;
+        break;
+
+    case 1:
+        res->a = (xen_major_version() << 16) | xen_minor_version();
+        break;
+
+    case 2:
+        res->a = 1;            /* Number of hypercall-transfer pages */
+                               /* MSR base address */
+        res->b = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+        if ( is_pv_domain(d) ) /* Features */
+            res->c |= XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD;
+        break;
+
+    case 3: /* Time leaf. */
+        switch ( subleaf )
+        {
+        case 0: /* features */
+            res->a = ((d->arch.vtsc << 0) |
+                      (!!host_tsc_is_safe() << 1) |
+                      (!!boot_cpu_has(X86_FEATURE_RDTSCP) << 2));
+            res->b = d->arch.tsc_mode;
+            res->c = d->arch.tsc_khz;
+            res->d = d->arch.incarnation;
+            break;
+
+        case 1: /* scale and offset */
+        {
+            uint64_t offset;
+
+            if ( !d->arch.vtsc )
+                offset = d->arch.vtsc_offset;
+            else
+                /* offset already applied to value returned by virtual rdtscp */
+                offset = 0;
+            res->a = offset;
+            res->b = offset >> 32;
+            res->c = d->arch.vtsc_to_ns.mul_frac;
+            res->d = d->arch.vtsc_to_ns.shift;
+            break;
+        }
+
+        case 2: /* physical cpu_khz */
+            res->a = cpu_khz;
+            break;
+        }
+        break;
+
+    case 4: /* HVM hypervisor leaf. */
+        if ( !is_hvm_domain(d) || subleaf != 0 )
+            break;
+
+        if ( cpu_has_vmx_apic_reg_virt )
+            res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
+
+        /*
+         * We want to claim that x2APIC is virtualized if APIC MSR accesses
+         * are not intercepted. When all three of these are true both rdmsr
+         * and wrmsr in the guest will run without VMEXITs (see
+         * vmx_vlapic_msr_changed()).
+         */
+        if ( cpu_has_vmx_virtualize_x2apic_mode &&
+             cpu_has_vmx_apic_reg_virt &&
+             cpu_has_vmx_virtual_intr_delivery )
+            res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
+
+        /*
+         * 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
+         * mapping, and forgot to honour the guest's request.
+         * 2) 4.11 (and presumably backports) fixed the bug, so the map
+         * hypercall actually did what the guest asked.
+         * 3) To work around the bug, guests must bounce buffer all DMA that
+         * would otherwise use a grant map, because it doesn't know whether the
+         * DMA is originating from an emulated or a real device.
+         * 4) This flag tells guests it is safe not to bounce-buffer all DMA to
+         * work around the bug.
+         */
+        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+
+        /* Indicate presence of vcpu id and set it in ebx */
+        res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
+        res->b = v->vcpu_id;
+
+        /* Indicate presence of domain id and set it in ecx */
+        res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
+        res->c = d->domain_id;
+
+        /*
+         * Per-vCPU event channel upcalls are implemented and work
+         * correctly with PIRQs routed over event channels.
+         */
+        res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
+
+        break;
+
+    case 5: /* PV-specific parameters */
+        if ( is_hvm_domain(d) || subleaf != 0 )
+            break;
+
+        res->b = flsl(get_upper_mfn_bound()) + PAGE_SHIFT;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res)
 {
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index d247ef8dd226..4f176bc575ef 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -472,8 +472,6 @@ struct stubs {
 DECLARE_PER_CPU(struct stubs, stubs);
 unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
 
-void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
-                             uint32_t subleaf, struct cpuid_leaf *res);
 int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val);
 int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val);
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dca11a613dbd..91af814badf7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -34,7 +34,6 @@
 #include <xen/domain_page.h>
 #include <xen/symbols.h>
 #include <xen/iocap.h>
-#include <xen/version.h>
 #include <xen/kexec.h>
 #include <xen/trace.h>
 #include <xen/paging.h>
@@ -65,7 +64,6 @@
 #include <asm/mc146818rtc.h>
 #include <asm/hpet.h>
 #include <asm/vpmu.h>
-#include <public/arch-x86/cpuid.h>
 #include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
@@ -1053,140 +1051,6 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
     }
 }
 
-void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
-                             uint32_t subleaf, struct cpuid_leaf *res)
-{
-    const struct domain *d = v->domain;
-    const struct cpu_policy *p = d->arch.cpu_policy;
-    uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
-    uint32_t idx  = leaf - base;
-    unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
-
-    if ( limit == 0 )
-        /* Default number of leaves */
-        limit = XEN_CPUID_MAX_NUM_LEAVES;
-    else
-        /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
-        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
-
-    if ( idx > limit )
-        return;
-
-    switch ( idx )
-    {
-    case 0:
-        res->a = base + limit; /* Largest leaf */
-        res->b = XEN_CPUID_SIGNATURE_EBX;
-        res->c = XEN_CPUID_SIGNATURE_ECX;
-        res->d = XEN_CPUID_SIGNATURE_EDX;
-        break;
-
-    case 1:
-        res->a = (xen_major_version() << 16) | xen_minor_version();
-        break;
-
-    case 2:
-        res->a = 1;            /* Number of hypercall-transfer pages */
-                               /* MSR base address */
-        res->b = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
-        if ( is_pv_domain(d) ) /* Features */
-            res->c |= XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD;
-        break;
-
-    case 3: /* Time leaf. */
-        switch ( subleaf )
-        {
-        case 0: /* features */
-            res->a = ((d->arch.vtsc << 0) |
-                      (!!host_tsc_is_safe() << 1) |
-                      (!!boot_cpu_has(X86_FEATURE_RDTSCP) << 2));
-            res->b = d->arch.tsc_mode;
-            res->c = d->arch.tsc_khz;
-            res->d = d->arch.incarnation;
-            break;
-
-        case 1: /* scale and offset */
-        {
-            uint64_t offset;
-
-            if ( !d->arch.vtsc )
-                offset = d->arch.vtsc_offset;
-            else
-                /* offset already applied to value returned by virtual rdtscp */
-                offset = 0;
-            res->a = offset;
-            res->b = offset >> 32;
-            res->c = d->arch.vtsc_to_ns.mul_frac;
-            res->d = d->arch.vtsc_to_ns.shift;
-            break;
-        }
-
-        case 2: /* physical cpu_khz */
-            res->a = cpu_khz;
-            break;
-        }
-        break;
-
-    case 4: /* HVM hypervisor leaf. */
-        if ( !is_hvm_domain(d) || subleaf != 0 )
-            break;
-
-        if ( cpu_has_vmx_apic_reg_virt )
-            res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
-
-        /*
-         * We want to claim that x2APIC is virtualized if APIC MSR accesses
-         * are not intercepted. When all three of these are true both rdmsr
-         * and wrmsr in the guest will run without VMEXITs (see
-         * vmx_vlapic_msr_changed()).
-         */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
-             cpu_has_vmx_apic_reg_virt &&
-             cpu_has_vmx_virtual_intr_delivery )
-            res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
-
-        /*
-         * 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
-         * mapping, and forgot to honour the guest's request.
-         * 2) 4.11 (and presumably backports) fixed the bug, so the map
-         * hypercall actually did what the guest asked.
-         * 3) To work around the bug, guests must bounce buffer all DMA that
-         * would otherwise use a grant map, because it doesn't know whether the
-         * DMA is originating from an emulated or a real device.
-         * 4) This flag tells guests it is safe not to bounce-buffer all DMA to
-         * work around the bug.
-         */
-        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
-
-        /* Indicate presence of vcpu id and set it in ebx */
-        res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
-        res->b = v->vcpu_id;
-
-        /* Indicate presence of domain id and set it in ecx */
-        res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
-        res->c = d->domain_id;
-
-        /*
-         * Per-vCPU event channel upcalls are implemented and work
-         * correctly with PIRQs routed over event channels.
-         */
-        res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
-
-        break;
-
-    case 5: /* PV-specific parameters */
-        if ( is_hvm_domain(d) || subleaf != 0 )
-            break;
-
-        res->b = flsl(get_upper_mfn_bound()) + PAGE_SHIFT;
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
-}
-
 void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
 {
     u8 bug_insn[2];
-- 
2.39.5


