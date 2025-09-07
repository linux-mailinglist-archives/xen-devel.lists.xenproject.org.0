Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08645B47C5F
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114124.1461296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3B-0000HG-B7; Sun, 07 Sep 2025 16:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114124.1461296; Sun, 07 Sep 2025 16:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3B-0000Dl-7u; Sun, 07 Sep 2025 16:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1114124;
 Sun, 07 Sep 2025 16:15:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI39-0008Bo-8a
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:15:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfdd860c-8c05-11f0-9d13-b5c5bf9af7f9;
 Sun, 07 Sep 2025 18:15:30 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b04163fe08dso630038666b.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:15:30 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:15:29 -0700 (PDT)
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
X-Inumbo-ID: dfdd860c-8c05-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261730; x=1757866530; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wb0w+Ib0HchtKtOoJZ/15uDzicml5JsFwuf7VKWvmc=;
        b=QblKeUDN3D+i0ATssUC5GbNyu+48pXHKeNp1FCY7cx6QBOVWPw29S9WsAMAeEqGJM/
         qrj+VbOeLBC/c2rshq/EreJVUQZIE3tNRHqib3hFVK3zpf2dh91YTcjGTusorN3FjYY0
         D3HtTIxV/xagi95chCOY74jJJJXM8Ji+92pZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261730; x=1757866530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wb0w+Ib0HchtKtOoJZ/15uDzicml5JsFwuf7VKWvmc=;
        b=s1AYt+ePzy5a2iMHXfIb1RdmTs0hStbZtH5fhT8Qs5+DHEG0maRZHrfRJpPtPF/qpA
         /WFdcq2oYHzXTeAIFhgdJ/iBf6Fyrzr4JlyapqMSRDbMo9XUFt6dPDQPD/wbj8ZX+1LO
         h5X/LefUNCUI0kShFtHU6W4g8zMbXP2df9VDMO2Wc9Kiu+ksTCZtR/IrsuK8tEhiHvst
         E1PA6C2i+ZSjh3Fcx8aZ4r5cPnQ82SifSkrdQYyp9LvLxxPRGU7BSZnxiQUg/GjjDP6d
         ybvCScy4IcrSpYc7TYHfeKSRuqipzEh0X06tqBqPEFDSAeX83xHdcnv8PUozKMKljry4
         8MZA==
X-Gm-Message-State: AOJu0YwY8Es4+rAdbvF23sv+BN5w+6sJvwYjjUr0JNkRX1ptcUIbaDE1
	acmOqyCTMG7fW5EvdOV/13qzF5NYSSCF+vkxhPg6CaP0AFLyho91GdTDzGYpCFb2mAuH01Bi6gV
	HTnsCawE=
X-Gm-Gg: ASbGncs7pEa1VzyPnKtjuHR6YvGMLvcMxYQQCSDELaOwAL8nfJqbwmFCcprr08B9mMn
	imzoccsYKyYN8aFJoGt1gtGvTutAimPLsK72wgA1QUhwOJKkzsoe69lTtmOm2VyUm/7EpR0F9eN
	d51Lw7AQoRZmVQ5Xv1y7RbipXMs7GhlUDs+zB7oyGv7Y2WZCfSv5DMamf3VKg+Ng+avTO21Kd/0
	yDEYcQr6hoAj0udbucsrj3mHJiJGauWa9qbXM+9yIP+/Nzt9XcMlQg4mv/zsL5DsiX6fyh/Hrnd
	WeHY9NEqoEofyGdChGGWyC9YmoLCDXV7UuFXTcxLf1bZyVStrXt9X0M+xDZs1iWOXEIlPzFUKm8
	mG3lv5s0f5TW/qFEcYHKl6sI3NFezQ1U6fDIxHcz3sT0rATsProvO9q75JhF0oDmJqC0=
X-Google-Smtp-Source: AGHT+IGJpDSkkIcfCORJaJVTeHzgRf+E7BrBIiM6Xe5wOoPEEV56CMMZIVXBq/xg2FvjtqZ9Wxu4/w==
X-Received: by 2002:a17:906:d54a:b0:b04:827c:9139 with SMTP id a640c23a62f3a-b04b16e4f4dmr432603466b.65.1757261729960;
        Sun, 07 Sep 2025 09:15:29 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/7] xen/page_alloc: Add staking a NUMA node claim for a domain
