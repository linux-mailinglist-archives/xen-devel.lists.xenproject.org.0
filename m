Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COoQBxtWGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:50:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC805F3F36
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321221.1588153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc3W-0008VH-Lp; Thu, 28 May 2026 14:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321221.1588153; Thu, 28 May 2026 14:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc3W-0008Tq-IQ; Thu, 28 May 2026 14:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1321221;
 Thu, 28 May 2026 14:49:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSc3V-0008Tk-9C
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSc3U-002bP9-IE
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:49:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185603-e002-0a2a0a5209dd-0a2a4503c5ce-22
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:49:52 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a18560f-672d-0a2a45030019-a0658308c51a-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:49:52 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 2064943469FD;
 Thu, 28 May 2026 10:48:47 -0400 (EDT)
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/mm: Fix offlining pages to avoid corrupting the heap
Date: Thu, 28 May 2026 15:47:48 +0100
Message-Id: <cover.1779979589.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779979792-37D4B938-4D09F781/0/0
X-purgate-type: clean
X-purgate-size: 5554
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.986];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 7CC805F3F36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a bug where offlining pages could lead to unaligned
buddies being merged back onto the free list. The result is a chain of
events that can corrupt the heap and trigger a Xen panic after a few
allocations and frees.

For example, an MCE caused by faulty RAM may mark pages as offline.
When a buddy containing offlined pages is freed, those pages
are moved to dedicated isolated page lists.

reserve_offline_page() lacks alignment checks and may grow adjacent
healthy spans into unaligned buddies that violate the fundamental buddy
invariant: buddies of a given order must be aligned to their size.

Consider a valid order-2 buddy (4 pages) with this layout:

   +---------------+-----------------+-----------------+----------------+
   | head page     | tail page 1     | tail page 2     | tail page 3    |
   +---------------+-----------------+-----------------+----------------+

reserve_offline_page() then merges unaligned tail pages:

   +---------------+-----------------+-----------------+----------------+
   | offlined page |     head page with a tail page    | single page    |
   +---------------+-----------------+-----------------+----------------+

This leads to a Xen panic, demonstrated by the test case:

1. When a single page is allocated from this buddy, MFN 7 is allocated:

        MFN 4             MFN 5             MFN 6             MFN 7
  +---------------+-----------------+-----------------+----------------+
  | offlined page |    head page        tail page     | allocated page |
  |               |       Unaligned buddies are       |                |
  |               |      an invariant violation!      |                |
  +---------------+-----------------+-----------------+----------------+

2. When MFN 7 is freed, the predecessor merge in free_heap_pages()
   kicks in, merging MFN 7 with its naturally aligned predecessor MFN 6:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  |               |       Unaligned buddies are       |
  |               |      an invariant violation!      |
  +---------------+-----------------+-----------------+----------------+
                                    |    head page        tail page    |
                                    +-----------------+----------------+

  As shown, MFN 6 is double-freed. It is in two buddies:
  - As the tail page of the unaligned order-1 buddy starting at MFN 5.
  - As the head page of the aligned order-1 buddy starting at MFN 6.

3. The next allocations would allocate MFN 7 again, and MFN 6 as well:

   Due to the double-free, after the first allocation, MFN 6 remains on
   the free list even though its PGC_status is set to in-use.

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  |               |       Unaligned buddies are       |
  |               |      an invariant violation!      |
  +---------------+-----------------+-----------------+----------------+
                                    |   in-use page   |   in-use page  |
                                    +-----------------+----------------+

4. When the next page from this buddy is allocated, get_free_page()
   returns the buddy head MFN 5.  If the allocation is for order-0,
   alloc_heap_pages() splits page 6; otherwise, it keeps the buddy.
   Either way, the allocator checks the pages' PGC_status values and
   expects them not to be in-use. Because MFN 6 is already in-use,
   Xen panics (example panic log):

   pg[0] MFN 842adc c=0x4000000000000000 o=0 v=0 t=0
   Xen BUG at common/page_alloc.c:1324

I reproduced this while running intensive NUMA claim tests combined
with page offlining. The test case in this series demonstrates the
cascading corruption that leads to the panic without intentionally
having to crash a Xen instance to test for the bug.

Running the test produces the following output (trimmed):

   $ make -C tools/tests/native test TARGETS=offline-unaligned |
     grep -v ' xen/'
   |   The buddy #5 is not aligned to order-1!
   | <0>pg[0] MFN 00006 c=0x8000000000000001 o=1213 v=0 t=0
   | xen/common/page_alloc.c:1324: WE INVOKED a XEN BUG in alloc_heap_pages()

The second patch fixes the root cause and updates the test case to
serve as a regression test.

This series is based on the native test environment v3 for NUMA claims:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg01163.html

It in turn depends on the NUMA claim sets v7 series:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html

You can pull the series with dependencies for review and testing:

$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-unaligned-buddies-v1
$ make -C tools/tests/native TARGETS=offline-unaligned test

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  tools/tests/native: Test for Xen Panic after memory offlining
  xen/mm: Fix offlining pages only make aligned buddies, fixes Xen crash

 tools/tests/native/offline-unaligned.c | 79 ++++++++++++++++++++++++++
 xen/common/page_alloc.c                |  5 ++
 2 files changed, 84 insertions(+)
 create mode 100644 tools/tests/native/offline-unaligned.c

-- 
2.39.5


