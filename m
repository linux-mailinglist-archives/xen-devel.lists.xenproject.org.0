Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244293D63D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765594.1176280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN1q-0000tH-My; Fri, 26 Jul 2024 15:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765594.1176280; Fri, 26 Jul 2024 15:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN1q-0000qs-Jg; Fri, 26 Jul 2024 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 765594;
 Fri, 26 Jul 2024 15:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvR-00084Z-Jz
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:09 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35cb5aff-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:32:04 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6b7a4668f07so4077776d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:04 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fb0c4dfsm17369086d6.140.2024.07.26.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:02 -0700 (PDT)
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
X-Inumbo-ID: 35cb5aff-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007923; x=1722612723; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsXOcQaVUMQAqctB3o7fFiw3e+HWymJDiLOCUlhSRAY=;
        b=dxuAy7gHDzDH/KVGGpPHLFEyUE9iFudZgosm4OFWPZefJShPK/rq2p7YtytyGlY5QC
         ZUZfyhqqKX+24y2yv24yP34xMIlfHTq+hOuVRnDjRw+X/lpjA65HiJtOtOjBL4Tmwem7
         CumZNIqyMqkTAsmSkxp5Ex9Iqhe5hSe6FStt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007923; x=1722612723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsXOcQaVUMQAqctB3o7fFiw3e+HWymJDiLOCUlhSRAY=;
        b=ukQL6x9ixnTKAZxk7txarR4WHFDwUiYKrare8Pl66CM/6mZ74g/AL17qNTrXlqZBe9
         BSSDzcJebRkSJvuc4tcRCiWC4k0Ap+nyZI2+VAI6j67+nz28kIxl57pdUHPfx0brpSwl
         iwYAkiOJC/t6DK8f2iVCENraMJ/Tlrf1/gPnIbIS3HTx0psBSnBJy6AW1XluVTYeN7Ba
         to9wjCsh7ychPSua1gkcodMfQBk84X7FwbBVwbNmpFxykjAVBpv4HIcmtHYp2gJC6NRy
         JwCcX+1bhgalfLbm1nvOlrsdZHlq8heZsV+aPi0FTXrl52hJNC6ItBwUiZoScNanNWeH
         EizQ==
X-Gm-Message-State: AOJu0Yx9n4M3H8/TsJTqFr8Gk3za3VNyO8S49T29UV1nc/y4hv8HUbMv
	CVJPZ8/dB5OGiwYoC1tdEsUHdnHPCsu3Ee9GknNIqujMGz90pS8Gz150tGL87F931mD8AiI0M65
	q
X-Google-Smtp-Source: AGHT+IEcDXOgS0ArbTo0uiVXKSfjiaRnNuncKiibiDiIX5cVaz+XagHjF/5offdpuLLIGr5eCJgaFA==
X-Received: by 2002:a05:6214:1d2e:b0:6b7:42aa:3358 with SMTP id 6a1803df08f44-6bb55a7cb75mr1693526d6.31.1722007923280;
        Fri, 26 Jul 2024 08:32:03 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 17/22] x86/mm: introduce support to populate a per-CPU page-table region
Date: Fri, 26 Jul 2024 17:22:01 +0200
Message-ID: <20240726152206.28411-18-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add logic in map_pages_to_xen() and modify_xen_mappings() so that TLB flushes
are only performed locally when dealing with entries in the per-CPU area of the
page-tables.

No functional change intended, as there are no callers added that create or
modify per-CPU mappings, nor is the per-CPU area still properly setup in
the page-tables yet.

Note that the removed flush_area() ended up calling flush_area_mask() through
the flush_area_all() alias.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/config.h   |  4 ++
 xen/arch/x86/include/asm/flushtlb.h |  1 -
 xen/arch/x86/mm.c                   | 64 +++++++++++++++++++----------
 3 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 2a260a2581fd..c24d735a0cee 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -204,6 +204,10 @@ extern unsigned char boot_edid_info[128];
 #define PERDOMAIN_SLOTS         3
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
+#define PERCPU_VIRT_START       PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS)
+#define PERCPU_SLOTS            1
+#define PERCPU_VIRT_SLOT(s)     (PERCPU_VIRT_START + (s) * \
+                                 (PERDOMAIN_SLOT_MBYTES << 20))
 /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
 #define PERDOMAIN_ALT_VIRT_START PML4_ADDR(4)
 /* Slot 261: machine-to-phys conversion table (256GB). */
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 1b98d03decdc..affe944d1a5b 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -146,7 +146,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
 
 /* Flush all CPUs' TLBs/caches */
