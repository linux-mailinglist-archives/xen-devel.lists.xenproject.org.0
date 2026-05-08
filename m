Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELG+G9FH/mkFowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:30:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147E44FB7F5
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304093.1577247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRoj-0000XS-K0; Fri, 08 May 2026 20:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304093.1577247; Fri, 08 May 2026 20:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRoj-0000UQ-EZ; Fri, 08 May 2026 20:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1304093;
 Fri, 08 May 2026 20:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wLRoi-0000UK-Ct
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLRog-00Ap9l-Ao
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:28:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe475c-e002-0a2a0a5209dd-0a2a4503ec68-26
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:28:58 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe4789-672d-0a2a45030019-a0658309b772-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:28:57 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 4A4448245FD5;
 Fri,  8 May 2026 16:27:51 -0400 (EDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v7 0/3] xen/mm: Introduce NUMA-aware memory claim sets
Date: Fri,  8 May 2026 21:27:56 +0100
Message-Id: <cover.1778272036.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778272138-39D7B938-8ACBBA69/0/0
X-purgate-type: clean
X-purgate-size: 4355
X-Rspamd-Queue-Id: 147E44FB7F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:christian.lindig@citrix.com,m:dave@recoil.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.750];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Xen's existing memory claim interface can account only for a host-wide
amount of memory for a domain. That is not enough for toolstacks that need
to claim memory from particular NUMA nodes before building the domain.

This series extends Xen's memory claim design to support claim sets with
NUMA-node-specific entries. Roger Pau Monné summarized the core design
requirement as:

   Ideally, we would need to introduce a new hypercall that allows
   making claims from multiple nodes in a single locked region, as to
   ensure success or failure in an atomic way.

A claim set can contain multiple node-specific claims and a host-wide
claim for memory that may come from any NUMA node. The new domctl
installs the full claim set atomically, and the allocator is updated
so that claim checks and claim consumption are NUMA-node aware.

The components are:

1. installing multi-node claim sets atomically,
2. protecting claimed pages from other claim requests and allocations, and
3. redeeming claims in a NUMA-aware manner when satisfying allocations
   for domains with claims.

Legacy XENMEM_claim_pages behaviour is preserved; the legacy interface
is deprecated and superseded by XEN_DOMCTL_claim_memory.

This update addresses v6 review comments, refactors claim redemption,
and adds a GET operation for inspecting a domain's claim set.

Only one preparatory patch remains in this version, followed by the main
feature and finally the OCaml bindings.

The updated design document for this series was submitted on May 5:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00163.html
Rendered version: https://xen.kaindl.dev/claims-v7-design/designs/claims/

The core operational principles have been validated in the following ways:

1. A comprehensive functional system test suite running in Dom0,
   which will follow this submission.

2. A native integration test environment for the Xen page allocator,
   providing a configurable synthetic Xen heap for each test case,
   which will follow this submission as well.

3. A set of high-level functional integration tests and performance
   tests, executed as part of end-to-end product deployment validation.

4. Validation in a customer's application performance lab to confirm
   performance expectations. This was done on predecessor code sharing
   the same design; that earlier code only supported single-node claims.

Best regards,
Bernhard

Changes since v6:
- Incorporated v6 review feedback.
- Restored claim invariants as needed after offlining pages.
- Addressed Jan's point about the ambiguity of the term "global":
   See https://lists.xen.org/archives/html/xen-devel/2026-05/msg00026.html
- Use "host-wide claims", with "host_claims" and "node_claims" as shorthands.

In addition, I adjusted helper names to make the domain scope explicit
and to keep the "release", "set", and "get" operations named consistently:

  * deduct_global_claims()         -> domain_release_host_claims()
  * deduct_node_claims()           -> domain_release_node_claims()
  * domain_set_outstanding_pages() -> domain_set_claim_entries()
  * domain_get_claim_entries() was added.

- The new domain_set_claim_entries() helper also handles the legacy
  XENMEM_claim_pages interface for backward compatibility, replacing
  domain_set_outstanding_pages().

Bernhard Kaindl (3):
  xen/mm: Introduce per-node free page counter
  xen/mm: Introduce NUMA-aware memory claim sets
  tools/ocaml: Add OCaml binding for NUMA claim sets

 tools/include/xenctrl.h             |  11 +
 tools/libs/ctrl/xc_domain.c         |  28 ++
 tools/ocaml/libs/xc/xenctrl.ml      |  10 +
 tools/ocaml/libs/xc/xenctrl.mli     |  10 +
 tools/ocaml/libs/xc/xenctrl_stubs.c |  50 ++++
 xen/common/domain.c                 |   5 +-
 xen/common/domctl.c                 |  57 ++++
 xen/common/memory.c                 |   5 +-
 xen/common/page_alloc.c             | 416 +++++++++++++++++++++++-----
 xen/include/public/domctl.h         |  38 +++
 xen/include/public/memory.h         |   2 +
 xen/include/xen/mm.h                |   6 +-
 xen/include/xen/sched.h             |   4 +
 xen/xsm/flask/hooks.c               |   1 +
 xen/xsm/flask/policy/access_vectors |   1 +
 15 files changed, 570 insertions(+), 74 deletions(-)

-- 
2.39.5


