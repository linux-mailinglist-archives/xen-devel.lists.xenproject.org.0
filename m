Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFA4A8A2D1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954133.1348482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIr-0005AB-5R; Tue, 15 Apr 2025 15:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954133.1348482; Tue, 15 Apr 2025 15:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIr-00057C-0O; Tue, 15 Apr 2025 15:34:25 +0000
Received: by outflank-mailman (input) for mailman id 954133;
 Tue, 15 Apr 2025 15:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4iIo-0004bx-Tj
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:34:23 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3e08f7-1a0f-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 17:34:22 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-736bfa487c3so5018054b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:34:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bd21c670esm8893775b3a.69.2025.04.15.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:34:19 -0700 (PDT)
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
X-Inumbo-ID: 1a3e08f7-1a0f-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744731260; x=1745336060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqJO2WNEI84OX8hveo+xemBR8F7EcK50+XUU/oRndbc=;
        b=tTKeiCNb376prT01ZrOAoGY7VdSG+sUzo3M73lr1fkSkoSOb6MFdb277D1pTEr7HbC
         eSknaIBGvP7uDiu7EySTOjLNnAOgsU0Zda3qrKqbSE83yfSTt4UXdTh4pX/+y+DpjqtJ
         82q68ig1egb+GxgLZ4ZVMR0VHwGGn+2jw30Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731260; x=1745336060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqJO2WNEI84OX8hveo+xemBR8F7EcK50+XUU/oRndbc=;
        b=VnAruEigk8TCriZRMGq9AyVtm0W8BJRFDf2QnnaMOxrzMwd48EGVv6/M1O6+MWif8o
         wlNOPj3o5fvdj/uwzwtloUkZ3M0v51LcODgDrK4NXP5yxyp5mgYxh4RQUNQ1cNYzJ3DN
         /4pPnDNr3MuMySncVDulDEZ4xMqO2Z5lZWx/NlnOFO8iKoeg4w4IVDj3UDPg9mapgZYv
         Eboo5i73bc58cs0tXFK90rzShEnLmqAx7Cl+WN3xKITkgu9I41Sac97YnNnSectm2zD4
         FiW+G0aijNZMFKzCA24daSosMQpPlN5rCYjBY5vbMoUImvPvjX6NC4q+CgX59RKoxSOH
         Wbwg==
X-Gm-Message-State: AOJu0YzYdoyoCNHcnA1pXhqOrh6Oc9feGxS3uHq5NpyVgBEqQc+VSWEu
	qV4p2AXsGupxBkfjqHsrqCPbxZUENr+3JoQUrvJv8MRcwfrRC3p3jbwrhCtPQhAHzXZG3OVyhmo
	O
X-Gm-Gg: ASbGncuRED75IhzxAWaHbyttkVyK95VOK6mQKcvIQu0IdN2PICMv/FHtjxLADyeyid5
	vl5cmWymk2p9LSxFHo/H/5wQzT8NiqF80ZWzYdKU5goB+B1cGQdJrZYVcPCFooyuolFdyaUvLza
	I88RBxNftlsZsbvDGWIj/Ew20LTC/V2kX815Rg701VLrIR6o3q5e+IjyvwijBG/RJYgYNhcaC5X
	7nXVjMB7wahhFUmw6wPLjOoQ3NLGEjtsaitds3q2ErOCgKqAqa7doJkJUBMGYzZYqfVpD7Yz3Rw
	HoNb0gU1AHMaKKXBmtCAdqrq5rj5wYK8DZ663JVRT5ML/A==
X-Google-Smtp-Source: AGHT+IHCz8A0W6NoRJ+ZPBXZlEco0yWr8f0vrf0Rgna4FL7cDXqgQdL1jkSgNJN5kFOA+B2fS33S0w==
X-Received: by 2002:a05:6a00:2c94:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73c0b86b4f5mr5871486b3a.4.1744731260346;
        Tue, 15 Apr 2025 08:34:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/4] x86/hvm: fix handling of accesses to partial r/o MMIO pages
