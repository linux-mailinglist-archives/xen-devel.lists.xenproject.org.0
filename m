Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJukFNWKGWotxggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018546026D6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321969.1588386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwcG-000162-DC; Fri, 29 May 2026 12:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321969.1588386; Fri, 29 May 2026 12:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwcG-00013f-A3; Fri, 29 May 2026 12:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1321969;
 Fri, 29 May 2026 12:47:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwcF-00011q-M6
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:47:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwcF-005Vwa-2f
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:47:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198ac9-e002-0a2a0a5209dd-0a2a4506e4ba-2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:07 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198aca-7371-0a2a45060019-a06583099740-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:06 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id CC6A28275E96;
 Fri, 29 May 2026 08:45:50 -0400 (EDT)
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
Subject: [PATCH 3/7] xen/mm: Static memory: Widen assign_pages(nr) to unsigned long
Date: Fri, 29 May 2026 13:43:57 +0100
Message-Id: <06bbdf043e4be80bfc4f13926e8e02b42358f3da.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780058827-8EF89D75-8373F2D6/0/0
X-purgate-type: clean
X-purgate-size: 1734
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 018546026D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Static memory assignment is currently limited UINT_MAX pages.
To normalize on unsigned long, widen assign_pages() for unsigned long.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 8 ++++----
 xen/include/xen/mm.h    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3f8b300d8c29..8670233c550d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2851,12 +2851,12 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 
 int assign_pages(
     struct page_info *pg,
-    unsigned int nr,
+    unsigned long nr,
     struct domain *d,
     unsigned int memflags)
 {
     int rc = 0;
-    unsigned int i;
+    unsigned long i;
 
     nrspin_lock(&d->page_alloc_lock);
 
@@ -2870,7 +2870,7 @@ int assign_pages(
 
 #ifndef NDEBUG
     {
-        unsigned int extra_pages = 0;
+        unsigned long extra_pages = 0;
 
         for ( i = 0; i < nr; i++ )
         {
@@ -2947,7 +2947,7 @@ int assign_pages(
 int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
                 unsigned int memflags)
 {
-    return assign_pages(pg, 1U << order, d, memflags);
+    return assign_pages(pg, 1UL << order, d, memflags);
 }
 
 struct page_info *alloc_domheap_pages(
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b3a35c4bc8d6..b4330269418d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -168,7 +168,7 @@ void heap_init_late(void);
 
 int assign_pages(
     struct page_info *pg,
-    unsigned int nr,
+    unsigned long nr,
     struct domain *d,
     unsigned int memflags);
 
-- 
2.39.5


