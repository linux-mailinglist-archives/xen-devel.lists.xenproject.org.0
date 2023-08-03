Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F576E5A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576226.902150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYS-0002If-0x; Thu, 03 Aug 2023 10:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576226.902150; Thu, 03 Aug 2023 10:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYR-0002F6-Ta; Thu, 03 Aug 2023 10:27:39 +0000
Received: by outflank-mailman (input) for mailman id 576226;
 Thu, 03 Aug 2023 10:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVYR-0000aV-6q
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e062244-31e8-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:27:37 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id D8B1D4EE0737;
 Thu,  3 Aug 2023 12:27:36 +0200 (CEST)
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
X-Inumbo-ID: 5e062244-31e8-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 12/13] xen/common: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:27 +0200
Message-Id: <f095e38d076bbc5d9150da9d1896e6ccbd39ff6f.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/page_alloc.c | 6 +++---
 xen/common/rangeset.c   | 2 +-
 xen/common/softirq.c    | 8 ++++----
 xen/common/vsprintf.c   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e40473f71e..03b63d0ee7 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2380,7 +2380,7 @@ int assign_pages(
         if ( unlikely(nr > d->max_pages - tot_pages) )
         {
             gprintk(XENLOG_INFO, "Over-allocation for %pd: %Lu > %u\n",
-                    d, tot_pages + 0ull + nr, d->max_pages);
+                    d, tot_pages + 0ULL + nr, d->max_pages);
             rc = -E2BIG;
             goto out;
         }
@@ -2392,7 +2392,7 @@ int assign_pages(
         {
             gprintk(XENLOG_INFO,
                     "Excess allocation for %pd: %Lu (%u extra)\n",
-                    d, d->tot_pages + 0ull + nr, d->extra_pages);
+                    d, d->tot_pages + 0ULL + nr, d->extra_pages);
             if ( pg[0].count_info & PGC_extra )
                 d->extra_pages -= nr;
             rc = -E2BIG;
@@ -2460,7 +2460,7 @@ struct page_info *alloc_domheap_pages(
         {
             unsigned long i;
 
-            for ( i = 0; i < (1ul << order); i++ )
+            for ( i = 0; i < (1UL << order); i++ )
             {
                 ASSERT(!pg[i].count_info);
                 pg[i].count_info = PGC_extra;
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index a6ef264046..f3baf52ab6 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -393,7 +393,7 @@ static int cf_check merge(unsigned long s, unsigned long e, void *data)
 
 int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
 {
-    return rangeset_report_ranges(r2, 0, ~0ul, merge, r1);
+    return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
 }
 
 int rangeset_add_singleton(
diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index 063e93cbe3..321d26902d 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -29,7 +29,7 @@ static void __do_softirq(unsigned long ignore_mask)
 {
     unsigned int i, cpu;
     unsigned long pending;
-    bool rcu_allowed = !(ignore_mask & (1ul << RCU_SOFTIRQ));
+    bool rcu_allowed = !(ignore_mask & (1UL << RCU_SOFTIRQ));
 
     ASSERT(!rcu_allowed || rcu_quiesce_allowed());
 
@@ -57,12 +57,12 @@ static void __do_softirq(unsigned long ignore_mask)
 void process_pending_softirqs(void)
 {
     /* Do not enter scheduler as it can preempt the calling context. */
-    unsigned long ignore_mask = (1ul << SCHEDULE_SOFTIRQ) |
-                                (1ul << SCHED_SLAVE_SOFTIRQ);
+    unsigned long ignore_mask = (1UL << SCHEDULE_SOFTIRQ) |
+                                (1UL << SCHED_SLAVE_SOFTIRQ);
 
     /* Block RCU processing in case of rcu_read_lock() held. */
     if ( !rcu_quiesce_allowed() )
-        ignore_mask |= 1ul << RCU_SOFTIRQ;
+        ignore_mask |= 1UL << RCU_SOFTIRQ;
 
     ASSERT(!in_irq() && local_irq_is_enabled());
     __do_softirq(ignore_mask);
diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index 94c1ba7257..c49631c0a4 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -225,7 +225,7 @@ static char *print_bitmap_string(char *str, const char *end,
      */
     for ( i = ROUNDUP(nr_bits, CHUNKSZ) - CHUNKSZ; i >= 0; i -= CHUNKSZ )
     {
-        unsigned int chunkmask = (1ull << chunksz) - 1;
+        unsigned int chunkmask = (1ULL << chunksz) - 1;
         unsigned int word      = i / BITS_PER_LONG;
         unsigned int offset    = i % BITS_PER_LONG;
         unsigned long val      = (bitmap[word] >> offset) & chunkmask;
-- 
2.34.1


