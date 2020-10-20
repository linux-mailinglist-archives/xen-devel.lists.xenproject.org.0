Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315A2923DD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8666.23207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQmU-0005m9-3n; Mon, 19 Oct 2020 08:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8666.23207; Mon, 19 Oct 2020 08:44:38 +0000
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
	id 1kUQmT-0005le-WC; Mon, 19 Oct 2020 08:44:38 +0000
Received: by outflank-mailman (input) for mailman id 8666;
 Mon, 19 Oct 2020 08:44:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUQmS-0005lV-Ga
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:44:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e516737-8928-4f4e-b14c-517189b4b996;
 Mon, 19 Oct 2020 08:44:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5601AC8C;
 Mon, 19 Oct 2020 08:44:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUQmS-0005lV-Ga
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:44:36 +0000
X-Inumbo-ID: 4e516737-8928-4f4e-b14c-517189b4b996
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4e516737-8928-4f4e-b14c-517189b4b996;
	Mon, 19 Oct 2020 08:44:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603097071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBtWaFEBZUGhu8aWD/XRiEveL+8Latdj2CST4lhLqjg=;
	b=DhVmTROQwDsSTzNNRaxfAbgh4UyMGjhWLp8CovLI77x1qbEZYK8KN5l+s65WcuJpvkfOjO
	OJnprwjMkedZOTfxU75qz5pfXBHi8TqvSy6kQBw9Rl1lZVfNYEijZgYnewow4izgUxPJZ0
	6dWQNY4ziuMw1BZ1wbZ0N3WEpF5XoGs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D5601AC8C;
	Mon, 19 Oct 2020 08:44:31 +0000 (UTC)
Subject: [PATCH v3 2/3] x86/shadow: refactor shadow_vram_{get,put}_l1e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Message-ID: <bc686036-18c0-ba7b-b8e5-a20b914aac68@suse.com>
Date: Mon, 19 Oct 2020 10:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By passing the functions an MFN and flags, only a single instance of
each is needed; they were pretty large for being inline functions
anyway.

While moving the code, also adjust coding style and add const where
sensible / possible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -903,6 +903,104 @@ int shadow_track_dirty_vram(struct domai
     return rc;
 }
 
