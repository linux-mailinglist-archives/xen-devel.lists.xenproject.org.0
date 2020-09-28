Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4427AD62
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:58:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrn2-0002x9-64; Mon, 28 Sep 2020 11:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrn0-0002we-Gw
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:57:54 +0000
X-Inumbo-ID: 577f2d44-d1c7-4b54-b211-be9e32fcbe5c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 577f2d44-d1c7-4b54-b211-be9e32fcbe5c;
 Mon, 28 Sep 2020 11:57:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMjlTXNVUK9Q8xMcARf6seWXrEPUeqF2zl55c0rhfsI=;
 b=tOypIizi5iMUWfTW2KeCiEKQWooAvPLzc8Bql0ZMIwFV5bcY6dPurH2g+ruvPdsMGi6Lgt
 bHPeF6UQrNvq197g2xJAWhOvUSr4/6Fk30exYRoLAyALeq8dPbBblJkfSZva5cdvSRkA0j
 tYNHZDIZZXS7EKuqxofsE8rBbAoPkXc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B20FAC97;
 Mon, 28 Sep 2020 11:57:52 +0000 (UTC)
Subject: [PATCH 1/2] x86/mm: {paging, sh}_{cmpxchg, write}_guest_entry() cannot
 fault
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
Message-ID: <2bec3291-08c6-8457-426c-6c9462ef1173@suse.com>
Date: Mon, 28 Sep 2020 13:57:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As of 2d0557c5cbeb ("x86: Fold page_info lock into type_info") we
haven't been updating guest page table entries through linear page
tables anymore. All updates have been using domain mappings since then.
Drop the use of guest/user access helpers there, and hence also the
boolean return values of the involved functions.

update_intpte(), otoh, gets its boolean return type retained for now,
as we may want to bound the CMPXCHG retry loop, indicating failure to
the caller instead when the retry threshold got exceeded.

With this {,__}cmpxchg_user() become unused, so they too get dropped.
(In fact, dropping them was the motivation of making the change.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4033,8 +4033,8 @@ long do_mmu_update(
 
                 case PGT_writable_page:
                     perfc_incr(writable_mmu_updates);
-                    if ( paging_write_guest_entry(v, va, req.val, mfn) )
-                        rc = 0;
+                    paging_write_guest_entry(v, va, req.val, mfn);
+                    rc = 0;
                     break;
                 }
                 page_unlock(page);
@@ -4044,9 +4044,9 @@ long do_mmu_update(
             else if ( get_page_type(page, PGT_writable_page) )
             {
                 perfc_incr(writable_mmu_updates);
-                if ( paging_write_guest_entry(v, va, req.val, mfn) )
-                    rc = 0;
+                paging_write_guest_entry(v, va, req.val, mfn);
                 put_page_type(page);
+                rc = 0;
             }
 
             put_page(page);
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -396,9 +396,9 @@ int shadow_write_p2m_entry(struct p2m_do
                            unsigned int level);
 
 /* Functions that atomically write PV guest PT entries */
-bool sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new,
+void sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new,
                           mfn_t gmfn);
-bool sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t *old,
+void sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t *old,
                             intpte_t new, mfn_t gmfn);
 
 /* Update all the things that are derived from the guest's CR0/CR3/CR4.
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -26,43 +26,35 @@
 
 /*
  * Write a new value into the guest pagetable, and update the shadows
- * appropriately.  Returns false if we page-faulted, true for success.
+ * appropriately.
  */
-bool
+void
 sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
 {
-    unsigned int failed;
-
     paging_lock(v->domain);
-    failed = __copy_to_user(p, &new, sizeof(new));
-    if ( failed != sizeof(new) )
-        sh_validate_guest_entry(v, gmfn, p, sizeof(new));
+    write_atomic(p, new);
+    sh_validate_guest_entry(v, gmfn, p, sizeof(new));
     paging_unlock(v->domain);
-
-    return !failed;
 }
 
 /*
  * Cmpxchg a new value into the guest pagetable, and update the shadows
- * appropriately. Returns false if we page-faulted, true if not.
+ * appropriately.
  * N.B. caller should check the value of "old" to see if the cmpxchg itself
  * was successful.
  */
