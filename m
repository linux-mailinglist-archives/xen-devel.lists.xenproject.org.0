Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5036E4A5A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522135.811335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPHR-0002sG-O0; Mon, 17 Apr 2023 13:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522135.811335; Mon, 17 Apr 2023 13:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPHR-0002p8-KR; Mon, 17 Apr 2023 13:52:29 +0000
Received: by outflank-mailman (input) for mailman id 522135;
 Mon, 17 Apr 2023 13:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poPHP-0002mZ-Bp
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:52:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1447fd55-dd27-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 15:52:24 +0200 (CEST)
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
X-Inumbo-ID: 1447fd55-dd27-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A3p4keaS3hpXGhq0nkJV5Dw39H7+1lYcGAYPx6GvaNw=;
  b=P3v5v+O7maDkmxw/YhrfI655VIuxFj/d4jOuEJz6UNEWTJd59G4IL2J5
   7huyhCcdImFpOzWLhBI3Y9hqUDd1sNR8+Is2yhjpw0WL1/K7HDpt4NJpc
   NmcTzknPkSgiqQ7O7iacvIKF1fxIEQCxgb3KzWNdeavcZYvUzEb+FLDhA
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108251280
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pIYz56hQmo9dGi+6dY8h/IrUX161dxAKZh0ujC45NGQN5FlHY01je
 htvWTyEOvyJNGX9edpzbYvj80MCupaAy4JmS1RsqiFnEngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfGRUANkGau9nmzYKAc/hw3fx+AdTkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jKcoj2jUkly2Nq3iiOj0HjwrOP1oC74cYAdDI2y06Z4jwjGroAUIEJPDgbqyRWjsWa9XNRFI
 kBS5SsqroA17kWgStS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDRLoViNcvYOl+ttqyEuSEJA6SvXdYsDJ9S/Yx
 AGvoXBvnoko3cM77Jyq4Qv/3h+xqc2cJuIq3Tk7Tl5J/ysgOt78O9f5tAmHhRpTBN3HFwfc5
 RDoj+DbtblTVs/VyURhVc1XRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9B7cJZhNGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOjzmzzxB0zPxgY
 cvznSOQ4ZEyUP0P8dZLb71Fje9DKt4Wngs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0Z5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI8QDl7VKSJke14E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:/JsMH6AY3m9HI0rlHeln55DYdb4zR+YMi2TDtnoBLCC9F/byqy
 nAppgmPHPP5wr5IUtQ6OxoW5PwI080l6QU3WBLB8bHYOCOggLBRuxfBO3ZrQEIcBeOldK1u5
 0AT0F1MqyXMbBc5fyKmHjCYqxQveWvweSKoe/fynt3JDsaFJ2Ilz0JdjpyzCVNNXB77aJQLu
 vj2iPtnUvRRZ1SVLXdOkU4
X-Talos-CUID: 9a23:+vtEvmNnU2guV+5DXxhC+RZFA/weInDt907BPxSAVEt0R+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AXa+gxgxSxuxU3oJnx/ghCHuIRliaqOe3LmIHzb8?=
 =?us-ascii?q?KgfSJNgVyNC+thhHvUIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108251280"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2] x86/livepatch: Fix livepatch application when CET is active
