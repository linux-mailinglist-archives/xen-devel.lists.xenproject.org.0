Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEyZGZg+3mlJpwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:18:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F83FA653
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281759.1564634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdeV-0007yM-U8; Tue, 14 Apr 2026 13:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281759.1564634; Tue, 14 Apr 2026 13:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdeV-0007vL-RH; Tue, 14 Apr 2026 13:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1281759;
 Tue, 14 Apr 2026 13:18:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wCdeU-0007vD-2t
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:18:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCdeT-002nHw-G0
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:18:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de3e7f-2eae-0a2a0a5409dd-0a2a4501d8ee-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:18:01 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de3e88-c1f2-0a2a45010019-a0658308bf0e-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:18:01 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 23A26423F9C3;
 Tue, 14 Apr 2026 09:17:17 -0400 (EDT)
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
Subject: [PATCH v6 0/7] xen/mm: Introduce NUMA-aware claim sets for domains
Date: Tue, 14 Apr 2026 14:15:57 +0100
Message-Id: <cover.1776172526.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776172681-BFE7BFF4-F7A99ACD/0/0
X-purgate-type: clean
X-purgate-size: 5785
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:christian.lindig@citrix.com,m:dave@recoil.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid]
X-Rspamd-Queue-Id: ED4F83FA653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series extends Xen's memory claim handling to support claim sets
spanning multiple NUMA nodes.

Earlier review raised the concern that claims would need to evolve from a
single claim into a multi-node model. Roger Pau Monné described the core
requirement well:

  >  Ideally, we would need to introduce a new hypercall that allows
  >  making claims from multiple nodes in a single locked region,
  >  as to ensure success or failure in an atomic way.

      -- Roger Pau Monné

This submission implements that model, and its design and code have been
validated through the following methods:

1. A suite of host-side integration tests (to be posted shortly), which
   can be executed on the build host (e.g., on a developer machine) like
   the PDX tests by Roger Pau Monné (make -C tools/tests/pdx run), as
   well as the domid and rangeset tests.

2. A comprehensive functional system test suite (with nineteen test
   cases), included in this v6 submission. These tests are run using
   automated deployment across various machine types and generations
   in our labs.

3. A set of high-level functional integration tests and performance
   tests, executed as part of end-to-end product deployment validation.

4. Validation in a customer's standardised application performance lab
   to confirm their performance expectations. (This testing was done on
   predecessor code sharing the same design, with the main difference
   being that only single-node claims were supported in the previous
   code base.)

The series has been reworked substantially in response to v4 review.
Because of that, it is likely best reviewed as a fresh series rather
than incrementally.

Patch summary:

1. xen/mm: Refactor deducting claims to prepare for functional changes
2. xen/mm: Claims check: Allow free pages to cover a shortfall of claims
3. xen/mm: Optimise getting free page counts per NUMA node
4. xen/mm: Split d->outstanding_pages to global_claims & node_claims
5. xen/mm: Introduce Claim Sets for multiple NUMA nodes
6. tools/ocaml/libs/xc: Add OCaml bindings for NUMA-aware claims
7. tools/tests/mem-claim: Add a test suite for the memory claim API

The v2 design document submitted ahead of this series may also help with
review. It explains the background, design rationale, and implementation
details.

Rendered version:
https://bernhard-xen.readthedocs.io/en/claim-sets-v2-design/designs/claims

Many thanks to everyone who contributed to the earlier work and review,
especially Alejandro Vallejo, Jan Beulich, Andrew Cooper, Roger Pau
Monné, Marcus Granado, and Edwin Török.

Changes since v5:
-----------------

- No functional changes for the sum of all commits.
  (Adding a new function argument was moved to the commit that needs it.)

- Added a comprehensive test suite for the new hypercall using the
  libxenctrl wrapper xc_domain_claim_memory(), based on the test in
  tools/tests/mem-claim/test-mem-claim.c for the existing hypercall
  API by Andrew Cooper.

- Improved the function names to follow standard naming recommendations.
  The added functions are renamed as follows:

  * claims_retire_allocation() -> redeem_claims_for_allocation()
    - Use "redeem" because it is part of an exchange of claims for memory.

  * claims_retire_global()     -> deduct_global_claims()
  * claims_retire_nodes()      -> deduct_node_claims()
    - These perform the act of reducing the amount of global/node claims.

  * claims_retire_node()       -> cancel_all_node_claims()
    - Cancel all node claims when needed when the claims are terminated.

  * The comments and the design document v2 have been updated accordingly.

Thanks,

  Bernhard

Bernhard Kaindl (7):
  xen/mm: Refactor claim deduction for later functional changes
  xen/mm: Allow free pages to cover a claims shortfall
  xen/mm: Optimise getting free page counts per NUMA node
  xen/mm: Split outstanding claims into global and node totals
  xen/mm: Introduce NUMA-aware memory claim sets
  tools/ocaml/libs/xc: Add an OCaml binding for NUMA-aware claims
  tools/tests/mem-claim: Add a test suite for the memory claim API

 tools/include/xenctrl.h                   |   4 +
 tools/libs/ctrl/xc_domain.c               |  38 +
 tools/ocaml/libs/xc/xenctrl.ml            |  11 +
 tools/ocaml/libs/xc/xenctrl.mli           |  11 +
 tools/ocaml/libs/xc/xenctrl_stubs.c       |  47 +
 tools/tests/mem-claim/.gitignore          |   1 +
 tools/tests/mem-claim/Makefile            |  17 +-
 tools/tests/mem-claim/accounting-1.h      | 401 +++++++++
 tools/tests/mem-claim/input-phase1.h      | 171 ++++
 tools/tests/mem-claim/input-phase2.h      |  91 ++
 tools/tests/mem-claim/libtestclaims.c     | 995 ++++++++++++++++++++++
 tools/tests/mem-claim/libtestclaims.h     | 202 +++++
 tools/tests/mem-claim/test-claim-memory.c | 129 +++
 xen/common/domctl.c                       |  56 +-
 xen/common/page_alloc.c                   | 374 +++++++-
 xen/include/public/domctl.h               |  32 +
 xen/include/public/memory.h               |   9 +
 xen/include/xen/mm.h                      |   3 +
 xen/include/xen/sched.h                   |  13 +-
 xen/xsm/flask/hooks.c                     |   1 +
 xen/xsm/flask/policy/access_vectors       |   1 +
 21 files changed, 2573 insertions(+), 34 deletions(-)
 create mode 100644 tools/tests/mem-claim/accounting-1.h
 create mode 100644 tools/tests/mem-claim/input-phase1.h
 create mode 100644 tools/tests/mem-claim/input-phase2.h
 create mode 100644 tools/tests/mem-claim/libtestclaims.c
 create mode 100644 tools/tests/mem-claim/libtestclaims.h
 create mode 100644 tools/tests/mem-claim/test-claim-memory.c

-- 
2.39.5


