Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619025DA7A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEC8o-00078O-1I; Fri, 04 Sep 2020 13:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kEC8n-00078C-4f
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:52:33 +0000
X-Inumbo-ID: dc6230d2-c2af-49a6-85a1-5c673f138ca2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc6230d2-c2af-49a6-85a1-5c673f138ca2;
 Fri, 04 Sep 2020 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599227550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXGl8T7FbRpMlnLgnV9MjJDZ1Irzb38AvTOcvVTCA0Y=;
 b=b+JArsVw93j/MYZYf7D1/PmOyR3/hjLE92E+ZpHnG7CMnweX5sHeFvec
 CyDL1Br1VtxmKsxy3Ofz3LIgSfXbJXjWxEZjUNMY5xZExvrEUeckcFZzi
 hUqq4GbTXRE4SQGsf31bKicLX2nyjiBHCsAd7F2tpT725F4u6yFNSMNGp 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VF6ynG/SGsIj8YkcHS7lG+M4WBTghYGQCCKuHKSqwy/AXTFN/7IhcFv2v/Wyo/W3soceskkizl
 Ec+lvqJoW68SFafdwMDN2ZIgdQjSWjAUH4lTDP7WdnvF6fks0wuo5SB548NPEAApN1wC/0f5uh
 QnxtjRnQcYhOsR6apdiDMy8tkHtam5XnXDB3l0LmfAk1xdvW31aubGinj+S7KcTJeSPwQC/25z
 KzX93s3Y4UyTO3vp6dMF23mm4hSMCuJBapy/55GQgKfblnUccsLxIJ1/aZq2B1BOjti/K8j2AN
 N00=
X-SBRS: 2.7
X-MesageID: 26308648
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26308648"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
Subject: [PATCH v2 2/2] x86/pv: Rewrite segment context switching from scratch
Date: Fri, 4 Sep 2020 14:52:09 +0100
Message-ID: <20200904135209.29226-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200904135209.29226-1-andrew.cooper3@citrix.com>
References: <20200904135209.29226-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are multiple bugs with the existing implementation.

On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
segment base, which is a problem for 64bit code which typically expects to use
a NUL %fs/%gs selector.

On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
selector which faults, the fixup logic loads NUL, and the guest is entered at
the failsafe callback with the stale base.

Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
with a stale base.

Both of these corner cases manifest as state corruption in the final vcpu.
However, damage is limited to to 64bit code expecting to use Thread Local
Storage with a base pointer of 0, which doesn't occur by default.

The context switch logic is extremely complicated, and is attempting to
optimise away loading a NUL selector (which is fast), or writing a 64bit base
of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
userspace, which manifests as userspace state corruption as far as Linux is
concerned.

Always restore all selector and base state, in all cases.

Leave a large comment explaining hardware behaviour, and the new ABI
expectations.  Update the comments in the public headers.

Drop all "segment preloading" to handle the AMD corner case.  It was never
anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
bases are unconditionally written for 64bit PV guests.  In load_segments(),
store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
and not used in a way which impacts speculative safety.

Reported-by: Andy Lutomirski <luto@kernel.org>
Reported-by: Sarah Newman <srn@prgmr.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
CC: Sarah Newman <srn@prgmr.com>

v2:
 * Some save_segments() content pulled out into an earlier patch.
 * Extra fix in arch_set_info_guest() due to the new ABI adjustments.
