Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005FCA05FDB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867487.1279072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpv-0001X0-L4; Wed, 08 Jan 2025 15:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867487.1279072; Wed, 08 Jan 2025 15:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpv-0001UP-G9; Wed, 08 Jan 2025 15:19:11 +0000
Received: by outflank-mailman (input) for mailman id 867487;
 Wed, 08 Jan 2025 15:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpu-0008Ue-IL
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:10 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e82d12c0-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:09 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa692211331so197245766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:09 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:07 -0800 (PST)
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
X-Inumbo-ID: e82d12c0-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349548; x=1736954348; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw7mWXVpCJfQ9bvcjiyKZM3RdMlwMcvwWhT8eTvVn6U=;
        b=gUNxLztGT+XuBuLXeJ9Y+muSqTAx9oG17WmI1QGVAMJ5mrCDqqjn/7kKVyNFDVIJ29
         8wihzLbT9umRID8q2SfEcUHZIR+8BTI0tD8a+BbK86ZeO1ZiHUch4X773ENOj7R4lfwA
         mydv2YzQ0WCNANOEADXSgPpGpR6sPTIr9QOok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349548; x=1736954348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw7mWXVpCJfQ9bvcjiyKZM3RdMlwMcvwWhT8eTvVn6U=;
        b=SE1qVMkjSoaUscFxYV6HA0bCx8DIL1KAQQsBRZ7HC71GXqjlrgR6j64estYN9mEqDW
         NntetsQtlSJlfF5lxbYxLkXwWE7WbGwTP1/KhIQHA7dETNUGJJr2nxArYPTmWkofQ4H3
         CH4eDx1pj/DYiR2bCnzDna497O/lWKs1plj78I5bVzHeSfJaJdEpAprDiHS+hsX0H7uc
         qimBI96vXi3LoU7aTqZ4UYI6AAWmb2PEeeV9XM3AGzK1vy1GVSAjoa1aoWAcmfdJiEbe
         T4oMdEn2qEHwgfggdQa1f1YqD2Av9hG+6o51qAWUCTxmuSeFd/dDhF5g9afu3rr3t1DJ
         CMtQ==
X-Gm-Message-State: AOJu0YxsoiGaNL92kpM4ekLPUFtsH+H7bUTSIxF+7ZGpaT6wXfgodHUd
	/LvwuqJwUgBpbHobVNUXwZKRN2T9WqnYVTT0Q/9dy/l5ON07HCqv/00ZBnmDRa71IZwsnYYlNxd
	nA/gImQ==
X-Gm-Gg: ASbGncu2cSnrP3zpgNxieNy8MxmbThKDbP/f9kyk5ENh8Q2V2m/xN7XdhRLzDoe4A44
	NM+aHcv1veXiOJOZtBBovVJxtobGNSW/uNn+5/IbOPhCyiN1cCzmT1oYpKvC20Y9n4w2c0Ncj5D
	vDgzKFUKrTcuWRQuX2HOhQcurszOrXJHjjtihORhyAHT+MIOBNSS33RZS6F+09YSmIewvDj+h9/
	KcOg+e9QWA8ojyrADlITDh33yteavBYpzzSIiAwoFGnnLUx/4A6+z9YsPnb2cLlP/Eo8UQEUscJ
	EwY=
X-Google-Smtp-Source: AGHT+IHSHfjOlGcCZmim3Gu0rKS/1nvYqcoEGDp9YfwIaOq2RV4Rfts5cwCxRuUXRYrl6NitiJ0QjA==
X-Received: by 2002:a17:907:2d0e:b0:aa6:945c:4531 with SMTP id a640c23a62f3a-ab2a79d1d18mr240135266b.7.1736349548147;
        Wed, 08 Jan 2025 07:19:08 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 07/15] x86/domain_page: Remove the fast paths when mfn is not in the directmap
Date: Wed,  8 Jan 2025 15:18:14 +0000
Message-ID: <20250108151822.16030-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

When mfn is not in direct map, never use mfn_to_virt for any mappings.

We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
arch_mfns_in_direct_map(mfn, 1) because these two are equivalent. The
extra comparison in arch_mfns_in_direct_map() looks different but
because
DIRECTMAP_VIRT_END is always higher, it does not make any difference.

Lastly, domain_page_map_to_mfn() needs to gain to a special case for
the PMAP.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * s/BUILD_BUG_ON/ASSERT/, or it won't build with gcc11.
  * Add CONFIG_HAS_PMAP guards as needed so the code builds without PMAP
  * Fix typos on 2 arch_mfns_in_directmap() calls in release config.

v3->v4:
  * Introduce helper functions virt_is_fixmap and virt_in_fixmap_range

Changes since Hongyan's version:
  * arch_mfn_in_direct_map() was renamed to arch_mfns_in_directmap()
  * add a special case for the PMAP in domain_page_map_to_mfn()
---
 xen/arch/x86/domain_page.c        | 60 +++++++++++++++++++++++++------
 xen/arch/x86/include/asm/fixmap.h | 25 +++++++++++++
 2 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 55e337aaf703..9582bd63b5c3 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -14,8 +14,10 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 #include <asm/current.h>
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
+#include <asm/pmap.h>
 #include <asm/setup.h>
 
 static DEFINE_PER_CPU(struct vcpu *, override);
