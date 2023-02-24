Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAED6A21E5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501468.773262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdHh-0000Mq-NT; Fri, 24 Feb 2023 18:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501468.773262; Fri, 24 Feb 2023 18:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdHh-0000JX-KW; Fri, 24 Feb 2023 18:59:09 +0000
Received: by outflank-mailman (input) for mailman id 501468;
 Fri, 24 Feb 2023 18:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9U-0002YL-G1
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 205db879-b474-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:50:37 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id ck15so1299371edb.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:37 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:36 -0800 (PST)
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
X-Inumbo-ID: 205db879-b474-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQP0LkNmoNNIDo9tvroAigJG+F5sDEavNOm42WnmMgM=;
        b=QhE+a2TaHrI2pZRjODv6nwgqIHV91v5kIYBi9bRu5gv1ElB/SSpC/pzE838gEDIrKj
         WJmeQb09+8Ct0sNKXqY85F97bPFjWBneM076Jv1lrBIrSscGPBbNsIyLBVNMahwBVT82
         Tv9GqCzjQK5Bom7GKM7cRbAqVU0aJX+4ycvDgYjHiSEJ/GSxki8L8GjsI6JYlAS+p1lq
         4V50eAx2mmWQG59XMxD3tjXXuP3RN8BBisfyGHmMMzouGfAsLG6z33ZJYEveuTNgx8d9
         yChQ0jjwMg8yoXDCApRhPTQ/e/LCBJsMdVI/m+KrTlneKRiZ4jsFL+5bZbJ/AqURaTLQ
         0bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQP0LkNmoNNIDo9tvroAigJG+F5sDEavNOm42WnmMgM=;
        b=65FZCX3u0PRr0lRzNUYBKGfWsgJWq2ZeUqvL5bqTMBCMqf08yByWtl+V7P6kNT1vuV
         DB9RDWACda8M31RYyB065cOKehMuQAcTHv63IulnmbemqQCE45nFlbkDjOxEzScxuRat
         JXtdj+NiaB/OcVxsAv7tp4dPsYmf0cyb1OegacJmqfNStT/lZyuvpzRJr+mSbtWcewVa
         dBSTM/gaW4MLH17aVbTJzr6Blf3btY7ukN59ovIp1MsKKSBg5btDFge1tw61NkkCuunH
         +6UJH0apHVbkTjehfMcqndS9cmU87NvrnTgCrbohFc91o/5YsGomTDsBjf89njNZrG2U
         qXdw==
X-Gm-Message-State: AO0yUKUrCmtUURsmsCOhYbg3+O1xPUTM6kploQCBzg3C09i5OybN6P8F
	gTmGziYUticGgQGwW0U+blIyH3Gyw3U=
X-Google-Smtp-Source: AK7set+Hik9tPVE2DMDelEX1IWgyVI1gKJG77OX+DeTSgOUG8Z5biw8D7LBOAiTVRVe32PK0WccPbQ==
X-Received: by 2002:a17:907:e8b:b0:8e7:672f:23c0 with SMTP id ho11-20020a1709070e8b00b008e7672f23c0mr833416ejc.33.1677264636597;
        Fri, 24 Feb 2023 10:50:36 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 13/14] x86/vmx: move vvmx declarations used only by vmx code to private header
Date: Fri, 24 Feb 2023 20:50:09 +0200
Message-Id: <20230224185010.3692754-14-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/vmx called vvmx.h and move
there all definitions and declarations that are used only by vmx code and
don't need to reside in an external header.

Take the opportunity to replace u* with uint*_t, bool_t with bool and to
re-arrange the header as follows, all structures first, then all variable
decalarations, all function delarations, and finally all inline functions.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/arch/x86/hvm/vmx/intr.c             |   1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |   1 +
 xen/arch/x86/hvm/vmx/vvmx.c             |   1 +
 xen/arch/x86/hvm/vmx/vvmx.h             | 187 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h | 165 +--------------------
 6 files changed, 198 insertions(+), 159 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmx/vvmx.h

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index c8db501759..8431937f42 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -39,6 +39,7 @@
 #include <asm/vm_event.h>
 
 #include "vmx.h"
