Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAXSHMMo5mnesgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:23:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283A42B9BE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285803.1567045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEoag-0004hV-LJ; Mon, 20 Apr 2026 13:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285803.1567045; Mon, 20 Apr 2026 13:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEoag-0004ed-IL; Mon, 20 Apr 2026 13:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1285803;
 Mon, 20 Apr 2026 13:23:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wEoaf-0004eV-BD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:23:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEoae-003vBn-OK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:23:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e628af-2eae-0a2a0a5409dd-0a2a45018ff6-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:23:04 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e628b7-c1f2-0a2a45010019-a0658308e3ec-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:23:04 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CD100420CEC8;
 Mon, 20 Apr 2026 09:22:17 -0400 (EDT)
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
Subject: [PATCH v2 0/4] xen/mm: Host-side integration test environment for page_alloc.c
Date: Mon, 20 Apr 2026 14:19:40 +0100
Message-Id: <cover.1776690702.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776691384-BF67FFF4-E02B6EA0/0/0
X-purgate-type: clean
X-purgate-size: 4369
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
	NEURAL_HAM(-0.00)[-0.401];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 2283A42B9BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This patch series introduces a host-side integration test environment
for Xen's page allocator in xen/common/page_alloc.c, reduced in size
by 60% from 2257 to 1411 new lines with v2.

Using this environment, it also introduces integration tests for claims,
including NUMA-aware claim sets, complementing the functional system tests
submitted as part of the NUMA-aware claims v6 series.

The claim tests verify the page allocator's behaviour with multi-node
claim sets in scenarios that are easier to isolate and validate using a
synthetic Xen heap and domain state, offering full control and visibility
into claim states as claims are made and redeemed during heap allocation.

For these tests, this series depends on the NUMA claims v6 series,
which introduced NUMA-aware claim sets:

[PATCH v6 0/7] xen/mm: Introduce NUMA-aware claim sets for domains
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00587.html
https://patchwork.kernel.org/project/xen-devel/list/?series=1081139

Its design is described in this document:

[PATCH v2] docs: Draft Design Document for NUMA-aware claim sets
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00569.html
https://patchwork.kernel.org/project/xen-devel/list/?series=1081047

Patch summary:

1. tools/tests/alloc: Add a test environment for the page allocator
2. tools/tests/alloc: Add integration tests for claims and claim sets
3. tools/tests/alloc: Add tests for offlining with claims present
4. xen/mm: Recall claims when offlining pages if needed

Thanks,

  Bernhard Kaindl

---
Changes since v1:
1. Refactored the test environment for minimalism:
   - Improved separation of concerns.
   - Moved extensions to later patch series.
   - Simplified code with targeted assertions and concise comments.
2. Fixed file names to avoid underscores.
3. Updated include guards to comply with CODING_STYLE.

---
PS: The bug fixed in the last commit also affects the global claims
in Xen master when offlining pages.

While offlining has known limitations, the bug fixed in this series also
affects global claims in Xen master when pages are offlined. I will submit
a follow-up series to address offlining itself. In the meantime, this test
framework enables targeted testing on a synthetic Xen heap and simplifies
validation by letting the tests observe heap-state changes during offlining.

Bernhard Kaindl (4):
  tools/tests/alloc: Add Page Allocator Test Environment
  tools/tests/alloc: Add integration test suite to for NUMA memory
    claims
  tools/tests/alloc: Add tests for offlining with claims present
  xen/mm: Recall claims when offlining pages if needed

 tools/tests/Makefile                        |   1 +
 tools/tests/alloc/.gitignore                |   7 +
 tools/tests/alloc/Makefile                  | 141 +++++++
 tools/tests/alloc/README.rst                |  98 +++++
 tools/tests/alloc/check-asserts.h           | 225 +++++++++++
 tools/tests/alloc/harness.h                 |  57 +++
 tools/tests/alloc/hypervisor-macros.h       |  95 +++++
 tools/tests/alloc/libtest-page-alloc.h      | 145 +++++++
 tools/tests/alloc/mock-page-list.h          | 167 ++++++++
 tools/tests/alloc/page-alloc-shim.h         | 411 ++++++++++++++++++++
 tools/tests/alloc/page-alloc-wrapper.h      |  64 +++
 tools/tests/alloc/test-claims-basic.c       | 108 +++++
 tools/tests/alloc/test-claims-numa-redeem.c | 172 ++++++++
 tools/tests/alloc/test-offlining-claims.c   |  71 ++++
 xen/common/page_alloc.c                     |  42 ++
 15 files changed, 1804 insertions(+)
 create mode 100644 tools/tests/alloc/.gitignore
 create mode 100644 tools/tests/alloc/Makefile
 create mode 100644 tools/tests/alloc/README.rst
 create mode 100644 tools/tests/alloc/check-asserts.h
 create mode 100644 tools/tests/alloc/harness.h
 create mode 100644 tools/tests/alloc/hypervisor-macros.h
 create mode 100644 tools/tests/alloc/libtest-page-alloc.h
 create mode 100644 tools/tests/alloc/mock-page-list.h
 create mode 100644 tools/tests/alloc/page-alloc-shim.h
 create mode 100644 tools/tests/alloc/page-alloc-wrapper.h
 create mode 100644 tools/tests/alloc/test-claims-basic.c
 create mode 100644 tools/tests/alloc/test-claims-numa-redeem.c
 create mode 100644 tools/tests/alloc/test-offlining-claims.c

-- 
2.39.5


