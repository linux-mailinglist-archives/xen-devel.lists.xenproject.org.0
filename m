Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A9A6177E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914875.1320522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8n6-0004V5-Sa; Fri, 14 Mar 2025 17:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914875.1320522; Fri, 14 Mar 2025 17:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8n6-0004TM-NK; Fri, 14 Mar 2025 17:25:48 +0000
Received: by outflank-mailman (input) for mailman id 914875;
 Fri, 14 Mar 2025 17:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8n5-0003IK-CN
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:47 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9c9aa1-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:46 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso4149984a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:46 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:45 -0700 (PDT)
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
X-Inumbo-ID: 5d9c9aa1-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973146; x=1742577946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2oB9p9SaE6fLAIDKnikCVppfz5uU7uJrmpyg+tR1os=;
        b=S6yeMTYPEpViCxDwdzH8Fg0PTkhlMbGA1nELtkiWcGQlxIj6sF1c3QgIf843zJ+uS+
         12XRicMJN0AjHrPEvlTQJuOofAYsnRrHjJ19DgiDxZasRYsc1xFbB+8vEcPWMUx6QrCb
         nE6TMazeJDUZVm70S2vil2tf/Nf3S1IqfAd4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973146; x=1742577946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2oB9p9SaE6fLAIDKnikCVppfz5uU7uJrmpyg+tR1os=;
        b=V0NtAqlimBqLI2ol1vPdc3qUg2fbr7HLnGZYcH4wNaOKZFveQYeDKgVoZ59GYJqQQq
         tEaxV7eN6HUR99ukid99ScXo9eIDT9iQvX9zFMjW2PdBpj/RpulZJKswSW+FLMPeaMTH
         QABaZ/FkAeManbCTn8nsIGh5StfFsmZCYeaYABNFy5dWgCpI4+giMwrQzMqF1tw6DjLe
         oTU9YwCdiK23cmekGCpdIE7fynzTeI03+s6rLsXNixfBvPQoKBPKZQiMpOvCHNeHNqbs
         8sDS/dKw34xBZZsKoEgSFttgj6hTGHzddcnvT9SGC7uSKsDS7uhifIqrMYKBhJ7GY5BY
         45HA==
X-Gm-Message-State: AOJu0YySNz7ROQpmbVbAsTjpSwxeUilXDsKONmd5aLYg7ftTgid3MZU8
	LC8b33tqnRKlCF2RXeJzgoioNdsC3mw0bC33g2sWuZNTn8BIb1cx5wg2KTcmkWgp5z9aBeuRb/i
	H
X-Gm-Gg: ASbGncvijmZVhSOSxun0E7qRpBiw6tvu3V5hXXqxoGgM3ZGgpP75ICNT53zKrTlsPob
	xNT7HvKodQtD6gylVsvnBn2r0hmB6MliIuNDBCYz0tNwpZeXpK58vAoDfZPvdAqzkD5CBljP3HA
	ZlnIyLVhQ0APyh3/Wer8gjY9wHibUHFJ61ApGSfpEiap3GAA/gt430HR7F4LUJZ7tQEvMVUC9xS
	hwxV9OdpKKYzNyrs55/nsncWj/UhNpcx7Qe4VpXM92uxyLNWF3bm0fPCHQD2ajt2iOIERnfvJtI
	iFKHOoqrNIe/TBhKeDTsaM7PoH7EBiFHlMX9ZB9vgU36vTtcEJ/fsBTcpNKqsCqcjS0=
X-Google-Smtp-Source: AGHT+IGYDsF4nOyhHTVwVja8lWm+p2gw5JmYoTSGjOjZXctFy6CAvBALmxOqLNzSRuBvGptN3Qo7TA==
X-Received: by 2002:a17:906:794d:b0:ac2:d0e6:2b99 with SMTP id a640c23a62f3a-ac33039806bmr378513366b.36.1741973145848;
        Fri, 14 Mar 2025 10:25:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 04/11] xen: Add node argument to domain_{adjust_tot_pages,set_outstanding_pages}()
