Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93329CF30
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13423.34049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhfZ-0005Kh-UO; Wed, 28 Oct 2020 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13423.34049; Wed, 28 Oct 2020 09:23:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhfZ-0005KH-RG; Wed, 28 Oct 2020 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 13423;
 Wed, 28 Oct 2020 09:23:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXhfX-0005K5-V3
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:22:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 751d2f3c-6ebd-40cb-87eb-2a65ecf7f8db;
 Wed, 28 Oct 2020 09:22:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7F21AF2D;
 Wed, 28 Oct 2020 09:22:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXhfX-0005K5-V3
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:22:59 +0000
X-Inumbo-ID: 751d2f3c-6ebd-40cb-87eb-2a65ecf7f8db
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 751d2f3c-6ebd-40cb-87eb-2a65ecf7f8db;
	Wed, 28 Oct 2020 09:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603876977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCgW+bACNDPGH3cgrnwMxwZu4xm7gdBOFvqRHOsKIW4=;
	b=bJnA87lKFKTAaHIFeVGKAu6cHQ29VmLbF3rgVk1h6reUbJInqMPWBVEKkPKxc2HHGr4pih
	8UZyOR5Td/DsyFgGiIzAf3VH0RmLArqgLQHtF7tcxReUagI1IhdcdldHOMCYlYhwEznxBH
	B27B690Rej5Ulr5g/yXoHjOMh6Btu5c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D7F21AF2D;
	Wed, 28 Oct 2020 09:22:57 +0000 (UTC)
Subject: [PATCH 2/5] x86/p2m: collapse the two ->write_p2m_entry() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Message-ID: <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
Date: Wed, 28 Oct 2020 10:22:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The struct paging_mode instances get set to the same functions
regardless of mode by both HAP and shadow code, hence there's no point
having this hook there. The hook also doesn't need moving elsewhere - we
can directly use struct p2m_domain's. This merely requires (from a
strictly formal pov; in practice this may not even be needed) making
sure we don't end up using safe_write_pte() for nested P2Ms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Like for the possibly unnecessary p2m_is_nestedp2m() I'm not really sure
the paging_get_hostmode() check there is still needed either. But I
didn't want to alter more aspects than necessary here.

Of course with the p2m_is_nestedp2m() check there and with all three of
{hap,nestedp2m,shadow}_write_p2m_entry() now globally accessible, it's
certainly an option to do away with the indirect call there altogether.
In fact we may even be able to go further and fold the three functions:
They're relatively similar, and this would "seamlessly" address the
apparent bug of nestedp2m_write_p2m_entry() not making use of
p2m_entry_modify().

--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -823,6 +823,11 @@ hap_write_p2m_entry(struct p2m_domain *p
     return 0;
 }
 
+void hap_p2m_init(struct p2m_domain *p2m)
+{
+    p2m->write_p2m_entry = hap_write_p2m_entry;
+}
+
 static unsigned long hap_gva_to_gfn_real_mode(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec)
 {
@@ -846,7 +851,6 @@ static const struct paging_mode hap_pagi
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_real_mode,
     .update_cr3             = hap_update_cr3,
     .update_paging_modes    = hap_update_paging_modes,
-    .write_p2m_entry        = hap_write_p2m_entry,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 1
 };
@@ -858,7 +862,6 @@ static const struct paging_mode hap_pagi
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_2_levels,
     .update_cr3             = hap_update_cr3,
     .update_paging_modes    = hap_update_paging_modes,
-    .write_p2m_entry        = hap_write_p2m_entry,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 2
 };
@@ -870,7 +873,6 @@ static const struct paging_mode hap_pagi
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_3_levels,
     .update_cr3             = hap_update_cr3,
     .update_paging_modes    = hap_update_paging_modes,
-    .write_p2m_entry        = hap_write_p2m_entry,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 3
 };
@@ -882,7 +884,6 @@ static const struct paging_mode hap_pagi
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_4_levels,
     .update_cr3             = hap_update_cr3,
     .update_paging_modes    = hap_update_paging_modes,
-    .write_p2m_entry        = hap_write_p2m_entry,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 4
 };
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -126,8 +126,9 @@ static int write_p2m_entry(struct p2m_do
 
     if ( v->domain != d )
         v = d->vcpu ? d->vcpu[0] : NULL;
-    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) )
-        rc = paging_get_hostmode(v)->write_p2m_entry(p2m, gfn, p, new, level);
+    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
+         p2m_is_nestedp2m(p2m) )
+        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
     else
         safe_write_pte(p, new);
 
@@ -209,7 +210,7 @@ p2m_next_level(struct p2m_domain *p2m, v
 
         new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
 
-        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
+        rc = write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
         if ( rc )
             goto error;
     }