+void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
+                         mfn_t sl1mfn, const void *sl1e,
+                         const struct domain *d)
+{
+    unsigned long gfn;
+    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+
+    ASSERT(is_hvm_domain(d));
+
+    if ( !dirty_vram /* tracking disabled? */ ||
+         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
+         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
+        return;
+
+    gfn = gfn_x(mfn_to_gfn(d, mfn));
+    /* Page sharing not supported on shadow PTs */
+    BUG_ON(SHARED_M2P(gfn));
+
+    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
+    {
+        unsigned long i = gfn - dirty_vram->begin_pfn;
+        const struct page_info *page = mfn_to_page(mfn);
+
+        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
+            /* Initial guest reference, record it */
+            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn) |
+                                   PAGE_OFFSET(sl1e);
+    }
+}
+
+void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
+                         mfn_t sl1mfn, const void *sl1e,
+                         const struct domain *d)
+{
+    unsigned long gfn;
+    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+
+    ASSERT(is_hvm_domain(d));
+
+    if ( !dirty_vram /* tracking disabled? */ ||
+         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
+         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
+        return;
+
+    gfn = gfn_x(mfn_to_gfn(d, mfn));
+    /* Page sharing not supported on shadow PTs */
+    BUG_ON(SHARED_M2P(gfn));
+
+    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
+    {
+        unsigned long i = gfn - dirty_vram->begin_pfn;
+        const struct page_info *page = mfn_to_page(mfn);
+        bool dirty = false;
+        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
+
+        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
+        {
+            /* Last reference */
+            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
+            {
+                /* We didn't know it was that one, let's say it is dirty */
+                dirty = true;
+            }
+            else
+            {
+                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
+                dirty_vram->sl1ma[i] = INVALID_PADDR;
+                if ( l1f & _PAGE_DIRTY )
+                    dirty = true;
+            }
+        }
+        else
+        {
+            /* We had more than one reference, just consider the page dirty. */
+            dirty = true;
+            /* Check that it's not the one we recorded. */
+            if ( dirty_vram->sl1ma[i] == sl1ma )
+            {
+                /* Too bad, we remembered the wrong one... */
+                dirty_vram->sl1ma[i] = INVALID_PADDR;
+            }
+            else
+            {
+                /*
+                 * Ok, our recorded sl1e is still pointing to this page, let's
+                 * just hope it will remain.
+                 */
+            }
+        }
+
+        if ( dirty )
+        {
+            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
+            dirty_vram->last_dirty = NOW();
+        }
+    }
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1047,107 +1047,6 @@ static int shadow_set_l2e(struct domain
     return flags;
 }
 
-static inline void shadow_vram_get_l1e(shadow_l1e_t new_sl1e,
-                                       shadow_l1e_t *sl1e,
-                                       mfn_t sl1mfn,
-                                       struct domain *d)
-{
-#ifdef CONFIG_HVM
-    mfn_t mfn = shadow_l1e_get_mfn(new_sl1e);
-    int flags = shadow_l1e_get_flags(new_sl1e);
-    unsigned long gfn;
-    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
-
-    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
-         || !(flags & _PAGE_RW) /* read-only mapping? */
-         || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
-        return;
-
-    gfn = gfn_x(mfn_to_gfn(d, mfn));
-    /* Page sharing not supported on shadow PTs */
-    BUG_ON(SHARED_M2P(gfn));
-
-    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
-    {
-        unsigned long i = gfn - dirty_vram->begin_pfn;
-        struct page_info *page = mfn_to_page(mfn);
-
-        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
-            /* Initial guest reference, record it */
-            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn)
-                | ((unsigned long)sl1e & ~PAGE_MASK);
-    }
-#endif
-}
-
-static inline void shadow_vram_put_l1e(shadow_l1e_t old_sl1e,
-                                       shadow_l1e_t *sl1e,
-                                       mfn_t sl1mfn,
-                                       struct domain *d)
-{
-#ifdef CONFIG_HVM
-    mfn_t mfn = shadow_l1e_get_mfn(old_sl1e);
-    int flags = shadow_l1e_get_flags(old_sl1e);
-    unsigned long gfn;
-    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
-
-    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
-         || !(flags & _PAGE_RW) /* read-only mapping? */
-         || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
-        return;
-
-    gfn = gfn_x(mfn_to_gfn(d, mfn));
-    /* Page sharing not supported on shadow PTs */
-    BUG_ON(SHARED_M2P(gfn));
-
-    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
-    {
-        unsigned long i = gfn - dirty_vram->begin_pfn;
-        struct page_info *page = mfn_to_page(mfn);
-        int dirty = 0;
-        paddr_t sl1ma = mfn_to_maddr(sl1mfn)
-            | ((unsigned long)sl1e & ~PAGE_MASK);
-
-        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
-        {
-            /* Last reference */
-            if ( dirty_vram->sl1ma[i] == INVALID_PADDR ) {
-                /* We didn't know it was that one, let's say it is dirty */
-                dirty = 1;
-            }
-            else
-            {
-                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
-                dirty_vram->sl1ma[i] = INVALID_PADDR;
-                if ( flags & _PAGE_DIRTY )
-                    dirty = 1;
-            }
-        }
-        else
-        {
-            /* We had more than one reference, just consider the page dirty. */
-            dirty = 1;
-            /* Check that it's not the one we recorded. */
-            if ( dirty_vram->sl1ma[i] == sl1ma )
-            {
-                /* Too bad, we remembered the wrong one... */
-                dirty_vram->sl1ma[i] = INVALID_PADDR;
-            }
-            else
-            {
-                /* Ok, our recorded sl1e is still pointing to this page, let's
-                 * just hope it will remain. */
-            }
-        }
-        if ( dirty )
-        {
-            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
-            dirty_vram->last_dirty = NOW();
-        }
-    }
-#endif
-}
-
 static int shadow_set_l1e(struct domain *d,
                           shadow_l1e_t *sl1e,
                           shadow_l1e_t new_sl1e,
@@ -1156,6 +1055,7 @@ static int shadow_set_l1e(struct domain
 {
     int flags = 0;
     shadow_l1e_t old_sl1e;
+    unsigned int old_sl1f;
 #if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
     mfn_t new_gmfn = shadow_l1e_get_mfn(new_sl1e);
 #endif
@@ -1194,7 +1094,9 @@ static int shadow_set_l1e(struct domain
                 new_sl1e = shadow_l1e_flip_flags(new_sl1e, rc);
                 /* fall through */
             case 0:
-                shadow_vram_get_l1e(new_sl1e, sl1e, sl1mfn, d);
+                shadow_vram_get_mfn(shadow_l1e_get_mfn(new_sl1e),
+                                    shadow_l1e_get_flags(new_sl1e),
+                                    sl1mfn, sl1e, d);
                 break;
             }
 #undef PAGE_FLIPPABLE
@@ -1205,20 +1107,19 @@ static int shadow_set_l1e(struct domain
     shadow_write_entries(sl1e, &new_sl1e, 1, sl1mfn);
     flags |= SHADOW_SET_CHANGED;
 
-    if ( (shadow_l1e_get_flags(old_sl1e) & _PAGE_PRESENT)
-         && !sh_l1e_is_magic(old_sl1e) )
+    old_sl1f = shadow_l1e_get_flags(old_sl1e);
+    if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
+         shadow_mode_refcounts(d) )
     {
         /* We lost a reference to an old mfn. */
         /* N.B. Unlike higher-level sets, never need an extra flush
          * when writing an l1e.  Because it points to the same guest frame
          * as the guest l1e did, it's the guest's responsibility to
          * trigger a flush later. */
-        if ( shadow_mode_refcounts(d) )
-        {
-            shadow_vram_put_l1e(old_sl1e, sl1e, sl1mfn, d);
-            shadow_put_page_from_l1e(old_sl1e, d);
-            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_PUT_REF);
-        }
+        shadow_vram_put_mfn(shadow_l1e_get_mfn(old_sl1e), old_sl1f,
+                            sl1mfn, sl1e, d);
+        shadow_put_page_from_l1e(old_sl1e, d);
+        TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_PUT_REF);
     }
     return flags;
 }
@@ -1944,9 +1845,12 @@ void sh_destroy_l1_shadow(struct domain
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
         SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, 0, {
-            if ( (shadow_l1e_get_flags(*sl1e) & _PAGE_PRESENT)
-                 && !sh_l1e_is_magic(*sl1e) ) {
-                shadow_vram_put_l1e(*sl1e, sl1e, sl1mfn, d);
+            unsigned int sl1f = shadow_l1e_get_flags(*sl1e);
+
+            if ( (sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(*sl1e) )
+            {
+                shadow_vram_put_mfn(shadow_l1e_get_mfn(*sl1e), sl1f,
+                                    sl1mfn, sl1e, d);
                 shadow_put_page_from_l1e(*sl1e, d);
             }
         });
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -410,6 +410,14 @@ void shadow_update_paging_modes(struct v
  * With user_only == 1, unhooks only the user-mode mappings. */
 void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);
 
+/* VRAM dirty tracking helpers. */
+void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
+                         mfn_t sl1mfn, const void *sl1e,
+                         const struct domain *d);
+void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
+                         mfn_t sl1mfn, const void *sl1e,
+                         const struct domain *d);
+
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
 /* Allow a shadowed page to go out of sync */
 int sh_unsync(struct vcpu *v, mfn_t gmfn);


