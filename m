Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E846A21E4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501474.773270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdHi-0000U1-1N; Fri, 24 Feb 2023 18:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501474.773270; Fri, 24 Feb 2023 18:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdHh-0000Mx-Th; Fri, 24 Feb 2023 18:59:09 +0000
Received: by outflank-mailman (input) for mailman id 501474;
 Fri, 24 Feb 2023 18:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9X-0002YL-GY
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21472588-b474-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:50:38 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id f13so1043298edz.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:38 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:37 -0800 (PST)
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
X-Inumbo-ID: 21472588-b474-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPu/CWLizak/IEWUGPIk9YBOHGWgcE+p+9Gx9liFImY=;
        b=M+rCwNla4KthKEp+2PbbfuXze83MK0Onq9VS/jOP3ModXka4wg5mqXP3eoc63+12c8
         81Pwd0hASHLJSYItsXHT+btPrTRHXMLeGwc6JF7ZhPAguXJqOaZySGhufxigZqPzkPaw
         ab+CEHbB/33pjSMbBd9l5b2n3nBex+c/vu1sWH9ddywhg/szO8E3HQQ2uw4sPb1hFvev
         IXmFH60eAXk95yrDXn9ddOzkkbdysDY0viDBYUIdARzlp26NUwl7dMo+O52FrfQQWaLx
         /qZkwa1sUz49n+PnhsiYQuwNXI0sBv9FH+Dw2/VGuvEcCwEN/8Z+rKspNWPI1iQCOPbS
         z8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPu/CWLizak/IEWUGPIk9YBOHGWgcE+p+9Gx9liFImY=;
        b=tjhF9beAQ/X9/jX2IvCexSxsYhMRY00vpfgjOIEzJrkog5AQ7h1qDMO8m2ybfQmTrD
         SS6CRJuljfzouzaeE9lDx6NzlW3RRYCZPEJReKQvlroVVVjztVzWfJnL3HEFDS6hioiw
         wxk6HFRzjITBGLcdBvARnP+T7x11DD5QQFPorcuiaJdXnGgMMEwJZlX/oQldkZxZiSym
         prBaqMTm/RMKFzK7y+rTSb5hWTfi6P+e2CuHZ/sq7EGcV+i4QqGMmKwWchvB7rdhEyck
         CuPbYVD3UYz6Ue3na+HwC3sRNnpu++X1rrr7nyWEZydJycMYC7dutobLjO4ijIfbQ6Ok
         ht5A==
X-Gm-Message-State: AO0yUKUT3JQ7sCtGebVCOZ/p8OCAi6kz2d/Si6+KsmshLYn7ZDRAyuFz
	mKzCPMUgSXKWqSCftygr3ZcC1zFQqHM=
X-Google-Smtp-Source: AK7set9VCrxsCfrj8WDMJqnfM3n3CCnV/bOaEvihD8tqZ0eHsE5kIn0RiNmLBZtpr8p7NCKKWlojSQ==
X-Received: by 2002:a17:906:f249:b0:878:81d7:9f77 with SMTP id gy9-20020a170906f24900b0087881d79f77mr21568882ejb.34.1677264638178;
        Fri, 24 Feb 2023 10:50:38 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 14/14] x86/vmx: move vmcs declarations used only by vmx code to private header
Date: Fri, 24 Feb 2023 20:50:10 +0200
Message-Id: <20230224185010.3692754-15-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/vmx called vmcs.h and move
there all definitions and declarations that are used only by vmx code and
don't need to reside in an external header.

Take the opportunity to replace u* with uint*_t, bool_t with bool and to
re-arrange the header as follows, all structures first, then all variable
declarations, all function delarations, and finally all inline functions.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
 - new patch

 xen/arch/x86/hvm/vmx/intr.c             |   1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |   1 +
 xen/arch/x86/hvm/vmx/vmcs.h             | 100 ++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              |   1 +
 xen/arch/x86/hvm/vmx/vvmx.c             |   1 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 118 +++++-------------------
 6 files changed, 128 insertions(+), 94 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmx/vmcs.h

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 8431937f42..d8387e7215 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -38,6 +38,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/vm_event.h>
 
+#include "vmcs.h"
 #include "vmx.h"
 #include "vvmx.h"
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 3d0f6be5bb..57e19e8dad 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -42,6 +42,7 @@
 #include <asm/tboot.h>
 #include <asm/apic.h>
 
