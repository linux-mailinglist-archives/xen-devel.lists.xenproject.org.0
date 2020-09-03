Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8E25CC6E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 23:38:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDwub-0001G7-Pt; Thu, 03 Sep 2020 21:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKAy=CM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kDwua-0001G2-Kz
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 21:36:52 +0000
X-Inumbo-ID: 561dc6e0-a8e2-4ae1-9c2b-76052622f9f7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 561dc6e0-a8e2-4ae1-9c2b-76052622f9f7;
 Thu, 03 Sep 2020 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599169011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yXFKNDHMUIzX83PjAJ7G4723LcKb8Fu6fm+D73y045o=;
 b=e+ufSWkPCmNoX/km9tX7uyrrMezxidk6DyHuMc/1C2TIKB+g3goMaL9s
 PKMOZF4gStmrD/9pFZRGM1sQHRxWugPi4kd5+T46CEJNzjq9dcUoEbqxK
 HldhZFLRQi6f9qxvtHRGrLi53y2tH4u8r3jFC/ybbNi7om81Tf9ZgXdzx s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tMg4NZ9jNFO5uZ2XVByEUF8NpQCekCTiSjZBIA3rNuy6FhwSRo6cpn/28/oy+T0VWk6rKwus+W
 JyhkiRNU0XLr5p8riYPLa31wSP5Xmg4ohg1cfOrgxIFy57HTYGYiHTHQFN+YmDRzZlSkOsdlK8
 O65VkxEsg1jBXs+UsrRD/qhoNG0dKtR1YriPF699VJULvrG7o+AYAf8c+nxMbmI/n4zKiCTlUO
 AZ0eS7sxLaEVB52N7vARqA33TXw5T5jSAwZLCpNxt3ItxmZoRtHUoh2/89jIh6rmDsWcLrb9lD
 5aA=
X-SBRS: 2.7
X-MesageID: 25975516
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,387,1592884800"; d="scan'208";a="25975516"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
Subject: [PATCH] x86/pv: Rewrite segment context switching from scratch
Date: Thu, 3 Sep 2020 22:36:25 +0100
Message-ID: <20200903213625.5372-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

There are multiple bugs with the existing implementation, including incorrect
comments.

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

Always save and restore all selector and base state, in all cases.

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

The security team considered issuing an XSA for this, but ultimately concluded
that there is nothing a malicious entity could do to alter the likelyhood of
causing state corruption in the victim vCPU.

Sarah: I'm fairly sure your report from a while ago was an error I'd made in
save_segments() for XSA-293, about the conditions under which a base could
become stale.  My appologies for mis-diagnosing the cause of the bug, and
subsequently failing to fix it.

I've not done any perf testing on this.  It is after all a functional fix
first and foremost.  However, I'm pretty sure this will be faster, due to the
reduction in complexity attempting to optimise rare cases.  Overall delta is:

  add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-580 (-580)
  Function                                     old     new   delta
  per_cpu__dirty_segment_mask                    4       -      -4
  __context_switch                            1036    1007     -29
  context_switch                              3831    3630    -201
  paravirt_ctxt_switch_from                    598     252    -346
  Total: Before=3419372, After=3418792, chg -0.02%
---
 xen/arch/x86/domain.c                    | 191 ++++++++++++-------------------
 xen/include/public/arch-x86/xen-x86_64.h |   4 +-
 2 files changed, 74 insertions(+), 121 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 66975d5f2c..4f8e395eb2 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1508,58 +1508,60 @@ arch_do_vcpu_op(
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
@@ -1572,45 +1574,19 @@ static void load_segments(struct vcpu *n)
     }
 #endif
     if ( !fs_gs_done )
-        load_LDT(n);
-
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_DS) | uregs->ds) )
     {
-        preload_segment(ds, uregs->ds);
-        all_segs_okay &= loadsegment(ds, uregs->ds);
-    }
-
-    /* Either selector != 0 ==> reload. */
-    if ( unlikely((dirty_segment_mask & DIRTY_ES) | uregs->es) )
-    {
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
@@ -1618,11 +1594,7 @@ static void load_segments(struct vcpu *n)
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
@@ -1728,54 +1700,35 @@ static void load_segments(struct vcpu *n)
     }
 }
 
+/*
+ * Record all guest segment state.  The guest can load segment selectors
+ * without trapping, which will also alter the 64bit FS/GS bases.  Arbitrary
+ * changes to bases can also be made with the WR{FS,GS}BASE instructions, when
+ * enabled.
+ *
+ * Guests however cannot use SWAPGS, so there is no mechanism to modify the
+ * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
+ * GS base is still accurate, and doesn't need reading back from hardware.
+ */
 static void save_segments(struct vcpu *v)
 {
     struct cpu_user_regs *regs = &v->arch.user_regs;
-    unsigned int dirty_segment_mask = 0;
 
     regs->ds = read_sreg(ds);
     regs->es = read_sreg(es);
     regs->fs = read_sreg(fs);
     regs->gs = read_sreg(gs);
 
-    /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
-    if ( (read_cr4() & X86_CR4_FSGSBASE) && !is_pv_32bit_vcpu(v) )
+    if ( !is_pv_32bit_vcpu(v) )
     {
-        v->arch.pv.fs_base = __rdfsbase();
+        unsigned long gsbase = rdgsbase();
+
+        v->arch.pv.fs_base = rdfsbase();
         if ( v->arch.flags & TF_kernel_mode )
-            v->arch.pv.gs_base_kernel = __rdgsbase();
+            v->arch.pv.gs_base_kernel = gsbase;
         else
-            v->arch.pv.gs_base_user = __rdgsbase();
+            v->arch.pv.gs_base_user = gsbase;
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
@@ -1985,7 +1938,7 @@ static void __context_switch(void)
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


