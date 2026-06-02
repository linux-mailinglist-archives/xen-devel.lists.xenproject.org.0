Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOsRCM+ZHmoAlQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:52:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AC62AE3E
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324599.1590113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKr6-0006MY-JI; Tue, 02 Jun 2026 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324599.1590113; Tue, 02 Jun 2026 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKr6-0006Kk-Fs; Tue, 02 Jun 2026 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 1324599;
 Tue, 02 Jun 2026 08:52:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUKr5-0006JL-5C
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 08:52:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUKr4-002qZW-IA
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:52:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1e99a2-5cb7-0a2a0a5109dd-0a2a450b9384-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:52:10 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1e99b9-212f-0a2a450b0019-a0658308ba12-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:52:10 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 5345543121BC;
 Tue,  2 Jun 2026 04:51:02 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large domains
Date: Tue,  2 Jun 2026 09:49:50 +0100
Message-Id: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780390330-1AB70F3B-4F11E546/0/0
X-purgate-type: clean
X-purgate-size: 21830
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.625];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 813AC62AE3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using the 'u' debug key invokes dump_numa(), which walks each domain's
page list under page_alloc_lock to compute per-NUMA-node counts. On
domains with many pages, this O(pages) operation can hold the lock long
enough to trigger a watchdog timeout.

Replace the page-list walk with node_tot_pages[], a per-node counter
maintained in struct domain. This reduces dump_numa()'s per-domain work
from O(pages) to O(nodes).

Accounting via domain_adjust_tot_pages()

Most page-count updates flow through domain_adjust_tot_pages(). The
helper takes the affected NUMA node and updates both tot_pages and
node_tot_pages[node] in the same locked critical section.

A debug-only helper, assert_numa_page_count(), checks after each locked
update that the node totals sum to tot_pages.

Accounting in memory_exchange()

memory_exchange() cannot use the same helper. It is preemptible, may
fail and roll back part way through a chunk, and does not hold
page_alloc_lock for the whole operation. The final success-path value of
tot_pages is unchanged: by construction, the number of input pages stolen
equals the number of output pages assigned. domain_commit_page_deltas()
still applies the accumulated deltas to tot_pages, but their sum is zero.

Instead, it accumulates deferred per-node deltas in
node_tot_pages_adjustments[] for the current chunk:

  When steal_page() is called with MEMF_no_refcount, tot_pages is
  intentionally not decremented. A decrement of 1 is recorded for the
  input page's node.

  When assign_page() is called with MEMF_no_refcount, tot_pages is
  intentionally not incremented. An increment equal to the number of
  pages in the output extent is recorded.

At the end of a successful chunk, these deltas are committed under
page_alloc_lock. The net tot_pages delta is zero, while node_tot_pages[]
is updated to reflect the NUMA-node movement.

Correctness on failure paths:

  Invariant 1: Pages allocated with MEMF_no_owner are not counted in
  tot_pages until assign_page() succeeds. Freeing such pages with
  free_domheap_pages() is therefore accounting-neutral.

  Invariant 2: Pages stolen with MEMF_no_refcount remain counted in
  tot_pages until the deferred adjustment is committed. No window
  exists in which a stolen page is absent from d->page_list and
  already subtracted from tot_pages.

These invariants cover the failure cases:

  Input-side failure before output allocation: any input pages already
  stolen are still on in_chunk_list. The fail path attempts to assign them
  back to the domain. A successful reassign cancels the earlier negative
  delta; if the reassign fails because the domain is dying, the negative
  delta remains and is committed, reflecting that the page has been freed.

  OOM during output allocation (alloc_domheap_pages() returns NULL):
  output pages already allocated before the failure are on out_chunk_list,
  have no owner, and have never been counted in tot_pages. Freeing them
  does not change accounting. Stolen input pages are handled as above:
  reassignment cancels their negative deltas, while unreassigned pages are
  deducted because the domain is dying.

  assign_page() failure because the domain is dying: output pages
  assigned before the failure remain accounted to the domain and are
  reclaimed later by domain_relinquish_resources(). The accumulated
  deltas therefore contain positive entries for the successful output
  assignments and negative entries for all stolen input pages.
  Committing the net delta to both tot_pages and node_tot_pages[] leaves
  the accounting consistent with the pages the domain still owns.

  Post-assignment failure in guest_physmap_add_page() or while copying the
  new frame number back to the guest: at this point the output extent has
  already been assigned to the domain and the input pages for the chunk
  have already been freed. Input and output page counts are therefore
  equal, so the committed update only redistributes per-node counts and
  leaves tot_pages unchanged.

