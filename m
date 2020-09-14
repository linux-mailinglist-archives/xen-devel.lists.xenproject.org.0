Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D452268B22
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:39:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnky-0001cB-Sr; Mon, 14 Sep 2020 12:38:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnkx-0001c4-OK
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:38:51 +0000
X-Inumbo-ID: 94a86a6e-5948-4a54-bb1c-d32a59a50556
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94a86a6e-5948-4a54-bb1c-d32a59a50556;
 Mon, 14 Sep 2020 12:38:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 296B4AC79;
 Mon, 14 Sep 2020 12:39:05 +0000 (UTC)
Subject: [PATCH 1/3] x86/shim: fix build with PV_SHIM_EXCLUSIVE and
 SHADOW_PAGING
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Message-ID: <3ddb9adf-22b5-9196-1f3c-7cb3cafd08dd@suse.com>
Date: Mon, 14 Sep 2020 14:38:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
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

While there's little point in enabling both, the combination ought to at
least build correctly. Drop the direct PV_SHIM_EXCLUSIVE conditionals
and instead zap PG_log_dirty to zero under the right conditions, and key
other #ifdef-s off of that.

While there also expand on ded576ce07e9 ("x86/shadow: dirty VRAM
tracking is needed for HVM only"): There was yet another is_hvm_domain()
missing, and code touching the struct fields needs to be guarded by
suitable #ifdef-s as well. While there also guard shadow-mode-only
fields accordingly.

Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -47,7 +47,7 @@
 /* Per-CPU variable for enforcing the lock ordering */
 DEFINE_PER_CPU(int, mm_lock_level);
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if PG_log_dirty
 
 /************************************************/
 /*              LOG DIRTY SUPPORT               */
@@ -630,7 +630,7 @@ void paging_log_dirty_init(struct domain
     d->arch.paging.log_dirty.ops = ops;
 }
 
-#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
+#endif /* PG_log_dirty */
 
 /************************************************/
 /*           CODE FOR PAGING SUPPORT            */
@@ -671,7 +671,7 @@ void paging_vcpu_init(struct vcpu *v)
         shadow_vcpu_init(v);
 }
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if PG_log_dirty
 int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
                   bool_t resuming)
@@ -792,7 +792,7 @@ long paging_domctl_continuation(XEN_GUES
 
     return ret;
 }
-#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
+#endif /* PG_log_dirty */
 
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
@@ -808,7 +808,7 @@ int paging_teardown(struct domain *d)
     if ( preempted )
         return -ERESTART;
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if PG_log_dirty
     /* clean up log dirty resources. */
     rc = paging_free_log_dirty_bitmap(d, 0);
     if ( rc == -ERESTART )
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2869,12 +2869,14 @@ void shadow_teardown(struct domain *d, b
      * calls now that we've torn down the bitmap */
     d->arch.paging.mode &= ~PG_log_dirty;
 
-    if ( d->arch.hvm.dirty_vram )
+#ifdef CONFIG_HVM
+    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram )
     {
         xfree(d->arch.hvm.dirty_vram->sl1ma);
         xfree(d->arch.hvm.dirty_vram->dirty_bitmap);
         XFREE(d->arch.hvm.dirty_vram);
     }
+#endif
 
 out:
     paging_unlock(d);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -618,6 +618,7 @@ _sh_propagate(struct vcpu *v,
         }
     }
 
+#ifdef CONFIG_HVM
     if ( unlikely(level == 1) && is_hvm_domain(d) )
     {
         struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
@@ -632,6 +633,7 @@ _sh_propagate(struct vcpu *v,
                 sflags &= ~_PAGE_RW;
         }
     }
+#endif
 
     /* Read-only memory */
     if ( p2m_is_readonly(p2mt) )
@@ -1050,6 +1052,7 @@ static inline void shadow_vram_get_l1e(s
                                        mfn_t sl1mfn,
                                        struct domain *d)
 {
+#ifdef CONFIG_HVM
     mfn_t mfn = shadow_l1e_get_mfn(new_sl1e);
     int flags = shadow_l1e_get_flags(new_sl1e);
     unsigned long gfn;
@@ -1074,6 +1077,7 @@ static inline void shadow_vram_get_l1e(s
             dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn)
                 | ((unsigned long)sl1e & ~PAGE_MASK);
     }
+#endif
 }
 
 static inline void shadow_vram_put_l1e(shadow_l1e_t old_sl1e,
@@ -1081,6 +1085,7 @@ static inline void shadow_vram_put_l1e(s
                                        mfn_t sl1mfn,
                                        struct domain *d)
 {
+#ifdef CONFIG_HVM
     mfn_t mfn = shadow_l1e_get_mfn(old_sl1e);
     int flags = shadow_l1e_get_flags(old_sl1e);
     unsigned long gfn;
@@ -1140,6 +1145,7 @@ static inline void shadow_vram_put_l1e(s
             dirty_vram->last_dirty = NOW();
         }
     }
+#endif
 }
 
 static int shadow_set_l1e(struct domain *d,
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -67,8 +67,12 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
+#if defined(CONFIG_HVM) || !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
+#else
+#define PG_log_dirty   0
+#endif
 
 /* All paging modes. */
 #define PG_MASK (PG_refcounts | PG_log_dirty | PG_translate | PG_external)
@@ -154,7 +158,7 @@ struct paging_mode {
 /*****************************************************************************
  * Log dirty code */
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if PG_log_dirty
 
 /* get the dirty bitmap for a specific range of pfns */
 void paging_log_dirty_range(struct domain *d,
@@ -195,23 +199,28 @@ int paging_mfn_is_dirty(struct domain *d
 #define L4_LOGDIRTY_IDX(pfn) ((pfn_x(pfn) >> (PAGE_SHIFT + 3 + PAGETABLE_ORDER * 2)) & \
                               (LOGDIRTY_NODE_ENTRIES-1))
 
+#ifdef CONFIG_HVM
 /* VRAM dirty tracking support */
 struct sh_dirty_vram {
     unsigned long begin_pfn;
     unsigned long end_pfn;
+#ifdef CONFIG_SHADOW_PAGING
     paddr_t *sl1ma;
     uint8_t *dirty_bitmap;
     s_time_t last_dirty;
+#endif
 };
+#endif
 
-#else /* !CONFIG_PV_SHIM_EXCLUSIVE */
+#else /* !PG_log_dirty */
 
 static inline void paging_log_dirty_init(struct domain *d,
                                          const struct log_dirty_ops *ops) {}
 static inline void paging_mark_dirty(struct domain *d, mfn_t gmfn) {}
 static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn) {}
+static inline bool paging_mfn_is_dirty(struct domain *d, mfn_t gmfn) { return false; }
 
-#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
+#endif /* PG_log_dirty */
 
 /*****************************************************************************
  * Entry points into the paging-assistance code */


