Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vG4+MNtEIGp4zgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:14:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A070639022
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:14:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject)
Received: from list by lists.xenproject.org with outflank-mailman.1326804.1592138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIb-0000eN-KI; Wed, 03 Jun 2026 15:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326804.1592138; Wed, 03 Jun 2026 15:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIb-0000aw-Er; Wed, 03 Jun 2026 15:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1326804;
 Wed, 03 Jun 2026 15:14:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnIa-0000Z2-Is
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:14:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnIZ-00GNhc-Vf
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:14:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044bf-e002-0a2a0a5209dd-0a2a450bc17e-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:27 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044d2-212f-0a2a450b0019-a065830894fe-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:27 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CDAC843469EE;
 Wed,  3 Jun 2026 11:13:19 -0400 (EDT)
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
Subject: [PATCH v2 1/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Date: Wed,  3 Jun 2026 16:11:43 +0100
Message-Id: <3d899d52c26e4ff6a45ff33864b355651ce5d081.1780499500.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780499500.git.bernhard.kaindl@citrix.com>
References: <cover.1780499500.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780499667-2007BF3B-226DD58A/0/0
X-purgate-type: clean
X-purgate-size: 1872
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:mid,citrix.com:from_mime,citrix.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A070639022

Ensure offlined buddy head pages are annotated as order-0 pages.

When a buddy containing pages marked for offlining is processed,
reserve_offlined_page() rebuilds any surviving healthy buddies
and moves the offlined subpages onto the offlined lists.

If the buddy head itself is offlined it was previously left
annotated with the original buddy order even though it has
been split into a single page.

This has no functional impact as the order of an offlined
page is not used for any decision making and onlining, but
it is misleading when inspecting the page's metadata.

Set PFN_ORDER(cur_head) to 0 for all pages moved to the
lists of offlined and broken pages so the page's stored
order reflects its actual size.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
- Fix isolated from the new test and moved it ahead of the test.
- Unconditionally store 0 as the PFN_ORDER() of the offlined
  pages to make the code more robust against future changes.
---
 xen/common/page_alloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e01ac3e99c72..6c4e26004b2a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1251,6 +1251,12 @@ static int reserve_offlined_page(struct page_info *head)
         ASSERT(total_avail_pages > 0);
         total_avail_pages--;
 
+        /*
+         * All offlined pages are standalone pages: If this offlined page was
+         * the head of a higher-order buddy, we need to reset its order to 0:
+         */
+        PFN_ORDER(cur_head) = 0;
+
         page_list_add_tail(cur_head,
                            test_bit(_PGC_broken, &cur_head->count_info) ?
                            &page_broken_list : &page_offlined_list);
-- 
2.39.5


