Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D773C93199
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 21:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175121.1500033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wa-0003iu-NI; Fri, 28 Nov 2025 20:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175121.1500033; Fri, 28 Nov 2025 20:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wa-0003gX-Ju; Fri, 28 Nov 2025 20:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1175121;
 Fri, 28 Nov 2025 20:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP4wY-0003fj-EE
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 20:19:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 951e9ffb-cc97-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 21:19:46 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so14523055e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 12:19:46 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052ec685sm98201245e9.6.2025.11.28.12.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 12:19:44 -0800 (PST)
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
X-Inumbo-ID: 951e9ffb-cc97-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764361185; x=1764965985; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8qjxRSKtEjOjafIorv/edcLEVgJic5CXDGXAX2YZh4=;
        b=cFn8S90lHKHCCPglW7KIQJ/fNF8v+OBWOiy4/O0KMrhS+b2k6ndOFQ3g7l6h+JmdJU
         vVWdC/T00ndwtYdvTrja8+6sx2HpU6GI4Ccr25+PduTK/+LEIENMpP0iBbnqAuf4Eqol
         OxF3Nn0wptoxi1a3UJ2xZlFm9G+79bUGeKmi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361185; x=1764965985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8qjxRSKtEjOjafIorv/edcLEVgJic5CXDGXAX2YZh4=;
        b=bEPPaBGLz9ff3WSB+BIJlQqlCl8226ndQZ/04KNic6epZR1mhM+lsV86lGBsga6l6H
         IMa2Mt18ETg4gL0UrRSEGhAqgJqW2/EgpwW3aJg85WEx/Y9mVc8KZBXkkdK7YCmMNJLO
         8fMp/mY0sduca9RhXz6hyrviXoqAAcHclkI2mmtHa0dd6cj/ZMjQ5NOCC+C3E8GfcMBM
         pxmtdB8PUsCNf12ZdppxUViBn6OH7xaZC3WLp/c4dRJ0DhTMfOqA2ZqNiAiajWJRDIkL
         7bnjxL/52lyQaK18fqqqg6HNrMOvFek7cOlaBiCvuY/1xFizLBt8eCqHbAchh9k/rLev
         XAqg==
X-Gm-Message-State: AOJu0YwmGXWppmnXCrlgXk62oWBx2vxXbnwrI0sVekYEYKjN4Du7Lb3R
	r5fIGGWEKGOL/pZ+OuQZp23SelY5k0VkKodTJbcYVS+fDm7bNBIJaS5G1orYwvoudnlBsgBC9Mq
	MscQy
X-Gm-Gg: ASbGnctUir+JGyW/ZQmb2jce7ArlYyvLFaG/6uL7ubtwel6s74PlQXVaYevjX87Z/Lq
	P7JgPue68+Ir97qGJo+27wp7bj/45y+njW0oi9Jhuy62vM/uhghuxdlLDzamLXrcsKoWFTeYb40
	gGBX8X42zISSRGzililGuMOkOZ7Gvl+MsLE2cgFXx6inL3zwCC+dCp44EX87wB1u4MUAtCGp3kZ
	vfZ6hUnZY3nTyLfqPago8grjFOjm9ktbRhcV5HKuZBFP2rYVum/JmSXPERNBGTicoO9aX2ymzww
	OpUDgLfeoj5vbBdXKR0GTYP8LGb4NGEvKWpMYUQhknRnh3JTS+Z1Y+0sQf7wzg9W30lCISEy0AS
	DDFdObjgzZgCBc2R/eJWiP7eMTqn/QWOJdAoI/K++mg7NFi5MyhpxFFgZW3woI3KT2ruY/fbF9t
	jV1b4y1Nv8equlnbC4dl1GP/84RUr6MT1sruvvtf9pW6YlCMAfTLmUh1JvX8sbvw==
X-Google-Smtp-Source: AGHT+IGg/PlPhAodwOJqIn+DwfMLGx6kSijdZ/6WugN3bWPpIrcowRICT81Gm1elCDallSKlhuHyiw==
X-Received: by 2002:a05:600c:1f0f:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-477c0165bb8mr285786355e9.3.1764361185352;
        Fri, 28 Nov 2025 12:19:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/svm: Drop svmdebug.c