+#include "vmcs.h"
 #include "vmx.h"
 #include "vvmx.h"
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.h b/xen/arch/x86/hvm/vmx/vmcs.h
new file mode 100644
index 0000000000..c0cca0ce73
--- /dev/null
+++ b/xen/arch/x86/hvm/vmx/vmcs.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * vmcs.h: VMCS related definitions
+ *
+ * Copyright (c) 2004, Intel Corporation.
+ */
+
+#ifndef __X86_HVM_VMX_VMCS_PRIV_H__
+#define __X86_HVM_VMX_VMCS_PRIV_H__
+
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/hvm/vmx/vmcs.h>
+
+struct vmcs_struct {
+    uint32_t vmcs_revision_id;
+    unsigned char data [0]; /* vmcs size is read from MSR */
+};
+
+#define _VMX_DOMAIN_PML_ENABLED    0
+#define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
+
+/*
+ * Layout of the MSR bitmap, as interpreted by hardware:
+ *  - *_low  covers MSRs 0 to 0x1fff
+ *  - *_ligh covers MSRs 0xc0000000 to 0xc0001fff
+ */
+struct vmx_msr_bitmap {
+    unsigned long read_low  [0x2000 / BITS_PER_LONG];
+    unsigned long read_high [0x2000 / BITS_PER_LONG];
+    unsigned long write_low [0x2000 / BITS_PER_LONG];
+    unsigned long write_high[0x2000 / BITS_PER_LONG];
+};
+
+#define NR_PML_ENTRIES   512
+
+void vmcs_dump_vcpu(struct vcpu *v);
+int vmx_vmcs_init(void);
+int cf_check vmx_cpu_up_prepare(unsigned int cpu);
+void cf_check vmx_cpu_dead(unsigned int cpu);
+int cf_check vmx_cpu_up(void);
+void cf_check vmx_cpu_down(void);
+
+int vmx_create_vmcs(struct vcpu *v);
+void vmx_destroy_vmcs(struct vcpu *v);
+bool __must_check vmx_vmcs_try_enter(struct vcpu *v);
+void vmx_vmcs_reload(struct vcpu *v);
+
+void vmx_vmcs_switch(paddr_t from, paddr_t to);
+void vmx_set_eoi_exit_bitmap(struct vcpu *v, uint8_t vector);
+void vmx_clear_eoi_exit_bitmap(struct vcpu *v, uint8_t vector);
+bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
+                            unsigned int msr, bool is_write) __nonnull(1);
+void virtual_vmcs_enter(const struct vcpu *);
+void virtual_vmcs_exit(const struct vcpu *);
+u64 virtual_vmcs_vmread(const struct vcpu *, uint32_t encoding);
+enum vmx_insn_errno virtual_vmcs_vmread_safe(const struct vcpu *v,
+                                             uint32_t vmcs_encoding,
+                                             uint64_t *val);
+void virtual_vmcs_vmwrite(const struct vcpu *, uint32_t encoding, uint64_t val);
+enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
+                                              uint32_t vmcs_encoding,
+                                              uint64_t val);
+
+DECLARE_PER_CPU(bool, vmxon);
+
+bool vmx_vcpu_pml_enabled(const struct vcpu *v);
+int vmx_vcpu_enable_pml(struct vcpu *v);
+void vmx_vcpu_disable_pml(struct vcpu *v);
+void vmx_vcpu_flush_pml_buffer(struct vcpu *v);
+
+static inline int vmx_read_guest_loadonly_msr(
+    const struct vcpu *v, uint32_t msr, uint64_t *val)
+{
+    const struct vmx_msr_entry *ent =
+        vmx_find_msr(v, msr, VMX_MSR_GUEST_LOADONLY);
+
+    if ( !ent )
+    {
+        *val = 0;
+        return -ESRCH;
+    }
+
+    *val = ent->data;
+
+    return 0;
+}
+
+#endif /* __X86_HVM_VMX_VMCS_PRIV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 73ab4e9816..c5f6902206 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -57,6 +57,7 @@
 #include <public/hvm/ioreq.h>
 
 #include "pi.h"
+#include "vmcs.h"
 #include "vmx.h"
 #include "vvmx.h"
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 0af5411076..d0a6fa2d20 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -29,6 +29,7 @@
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/nestedhvm.h>
 
+#include "vmcs.h"
 #include "vmx.h"
 #include "vvmx.h"
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 0a84e74478..47206b1e9d 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -20,22 +20,10 @@
 
 #include <xen/mm.h>
 
