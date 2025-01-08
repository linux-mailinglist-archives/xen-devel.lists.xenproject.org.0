Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7FA05EF9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867373.1278921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXEc-0005pW-LA; Wed, 08 Jan 2025 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867373.1278921; Wed, 08 Jan 2025 14:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXEc-0005n3-He; Wed, 08 Jan 2025 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 867373;
 Wed, 08 Jan 2025 14:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX55-0005q4-C1
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24368c75-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:43 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso1765083a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:43 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d8f51faaf8sm10072954a12.2.2025.01.08.06.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:39 -0800 (PST)
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
X-Inumbo-ID: 24368c75-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346642; x=1736951442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNW32bRT/EB8JAJJfIqWa3rkLwjG5D4hxKX8BxasRVQ=;
        b=brsXOagBDLHHKXlIhNM2KPDkBHOYrBomVeB8Q6VksbMumv/LzaaVL/fqOWxN+v3ZAQ
         ZpX/bBO8wIk1qT5sWu7NXNWUYn6tGKyL/WfE9h46Ec4CIgkhVeBB+/NpuG/xA0x0Ivjg
         qpqEcepUvCk7tPvvlzIFmv7gZlYmgPfQvTZ8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346642; x=1736951442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNW32bRT/EB8JAJJfIqWa3rkLwjG5D4hxKX8BxasRVQ=;
        b=niU71F66EZ6S6hrzvbVRsI0I9Iw5de5YZ2sDyaAUPVpM1D0HXZuaPkI+RQy9RHMhO8
         7UDhGWTwBvis3lMDJtYNQkOmFe7YwHRtUkwk+jr50eJMDdkMstH+4L/GqrdRvwuDIzG/
         pG8ZOxXmSSDyBCYimAp4Y1n8c/GMsoeib5hLwgg4c+z2t8575hjak+0pXdjUIEQ/QjxN
         4/alAX4Qodg7yCc7EbAbR5RSzZI8xrCfNn4J7tM7eXb0Q3tFVEaRapSxlYlOtlHiWEYQ
         eLSjht0THiQic4yfLS7qdMrXLIRYJqHt3LH2R0MLEoGvPmtgikcwF9/OQHryrvRrxBIs
         5khA==
X-Gm-Message-State: AOJu0YwONCq0hN6pd8Ee8m8ExbUVVkF4AEHym7LQ22jEJ/Seht4rrpGB
	vp38YN2UY1PxTC7hVTbCGk2inWsOef8EYvSqffr39wxgvHpU7o6CbHYTbytzVIEMfJayKRgNJpN
	a
X-Gm-Gg: ASbGncv+Otc4t48zwtKeYWvQDsdmKnMKGS0UO5y3cxbU7mF7fw9SJL2aJJ5CujDvAHS
	rEAIHfc3dqlBCEtFBaf+Ucv2qmonMP2RtDdKzYl9TAFe0fFCeyMzPQn+6XzwVQ9o6s/R+hYc06C
	9fNkP1D8k5m1td2u7d5OZZU3+XSS6dGa8BUOOo3Y7XmhyUm1bJonj/ybDyvkW1EzlUg+9ogfqZ0
	UVdtefEs9wIqzW5Zzyr6agj8VFuyRLEfgQCzxu4Vb3ad+4Ug1n0Sm3F4X20NclVmlE=
X-Google-Smtp-Source: AGHT+IEqQIaGeMfOrrMGbsRVv/X76nyH1yi83H5076IXDviKZPheR28xONW6k7grUF1jnqGwq4MnkQ==
X-Received: by 2002:a05:6402:40c6:b0:5d9:6633:8e9b with SMTP id 4fb4d7f45d1cf-5d971b30399mr3065185a12.1.1736346640359;
        Wed, 08 Jan 2025 06:30:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when using ASI
Date: Wed,  8 Jan 2025 15:26:55 +0100
Message-ID: <20250108142659.99490-16-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using a unique per-vCPU root page table the per-domain region becomes
per-vCPU, and hence the mapcache is no longer shared between all vCPUs of a
domain.  Introduce per-vCPU mapcache structures, and modify map_domain_page()
to create per-vCPU mappings when possible.  Note the lock is also not needed
with using per-vCPU map caches, as the structure is no longer shared.

This introduces some duplication in the domain and vcpu structures, as both
contain a mapcache field to support running with and without per-vCPU
page-tables.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain_page.c        | 90 ++++++++++++++++++++-----------
 xen/arch/x86/include/asm/domain.h | 20 ++++---
 2 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 1372be20224e..65900d6218f8 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -74,7 +74,9 @@ void *map_domain_page(mfn_t mfn)
     struct vcpu *v;
     struct mapcache_domain *dcache;
     struct mapcache_vcpu *vcache;