A functionally equivalent version of this change is included in the
XenServer 9 pre-release and is widely exercised there. Debug Xen
builds with the added consistency checks are also used in internal
end-to-end regression testing (XenRT). For upstream submission, the
change was additionally updated to support non-NUMA Xen builds and
reviewed again for correctness, including the failure paths.

Fixes: 4dff228603ba ("Walking the page lists needs the page_alloc lock")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Brief history of this code base: Work was started by Marcus Granado,
adding per-node accounting to domain_adjust_tot_pages() using work
by Alejandro Vallejo <alejandro.garciavallejo@amd.com> as basis.

In a 2nd phase, Bernhard Kaindl and Roger Pau Monné implemented
accumulating of per-node deltas in memory_exchange(), including
handling across failure paths and consistency checks of the page
counters after each update with CONFIG_DEBUG enabled. Bernhard
updated dump_numa() to replace walking d->page_list under lock
and Roger fixed handling of hypercall preemption. Andrew Cooper
participated in this phase as well and Joash Robinson tested using
end-to-end tests exercising debug-key 'u' and checking its output.

In a 3rd phase, Bernhard Kaindl added explanatory comments, prepared
this commit message for review, fixed a failure path that can occur
when memory_exchange() fails mid-exchange due to OOM, fixed the code
for non-NUMA builds and consolidated loops that apply accumulated
deltas into a single helper.
---
 xen/arch/x86/mm.c             |  3 +-
 xen/arch/x86/mm/mem_sharing.c |  4 +-
 xen/common/domain.c           |  9 ++++
 xen/common/grant_table.c      |  4 +-
 xen/common/memory.c           | 79 +++++++++++++++++++++++++----------
 xen/common/numa.c             | 14 +------
 xen/common/page_alloc.c       | 40 ++++++++++++++++--
 xen/include/xen/mm.h          | 12 +++++-
 xen/include/xen/sched.h       | 24 +++++++++++
 9 files changed, 143 insertions(+), 46 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a158379e7734..a723a2c50a2f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4445,7 +4445,8 @@ int steal_page(
     page_list_del(page, &d->page_list);
 
     /* Unlink from original owner. */
-    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
+    if ( !(memflags & MEMF_no_refcount) &&
+         !domain_adjust_tot_pages(d, page_to_nid(page), -1) )
         drop_dom_ref = true;
 
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e8b..89ae418be0ae 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -723,7 +723,7 @@ static int page_make_sharable(struct domain *d,
     if ( !validate_only )
     {
         page_set_owner(page, dom_cow);
-        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+        drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(page), -1);
         page_list_del(page, &d->page_list);
     }
 
@@ -769,7 +769,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     ASSERT(page_get_owner(page) == dom_cow);
     page_set_owner(page, d);
 
-    if ( domain_adjust_tot_pages(d, 1) == 1 )
+    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
     nrspin_unlock(&d->page_alloc_lock);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8cb4241b0511..0b6afba2acdb 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1558,6 +1558,15 @@ void domain_destroy(struct domain *d)
     /* Remove from the domlist/hash. */
     domlist_remove(d);
 
+    /*
+     * Final invariant check: all pages still owned by the dying domain must
+     * be accounted for per-node before complete_domain_destroy() reclaims
+     * them.  Debug-only; expands to a no-op in production builds.
+     */
+    nrspin_lock(&d->page_alloc_lock);
+    assert_numa_page_count(d);
+    nrspin_unlock(&d->page_alloc_lock);
+
     /* Schedule RCU asynchronous completion of domain destroy. */
     call_rcu(&d->rcu, complete_domain_destroy);
 }
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ac9fed600101..298662c3d69e 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2404,7 +2404,7 @@ gnttab_transfer(
         }
 
         /* Okay, add the page to 'e'. */
-        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
+        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
             get_knownalive_domain(e);
 
         /*
@@ -2430,7 +2430,7 @@ gnttab_transfer(
              * page in the page total
              */
             nrspin_lock(&e->page_alloc_lock);
-            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
+            drop_dom_ref = !domain_adjust_tot_pages(e, page_to_nid(page), -1);
             nrspin_unlock(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 9e4899f9fc63..00eeaf33aefc 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -673,6 +673,14 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     struct domain *d;
     struct page_info *page;
 
+    /*
+     * Deferred accounting for the current exchange chunk.  Keep it at
+     * function scope because the fail: path also needs to commit or cancel
+     * partial work.  domain_commit_page_deltas() clears applied entries, so
+     * each new chunk starts with a zeroed accumulator.
+     */
+    long node_tot_pages_adjustments[MAX_NUMNODES] = {};
+
     if ( copy_from_guest(&exch, arg, 1) )
         return -EFAULT;
 
@@ -822,6 +830,12 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                 }
 
                 page_list_add(page, &in_chunk_list);
