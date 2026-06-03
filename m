Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eE+kIEQ4IGrsygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:20:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DE6387FF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject)
Received: from list by lists.xenproject.org with outflank-mailman.1326504.1591949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSb-00025P-G5; Wed, 03 Jun 2026 14:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326504.1591949; Wed, 03 Jun 2026 14:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSb-00023L-Bz; Wed, 03 Jun 2026 14:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1326504;
 Wed, 03 Jun 2026 14:20:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmSZ-00021M-6D
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:20:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmSY-007Z4T-JH
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:20:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203832-e002-0a2a0a5209dd-0a2a4509a1ce-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:42 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203839-2497-0a2a45090019-a0658309b3f8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:42 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id C9F038246340;
 Wed,  3 Jun 2026 10:19:23 -0400 (EDT)
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
Subject: [PATCH v2 1/2] xen/page_alloc: verify buddy alignment in reserve_offlined_page()
Date: Wed,  3 Jun 2026 15:17:26 +0100
Message-Id: <6eaed95df4e5cb369a91281051ca9b5a2be564f9.1780495548.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780495548.git.bernhard.kaindl@citrix.com>
References: <cover.1780495548.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780496442-43979A53-E9B451E9/0/0
X-purgate-type: clean
X-purgate-size: 1963
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:email,suse.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 491DE6387FF

reserve_offlined_page() fails to verify alignment when growing
buddies around offlined pages. Consequently, misaligned buddies
may be constructed from non-offlined page ranges and returned to
the free lists.

After a particular sequence of allocations and frees, pages
from such a misaligned buddy may be allocated more than once,
eventually triggering a Xen BUG() in alloc_heap_pages().

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
- Updated the title for clarity.
- Bugfix isolated from the test case for backporting.
- Removed excess parentheses from the alignment check if() expression.
- Simplified the alignment check to use '& (1UL << cur_order)'. Because
  the covering buddy head is size-aligned, cur_head is also aligned to
  cur_order, making this reduction safe (verified against extended tests).
- Updated the inline code comment to accurately state that only the upper
  half of the next_order range is checked for offlined pages.
---
 xen/common/page_alloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2c4ff2c34c70..2767376a710b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1202,6 +1202,11 @@ static int reserve_offlined_page(struct page_info *head)
             if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
                 goto merge;
 
+            /* Do not grow to next_order if cur_head is not aligned to it. */
+            if ( mfn_x(page_to_mfn(cur_head)) & (1UL << cur_order) )
+                goto merge;
+
+            /* Check for offlined pages in upper half of next_order range. */
             for ( i = (1 << cur_order), pg = cur_head + (1 << cur_order );
                   i < (1 << next_order);
                   i++, pg++ )
-- 
2.39.5


