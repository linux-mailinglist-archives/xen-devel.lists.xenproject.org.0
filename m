Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043D2A92DE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20548.46539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayB2-0001GG-Ie; Fri, 06 Nov 2020 09:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20548.46539; Fri, 06 Nov 2020 09:37:00 +0000
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
	id 1kayB2-0001Fp-Dh; Fri, 06 Nov 2020 09:37:00 +0000
Received: by outflank-mailman (input) for mailman id 20548;
 Fri, 06 Nov 2020 09:36:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayB0-0001FZ-Nd
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:36:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6de8ac3-bca3-40d6-b7a4-e9b86530642d;
 Fri, 06 Nov 2020 09:36:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A748ABB2;
 Fri,  6 Nov 2020 09:36:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayB0-0001FZ-Nd
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:36:58 +0000
X-Inumbo-ID: d6de8ac3-bca3-40d6-b7a4-e9b86530642d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6de8ac3-bca3-40d6-b7a4-e9b86530642d;
	Fri, 06 Nov 2020 09:36:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3NlXY+aD0HsOqqGXGoEXxkfCl7avEaD79QcpQmNwpw=;
	b=cJaf/k/s8d7kH+hOqmFgU3x6DByYJfcNSduE7hDEMP8Aa1xgcJ1slt9L+USK1peIGyRANB
	9H3kh9Whm0uolVwcW+05wI00sKv4dmLceyjGthu2PMuDnWZdt6JFDcQCCpiEQStlq8KfVm
	TvNzCKe2scNiDZi7IeOkZTXfMYP3QhE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3A748ABB2;
	Fri,  6 Nov 2020 09:36:56 +0000 (UTC)
Subject: [PATCH v2 5/9] x86/p2m: split write_p2m_entry() hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <80c83e61-b4f9-f8a8-7db1-351521e623f5@suse.com>
Date: Fri, 6 Nov 2020 10:36:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fair parts of the present handlers are identical; in fact
nestedp2m_write_p2m_entry() lacks a call to p2m_entry_modify(). Move
common parts right into write_p2m_entry(), splitting the hooks into a
"pre" one (needed just by shadow code) and a "post" one.

For the common parts moved I think that the p2m_flush_nestedp2m() is,
at least from an abstract perspective, also applicable in the shadow
case. Hence it doesn't get a 3rd hook put in place.

The initial comment that was in hap_write_p2m_entry() gets dropped: Its
placement was bogus, and looking back the the commit introducing it
(dd6de3ab9985 "Implement Nested-on-Nested") I can't see either what use
of a p2m it was meant to be associated with.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
RFC: This is effectively the alternative to the suggestion in an earlier
     patch that we might do away with the hook altogether. Of course a
     hybrid approach would also be possible, by using direct calls here
     instead of splitting the hook into two.
---
I'm unsure whether p2m_init_nestedp2m() zapping the "pre" hook is
actually correct, or whether previously the sh_unshadow_for_p2m_change()
invocation was wrongly skipped.

--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -774,55 +774,18 @@ static void hap_update_paging_modes(stru
     put_gfn(d, cr3_gfn);
 }
 
-static int
-hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
-                    l1_pgentry_t new, unsigned int level)
+static void
+hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
     struct domain *d = p2m->domain;
-    uint32_t old_flags;
-    mfn_t omfn;
-    int rc;
 
-    /* We know always use the host p2m here, regardless if the vcpu
-     * is in host or guest mode. The vcpu can be in guest mode by
-     * a hypercall which passes a domain and chooses mostly the first
-     * vcpu. */
-
-    paging_lock(d);
-    old_flags = l1e_get_flags(*p);
-    omfn = l1e_get_mfn(*p);
-
-    rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
-                          p2m_flags_to_type(old_flags), l1e_get_mfn(new),
-                          omfn, level);
-    if ( rc )
-    {
-        paging_unlock(d);
-        return rc;
-    }
-
-    safe_write_pte(p, new);
-    if ( old_flags & _PAGE_PRESENT )
+    if ( oflags & _PAGE_PRESENT )
         guest_flush_tlb_mask(d, d->dirty_cpumask);
-
-    paging_unlock(d);
-
-    if ( nestedhvm_enabled(d) && (old_flags & _PAGE_PRESENT) &&
-         !p2m_get_hostp2m(d)->defer_nested_flush &&
-         /*
-          * We are replacing a valid entry so we need to flush nested p2ms,
-          * unless the only change is an increase in access rights.
-          */
-         (!mfn_eq(omfn, l1e_get_mfn(new)) ||
-          !perms_strictly_increased(old_flags, l1e_get_flags(new))) )
-        p2m_flush_nestedp2m(d);
-
-    return 0;
 }
 
 void hap_p2m_init(struct p2m_domain *p2m)
 {
-    p2m->write_p2m_entry = hap_write_p2m_entry;
+    p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
 }
 
 static unsigned long hap_gva_to_gfn_real_mode(
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -71,24 +71,11 @@
 /*        NESTED VIRT P2M FUNCTIONS         */
 /********************************************/
 
-int
-nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-    l1_pgentry_t *p, l1_pgentry_t new, unsigned int level)
+void
+nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
-    struct domain *d = p2m->domain;
-    uint32_t old_flags;
-
-    paging_lock(d);
-
-    old_flags = l1e_get_flags(*p);
-    safe_write_pte(p, new);
-
-    if (old_flags & _PAGE_PRESENT)
-        guest_flush_tlb_mask(d, p2m->dirty_cpumask);
-
-    paging_unlock(d);
-
-    return 0;
+    if ( oflags & _PAGE_PRESENT )
+        guest_flush_tlb_mask(p2m->domain, p2m->dirty_cpumask);
 }
 
 /********************************************/
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
 {
     struct domain *d = p2m->domain;
     struct vcpu *v = current;
-    int rc = 0;
 
     if ( v->domain != d )
         v = d->vcpu ? d->vcpu[0] : NULL;
     if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
          p2m_is_nestedp2m(p2m) )