@@ -251,7 +252,7 @@ p2m_next_level(struct p2m_domain *p2m, v
         {
             new_entry = l1e_from_pfn(pfn | (i << ((level - 1) * PAGETABLE_ORDER)),
                                      flags);
-            rc = p2m->write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
+            rc = write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
             if ( rc )
             {
                 unmap_domain_page(l1_entry);
@@ -262,8 +263,7 @@ p2m_next_level(struct p2m_domain *p2m, v
         unmap_domain_page(l1_entry);
 
         new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
-        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry,
-                                  level + 1);
+        rc = write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
         if ( rc )
             goto error;
     }
@@ -335,7 +335,7 @@ static int p2m_pt_set_recalc_range(struc
             if ( (l1e_get_flags(e) & _PAGE_PRESENT) && !needs_recalc(l1, e) )
             {
                 set_recalc(l1, e);
-                err = p2m->write_p2m_entry(p2m, first_gfn, pent, e, level);
+                err = write_p2m_entry(p2m, first_gfn, pent, e, level);
                 if ( err )
                 {
                     ASSERT_UNREACHABLE();
@@ -412,8 +412,8 @@ static int do_recalc(struct p2m_domain *
                      !needs_recalc(l1, ent) )
                 {
                     set_recalc(l1, ent);
-                    err = p2m->write_p2m_entry(p2m, gfn - remainder, &ptab[i],
-                                               ent, level);
+                    err = write_p2m_entry(p2m, gfn - remainder, &ptab[i], ent,
+                                          level);
                     if ( err )
                     {
                         ASSERT_UNREACHABLE();
@@ -426,7 +426,7 @@ static int do_recalc(struct p2m_domain *
             if ( !err )
             {
                 clear_recalc(l1, e);
-                err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
+                err = write_p2m_entry(p2m, gfn, pent, e, level + 1);
                 ASSERT(!err);
 
                 recalc_done = true;
@@ -474,7 +474,7 @@ static int do_recalc(struct p2m_domain *
         }
         else
             clear_recalc(l1, e);
-        err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
+        err = write_p2m_entry(p2m, gfn, pent, e, level + 1);
         ASSERT(!err);
 
         recalc_done = true;
@@ -618,7 +618,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
             : l3e_empty();
         entry_content.l1 = l3e_content.l3;
 
-        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 3);
+        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 3);
         /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
@@ -655,7 +655,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
             entry_content = l1e_empty();
 
         /* level 1 entry */
-        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 1);
+        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 1);
         /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
@@ -690,7 +690,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
             : l2e_empty();
         entry_content.l1 = l2e_content.l2;
 
-        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 2);
+        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 2);
         /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
@@ -914,7 +914,7 @@ static void p2m_pt_change_entry_type_glo
             int rc;
 
             set_recalc(l1, e);
-            rc = p2m->write_p2m_entry(p2m, gfn, &tab[i], e, 4);
+            rc = write_p2m_entry(p2m, gfn, &tab[i], e, 4);
             if ( rc )
             {
                 ASSERT_UNREACHABLE();
@@ -1132,7 +1132,13 @@ void p2m_pt_init(struct p2m_domain *p2m)
     p2m->recalc = do_recalc;
     p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
     p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
-    p2m->write_p2m_entry = write_p2m_entry;
+
+    /* Still too early to use paging_mode_hap(). */
+    if ( hap_enabled(p2m->domain) )
+        hap_p2m_init(p2m);
+    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
+        shadow_p2m_init(p2m);
+
 #if P2M_AUDIT
     p2m->audit_p2m = p2m_pt_audit_p2m;
 #else
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3137,7 +3137,7 @@ static void sh_unshadow_for_p2m_change(s
     }
 }
 
-int
+static int
 shadow_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
                        l1_pgentry_t *p, l1_pgentry_t new,
                        unsigned int level)
@@ -3183,6 +3183,11 @@ shadow_write_p2m_entry(struct p2m_domain
     return 0;
 }
 
+void shadow_p2m_init(struct p2m_domain *p2m)
+{
+    p2m->write_p2m_entry = shadow_write_p2m_entry;
+}
+
 /**************************************************************************/
 /* Log-dirty mode support */
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4792,7 +4792,6 @@ const struct paging_mode sh_paging_mode
     .gva_to_gfn                    = sh_gva_to_gfn,
     .update_cr3                    = sh_update_cr3,
     .update_paging_modes           = shadow_update_paging_modes,
-    .write_p2m_entry               = shadow_write_p2m_entry,
     .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
     .shadow.detach_old_tables      = sh_detach_old_tables,
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -60,21 +60,12 @@ static void _update_paging_modes(struct
     ASSERT_UNREACHABLE();
 }
 
-static int _write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-                            l1_pgentry_t *p, l1_pgentry_t new,
-                            unsigned int level)
-{
-    ASSERT_UNREACHABLE();
-    return -EOPNOTSUPP;
-}
-
 static const struct paging_mode sh_paging_none = {
     .page_fault                    = _page_fault,
     .invlpg                        = _invlpg,
     .gva_to_gfn                    = _gva_to_gfn,
     .update_cr3                    = _update_cr3,
     .update_paging_modes           = _update_paging_modes,
-    .write_p2m_entry               = _write_p2m_entry,
 };
 
 void shadow_vcpu_init(struct vcpu *v)
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -390,11 +390,6 @@ static inline int sh_remove_write_access
 }
 #endif
 
-/* Functions that atomically write PT/P2M entries and update state */
-int shadow_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-                           l1_pgentry_t *p, l1_pgentry_t new,
-                           unsigned int level);
-
 /* Functions that atomically write PV guest PT entries */
 void sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new,
                           mfn_t gmfn);
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -836,6 +836,9 @@ void p2m_flush_nestedp2m(struct domain *
 /* Flushes the np2m specified by np2m_base (if it exists) */
 void np2m_flush_base(struct vcpu *v, unsigned long np2m_base);
 
+void hap_p2m_init(struct p2m_domain *p2m);
+void shadow_p2m_init(struct p2m_domain *p2m);
+
 int nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
     l1_pgentry_t *p, l1_pgentry_t new, unsigned int level);
 
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -141,10 +141,6 @@ struct paging_mode {
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
     void          (*update_paging_modes   )(struct vcpu *v);
-    int           (*write_p2m_entry       )(struct p2m_domain *p2m,
-                                            unsigned long gfn,
-                                            l1_pgentry_t *p, l1_pgentry_t new,
-                                            unsigned int level);
     bool          (*flush_tlb             )(bool (*flush_vcpu)(void *ctxt,
                                                                struct vcpu *v),
                                             void *ctxt);


