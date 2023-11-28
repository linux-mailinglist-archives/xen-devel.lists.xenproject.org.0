Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229D7FB636
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642853.1002608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ug3-0004Sb-4H; Tue, 28 Nov 2023 09:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642853.1002608; Tue, 28 Nov 2023 09:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ug3-0004Qx-1L; Tue, 28 Nov 2023 09:46:47 +0000
Received: by outflank-mailman (input) for mailman id 642853;
 Tue, 28 Nov 2023 09:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwP9=HJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r7ug2-0004Qr-27
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:46:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09298792-8dd3-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:46:42 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-21-6-128.retail.telecomitalia.it [79.21.6.128])
 by support.bugseng.com (Postfix) with ESMTPSA id D96444EE0737;
 Tue, 28 Nov 2023 10:46:42 +0100 (CET)
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
X-Inumbo-ID: 09298792-8dd3-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012 Rule 8.3
Date: Tue, 28 Nov 2023 10:46:34 +0100
Message-Id: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniform declaration and definition of guest_walk_tables() using
parameter name "pfec_walk":
this name highlights the connection with PFEC_* constants and it is
consistent with the use of the parameter within function body.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/guest_pt.h |  2 +-
 xen/arch/x86/mm/guest_walk.c        | 39 +++++++++++++++--------------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index bc312343cd..5edf687dce 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
 
 bool
 guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
