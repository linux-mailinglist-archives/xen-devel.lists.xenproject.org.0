Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF62F63BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67118.119533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04FG-0006O7-Bv; Thu, 14 Jan 2021 15:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67118.119533; Thu, 14 Jan 2021 15:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04FG-0006Ng-7Y; Thu, 14 Jan 2021 15:09:06 +0000
Received: by outflank-mailman (input) for mailman id 67118;
 Thu, 14 Jan 2021 15:09:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04FE-0006NU-Ef
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:09:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 943f71a1-1d48-4a84-aea4-76325844b2b6;
 Thu, 14 Jan 2021 15:09:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05D51AE39;
 Thu, 14 Jan 2021 15:09:01 +0000 (UTC)
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
X-Inumbo-ID: 943f71a1-1d48-4a84-aea4-76325844b2b6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2JJ+R1epcNaT/rXTbMgCaVTRhqTPULRJqJiFqhGdzvs=;
	b=bV/7gUlzIBiPdqWnFJqOcl4rEYlVtib5HuEW8nnvtjVF0sdbze9FkmSnFOpzMYKxd+jsYa
	QZzk6/FfDNOlkH8tYeha3dQxGF6PkAsKMapGU3IU5M5xydvXIzW+7uuWC2+E97tuwxkhw+
	Ewwwl9m763I+dnOTNAoNCXk/ns8oiqk=
Subject: [PATCH 12/17] x86/shadow: move shadow_set_l<N>e() to their own source
 file
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <280fb803-c130-45d6-bc0e-c7d17cce99ba@suse.com>
Date: Thu, 14 Jan 2021 16:09:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The few GUEST_PAGING_LEVELS dependencies (of shadow_set_l2e() only) can
be easily expressed by function parameters; I suppose the extra indirect
call is acceptable for the increasingly little used 32-bit non-PAE case.
This way shadow_set_l[12]e(), each of which compiles to almost 1k of
code, need building just once.

The implication is the need for some "relaxation" in types.h: The
underlying PTE types don't vary anymore (and aren't expected to down the
road), so they as well as some basic helpers can be exposed even in the
new, artificial GUEST_PAGING_LEVELS == 0 case.

