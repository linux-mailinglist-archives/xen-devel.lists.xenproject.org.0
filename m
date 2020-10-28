Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA829CF2E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13419.34038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXheh-0005Bh-J5; Wed, 28 Oct 2020 09:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13419.34038; Wed, 28 Oct 2020 09:22:07 +0000
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
	id 1kXheh-0005BI-Fe; Wed, 28 Oct 2020 09:22:07 +0000
Received: by outflank-mailman (input) for mailman id 13419;
 Wed, 28 Oct 2020 09:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXhef-0005BD-Qc
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:22:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c45dc1a0-7852-4b33-b0f6-489983d15d97;
 Wed, 28 Oct 2020 09:22:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC929AE55;
 Wed, 28 Oct 2020 09:22:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXhef-0005BD-Qc
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:22:05 +0000
X-Inumbo-ID: c45dc1a0-7852-4b33-b0f6-489983d15d97
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c45dc1a0-7852-4b33-b0f6-489983d15d97;
	Wed, 28 Oct 2020 09:22:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603876924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu6nsT1gjKKWROl7+xNzleE21oVo7PP0tppH9efwgOc=;
	b=q2y7pH7q4P+xg0XBXJX+RfzzUHGlmVIs65+CrckFJFVZukH7KW5gyhUwq/oK1GKLCYE6p7
	+hbU/347P9GfihhNXl3XUT/t9m4ULw0mpRUMao4GmKDnuaP2lNPRusTXJ1ba/r9a8o83PF
	lw6t+nBhpak8ZNmlxf8ZcefaTPOd93k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EC929AE55;
	Wed, 28 Oct 2020 09:22:03 +0000 (UTC)
Subject: [PATCH 1/5] x86/p2m: paging_write_p2m_entry() is a private function
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Message-ID: <1fab241b-3969-9ce5-2388-bcdbe3be6079@suse.com>
Date: Wed, 28 Oct 2020 10:22:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As it gets installed by p2m_pt_init(), it doesn't need to live in
paging.c. The function working in terms of l1_pgentry_t even further
indicates its non-paging-generic nature. Move it and drop its
paging_ prefix, not adding any new one now that it's static.

This then also makes more obvious that in the EPT case we wouldn't
risk mistakenly calling through the NULL hook pointer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -108,6 +108,31 @@ static unsigned long p2m_type_to_flags(c
     }
 }
 
+/*
+ * Atomically write a P2M entry and update the paging-assistance state
+ * appropriately.
+ * Arguments: the domain in question, the GFN whose mapping is being updated,
+ * a pointer to the entry to be written, the MFN in which the entry resides,
+ * the new contents of the entry, and the level in the p2m tree at which
+ * we are writing.
+ */
+static int write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
+                           l1_pgentry_t *p, l1_pgentry_t new,
+                           unsigned int level)
+{
+    struct domain *d = p2m->domain;
+    struct vcpu *v = current;
+    int rc = 0;
+
+    if ( v->domain != d )
+        v = d->vcpu ? d->vcpu[0] : NULL;
+    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) )
+        rc = paging_get_hostmode(v)->write_p2m_entry(p2m, gfn, p, new, level);
+    else
+        safe_write_pte(p, new);
+
+    return rc;
+}
 
 // Find the next level's P2M entry, checking for out-of-range gfn's...
 // Returns NULL on error.
@@ -594,7 +619,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
         entry_content.l1 = l3e_content.l3;
 
         rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 3);
-        /* NB: paging_write_p2m_entry() handles tlb flushes properly */
+        /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
     }
@@ -631,7 +656,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
 
         /* level 1 entry */
         rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 1);
-        /* NB: paging_write_p2m_entry() handles tlb flushes properly */
+        /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
     }
@@ -666,7 +691,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
         entry_content.l1 = l2e_content.l2;
 
         rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 2);
-        /* NB: paging_write_p2m_entry() handles tlb flushes properly */
+        /* NB: write_p2m_entry() handles tlb flushes properly */
         if ( rc )
             goto out;
     }
@@ -1107,7 +1132,7 @@ void p2m_pt_init(struct p2m_domain *p2m)
     p2m->recalc = do_recalc;
     p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
     p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
-    p2m->write_p2m_entry = paging_write_p2m_entry;
+    p2m->write_p2m_entry = write_p2m_entry;
 #if P2M_AUDIT
     p2m->audit_p2m = p2m_pt_audit_p2m;
 #else
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -941,27 +941,7 @@ void paging_update_nestedmode(struct vcp
         v->arch.paging.nestedmode = NULL;
     hvm_asid_flush_vcpu(v);
 }
-#endif
 
-int paging_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-                           l1_pgentry_t *p, l1_pgentry_t new,
-                           unsigned int level)
-{
-    struct domain *d = p2m->domain;
-    struct vcpu *v = current;
-    int rc = 0;
-
-    if ( v->domain != d )
-        v = d->vcpu ? d->vcpu[0] : NULL;
-    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v) != NULL) )
-        rc = paging_get_hostmode(v)->write_p2m_entry(p2m, gfn, p, new, level);
-    else
-        safe_write_pte(p, new);
-
-    return rc;
-}
-
-#ifdef CONFIG_HVM
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
                                  bool *preempted)
 {
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -371,18 +371,6 @@ static inline void safe_write_pte(l1_pge
     *p = new;
 }
 
-/* Atomically write a P2M entry and update the paging-assistance state 
- * appropriately. 
- * Arguments: the domain in question, the GFN whose mapping is being updated, 
- * a pointer to the entry to be written, the MFN in which the entry resides, 
- * the new contents of the entry, and the level in the p2m tree at which 
- * we are writing. */
-struct p2m_domain;
-
-int paging_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
-                           l1_pgentry_t *p, l1_pgentry_t new,
-                           unsigned int level);
-
 /*
  * Called from the guest to indicate that the a process is being
  * torn down and its pagetables will soon be discarded.