-                  unsigned long va, walk_t *gw, uint32_t pfec,
+                  unsigned long va, walk_t *gw, uint32_t pfec_walk,
                   gfn_t top_gfn, mfn_t top_mfn, void *top_map);
 
 /* Pretty-print the contents of a guest-walk */
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index fe7393334f..20a19bd7e2 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -69,7 +69,7 @@ static bool set_ad_bits(guest_intpte_t *guest_p, guest_intpte_t *walk_p,
  */
 bool
 guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
-                  unsigned long va, walk_t *gw, uint32_t walk,
+                  unsigned long va, walk_t *gw, uint32_t pfec_walk,
                   gfn_t top_gfn, mfn_t top_mfn, void *top_map)
 {
     struct domain *d = v->domain;
@@ -100,16 +100,17 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
      * inputs to a guest walk, but a whole load of code currently passes in
      * other PFEC_ constants.
      */
-    walk &= (PFEC_implicit | PFEC_insn_fetch | PFEC_user_mode | PFEC_write_access);
+    pfec_walk &= (PFEC_implicit | PFEC_insn_fetch | PFEC_user_mode |
+                  PFEC_write_access);
 
     /* Only implicit supervisor data accesses exist. */
-    ASSERT(!(walk & PFEC_implicit) ||
-           !(walk & (PFEC_insn_fetch | PFEC_user_mode)));
+    ASSERT(!(pfec_walk & PFEC_implicit) ||
+           !(pfec_walk & (PFEC_insn_fetch | PFEC_user_mode)));
 
     perfc_incr(guest_walk);
     memset(gw, 0, sizeof(*gw));
     gw->va = va;
-    gw->pfec = walk & (PFEC_user_mode | PFEC_write_access);
+    gw->pfec = pfec_walk & (PFEC_user_mode | PFEC_write_access);
 
     /*
      * PFEC_insn_fetch is only reported if NX or SMEP are enabled.  Hardware
@@ -117,7 +118,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
      * rights.
      */
     if ( guest_nx_enabled(v) || guest_smep_enabled(v) )
-        gw->pfec |= (walk & PFEC_insn_fetch);
+        gw->pfec |= (pfec_walk & PFEC_insn_fetch);
 
 #if GUEST_PAGING_LEVELS >= 3 /* PAE or 64... */
 #if GUEST_PAGING_LEVELS >= 4 /* 64-bit only... */
@@ -399,7 +400,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
      * N.B. In the case that the walk ended with a superpage, the fabricated
      * gw->l1e contains the appropriate leaf pkey.
      */
-    if ( !(walk & PFEC_insn_fetch) &&
+    if ( !(pfec_walk & PFEC_insn_fetch) &&
          ((ar & _PAGE_USER) ? guest_pku_enabled(v)
                             : guest_pks_enabled(v)) )
     {
@@ -408,8 +409,8 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
         unsigned int pk_ar = (pkr >> (pkey * PKEY_WIDTH)) & (PKEY_AD | PKEY_WD);
 
         if ( (pk_ar & PKEY_AD) ||
-             ((walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
-              ((walk & PFEC_user_mode) || guest_wp_enabled(v))) )
+             ((pfec_walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
+              ((pfec_walk & PFEC_user_mode) || guest_wp_enabled(v))) )
         {
             gw->pfec |= PFEC_prot_key;
             goto out;
@@ -417,17 +418,17 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
     }
 #endif
 
-    if ( (walk & PFEC_insn_fetch) && (ar & _PAGE_NX_BIT) )
+    if ( (pfec_walk & PFEC_insn_fetch) && (ar & _PAGE_NX_BIT) )
         /* Requested an instruction fetch and found NX? Fail. */
         goto out;
 
-    if ( walk & PFEC_user_mode ) /* Requested a user acess. */
+    if ( pfec_walk & PFEC_user_mode ) /* Requested a user acess. */
     {
         if ( !(ar & _PAGE_USER) )
             /* Got a supervisor walk?  Unconditional fail. */
             goto out;
 
-        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) )
+        if ( (pfec_walk & PFEC_write_access) && !(ar & _PAGE_RW) )
             /* Requested a write and only got a read? Fail. */
             goto out;
     }
@@ -435,18 +436,18 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
     {
         if ( ar & _PAGE_USER ) /* Got a user walk. */
         {
-            if ( (walk & PFEC_insn_fetch) && guest_smep_enabled(v) )
+            if ( (pfec_walk & PFEC_insn_fetch) && guest_smep_enabled(v) )
                 /* User insn fetch and smep? Fail. */
                 goto out;
 
-            if ( !(walk & PFEC_insn_fetch) && guest_smap_enabled(v) &&
-                 ((walk & PFEC_implicit) ||
+            if ( !(pfec_walk & PFEC_insn_fetch) && guest_smap_enabled(v) &&
+                 ((pfec_walk & PFEC_implicit) ||
                   !(guest_cpu_user_regs()->eflags & X86_EFLAGS_AC)) )
                 /* User data access and smap? Fail. */
                 goto out;
         }
 
-        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) &&
+        if ( (pfec_walk & PFEC_write_access) && !(ar & _PAGE_RW) &&
              guest_wp_enabled(v) )
             /* Requested a write, got a read, and CR0.WP is set? Fail. */
             goto out;
@@ -468,7 +469,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
 
     case 1:
         if ( set_ad_bits(&l1p[guest_l1_table_offset(va)].l1, &gw->l1e.l1,
-                         (walk & PFEC_write_access)) )
+                         (pfec_walk & PFEC_write_access)) )
         {
             paging_mark_dirty(d, gw->l1mfn);
             hvmemul_write_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e));
@@ -476,7 +477,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
         /* Fallthrough */
     case 2:
         if ( set_ad_bits(&l2p[guest_l2_table_offset(va)].l2, &gw->l2e.l2,
-                         (walk & PFEC_write_access) && leaf_level == 2) )
+                         (pfec_walk & PFEC_write_access) && leaf_level == 2) )
         {
             paging_mark_dirty(d, gw->l2mfn);
             hvmemul_write_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e));
@@ -485,7 +486,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
 #if GUEST_PAGING_LEVELS == 4 /* 64-bit only... */
     case 3:
         if ( set_ad_bits(&l3p[guest_l3_table_offset(va)].l3, &gw->l3e.l3,
-                         (walk & PFEC_write_access) && leaf_level == 3) )
+                         (pfec_walk & PFEC_write_access) && leaf_level == 3) )
         {
             paging_mark_dirty(d, gw->l3mfn);
             hvmemul_write_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e));
-- 
2.34.1


