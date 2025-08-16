Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2EB28D63
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084480.1443628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF0d-00081n-BG; Sat, 16 Aug 2025 11:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084480.1443628; Sat, 16 Aug 2025 11:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF0d-0007z8-8H; Sat, 16 Aug 2025 11:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1084480;
 Sat, 16 Aug 2025 11:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unF0c-0007SI-3o
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:23:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7423fa02-7a93-11f0-a328-13f23c93f187;
 Sat, 16 Aug 2025 13:23:37 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b00f187so11183025e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:23:37 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:23:36 -0700 (PDT)
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
X-Inumbo-ID: 7423fa02-7a93-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343417; x=1755948217; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+05UXLfbMsAgarpS2s46Loi9+DfuxXq2X3Fj022QKo=;
        b=kDoUhMPGZWSzXRA7TmKOko1MdKJAEHbmqa+jGeU7BEP8GtxlFMpCr5t2fNbCPNW981
         OdzJG62MM6ks3UQtlWcIb73vBCjxujBFuYdzFu824MahvhoRaCyuil2XUkhbrOTqaHf/
         +j+MpkEwItqBCuEsqfkPiw3aUehdYbv7s2L/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343417; x=1755948217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+05UXLfbMsAgarpS2s46Loi9+DfuxXq2X3Fj022QKo=;
        b=RjZ1C5wzeqD2oM3C4lZ47JmSaxF2rvboRt7A4kgS+ULenob4Z/hKw+/s1HFoA5H0WF
         cv7ktnahzippxW7pXR8ovTUjjqY1yVzNkupHiGy4fGZGxaTAFA2u3aAmN3n5+x5ugG4F
         g+va2nf41qJouG4buUWONJaaWBdPGSQqfq6XUv2/X2moLrghyntSTpCGI2zsScVyFyFn
         mys4id2JQjQipPowkps4RG4UCgsj/BISHU2KixQyghvQubf+kYbf2N11HRwuUoFP9a0A
         MW9018Qp8UeF9Qfuh5VYjHctCvuTiRj0P9ReObIA5DTZoxodCKBJmXgfathsrnkbHW8n
         FAQA==
X-Gm-Message-State: AOJu0YzDursj2uGaSVDuFvqZi7y72fXw3tXvBDzMY3HPI5QOOjsuFAeY
	xb8H7DBeTS0BKnwL8dHxlYzn1luCA6YzUeQ4nRu+fJF1KobVGxWUepYYauBZ62nXAVkL7MgpQz9
	WlnLlD9I=
X-Gm-Gg: ASbGnctOeYRuq+mke9OOWMTsgME0zdQFkFTaPanBiibG845d6iX8DD1Vggvb1Nvt03C
	7wC1gXQ7lAyMibquSy/G/6uaRX02TxDuQF5HXE1w/FMcVce4BHq1hw3KW5YtIgLIYsKibtyrPtg
	eG+BhPtpKgiCtnk66kizLn4MAyKgHo/8x+Bhza+83v1+Ana667B6BTdo1vUGX8T2Cp92Cnq6vw6
	Npbz6a3BS+gaTww1gMYAdMhcG9tFEYWqdSZWs+A+7bczOhL5Rwe/vhy/Rt1J7wlENvOWkw2AjHX
	0iZBH+oqIOz7roL+UIfHJIfUBuhRE2rY/ziDLng6d/A0qYYn+EYOFZnx9uEtFDWmKQmU+9ByZTp
	HEy76vLYL7XVBA0VITVSufICWk6uj2jvm94gpUKQ5GJaYODmnp449exw=
X-Google-Smtp-Source: AGHT+IGqX6lX+0qjwd3ZJHWzwevLA3gtpXVk7B4Wh5fM2DAlWP2x0QefOv/95gtbzlo0eDDvBzZfBQ==
X-Received: by 2002:a05:600c:b90:b0:459:eeaf:d6c7 with SMTP id 5b1f17b1804b1-45a218578fbmr38391925e9.26.1755343416867;
        Sat, 16 Aug 2025 04:23:36 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcus Granado <marcus.granado@cloud.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 5/7] xen/page_alloc: Create per-node outstanding claims
Date: Sat, 16 Aug 2025 13:19:31 +0200
Message-ID: <646f3bdbbfef5ace7902ca18c532b5518612f36e.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend domain_set_outstanding_claims() to allow staking claims on a
specific NUMA node instead of host-wide:

A claim on a specific NUMA node is the amount of d->outstanding_claims
where the new field d->claim_node field is not NUMA_NO_NODE.