+                /*
+                 * steal_page() with MEMF_no_refcount removes ownership but
+                 * leaves the domain page counts unchanged; record the
+                 * deferred -1 for this page's node.
+                 */
+                node_tot_pages_adjustments[page_to_nid(page)]--;
 #ifdef CONFIG_X86
                 put_gfn(d, gmfn + k);
 #endif
@@ -870,32 +884,31 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
             if ( assign_page(page, exch.out.extent_order, d,
                              MEMF_no_refcount) )
             {
-                unsigned long dec_count;
-                bool drop_dom_ref;
-
                 /*
-                 * Pages in in_chunk_list is stolen without
-                 * decreasing the tot_pages. If the domain is dying when
-                 * assign pages, we need decrease the count. For those pages
-                 * that has been assigned, it should be covered by
-                 * domain_relinquish_resources().
+                 * Input pages for this chunk were stolen and freed without
+                 * decreasing tot_pages.  Output extents already assigned
+                 * before this failure will be released later by
+                 * domain_relinquish_resources().  Commit the relative deltas
+                 * now so concurrent reservation changes made under
+                 * page_alloc_lock are preserved.  The net delta is strictly
+                 * negative on this branch, so a zero post-commit tot_pages
+                 * means the last reference must be dropped.
                  */
-                dec_count = (((1UL << exch.in.extent_order) *
-                              (1UL << in_chunk_order)) -
-                             (j * (1UL << exch.out.extent_order)));
-
-                nrspin_lock(&d->page_alloc_lock);
-                drop_dom_ref = (dec_count &&
-                                !domain_adjust_tot_pages(d, -dec_count));
-                nrspin_unlock(&d->page_alloc_lock);
-
-                if ( drop_dom_ref )
+                if ( !domain_commit_page_deltas(d, node_tot_pages_adjustments) )
                     put_domain(d);
 
                 free_domheap_pages(page, exch.out.extent_order);
                 goto dying;
             }
 
+            /*
+             * assign_page() with MEMF_no_refcount gives ownership without
+             * updating the domain page counts; record the deferred extent
+             * size for this output node.
+             */
+            node_tot_pages_adjustments[page_to_nid(page)] +=
+                1UL << exch.out.extent_order;
+
             if ( __copy_from_guest_offset(&gpfn, exch.out.extent_start,
                                           (i << out_chunk_order) + j, 1) )
             {
@@ -915,8 +928,19 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         }
         BUG_ON( !(d->is_dying) && (j != (1UL << out_chunk_order)) );
 
+        /*
+         * If publishing output GFNs failed after assignment, fail: still
+         * needs to commit the zero-net per-node redistribution.
+         */
         if ( rc )
             goto fail;
+
+        /*
+         * Success: commit the per-node redistribution.  The helper also
+         * applies the deltas to tot_pages; the final value is unchanged
+         * because the exchange is size-neutral.
+         */
+        domain_commit_page_deltas(d, node_tot_pages_adjustments);
     }
 
     exch.nr_exchanged = exch.in.nr_extents;
@@ -925,22 +949,31 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     rcu_unlock_domain(d);
     return rc;
 
-    /*
-     * Failed a chunk! Free any partial chunk work. Tell caller how many
-     * chunks succeeded.
-     */
+    /* Failed a chunk.  Free partial work and report completed chunks. */
  fail:
     /*
      * Reassign any input pages we managed to steal.  NB that if the assign
      * fails again, we're on the hook for freeing the page, since we've already
-     * cleared PGC_allocated.
+     * cleared PGC_allocated.  A successful reassignment cancels the -1 that
+     * was recorded when the page was stolen.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
+    {
         if ( assign_pages(page, 1, d, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
         }
+        else
+            node_tot_pages_adjustments[page_to_nid(page)] += 1;
+    }
+
+    /*
+     * Commit remaining deltas.  If all stolen pages were reassigned, this is
+     * a zero-net update.  Otherwise the domain is dying and unreassigned
+     * pages are deducted.
+     */
+    domain_commit_page_deltas(d, node_tot_pages_adjustments);
 
  dying:
     rcu_unlock_domain(d);
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..9f38145579e0 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -737,26 +737,14 @@ static void cf_check dump_numa(unsigned char key)
     printk("Memory location of each domain:\n");
     for_each_domain ( d )
     {
-        const struct page_info *page;
-        unsigned int page_num_node[MAX_NUMNODES];
         const struct vnuma_info *vnuma;
 
         process_pending_softirqs();
 
         printk("%pd (total: %u):\n", d, domain_tot_pages(d));
 
-        memset(page_num_node, 0, sizeof(page_num_node));
-
-        nrspin_lock(&d->page_alloc_lock);
-        page_list_for_each ( page, &d->page_list )
-        {
-            i = page_to_nid(page);
-            page_num_node[i]++;
-        }
-        nrspin_unlock(&d->page_alloc_lock);
-
         for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
+            printk("    Node %u: %u\n", i, d->node_tot_pages[i]);
 
         if ( !read_trylock(&d->vnuma_rwlock) )
             continue;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1801afc96a0a..ab6f44a3f993 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -520,14 +520,45 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
-unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
+unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
+                                      long pages)
 {
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
+#ifdef CONFIG_NUMA
+    ASSERT(node != NUMA_NO_NODE);
+    ASSERT(node_online(node));
+    d->node_tot_pages[node] += pages;
+    assert_numa_page_count(d);
+#endif
+
     return d->tot_pages;
 }
 