Date: Mon, 17 Apr 2023 14:52:19 +0100
Message-ID: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, trying to apply a livepatch on any system with CET shstk (AMD Zen3
or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows:

  (XEN) livepatch: lp: Verifying enabled expectations for all functions
  (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns
  (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the other 127 CPUs
  (XEN) livepatch: lp: Applying 1 functions
  (XEN) hi_func: Hi! (called 1 times)
  (XEN) Hook executing.
  (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu))' failed at arch/x86/smp.c:265
  (XEN) *** DOUBLE FAULT ***
  <many double faults>

The assertion failure is from a global (system wide) TLB flush initiated by
modify_xen_mappings().  I'm not entirely sure when this broke, and I'm not
sure exactly what causes the #DF's, but it doesn't really matter either
because they highlight a latent bug that I'd overlooked with the CET-SS vs
patching work the first place.

While we're careful to arrange for the patching CPU to avoid encountering
non-shstk memory with transient shstk perms, other CPUs can pick these
mappings up too if they need to re-walk for uarch reasons.

Another bug is that for livepatching, we only disable CET if shadow stacks are
in use.  Running on Intel CET systems when Xen is only using CET-IBT will
crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CET
still active.

Also, we never went and cleared the dirty bits on .rodata.  This would
matter (for the same reason it matters on .text - it becomes a valid target
for WRSS), but we never actually patch .rodata anyway.

Therefore rework how we do patching for both alternatives and livepatches.

Introduce modify_xen_mappings_lite() with a purpose similar to
modify_xen_mappings(), but stripped down to the bare minimum as it's used in
weird contexts.  Leave all complexity to the caller to handle.

Instead of patching by clearing CR0.WP (and having to jump through some
fragile hoops to disable CET in order to do this), just transiently relax the
permissions on .text via l2_identmap[].

Note that neither alternatives nor livepatching edit .rodata, so we don't need
to relax those permissions at this juncture.

The perms are relaxed globally, but is safe enough.  Alternatives run before
we boot APs, and Livepatching runs in a quiesced state where the other CPUs
are not doing anything interesting.

This approach is far more robust.

Fixes: 48cdc15a424f ("x86/alternatives: Clear CR4.CET when clearing CR0.WP")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v2:
 * Add a fixes tag
 * Put modify_xen_mappings_lite() in init_or_livepatch
 * Fix various comments

Pulling put_pte_flags() out of the loops in modify_xen_mappings_lite() halves
the size of the function.  The code generation of the typesafe pagetable
helpers is terrible, both because of flags needing a 32->64 expand, and
because of _PAGE_NX using cpu_has_nx behind the scene.  We really should
improve how all of this works.
---
 xen/arch/x86/alternative.c       | 45 +++++++++------------
 xen/arch/x86/livepatch.c         | 56 +++++++++++---------------
 xen/arch/x86/mm.c                | 68 ++++++++++++++++++++++++++++++++
 xen/common/virtual_region.c      | 22 ++++++++---
 xen/include/xen/mm.h             |  1 +
 xen/include/xen/virtual_region.h |  4 +-
 6 files changed, 129 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 2383fa66294c..99482766b51f 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -382,24 +382,28 @@ static int __init cf_check nmi_apply_alternatives(
      */
     if ( !(alt_done & alt_todo) )
     {
-        unsigned long cr0, cr4;
-
-        cr0 = read_cr0();
-        cr4 = read_cr4();
-
-        if ( cr4 & X86_CR4_CET )
-            write_cr4(cr4 & ~X86_CR4_CET);
-
-        /* Disable WP to allow patching read-only pages. */
-        write_cr0(cr0 & ~X86_CR0_WP);
+        /*
+         * Relax perms on .text to be RWX, so we can modify them.
+         *
+         * This relaxes perms globally, but we run ahead of bringing APs
+         * online, so only have our own TLB to worry about.
+         */
+        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
+                                 (unsigned long)&__2M_text_end,
+                                 PAGE_HYPERVISOR_RWX);
+        flush_local(FLUSH_TLB_GLOBAL);
 
         _apply_alternatives(__alt_instructions, __alt_instructions_end,
                             alt_done);
 
-        write_cr0(cr0);
-
-        if ( cr4 & X86_CR4_CET )
-            write_cr4(cr4);
+        /*
+         * Reinstate perms on .text to be RX.  This also cleans out the dirty
+         * bits, which matters when CET Shstk is active.
+         */
+        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
+                                 (unsigned long)&__2M_text_end,
+                                 PAGE_HYPERVISOR_RX);
+        flush_local(FLUSH_TLB_GLOBAL);
 
         alt_done |= alt_todo;
     }
@@ -454,19 +458,6 @@ static void __init _alternative_instructions(bool force)
         panic("Timed out waiting for alternatives self-NMI to hit\n");
 
     set_nmi_callback(saved_nmi_callback);
-
-    /*
-     * When Xen is using shadow stacks, the alternatives clearing CR0.WP and
-     * writing into the mappings set dirty bits, turning the mappings into
-     * shadow stack mappings.
-     *
-     * While we can execute from them, this would also permit them to be the
-     * target of WRSS instructions, so reset the dirty after patching.
-     */
-    if ( cpu_has_xen_shstk )
-        modify_xen_mappings(XEN_VIRT_START + MB(2),
-                            (unsigned long)&__2M_text_end,
-                            PAGE_HYPERVISOR_RX);
 }
 
 void __init alternative_instructions(void)
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index f2d783fdc567..a54d991c5f0f 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -61,46 +61,32 @@ int arch_livepatch_safety_check(void)
 
 int noinline arch_livepatch_quiesce(void)
 {
-    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
-    if ( cpu_has_xen_shstk )
-        write_cr4(read_cr4() & ~X86_CR4_CET);
-
-    /* Disable WP to allow changes to read-only pages. */
-    write_cr0(read_cr0() & ~X86_CR0_WP);
+    /*
+     * Relax perms on .text to be RWX, so we can modify them.
+     *
+     * This relaxes perms globally, but all other CPUs are waiting on us.
+     */
+    relax_virtual_region_perms();
+    flush_local(FLUSH_TLB_GLOBAL);
 
     return 0;
 }
 
 void noinline arch_livepatch_revive(void)
 {
-    /* Reinstate WP. */
-    write_cr0(read_cr0() | X86_CR0_WP);
-
-    /* Clobber dirty bits and reinstate CET, if applicable. */
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
-    {
-        unsigned long tmp;
-
-        reset_virtual_region_perms();
-
-        write_cr4(read_cr4() | X86_CR4_CET);
-
-        /*
-         * Fix up the return address on the shadow stack, which currently
-         * points at arch_livepatch_quiesce()'s caller.
-         *
-         * Note: this is somewhat fragile, and depends on both
-         * arch_livepatch_{quiesce,revive}() being called from the same
-         * function, which is currently the case.
-         *
-         * Any error will result in Xen dying with #CP, and its too late to
-         * recover in any way.
-         */
-        asm volatile ("rdsspq %[ssp];"
-                      "wrssq %[addr], (%[ssp]);"
-                      : [ssp] "=&r" (tmp)
-                      : [addr] "r" (__builtin_return_address(0)));
-    }
+    /*
+     * Reinstate perms on .text to be RX.  This also cleans out the dirty
+     * bits, which matters when CET Shstk is active.
+     *
+     * The other CPUs waiting for us could in principle have re-walked while
+     * we were patching and cached the reduced perms in their TLB.  Therefore,
+     * we need to do a global TLB flush.
+     *
+     * However, we can't use Xen's normal global TLB flush infrastructure, so
+     * delay the TLB flush to arch_livepatch_post_action(), which is called on
+     * all CPUs (including us) on the way out of patching.
+     */
+    tighten_virtual_region_perms();
 }
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
@@ -197,6 +183,8 @@ void noinline arch_livepatch_revert(const struct livepatch_func *func)
  */
 void noinline arch_livepatch_post_action(void)
 {
+    /* See arch_livepatch_revive() */
+    flush_local(FLUSH_TLB_GLOBAL);
 }
 
 static nmi_callback_t *saved_nmi_callback;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 36a07ef77eae..46df495352e9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -91,6 +91,7 @@
 #include <xen/ioreq.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