Almost pure code movement - exceptions are the conversion of
"#if GUEST_PAGING_LEVELS == 2" to runtime conditionals and style
corrections (including to avoid open-coding mfn_to_maddr() and
PAGE_OFFSET()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,5 +1,5 @@
 ifeq ($(CONFIG_SHADOW_PAGING),y)
-obj-y += common.o guest_2.o guest_3.o guest_4.o
+obj-y += common.o guest_2.o guest_3.o guest_4.o set.o
 obj-$(CONFIG_HVM) += hvm.o
 obj-$(CONFIG_PV) += pv.o
 else
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -389,8 +389,13 @@ static inline mfn_t sh_next_page(mfn_t s
     ASSERT(!next->u.sh.head);
     return page_to_mfn(next);
 }
+#else
+# define sh_next_page NULL
 #endif
 
+#define shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn) \
+    shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, sh_next_page)
+
 static inline u32
 guest_index(void *ptr)
 {
@@ -740,391 +745,6 @@ l1e_propagate_from_guest(struct vcpu *v,
 }
 
 
-/**************************************************************************/
-/* These functions update shadow entries (and do bookkeeping on the shadow
- * tables they are in).  It is intended that they are the only
- * functions which ever write (non-zero) data onto a shadow page.
- */
-
-static inline void
-shadow_write_entries(void *d, const void *s, unsigned int entries, mfn_t mfn)
-/*
- * This function does the actual writes to shadow pages.
- * It must not be called directly, since it doesn't do the bookkeeping
- * that shadow_set_l*e() functions do.
- *
- * Copy PTEs safely when processors might be running on the
- * destination pagetable.  This does *not* give safety against
- * concurrent writes (that's what the paging lock is for), just
- * stops the hardware picking up partially written entries.
- */
-{
-    shadow_l1e_t *dst = d;
-    const shadow_l1e_t *src = s;
-    void *map = NULL;
-    unsigned int i = 0;
-
-    /*
-     * Because we mirror access rights at all levels in the shadow, an
-     * l2 (or higher) entry with the RW bit cleared will leave us with
-     * no write access through the linear map.
-     * We detect that by writing to the shadow with put_unsafe() and
-     * using map_domain_page() to get a writeable mapping if we need to.
-     */
-    if ( put_unsafe(*src, dst) )
-    {
-        perfc_incr(shadow_linear_map_failed);
-        map = map_domain_page(mfn);
-        dst = map + PAGE_OFFSET(dst);
-    }
-    else
-    {
-        ++src;
-        ++dst;
-        i = 1;
-    }
-
-    ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
-
-    for ( ; i < entries; i++ )
-        write_atomic(&dst++->l1, src++->l1);
-
-    unmap_domain_page(map);
-}
-
-/* type is only used to distinguish grant map pages from ordinary RAM
- * i.e. non-p2m_is_grant() pages are treated as p2m_ram_rw.  */
-static int inline
-shadow_get_page_from_l1e(shadow_l1e_t sl1e, struct domain *d, p2m_type_t type)
-{
-    int res;
-    mfn_t mfn;
-    struct domain *owner;
-
-    ASSERT(!sh_l1e_is_magic(sl1e));
-
-    if ( !shadow_mode_refcounts(d) )
-        return 1;
-
-    res = get_page_from_l1e(sl1e, d, d);
-
-    // If a privileged domain is attempting to install a map of a page it does
-    // not own, we let it succeed anyway.
-    //
-    if ( unlikely(res < 0) &&
-         !shadow_mode_translate(d) &&
-         mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
-         (owner = page_get_owner(mfn_to_page(mfn))) &&
-         (d != owner) )
-    {
-        res = xsm_priv_mapping(XSM_TARGET, d, owner);
-        if ( !res ) {
-            res = get_page_from_l1e(sl1e, d, owner);
-            SHADOW_PRINTK("privileged domain %d installs map of mfn %"PRI_mfn" "
-                           "which is owned by d%d: %s\n",
-                           d->domain_id, mfn_x(mfn), owner->domain_id,
-                           res >= 0 ? "success" : "failed");
-        }
-    }
-
-    /* Okay, it might still be a grant mapping PTE.  Try it. */
-    if ( unlikely(res < 0) &&
-         (type == p2m_grant_map_rw ||
-          (type == p2m_grant_map_ro &&
-           !(shadow_l1e_get_flags(sl1e) & _PAGE_RW))) )
-    {
-        /* It's a grant mapping.  The grant table implementation will
-           already have checked that we're supposed to have access, so
-           we can just grab a reference directly. */
-        mfn = shadow_l1e_get_mfn(sl1e);
-        if ( mfn_valid(mfn) )
-            res = get_page_from_l1e(sl1e, d, page_get_owner(mfn_to_page(mfn)));
-    }
-
-    if ( unlikely(res < 0) )
-    {
-        perfc_incr(shadow_get_page_fail);
-        SHADOW_PRINTK("failed: l1e=" SH_PRI_pte "\n");
-    }
-
-    return res;
-}
-
-static void inline
-shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
-{
-    if ( !shadow_mode_refcounts(d) )
-        return;
-
-    put_page_from_l1e(sl1e, d);
-}
-
-#if GUEST_PAGING_LEVELS >= 4
-static int shadow_set_l4e(struct domain *d,
-                          shadow_l4e_t *sl4e,
-                          shadow_l4e_t new_sl4e,
-                          mfn_t sl4mfn)
-{
-    int flags = 0;
-    shadow_l4e_t old_sl4e;
-    paddr_t paddr;
-    ASSERT(sl4e != NULL);
-    old_sl4e = *sl4e;
-
-    if ( old_sl4e.l4 == new_sl4e.l4 ) return 0; /* Nothing to do */
-
-    paddr = ((((paddr_t)mfn_x(sl4mfn)) << PAGE_SHIFT)
-             | (((unsigned long)sl4e) & ~PAGE_MASK));
-
-    if ( shadow_l4e_get_flags(new_sl4e) & _PAGE_PRESENT )
-    {
-        /* About to install a new reference */
-        mfn_t sl3mfn = shadow_l4e_get_mfn(new_sl4e);
-
-        if ( !sh_get_ref(d, sl3mfn, paddr) )
-        {
-            domain_crash(d);
-            return SHADOW_SET_ERROR;
-        }
-
-        /* Are we pinning l3 shadows to handle weird Linux behaviour? */
-        if ( sh_type_is_pinnable(d, SH_type_l3_64_shadow) )
-            sh_pin(d, sl3mfn);
-    }
-
-    /* Write the new entry */
-    shadow_write_entries(sl4e, &new_sl4e, 1, sl4mfn);
-    flush_root_pgtbl_domain(d);
-
-    flags |= SHADOW_SET_CHANGED;
-
-    if ( shadow_l4e_get_flags(old_sl4e) & _PAGE_PRESENT )
-    {
-        /* We lost a reference to an old mfn. */
-        mfn_t osl3mfn = shadow_l4e_get_mfn(old_sl4e);
-
-        if ( !mfn_eq(osl3mfn, shadow_l4e_get_mfn(new_sl4e))
-             || !perms_strictly_increased(shadow_l4e_get_flags(old_sl4e),
-                                          shadow_l4e_get_flags(new_sl4e)) )
-        {
-            flags |= SHADOW_SET_FLUSH;
-        }
-        sh_put_ref(d, osl3mfn, paddr);
-    }
-
-    return flags;
-}
-
-static int shadow_set_l3e(struct domain *d,
-                          shadow_l3e_t *sl3e,
-                          shadow_l3e_t new_sl3e,
-                          mfn_t sl3mfn)
-{
-    int flags = 0;
-    shadow_l3e_t old_sl3e;
-    paddr_t paddr;
-    ASSERT(sl3e != NULL);
-    old_sl3e = *sl3e;
-
-    if ( old_sl3e.l3 == new_sl3e.l3 ) return 0; /* Nothing to do */
-
-    paddr = ((((paddr_t)mfn_x(sl3mfn)) << PAGE_SHIFT)
-             | (((unsigned long)sl3e) & ~PAGE_MASK));
-
-    if ( shadow_l3e_get_flags(new_sl3e) & _PAGE_PRESENT )
-    {
-        /* About to install a new reference */
-        if ( !sh_get_ref(d, shadow_l3e_get_mfn(new_sl3e), paddr) )
-        {
-            domain_crash(d);
-            return SHADOW_SET_ERROR;
-        }
-    }
-
-    /* Write the new entry */
-    shadow_write_entries(sl3e, &new_sl3e, 1, sl3mfn);
-    flags |= SHADOW_SET_CHANGED;
-
-    if ( shadow_l3e_get_flags(old_sl3e) & _PAGE_PRESENT )
-    {
-        /* We lost a reference to an old mfn. */
-        mfn_t osl2mfn = shadow_l3e_get_mfn(old_sl3e);
-
-        if ( !mfn_eq(osl2mfn, shadow_l3e_get_mfn(new_sl3e)) ||
-             !perms_strictly_increased(shadow_l3e_get_flags(old_sl3e),
-                                       shadow_l3e_get_flags(new_sl3e)) )
-        {
-            flags |= SHADOW_SET_FLUSH;
-        }
-        sh_put_ref(d, osl2mfn, paddr);
-    }
-    return flags;
-}
-#endif /* GUEST_PAGING_LEVELS >= 4 */
-
-static int shadow_set_l2e(struct domain *d,
-                          shadow_l2e_t *sl2e,
-                          shadow_l2e_t new_sl2e,
-                          mfn_t sl2mfn)
-{
-    int flags = 0;
-    shadow_l2e_t old_sl2e;
-    paddr_t paddr;
-
-#if GUEST_PAGING_LEVELS == 2
-    /* In 2-on-3 we work with pairs of l2es pointing at two-page
-     * shadows.  Reference counting and up-pointers track from the first
-     * page of the shadow to the first l2e, so make sure that we're
-     * working with those:
-     * Start with a pair of identical entries */
-    shadow_l2e_t pair[2] = { new_sl2e, new_sl2e };
-    /* Align the pointer down so it's pointing at the first of the pair */
-    sl2e = (shadow_l2e_t *)((unsigned long)sl2e & ~(sizeof(shadow_l2e_t)));
-#endif
-
-    ASSERT(sl2e != NULL);
-    old_sl2e = *sl2e;
-
-    if ( old_sl2e.l2 == new_sl2e.l2 ) return 0; /* Nothing to do */
-
-    paddr = ((((paddr_t)mfn_x(sl2mfn)) << PAGE_SHIFT)
-             | (((unsigned long)sl2e) & ~PAGE_MASK));
-
-    if ( shadow_l2e_get_flags(new_sl2e) & _PAGE_PRESENT )
-    {
-        mfn_t sl1mfn = shadow_l2e_get_mfn(new_sl2e);
-        ASSERT(mfn_to_page(sl1mfn)->u.sh.head);
-
-        /* About to install a new reference */
-        if ( !sh_get_ref(d, sl1mfn, paddr) )
-        {
-            domain_crash(d);
-            return SHADOW_SET_ERROR;
-        }
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-        {
-            struct page_info *sp = mfn_to_page(sl1mfn);
-            mfn_t gl1mfn;
-
-            ASSERT(sp->u.sh.head);
-            gl1mfn = backpointer(sp);
-            /* If the shadow is a fl1 then the backpointer contains
-               the GFN instead of the GMFN, and it's definitely not
-               OOS. */
-            if ( (sp->u.sh.type != SH_type_fl1_shadow) && mfn_valid(gl1mfn)
-                 && mfn_is_out_of_sync(gl1mfn) )
-                sh_resync(d, gl1mfn);
-        }
-#endif
-#if GUEST_PAGING_LEVELS == 2
-        /* Update the second entry to point tio the second half of the l1 */
-        sl1mfn = sh_next_page(sl1mfn);
-        pair[1] = shadow_l2e_from_mfn(sl1mfn, shadow_l2e_get_flags(new_sl2e));
-#endif
-    }
-
-    /* Write the new entry */
-#if GUEST_PAGING_LEVELS == 2
-    shadow_write_entries(sl2e, &pair, 2, sl2mfn);
-#else /* normal case */
-    shadow_write_entries(sl2e, &new_sl2e, 1, sl2mfn);
-#endif
-    flags |= SHADOW_SET_CHANGED;
-
-    if ( shadow_l2e_get_flags(old_sl2e) & _PAGE_PRESENT )
-    {
-        /* We lost a reference to an old mfn. */
-        mfn_t osl1mfn = shadow_l2e_get_mfn(old_sl2e);
-
-        if ( !mfn_eq(osl1mfn, shadow_l2e_get_mfn(new_sl2e)) ||
-             !perms_strictly_increased(shadow_l2e_get_flags(old_sl2e),
-                                       shadow_l2e_get_flags(new_sl2e)) )
-        {
-            flags |= SHADOW_SET_FLUSH;
-        }
-        sh_put_ref(d, osl1mfn, paddr);
-    }
-    return flags;
-}
-
-static int shadow_set_l1e(struct domain *d,
-                          shadow_l1e_t *sl1e,
-                          shadow_l1e_t new_sl1e,
-                          p2m_type_t new_type,
-                          mfn_t sl1mfn)
-{
-    int flags = 0;
-    shadow_l1e_t old_sl1e;
-    unsigned int old_sl1f;
-#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
-    mfn_t new_gmfn = shadow_l1e_get_mfn(new_sl1e);
-#endif
-    ASSERT(sl1e != NULL);
-
-#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
-    if ( mfn_valid(new_gmfn) && mfn_oos_may_write(new_gmfn)
-         && ((shadow_l1e_get_flags(new_sl1e) & (_PAGE_RW|_PAGE_PRESENT))
-             == (_PAGE_RW|_PAGE_PRESENT)) )
-        oos_fixup_add(d, new_gmfn, sl1mfn, pgentry_ptr_to_slot(sl1e));
-#endif
-
-    old_sl1e = *sl1e;
-
-    if ( old_sl1e.l1 == new_sl1e.l1 ) return 0; /* Nothing to do */
-
-    if ( (shadow_l1e_get_flags(new_sl1e) & _PAGE_PRESENT)
-         && !sh_l1e_is_magic(new_sl1e) )
-    {
-        /* About to install a new reference */
-        if ( shadow_mode_refcounts(d) )
-        {
-#define PAGE_FLIPPABLE (_PAGE_RW | _PAGE_PWT | _PAGE_PCD | _PAGE_PAT)
-            int rc;
-
-            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_GET_REF);
-            switch ( rc = shadow_get_page_from_l1e(new_sl1e, d, new_type) )
-            {
-            default:
-                /* Doesn't look like a pagetable. */
-                flags |= SHADOW_SET_ERROR;
-                new_sl1e = shadow_l1e_empty();
-                break;
-            case PAGE_FLIPPABLE & -PAGE_FLIPPABLE ... PAGE_FLIPPABLE:
-                ASSERT(!(rc & ~PAGE_FLIPPABLE));
-                new_sl1e = shadow_l1e_flip_flags(new_sl1e, rc);
-                /* fall through */
-            case 0:
-                shadow_vram_get_mfn(shadow_l1e_get_mfn(new_sl1e),
-                                    shadow_l1e_get_flags(new_sl1e),
-                                    sl1mfn, sl1e, d);
-                break;
-            }
-#undef PAGE_FLIPPABLE
-        }
-    }
-
-    /* Write the new entry */
-    shadow_write_entries(sl1e, &new_sl1e, 1, sl1mfn);
-    flags |= SHADOW_SET_CHANGED;
-
-    old_sl1f = shadow_l1e_get_flags(old_sl1e);
-    if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
-         shadow_mode_refcounts(d) )
-    {
-        /* We lost a reference to an old mfn. */
-        /* N.B. Unlike higher-level sets, never need an extra flush
-         * when writing an l1e.  Because it points to the same guest frame
-         * as the guest l1e did, it's the guest's responsibility to
-         * trigger a flush later. */
-        shadow_vram_put_mfn(shadow_l1e_get_mfn(old_sl1e), old_sl1f,
-                            sl1mfn, sl1e, d);
-        shadow_put_page_from_l1e(old_sl1e, d);
-        TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_PUT_REF);
-    }
-    return flags;
-}
-
-
 /**************************************************************************/
 /* Macros to walk pagetables.  These take the shadow of a pagetable and
  * walk every "interesting" entry.  That is, they don't touch Xen mappings,
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -0,0 +1,418 @@
+/******************************************************************************
+ * arch/x86/mm/shadow/set.c
+ *
+ * Simple, mostly-synchronous shadow page tables.
+ * Parts of this code are Copyright (c) 2006 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define GUEST_PAGING_LEVELS 0
+
+#include <xen/sched.h>
+#include <xsm/xsm.h>
+#include <asm/shadow.h>
+#include "private.h"
+#include "types.h"
+
+/*
+ * These functions update shadow entries (and do bookkeeping on the shadow
+ * tables they are in).  It is intended that they are the only
+ * functions which ever write (non-zero) data onto a shadow page.
+ */
+
+static inline void
+shadow_write_entries(void *d, const void *s, unsigned int entries, mfn_t mfn)
+/*
+ * This function does the actual writes to shadow pages.
+ * It must not be called directly, since it doesn't do the bookkeeping
+ * that shadow_set_l*e() functions do.
+ *
+ * Copy PTEs safely when processors might be running on the
+ * destination pagetable.  This does *not* give safety against
+ * concurrent writes (that's what the paging lock is for), just
+ * stops the hardware picking up partially written entries.
+ */
+{
+    shadow_l1e_t *dst = d;
+    const shadow_l1e_t *src = s;
+    void *map = NULL;
+    unsigned int i = 0;
+
+    /*
+     * Because we mirror access rights at all levels in the shadow, an
+     * l2 (or higher) entry with the RW bit cleared will leave us with
+     * no write access through the linear map.
+     * We detect that by writing to the shadow with put_unsafe() and
+     * using map_domain_page() to get a writeable mapping if we need to.
+     */
+    if ( put_unsafe(*src, dst) )
+    {
+        perfc_incr(shadow_linear_map_failed);
+        map = map_domain_page(mfn);
+        dst = map + PAGE_OFFSET(dst);
+    }
+    else
+    {
+        ++src;
+        ++dst;
+        i = 1;
+    }
+
+    ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
+
+    for ( ; i < entries; i++ )
+        write_atomic(&dst++->l1, src++->l1);
+
+    unmap_domain_page(map);
+}
+
+/*
+ * "type" is only used to distinguish grant map pages from ordinary RAM
+ * i.e. non-p2m_is_grant() pages are treated as p2m_ram_rw.
+ */
+static int inline
+shadow_get_page_from_l1e(shadow_l1e_t sl1e, struct domain *d, p2m_type_t type)
+{
+    int res;
+    mfn_t mfn;
+    struct domain *owner;
+
+    ASSERT(!sh_l1e_is_magic(sl1e));
+
+    if ( !shadow_mode_refcounts(d) )
+        return 1;
+
+    res = get_page_from_l1e(sl1e, d, d);
+
+    /*
+     * If a privileged domain is attempting to install a map of a page it does
+     * not own, we let it succeed anyway.
+     */
+    if ( unlikely(res < 0) &&
+         !shadow_mode_translate(d) &&
+         mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
+         (owner = page_get_owner(mfn_to_page(mfn))) &&
+         (d != owner) )
+    {
+        res = xsm_priv_mapping(XSM_TARGET, d, owner);
+        if ( !res )
+        {
+            res = get_page_from_l1e(sl1e, d, owner);
+            SHADOW_PRINTK("privileged %pd installs map of mfn %"PRI_mfn" owned by %pd: %s\n",
+                           d, mfn_x(mfn), owner,
+                           res >= 0 ? "success" : "failed");
+        }
+    }
+
+    /* Okay, it might still be a grant mapping PTE.  Try it. */
+    if ( unlikely(res < 0) &&
+         (type == p2m_grant_map_rw ||
+          (type == p2m_grant_map_ro &&
+           !(shadow_l1e_get_flags(sl1e) & _PAGE_RW))) )
+    {
+        /*
+         * It's a grant mapping.  The grant table implementation will
+         * already have checked that we're supposed to have access, so
+         * we can just grab a reference directly.
+         */
+        mfn = shadow_l1e_get_mfn(sl1e);
+        if ( mfn_valid(mfn) )
+            res = get_page_from_l1e(sl1e, d, page_get_owner(mfn_to_page(mfn)));
+    }
+
+    if ( unlikely(res < 0) )
+    {
+        perfc_incr(shadow_get_page_fail);
+        SHADOW_PRINTK("failed: l1e=" SH_PRI_pte "\n");
+    }
+
+    return res;
+}
+
+int shadow_set_l4e(struct domain *d, shadow_l4e_t *sl4e,
+                   shadow_l4e_t new_sl4e, mfn_t sl4mfn)
+{
+    int flags = 0;
+    shadow_l4e_t old_sl4e;
+    paddr_t paddr;
+
+    ASSERT(sl4e != NULL);
+    old_sl4e = *sl4e;
+
+    if ( old_sl4e.l4 == new_sl4e.l4 ) return 0; /* Nothing to do */
+
+    paddr = mfn_to_maddr(sl4mfn) | PAGE_OFFSET(sl4e);
+
+    if ( shadow_l4e_get_flags(new_sl4e) & _PAGE_PRESENT )
+    {
+        /* About to install a new reference */
+        mfn_t sl3mfn = shadow_l4e_get_mfn(new_sl4e);
+
+        if ( !sh_get_ref(d, sl3mfn, paddr) )
+        {
+            domain_crash(d);
+            return SHADOW_SET_ERROR;
+        }
+
+        /* Are we pinning l3 shadows to handle weird Linux behaviour? */
+        if ( sh_type_is_pinnable(d, SH_type_l3_64_shadow) )
+            sh_pin(d, sl3mfn);
+    }
+
+    /* Write the new entry */
+    shadow_write_entries(sl4e, &new_sl4e, 1, sl4mfn);
+    flush_root_pgtbl_domain(d);
+
+    flags |= SHADOW_SET_CHANGED;
+
+    if ( shadow_l4e_get_flags(old_sl4e) & _PAGE_PRESENT )
+    {
+        /* We lost a reference to an old mfn. */
+        mfn_t osl3mfn = shadow_l4e_get_mfn(old_sl4e);
+
+        if ( !mfn_eq(osl3mfn, shadow_l4e_get_mfn(new_sl4e)) ||
+             !perms_strictly_increased(shadow_l4e_get_flags(old_sl4e),
+                                       shadow_l4e_get_flags(new_sl4e)) )
+            flags |= SHADOW_SET_FLUSH;
+
+        sh_put_ref(d, osl3mfn, paddr);
+    }
+
+    return flags;
+}
+
+int shadow_set_l3e(struct domain *d, shadow_l3e_t *sl3e,
+                   shadow_l3e_t new_sl3e, mfn_t sl3mfn)
+{
+    int flags = 0;
+    shadow_l3e_t old_sl3e;
+    paddr_t paddr;
+
+    ASSERT(sl3e != NULL);
+    old_sl3e = *sl3e;
+
+    if ( old_sl3e.l3 == new_sl3e.l3 ) return 0; /* Nothing to do */
+
+    paddr = mfn_to_maddr(sl3mfn) | PAGE_OFFSET(sl3e);
+
+    if ( shadow_l3e_get_flags(new_sl3e) & _PAGE_PRESENT )
+    {
+        /* About to install a new reference */
+        if ( !sh_get_ref(d, shadow_l3e_get_mfn(new_sl3e), paddr) )
+        {
+            domain_crash(d);
+            return SHADOW_SET_ERROR;
+        }
+    }
+
+    /* Write the new entry */
+    shadow_write_entries(sl3e, &new_sl3e, 1, sl3mfn);
+    flags |= SHADOW_SET_CHANGED;
+
+    if ( shadow_l3e_get_flags(old_sl3e) & _PAGE_PRESENT )
+    {
+        /* We lost a reference to an old mfn. */
+        mfn_t osl2mfn = shadow_l3e_get_mfn(old_sl3e);
+
+        if ( !mfn_eq(osl2mfn, shadow_l3e_get_mfn(new_sl3e)) ||
+             !perms_strictly_increased(shadow_l3e_get_flags(old_sl3e),
+                                       shadow_l3e_get_flags(new_sl3e)) )
+            flags |= SHADOW_SET_FLUSH;
+
+        sh_put_ref(d, osl2mfn, paddr);
+    }
+
+    return flags;
+}
+
+int shadow_set_l2e(struct domain *d, shadow_l2e_t *sl2e,
+                   shadow_l2e_t new_sl2e, mfn_t sl2mfn,
+                   unsigned int type_fl1_shadow,
+                   mfn_t (*next_page)(mfn_t smfn))
+{
+    int flags = 0;
+    shadow_l2e_t old_sl2e;
+    paddr_t paddr;
+    /*
+     * In 2-on-3 we work with pairs of l2es pointing at two-page
+     * shadows.  Reference counting and up-pointers track from the first
+     * page of the shadow to the first l2e, so make sure that we're
+     * working with those:
+     * Start with a pair of identical entries.
+     */
+    shadow_l2e_t pair[2] = { new_sl2e, new_sl2e };
+
+    if ( next_page )
+    {
+        /* Align the pointer down so it's pointing at the first of the pair */
+        sl2e = (shadow_l2e_t *)((unsigned long)sl2e & ~sizeof(shadow_l2e_t));
+    }
+
+    ASSERT(sl2e != NULL);
+    old_sl2e = *sl2e;
+
+    if ( old_sl2e.l2 == new_sl2e.l2 ) return 0; /* Nothing to do */
+
+    paddr = mfn_to_maddr(sl2mfn) | PAGE_OFFSET(sl2e);
+
+    if ( shadow_l2e_get_flags(new_sl2e) & _PAGE_PRESENT )
+    {
+        mfn_t sl1mfn = shadow_l2e_get_mfn(new_sl2e);
+        ASSERT(mfn_to_page(sl1mfn)->u.sh.head);
+
+        /* About to install a new reference */
+        if ( !sh_get_ref(d, sl1mfn, paddr) )
+        {
+            domain_crash(d);
+            return SHADOW_SET_ERROR;
+        }
+
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
+        {
+            struct page_info *sp = mfn_to_page(sl1mfn);
+            mfn_t gl1mfn;
+
+            ASSERT(sp->u.sh.head);
+            gl1mfn = backpointer(sp);
+            /*
+             * If the shadow is a fl1 then the backpointer contains the
+             * GFN instead of the GMFN, and it's definitely not OOS.
+             */
+            if ( (sp->u.sh.type != type_fl1_shadow) && mfn_valid(gl1mfn)
+                 && mfn_is_out_of_sync(gl1mfn) )
+                sh_resync(d, gl1mfn);
+        }
+#endif
+
+        if ( next_page )
+        {
+            /* Update the second entry to point to the second half of the l1 */
+            sl1mfn = next_page(sl1mfn);
+            pair[1] = shadow_l2e_from_mfn(sl1mfn,
+                                          shadow_l2e_get_flags(new_sl2e));
+        }
+    }
+
+    /* Write the new entry / entries */
+    shadow_write_entries(sl2e, &pair, !next_page ? 1 : 2, sl2mfn);
+
+    flags |= SHADOW_SET_CHANGED;
+
+    if ( shadow_l2e_get_flags(old_sl2e) & _PAGE_PRESENT )
+    {
+        /* We lost a reference to an old mfn. */
+        mfn_t osl1mfn = shadow_l2e_get_mfn(old_sl2e);
+
+        if ( !mfn_eq(osl1mfn, shadow_l2e_get_mfn(new_sl2e)) ||
+             !perms_strictly_increased(shadow_l2e_get_flags(old_sl2e),
+                                       shadow_l2e_get_flags(new_sl2e)) )
+            flags |= SHADOW_SET_FLUSH;
+
+        sh_put_ref(d, osl1mfn, paddr);
+    }
+
+    return flags;
+}
+
+int shadow_set_l1e(struct domain *d, shadow_l1e_t *sl1e,
+                   shadow_l1e_t new_sl1e, p2m_type_t new_type,
+                   mfn_t sl1mfn)
+{
+    int flags = 0;
+    shadow_l1e_t old_sl1e;
+    unsigned int old_sl1f;
+#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
+    mfn_t new_gmfn = shadow_l1e_get_mfn(new_sl1e);
+#endif
+
+    ASSERT(sl1e != NULL);
+
+#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
+    if ( mfn_valid(new_gmfn) && mfn_oos_may_write(new_gmfn) &&
+         ((shadow_l1e_get_flags(new_sl1e) & (_PAGE_RW | _PAGE_PRESENT)) ==
+          (_PAGE_RW | _PAGE_PRESENT)) )
+        oos_fixup_add(d, new_gmfn, sl1mfn, pgentry_ptr_to_slot(sl1e));
+#endif
+
+    old_sl1e = *sl1e;
+
+    if ( old_sl1e.l1 == new_sl1e.l1 ) return 0; /* Nothing to do */
+
+    if ( (shadow_l1e_get_flags(new_sl1e) & _PAGE_PRESENT) &&
+         !sh_l1e_is_magic(new_sl1e) )
+    {
+        /* About to install a new reference */
+        if ( shadow_mode_refcounts(d) )
+        {
+#define PAGE_FLIPPABLE (_PAGE_RW | _PAGE_PWT | _PAGE_PCD | _PAGE_PAT)
+            int rc;
+
+            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_GET_REF);
+            switch ( rc = shadow_get_page_from_l1e(new_sl1e, d, new_type) )
+            {
+            default:
+                /* Doesn't look like a pagetable. */
+                flags |= SHADOW_SET_ERROR;
+                new_sl1e = shadow_l1e_empty();
+                break;
+            case PAGE_FLIPPABLE & -PAGE_FLIPPABLE ... PAGE_FLIPPABLE:
+                ASSERT(!(rc & ~PAGE_FLIPPABLE));
+                new_sl1e = shadow_l1e_flip_flags(new_sl1e, rc);
+                /* fall through */
+            case 0:
+                shadow_vram_get_mfn(shadow_l1e_get_mfn(new_sl1e),
+                                    shadow_l1e_get_flags(new_sl1e),
+                                    sl1mfn, sl1e, d);
+                break;
+            }
+#undef PAGE_FLIPPABLE
+        }
+    }
+
+    /* Write the new entry */
+    shadow_write_entries(sl1e, &new_sl1e, 1, sl1mfn);
+    flags |= SHADOW_SET_CHANGED;
+
+    old_sl1f = shadow_l1e_get_flags(old_sl1e);
+    if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
+         shadow_mode_refcounts(d) )
+    {
+        /*
+         * We lost a reference to an old mfn.
+         *
+         * N.B. Unlike higher-level sets, never need an extra flush when
+         * writing an l1e.  Because it points to the same guest frame as the
+         * guest l1e did, it's the guest's responsibility to trigger a flush
+         * later.
+         */
+        shadow_vram_put_mfn(shadow_l1e_get_mfn(old_sl1e), old_sl1f,
+                            sl1mfn, sl1e, d);
+        shadow_put_page_from_l1e(old_sl1e, d);
+        TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_SHADOW_L1_PUT_REF);
+    }
+
+    return flags;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -24,8 +24,8 @@
 
 /* The number of levels in the shadow pagetable is entirely determined
  * by the number of levels in the guest pagetable */