Date: Tue, 15 Apr 2025 17:32:44 +0200
Message-ID: <20250415153246.81688-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415153246.81688-1-roger.pau@citrix.com>
References: <20250415153246.81688-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to handle accesses to MMIO pages partially read-only is
based on the (now removed) logic used to handle accesses to the r/o MMCFG
region(s) for PVH v1 dom0.  However that has issues when running on AMD
hardware, as in that case the guest linear address that triggered the fault
is not provided as part of the VM exit.  This caused
mmio_ro_emulated_write() to always fail before calling
subpage_mmio_write_emulate() when running on AMD and called from an HVM
context.

Take a different approach and convert the handling of partial read-only
MMIO page accesses into an HVM MMIO ops handler, as that's the more natural
way to handle this kind of emulation for HVM domains.

This allows getting rid of hvm_emulate_one_mmio() and it's single call site
in hvm_hap_nested_page_fault().  As part of the fix r/o MMIO accesses are
now handled by handle_mmio_with_translation(), re-using the same logic that
was used for other read-only types part of p2m_is_discard_write().  The
usage of emulation for faulting p2m_mmio_direct types is limited to
addresses in the r/o MMIO range. The page present check is dropped as type
p2m_mmio_direct must have the present bit set in the PTE.

Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
attempting to fixup faults resulting from accesses to read-only MMIO
regions, as handling of those accesses is now done by handle_mmio().

Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce hvm/mmio.c to place the r/o MMIO handlers.
 - Add comment about pf-fixup and r/o MMIO range checking.
 - Expand commit message about dropping the PTE present check and usage of
   the emulator.
 - Return X86EMUL_OKAY in the read handler if the MMIO region is not found.
 - Check the faulting address is in the mmio_ro_ranges before sending for
   emulation.
---
 xen/arch/x86/hvm/Makefile              |   1 +
 xen/arch/x86/hvm/emulate.c             |  51 ++-----------
 xen/arch/x86/hvm/hvm.c                 |  17 ++---
 xen/arch/x86/hvm/mmio.c                | 100 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/emulate.h |   1 -
 xen/arch/x86/include/asm/hvm/io.h      |   3 +
 xen/arch/x86/include/asm/mm.h          |  12 +++
 xen/arch/x86/mm.c                      |  37 +--------
 8 files changed, 132 insertions(+), 90 deletions(-)
 create mode 100644 xen/arch/x86/hvm/mmio.c

diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2bf..6ec2c8f2db56 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -15,6 +15,7 @@ obj-y += intercept.o
 obj-y += io.o
 obj-y += ioreq.o
 obj-y += irq.o
+obj-y += mmio.o
 obj-y += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 9fff1b82f7c6..fbe8dd6ccb0b 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -370,7 +370,12 @@ static int hvmemul_do_io(
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
         {
-            if ( is_mmio && is_hardware_domain(currd) )
+            if ( is_mmio && is_hardware_domain(currd) &&
+                 /*
+                  * Do not attempt to fixup accesses to r/o MMIO regions, they
+                  * are expected to be terminated by the null handler below.
+                  */
+                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )
             {
                 /*
                  * PVH dom0 is likely missing MMIO mappings on the p2m, due to
@@ -2856,50 +2861,6 @@ int hvm_emulate_one(
     return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
 }
 
-int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
-{
-    static const struct x86_emulate_ops hvm_ro_emulate_ops_mmio = {
-        .read       = x86emul_unhandleable_rw,
-        .insn_fetch = hvmemul_insn_fetch,
-        .write      = mmio_ro_emulated_write,
-        .validate   = hvmemul_validate,
-    };
-    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
-    struct hvm_emulate_ctxt ctxt;
-    unsigned int seg, bdf;
-    int rc;
-
-    if ( pci_ro_mmcfg_decode(mfn, &seg, &bdf) )
-    {
-        /* Should be always handled by vPCI for PVH dom0. */
-        gdprintk(XENLOG_ERR, "unhandled MMCFG access for %pp\n",
-                 &PCI_SBDF(seg, bdf));
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNHANDLEABLE;
-    }
-
-    hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
-                          guest_cpu_user_regs());
-    ctxt.ctxt.data = &mmio_ro_ctxt;
-
-    switch ( rc = _hvm_emulate_one(&ctxt, &hvm_ro_emulate_ops_mmio,
-                                   VIO_no_completion) )
-    {
-    case X86EMUL_UNHANDLEABLE:
-    case X86EMUL_UNIMPLEMENTED:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, "r/o MMIO", &ctxt, rc);
-        break;
-    case X86EMUL_EXCEPTION:
-        hvm_inject_event(&ctxt.ctxt.event);
-        /* fallthrough */
-    default:
-        hvm_emulate_writeback(&ctxt);
-        break;
-    }
-
-    return rc;
-}
-
 void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     unsigned int errcode)
 {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6f1174c5127e..6b998387e3d8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/io.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/trace.h>
@@ -35,7 +36,6 @@
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/e820.h>
-#include <asm/io.h>
 #include <asm/regs.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
@@ -692,6 +692,8 @@ int hvm_domain_initialise(struct domain *d,
 
     register_portio_handler(d, XEN_HVM_DEBUGCONS_IOPORT, 1, hvm_print_line);
 
+    register_subpage_ro_handler(d);
+
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
 
@@ -1981,7 +1983,10 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
      */
     if ( (p2mt == p2m_mmio_dm) ||
          (npfec.write_access &&
-          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
+          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
+           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
+           (p2mt == p2m_mmio_direct &&
+            rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn))))) )
     {
         if ( !handle_mmio_with_translation(gla, gfn, npfec) )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -2033,14 +2038,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
         goto out_put_gfn;
     }
 
