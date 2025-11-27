Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F6C8E837
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173862.1498895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDv-00005G-F8; Thu, 27 Nov 2025 13:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173862.1498895; Thu, 27 Nov 2025 13:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDv-0008Uw-9s; Thu, 27 Nov 2025 13:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1173862;
 Thu, 27 Nov 2025 13:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Jd/=6D=bounce.vates.tech=bounce-md_30504962.6928549c.v1-897f1b0f3cc9476bbc66273a31b5f427@srs-se1.protection.inumbo.net>)
 id 1vOcDu-0007Up-5u
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:39:50 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 867eee1a-cb96-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 14:39:41 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHHbc4WVMzFCWZCF
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 13:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 897f1b0f3cc9476bbc66273a31b5f427; Thu, 27 Nov 2025 13:39:40 +0000
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
X-Inumbo-ID: 867eee1a-cb96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764250780; x=1764520780;
	bh=yswA3ZDBM5q5MzkWxrEy6kOfycOHTyLWCOT8Yu26TcI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GP/iVu34HSmQVMC52SZ5f3Q2i5gyxAog82cFeaO4yIEm/FaBM5/NEHut1sBGjhxs7
	 g0XQnVF1KWEzmHRNNo0101fEUMzUSSCoQchdyi38cfiDBJsauSW3HBTT6jZMV3xz3u
	 9kW184sV2wpYnbwlAk4tp8y8IxJT+LR3+j4GWMBaj+iezQxA/YBpMeJxhl/8PFOQYD
	 kMa0OY//kMZnZdUv3xy2kFLqIi4Jewu99QtfUGKAC1sRjb8tbZxjbszM9Te2oKsqk2
	 5e57WR5AWHDmKK3TU3kBRfJCFtYFuHumSWSEuCsMmQ+nWI6jBUEgxm2weZN1vULacE
	 ayfJoyux3wi+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764250780; x=1764511280; i=teddy.astie@vates.tech;
	bh=yswA3ZDBM5q5MzkWxrEy6kOfycOHTyLWCOT8Yu26TcI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ted7GNUN+JueXRxfGHT257KAhJ8SjeQ++Xo/J4zqNJ0VbM3QEC8KN1PNdACVeQael
	 sjp46DAzr1B84glSqTOkZ8yJr78i2UnNWkGCOZvFwEhH9/M1CsbzkXxbXZZW9/fbjI
	 zEYb3cqpF6dxas6NDhB3V8Xd/uPEo18CiuKbgFJSsNDKjYa8sKPoA6z95f/b+5xG4w
	 wObeiWmpdq76XPL3JGdvKURDfpMI6uwgyuYfw7MyWtXm0yCMt+ceg9N/yD6TgcpnRe
	 P5FYJtq5Rwc85BK/mY7IvmhIVsVINqQNQmndD6gJ+Kog9gZvJi15Gt9lPe7CWSuGv5
	 ClqLiFKpjW4dQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/4]=20x86/shadow:=20Replace=20guest=5Ftlb=5Fflush=5Fmask=20with=20sh=5Fflush=5Ftlb=5Fmask?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764250779739
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Tim Deegan" <tim@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <0e8e2607de4f484e7eb37d64799bfc53a56d3fa9.1764248710.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1764248710.git.teddy.astie@vates.tech>
References: <cover.1764248710.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.897f1b0f3cc9476bbc66273a31b5f427?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 13:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce sh_flush_tlb_{mask,local} variants used to flush the
tlb from within the shadow paging code. This is meant to decouple
shadow code from the more general guest_tlb_flush_mask.

Not a functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/mm/shadow/common.c  | 12 ++++++------
 xen/arch/x86/mm/shadow/hvm.c     |  8 ++++----
 xen/arch/x86/mm/shadow/multi.c   | 18 ++++++------------
 xen/arch/x86/mm/shadow/private.h | 22 ++++++++++++++++++++++
 4 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9..8511da5c7f 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -421,7 +421,7 @@ static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
     }
 
     if ( ftlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
 
     return 0;
 }
@@ -969,7 +969,7 @@ static bool __must_check _shadow_prealloc(struct domain *d, unsigned int pages)
                 /* See if that freed up enough space */
                 if ( d->arch.paging.free_pages >= pages )
                 {
-                    guest_flush_tlb_mask(d, d->dirty_cpumask);
+                    sh_flush_tlb_mask(d, d->dirty_cpumask);
                     return true;
                 }
             }
@@ -984,7 +984,7 @@ static bool __must_check _shadow_prealloc(struct domain *d, unsigned int pages)
 
     ASSERT_UNREACHABLE();
 
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
+    sh_flush_tlb_mask(d, d->dirty_cpumask);
 
     return false;
 }