+    struct mapcache *cache;
     struct vcpu_maphash_entry *hashent;
+    struct domain *d;
 
 #ifdef NDEBUG
     if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
@@ -85,9 +87,12 @@ void *map_domain_page(mfn_t mfn)
     if ( !v || !is_pv_vcpu(v) )
         return mfn_to_virt(mfn_x(mfn));
 
-    dcache = &v->domain->arch.pv.mapcache;
+    d = v->domain;
+    dcache = &d->arch.pv.mapcache;
     vcache = &v->arch.pv.mapcache;
-    if ( !dcache->inuse )
+    cache = d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
+                            : &d->arch.pv.mapcache.cache;
+    if ( !cache->inuse )
         return mfn_to_virt(mfn_x(mfn));
 
     perfc_incr(map_domain_page_count);
@@ -98,17 +103,18 @@ void *map_domain_page(mfn_t mfn)
     if ( hashent->mfn == mfn_x(mfn) )
     {
         idx = hashent->idx;
-        ASSERT(idx < dcache->entries);
+        ASSERT(idx < cache->entries);
         hashent->refcnt++;
         ASSERT(hashent->refcnt);
         ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
         goto out;
     }
 
-    spin_lock(&dcache->lock);
+    if ( !d->arch.vcpu_pt )
+        spin_lock(&dcache->lock);
 
     /* Has some other CPU caused a wrap? We must flush if so. */
-    if ( unlikely(dcache->epoch != vcache->shadow_epoch) )
+    if ( unlikely(!d->arch.vcpu_pt && dcache->epoch != vcache->shadow_epoch) )
     {
         vcache->shadow_epoch = dcache->epoch;
         if ( NEED_FLUSH(this_cpu(tlbflush_time), dcache->tlbflush_timestamp) )
@@ -118,21 +124,21 @@ void *map_domain_page(mfn_t mfn)
         }
     }
 
-    idx = find_next_zero_bit(dcache->inuse, dcache->entries, dcache->cursor);
-    if ( unlikely(idx >= dcache->entries) )
+    idx = find_next_zero_bit(cache->inuse, cache->entries, cache->cursor);
+    if ( unlikely(idx >= cache->entries) )
     {
         unsigned long accum = 0, prev = 0;
 
         /* /First/, clean the garbage map and update the inuse list. */
-        for ( i = 0; i < BITS_TO_LONGS(dcache->entries); i++ )
+        for ( i = 0; i < BITS_TO_LONGS(cache->entries); i++ )
         {
             accum |= prev;
-            dcache->inuse[i] &= ~xchg(&dcache->garbage[i], 0);
-            prev = ~dcache->inuse[i];
+            cache->inuse[i] &= ~xchg(&cache->garbage[i], 0);
+            prev = ~cache->inuse[i];
         }
 
-        if ( accum | (prev & BITMAP_LAST_WORD_MASK(dcache->entries)) )
-            idx = find_first_zero_bit(dcache->inuse, dcache->entries);
+        if ( accum | (prev & BITMAP_LAST_WORD_MASK(cache->entries)) )
+            idx = find_first_zero_bit(cache->inuse, cache->entries);
         else
         {
             /* Replace a hash entry instead. */
@@ -152,19 +158,23 @@ void *map_domain_page(mfn_t mfn)
                     i = 0;
             } while ( i != MAPHASH_HASHFN(mfn_x(mfn)) );
         }
-        BUG_ON(idx >= dcache->entries);
+        BUG_ON(idx >= cache->entries);
 
         /* /Second/, flush TLBs. */
         perfc_incr(domain_page_tlb_flush);
         flush_tlb_local();
-        vcache->shadow_epoch = ++dcache->epoch;
-        dcache->tlbflush_timestamp = tlbflush_current_time();
+        if ( !d->arch.vcpu_pt )
+        {
+            vcache->shadow_epoch = ++dcache->epoch;
+            dcache->tlbflush_timestamp = tlbflush_current_time();
+        }
     }
 
-    set_bit(idx, dcache->inuse);
-    dcache->cursor = idx + 1;
+    set_bit(idx, cache->inuse);
+    cache->cursor = idx + 1;
 