-    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
-         (is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)) &&
-         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
-    {
-        rc = 1;
-        goto out_put_gfn;
-    }
-
     /* If we fell through, the vcpu will retry now that access restrictions have
      * been removed. It may fault again if the p2m entry type still requires so.
      * Otherwise, this is an error condition. */
diff --git a/xen/arch/x86/hvm/mmio.c b/xen/arch/x86/hvm/mmio.c
new file mode 100644
index 000000000000..ee29d9e5039e
--- /dev/null
+++ b/xen/arch/x86/hvm/mmio.c
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MMIO related routines.
+ *
+ * Copyright (c) 2025 Cloud Software Group
+ */
+
+#include <xen/io.h>
+#include <xen/mm.h>
+
+#include <asm/p2m.h>
+
+static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
+{
+    p2m_type_t t;
+    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);
+
+    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
+           subpage_mmio_find_page(mfn);
+}
+
+static int cf_check subpage_mmio_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+{
+    struct domain *d = v->domain;
+    p2m_type_t t;
+    mfn_t mfn = get_gfn_query(d, addr, &t);
+    struct subpage_ro_range *entry;
+    volatile void __iomem *mem;
+
+    *data = ~0UL;
+
+    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
+    {
+        put_gfn(d, addr);
+        return X86EMUL_RETRY;
+    }
+
+    entry = subpage_mmio_find_page(mfn);
+    if ( !entry )
+    {
+        put_gfn(d, addr);
+        return X86EMUL_OKAY;
+    }
+
+    mem = subpage_mmio_map_page(entry);
+    if ( !mem )
+    {
+        put_gfn(d, addr);
+        gprintk(XENLOG_ERR,
+                "Failed to map page for MMIO read at %#lx -> %#lx\n",
+                addr, mfn_to_maddr(mfn) + PAGE_OFFSET(addr));
+        return X86EMUL_OKAY;
+    }
+
+    *data = read_mmio(mem + PAGE_OFFSET(addr), len);
+
+    put_gfn(d, addr);
+    return X86EMUL_OKAY;
+}
+
+static int cf_check subpage_mmio_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+{
+    struct domain *d = v->domain;
+    p2m_type_t t;
+    mfn_t mfn = get_gfn_query(d, addr, &t);
+
+    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
+    {
+        put_gfn(d, addr);
+        return X86EMUL_RETRY;
+    }
+
+    subpage_mmio_write_emulate(mfn, PAGE_OFFSET(addr), data, len);
+
+    put_gfn(d, addr);
+    return X86EMUL_OKAY;
+}
+
+void register_subpage_ro_handler(struct domain *d)
+{
+    static const struct hvm_mmio_ops subpage_mmio_ops = {
+        .check = subpage_mmio_accept,
+        .read = subpage_mmio_read,
+        .write = subpage_mmio_write,
+    };
+
+    register_mmio_handler(d, &subpage_mmio_ops);
+}
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
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index c7a2d2a5be4e..178ac32e151f 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -86,7 +86,6 @@ void hvmemul_cancel(struct vcpu *v);
 struct segment_register *hvmemul_get_seg_reg(
     enum x86_segment seg,
     struct hvm_emulate_ctxt *hvmemul_ctxt);