-        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
+    {
+        unsigned int oflags;
+        mfn_t omfn;
+        int rc;
+
+        paging_lock(d);
+
+        if ( p2m->write_p2m_entry_pre )
+            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
+
+        oflags = l1e_get_flags(*p);
+        omfn = l1e_get_mfn(*p);
+
+        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
+                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
+                              omfn, level);
+        if ( rc )
+        {
+            paging_unlock(d);
+            return rc;
+        }
+
+        safe_write_pte(p, new);
+
+        if ( p2m->write_p2m_entry_post )
+            p2m->write_p2m_entry_post(p2m, oflags);
+
+        paging_unlock(d);
+
+        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
+             (oflags & _PAGE_PRESENT) &&
+             !p2m_get_hostp2m(d)->defer_nested_flush &&
+             /*
+              * We are replacing a valid entry so we need to flush nested p2ms,
+              * unless the only change is an increase in access rights.
+              */
+             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
+              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
+            p2m_flush_nestedp2m(d);
+    }
     else
         safe_write_pte(p, new);
 
-    return rc;
+    return 0;
 }
 
 // Find the next level's P2M entry, checking for out-of-range gfn's...
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -198,7 +198,8 @@ static int p2m_init_nestedp2m(struct dom
             return -ENOMEM;
         }
         p2m->p2m_class = p2m_nested;
-        p2m->write_p2m_entry = nestedp2m_write_p2m_entry;
+        p2m->write_p2m_entry_pre = NULL;
+        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
         list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
     }
 
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3144,34 +3144,22 @@ static void sh_unshadow_for_p2m_change(s
     }
 }
 
-static int
-shadow_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-                       l1_pgentry_t *p, l1_pgentry_t new,
-                       unsigned int level)
+static void
+sh_write_p2m_entry_pre(struct domain *d, unsigned long gfn, l1_pgentry_t *p,
+                       l1_pgentry_t new, unsigned int level)
 {
-    struct domain *d = p2m->domain;
-    int rc;
-
-    paging_lock(d);
-
     /* If there are any shadows, update them.  But if shadow_teardown()
      * has already been called then it's not safe to try. */
     if ( likely(d->arch.paging.shadow.total_pages != 0) )
          sh_unshadow_for_p2m_change(d, gfn, p, new, level);
-
-    rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
-                          p2m_flags_to_type(l1e_get_flags(*p)),
-                          l1e_get_mfn(new), l1e_get_mfn(*p), level);
-    if ( rc )
-    {
-        paging_unlock(d);
-        return rc;
-    }
-
-    /* Update the entry with new content */
-    safe_write_pte(p, new);
+}
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
+static void
+sh_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
+{
+    struct domain *d = p2m->domain;
+
     /* If we're doing FAST_FAULT_PATH, then shadow mode may have
        cached the fact that this is an mmio region in the shadow
        page tables.  Blow the tables away to remove the cache.
@@ -3183,16 +3171,15 @@ shadow_write_p2m_entry(struct p2m_domain
         shadow_blow_tables(d);
         d->arch.paging.shadow.has_fast_mmio_entries = false;
     }
-#endif
-
-    paging_unlock(d);
-
-    return 0;
 }
+#else
+# define sh_write_p2m_entry_post NULL
+#endif
 
 void shadow_p2m_init(struct p2m_domain *p2m)
 {
-    p2m->write_p2m_entry = shadow_write_p2m_entry;
+    p2m->write_p2m_entry_pre  = sh_write_p2m_entry_pre;
+    p2m->write_p2m_entry_post = sh_write_p2m_entry_post;
 }
 
 /**************************************************************************/
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -272,10 +272,13 @@ struct p2m_domain {
                                                   unsigned long first_gfn,
                                                   unsigned long last_gfn);
     void               (*memory_type_changed)(struct p2m_domain *p2m);
-    
-    int                (*write_p2m_entry)(struct p2m_domain *p2m,
-                                          unsigned long gfn, l1_pgentry_t *p,
-                                          l1_pgentry_t new, unsigned int level);
+    void               (*write_p2m_entry_pre)(struct domain *d,
+                                              unsigned long gfn,
+                                              l1_pgentry_t *p,
+                                              l1_pgentry_t new,
+                                              unsigned int level);
+    void               (*write_p2m_entry_post)(struct p2m_domain *p2m,
+                                               unsigned int oflags);
 #if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
 #endif
@@ -472,7 +475,7 @@ void __put_gfn(struct p2m_domain *p2m, u
  *
  * This is also used in the shadow code whenever the paging lock is
  * held -- in those cases, the caller is protected against concurrent
- * p2m updates by the fact that shadow_write_p2m_entry() also takes
+ * p2m updates by the fact that write_p2m_entry() also takes
  * the paging lock.
  *
  * Note that an unlocked accessor only makes sense for a "query" lookup.
@@ -841,8 +844,8 @@ void np2m_flush_base(struct vcpu *v, uns
 void hap_p2m_init(struct p2m_domain *p2m);
 void shadow_p2m_init(struct p2m_domain *p2m);
 
-int nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-    l1_pgentry_t *p, l1_pgentry_t new, unsigned int level);
+void nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m,
+                                    unsigned int oflags);
 
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views