Date: Sun,  7 Sep 2025 18:15:19 +0200
Message-ID: <a16fa2042c30183fc9a16bcaf400021661ae5b0b.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update domain_set_outstanding_pages() to domain_claim_pages() for
staking claims for domains on NUMA nodes:

domain_claim_pages() is a handler for claiming pages, where its former
name suggested that it just sets the domain's outstanding claims.

Actually, three different code locations do perform just this task:

Fix this using a helper to avoid repeating yourself (an anti-pattern)
for just only updating the domain's outstanding pages is added as well:

It removes the need to repeat the same sequence of operations at three
diffent places and helps to have a single location for adding multi-node
claims. It also makes the code much shorter and easier to follow.

Fix the meaning of the claims argument of domain_claim_pages()
for NUMA-node claims:

- For NUMA-node claims, we need to claim defined amounts of memory
  on different NUMA nodes. Previously, the argument was a "reservation"
  and the claim was made on the difference between d->tot_pages and
  the reservations. Of course, the argument needed to be > d->tot_pages.

  This interacs badly with NUMA claims:
  NUMA node claims are not related to potentially already allocated
  memory and reducing the claim by already allocated memory would
  not work in case d->tot_pages already has some amount of pages.

- Fix this by simply claiming the given amount of pages.

- Update the legacy caller of domain_claim_pages() accordingly by
  moving the reduction of the claim by d->tot_pages to it:

  No change for the users of the legacy hypercall, and a usable
  interface for staking NUMA claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

---
Changes in v3:

- Renamed domain_set_outstanding_pages() and add check from review.
- Reorganized v3, v4 and v5 as per review to avoid non-functional
  changes:
  - Combined patch v2#2 with v2#5 into a consolidated patch.
  - Moved the unrelated changes for domain_adjust_tot_pages() to #5.
---
 xen/common/domain.c     |  2 +-
 xen/common/memory.c     | 15 ++++++-
 xen/common/page_alloc.c | 93 ++++++++++++++++++++++++++++-------------
 xen/include/xen/mm.h    |  3 +-
 xen/include/xen/sched.h |  1 +
 5 files changed, 81 insertions(+), 33 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 775c339285..6ee9f23b10 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1247,7 +1247,7 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
-        domain_set_outstanding_pages(d, 0);
+        domain_claim_pages(d, NUMA_NO_NODE, 0);
         /* fallthrough */
     case DOMDYING_dying:
         rc = domain_teardown(d);
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd50..3371edec11 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1682,7 +1682,20 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = xsm_claim_pages(XSM_PRIV, d);
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
+        {
+            unsigned long new_claim = reservation.nr_extents;
+
+            /*
+             * For backwards compatibility, keep the meaning of nr_extents:
+             * it is the target number of pages for the domain.
+             * In case memory for the domain was allocated before, we must
+             * substract the already allocated pages from the reservation.
+             */
+            if ( new_claim )
+                new_claim -= domain_tot_pages(d);
+
+            rc = domain_claim_pages(d, NUMA_NO_NODE, new_claim);
+        }
 
         rcu_unlock_domain(d);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b8acb500da..bbb34994b7 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -492,6 +492,30 @@ DEFINE_PER_NODE(unsigned long, avail_pages);
 
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
+DECLARE_PER_NODE(long, outstanding_claims);
+DEFINE_PER_NODE(long, outstanding_claims);
+
+#define domain_has_node_claim(d) (d->claim_node != NUMA_NO_NODE)
+
+static inline bool insufficient_memory(unsigned long request, nodeid_t node)
+{
+    return per_node(avail_pages, node) -
+           per_node(outstanding_claims, node) < request;
+}
+
+/*
+ * Adjust the claim of a domain host-wide and if set, for the claimed node
+ *
+ * All callers already hold d->page_alloc_lock and the heap_lock.
+ */
+static inline void domain_adjust_outstanding_claim(struct domain *d, long pages)
+{
+    outstanding_claims += pages;   /* Update the host-wide-outstanding claims */
+    d->outstanding_pages += pages; /* Update the domain's outstanding claims */
+
+    if ( domain_has_node_claim(d) ) /* Update the claims of that node */
+        per_node(outstanding_claims, d->claim_node) += pages;
+}
 
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
@@ -529,7 +553,7 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     /*
      * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
-     * domain_set_outstanding_pages below
+     * domain_claim_pages below
      *
      * If the domain has no outstanding claims (or we freed pages instead),
      * we don't update outstanding claims and skip the claims adjustment.
@@ -544,18 +568,37 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
      * If allocated > outstanding, reduce the claims only by outstanding pages.
      */
     adjustment = min(d->outstanding_pages + 0UL, pages + 0UL);