-extern void vmcs_dump_vcpu(struct vcpu *v);
-extern int vmx_vmcs_init(void);
-int cf_check vmx_cpu_up_prepare(unsigned int cpu);
-void cf_check vmx_cpu_dead(unsigned int cpu);
-int cf_check vmx_cpu_up(void);
-void cf_check vmx_cpu_down(void);
-
-struct vmcs_struct {
-    u32 vmcs_revision_id;
-    unsigned char data [0]; /* vmcs size is read from MSR */
-};
-
 struct vmx_msr_entry {
-    u32 index;
-    u32 mbz;
-    u64 data;
+    uint32_t index;
+    uint32_t mbz;
+    uint64_t data;
 };
 
 #define EPT_DEFAULT_MT      X86_MT_WB
@@ -49,14 +37,12 @@ struct ept_data {
                      :5,     /* rsvd. */
                      mfn:52;
         };
-        u64 eptp;
+        uint64_t eptp;
     };
     /* Set of PCPUs needing an INVEPT before a VMENTER. */
     cpumask_var_t invalidate;
 };
 
-#define _VMX_DOMAIN_PML_ENABLED    0
-#define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
 struct vmx_domain {
     mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
@@ -69,36 +55,22 @@ struct vmx_domain {
     bool exec_sp;
 };
 
-/*
- * Layout of the MSR bitmap, as interpreted by hardware:
- *  - *_low  covers MSRs 0 to 0x1fff
- *  - *_ligh covers MSRs 0xc0000000 to 0xc0001fff
- */
-struct vmx_msr_bitmap {
-    unsigned long read_low  [0x2000 / BITS_PER_LONG];
-    unsigned long read_high [0x2000 / BITS_PER_LONG];
-    unsigned long write_low [0x2000 / BITS_PER_LONG];
-    unsigned long write_high[0x2000 / BITS_PER_LONG];
-};
-
 struct pi_desc {
     DECLARE_BITMAP(pir, X86_NR_VECTORS);
     union {
         struct {
-            u16     on     : 1,  /* bit 256 - Outstanding Notification */
-                    sn     : 1,  /* bit 257 - Suppress Notification */
-                    rsvd_1 : 14; /* bit 271:258 - Reserved */
-            u8      nv;          /* bit 279:272 - Notification Vector */
-            u8      rsvd_2;      /* bit 287:280 - Reserved */
-            u32     ndst;        /* bit 319:288 - Notification Destination */
+            uint16_t   on     : 1,  /* bit 256 - Outstanding Notification */
+                       sn     : 1,  /* bit 257 - Suppress Notification */
+                       rsvd_1 : 14; /* bit 271:258 - Reserved */
+            uint8_t    nv;          /* bit 279:272 - Notification Vector */
+            uint8_t    rsvd_2;      /* bit 287:280 - Reserved */
+            uint32_t   ndst;        /* bit 319:288 - Notification Destination */
         };
-        u64 control;
+        uint64_t control;
     };
-    u32 rsvd[6];
+    uint32_t rsvd[6];
 } __attribute__ ((aligned (64)));
 
-#define NR_PML_ENTRIES   512
-
 struct pi_blocking_vcpu {
     struct list_head     list;
     spinlock_t           *lock;
@@ -123,9 +95,9 @@ struct vmx_vcpu {
     int                  launched;
 
     /* Cache of cpu execution control. */
-    u32                  exec_control;
-    u32                  secondary_exec_control;
-    u32                  exception_bitmap;
+    uint32_t             exec_control;
+    uint32_t             secondary_exec_control;
+    uint32_t             exception_bitmap;
 
     uint64_t             shadow_gs;
     uint64_t             star;
@@ -154,7 +126,7 @@ struct vmx_vcpu {
     unsigned long        host_cr0;
 
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
-    bool_t               ept_spurious_misconfig;
+    bool                 ept_spurious_misconfig;
 
     /* Processor Trace configured and enabled for the vcpu. */
     bool                 ipt_active;
@@ -191,12 +163,8 @@ struct vmx_vcpu {
     struct pi_blocking_vcpu pi_blocking;
 };
 
-int vmx_create_vmcs(struct vcpu *v);
-void vmx_destroy_vmcs(struct vcpu *v);
 void vmx_vmcs_enter(struct vcpu *v);
-bool_t __must_check vmx_vmcs_try_enter(struct vcpu *v);
 void vmx_vmcs_exit(struct vcpu *v);
-void vmx_vmcs_reload(struct vcpu *v);
 
 #define CPU_BASED_VIRTUAL_INTR_PENDING        0x00000004
 #define CPU_BASED_USE_TSC_OFFSETING           0x00000008
@@ -219,14 +187,14 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_MONITOR_EXITING             0x20000000
 #define CPU_BASED_PAUSE_EXITING               0x40000000
 #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
-extern u32 vmx_cpu_based_exec_control;
+extern uint32_t vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
 #define PIN_BASED_NMI_EXITING           0x00000008
 #define PIN_BASED_VIRTUAL_NMIS          0x00000020
 #define PIN_BASED_PREEMPT_TIMER         0x00000040
 #define PIN_BASED_POSTED_INTERRUPT      0x00000080
-extern u32 vmx_pin_based_exec_control;
+extern uint32_t vmx_pin_based_exec_control;
 
 #define VM_EXIT_SAVE_DEBUG_CNTRLS       0x00000004
 #define VM_EXIT_IA32E_MODE              0x00000200
@@ -238,7 +206,7 @@ extern u32 vmx_pin_based_exec_control;
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
-extern u32 vmx_vmexit_control;
+extern uint32_t vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
 #define VM_ENTRY_SMM                    0x00000400
@@ -247,7 +215,7 @@ extern u32 vmx_vmexit_control;
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
-extern u32 vmx_vmentry_control;
+extern uint32_t vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001
 #define SECONDARY_EXEC_ENABLE_EPT               0x00000002
@@ -269,7 +237,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
-extern u32 vmx_secondary_exec_control;
+extern uint32_t vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
@@ -286,7 +254,7 @@ extern u32 vmx_secondary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT                  0x20000000000ULL
 #define VMX_VPID_INVVPID_ALL_CONTEXT                     0x40000000000ULL
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
-extern u64 vmx_ept_vpid_cap;
+extern uint64_t vmx_ept_vpid_cap;
 
 #define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
@@ -373,7 +341,7 @@ extern u64 vmx_ept_vpid_cap;
  */
 #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
 
-extern u64 vmx_basic_msr;
+extern uint64_t vmx_basic_msr;
 #define cpu_has_vmx_ins_outs_instr_info \
     (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
 
@@ -614,23 +582,6 @@ static inline int vmx_read_guest_msr(const struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-static inline int vmx_read_guest_loadonly_msr(
-    const struct vcpu *v, uint32_t msr, uint64_t *val)
-{
-    const struct vmx_msr_entry *ent =
-        vmx_find_msr(v, msr, VMX_MSR_GUEST_LOADONLY);
-
-    if ( !ent )
-    {
-        *val = 0;
-        return -ESRCH;
-    }
-
-    *val = ent->data;
-
-    return 0;
-}
-
 static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
                                       uint64_t val)
 {
@@ -644,7 +595,6 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-
 /* MSR intercept bitmap infrastructure. */
 enum vmx_msr_intercept_type {
     VMX_MSR_R  = 1,
@@ -656,27 +606,7 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
                              enum vmx_msr_intercept_type type);
 void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
                            enum vmx_msr_intercept_type type);
-void vmx_vmcs_switch(paddr_t from, paddr_t to);
-void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
-                            unsigned int msr, bool is_write) __nonnull(1);
-void virtual_vmcs_enter(const struct vcpu *);
-void virtual_vmcs_exit(const struct vcpu *);
-u64 virtual_vmcs_vmread(const struct vcpu *, u32 encoding);
-enum vmx_insn_errno virtual_vmcs_vmread_safe(const struct vcpu *v,
-                                             u32 vmcs_encoding, u64 *val);
-void virtual_vmcs_vmwrite(const struct vcpu *, u32 encoding, u64 val);
-enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
-                                              u32 vmcs_encoding, u64 val);
-
-DECLARE_PER_CPU(bool_t, vmxon);
-
-bool_t vmx_vcpu_pml_enabled(const struct vcpu *v);
-int vmx_vcpu_enable_pml(struct vcpu *v);
-void vmx_vcpu_disable_pml(struct vcpu *v);
-void vmx_vcpu_flush_pml_buffer(struct vcpu *v);
-bool_t vmx_domain_pml_enabled(const struct domain *d);
+bool vmx_domain_pml_enabled(const struct domain *d);
 int vmx_domain_enable_pml(struct domain *d);
 void vmx_domain_disable_pml(struct domain *d);
 void vmx_domain_flush_pml_buffers(struct domain *d);
-- 
2.37.2