Date: Fri, 28 Nov 2025 20:19:36 +0000
Message-Id: <20251128201937.1294742-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything here is really VMCB functionality, so merge it into vmcb.c.  Move
the declarations from the global svmdebug.h to the logical vmcb.h.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/Makefile               |   1 -
 xen/arch/x86/hvm/svm/nestedsvm.c            |   1 -
 xen/arch/x86/hvm/svm/svmdebug.c             | 181 --------------------
 xen/arch/x86/hvm/svm/vmcb.c                 | 159 +++++++++++++++++
 xen/arch/x86/hvm/svm/vmcb.h                 |   3 +
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h |   3 -
 6 files changed, 162 insertions(+), 186 deletions(-)
 delete mode 100644 xen/arch/x86/hvm/svm/svmdebug.c

diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 760d2954da83..8a072cafd572 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -4,5 +4,4 @@ obj-bin-y += entry.o
 obj-y += intr.o
 obj-y += nestedsvm.o
 obj-y += svm.o
-obj-y += svmdebug.o
 obj-y += vmcb.o
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 191466755148..63ed6c86b775 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -9,7 +9,6 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/paging.h> /* paging_mode_hap */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
deleted file mode 100644
index bdb9ea3583ee..000000000000
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ /dev/null
@@ -1,181 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * svmdebug.c: debug functions
- * Copyright (c) 2011, Advanced Micro Devices, Inc.
- *
- */
-
-#include <xen/sched.h>
-#include <asm/processor.h>
-#include <asm/msr-index.h>
-#include <asm/hvm/svm/svmdebug.h>
-
-#include "vmcb.h"
-
-static void svm_dump_sel(const char *name, const struct segment_register *s)
-{
-    printk("%s: %04x %04x %08x %016"PRIx64"\n",
-           name, s->sel, s->attr, s->limit, s->base);
-}
-
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
-{
-    struct vcpu *curr = current;
-
-    /*
-     * If we are dumping the VMCB currently in context, some guest state may
-     * still be cached in hardware.  Retrieve it.
-     */
-    if ( vmcb == curr->arch.hvm.svm.vmcb )
-        svm_sync_vmcb(curr, vmcb_in_sync);
-
-    printk("Dumping guest's current state at %s...\n", from);
-    printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
-           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
-
-    printk("cr_intercepts = %#x dr_intercepts = %#x "
-           "exception_intercepts = %#x\n",
-           vmcb_get_cr_intercepts(vmcb), vmcb_get_dr_intercepts(vmcb),
-           vmcb_get_exception_intercepts(vmcb));
-    printk("general1_intercepts = %#x general2_intercepts = %#x\n",
-           vmcb_get_general1_intercepts(vmcb), vmcb_get_general2_intercepts(vmcb));
-    printk("iopm_base_pa = %#"PRIx64" msrpm_base_pa = %#"PRIx64" tsc_offset = %#"PRIx64"\n",
-           vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
-           vmcb_get_tsc_offset(vmcb));
-    printk("tlb_control = %#x vintr = %#"PRIx64" int_stat = %#"PRIx64"\n",
-           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
-           vmcb->int_stat.raw);
-    printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %#x\n",
-           vmcb->event_inj.raw, vmcb->event_inj.v,
-           vmcb->event_inj.ev, vmcb->event_inj.type,
-           vmcb->event_inj.vector);
-    printk("exitcode = %#"PRIx64" exit_int_info = %#"PRIx64"\n",
-           vmcb->exitcode, vmcb->exit_int_info.raw);
-    printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
-           vmcb->exitinfo1, vmcb->exitinfo2);
-    printk("asid = %#x np_ctrl = %#"PRIx64":%s%s%s\n",
-           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
-           vmcb_get_np(vmcb)     ? " NP"     : "",
-           vmcb_get_sev(vmcb)    ? " SEV"    : "",
-           vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
-    printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
-           vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
-    printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
-           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->lstar);
-    printk("CR0 = 0x%016"PRIx64" CR2 = 0x%016"PRIx64"\n",
-           vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
-    printk("CR3 = 0x%016"PRIx64" CR4 = 0x%016"PRIx64"\n",
-           vmcb_get_cr3(vmcb), vmcb_get_cr4(vmcb));
-    printk("RSP = 0x%016"PRIx64"  RIP = 0x%016"PRIx64"\n",
-           vmcb->rsp, vmcb->rip);
-    printk("RAX = 0x%016"PRIx64"  RFLAGS=0x%016"PRIx64"\n",
-           vmcb->rax, vmcb->rflags);
-    printk("DR6 = 0x%016"PRIx64", DR7 = 0x%016"PRIx64"\n",
-           vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
-    printk("CSTAR = 0x%016"PRIx64" SFMask = 0x%016"PRIx64"\n",
-           vmcb->cstar, vmcb->sfmask);
-    printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
-           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
-    printk("SSP = 0x%016"PRIx64" S_CET = 0x%016"PRIx64" ISST = 0x%016"PRIx64"\n",
-           vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
-    printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
-           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
-
-    /* print out all the selectors */
-    printk("       sel attr  limit   base\n");
-    svm_dump_sel("  CS", &vmcb->cs);
-    svm_dump_sel("  DS", &vmcb->ds);
-    svm_dump_sel("  SS", &vmcb->ss);
-    svm_dump_sel("  ES", &vmcb->es);
-    svm_dump_sel("  FS", &vmcb->fs);
-    svm_dump_sel("  GS", &vmcb->gs);
-    svm_dump_sel("GDTR", &vmcb->gdtr);
-    svm_dump_sel("LDTR", &vmcb->ldtr);
-    svm_dump_sel("IDTR", &vmcb->idtr);
-    svm_dump_sel("  TR", &vmcb->tr);
-}
-
-bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
-                      const struct vcpu *v, bool verbose)
-{
-    bool ret = false; /* ok */
-    unsigned long cr0 = vmcb_get_cr0(vmcb);
-    unsigned long cr3 = vmcb_get_cr3(vmcb);
-    unsigned long cr4 = vmcb_get_cr4(vmcb);
-    unsigned long valid;
-    uint64_t efer = vmcb_get_efer(vmcb);
-
-#define PRINTF(fmt, args...) do { \
-    if ( !verbose ) return true; \
-    ret = true; \
-    printk(XENLOG_GUEST "%pv[%s]: " fmt, v, from, ## args); \
-} while (0)
-
-    if ( !(efer & EFER_SVME) )
-        PRINTF("EFER: SVME bit not set (%#"PRIx64")\n", efer);
-
-    if ( !(cr0 & X86_CR0_CD) && (cr0 & X86_CR0_NW) )
-        PRINTF("CR0: CD bit is zero and NW bit set (%#"PRIx64")\n", cr0);
-
-    if ( cr0 >> 32 )
-        PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
-
-    if ( (cr0 & X86_CR0_PG) &&
-         ((cr3 & 7) ||
-          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
-          ((efer & EFER_LMA) &&
-           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
-        PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
-
-    valid = hvm_cr4_guest_valid_bits(v->domain);
-    if ( cr4 & ~valid )
-        PRINTF("CR4: invalid value %#lx (valid %#lx, rejected %#lx)\n",
-               cr4, valid, cr4 & ~valid);
-
-    if ( vmcb_get_dr6(vmcb) >> 32 )
-        PRINTF("DR6: bits [63:32] are not zero (%#"PRIx64")\n",
-               vmcb_get_dr6(vmcb));
-
-    if ( vmcb_get_dr7(vmcb) >> 32 )
-        PRINTF("DR7: bits [63:32] are not zero (%#"PRIx64")\n",
-               vmcb_get_dr7(vmcb));
-
-    if ( efer & ~EFER_KNOWN_MASK )
-        PRINTF("EFER: unknown bits are not zero (%#"PRIx64")\n", efer);
-
-    if ( hvm_efer_valid(v, efer, -1) )
-        PRINTF("EFER: %s (%"PRIx64")\n", hvm_efer_valid(v, efer, -1), efer);
-
-    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) )
-    {
-        if ( !(cr4 & X86_CR4_PAE) )
-            PRINTF("EFER_LME and CR0.PG are both set and CR4.PAE is zero\n");
-        if ( !(cr0 & X86_CR0_PE) )
-            PRINTF("EFER_LME and CR0.PG are both set and CR0.PE is zero\n");
-    }
-
-    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) && (cr4 & X86_CR4_PAE) &&
-         vmcb->cs.l && vmcb->cs.db )
-        PRINTF("EFER_LME, CR0.PG, CR4.PAE, CS.L and CS.D are all non-zero\n");
-
-    if ( !(vmcb_get_general2_intercepts(vmcb) & GENERAL2_INTERCEPT_VMRUN) )
-        PRINTF("GENERAL2_INTERCEPT: VMRUN intercept bit is clear (%#"PRIx32")\n",
-               vmcb_get_general2_intercepts(vmcb));
-
-    if ( vmcb->event_inj.resvd1 )
-        PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
-               vmcb->event_inj.raw);
-
-#undef PRINTF
-    return ret;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 44fa76bf0228..b1a79d515143 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -228,6 +228,165 @@ void svm_destroy_vmcb(struct vcpu *v)
     svm->vmcb = NULL;
 }
 
