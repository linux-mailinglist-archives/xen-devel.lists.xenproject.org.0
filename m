Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2FA85A8D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947033.1344798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1h-00010x-Um; Fri, 11 Apr 2025 10:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947033.1344798; Fri, 11 Apr 2025 10:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1h-0000vu-Nq; Fri, 11 Apr 2025 10:54:25 +0000
Received: by outflank-mailman (input) for mailman id 947033;
 Fri, 11 Apr 2025 10:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1f-00006G-3A
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52ac9609-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:54:21 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so12259175e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:21 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f207cb88asm81987055e9.37.2025.04.11.03.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:19 -0700 (PDT)
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
X-Inumbo-ID: 52ac9609-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368860; x=1744973660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj85dH1SZWtTaTOVDhEbnrtTJVzaPhDihu61l9X/kIU=;
        b=lzJaCjuv7P1wOwO+BLmp31+4vb6tBHPDdxil2pVv46YowGmwFiWS77SlIMMMmfM02n
         TMzfH46mpvJoDXEjOoaN8SWLzJxK7GfAHvy80adfGzNjoWGzow5eLqtR/IJx8pOWxG4h
         6TSkR9Jb9iHqwfJZMypLxRY6P39btMZGc1pxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368860; x=1744973660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj85dH1SZWtTaTOVDhEbnrtTJVzaPhDihu61l9X/kIU=;
        b=jmMGN2Hh6E8Dx7JZgN8I4taWvohDPS/+SVNBdDLU4juQHWV/zmQqWaDgDW3I1JQzz+
         E4McdcUCjlaqSuwq0opb9t8MOmxHNzGPZ6gc0bg4P1UOwLrWrX3raAhW9Bf0QkFxTNQl
         0MONhoPBwYYXYBVU7sXbHpvAG84laDbq9kCj9Povw/uIAbLZ2soVo6efX+lj0wuKFzbs
         Xklcda08gLZovayCmzVxEVPPstl7zijGJX06pHQJxXuPStU7W+mZoHW1TybQq8VFnNM0
         515o9U320Q9aL2/ERTEb5ITL3EYdf/2OK1Q97A17o8hD1noT9YGhW8HaYapLDdy2dkbj
         EROw==
X-Gm-Message-State: AOJu0YyThPO6DWBnRbm/DD1pLmR052svUCoQnY57EDMpioX37I25hlUH
	2/uHKZlcIQ1EbDLT9KNFQ9boVU5JeRrZ4IsD+4Rjqff6UtU0fpyzgfvWHWDBCjCI2O0sNtORAaA
	X
X-Gm-Gg: ASbGncs6Tz1AVjhnJ9I8zzCLloI6QgIoI3aY7auah106hK2CFXfJEzuE1ZaB+dVI6wN
	qwh1oXqPZN9vvPsLw8f6SISqn3aPoZ7ZNCsFC1/nqVh75sdj2YPegjUMRVHMT5q0ym2OEKPNqKQ
	ILXNEMylzyqpIav1mo9mKTEXjEnT7SZlR79rD0Y4/5Ig3cWkJ4FfTOD2OG0taOidptKZ5qGL7Q7
	3DodIcHJYDObeeR/q6UllexFKogFfSr8YIBXIxtcKQbiNpPa5py9gM0Zalw1pHWcDLEOpK7lqab
	tjREA1P4zJgtDUPsl22uPRBorKpRLoKM2d/1V3C1mfxNew==
X-Google-Smtp-Source: AGHT+IEfHs7ikBhpkat3gYs4vuYPvNM6dYkC6mNFIpSJo4LfRBMWesSf/bFHKvs68232r+u3lYEpkQ==
X-Received: by 2002:a05:600c:1e0a:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43f3a9291d9mr14900975e9.5.1744368860164;
        Fri, 11 Apr 2025 03:54:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO pages
Date: Fri, 11 Apr 2025 12:54:09 +0200
Message-ID: <20250411105411.22334-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105411.22334-1-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
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

This allows getting rid of hvm_emulate_one_mmio() and it's single cal site
in hvm_hap_nested_page_fault().

Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
attempting to fixup faults resulting from accesses to read-only MMIO
regions, as handling of those accesses is now done by handle_mmio().

Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The fixes tag is maybe a bit wonky, it's either this or:

8847d6e23f97 ('x86/mm: add API for marking only part of a MMIO page read only')

However the addition of subpage r/o access handling to the existing
mmio_ro_emulated_write() function was done based on the assumption that the
current code was working - which turned out to not be the case for AMD,
hence my preference for blaming the commit that actually introduced the
broken logic.
---
 xen/arch/x86/hvm/emulate.c             | 47 +-------------
 xen/arch/x86/hvm/hvm.c                 | 89 +++++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/emulate.h |  1 -
 xen/arch/x86/include/asm/mm.h          | 12 ++++
 xen/arch/x86/mm.c                      | 37 +----------
 5 files changed, 96 insertions(+), 90 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 9fff1b82f7c6..ed888f0b49d3 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -370,7 +370,8 @@ static int hvmemul_do_io(
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
         {
-            if ( is_mmio && is_hardware_domain(currd) )
+            if ( is_mmio && is_hardware_domain(currd) &&
+                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )
             {
                 /*
                  * PVH dom0 is likely missing MMIO mappings on the p2m, due to
@@ -2856,50 +2857,6 @@ int hvm_emulate_one(
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
index 6f1174c5127e..21f005b0947c 100644
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
@@ -585,9 +585,81 @@ static int cf_check hvm_print_line(
     return X86EMUL_OKAY;
 }
 
+static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
+{
+    p2m_type_t t;
+    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);
+
+    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
+           !!subpage_mmio_find_page(mfn);
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
+        return X86EMUL_RETRY;
+    }
+
+    mem = subpage_mmio_map_page(entry);
+    if ( !mem )
+    {
+        put_gfn(d, addr);
+        gprintk(XENLOG_ERR, "Failed to map page for MMIO read at %#lx\n",
+                mfn_to_maddr(mfn) + PAGE_OFFSET(addr));
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
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config)
 {
+    static const struct hvm_mmio_ops subpage_mmio_ops = {
+        .check = subpage_mmio_accept,
+        .read = subpage_mmio_read,
+        .write = subpage_mmio_write,
+    };
     unsigned int nr_gsis;
     int rc;
 
@@ -692,6 +764,9 @@ int hvm_domain_initialise(struct domain *d,
 
     register_portio_handler(d, XEN_HVM_DEBUGCONS_IOPORT, 1, hvm_print_line);
 
+    /* Handler for r/o MMIO subpage accesses. */
+    register_mmio_handler(d, &subpage_mmio_ops);
+
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
 
@@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
      */
     if ( (p2mt == p2m_mmio_dm) ||
          (npfec.write_access &&
-          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
+          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
+           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
+           (p2mt == p2m_mmio_direct))) )
     {
         if ( !handle_mmio_with_translation(gla, gfn, npfec) )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
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


