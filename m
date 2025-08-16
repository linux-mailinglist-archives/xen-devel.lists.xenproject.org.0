Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64EB28D5F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084467.1443617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unEzi-0007VZ-07; Sat, 16 Aug 2025 11:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084467.1443617; Sat, 16 Aug 2025 11:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unEzh-0007SV-Tn; Sat, 16 Aug 2025 11:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1084467;
 Sat, 16 Aug 2025 11:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unEzg-0007SI-8v
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:22:40 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51644001-7a93-11f0-a328-13f23c93f187;
 Sat, 16 Aug 2025 13:22:39 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9d41bea3cso2756514f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:22:39 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:22:38 -0700 (PDT)
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
X-Inumbo-ID: 51644001-7a93-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343359; x=1755948159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8oXwoujm1GIgXMxJFvaFemEOtGYUi/CM14piShTTxU=;
        b=SVUQFVvhpdlwrQXYe4za5lQgmImZyaJz+8K7c5K2VjxpFNyW2nMGhz1oZg9ijWnflI
         V5XE2wDrmfCfxh5yox4X+kDF6872ugIOZZej6EVXDdlakwLd3P/G3kbuiMoScO4Lq/YL
         rIkjbHAZyrbu5M5lLrmWEwVRdZkYcMYFdimo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343359; x=1755948159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8oXwoujm1GIgXMxJFvaFemEOtGYUi/CM14piShTTxU=;
        b=oWs23u6a04WOiFXCFL9U4d+iwxoYsQ30oqVEzkvq3Y9RyBvGBlXz1To67bqD6Z9LPI
         D9i7gQwjmYxubzBR8+mKrtfkUt6q+Q536JjZcbjJ982JyWKbvks+Gu0qb76QaL9J/5ZN
         v/hWAGlrQ6DFmftTA0Itrw4UlBO83HsZNHCGYZci5X1qsPYqKkoZZH/tcseMDYoSGu4e
         az+DMzxNeMTZdMLeM9wq4VgSlYKcQfxBcEs4anBdtwFM+VGfvnOkIKr+6dlDGC0O9euS
         Q01YtnGM5neGnnzARJnyDkOFE2GKkpApTxazUYY0BxC/Jl6+Xp/H7xBAVlmENZDAYIdm
         s7CQ==
X-Gm-Message-State: AOJu0YzW3PMzgrOjkHOa85oytOyj9JzaAPUKoFaCgbam6onV/P+9QMVP
	tvzP752CU/piTwDlWBlehQb1qIR2hydyYMdMdqmIJAz8evUzmtQpoNj00vfdd2tP7yk+Fo1AasI
	RBtJl0ts=
X-Gm-Gg: ASbGncv0J2HFyr6vQ/z5jYY5VXpP2V24NNV1/A87/cMPO5K18RkMH8gMzyTPW0AExE3
	DJK9NpGtHYDB+kkM148bqmMrM/Jcc6B92LumFuaruXrxYucqUs3wFjdvb0puma6XNhp8XthG684
	Q/yrGxREGhHD5fwBuCm/JNRVM2FDJJs3Ai1nYfLL0ky+QDaM1WUgMD17k68uLAz8YmW5tUtSvz6
	B62kYqYWoYdHuzCViWMns33RgXmz44TNqysOg8ioqL1oNheyVrxcSZAlQSBSTIktn+DLHcc53tL
	4KVymju9hDIu8rFJVOphkcD1k/HnN690up6bStNjScaqv9BRa7sCq/e2EMICoZtGz2Je5zX/58h
	1EGKtXXlcAAEzIcmYAUoHLYetumniR2yoxVguDd7rPryVEJE2g3BGqGo=
X-Google-Smtp-Source: AGHT+IFgS9YcmZerlWfp+2PGSbboes1eTWmA6Ks71Yh8olqHY0310RWySPPUycVu5rm2nESIrRRkyQ==
X-Received: by 2002:a05:6000:381:b0:3a4:f72a:b18a with SMTP id ffacd0b85a97d-3bb676c9d2fmr3802460f8f.26.1755343358475;
        Sat, 16 Aug 2025 04:22:38 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 4/7] xen/page_alloc: Add node argument to domain_{adjust_tot_pages,set_outstanding_pages}()
Date: Sat, 16 Aug 2025 13:19:30 +0200
Message-ID: <62a9612c4f9d507184c50f720b5fe22f4921e85e.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_adjust_tot_pages() adjusts the total pages of a domain
after allocating or freeing memory. When allocating, it also
reduces the outstanding claims of a domain as pages are allocated.

When adding the node argument, we pass the node from which the pages
were allocated. When pages are freed, we simply pass NUMA_NO_NODE as
when freeing, the outstanding claims are not updated anyways.

domain_set_outstanding_pages() sets the amount of outstanding claims
of a domain. We pass the node on which to to stake an claim,
or NUMA_NO_NODE for host-wide claims.