+#include <xen/livepatch.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain.h>
@@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return modify_xen_mappings(s, e, _PAGE_NONE);
 }
 
+/*
+ * Similar to modify_xen_mappings(), but used by the alternatives and
+ * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
+ * responsibility of the caller, and *MUST* not be introduced here.
+ *
+ * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
+ * Must be called with present flags, and over present mappings.
+ * Must be called on leaf page boundaries.
+ */
+void init_or_livepatch modify_xen_mappings_lite(
+    unsigned long s, unsigned long e, unsigned int _nf)
+{
+    unsigned long v = s, fm, nf;
+
+    /* Set of valid PTE bits which may be altered. */
+#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
+    fm = put_pte_flags(FLAGS_MASK);
+    nf = put_pte_flags(_nf & FLAGS_MASK);
+#undef FLAGS_MASK
+
+    ASSERT(nf & _PAGE_PRESENT);
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
+
+    while ( v < e )
+    {
+        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
+        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
+        unsigned int l2f = l2e_get_flags(l2e);
+
+        ASSERT(l2f & _PAGE_PRESENT);
+
+        if ( l2e_get_flags(l2e) & _PAGE_PSE )
+        {
+            ASSERT(l1_table_offset(v) == 0);
+
+            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | nf));
+
+            v += 1UL << L2_PAGETABLE_SHIFT;
+            continue;
+        }
+
+        /* else descend to l1 */
+        {
+            l1_pgentry_t *pl1t = map_l1t_from_l2e(l2e);
+
+            while ( v < e )
+            {
+                l1_pgentry_t *pl1e = &pl1t[l1_table_offset(v)];
+                l1_pgentry_t l1e = l1e_read_atomic(pl1e);
+                unsigned int l1f = l1e_get_flags(l1e);
+
+                ASSERT(l1f & _PAGE_PRESENT);
+
+                l1e_write_atomic(pl1e, l1e_from_intpte((l1e.l1 & ~fm) | nf));
+
+                v += 1UL << L1_PAGETABLE_SHIFT;
+
+                if ( l2_table_offset(v) == 0 )
+                    break;
+            }
+
+            unmap_domain_page(pl1t);
+        }
+    }
+}
+
 void __set_fixmap(
     enum fixed_addresses idx, unsigned long mfn, unsigned long flags)
 {
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 5ecdba9c08ed..ddac5c9147e5 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -92,16 +92,28 @@ void unregister_virtual_region(struct virtual_region *r)
     remove_virtual_region(r);
 }
 