+unsigned long domain_commit_page_deltas(struct domain *d,
+                                        long adjustments[MAX_NUMNODES])
+{
+    unsigned long tot_pages;
+    nodeid_t node;
+
+    nrspin_lock(&d->page_alloc_lock);
+    for_each_online_node ( node )
+        if ( adjustments[node] )
+        {
+#ifdef CONFIG_NUMA
+            d->node_tot_pages[node] += adjustments[node];
+#endif
+            d->tot_pages += adjustments[node];
+            adjustments[node] = 0;
+        }
+    assert_numa_page_count(d);
+    tot_pages = d->tot_pages;
+    nrspin_unlock(&d->page_alloc_lock);
+
+    return tot_pages;
+}
+
 #ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
@@ -2924,7 +2955,7 @@ int assign_pages(
             goto out;
         }
 
-        if ( unlikely(domain_adjust_tot_pages(d, nr) == nr) )
+        if ( unlikely(domain_adjust_tot_pages(d, page_to_nid(pg), nr) == nr) )
             get_knownalive_domain(d);
     }
 
@@ -3066,7 +3097,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 }
             }
 
-            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
+            drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(pg),
+                                                    -(1 << order));
 
             rspin_unlock(&d->page_alloc_lock);
 
@@ -3274,7 +3306,7 @@ void free_domstatic_page(struct page_info *page)
 
     arch_free_heap_page(d, page);
 
-    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+    drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(page), -1);
 
     unprepare_staticmem_pages(page, 1, scrub_debug);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b3a35c4bc8d6..0737df02eda2 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -68,6 +68,7 @@
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
+#include <xen/numa.h>
 #include <xen/perfc.h>
 #include <public/memory.h>
 
@@ -131,7 +132,16 @@ mfn_t xen_map_to_mfn(unsigned long va);
 int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
-    long pages);
+                                                   nodeid_t node, long pages);
+/*
+ * Commit accumulated per-node page deltas to d->tot_pages and (under NUMA)
+ * d->node_tot_pages[] under page_alloc_lock.  Applied entries are cleared
+ * so the same accumulator can be reused for the next batch.  Returns the
+ * post-commit value of d->tot_pages; callers that may be releasing the last
+ * reference on the domain should drop it when the return value is zero.
+ */
+unsigned long domain_commit_page_deltas(struct domain *d,
+                                        long adjustments[MAX_NUMNODES]);
 int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
                              const struct xen_memory_claim *claim_set);
 int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f671e0c4c7b3..ae50f523e9f5 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -620,6 +620,11 @@ struct domain
     unsigned int last_alloc_node;
     spinlock_t node_affinity_lock;
 
+#ifdef CONFIG_NUMA
+    /* Distribution of tot_pages across NUMA nodes. */
+    unsigned int node_tot_pages[MAX_NUMNODES];
+#endif
+
     /* vNUMA topology accesses are protected by rwlock. */
     rwlock_t vnuma_rwlock;
     struct vnuma_info *vnuma;
@@ -698,6 +703,25 @@ static inline unsigned int domain_tot_pages(const struct domain *d)
     return d->tot_pages - d->extra_pages;
 }
 
+/*
+ * Debug-only consistency check: the per-node page counts must sum to
+ * d->tot_pages.  Compiled out unless both NUMA and debug builds are
+ * configured; caller must hold page_alloc_lock.
+ */
+static inline void assert_numa_page_count(const struct domain *d)
+{
+#if defined(CONFIG_NUMA) && defined(CONFIG_DEBUG)
+    unsigned int i, node_total = 0;
+
+    ASSERT(rspin_is_locked(&d->page_alloc_lock));
+
+    for_each_online_node ( i )
+        node_total += d->node_tot_pages[i];
+
+    ASSERT(node_total == d->tot_pages);
+#endif
+}
+
 /* Protect updates/reads (resp.) of domain_list and domain_hash. */
 extern spinlock_t domlist_update_lock;
 extern rcu_read_lock_t domlist_read_lock;
-- 
2.39.5