---
 xen/arch/x86/domain.c                    | 178 ++++++++++---------------------
 xen/include/public/arch-x86/xen-x86_64.h |   4 +-
 2 files changed, 60 insertions(+), 122 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f479bc6857..2a8538ed3f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1186,13 +1186,9 @@ int arch_set_info_guest(
     if ( !compat )
     {
         v->arch.pv.syscall_callback_eip = c.nat->syscall_callback_eip;
-        /* non-nul selector kills fs_base */
-        v->arch.pv.fs_base =
-            !(v->arch.user_regs.fs & ~3) ? c.nat->fs_base : 0;
+        v->arch.pv.fs_base = c.nat->fs_base;
         v->arch.pv.gs_base_kernel = c.nat->gs_base_kernel;
-        /* non-nul selector kills gs_base_user */
-        v->arch.pv.gs_base_user =
-            !(v->arch.user_regs.gs & ~3) ? c.nat->gs_base_user : 0;
+        v->arch.pv.gs_base_user = c.nat->gs_base_user;
     }
     else
     {
@@ -1508,58 +1504,60 @@ arch_do_vcpu_op(
 }
 
 /*
- * Loading a nul selector does not clear bases and limits on AMD or Hygon
- * CPUs. Be on the safe side and re-initialize both to flat segment values
- * before loading a nul selector.
- */
-#define preload_segment(seg, value) do {              \
-    if ( !((value) & ~3) &&                           \
-         (boot_cpu_data.x86_vendor &                  \
-          (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )      \
-        asm volatile ( "movl %k0, %%" #seg            \
-                       :: "r" (FLAT_USER_DS32) );     \
-} while ( false )
-
-#define loadsegment(seg,value) ({               \
-    int __r = 1;                                \
-    asm volatile (                              \
-        "1: movl %k1,%%" #seg "\n2:\n"          \
-        ".section .fixup,\"ax\"\n"              \
-        "3: xorl %k0,%k0\n"                     \
-        "   movl %k0,%%" #seg "\n"              \
-        "   jmp 2b\n"                           \
-        ".previous\n"                           \
-        _ASM_EXTABLE(1b, 3b)                    \
-        : "=r" (__r) : "r" (value), "0" (__r) );\
-    __r; })
-
-/*
- * save_segments() writes a mask of segments which are dirty (non-zero),
- * allowing load_segments() to avoid some expensive segment loads and
- * MSR writes.
+ * Notes on PV segment handling:
+ *  - 32bit: All data from the GDT/LDT.
+ *  - 64bit: In addition, 64bit FS/GS/GS_KERN bases.
+ *
+ * Linux's ABI with userspace expects to preserve the full selector and
+ * segment base, even sel != NUL, base != GDT/LDT for 64bit code.  Xen must
+ * honour this when context switching, to avoid breaking Linux's ABI.
+ *
+ * Note: It is impossible to preserve a selector value of 1, 2 or 3, as these
+ *       get reset to 0 by an IRET back to guest context.  Code playing with
+ *       arcane corners of x86 get to keep all resulting pieces.
+ *
+ * Therefore, we:
+ *  - Load the LDT.
+ *  - Load each segment selector.
+ *    - Any error loads zero, and triggers a failsafe callback.
+ *  - For 64bit, further load the 64bit bases.
+ *
+ * An optimisation exists on SVM-capable hardware, where we use a VMLOAD
+ * instruction to load the LDT and full FS/GS/GS_KERN data in one go.
+ *
+ * AMD-like CPUs prior to Zen2 do not zero the segment base or limit when
+ * loading a NUL selector.  This is a problem in principle when context
+ * switching to a 64bit guest, as a NUL FS/GS segment is usable and will pick
+ * up the stale base.
+ *
+ * However, it is not an issue in practice.  NUL segments are unusable for
+ * 32bit guests (so any stale base won't be used), and we unconditionally
+ * write the full FS/GS bases for 64bit guests.
  */
-static DEFINE_PER_CPU(unsigned int, dirty_segment_mask);
-#define DIRTY_DS           0x01
-#define DIRTY_ES           0x02
-#define DIRTY_FS           0x04
-#define DIRTY_GS           0x08
-#define DIRTY_FS_BASE      0x10
-#define DIRTY_GS_BASE      0x20
-
 static void load_segments(struct vcpu *n)
 {
     struct cpu_user_regs *uregs = &n->arch.user_regs;
-    int all_segs_okay = 1;
-    unsigned int dirty_segment_mask, cpu = smp_processor_id();
-    bool fs_gs_done = false;
+    bool compat = is_pv_32bit_vcpu(n);
+    bool all_segs_okay = true, fs_gs_done = false;
 
-    /* Load and clear the dirty segment mask. */
-    dirty_segment_mask = per_cpu(dirty_segment_mask, cpu);
-    per_cpu(dirty_segment_mask, cpu) = 0;
+    /*
+     * Attempt to load @seg with selector @val.  On error, clear
+     * @all_segs_okay in function scope, and load NUL into @sel.
+     */
+#define TRY_LOAD_SEG(seg, val)                          \
+    asm volatile ( "1: mov %k[_val], %%" #seg "\n\t"    \
+                   "2:\n\t"                             \
+                   ".section .fixup, \"ax\"\n\t"        \
+                   "3: xor %k[ok], %k[ok]\n\t"          \
+                   "   mov %k[ok], %%" #seg "\n\t"      \
+                   "   jmp 2b\n\t"                      \
+                   ".previous\n\t"                      \
+                   _ASM_EXTABLE(1b, 3b)                 \
+                   : [ok] "+r" (all_segs_okay)          \
+                   : [_val] "rm" (val) )
 
 #ifdef CONFIG_HVM
-    if ( cpu_has_svm && !is_pv_32bit_vcpu(n) &&
-         !(read_cr4() & X86_CR4_FSGSBASE) && !((uregs->fs | uregs->gs) & ~3) )
+    if ( cpu_has_svm && !compat )
     {
         unsigned long gsb = n->arch.flags & TF_kernel_mode
             ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
@@ -1572,45 +1570,19 @@ static void load_segments(struct vcpu *n)
     }
 #endif
     if ( !fs_gs_done )
-        load_LDT(n);
-
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_DS) | uregs->ds) )
-    {
-        preload_segment(ds, uregs->ds);
-        all_segs_okay &= loadsegment(ds, uregs->ds);
-    }
-
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_ES) | uregs->es) )
     {
-        preload_segment(es, uregs->es);
-        all_segs_okay &= loadsegment(es, uregs->es);
-    }
+        load_LDT(n);
 
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_FS) | uregs->fs) && !fs_gs_done )
-    {
-        all_segs_okay &= loadsegment(fs, uregs->fs);
-        /* non-nul selector updates fs_base */
-        if ( uregs->fs & ~3 )
-            dirty_segment_mask &= ~DIRTY_FS_BASE;
+        TRY_LOAD_SEG(fs, uregs->fs);
+        TRY_LOAD_SEG(gs, uregs->gs);
     }
 
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_GS) | uregs->gs) && !fs_gs_done )
-    {
-        all_segs_okay &= loadsegment(gs, uregs->gs);
-        /* non-nul selector updates gs_base_user */
-        if ( uregs->gs & ~3 )
-            dirty_segment_mask &= ~DIRTY_GS_BASE;
-    }
+    TRY_LOAD_SEG(ds, uregs->ds);
+    TRY_LOAD_SEG(es, uregs->es);
 