-#if GUEST_PAGING_LEVELS == 4
-#define SHADOW_PAGING_LEVELS 4
+#if GUEST_PAGING_LEVELS != 2
+#define SHADOW_PAGING_LEVELS GUEST_PAGING_LEVELS
 #else
 #define SHADOW_PAGING_LEVELS 3
 #endif
@@ -43,7 +43,7 @@
 #define SHADOW_L1_PAGETABLE_SHIFT        12
 #define SHADOW_L2_PAGETABLE_SHIFT        21
 #define SHADOW_L3_PAGETABLE_SHIFT        30
-#else /* SHADOW_PAGING_LEVELS == 4 */
+#elif SHADOW_PAGING_LEVELS == 4
 #define SHADOW_L1_PAGETABLE_ENTRIES     512
 #define SHADOW_L2_PAGETABLE_ENTRIES     512
 #define SHADOW_L3_PAGETABLE_ENTRIES     512
@@ -58,9 +58,7 @@
 typedef l1_pgentry_t shadow_l1e_t;
 typedef l2_pgentry_t shadow_l2e_t;
 typedef l3_pgentry_t shadow_l3e_t;
-#if SHADOW_PAGING_LEVELS >= 4
 typedef l4_pgentry_t shadow_l4e_t;
-#endif
 
 /* Access functions for them */
 static inline paddr_t shadow_l1e_get_paddr(shadow_l1e_t sl1e)
