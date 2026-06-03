Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XczPBjM4IGrqygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:20:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E736387F9
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject)
Received: from list by lists.xenproject.org with outflank-mailman.1326488.1591940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSG-0001aj-1v; Wed, 03 Jun 2026 14:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326488.1591940; Wed, 03 Jun 2026 14:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSF-0001Yh-UH; Wed, 03 Jun 2026 14:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1326488;
 Wed, 03 Jun 2026 14:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmSE-0001YZ-JL
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmSD-007Yyr-Qh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:20:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203820-e002-0a2a0a5209dd-0a2a4502e258-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:21 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203824-af86-0a2a45020019-a0658309950c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:21 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 0A6228244E4C;
 Wed,  3 Jun 2026 10:19:02 -0400 (EDT)
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
Subject: [PATCH v2 0/2] xen/mm: Ensure page offlining only creates properly aligned buddies
Date: Wed,  3 Jun 2026 15:17:25 +0100
Message-Id: <cover.1780495548.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780496421-AA175161-32080734/0/0
X-purgate-type: clean
X-purgate-size: 3794
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:email,citrix.com:mid,citrix.com:from_mime,citrix.com:email,xen.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8E736387F9

This series fixes a bug in reserve_offlined_page() where growing
buddies around offlined pages may create misaligned buddies and
return them to the free lists.

For example, pages may be offlined following an MCE caused by faulty RAM.
Once a misaligned buddy has been placed on a free list, a particular
sequence of allocations and frees may cause the same page to be allocated
more than once, eventually triggering a Xen BUG() in alloc_heap_pages().

As requested for backporting the fix, the first patch adds the alignment
check while the second patch now adds the regression test for this issue.

As minimal example, consider an order-2 buddy (4 pages) with this layout:

   +---------------+-----------------+-----------------+----------------+
   | head page     | tail page 1     | tail page 2     | tail page 3    |
   +---------------+-----------------+-----------------+----------------+

reserve_offline_page() then merges unaligned tail pages:

   +---------------+-----------------+-----------------+----------------+
   | offlined page |     head page with a tail page    | single page    |
   +---------------+-----------------+-----------------+----------------+

When a single page is allocated from this buddy, MFN 7 is allocated:

        MFN 4             MFN 5             MFN 6             MFN 7
  +---------------+-----------------+-----------------+----------------+
  | offlined page |    head page        tail page     | allocated page |
  +---------------+-----------------+-----------------+----------------+

If MFN 7 is freed, the predecessor merge in free_heap_pages() kicks in,
merging MFN 7 with its naturally aligned predecessor page at MFN 6:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  +---------------+-----------------+-----------------+----------------+
                                    |    head page        tail page    |
                                    +-----------------+----------------+

The next allocations would allocate MFN 7 again and MFN 6 as well:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    | <- BUG() on alloc
  +---------------+-----------------+-----------------+----------------+
                                    |   in-use page   |   in-use page  |
                                    +-----------------+----------------+

When the next page from this buddy is allocated, get_free_page() returns
the buddy head MFN 5. An order-0 allocation splits page 6, or an order-1
allocation allocates the whole unaligned buddy. alloc_heap_page()
catches the attempt to allocate MFN 6 for a second time as a bug:

   pg[0] MFN 842adc c=0x4000000000000000 o=0 v=0 t=0
   Xen BUG at common/page_alloc.c:1324

You can pull this series with the regression test environment to run it:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg01163.html
git pull git@gitlab.com:bernhardkaindl/xen.git offline-unaligned-buddies-v2
make -C tools/tests/native TARGETS=offline-unaligned test

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  xen/page_alloc: verify buddy alignment in reserve_offlined_page()
  tools/tests: Regression test checking unaligned pages after offlining

 tools/tests/native/offline-unaligned.c | 60 ++++++++++++++++++++++++++
 xen/common/page_alloc.c                |  5 +++
 2 files changed, 65 insertions(+)
 create mode 100644 tools/tests/native/offline-unaligned.c

-- 
2.39.5


