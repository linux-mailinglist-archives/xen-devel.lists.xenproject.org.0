Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D22220954
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:58:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveAz-0004US-6W; Wed, 15 Jul 2020 09:58:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveAx-0004UK-RK
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:58:07 +0000
X-Inumbo-ID: accbd924-c681-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id accbd924-c681-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 09:58:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7CA8AF8A;
 Wed, 15 Jul 2020 09:58:06 +0000 (UTC)
Subject: [PATCH 1/5] x86/shadow: dirty VRAM tracking is needed for HVM only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Message-ID: <a77ac11b-a198-491d-1819-13ba75f72cd8@suse.com>
Date: Wed, 15 Jul 2020 11:58:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move shadow_track_dirty_vram() into hvm.c (requiring two static
functions to become non-static). More importantly though make sure we
don't de-reference d->arch.hvm.dirty_vram for a non-HVM guest. This was
a latent issue only just because the field lives far enough into struct
hvm_domain to be outside the part overlapping with struct pv_domain.

While moving shadow_track_dirty_vram() some purely typographic
adjustments are being made, like inserting missing blanks or putting
breaces on their own lines.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -999,7 +999,7 @@ void shadow_prealloc(struct domain *d, u
 
 /* Deliberately free all the memory we can: this will tear down all of
  * this domain's shadows */
-static void shadow_blow_tables(struct domain *d)
+void shadow_blow_tables(struct domain *d)
 {
     struct page_info *sp, *t;
     struct vcpu *v;
@@ -2029,7 +2029,7 @@ int sh_remove_write_access(struct domain
 /* Remove all mappings of a guest frame from the shadow tables.
  * Returns non-zero if we need to flush TLBs. */
 
-static int sh_remove_all_mappings(struct domain *d, mfn_t gmfn, gfn_t gfn)
+int sh_remove_all_mappings(struct domain *d, mfn_t gmfn, gfn_t gfn)
 {
     struct page_info *page = mfn_to_page(gmfn);
 
@@ -3162,203 +3162,6 @@ static void sh_clean_dirty_bitmap(struct
 }
 
 
-/**************************************************************************/
-/* VRAM dirty tracking support */
-int shadow_track_dirty_vram(struct domain *d,
-                            unsigned long begin_pfn,
-                            unsigned long nr,
-                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
-{
-    int rc = 0;
-    unsigned long end_pfn = begin_pfn + nr;
-    unsigned long dirty_size = (nr + 7) / 8;
-    int flush_tlb = 0;
-    unsigned long i;
-    p2m_type_t t;
-    struct sh_dirty_vram *dirty_vram;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    uint8_t *dirty_bitmap = NULL;
-
-    if ( end_pfn < begin_pfn || end_pfn > p2m->max_mapped_pfn + 1 )
-        return -EINVAL;
-
-    /* We perform p2m lookups, so lock the p2m upfront to avoid deadlock */
-    p2m_lock(p2m_get_hostp2m(d));
-    paging_lock(d);
-
-    dirty_vram = d->arch.hvm.dirty_vram;
-
-    if ( dirty_vram && (!nr ||
-             ( begin_pfn != dirty_vram->begin_pfn
-            || end_pfn   != dirty_vram->end_pfn )) )
-    {
-        /* Different tracking, tear the previous down. */
-        gdprintk(XENLOG_INFO, "stopping tracking VRAM %lx - %lx\n", dirty_vram->begin_pfn, dirty_vram->end_pfn);
-        xfree(dirty_vram->sl1ma);
-        xfree(dirty_vram->dirty_bitmap);
-        xfree(dirty_vram);
-        dirty_vram = d->arch.hvm.dirty_vram = NULL;
-    }
-
-    if ( !nr )
-        goto out;
-
-    dirty_bitmap = vzalloc(dirty_size);
-    if ( dirty_bitmap == NULL )
-    {
-        rc = -ENOMEM;
-        goto out;
-    }
-    /* This should happen seldomly (Video mode change),
-     * no need to be careful. */
-    if ( !dirty_vram )
-    {
-        /* Throw away all the shadows rather than walking through them
-         * up to nr times getting rid of mappings of each pfn */
-        shadow_blow_tables(d);
-
-        gdprintk(XENLOG_INFO, "tracking VRAM %lx - %lx\n", begin_pfn, end_pfn);
-
-        rc = -ENOMEM;
-        if ( (dirty_vram = xmalloc(struct sh_dirty_vram)) == NULL )
-            goto out;
-        dirty_vram->begin_pfn = begin_pfn;
-        dirty_vram->end_pfn = end_pfn;
-        d->arch.hvm.dirty_vram = dirty_vram;
-
-        if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr)) == NULL )
-            goto out_dirty_vram;
-        memset(dirty_vram->sl1ma, ~0, sizeof(paddr_t) * nr);
-
-        if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
-            goto out_sl1ma;
-
-        dirty_vram->last_dirty = NOW();
-
-        /* Tell the caller that this time we could not track dirty bits. */
-        rc = -ENODATA;
-    }
-    else if (dirty_vram->last_dirty == -1)
-        /* still completely clean, just copy our empty bitmap */
-        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
-    else
-    {
-        mfn_t map_mfn = INVALID_MFN;
-        void *map_sl1p = NULL;
-
-        /* Iterate over VRAM to track dirty bits. */
-        for ( i = 0; i < nr; i++ ) {
-            mfn_t mfn = get_gfn_query_unlocked(d, begin_pfn + i, &t);
-            struct page_info *page;
-            int dirty = 0;
-            paddr_t sl1ma = dirty_vram->sl1ma[i];
-
-            if ( mfn_eq(mfn, INVALID_MFN) )
-                dirty = 1;
-            else
-            {
-                page = mfn_to_page(mfn);
-                switch (page->u.inuse.type_info & PGT_count_mask)
-                {
-                case 0:
-                    /* No guest reference, nothing to track. */
-                    break;
-                case 1:
-                    /* One guest reference. */
-                    if ( sl1ma == INVALID_PADDR )
-                    {
-                        /* We don't know which sl1e points to this, too bad. */
-                        dirty = 1;
-                        /* TODO: Heuristics for finding the single mapping of
-                         * this gmfn */
-                        flush_tlb |= sh_remove_all_mappings(d, mfn,
-                                                            _gfn(begin_pfn + i));
-                    }
-                    else
-                    {
-                        /* Hopefully the most common case: only one mapping,
-                         * whose dirty bit we can use. */
-                        l1_pgentry_t *sl1e;
-                        mfn_t sl1mfn = maddr_to_mfn(sl1ma);
-
-                        if ( !mfn_eq(sl1mfn, map_mfn) )
-                        {
-                            if ( map_sl1p )
-                                unmap_domain_page(map_sl1p);
-                            map_sl1p = map_domain_page(sl1mfn);
-                            map_mfn = sl1mfn;
-                        }
-                        sl1e = map_sl1p + (sl1ma & ~PAGE_MASK);
-
-                        if ( l1e_get_flags(*sl1e) & _PAGE_DIRTY )
-                        {
-                            dirty = 1;
-                            /* Note: this is atomic, so we may clear a
-                             * _PAGE_ACCESSED set by another processor. */
-                            l1e_remove_flags(*sl1e, _PAGE_DIRTY);
-                            flush_tlb = 1;
-                        }
-                    }
-                    break;
-                default:
-                    /* More than one guest reference,
-                     * we don't afford tracking that. */
-                    dirty = 1;
-                    break;
-                }
-            }
-
-            if ( dirty )
-            {
-                dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
-                dirty_vram->last_dirty = NOW();
-            }
-        }
-
-        if ( map_sl1p )
-            unmap_domain_page(map_sl1p);
-
-        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
-        memset(dirty_vram->dirty_bitmap, 0, dirty_size);
-        if ( dirty_vram->last_dirty + SECONDS(2) < NOW() )
-        {
-            /* was clean for more than two seconds, try to disable guest
-             * write access */
-            for ( i = begin_pfn; i < end_pfn; i++ )
-            {
-                mfn_t mfn = get_gfn_query_unlocked(d, i, &t);
-                if ( !mfn_eq(mfn, INVALID_MFN) )
-                    flush_tlb |= sh_remove_write_access(d, mfn, 1, 0);
-            }
-            dirty_vram->last_dirty = -1;
-        }
-    }
-    if ( flush_tlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-    goto out;
-
-out_sl1ma:
-    xfree(dirty_vram->sl1ma);
-out_dirty_vram:
-    xfree(dirty_vram);
-    dirty_vram = d->arch.hvm.dirty_vram = NULL;
-
-out:
-    paging_unlock(d);
-    if ( rc == 0 && dirty_bitmap != NULL &&
-         copy_to_guest(guest_dirty_bitmap, dirty_bitmap, dirty_size) )
-    {
-        paging_lock(d);
-        for ( i = 0; i < dirty_size; i++ )
-            dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
-        paging_unlock(d);
-        rc = -EFAULT;
-    }
-    vfree(dirty_bitmap);
-    p2m_unlock(p2m_get_hostp2m(d));
-    return rc;
-}
-
 /* Fluhs TLB of selected vCPUs. */
 bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
                       void *ctxt)
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -691,6 +691,218 @@ static void sh_emulate_unmap_dest(struct
     atomic_inc(&v->domain->arch.paging.shadow.gtable_dirty_version);
 }
 
+/**************************************************************************/
+/* VRAM dirty tracking support */
+int shadow_track_dirty_vram(struct domain *d,
+                            unsigned long begin_pfn,
+                            unsigned long nr,
+                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
+{
+    int rc = 0;
+    unsigned long end_pfn = begin_pfn + nr;
+    unsigned long dirty_size = (nr + 7) / 8;
+    int flush_tlb = 0;
+    unsigned long i;
+    p2m_type_t t;
+    struct sh_dirty_vram *dirty_vram;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    uint8_t *dirty_bitmap = NULL;
+
+    if ( end_pfn < begin_pfn || end_pfn > p2m->max_mapped_pfn + 1 )
+        return -EINVAL;
+
+    /* We perform p2m lookups, so lock the p2m upfront to avoid deadlock */
+    p2m_lock(p2m_get_hostp2m(d));
+    paging_lock(d);
+
+    dirty_vram = d->arch.hvm.dirty_vram;
+
+    if ( dirty_vram && (!nr ||
+             ( begin_pfn != dirty_vram->begin_pfn
+            || end_pfn   != dirty_vram->end_pfn )) )
+    {
+        /* Different tracking, tear the previous down. */
+        gdprintk(XENLOG_INFO, "stopping tracking VRAM %lx - %lx\n", dirty_vram->begin_pfn, dirty_vram->end_pfn);
+        xfree(dirty_vram->sl1ma);
+        xfree(dirty_vram->dirty_bitmap);
+        xfree(dirty_vram);
+        dirty_vram = d->arch.hvm.dirty_vram = NULL;
+    }
+
+    if ( !nr )
+        goto out;
+
+    dirty_bitmap = vzalloc(dirty_size);
+    if ( dirty_bitmap == NULL )
+    {
+        rc = -ENOMEM;
+        goto out;
+    }
+    /*
+     * This should happen seldomly (Video mode change),
+     * no need to be careful.
+     */
+    if ( !dirty_vram )
+    {
+        /*
+         * Throw away all the shadows rather than walking through them
+         * up to nr times getting rid of mappings of each pfn.
+         */
+        shadow_blow_tables(d);
+
+        gdprintk(XENLOG_INFO, "tracking VRAM %lx - %lx\n", begin_pfn, end_pfn);
+
+        rc = -ENOMEM;
+        if ( (dirty_vram = xmalloc(struct sh_dirty_vram)) == NULL )
+            goto out;
+        dirty_vram->begin_pfn = begin_pfn;
+        dirty_vram->end_pfn = end_pfn;
+        d->arch.hvm.dirty_vram = dirty_vram;
+
+        if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr)) == NULL )
+            goto out_dirty_vram;
+        memset(dirty_vram->sl1ma, ~0, sizeof(paddr_t) * nr);
+
+        if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
+            goto out_sl1ma;
+
+        dirty_vram->last_dirty = NOW();
+
+        /* Tell the caller that this time we could not track dirty bits. */
+        rc = -ENODATA;
+    }
+    else if ( dirty_vram->last_dirty == -1 )
+        /* still completely clean, just copy our empty bitmap */
+        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
+    else
+    {
+        mfn_t map_mfn = INVALID_MFN;
+        void *map_sl1p = NULL;
+
+        /* Iterate over VRAM to track dirty bits. */
+        for ( i = 0; i < nr; i++ )
+        {
+            mfn_t mfn = get_gfn_query_unlocked(d, begin_pfn + i, &t);
+            struct page_info *page;
+            int dirty = 0;
+            paddr_t sl1ma = dirty_vram->sl1ma[i];
+
+            if ( mfn_eq(mfn, INVALID_MFN) )
+                dirty = 1;
+            else
+            {
+                page = mfn_to_page(mfn);
+                switch ( page->u.inuse.type_info & PGT_count_mask )
+                {
+                case 0:
+                    /* No guest reference, nothing to track. */
+                    break;
+
+                case 1:
+                    /* One guest reference. */
+                    if ( sl1ma == INVALID_PADDR )
+                    {
+                        /* We don't know which sl1e points to this, too bad. */
+                        dirty = 1;
+                        /*
+                         * TODO: Heuristics for finding the single mapping of
+                         * this gmfn
+                         */
+                        flush_tlb |= sh_remove_all_mappings(d, mfn,
+                                                            _gfn(begin_pfn + i));
+                    }
+                    else
+                    {
+                        /*
+                         * Hopefully the most common case: only one mapping,
+                         * whose dirty bit we can use.
+                         */
+                        l1_pgentry_t *sl1e;
+                        mfn_t sl1mfn = maddr_to_mfn(sl1ma);
+
+                        if ( !mfn_eq(sl1mfn, map_mfn) )
+                        {
+                            if ( map_sl1p )
+                                unmap_domain_page(map_sl1p);
+                            map_sl1p = map_domain_page(sl1mfn);
+                            map_mfn = sl1mfn;
+                        }
+                        sl1e = map_sl1p + (sl1ma & ~PAGE_MASK);
+
+                        if ( l1e_get_flags(*sl1e) & _PAGE_DIRTY )
+                        {
+                            dirty = 1;
+                            /*
+                             * Note: this is atomic, so we may clear a
+                             * _PAGE_ACCESSED set by another processor.
+                             */
+                            l1e_remove_flags(*sl1e, _PAGE_DIRTY);
+                            flush_tlb = 1;
+                        }
+                    }
+                    break;
+
+                default:
+                    /* More than one guest reference,
+                     * we don't afford tracking that. */
+                    dirty = 1;
+                    break;
+                }
+            }
+
+            if ( dirty )
+            {
+                dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
+                dirty_vram->last_dirty = NOW();
+            }
+        }
+
+        if ( map_sl1p )
+            unmap_domain_page(map_sl1p);
+
+        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
+        memset(dirty_vram->dirty_bitmap, 0, dirty_size);
+        if ( dirty_vram->last_dirty + SECONDS(2) < NOW() )
+        {
+            /*
+             * Was clean for more than two seconds, try to disable guest
+             * write access.
+             */
+            for ( i = begin_pfn; i < end_pfn; i++ )
+            {
+                mfn_t mfn = get_gfn_query_unlocked(d, i, &t);
+                if ( !mfn_eq(mfn, INVALID_MFN) )
+                    flush_tlb |= sh_remove_write_access(d, mfn, 1, 0);
+            }
+            dirty_vram->last_dirty = -1;
+        }
+    }
+    if ( flush_tlb )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
+    goto out;
+
+ out_sl1ma:
+    xfree(dirty_vram->sl1ma);
+ out_dirty_vram:
+    xfree(dirty_vram);
+    dirty_vram = d->arch.hvm.dirty_vram = NULL;
+
+ out:
+    paging_unlock(d);
+    if ( rc == 0 && dirty_bitmap != NULL &&
+         copy_to_guest(guest_dirty_bitmap, dirty_bitmap, dirty_size) )
+    {
+        paging_lock(d);
+        for ( i = 0; i < dirty_size; i++ )
+            dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
+        paging_unlock(d);
+        rc = -EFAULT;
+    }
+    vfree(dirty_bitmap);
+    p2m_unlock(p2m_get_hostp2m(d));
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -494,7 +494,6 @@ _sh_propagate(struct vcpu *v,
     guest_l1e_t guest_entry = { guest_intpte };
     shadow_l1e_t *sp = shadow_entry_ptr;
     struct domain *d = v->domain;
-    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
     gfn_t target_gfn = guest_l1e_get_gfn(guest_entry);
     u32 pass_thru_flags;
     u32 gflags, sflags;
@@ -649,15 +648,19 @@ _sh_propagate(struct vcpu *v,
         }
     }
 
-    if ( unlikely((level == 1) && dirty_vram
-            && dirty_vram->last_dirty == -1
-            && gfn_x(target_gfn) >= dirty_vram->begin_pfn
-            && gfn_x(target_gfn) < dirty_vram->end_pfn) )
+    if ( unlikely(level == 1) && is_hvm_domain(d) )
     {
-        if ( ft & FETCH_TYPE_WRITE )
-            dirty_vram->last_dirty = NOW();
-        else
-            sflags &= ~_PAGE_RW;
+        struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+
+        if ( dirty_vram && dirty_vram->last_dirty == -1 &&
+             gfn_x(target_gfn) >= dirty_vram->begin_pfn &&
+             gfn_x(target_gfn) < dirty_vram->end_pfn )
+        {
+            if ( ft & FETCH_TYPE_WRITE )
+                dirty_vram->last_dirty = NOW();
+            else
+                sflags &= ~_PAGE_RW;
+        }
     }
 
     /* Read-only memory */
@@ -1082,7 +1085,7 @@ static inline void shadow_vram_get_l1e(s
     unsigned long gfn;
     struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
 
-    if ( !dirty_vram         /* tracking disabled? */
+    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
          || !(flags & _PAGE_RW) /* read-only mapping? */
          || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
         return;
@@ -1113,7 +1116,7 @@ static inline void shadow_vram_put_l1e(s
     unsigned long gfn;
     struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
 
-    if ( !dirty_vram         /* tracking disabled? */
+    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
          || !(flags & _PAGE_RW) /* read-only mapping? */
          || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
         return;
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -438,6 +438,14 @@ mfn_t oos_snapshot_lookup(struct domain
 
 #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
 
+/* Deliberately free all the memory we can: tear down all of d's shadows. */
+void shadow_blow_tables(struct domain *d);
+
+/*
+ * Remove all mappings of a guest frame from the shadow tables.
+ * Returns non-zero if we need to flush TLBs.
+ */
+int sh_remove_all_mappings(struct domain *d, mfn_t gmfn, gfn_t gfn);
 
 /* Reset the up-pointers of every L3 shadow to 0.
  * This is called when l3 shadows stop being pinnable, to clear out all