-    d->outstanding_pages -= adjustment;
-    outstanding_claims -= adjustment;
+
+    domain_adjust_outstanding_claim(d, -adjustment);
     spin_unlock(&heap_lock);
 
 out:
     return d->tot_pages;
 }
 
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
+/*
+ * Stake claim for memory for future allocations of a domain.
+ *
+ * The claim is an abstract stake on future memory allocations,
+ * no actual memory is allocated at this point. Instead, it guarantees
+ * that future allocations up to the claim's size will succeed.
+ *
+ * If node == NUMA_NO_NODE, the claim is host-wide.
+ * Otherwise, it is local to the specific NUMA node defined by d->claim_node.
+ *
+ * It should normally only ever be before allocating the memory of the domain.
+ * When libxenguest code has finished populating the memory of the domain, it
+ * cleans up any remaining by passing of 0 to release any outstanding claims.
+ *
+ * Returns 0 on success, -EINVAL if the request is invalid,
+ * or -ENOMEM if the claim cannot be satisfied in available memory.
+ */
+int domain_claim_pages(struct domain *d, nodeid_t node, unsigned long claim)
 {
-    int ret = -ENOMEM;
-    unsigned long claim, avail_pages;
+    int ret = -EINVAL;
+
+    if ( node != NUMA_NO_NODE && !node_online(node) )
+        goto out; /* passed node is not valid */
 
     /*
      * take the domain's page_alloc_lock, else all d->tot_page adjustments
@@ -565,45 +608,35 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
 
-    /* pages==0 means "unset" the claim. */
-    if ( pages == 0 )
+    /* claim==0 means "unset" the claim. */
+    if ( claim == 0 )
     {
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
+        domain_adjust_outstanding_claim(d, -d->outstanding_pages);
         ret = 0;
         goto out;
     }
 
     /* only one active claim per domain please */
     if ( d->outstanding_pages )
-    {
-        ret = -EINVAL;
         goto out;
-    }
 
-    /* disallow a claim not exceeding domain_tot_pages() or above max_pages */
-    if ( (pages <= domain_tot_pages(d)) || (pages > d->max_pages) )
-    {
-        ret = -EINVAL;
+    /* If we allocated for the domain already, the claim is on top of that. */
+    if ( (domain_tot_pages(d) + claim) > d->max_pages )
         goto out;
-    }
 
-    /* how much memory is available? */
-    avail_pages = total_avail_pages;
-
-    avail_pages -= outstanding_claims;
+    ret = -ENOMEM;
+    /* Check if the host-wide available memory is sufficent for this claim */
+    if ( claim > total_avail_pages - outstanding_claims )
+        goto out;
 
-    /*
-     * Note, if domain has already allocated memory before making a claim
-     * then the claim must take domain_tot_pages() into account
-     */
-    claim = pages - domain_tot_pages(d);
-    if ( claim > avail_pages )
+    /* Check if the node's available memory is insufficient for this claim */
+    if ( node != NUMA_NO_NODE && insufficient_memory(node, claim) )
         goto out;
 
     /* yay, claim fits in available memory, stake the claim, success! */
-    d->outstanding_pages = claim;
-    outstanding_claims += d->outstanding_pages;
+    d->claim_node = node;
+    domain_adjust_outstanding_claim(d, claim);
+
     ret = 0;
 
 out:
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b968f47b87..52c12c5783 100644
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
@@ -131,7 +132,7 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
+int domain_claim_pages(struct domain *d, nodeid_t node, unsigned long pages);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce..9b91261f20 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -405,6 +405,7 @@ struct domain
     unsigned int     outstanding_pages; /* pages claimed but not possessed */
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+    nodeid_t         claim_node;        /* NUMA_NO_NODE for host-wide claims */
 
 #ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
-- 
2.43.0