+static void svm_dump_sel(const char *name, const struct segment_register *s)
+{
+    printk("%s: %04x %04x %08x %016"PRIx64"\n",
+           name, s->sel, s->attr, s->limit, s->base);
+}
+
+void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
+{
+    struct vcpu *curr = current;
+
+    /*
+     * If we are dumping the VMCB currently in context, some guest state may
+     * still be cached in hardware.  Retrieve it.
+     */
+    if ( vmcb == curr->arch.hvm.svm.vmcb )
+        svm_sync_vmcb(curr, vmcb_in_sync);
+
+    printk("Dumping guest's current state at %s...\n", from);
+    printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
+           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
+
+    printk("cr_intercepts = %#x dr_intercepts = %#x "
+           "exception_intercepts = %#x\n",
+           vmcb_get_cr_intercepts(vmcb), vmcb_get_dr_intercepts(vmcb),
+           vmcb_get_exception_intercepts(vmcb));
+    printk("general1_intercepts = %#x general2_intercepts = %#x\n",
+           vmcb_get_general1_intercepts(vmcb), vmcb_get_general2_intercepts(vmcb));
+    printk("iopm_base_pa = %#"PRIx64" msrpm_base_pa = %#"PRIx64" tsc_offset = %#"PRIx64"\n",
+           vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
+           vmcb_get_tsc_offset(vmcb));
+    printk("tlb_control = %#x vintr = %#"PRIx64" int_stat = %#"PRIx64"\n",
+           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
+           vmcb->int_stat.raw);
+    printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %#x\n",
+           vmcb->event_inj.raw, vmcb->event_inj.v,
+           vmcb->event_inj.ev, vmcb->event_inj.type,
+           vmcb->event_inj.vector);
+    printk("exitcode = %#"PRIx64" exit_int_info = %#"PRIx64"\n",
+           vmcb->exitcode, vmcb->exit_int_info.raw);
+    printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
+           vmcb->exitinfo1, vmcb->exitinfo2);
+    printk("asid = %#x np_ctrl = %#"PRIx64":%s%s%s\n",
+           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
+           vmcb_get_np(vmcb)     ? " NP"     : "",
+           vmcb_get_sev(vmcb)    ? " SEV"    : "",
+           vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
+    printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
+           vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
+    printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
+           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->lstar);
+    printk("CR0 = 0x%016"PRIx64" CR2 = 0x%016"PRIx64"\n",
+           vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
+    printk("CR3 = 0x%016"PRIx64" CR4 = 0x%016"PRIx64"\n",
+           vmcb_get_cr3(vmcb), vmcb_get_cr4(vmcb));
+    printk("RSP = 0x%016"PRIx64"  RIP = 0x%016"PRIx64"\n",
+           vmcb->rsp, vmcb->rip);
+    printk("RAX = 0x%016"PRIx64"  RFLAGS=0x%016"PRIx64"\n",
+           vmcb->rax, vmcb->rflags);
+    printk("DR6 = 0x%016"PRIx64", DR7 = 0x%016"PRIx64"\n",
+           vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
+    printk("CSTAR = 0x%016"PRIx64" SFMask = 0x%016"PRIx64"\n",
+           vmcb->cstar, vmcb->sfmask);
+    printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
+           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
+    printk("SSP = 0x%016"PRIx64" S_CET = 0x%016"PRIx64" ISST = 0x%016"PRIx64"\n",
+           vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
+    printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
+           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
+
+    /* print out all the selectors */
+    printk("       sel attr  limit   base\n");
+    svm_dump_sel("  CS", &vmcb->cs);
+    svm_dump_sel("  DS", &vmcb->ds);
+    svm_dump_sel("  SS", &vmcb->ss);
+    svm_dump_sel("  ES", &vmcb->es);
+    svm_dump_sel("  FS", &vmcb->fs);
+    svm_dump_sel("  GS", &vmcb->gs);
+    svm_dump_sel("GDTR", &vmcb->gdtr);
+    svm_dump_sel("LDTR", &vmcb->ldtr);
+    svm_dump_sel("IDTR", &vmcb->idtr);
+    svm_dump_sel("  TR", &vmcb->tr);
+}
+
+bool svm_vmcb_isvalid(
+    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
+    bool verbose)
+{
+    bool ret = false; /* ok */
+    unsigned long cr0 = vmcb_get_cr0(vmcb);
+    unsigned long cr3 = vmcb_get_cr3(vmcb);
+    unsigned long cr4 = vmcb_get_cr4(vmcb);
+    unsigned long valid;
+    uint64_t efer = vmcb_get_efer(vmcb);
+
+#define PRINTF(fmt, args...) do { \
+    if ( !verbose ) return true; \
+    ret = true; \
+    printk(XENLOG_GUEST "%pv[%s]: " fmt, v, from, ## args); \
+} while (0)
+
+    if ( !(efer & EFER_SVME) )
+        PRINTF("EFER: SVME bit not set (%#"PRIx64")\n", efer);
+
+    if ( !(cr0 & X86_CR0_CD) && (cr0 & X86_CR0_NW) )
+        PRINTF("CR0: CD bit is zero and NW bit set (%#"PRIx64")\n", cr0);
+
+    if ( cr0 >> 32 )
+        PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
+
+    if ( (cr0 & X86_CR0_PG) &&
+         ((cr3 & 7) ||
+          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
+          ((efer & EFER_LMA) &&
+           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
+        PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
+
+    valid = hvm_cr4_guest_valid_bits(v->domain);
+    if ( cr4 & ~valid )
+        PRINTF("CR4: invalid value %#lx (valid %#lx, rejected %#lx)\n",
+               cr4, valid, cr4 & ~valid);
+
+    if ( vmcb_get_dr6(vmcb) >> 32 )
+        PRINTF("DR6: bits [63:32] are not zero (%#"PRIx64")\n",
+               vmcb_get_dr6(vmcb));
+
+    if ( vmcb_get_dr7(vmcb) >> 32 )
+        PRINTF("DR7: bits [63:32] are not zero (%#"PRIx64")\n",
+               vmcb_get_dr7(vmcb));
+
+    if ( efer & ~EFER_KNOWN_MASK )
+        PRINTF("EFER: unknown bits are not zero (%#"PRIx64")\n", efer);
+
+    if ( hvm_efer_valid(v, efer, -1) )
+        PRINTF("EFER: %s (%"PRIx64")\n", hvm_efer_valid(v, efer, -1), efer);
+
+    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) )
+    {
+        if ( !(cr4 & X86_CR4_PAE) )
+            PRINTF("EFER_LME and CR0.PG are both set and CR4.PAE is zero\n");
+        if ( !(cr0 & X86_CR0_PE) )
+            PRINTF("EFER_LME and CR0.PG are both set and CR0.PE is zero\n");
+    }
+
+    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) && (cr4 & X86_CR4_PAE) &&
+         vmcb->cs.l && vmcb->cs.db )
+        PRINTF("EFER_LME, CR0.PG, CR4.PAE, CS.L and CS.D are all non-zero\n");
+
+    if ( !(vmcb_get_general2_intercepts(vmcb) & GENERAL2_INTERCEPT_VMRUN) )
+        PRINTF("GENERAL2_INTERCEPT: VMRUN intercept bit is clear (%#"PRIx32")\n",
+               vmcb_get_general2_intercepts(vmcb));
+
+    if ( vmcb->event_inj.resvd1 )
+        PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
+               vmcb->event_inj.raw);
+
+#undef PRINTF
+    return ret;
+}
+
 static void cf_check vmcb_dump(unsigned char ch)
 {
     struct domain *d;
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 68012948a9e3..ba554a964487 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -553,6 +553,9 @@ int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
+void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
+bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
+                      const struct vcpu *v, bool verbose);
 
 /*
  * VMCB accessor functions.
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
index 2fb76ec24c76..ede13bd34048 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
@@ -12,8 +12,5 @@
 #include <asm/hvm/svm/vmcb.h>
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
-bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
-                      const struct vcpu *v, bool verbose);
 
 #endif /* __ASM_X86_HVM_SVM_SVMDEBUG_H__ */
-- 
2.39.5