No functional change, as neither function uses the arguments
for anything yet. It's a prerequisite to simplify for the next
patch that introduces per-node claim counts.

Changed since v1:
- Fix for the correct indentation of line with '-dec_count));'

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/mm.c             |  3 ++-
 xen/arch/x86/mm/mem_sharing.c |  4 ++--
 xen/common/domain.c           |  2 +-
 xen/common/grant_table.c      |  4 ++--
 xen/common/memory.c           |  6 ++++--
 xen/common/page_alloc.c       | 17 ++++++++++++-----
 xen/include/xen/mm.h          |  6 ++++--
 7 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e7fd56c7ce..effc67c6ba 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4444,7 +4444,8 @@ int steal_page(
     page_list_del(page, &d->page_list);
 
     /* Unlink from original owner. */
-    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
+    if ( !(memflags & MEMF_no_refcount) &&
+         !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1) )
         drop_dom_ref = true;
 
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..2551c0d86e 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -720,7 +720,7 @@ static int page_make_sharable(struct domain *d,
     if ( !validate_only )
     {
         page_set_owner(page, dom_cow);
-        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+        drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
         page_list_del(page, &d->page_list);
     }
 
@@ -766,7 +766,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     ASSERT(page_get_owner(page) == dom_cow);
     page_set_owner(page, d);
 
-    if ( domain_adjust_tot_pages(d, 1) == 1 )
+    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629e..1beadb05e1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1239,7 +1239,7 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
-        domain_set_outstanding_pages(d, 0);
+        domain_set_outstanding_pages(d, NUMA_NO_NODE, 0);
         /* fallthrough */
     case DOMDYING_dying:
         rc = domain_teardown(d);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..8fea75dbb2 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2405,7 +2405,7 @@ gnttab_transfer(
         }
 
         /* Okay, add the page to 'e'. */
-        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
+        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
             get_knownalive_domain(e);
 
         /*
@@ -2431,7 +2431,7 @@ gnttab_transfer(
              * page in the page total
              */
             nrspin_lock(&e->page_alloc_lock);
-            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
+            drop_dom_ref = !domain_adjust_tot_pages(e, NUMA_NO_NODE, -1);
             nrspin_unlock(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd50..b8cf4bd23d 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -775,7 +775,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 
                 nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref = (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
+                                !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                                         -dec_count));
                 nrspin_unlock(&d->page_alloc_lock);
 
                 if ( drop_dom_ref )
@@ -1682,7 +1683,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = xsm_claim_pages(XSM_PRIV, d);
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
+            rc = domain_set_outstanding_pages(d, NUMA_NO_NODE,
+                                              reservation.nr_extents);
 
         rcu_unlock_domain(d);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 43de9296fd..e8ba21dc46 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -517,7 +517,8 @@ static unsigned long avail_heap_pages(
  * Update the total number of pages and outstanding claims of a domain.
  * - When pages were freed, we do not increase outstanding claims.
  */
-unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
+unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
+                                      long pages)
 {
     unsigned long adjustment;
 
@@ -550,7 +551,8 @@ out:
     return d->tot_pages;
 }
 
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
+int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
+                                 unsigned long pages)
 {
     int ret = -ENOMEM;
     unsigned long avail_pages;
@@ -2620,6 +2622,8 @@ int assign_pages(
 
     if ( !(memflags & MEMF_no_refcount) )
     {
+        nodeid_t node = page_to_nid(&pg[0]);
+
         if ( unlikely(d->tot_pages + nr < nr) )
         {
             gprintk(XENLOG_INFO,
@@ -2631,7 +2635,9 @@ int assign_pages(
             goto out;
         }
 
-        if ( unlikely(domain_adjust_tot_pages(d, nr) == nr) )
+        ASSERT(node == page_to_nid(&pg[nr - 1]));
+
+        if ( unlikely(domain_adjust_tot_pages(d, node, nr) == nr) )
             get_knownalive_domain(d);
     }
 
@@ -2764,7 +2770,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 }
             }
 
-            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
+            drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                                    -(1 << order));
 
             rspin_unlock(&d->page_alloc_lock);
 
@@ -2970,7 +2977,7 @@ void free_domstatic_page(struct page_info *page)
 
     arch_free_heap_page(d, page);
 
-    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+    drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
 
     unprepare_staticmem_pages(page, 1, scrub_debug);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 93c037d618..f977e73b1c 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -65,6 +65,7 @@
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
 #include <xen/mm-types.h>
+#include <xen/numa.h>
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
@@ -130,8 +131,9 @@ mfn_t xen_map_to_mfn(unsigned long va);
 int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
-    long pages);
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
+    nodeid_t node, long pages);
+int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
+                                 unsigned long pages);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
-- 
2.43.0