-    if ( !fs_gs_done && !is_pv_32bit_vcpu(n) )
+    if ( !fs_gs_done && !compat )
     {
-        /* This can only be non-zero if selector is NULL. */
-        if ( n->arch.pv.fs_base | (dirty_segment_mask & DIRTY_FS_BASE) )
-            wrfsbase(n->arch.pv.fs_base);
+        wrfsbase(n->arch.pv.fs_base);
 
         /*
          * Most kernels have non-zero GS base, so don't bother testing.
@@ -1618,11 +1590,7 @@ static void load_segments(struct vcpu *n)
          * avoiding erratum #88.)
          */
         wrgsshadow(n->arch.pv.gs_base_kernel);
-
-        /* This can only be non-zero if selector is NULL. */
-        if ( n->arch.pv.gs_base_user |
-             (dirty_segment_mask & DIRTY_GS_BASE) )
-            wrgsbase(n->arch.pv.gs_base_user);
+        wrgsbase(n->arch.pv.gs_base_user);
 
         /* If in kernel mode then switch the GS bases around. */
         if ( (n->arch.flags & TF_kernel_mode) )
@@ -1741,7 +1709,6 @@ static void load_segments(struct vcpu *n)
 static void save_segments(struct vcpu *v)
 {
     struct cpu_user_regs *regs = &v->arch.user_regs;
-    unsigned int dirty_segment_mask = 0;
 
     regs->ds = read_sreg(ds);
     regs->es = read_sreg(es);
@@ -1758,35 +1725,6 @@ static void save_segments(struct vcpu *v)
         else
             v->arch.pv.gs_base_user = gs_base;
     }
-
-    if ( regs->ds )
-        dirty_segment_mask |= DIRTY_DS;
-
-    if ( regs->es )
-        dirty_segment_mask |= DIRTY_ES;
-
-    if ( regs->fs || is_pv_32bit_vcpu(v) )
-    {
-        dirty_segment_mask |= DIRTY_FS;
-        /* non-nul selector kills fs_base */
-        if ( regs->fs & ~3 )
-            v->arch.pv.fs_base = 0;
-    }
-    if ( v->arch.pv.fs_base )
-        dirty_segment_mask |= DIRTY_FS_BASE;
-
-    if ( regs->gs || is_pv_32bit_vcpu(v) )
-    {
-        dirty_segment_mask |= DIRTY_GS;
-        /* non-nul selector kills gs_base_user */
-        if ( regs->gs & ~3 )
-            v->arch.pv.gs_base_user = 0;
-    }
-    if ( v->arch.flags & TF_kernel_mode ? v->arch.pv.gs_base_kernel
-                                        : v->arch.pv.gs_base_user )
-        dirty_segment_mask |= DIRTY_GS_BASE;
-
-    this_cpu(dirty_segment_mask) = dirty_segment_mask;
 }
 
 void paravirt_ctxt_switch_from(struct vcpu *v)
@@ -1996,7 +1934,7 @@ static void __context_switch(void)
 #if defined(CONFIG_PV) && defined(CONFIG_HVM)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( cpu_has_svm && is_pv_domain(nd) && !is_pv_32bit_domain(nd) &&
-         !is_idle_domain(nd) && !(read_cr4() & X86_CR4_FSGSBASE) )
+         !is_idle_domain(nd) )
         svm_load_segs(0, 0, 0, 0, 0, 0, 0);
 #endif
 
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 342eabc957..40aed14366 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -203,8 +203,8 @@ struct cpu_user_regs {
     uint16_t ss, _pad2[3];
     uint16_t es, _pad3[3];
     uint16_t ds, _pad4[3];
-    uint16_t fs, _pad5[3]; /* Non-nul => takes precedence over fs_base.      */
-    uint16_t gs, _pad6[3]; /* Non-nul => takes precedence over gs_base_user. */
+    uint16_t fs, _pad5[3];
+    uint16_t gs, _pad6[3];
 };
 typedef struct cpu_user_regs cpu_user_regs_t;
 DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
-- 
2.11.0


