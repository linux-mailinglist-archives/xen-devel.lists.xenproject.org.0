Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOfgGi5A3mlvpwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:25:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB483FA745
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281788.1564643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdl6-00016n-Ir; Tue, 14 Apr 2026 13:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281788.1564643; Tue, 14 Apr 2026 13:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdl6-00014Z-Fn; Tue, 14 Apr 2026 13:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1281788;
 Tue, 14 Apr 2026 13:24:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wCdl5-00014S-Pi
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:24:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCdl4-0062r6-GJ
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:24:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de4020-e002-0a2a0a5209dd-0a2a4506c2d6-8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:24:50 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de4021-0df0-0a2a45060019-a0658308b188-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:24:50 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 85E40424A79F;
 Tue, 14 Apr 2026 09:24:06 -0400 (EDT)
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
Subject: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later functional changes
Date: Tue, 14 Apr 2026 14:22:45 +0100
Message-Id: <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776172526.git.bernhard.kaindl@citrix.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776173090-5E32F3D8-CC5F05F9/0/0
X-purgate-type: clean
X-purgate-size: 2424
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.880];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid]
X-Rspamd-Queue-Id: 1BB483FA745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor claim deduction to make the claims accounting model easier to
follow ahead of later functional changes.

Three new callers will need to deduct claims, and two of them will also
need the number of pages deducted to be returned.

No functional change.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
History:

Functionally unchanged since v4, only minor cleanups have been applied and:
- Updated the function name deduct_global_claims() to follow standard naming.
- Moved the other function into another commit as it had no users here.
---
 xen/common/page_alloc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b1edef87124f..80577aa4d50c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -518,6 +518,19 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     return d->tot_pages;
 }
 
+/* Deduct up to the given amount of pages from the global claims of a domain */
+static unsigned long deduct_global_claims(struct domain *d,
+                                          unsigned long reduction)
+{
+    reduction = min(reduction, d->outstanding_pages + 0UL);
+    ASSERT(reduction <= outstanding_claims);
+
+    outstanding_claims -= reduction;
+    d->outstanding_pages -= reduction;
+
+    return reduction;
+}
+
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
@@ -535,8 +548,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* pages==0 means "unset" the claim. */
     if ( pages == 0 )
     {
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
+        deduct_global_claims(d, d->outstanding_pages);
         ret = 0;
         goto out;
     }
@@ -1067,11 +1079,7 @@ static struct page_info *alloc_heap_pages(
          * the domain being destroyed before creation is finished.  Losing part
          * of the claim makes no difference.
          */
-        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
-
-        BUG_ON(outstanding > outstanding_claims);
-        outstanding_claims -= outstanding;
-        d->outstanding_pages -= outstanding;
+        deduct_global_claims(d, request);
     }
 
     check_low_mem_virq();
-- 
2.39.5


