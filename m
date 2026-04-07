Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPu8JE3V1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:58:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235AD3AC677
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274609.1560698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3CW-0003nr-1E; Tue, 07 Apr 2026 09:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274609.1560698; Tue, 07 Apr 2026 09:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3CV-0003ln-UN; Tue, 07 Apr 2026 09:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1274609;
 Tue, 07 Apr 2026 09:58:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3CT-0003lT-VY
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:58:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3CT-003ivl-BJ
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:58:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d531-e002-0a2a0a5209dd-0a2a4504c78a-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:58:25 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d540-bb33-0a2a45040019-a0658308a392-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:58:25 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id D41E0421B0E1;
 Tue,  7 Apr 2026 05:57:44 -0400 (EDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] xen/mm: Refactor retiring claims in preparation for functional changes
Date: Tue,  7 Apr 2026 10:54:26 +0100
Message-Id: <2d450d0fe8434679b5810c0d0e11d088aa757b2f.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1775505670.git.bernhard.kaindl@citrix.com>
References: <cover.1775505670.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1775555905-B273A51B-67D0CA99/0/0
X-purgate-type: clean
X-purgate-size: 3471
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.797];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 235AD3AC677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor retiring claims into a function to make the claims accounting
model easier to follow ahead of adding functional changes.

Those functional changes are NUMA claims and retiring claims when
offlining pages if all those pages on the host are claimed. For these
functional changes, we need to return the number of retired claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---

This 1st commit of this series is shared with another series which fixes a
number of bugs in reserve_offline_page(). If you could ack it to be merged
independent of the review of this series, we can shave it off both series
in the next review rounds of both series.

History:

Except from the function name change and extending it to return the number
of retired pages (which is required by both series) this commit is the
equivalent of commit 1 of the NUMA claims series v4, with minor changes:

1) The review comments have been applied.
2) In earlier series, I had chosen to use "releasing" and "consuming".
   Instead, speak of "retiring" claims (as they are no longer active),
   which can be used in all contexts, when using the claim for an allocation,
   when resetting a claim and when we've to recall claims when offlining.
2) The 2nd function made sense to be migrated to be part of the main NUMA
   claims commit so it is no longer a part of this commit.
---
 xen/common/page_alloc.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b1edef87124f..3b0909cc3ce1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -518,6 +518,24 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     return d->tot_pages;
 }
 
+/* Retire a portion of the global claims of a domain on global memory */
+static unsigned long claims_retire_global(struct domain *d,
+                                          unsigned long pages_to_retire)
+{
+    unsigned long retired;
+
+    ASSERT(spin_is_locked(&heap_lock));
+
+    /* If the withdrawal is larger than the claims, don't withdraw beyond */
+    retired = min(d->outstanding_pages + 0UL, pages_to_retire);
+
+    /* Assert the invariant of outstanding_claims not going negative */
+    ASSERT(retired <= outstanding_claims);
+    outstanding_claims -= retired;
+    d->outstanding_pages -= retired;
+    return retired;
+}
+
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
@@ -535,8 +553,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* pages==0 means "unset" the claim. */
     if ( pages == 0 )
     {
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
+        claims_retire_global(d, d->outstanding_pages);
         ret = 0;
         goto out;
     }
@@ -1067,11 +1084,7 @@ static struct page_info *alloc_heap_pages(
          * the domain being destroyed before creation is finished.  Losing part
          * of the claim makes no difference.
          */
-        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
-
-        BUG_ON(outstanding > outstanding_claims);
-        outstanding_claims -= outstanding;
-        d->outstanding_pages -= outstanding;
+        claims_retire_global(d, request);
     }
 
     check_low_mem_virq();
-- 
2.39.5