@@ -24,6 +26,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
 {
     /* In the common case we use the mapcache of the running VCPU. */
     struct vcpu *v = this_cpu(override) ?: current;
+    struct vcpu *idle_v = idle_vcpu[smp_processor_id()];
 
     /*
      * When current isn't properly set up yet, this is equivalent to
@@ -35,10 +38,11 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     /*
      * When using efi runtime page tables, we have the equivalent of the idle
      * domain's page tables but current may point at another domain's VCPU.
-     * Return NULL as though current is not properly set up yet.
+     * Return the idle domains's vcpu on that core because the efi per-domain
+     * region (where the mapcache is) is in-sync with the idle domain.
      */
     if ( efi_rs_using_pgtables() )
-        return NULL;
+        return idle_v;
 
     /*
      * If guest_table is NULL, and we are running a paravirtualised guest,
@@ -48,7 +52,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     if ( unlikely(pagetable_is_null(v->arch.guest_table)) && is_pv_vcpu(v) )
     {
         /* If we really are idling, perform lazy context switch now. */
-        if ( (v = idle_vcpu[smp_processor_id()]) == current )
+        if ( (v = idle_v) == current )
             sync_local_execstate();
         /* We must now be running on the idle page table. */
         ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
@@ -77,18 +81,28 @@ void *map_domain_page(mfn_t mfn)
     struct vcpu_maphash_entry *hashent;
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v )
-        return mfn_to_virt(mfn_x(mfn));
+    if ( !v || !v->domain->arch.mapcache.inuse )
+    {
+        if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
+            return mfn_to_virt(mfn_x(mfn));
+        else
+        {
+#ifdef CONFIG_HAS_PMAP
+            BUG_ON(system_state >= SYS_STATE_smp_boot);
+            return pmap_map(mfn);
+#else
+            BUG();
+#endif
+        }
+    }
 
     dcache = &v->domain->arch.mapcache;
     vcache = &v->arch.mapcache;
-    if ( !dcache->inuse )
-        return mfn_to_virt(mfn_x(mfn));
 
     perfc_incr(map_domain_page_count);
 
@@ -184,6 +198,14 @@ void unmap_domain_page(const void *ptr)
     if ( !va || va >= DIRECTMAP_VIRT_START )
         return;
 
+#ifdef CONFIG_HAS_PMAP
+    if ( virt_is_fixmap(va) )
+    {
+        pmap_unmap(ptr);
+        return;
+    }
+#endif
+
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
@@ -237,7 +259,7 @@ int mapcache_domain_init(struct domain *d)
     unsigned int bitmap_pages;
 
 #ifdef NDEBUG
-    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( !mem_hotplug && arch_mfns_in_directmap(0, max_page) )
         return 0;
 #endif
 
@@ -308,7 +330,7 @@ void *map_domain_page_global(mfn_t mfn)
             local_irq_is_enabled()));
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
@@ -335,6 +357,24 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
     if ( va >= DIRECTMAP_VIRT_START )
         return _mfn(virt_to_mfn(ptr));
 
+#ifdef CONFIG_HAS_PMAP
+    /*
+     * The fixmap is stealing the top-end of the VMAP. So the check for
+     * the PMAP *must* happen first.
+     *
+     * Also, the fixmap translate a slot to an address backwards. The
+     * logic will rely on it to avoid any complexity. So check at
+     * compile time this will always hold.
+     */
+    ASSERT(fix_to_virt(FIX_PMAP_BEGIN) > fix_to_virt(FIX_PMAP_END));
+
+    if ( virt_in_fixmap_range(va, FIX_PMAP_BEGIN, FIX_PMAP_END) )
+    {
+        BUG_ON(system_state >= SYS_STATE_smp_boot);
+        return l1e_get_mfn(l1_fixmap[l1_table_offset(va)]);
+    }
+#endif /* CONFIG_HAS_PMAP */
+
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
         return vmap_to_mfn(va);
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 80b7b74fd816..381c95a8b11f 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -101,6 +101,31 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
     return __virt_to_fix(vaddr);
 }
 
+static inline bool virt_is_fixmap(const unsigned long vaddr)
+{
+    return vaddr >= FIXADDR_START && vaddr < FIXADDR_TOP;
+}
+
+static inline bool virt_in_fixmap_range(
+    const unsigned long vaddr,
+    const unsigned int start_idx,
+    const unsigned int end_idx
+)
+{
+    unsigned long start_addr = (unsigned long)fix_to_virt(start_idx);
+    unsigned long end_addr = (unsigned long)fix_to_virt(end_idx);
+
+    /*
+     * The check ensures that the virtual address (vaddr) is within the
+     * fixmap range. The addresses are allocated backwards, meaning the
+     * start address is higher than the end address. As a result, the
+     * check ensures that the virtual address is greater than or equal to
+     * the end address, and less than or equal to the start address, which
+     * may appear counterintuitive due to the reverse allocation order.
+     */
+    return ((vaddr & PAGE_MASK) <= start_addr) && (vaddr >= end_addr);
+}
+
 enum fixed_addresses_x {
     /* Index 0 is reserved since fix_x_to_virt(0) == FIXADDR_X_TOP. */
     FIX_X_RESERVED,
-- 
2.47.1


