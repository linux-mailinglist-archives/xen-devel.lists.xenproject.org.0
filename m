Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5D35C85B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109183.208384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxEu-0004xm-Nb; Mon, 12 Apr 2021 14:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109183.208384; Mon, 12 Apr 2021 14:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxEu-0004xL-I4; Mon, 12 Apr 2021 14:08:32 +0000
Received: by outflank-mailman (input) for mailman id 109183;
 Mon, 12 Apr 2021 14:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxEt-0004xB-Gt
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:08:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e88388e-dfcc-4294-b7da-687fb1edbe64;
 Mon, 12 Apr 2021 14:08:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3D3EAF9E;
 Mon, 12 Apr 2021 14:08:29 +0000 (UTC)
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
X-Inumbo-ID: 4e88388e-dfcc-4294-b7da-687fb1edbe64
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KpoNaBMCbO0fmRRrVeB3gVS03fXDEugPkClPlqCtAg=;
	b=bJe3w45OELSouUI+EWLG+hkkmhlLwNESyZhNCbUgDe/pyKn4ZVjRWaNrabcmz2APCmMnWY
	M9x//jc3vD8UYt0qBdANB+J5G4MQx1WgVwIQoUFqEt21JoHV1X3ZFULV2BwNmTgESYlHlg
	iPTB2FNNvscGD8F6QPH1GOI6su9g3uU=
Subject: [PATCH v2 05/12] x86/p2m: change_entry_type_* hooks are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <8f6e2834-fbc1-4f3b-c305-71bb20b04502@suse.com>
Date: Mon, 12 Apr 2021 16:08:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Exclude functions using them from !HVM builds, thus making it possible
to exclude the hooks as well. Also cover the already unused
memory_type_changed hook while inserting the #ifdef in the struct.

While no respective check was there, I can't see how
XEN_DOMCTL_set_broken_page_p2m could have been meant to work for PV the
way it is implemented. Restrict this operation to acting on HVM guests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1080,9 +1080,12 @@ long arch_do_domctl(
     {
         p2m_type_t pt;
         unsigned long pfn = domctl->u.set_broken_page_p2m.pfn;
-        mfn_t mfn = get_gfn_query(d, pfn, &pt);
 
-        if ( unlikely(!mfn_valid(mfn)) || unlikely(!p2m_is_ram(pt)) )
+        if ( !is_hvm_domain(d) )
+            return -EINVAL;
+
+        if ( unlikely(!mfn_valid(get_gfn_query(d, pfn, &pt))) ||
+             unlikely(!p2m_is_ram(pt)) )
             ret = -EINVAL;
         else
             ret = p2m_change_type_one(d, pfn, pt, p2m_ram_broken);
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -292,6 +292,8 @@ int p2m_is_logdirty_range(struct p2m_dom
     return 0;
 }
 
+#ifdef CONFIG_HVM
+
 static void change_entry_type_global(struct p2m_domain *p2m,
                                      p2m_type_t ot, p2m_type_t nt)
 {
@@ -316,7 +318,6 @@ void p2m_change_entry_type_global(struct
 
     change_entry_type_global(hostp2m, ot, nt);
 
-#ifdef CONFIG_HVM
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -331,12 +332,10 @@ void p2m_change_entry_type_global(struct
                 p2m_unlock(altp2m);
             }
     }
-#endif
 
     p2m_unlock(hostp2m);
 }
 
-#ifdef CONFIG_HVM
 /* There's already a memory_type_changed() in asm/mtrr.h. */
 static void _memory_type_changed(struct p2m_domain *p2m)
 {
@@ -369,7 +368,8 @@ void p2m_memory_type_changed(struct doma
 
     p2m_unlock(hostp2m);
 }
-#endif
+
+#endif /* CONFIG_HVM */
 
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
@@ -876,6 +876,7 @@ guest_physmap_add_page(struct domain *d,
 }
 
 #ifdef CONFIG_HVM
+
 int
 guest_physmap_add_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
                         unsigned int page_order, p2m_type_t t)
@@ -1024,7 +1025,6 @@ out:
 
     return rc;
 }
-#endif
 
 /*
  * Modify the p2m type of a single gfn from ot to nt.
@@ -1161,7 +1161,6 @@ void p2m_change_type_range(struct domain
 
     change_type_range(hostp2m, start, end, ot, nt);
 
-#ifdef CONFIG_HVM
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -1176,7 +1175,6 @@ void p2m_change_type_range(struct domain
                 p2m_unlock(altp2m);
             }
     }
-#endif
     hostp2m->defer_nested_flush = 0;
     if ( nestedhvm_enabled(d) )
         p2m_flush_nestedp2m(d);
@@ -1184,6 +1182,8 @@ void p2m_change_type_range(struct domain
     p2m_unlock(hostp2m);
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * Finish p2m type change for gfns which are marked as need_recalc in a range.
  * Uses the current p2m's max_mapped_pfn to further clip the invalidation
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -324,6 +324,7 @@ p2m_next_level(struct p2m_domain *p2m, v
     return rc;
 }
 
+#ifdef CONFIG_HVM
 /*
  * Mark (via clearing the U flag) as needing P2M type re-calculation all valid
  * present entries at the targeted level for the passed in GFN range, which is
@@ -392,6 +393,7 @@ static int p2m_pt_set_recalc_range(struc
 
     return err;
 }
+#endif /* CONFIG_HVM */
 
 /*
  * Handle possibly necessary P2M type re-calculation (U flag clear for a
@@ -930,6 +932,8 @@ pod_retry_l1:
     return (p2m_is_valid(*t) || p2m_is_any_ram(*t)) ? mfn : INVALID_MFN;
 }
 
+#ifdef CONFIG_HVM
+
 static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
                                             p2m_type_t ot, p2m_type_t nt)
 {
@@ -1011,6 +1015,8 @@ static int p2m_pt_change_entry_type_rang
     return err;
 }
 
+#endif /* CONFIG_HVM */
+
 #if P2M_AUDIT
 static long p2m_pt_audit_p2m(struct p2m_domain *p2m)
 {
@@ -1168,8 +1174,10 @@ void p2m_pt_init(struct p2m_domain *p2m)
     p2m->set_entry = p2m_pt_set_entry;
     p2m->get_entry = p2m_pt_get_entry;
     p2m->recalc = do_recalc;
+#ifdef CONFIG_HVM
     p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
     p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
+#endif
 
     /* Still too early to use paging_mode_hap(). */
     if ( hap_enabled(p2m->domain) )
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -588,6 +588,7 @@ static int paging_log_dirty_op(struct do
     return rv;
 }
 
+#ifdef CONFIG_HVM
 void paging_log_dirty_range(struct domain *d,
                            unsigned long begin_pfn,
                            unsigned long nr,
@@ -617,6 +618,7 @@ void paging_log_dirty_range(struct domai
 
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
+#endif
 
 /*
  * Callers must supply log_dirty_ops for the log dirty code to call. This
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -264,6 +264,7 @@ struct p2m_domain {
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*disable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*flush_hardware_cached_dirty)(struct p2m_domain *p2m);
+#ifdef CONFIG_HVM
     void               (*change_entry_type_global)(struct p2m_domain *p2m,
                                                    p2m_type_t ot,
                                                    p2m_type_t nt);
@@ -272,6 +273,7 @@ struct p2m_domain {
                                                   unsigned long first_gfn,
                                                   unsigned long last_gfn);
     void               (*memory_type_changed)(struct p2m_domain *p2m);
+#endif
     void               (*write_p2m_entry_pre)(struct domain *d,
                                               unsigned long gfn,
                                               l1_pgentry_t old,