+#include "vvmx.h"
 
 /*
  * A few notes on virtual NMI and INTR delivery, and interactions with
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 4eb2571abb..3d0f6be5bb 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -34,7 +34,6 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/vmx/vmx.h>
-#include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/flushtlb.h>
 #include <asm/monitor.h>
@@ -44,6 +43,7 @@
 #include <asm/apic.h>
 
 #include "vmx.h"
+#include "vvmx.h"
 
 static bool_t __read_mostly opt_vpid_enabled = 1;
 boolean_param("vpid", opt_vpid_enabled);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 72d8f058f7..73ab4e9816 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -58,6 +58,7 @@
 
 #include "pi.h"
 #include "vmx.h"
+#include "vvmx.h"
 
 static bool_t __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 0bda8430b9..0af5411076 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -30,6 +30,7 @@
 #include <asm/hvm/nestedhvm.h>
 
 #include "vmx.h"
+#include "vvmx.h"
 
 static DEFINE_PER_CPU(u64 *, vvmcs_buf);
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.h b/xen/arch/x86/hvm/vmx/vvmx.h
new file mode 100644
index 0000000000..0367fae42a
--- /dev/null
+++ b/xen/arch/x86/hvm/vmx/vvmx.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * vvmx.h: Support virtual VMX for nested virtualization.
+ *
+ * Copyright (c) 2010, Intel Corporation.
+ * Author: Qing He <qing.he@intel.com>
+ *         Eddie Dong <eddie.dong@intel.com>
+ */
+
+#ifndef __X86_HVM_VMX_VVMX_PRIV_H__
+#define __X86_HVM_VMX_VVMX_PRIV_H__
+
+#include <xen/list.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/hvm/vcpu.h>
+#include <asm/hvm/hvm.h>
+#include <asm/hvm/vmx/vmcs.h>
+
+struct vvmcs_list {
+    unsigned long vvmcs_mfn;
+    struct list_head node;
+};
+
+#define vcpu_2_nvmx(v) (vcpu_nestedhvm(v).u.nvmx)
+
+/* bit 1, 2, 4 must be 1 */
+#define VMX_PINBASED_CTLS_DEFAULT1    0x16
+/* bit 1, 4-6,8,13-16,26 must be 1 */
+#define VMX_PROCBASED_CTLS_DEFAULT1   0x401e172
+/* bit 0-8, 10,11,13,14,16,17 must be 1 */
+#define VMX_EXIT_CTLS_DEFAULT1        0x36dff
+/* bit 0-8, and 12 must be 1 */
+#define VMX_ENTRY_CTLS_DEFAULT1       0x11ff
+
+union vmx_inst_info {
+    struct {
+        unsigned int scaling           :2; /* bit 0-1 */
+        unsigned int __rsvd0           :1; /* bit 2 */
+        unsigned int reg1              :4; /* bit 3-6 */
+        unsigned int addr_size         :3; /* bit 7-9 */
+        unsigned int memreg            :1; /* bit 10 */
+        unsigned int __rsvd1           :4; /* bit 11-14 */
+        unsigned int segment           :3; /* bit 15-17 */
+        unsigned int index_reg         :4; /* bit 18-21 */
+        unsigned int index_reg_invalid :1; /* bit 22 */
+        unsigned int base_reg          :4; /* bit 23-26 */
+        unsigned int base_reg_invalid  :1; /* bit 27 */
+        unsigned int reg2              :4; /* bit 28-31 */
+    } fields;
+    uint32_t word;
+};
+
+/*
+ * Virtual VMCS layout
+ *
+ * Since physical VMCS layout is unknown, a custom layout is used
+ * for virtual VMCS seen by guest. It occupies a 4k page, and the
+ * field is offset by an 9-bit offset into u64[], The offset is as
+ * follow, which means every <width, type> pair has a max of 32
+ * fields available.
+ *
+ *             9       7      5               0
+ *             --------------------------------
+ *     offset: | width | type |     index     |
+ *             --------------------------------
+ *
+ * Also, since the lower range <width=0, type={0,1}> has only one
+ * field: VPID, it is moved to a higher offset (63), and leaves the
+ * lower range to non-indexed field like VMCS revision.
+ *
+ */
+
+struct vvmcs_header {
+    uint32_t revision;
+    uint32_t abort;
+};
+
+union vmcs_encoding {
+    struct {
+        uint32_t access_type : 1;
+        uint32_t index : 9;
+        uint32_t type : 2;
+        uint32_t rsv1 : 1;
+        uint32_t width : 2;
+        uint32_t rsv2 : 17;
+    };
+    uint32_t word;
+};
+
+enum vvmcs_encoding_width {
+    VVMCS_WIDTH_16 = 0,
+    VVMCS_WIDTH_64,
+    VVMCS_WIDTH_32,
+    VVMCS_WIDTH_NATURAL,
+};
+
+enum vvmcs_encoding_type {
+    VVMCS_TYPE_CONTROL = 0,
+    VVMCS_TYPE_RO,
+    VVMCS_TYPE_GSTATE,
+    VVMCS_TYPE_HSTATE,
+};
+
+int cf_check nvmx_vcpu_initialise(struct vcpu *v);
+void cf_check nvmx_vcpu_destroy(struct vcpu *v);
+int cf_check nvmx_vcpu_reset(struct vcpu *v);
+uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v);
+enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v);
+bool cf_check nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
+                                        int error_code);
+void cf_check nvmx_domain_relinquish_resources(struct domain *d);
+
+bool cf_check nvmx_ept_enabled(struct vcpu *v);
+
+int cf_check nvmx_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec);
+
+uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t encoding);
+uint64_t get_vvmcs_real(const struct vcpu *, uint32_t encoding);
+void set_vvmcs_virtual(void *vvmcs, uint32_t encoding, uint64_t val);
+void set_vvmcs_real(const struct vcpu *, uint32_t encoding, uint64_t val);
+enum vmx_insn_errno get_vvmcs_virtual_safe(void *vvmcs, uint32_t encoding,
+                                           uint64_t *val);
+enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *, uint32_t encoding,
+                                        uint64_t *val);
+enum vmx_insn_errno set_vvmcs_virtual_safe(void *vvmcs, uint32_t encoding,
+                                           uint64_t val);
+enum vmx_insn_errno set_vvmcs_real_safe(const struct vcpu *, uint32_t encoding,
+                                        uint64_t val);
+
+#define get_vvmcs(vcpu, encoding) \
+  (cpu_has_vmx_vmcs_shadowing ? \
+   get_vvmcs_real(vcpu, encoding) : \
+   get_vvmcs_virtual(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding))
+
+#define set_vvmcs(vcpu, encoding, val) \
+  (cpu_has_vmx_vmcs_shadowing ? \
+   set_vvmcs_real(vcpu, encoding, val) : \
+   set_vvmcs_virtual(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
+
+#define get_vvmcs_safe(vcpu, encoding, val) \
+  (cpu_has_vmx_vmcs_shadowing ? \
+   get_vvmcs_real_safe(vcpu, encoding, val) : \
+   get_vvmcs_virtual_safe(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
+
+#define set_vvmcs_safe(vcpu, encoding, val) \
+  (cpu_has_vmx_vmcs_shadowing ? \
+   set_vvmcs_real_safe(vcpu, encoding, val) : \
+   set_vvmcs_virtual_safe(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
+
+void nvmx_destroy_vmcs(struct vcpu *v);
+int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason);
+int nvmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content);
+
+void nvmx_update_exec_control(struct vcpu *v, uint32_t value);
+void nvmx_update_secondary_exec_control(struct vcpu *v, unsigned long value);
+void nvmx_update_exception_bitmap(struct vcpu *v, unsigned long value);
+void nvmx_switch_guest(void);
+void nvmx_idtv_handling(void);
+uint64_t nvmx_get_tsc_offset(struct vcpu *v);
+int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
+                           unsigned int exit_reason);
+void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr);
+
+uint64_t nept_get_ept_vpid_cap(void);
+
+int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
+                        unsigned int *page_order, uint32_t rwx_acc,
+                        unsigned long *l1gfn, uint8_t *p2m_acc,
+                        uint64_t *exit_qual, uint32_t *exit_reason);
+int nvmx_cpu_up_prepare(unsigned int cpu);
+void nvmx_cpu_dead(unsigned int cpu);
+
+#endif /* __X86_HVM_VMX_VVMX_PRIV_H__ */
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
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index 2c3adb5dd6..2bf6ef40e9 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -22,10 +22,10 @@
 #ifndef __ASM_X86_HVM_VVMX_H__
 #define __ASM_X86_HVM_VVMX_H__
 
-struct vvmcs_list {
-    unsigned long vvmcs_mfn;
-    struct list_head node;
-};
+#include <xen/list.h>
+#include <xen/types.h>
+
+#include <asm/hvm/vmx/vmcs.h>
 
 struct nestedvmx {
     /*
@@ -42,11 +42,11 @@ struct nestedvmx {
     /* deferred nested interrupt */
     struct {
         unsigned long intr_info;
-        u32           error_code;
-        u8            source;
+        uint32_t      error_code;
+        uint8_t       source;
     } intr;
     struct {
-        bool_t   enabled;
+        bool     enabled;
         uint32_t exit_reason;
         uint32_t exit_qual;
     } ept;
@@ -54,161 +54,10 @@ struct nestedvmx {
     struct list_head launched_list;
 };
 
-#define vcpu_2_nvmx(v)	(vcpu_nestedhvm(v).u.nvmx)
-
-/* bit 1, 2, 4 must be 1 */
-#define VMX_PINBASED_CTLS_DEFAULT1	0x16
-/* bit 1, 4-6,8,13-16,26 must be 1 */
-#define VMX_PROCBASED_CTLS_DEFAULT1	0x401e172
-/* bit 0-8, 10,11,13,14,16,17 must be 1 */
-#define VMX_EXIT_CTLS_DEFAULT1		0x36dff
-/* bit 0-8, and 12 must be 1 */
-#define VMX_ENTRY_CTLS_DEFAULT1		0x11ff
-
-
-union vmx_inst_info {
-    struct {
-        unsigned int scaling           :2; /* bit 0-1 */
-        unsigned int __rsvd0           :1; /* bit 2 */
-        unsigned int reg1              :4; /* bit 3-6 */
-        unsigned int addr_size         :3; /* bit 7-9 */
-        unsigned int memreg            :1; /* bit 10 */
-        unsigned int __rsvd1           :4; /* bit 11-14 */
-        unsigned int segment           :3; /* bit 15-17 */
-        unsigned int index_reg         :4; /* bit 18-21 */
-        unsigned int index_reg_invalid :1; /* bit 22 */
-        unsigned int base_reg          :4; /* bit 23-26 */
-        unsigned int base_reg_invalid  :1; /* bit 27 */
-        unsigned int reg2              :4; /* bit 28-31 */
-    } fields;
-    u32 word;
-};
-
-int cf_check nvmx_vcpu_initialise(struct vcpu *v);
-void cf_check nvmx_vcpu_destroy(struct vcpu *v);
-int cf_check nvmx_vcpu_reset(struct vcpu *v);
-uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v);
-enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v);
-bool cf_check nvmx_intercepts_exception(
-    struct vcpu *v, unsigned int vector, int error_code);
-void cf_check nvmx_domain_relinquish_resources(struct domain *d);
-
-bool cf_check nvmx_ept_enabled(struct vcpu *v);
-
 #define EPT_TRANSLATE_SUCCEED       0
 #define EPT_TRANSLATE_VIOLATION     1
 #define EPT_TRANSLATE_MISCONFIG     2
 #define EPT_TRANSLATE_RETRY         3
 