@@ -1052,7 +1052,7 @@ void shadow_blow_tables(struct domain *d)
                     0);
 
     /* Make sure everyone sees the unshadowings */
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
+    sh_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 void shadow_blow_tables_per_domain(struct domain *d)
@@ -1157,7 +1157,7 @@ mfn_t shadow_alloc(struct domain *d,
         if ( unlikely(!cpumask_empty(&mask)) )
         {
             perfc_incr(shadow_alloc_tlbflush);
-            guest_flush_tlb_mask(d, &mask);
+            sh_flush_tlb_mask(d, &mask);
         }
         /* Now safe to clear the page for reuse */
         clear_domain_page(page_to_mfn(sp));
@@ -2276,7 +2276,7 @@ void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all)
 
     /* Need to flush TLBs now, so that linear maps are safe next time we
      * take a fault. */
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
+    sh_flush_tlb_mask(d, d->dirty_cpumask);
 
     paging_unlock(d);
 }
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1..b558ed82e8 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -594,7 +594,7 @@ static void validate_guest_pt_write(struct vcpu *v, mfn_t gmfn,
 
     if ( rc & SHADOW_SET_FLUSH )
         /* Need to flush TLBs to pick up shadow PT changes */
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
 
     if ( rc & SHADOW_SET_ERROR )
     {
@@ -744,7 +744,7 @@ bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
     }
 
     /* Flush TLBs on all CPUs with dirty vcpu state. */
-    guest_flush_tlb_mask(d, mask);
+    sh_flush_tlb_mask(d, mask);
 
     /* Done. */
     for_each_vcpu ( d, v )
@@ -978,7 +978,7 @@ static void cf_check sh_unshadow_for_p2m_change(
     }
 
     if ( flush )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
@@ -1196,7 +1196,7 @@ int shadow_track_dirty_vram(struct domain *d,
         }
     }
     if ( flush_tlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
     goto out;
 
  out_sl1ma:
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 03be61e225..3924ff4da6 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -79,12 +79,6 @@ const char *const fetch_type_names[] = {
 # define for_each_shadow_table(v, i) for ( (i) = 0; (i) < 1; ++(i) )
 #endif
 
-/* Helper to perform a local TLB flush. */
-static void sh_flush_local(const struct domain *d)
-{
-    flush_local(guest_flush_tlb_flags(d));
-}
-
 #if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
 #define ASSERT_VALID_L2(t) \
     ASSERT((t) == SH_type_l2_shadow || (t) == SH_type_l2h_shadow)
@@ -2429,7 +2423,7 @@ static int cf_check sh_page_fault(
         perfc_incr(shadow_rm_write_flush_tlb);
         smp_wmb();
         atomic_inc(&d->arch.paging.shadow.gtable_dirty_version);
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
     }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
@@ -3243,7 +3237,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
      * (old) shadow linear maps in the writeable mapping heuristics. */
 #if GUEST_PAGING_LEVELS == 4
     if ( sh_remove_write_access(d, gmfn, 4, 0) != 0 )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
     old_entry = sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow,
                                        sh_make_shadow);
     if ( unlikely(pagetable_is_null(v->arch.paging.shadow.shadow_table[0])) )
@@ -3284,7 +3278,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
             }
         }
         if ( flush )
-            guest_flush_tlb_mask(d, d->dirty_cpumask);
+            sh_flush_tlb_mask(d, d->dirty_cpumask);
         /* Now install the new shadows. */
         for ( i = 0; i < 4; i++ )
         {
@@ -3309,7 +3303,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
     }
 #elif GUEST_PAGING_LEVELS == 2
     if ( sh_remove_write_access(d, gmfn, 2, 0) != 0 )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
     old_entry = sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow,
                                        sh_make_shadow);
     ASSERT(pagetable_is_null(old_entry));
@@ -3747,7 +3741,7 @@ static void cf_check sh_pagetable_dying(paddr_t gpa)
         }
     }
     if ( flush )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
 
     /* Remember that we've seen the guest use this interface, so we
      * can rely on it using it in future, instead of guessing at
@@ -3786,7 +3780,7 @@ static void cf_check sh_pagetable_dying(paddr_t gpa)
         mfn_to_page(gmfn)->pagetable_dying = true;
         shadow_unhook_mappings(d, smfn, 1/* user pages only */);
         /* Now flush the TLB: we removed toplevel mappings. */
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+        sh_flush_tlb_mask(d, d->dirty_cpumask);
     }
 
     /* Remember that we've seen the guest use this interface, so we
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index cef9dbef2e..565a334bc0 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -15,6 +15,7 @@
 // been included...
 #include <asm/page.h>
 #include <xen/domain_page.h>
+#include <asm/flushtlb.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/support.h>
 #include <asm/atomic.h>
@@ -910,6 +911,27 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
              ((count & PGC_allocated) ? 1 : 0) );
 }
 
+/* Helper to perform a local TLB flush. */
+static inline void sh_flush_local(const struct domain *d)
+{
+    unsigned int flags = FLUSH_TLB;
+
+    if ( is_hvm_domain(d) )
+        flags |= FLUSH_HVM_ASID_CORE;
+
+    flush_local(flags);
+}
+
+static inline void sh_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
+{
+    unsigned int flags = FLUSH_TLB;
+
+    if ( is_hvm_domain(d) )
+        flags |= FLUSH_HVM_ASID_CORE;
+
+    flush_mask(mask, flags);
+}
+
 /* Flush the TLB of the selected vCPUs. */
 bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap);
 
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