-    spin_unlock(&dcache->lock);
+    if ( !d->arch.vcpu_pt )
+        spin_unlock(&dcache->lock);
 
     l1e_write(&MAPCACHE_L1ENT(idx), l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
 
@@ -178,6 +188,7 @@ void unmap_domain_page(const void *ptr)
     unsigned int idx;
     struct vcpu *v;
     struct mapcache_domain *dcache;
+    struct mapcache *cache;
     unsigned long va = (unsigned long)ptr, mfn, flags;
     struct vcpu_maphash_entry *hashent;
 
@@ -190,7 +201,9 @@ void unmap_domain_page(const void *ptr)
     ASSERT(v && is_pv_vcpu(v));
 
     dcache = &v->domain->arch.pv.mapcache;
-    ASSERT(dcache->inuse);
+    cache = v->domain->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
+                                    : &v->domain->arch.pv.mapcache.cache;
+    ASSERT(cache->inuse);
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
@@ -213,7 +226,7 @@ void unmap_domain_page(const void *ptr)
                    hashent->mfn);
             l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
             /* /Second/, mark as garbage. */
-            set_bit(hashent->idx, dcache->garbage);
+            set_bit(hashent->idx, cache->garbage);
         }
 
         /* Add newly-freed mapping to the maphash. */
@@ -225,7 +238,7 @@ void unmap_domain_page(const void *ptr)
         /* /First/, zap the PTE. */
         l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
         /* /Second/, mark as garbage. */
-        set_bit(idx, dcache->garbage);
+        set_bit(idx, cache->garbage);
     }
 
     local_irq_restore(flags);
@@ -234,7 +247,6 @@ void unmap_domain_page(const void *ptr)
 void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
-    unsigned int bitmap_pages;
 
     ASSERT(is_pv_domain(d));
 
@@ -243,13 +255,12 @@ void mapcache_domain_init(struct domain *d)
         return;
 #endif
 
+    if ( d->arch.vcpu_pt )
+        return;
+
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
                  2 * PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long))) >
                  MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20));
-    bitmap_pages = PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
-    dcache->inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
-    dcache->garbage = dcache->inuse +
-                      (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
 
     spin_lock_init(&dcache->lock);
 }
@@ -258,30 +269,45 @@ int mapcache_vcpu_init(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
+    struct mapcache *cache;
     unsigned long i;
-    unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
+    unsigned int ents = (d->arch.vcpu_pt ? 1 : d->max_vcpus) *
+                        MAPCACHE_VCPU_ENTRIES;
     unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
 
-    if ( !is_pv_vcpu(v) || !dcache->inuse )
+    if ( !is_pv_vcpu(v) )
         return 0;
 
-    if ( ents > dcache->entries )
+    cache = d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
+                            : &dcache->cache;
+
+    if ( !cache->inuse )
+        return 0;
+
+    if ( ents > cache->entries )
     {
         /* Populate page tables. */
         int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents, false);
+        const unsigned int bitmap_pages =
+            PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
+
+        cache->inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
+        cache->garbage = cache->inuse +
+                         (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
+
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)cache->inuse,
                                           nr, true);
         if ( !rc )
-            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)cache->garbage,
                                           nr, true);
 
         if ( rc )
             return rc;
 
-        dcache->entries = ents;
+        cache->entries = ents;
     }
 
     /* Mark all maphash entries as not in use. */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5bf0ad3fdcf7..ba5440099d90 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -41,6 +41,16 @@ struct trap_bounce {
     unsigned long eip;
 };
 
+struct mapcache {
+    /* The number of array entries, and a cursor into the array. */
+    unsigned int entries;
+    unsigned int cursor;
+
+    /* Which mappings are in use, and which are garbage to reap next epoch? */
+    unsigned long *inuse;
+    unsigned long *garbage;
+};
+
 #define MAPHASH_ENTRIES 8
 #define MAPHASH_HASHFN(pfn) ((pfn) & (MAPHASH_ENTRIES-1))
 #define MAPHASHENT_NOTINUSE ((u32)~0U)
@@ -54,13 +64,11 @@ struct mapcache_vcpu {
         uint32_t      idx;
         uint32_t      refcnt;
     } hash[MAPHASH_ENTRIES];
+
+    struct mapcache cache;
 };
 
 struct mapcache_domain {
-    /* The number of array entries, and a cursor into the array. */
-    unsigned int entries;
-    unsigned int cursor;
-
     /* Protects map_domain_page(). */
     spinlock_t lock;
 
@@ -68,9 +76,7 @@ struct mapcache_domain {
     unsigned int epoch;
     u32 tlbflush_timestamp;
 
-    /* Which mappings are in use, and which are garbage to reap next epoch? */
-    unsigned long *inuse;
-    unsigned long *garbage;
+    struct mapcache cache;
 };
 
 void mapcache_domain_init(struct domain *d);
-- 
2.46.0