Date: Fri, 14 Mar 2025 17:24:55 +0000
Message-ID: <20250314172502.53498-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_adjust_tot_pages() decreases the outstanding claims of a domain
as pages are allocated, so that'll need to take into account the node in
which an allocation is done. Deallocations just pass NUMA_NO_NODE.

domain_set_outstanding_pages() takes the node on which to to stake an
exact-node claim, or NUMA_NO_NODE if it's a non-exact claim.

Not a functional change, as neither function uses the arguments for
anything yet. It's a prerequisite to simplify for the following patch
that introduces per-node claim counts.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
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
index bfdc8fb01949..89f87d013099 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4458,7 +4458,8 @@ int steal_page(
     page_list_del(page, &d->page_list);
 
     /* Unlink from original owner. */
-    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
+    if ( !(memflags & MEMF_no_refcount) &&
+         !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1) )
         drop_dom_ref = true;
 
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef076..2551c0d86e80 100644
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
index 585fd726a941..72d8d62bc1e8 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1205,7 +1205,7 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
-        domain_set_outstanding_pages(d, 0);
+        domain_set_outstanding_pages(d, NUMA_NO_NODE, 0);
         /* fallthrough */
     case DOMDYING_dying:
         rc = domain_teardown(d);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8cdd..d8c5321185c6 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2403,7 +2403,7 @@ gnttab_transfer(
         }
 
         /* Okay, add the page to 'e'. */
-        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
+        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
             get_knownalive_domain(e);
 
         /*
@@ -2429,7 +2429,7 @@ gnttab_transfer(
              * page in the page total
              */
             nrspin_lock(&e->page_alloc_lock);
-            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
+            drop_dom_ref = !domain_adjust_tot_pages(e, NUMA_NO_NODE, -1);
             nrspin_unlock(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8ca4e1a8425b..1ab0bac4e7da 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -773,7 +773,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 
                 nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref = (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
+                                !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                -dec_count));
                 nrspin_unlock(&d->page_alloc_lock);
 
                 if ( drop_dom_ref )
@@ -1680,7 +1681,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = xsm_claim_pages(XSM_PRIV, d);
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
+            rc = domain_set_outstanding_pages(d, NUMA_NO_NODE,
+                                              reservation.nr_extents);
 
         rcu_unlock_domain(d);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 733b0300a767..9243c4f51370 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -491,7 +491,8 @@ static unsigned long pernode_avail_pages[MAX_NUMNODES];
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
-unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
+unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
+                                      long pages)
 {
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
@@ -523,7 +524,8 @@ out:
     return d->tot_pages;
 }
 
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
+int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
+                                 unsigned long pages)
 {
     int ret = -ENOMEM;
     unsigned long avail_pages;
@@ -2600,6 +2602,8 @@ int assign_pages(
 
     if ( !(memflags & MEMF_no_refcount) )
     {
+        nodeid_t node = page_to_nid(&pg[0]);
+
         if ( unlikely(d->tot_pages + nr < nr) )
         {
             gprintk(XENLOG_INFO,
@@ -2611,7 +2615,9 @@ int assign_pages(
             goto out;
         }
 
-        if ( unlikely(domain_adjust_tot_pages(d, nr) == nr) )
+        ASSERT(node == page_to_nid(&pg[nr - 1]));
+
+        if ( unlikely(domain_adjust_tot_pages(d, node, nr) == nr) )
             get_knownalive_domain(d);
     }
 
@@ -2744,7 +2750,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 }
             }
 
-            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
+            drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE,
+                                                    -(1 << order));
 
             rspin_unlock(&d->page_alloc_lock);
 
@@ -2957,7 +2964,7 @@ void free_domstatic_page(struct page_info *page)
 
     arch_free_heap_page(d, page);
 
-    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+    drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
 
     unprepare_staticmem_pages(page, 1, scrub_debug);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index ae1c48a61545..e577a450681c 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -64,6 +64,7 @@
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
+#include <xen/numa.h>
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
@@ -129,8 +130,9 @@ mfn_t xen_map_to_mfn(unsigned long va);
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
2.48.1