-bool
+void
 sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t *old,
                        intpte_t new, mfn_t gmfn)
 {
-    bool failed;
-    intpte_t t = *old;
+    intpte_t t;
 
     paging_lock(v->domain);
-    failed = cmpxchg_user(p, t, new);
+    t = cmpxchg(p, *old, new);
     if ( t == *old )
         sh_validate_guest_entry(v, gmfn, p, sizeof(new));
     *old = t;
     paging_unlock(v->domain);
-
-    return !failed;
 }
 
 /*
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -43,9 +43,7 @@ static inline bool update_intpte(intpte_
 
 #ifndef PTE_UPDATE_WITH_CMPXCHG
     if ( !preserve_ad )
-    {
-        rv = paging_write_guest_entry(v, p, new, mfn);
-    }
+        paging_write_guest_entry(v, p, new, mfn);
     else
 #endif
     {
@@ -58,14 +56,7 @@ static inline bool update_intpte(intpte_
             if ( preserve_ad )
                 _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
 
-            rv = paging_cmpxchg_guest_entry(v, p, &t, _new, mfn);
-            if ( unlikely(rv == 0) )
-            {
-                gdprintk(XENLOG_WARNING,
-                         "Failed to update %" PRIpte " -> %" PRIpte
-                         ": saw %" PRIpte "\n", old, _new, t);
-                break;
-            }
+            paging_cmpxchg_guest_entry(v, p, &t, _new, mfn);
 
             if ( t == old )
                 break;
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -168,10 +168,9 @@ static int ptwr_emulated_update(unsigned
     if ( p_old )
     {
         ol1e = l1e_from_intpte(old);
-        if ( !paging_cmpxchg_guest_entry(v, &l1e_get_intpte(*pl1e),
-                                         &old, l1e_get_intpte(nl1e), mfn) )
-            ret = X86EMUL_UNHANDLEABLE;
-        else if ( l1e_get_intpte(ol1e) == old )
+        paging_cmpxchg_guest_entry(v, &l1e_get_intpte(*pl1e), &old,
+                                   l1e_get_intpte(nl1e), mfn);
+        if ( l1e_get_intpte(ol1e) == old )
             ret = X86EMUL_OKAY;
         else
         {
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -96,9 +96,9 @@ struct shadow_paging_mode {
 #ifdef CONFIG_SHADOW_PAGING
     void          (*detach_old_tables     )(struct vcpu *v);
 #ifdef CONFIG_PV
-    bool          (*write_guest_entry     )(struct vcpu *v, intpte_t *p,
+    void          (*write_guest_entry     )(struct vcpu *v, intpte_t *p,
                                             intpte_t new, mfn_t gmfn);
-    bool          (*cmpxchg_guest_entry   )(struct vcpu *v, intpte_t *p,
+    void          (*cmpxchg_guest_entry   )(struct vcpu *v, intpte_t *p,
                                             intpte_t *old, intpte_t new,
                                             mfn_t gmfn);
 #endif
@@ -324,15 +324,15 @@ static inline void paging_update_paging_
  * paging-assistance state appropriately.  Returns false if we page-faulted,
  * true for success.
  */
-static inline bool paging_write_guest_entry(
+static inline void paging_write_guest_entry(
     struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
 {
 #ifdef CONFIG_SHADOW_PAGING
     if ( unlikely(paging_mode_shadow(v->domain)) && paging_get_hostmode(v) )
-        return paging_get_hostmode(v)->shadow.write_guest_entry(v, p, new,
-                                                                gmfn);
+        paging_get_hostmode(v)->shadow.write_guest_entry(v, p, new, gmfn);
+    else
 #endif
-    return !__copy_to_user(p, &new, sizeof(new));
+        write_atomic(p, new);
 }
 
 
@@ -342,15 +342,16 @@ static inline bool paging_write_guest_en
  * true if not.  N.B. caller should check the value of "old" to see if the
  * cmpxchg itself was successful.
  */
-static inline bool paging_cmpxchg_guest_entry(
+static inline void paging_cmpxchg_guest_entry(
     struct vcpu *v, intpte_t *p, intpte_t *old, intpte_t new, mfn_t gmfn)
 {
 #ifdef CONFIG_SHADOW_PAGING
     if ( unlikely(paging_mode_shadow(v->domain)) && paging_get_hostmode(v) )
-        return paging_get_hostmode(v)->shadow.cmpxchg_guest_entry(v, p, old,
-                                                                  new, gmfn);
+        paging_get_hostmode(v)->shadow.cmpxchg_guest_entry(v, p, old,
+                                                           new, gmfn);
+    else
 #endif
-    return !cmpxchg_user(p, *old, new);
+        *old = cmpxchg(p, *old, new);
 }
 
 #endif /* CONFIG_PV */
--- a/xen/include/asm-x86/x86_64/system.h
+++ b/xen/include/asm-x86/x86_64/system.h
@@ -59,47 +59,4 @@ static always_inline __uint128_t cmpxchg
     __cmpxchg16b(_p, (void *)(o), (void *)(n));            \
 })
 
-/*
- * This function causes value _o to be changed to _n at location _p.
- * If this access causes a fault then we return 1, otherwise we return 0.
- * If no fault occurs then _o is updated to the value we saw at _p. If this
- * is the same as the initial value of _o then _n is written to location _p.
- */
-#define __cmpxchg_user(_p, _o, _n, _oppre, _regtype)                    \
-    stac();                                                             \
-    asm volatile (                                                      \
-        "1: lock cmpxchg %"_oppre"[new], %[ptr]\n"                      \
-        "2:\n"                                                          \
-        ".section .fixup,\"ax\"\n"                                      \
-        "3:     movl $1, %[rc]\n"                                       \
-        "       jmp 2b\n"                                               \
-        ".previous\n"                                                   \
-        _ASM_EXTABLE(1b, 3b)                                            \
-        : "+a" (_o), [rc] "=r" (_rc),                                   \
-          [ptr] "+m" (*(volatile typeof(*(_p)) *)(_p))                  \
-        : [new] _regtype (_n), "[rc]" (0)                               \
-        : "memory");                                                    \
-    clac()
-
-#define cmpxchg_user(_p, _o, _n)                                        \
-({                                                                      \
-    int _rc;                                                            \
-    switch ( sizeof(*(_p)) )                                            \
-    {                                                                   \
-    case 1:                                                             \
-        __cmpxchg_user(_p, _o, _n, "b", "q");                           \
-        break;                                                          \
-    case 2:                                                             \
-        __cmpxchg_user(_p, _o, _n, "w", "r");                           \
-        break;                                                          \
-    case 4:                                                             \
-        __cmpxchg_user(_p, _o, _n, "k", "r");                           \
-        break;                                                          \
-    case 8:                                                             \
-        __cmpxchg_user(_p, _o, _n, "q", "r");                           \
-        break;                                                          \
-    }                                                                   \
-    _rc;                                                                \
-})
-
 #endif /* __X86_64_SYSTEM_H__ */


