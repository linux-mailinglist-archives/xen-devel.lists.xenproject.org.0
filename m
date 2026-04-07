Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEZgMXnV1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09E3AC69B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274644.1560717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3DE-0004mH-NE; Tue, 07 Apr 2026 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274644.1560717; Tue, 07 Apr 2026 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3DE-0004jd-K8; Tue, 07 Apr 2026 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1274644;
 Tue, 07 Apr 2026 09:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3DD-0004i6-49
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3DC-0065UD-G4
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:59:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d56a-e002-0a2a0a5209dd-0a2a450bb540-48
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:59:10 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d56d-bca8-0a2a450b0019-a06583088bca-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:59:10 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id D8A6B421B5D1;
 Tue,  7 Apr 2026 05:58:29 -0400 (EDT)
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
Subject: [PATCH 2/5] xen/mm: alloc pages: Allow free pages to cover a shortfall of claims
Date: Tue,  7 Apr 2026 10:54:27 +0100
Message-Id: <1bd422498a1b258d3a733d12b5ca286d9d48ba58.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1775505670.git.bernhard.kaindl@citrix.com>
References: <cover.1775505670.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775555950-EC75A2A1-07870CD3/0/0
X-purgate-type: clean
X-purgate-size: 3139
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.780];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 8E09E3AC69B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When an allocation has a shortfall of claims but free, unclaimed
memory can cover this shortfall, allow the allocation to proceed.

In preparation for NUMA claims, refactor this check into a reusable
function. This will enable the same logic to be applied for NUMA nodes.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

---

Changes since v4: Extracted into a dedicated patch and merged the
formerly separate functions into one, as suggested by Jan Beulich.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3b0909cc3ce1..0fab1630e318 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -873,6 +873,42 @@ static void check_and_stop_scrub(struct page_info *head)
     }
 }
 
+/*
+ * Allow the request when unclaimed pages suffice, or when a refcounted
+ * domain's outstanding claims cover the shortfall.
+ */
+static bool claims_permit_request(const struct domain *d,
+                                  unsigned long avail_pages,
+                                  unsigned long competing_claims,
+                                  unsigned int memflags,
+                                  unsigned long requested_pages)
+{
+    unsigned long unclaimed_pages;
+
+    ASSERT(spin_is_locked(&heap_lock));
+    ASSERT(avail_pages >= competing_claims);
+
+    /* Start from the free pages not already claimed by other domains. */
+    unclaimed_pages = avail_pages - competing_claims;
+
+    /* Allow the request to proceed when unclaimed pages suffice. */
+    if ( requested_pages <= unclaimed_pages )
+        return true;
+
+    /*
+     * If unclaimed pages are insufficient, only a refcounted domain allocation
+     * may use claims to cover the shortfall.
+     */
+    if ( !d || (memflags & MEMF_no_refcount) )
+        return false;
+
+    /*
+     * Allow the request to proceed when combination of unclaimed pages and the
+     * claims held by the domain cover the shortfall for the requested_pages.
+     */
+    return requested_pages <= unclaimed_pages + d->outstanding_pages;
+}
+
 static struct page_info *get_free_buddy(unsigned int zone_lo,
                                         unsigned int zone_hi,
                                         unsigned int order, unsigned int memflags,
@@ -1017,9 +1053,8 @@ static struct page_info *alloc_heap_pages(
      * Claimed memory is considered unavailable unless the request
      * is made by a domain with sufficient unclaimed pages.
      */
-    if ( (outstanding_claims + request > total_avail_pages) &&
-          ((memflags & MEMF_no_refcount) ||
-           !d || d->outstanding_pages < request) )
+    if ( !claims_permit_request(d, total_avail_pages, outstanding_claims,
+                                memflags, request) )
     {
         spin_unlock(&heap_lock);
         return NULL;
-- 
2.39.5


