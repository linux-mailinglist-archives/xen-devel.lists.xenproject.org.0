Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEI7JxTV1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:57:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA543AC631
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274591.1560690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3B7-0003FM-My; Tue, 07 Apr 2026 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274591.1560690; Tue, 07 Apr 2026 09:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3B7-0003CK-KQ; Tue, 07 Apr 2026 09:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1274591;
 Tue, 07 Apr 2026 09:56:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3B5-0003CE-Rw
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3B4-00Fch6-Pk
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:56:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d4e6-e002-0a2a0a5209dd-0a2a450ca214-22
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:56:58 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d4e9-f40c-0a2a450c0019-a0658308be38-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:56:58 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id E4006421B5C5;
 Tue,  7 Apr 2026 05:56:17 -0400 (EDT)
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/5] xen: Introduce NUMA-aware claim sets for domains
Date: Tue,  7 Apr 2026 10:54:25 +0100
Message-Id: <cover.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775555818-FFB44A3D-68112756/0/0
X-purgate-type: clean
X-purgate-size: 2870
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.899];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bernhardk-xen-review.readthedocs.io:url]
X-Rspamd-Queue-Id: DBA543AC631
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

This series implements that model.

A claim set can contain multiple node-specific claims and an optional
global claim for memory that may come from any NUMA node. The new domctl
installs the full claim set atomically, and the allocator is updated so
that claim checks and claim consumption follow the new semantics.

The series has been reworked substantially in response to earlier review.
Because of that, it is likely best reviewed as a fresh series rather than
incrementally.

Patch summary:

1. xen/mm: Refactor retiring claims in preparation for use in functional changes
2. xen/mm: Claims check: Allow free pages to cover a shortfall of claims
3. xen/mm: Optimise getting free page counts per NUMA node
4. xen/mm: Split d->outstanding_pages to global_claims & node_claims
5. xen/mm: Introduce Claim Sets for multiple NUMA nodes

The design document submitted ahead of this series may also help with
review. It explains the background, design rationale, and implementation
details.

Rendered version:
https://bernhardk-xen-review.readthedocs.io/node-claims-v5/designs/claims/

Posted version:
https://lists.xenproject.org/archives/html/xen-devel/2026-04/msg00108.html

Many thanks to everyone who contributed to the earlier work and review,
especially Alejandro Vallejo, Jan Beulich, Andrew Cooper, Roger Pau
Monné, Marcus Granado, and Edwin Török.

Thanks for your review.

Bernhard Kaindl

Bernhard Kaindl (5):
  xen/mm: Refactor retiring claims in preparation for functional changes
  xen/mm: alloc pages: Allow free pages to cover a shortfall of claims
  xen/mm: Optimise getting free page counts per NUMA node
  xen/mm: Split d->outstanding_pages to global_claims & node_claims
  xen/mm: Introduce Claim Sets for multiple NUMA nodes

 tools/include/xenctrl.h             |   4 +
 tools/libs/ctrl/xc_domain.c         |  38 +++
 xen/common/domctl.c                 |  56 +++-
 xen/common/page_alloc.c             | 379 ++++++++++++++++++++++++++--
 xen/include/public/domctl.h         |  32 +++
 xen/include/public/memory.h         |   9 +
 xen/include/xen/mm.h                |   3 +
 xen/include/xen/sched.h             |  13 +-
 xen/xsm/flask/hooks.c               |   1 +
 xen/xsm/flask/policy/access_vectors |   1 +
 10 files changed, 509 insertions(+), 27 deletions(-)

-- 
2.39.5