@@ -69,10 +67,8 @@ static inline paddr_t shadow_l2e_get_pad
 { return l2e_get_paddr(sl2e); }
 static inline paddr_t shadow_l3e_get_paddr(shadow_l3e_t sl3e)
 { return l3e_get_paddr(sl3e); }
-#if SHADOW_PAGING_LEVELS >= 4
 static inline paddr_t shadow_l4e_get_paddr(shadow_l4e_t sl4e)
 { return l4e_get_paddr(sl4e); }
-#endif
 
 static inline mfn_t shadow_l1e_get_mfn(shadow_l1e_t sl1e)
 { return l1e_get_mfn(sl1e); }
@@ -80,10 +76,8 @@ static inline mfn_t shadow_l2e_get_mfn(s
 { return l2e_get_mfn(sl2e); }
 static inline mfn_t shadow_l3e_get_mfn(shadow_l3e_t sl3e)
 { return l3e_get_mfn(sl3e); }
-#if SHADOW_PAGING_LEVELS >= 4
 static inline mfn_t shadow_l4e_get_mfn(shadow_l4e_t sl4e)
 { return l4e_get_mfn(sl4e); }
-#endif
 
 static inline u32 shadow_l1e_get_flags(shadow_l1e_t sl1e)
 { return l1e_get_flags(sl1e); }
@@ -91,10 +85,8 @@ static inline u32 shadow_l2e_get_flags(s
 { return l2e_get_flags(sl2e); }
 static inline u32 shadow_l3e_get_flags(shadow_l3e_t sl3e)
 { return l3e_get_flags(sl3e); }
-#if SHADOW_PAGING_LEVELS >= 4
 static inline u32 shadow_l4e_get_flags(shadow_l4e_t sl4e)
 { return l4e_get_flags(sl4e); }
-#endif
 
 static inline shadow_l1e_t
 shadow_l1e_remove_flags(shadow_l1e_t sl1e, u32 flags)
@@ -109,10 +101,8 @@ static inline shadow_l2e_t shadow_l2e_em
 { return l2e_empty(); }
 static inline shadow_l3e_t shadow_l3e_empty(void)
 { return l3e_empty(); }
-#if SHADOW_PAGING_LEVELS >= 4
 static inline shadow_l4e_t shadow_l4e_empty(void)
 { return l4e_empty(); }
-#endif
 
 static inline shadow_l1e_t shadow_l1e_from_mfn(mfn_t mfn, u32 flags)
 { return l1e_from_mfn(mfn, flags); }
@@ -120,10 +110,8 @@ static inline shadow_l2e_t shadow_l2e_fr
 { return l2e_from_mfn(mfn, flags); }
 static inline shadow_l3e_t shadow_l3e_from_mfn(mfn_t mfn, u32 flags)
 { return l3e_from_mfn(mfn, flags); }
-#if SHADOW_PAGING_LEVELS >= 4
 static inline shadow_l4e_t shadow_l4e_from_mfn(mfn_t mfn, u32 flags)
 { return l4e_from_mfn(mfn, flags); }
-#endif
 
 #define shadow_l1_table_offset(a) l1_table_offset(a)
 #define shadow_l2_table_offset(a) l2_table_offset(a)
@@ -208,7 +196,7 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define SH_type_fl1_shadow SH_type_fl1_pae_shadow
 #define SH_type_l2_shadow  SH_type_l2_pae_shadow
 #define SH_type_l2h_shadow SH_type_l2h_pae_shadow
-#else
+#elif GUEST_PAGING_LEVELS == 4
 #define SH_type_l1_shadow  SH_type_l1_64_shadow
 #define SH_type_fl1_shadow SH_type_fl1_64_shadow
 #define SH_type_l2_shadow  SH_type_l2_64_shadow
@@ -217,6 +205,8 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define SH_type_l4_shadow  SH_type_l4_64_shadow
 #endif
 
+#if GUEST_PAGING_LEVELS
+
 /* macros for dealing with the naming of the internal function names of the
  * shadow code's external entry points.
  */
@@ -262,6 +252,8 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define sh_rm_write_access_from_sl1p INTERNAL_NAME(sh_rm_write_access_from_sl1p)
 #endif
 
+#endif /* GUEST_PAGING_LEVELS */
+
 #if SHADOW_PAGING_LEVELS == 3
 #define MFN_FITS_IN_HVM_CR3(_MFN) !(mfn_x(_MFN) >> 20)
 #endif
@@ -270,6 +262,26 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define SH_PRI_gpte PRI_gpte
 #define SH_PRI_gfn  PRI_gfn
 
+int shadow_set_l1e(struct domain *d, shadow_l1e_t *sl1e,
+                   shadow_l1e_t new_sl1e, p2m_type_t new_type,
+                   mfn_t sl1mfn);
+int shadow_set_l2e(struct domain *d, shadow_l2e_t *sl2e,
+                   shadow_l2e_t new_sl2e, mfn_t sl2mfn,
+                   unsigned int type_fl1_shadow,
+                   mfn_t (*next_page)(mfn_t smfn));
+int shadow_set_l3e(struct domain *d, shadow_l3e_t *sl3e,
+                   shadow_l3e_t new_sl3e, mfn_t sl3mfn);
+int shadow_set_l4e(struct domain *d, shadow_l4e_t *sl4e,
+                   shadow_l4e_t new_sl4e, mfn_t sl4mfn);
+
+static void inline
+shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
+{
+    if ( !shadow_mode_refcounts(d) )
+        return;
+
+    put_page_from_l1e(sl1e, d);
+}
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
 /******************************************************************************