-int cf_check nvmx_hap_walk_L1_p2m(
-    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
-    uint8_t *p2m_acc, struct npfec npfec);
-
-/*
- * Virtual VMCS layout
- *
- * Since physical VMCS layout is unknown, a custom layout is used
- * for virtual VMCS seen by guest. It occupies a 4k page, and the
- * field is offset by an 9-bit offset into u64[], The offset is as
- * follow, which means every <width, type> pair has a max of 32
- * fields available.
- *
- *             9       7      5               0
- *             --------------------------------
- *     offset: | width | type |     index     |
- *             --------------------------------
- *
- * Also, since the lower range <width=0, type={0,1}> has only one
- * field: VPID, it is moved to a higher offset (63), and leaves the
- * lower range to non-indexed field like VMCS revision.
- *
- */
-
-struct vvmcs_header {
-    u32 revision;
-    u32 abort;
-};
-
-union vmcs_encoding {
-    struct {
-        u32 access_type : 1;
-        u32 index : 9;
-        u32 type : 2;
-        u32 rsv1 : 1;
-        u32 width : 2;
-        u32 rsv2 : 17;
-    };
-    u32 word;
-};
-
-enum vvmcs_encoding_width {
-    VVMCS_WIDTH_16 = 0,
-    VVMCS_WIDTH_64,
-    VVMCS_WIDTH_32,
-    VVMCS_WIDTH_NATURAL,
-};
-
-enum vvmcs_encoding_type {
-    VVMCS_TYPE_CONTROL = 0,
-    VVMCS_TYPE_RO,
-    VVMCS_TYPE_GSTATE,
-    VVMCS_TYPE_HSTATE,
-};
-
-u64 get_vvmcs_virtual(void *vvmcs, u32 encoding);
-u64 get_vvmcs_real(const struct vcpu *, u32 encoding);
-void set_vvmcs_virtual(void *vvmcs, u32 encoding, u64 val);
-void set_vvmcs_real(const struct vcpu *, u32 encoding, u64 val);
-enum vmx_insn_errno get_vvmcs_virtual_safe(void *vvmcs, u32 encoding, u64 *val);
-enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *, u32 encoding,
-                                        u64 *val);
-enum vmx_insn_errno set_vvmcs_virtual_safe(void *vvmcs, u32 encoding, u64 val);
-enum vmx_insn_errno set_vvmcs_real_safe(const struct vcpu *, u32 encoding,
-                                        u64 val);
-
-#define get_vvmcs(vcpu, encoding) \
-  (cpu_has_vmx_vmcs_shadowing ? \
-   get_vvmcs_real(vcpu, encoding) : \
-   get_vvmcs_virtual(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding))
-
-#define set_vvmcs(vcpu, encoding, val) \
-  (cpu_has_vmx_vmcs_shadowing ? \
-   set_vvmcs_real(vcpu, encoding, val) : \
-   set_vvmcs_virtual(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
-
-#define get_vvmcs_safe(vcpu, encoding, val) \
-  (cpu_has_vmx_vmcs_shadowing ? \
-   get_vvmcs_real_safe(vcpu, encoding, val) : \
-   get_vvmcs_virtual_safe(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
-
-#define set_vvmcs_safe(vcpu, encoding, val) \
-  (cpu_has_vmx_vmcs_shadowing ? \
-   set_vvmcs_real_safe(vcpu, encoding, val) : \
-   set_vvmcs_virtual_safe(vcpu_nestedhvm(vcpu).nv_vvmcx, encoding, val))
-
-void nvmx_destroy_vmcs(struct vcpu *v);
-int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason);
-int nvmx_msr_read_intercept(unsigned int msr,
-                                u64 *msr_content);
-
-void nvmx_update_exec_control(struct vcpu *v, u32 value);
-void nvmx_update_secondary_exec_control(struct vcpu *v,
-                                        unsigned long value);
-void nvmx_update_exception_bitmap(struct vcpu *v, unsigned long value);
-void nvmx_switch_guest(void);
-void nvmx_idtv_handling(void);
-u64 nvmx_get_tsc_offset(struct vcpu *v);
-int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
-                          unsigned int exit_reason);
-void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr);
-
-uint64_t nept_get_ept_vpid_cap(void);
-
-int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
-                        unsigned int *page_order, uint32_t rwx_acc,
-                        unsigned long *l1gfn, uint8_t *p2m_acc,
-                        uint64_t *exit_qual, uint32_t *exit_reason);
-int nvmx_cpu_up_prepare(unsigned int cpu);
-void nvmx_cpu_dead(unsigned int cpu);
 #endif /* __ASM_X86_HVM_VVMX_H__ */
 
-- 
2.37.2