We use the most straightforward implementation to minimise the amount
of changes in this commit and the rest of the series: In the next series
that converts the claims handling the multi-node claims, this will of
course be converted into another structure. It helps to keep this
commit focused on the central challenge of the new type of claim and
leaves extending claims to multi-node claims for the next series.

Also extend get_free_buddy() for when it circles round-robin over nodes:
Make it skip NUMA nodes that do not have enough unclaimed memory left.

---
Changes since v1:
- Join all conditions into a single if clause
- Improve the function description and comments
- Use const when passing struct domain when applicable
- Renamed pernode_oc[] to per_node_outstanding_claims[]
- Reject invalid node IDs in domain_set_outstanding_pages()
- Use nodeid_t instead of unsigned int for the claim_node field.
- Removed dependency on MEMF_EXACT_NODE (checked in get_free_buddy())
- Added awareness for honoring NUMA claims to get_free_buddy()

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Marcus Granado <marcus.granado@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/page_alloc.c | 37 +++++++++++++++++++++++++++++++++++--
 xen/include/xen/sched.h |  1 +
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e8ba21dc46..63ecd74dcc 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -491,6 +491,7 @@ static unsigned long per_node_avail_pages[MAX_NUMNODES];
 
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
+static unsigned long per_node_outstanding_claims[MAX_NUMNODES];
 
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
@@ -532,8 +533,12 @@ unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
      *
      * If the domain has no outstanding claims (or we freed pages instead),
      * we don't update outstanding claims and skip the claims adjustment.
+     *
+     * Also don't update outstanding claims when the domain has node-specific
+     * claims, but the memory allocation was from a different NUMA node.
      */
-    if ( !d->outstanding_pages || pages <= 0 )
+    if ( !d->outstanding_pages || pages <= 0 ||
+         (d->claim_node != NUMA_NO_NODE && d->claim_node != node) )
         goto out;
 
     spin_lock(&heap_lock);
@@ -544,6 +549,8 @@ unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
      */
     adjustment = min(d->outstanding_pages, (unsigned int)pages);
     d->outstanding_pages -= adjustment;
+    if ( d->claim_node != NUMA_NO_NODE ) /* adjust the static per-node claims */
+        per_node_outstanding_claims[d->claim_node] -= adjustment;
     outstanding_claims -= adjustment;
     spin_unlock(&heap_lock);
 
@@ -557,6 +564,9 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
     int ret = -ENOMEM;
     unsigned long avail_pages;
 
+    if ( node != NUMA_NO_NODE && !node_online(node) )
+        return -EINVAL;
+
     /*
      * take the domain's page_alloc_lock, else all d->tot_page adjustments
      * must always take the global heap_lock rather than only in the much
@@ -569,6 +579,10 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
     if ( pages == 0 )
     {
         outstanding_claims -= d->outstanding_pages;
+
+        if ( d->claim_node != NUMA_NO_NODE )
+            per_node_outstanding_claims[d->claim_node] -= d->outstanding_pages;
+
         d->outstanding_pages = 0;
         ret = 0;
         goto out;
@@ -591,12 +605,26 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
     /* how much memory is available? */
     avail_pages = total_avail_pages - outstanding_claims;
 
+    /* This check can't be skipped for the NUMA case, or we may overclaim */
     if ( pages > avail_pages )
         goto out;
 
+    if ( node != NUMA_NO_NODE )
+    {
+        avail_pages = per_node_avail_pages[node] - per_node_outstanding_claims[node];
+
+        if ( pages > avail_pages )
+            goto out;
+    }
+
     /* yay, claim fits in available memory, stake the claim, success! */
     d->outstanding_pages = pages;
     outstanding_claims += d->outstanding_pages;
+    d->claim_node = node;
+
+    if ( node != NUMA_NO_NODE )
+        per_node_outstanding_claims[node] += pages;
+
     ret = 0;
 
 out:
@@ -934,7 +962,12 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
         zone = zone_hi;
         do {
             /* Check if target node can support the allocation. */
-            if ( !avail[node] || (avail[node][zone] < (1UL << order)) )
+            if ( !avail[node] || (avail[node][zone] < (1UL << order)) ||
+                 /* For host-wide allocations, skip nodes without enough
+                  * unclaimed memory. */
+                  (req_node == NUMA_NO_NODE && outstanding_claims &&
+                   ((per_node_avail_pages[node] -
+                     per_node_outstanding_claims[node]) < (1UL << order))) )
                 continue;
 
             /* Find smallest order which can satisfy the request. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fd5c9f9333..9535ed7a6a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -406,6 +406,7 @@ struct domain
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
+    nodeid_t         claim_node;        /* NUMA_NO_NODE for host-wide claims */
 #ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
 #endif
-- 
2.43.0