-int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla);
 
 static inline bool handle_mmio(void)
 {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 565bad300d20..c12f099a037c 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -135,6 +135,9 @@ void destroy_vpci_mmcfg(struct domain *d);
 /* Remove MMCFG regions from a domain ->iomem_caps. */
 int vpci_mmcfg_deny_access(struct domain *d);
 
+/* r/o MMIO subpage access handler. */
+void register_subpage_ro_handler(struct domain *d);
+
 #endif /* __ASM_X86_HVM_IO_H__ */
 
 
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index a1bc8cc27451..c2e9ef6e5023 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -554,6 +554,18 @@ int cf_check mmio_ro_emulated_write(
     enum x86_segment seg, unsigned long offset, void *p_data,
     unsigned int bytes, struct x86_emulate_ctxt *ctxt);
 
+/* r/o MMIO subpage access handlers. */
+struct subpage_ro_range {
+    struct list_head list;
+    mfn_t mfn;
+    void __iomem *mapped;
+    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
+};
+struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn);
+void __iomem *subpage_mmio_map_page(struct subpage_ro_range *entry);
+void subpage_mmio_write_emulate(
+    mfn_t mfn, unsigned int offset, unsigned long data, unsigned int len);
+
 int audit_adjust_pgtables(struct domain *d, int dir, int noisy);
 
 extern int pagefault_by_memadd(unsigned long addr, struct cpu_user_regs *regs);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 989e62e7ce6f..f59c7816fba5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,13 +157,6 @@ struct rangeset *__read_mostly mmio_ro_ranges;
 static uint32_t __ro_after_init base_disallow_mask;
 
 /* Handling sub-page read-only MMIO regions */
-struct subpage_ro_range {
-    struct list_head list;
-    mfn_t mfn;
-    void __iomem *mapped;
-    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
-};
-
 static LIST_HEAD_RO_AFTER_INIT(subpage_ro_ranges);
 static DEFINE_SPINLOCK(subpage_ro_lock);
 
@@ -4929,7 +4922,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
-static struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn)
+struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn)
 {
     struct subpage_ro_range *entry;
 
@@ -5074,7 +5067,7 @@ int __init subpage_mmio_ro_add(
     return rc;
 }
 
-static void __iomem *subpage_mmio_map_page(
+void __iomem *subpage_mmio_map_page(
     struct subpage_ro_range *entry)
 {
     void __iomem *mapped_page;
@@ -5099,7 +5092,7 @@ static void __iomem *subpage_mmio_map_page(
     return entry->mapped;
 }
 
-static void subpage_mmio_write_emulate(
+void subpage_mmio_write_emulate(
     mfn_t mfn,
     unsigned int offset,
     unsigned long data,
@@ -5133,30 +5126,6 @@ static void subpage_mmio_write_emulate(
     write_mmio(addr + offset, data, len);
 }
 
-#ifdef CONFIG_HVM
-bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
-{
-    unsigned int offset = PAGE_OFFSET(gla);
-    const struct subpage_ro_range *entry;
-
-    entry = subpage_mmio_find_page(mfn);
-    if ( !entry )
-        return false;
-
-    if ( !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
-    {
-        /*
-         * We don't know the write size at this point yet, so it could be
-         * an unaligned write, but accept it here anyway and deal with it
-         * later.
-         */
-        return true;
-    }
-
-    return false;
-}
-#endif
-
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
-- 
2.48.1