-#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_XEN_SHSTK)
-void reset_virtual_region_perms(void)
+#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
+void relax_virtual_region_perms(void)
 {
     const struct virtual_region *region;
 
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu( region, &virtual_region_list, list )
-        modify_xen_mappings((unsigned long)region->start,
-                            ROUNDUP((unsigned long)region->end, PAGE_SIZE),
-                            PAGE_HYPERVISOR_RX);
+        modify_xen_mappings_lite((unsigned long)region->start,
+                                 ROUNDUP((unsigned long)region->end, PAGE_SIZE),
+                                 PAGE_HYPERVISOR_RWX);
+    rcu_read_unlock(&rcu_virtual_region_lock);
+}
+
+void tighten_virtual_region_perms(void)
+{
+    const struct virtual_region *region;
+
+    rcu_read_lock(&rcu_virtual_region_lock);
+    list_for_each_entry_rcu( region, &virtual_region_list, list )
+        modify_xen_mappings_lite((unsigned long)region->start,
+                                 ROUNDUP((unsigned long)region->end, PAGE_SIZE),
+                                 PAGE_HYPERVISOR_RX);
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
 #endif
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9d14aed74baa..b0dc3ba9c98d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -100,6 +100,7 @@ int map_pages_to_xen(
     unsigned int flags);
 /* Alter the permissions of a range of Xen virtual address space. */
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags);
+void modify_xen_mappings_lite(unsigned long s, unsigned long e, unsigned int flags);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index ba408eb87a1a..d05362071135 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -33,7 +33,9 @@ void setup_virtual_regions(const struct exception_table_entry *start,
 void unregister_init_virtual_region(void);
 void register_virtual_region(struct virtual_region *r);
 void unregister_virtual_region(struct virtual_region *r);
-void reset_virtual_region_perms(void);
+
+void relax_virtual_region_perms(void);
+void tighten_virtual_region_perms(void);
 
 #endif /* __XEN_VIRTUAL_REGION_H__ */
 
-- 
2.30.2