-#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
 #define flush_all(flags) flush_mask(&cpu_online_map, flags)
 
 /* Flush local TLBs */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1367f3361ffe..c468b46a9d1b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5023,9 +5023,13 @@ static DEFINE_SPINLOCK(map_pgdir_lock);
  */
 static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
 {
+    unsigned int cpu = smp_processor_id();
+    /* Called before idle_vcpu is populated, fallback to idle_pg_table. */
+    root_pgentry_t *root_pgt = idle_vcpu[cpu] ?
+        maddr_to_virt(idle_vcpu[cpu]->arch.cr3) : idle_pg_table;
     l4_pgentry_t *pl4e;
 
-    pl4e = &idle_pg_table[l4_table_offset(v)];
+    pl4e = &root_pgt[l4_table_offset(v)];
     if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
@@ -5138,8 +5142,8 @@ static l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
 #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
 
-/* flush_area_all() can be used prior to any other CPU being online.  */
-#define flush_area(v, f) flush_area_all((const void *)(v), f)
+/* flush_area_mask() can be used prior to any other CPU being online.  */
+#define flush_area_mask(m, v, f) flush_area_mask(m, (const void *)(v), f)
 
 #define L3T_INIT(page) (page) = ZERO_BLOCK_PTR
 
@@ -5222,7 +5226,11 @@ int map_pages_to_xen(
     unsigned long nr_mfns,
     unsigned int flags)
 {
-    bool locking = system_state > SYS_STATE_boot;
+    bool global = virt < PERCPU_VIRT_START ||
+                  virt >= PERCPU_VIRT_SLOT(PERCPU_SLOTS);
+    bool locking = system_state > SYS_STATE_boot && global;
+    const cpumask_t *flush_mask = global ? &cpu_online_map
+                                         : cpumask_of(smp_processor_id());
     l3_pgentry_t *pl3e = NULL, ol3e;
     l2_pgentry_t *pl2e = NULL, ol2e;
     l1_pgentry_t *pl1e, ol1e;
@@ -5244,6 +5252,11 @@ int map_pages_to_xen(
     }                                          \
 } while (0)
 
+    /* Ensure it's a global mapping or it's only modifying the per-CPU area. */
+    ASSERT(global ||
+           (virt + nr_mfns * PAGE_SIZE >= PERCPU_VIRT_START &&
+            virt + nr_mfns * PAGE_SIZE <  PERCPU_VIRT_SLOT(PERCPU_SLOTS)));
+
     L3T_INIT(current_l3page);
 
     while ( nr_mfns != 0 )
@@ -5278,7 +5291,7 @@ int map_pages_to_xen(
                 if ( l3e_get_flags(ol3e) & _PAGE_PSE )
                 {
                     flush_flags(lNf_to_l1f(l3e_get_flags(ol3e)));
-                    flush_area(virt, flush_flags);
+                    flush_area_mask(flush_mask, virt, flush_flags);
                 }
                 else
                 {
@@ -5301,7 +5314,7 @@ int map_pages_to_xen(
                             unmap_domain_page(l1t);
                         }
                     }
-                    flush_area(virt, flush_flags);
+                    flush_area_mask(flush_mask, virt, flush_flags);
                     for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                     {
                         ol2e = l2t[i];
@@ -5373,7 +5386,7 @@ int map_pages_to_xen(
             }
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
-            flush_area(virt, flush_flags);
+            flush_area_mask(flush_mask, virt, flush_flags);
 
             free_xen_pagetable(l2mfn);
         }
@@ -5399,7 +5412,7 @@ int map_pages_to_xen(
                 if ( l2e_get_flags(ol2e) & _PAGE_PSE )
                 {
                     flush_flags(lNf_to_l1f(l2e_get_flags(ol2e)));
-                    flush_area(virt, flush_flags);
+                    flush_area_mask(flush_mask, virt, flush_flags);
                 }
                 else
                 {
@@ -5407,7 +5420,7 @@ int map_pages_to_xen(
 
                     for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                         flush_flags(l1e_get_flags(l1t[i]));
-                    flush_area(virt, flush_flags);
+                    flush_area_mask(flush_mask, virt, flush_flags);
                     unmap_domain_page(l1t);
                     free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
@@ -5476,7 +5489,7 @@ int map_pages_to_xen(
                 }
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(virt, flush_flags);
+                flush_area_mask(flush_mask, virt, flush_flags);
 
                 free_xen_pagetable(l1mfn);
             }
@@ -5491,7 +5504,7 @@ int map_pages_to_xen(
                 unsigned int flush_flags = FLUSH_TLB | FLUSH_ORDER(0);
 
                 flush_flags(l1e_get_flags(ol1e));
-                flush_area(virt, flush_flags);
+                flush_area_mask(flush_mask, virt, flush_flags);
             }
 
             virt    += 1UL << L1_PAGETABLE_SHIFT;
@@ -5540,9 +5553,9 @@ int map_pages_to_xen(
                     l2e_write(pl2e, l2e_from_pfn(base_mfn, l1f_to_lNf(flags)));
                     if ( locking )
                         spin_unlock(&map_pgdir_lock);
-                    flush_area(virt - PAGE_SIZE,
-                               FLUSH_TLB_GLOBAL |
-                               FLUSH_ORDER(PAGETABLE_ORDER));
+                    flush_area_mask(flush_mask, virt - PAGE_SIZE,
+                                    FLUSH_TLB_GLOBAL |
+                                    FLUSH_ORDER(PAGETABLE_ORDER));
                     free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
@@ -5589,9 +5602,9 @@ int map_pages_to_xen(
                 l3e_write(pl3e, l3e_from_pfn(base_mfn, l1f_to_lNf(flags)));
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(virt - PAGE_SIZE,
-                           FLUSH_TLB_GLOBAL |
-                           FLUSH_ORDER(2*PAGETABLE_ORDER));
+                flush_area_mask(flush_mask, virt - PAGE_SIZE,
+                                FLUSH_TLB_GLOBAL |
+                                FLUSH_ORDER(2*PAGETABLE_ORDER));
                 free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
@@ -5629,7 +5642,11 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  */
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
-    bool locking = system_state > SYS_STATE_boot;
+    bool global = s < PERCPU_VIRT_START ||
+                  s >= PERCPU_VIRT_SLOT(PERCPU_SLOTS);
+    bool locking = system_state > SYS_STATE_boot && global;
+    const cpumask_t *flush_mask = global ? &cpu_online_map
+                                         : cpumask_of(smp_processor_id());
     l3_pgentry_t *pl3e = NULL;
     l2_pgentry_t *pl2e = NULL;
     l1_pgentry_t *pl1e;
@@ -5638,6 +5655,9 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     int rc = -ENOMEM;
     struct page_info *current_l3page;
 
+    ASSERT(global ||
+           (e >= PERCPU_VIRT_START && e < PERCPU_VIRT_SLOT(PERCPU_SLOTS)));
+
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     nf &= FLAGS_MASK;
@@ -5836,7 +5856,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 l2e_write(pl2e, l2e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
+                /* flush before free */
+                flush_area_mask(flush_mask, NULL, FLUSH_TLB_GLOBAL);
                 free_xen_pagetable(l1mfn);
             }
             else if ( locking )
@@ -5880,7 +5901,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 l3e_write(pl3e, l3e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
+                /* flush before free */
+                flush_area_mask(flush_mask, NULL, FLUSH_TLB_GLOBAL);
                 free_xen_pagetable(l2mfn);
             }
             else if ( locking )
@@ -5888,7 +5910,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         }
     }
 
-    flush_area(NULL, FLUSH_TLB_GLOBAL);
+    flush_area_mask(flush_mask, NULL, FLUSH_TLB_GLOBAL);
 
 #undef FLAGS_MASK
     rc = 0;
-- 
2.45.2


