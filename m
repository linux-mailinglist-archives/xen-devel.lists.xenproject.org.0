Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFnlNU0x+mkRKwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:05:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1C4D2798
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300920.1575349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKK8H-00056d-Df; Tue, 05 May 2026 18:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300920.1575349; Tue, 05 May 2026 18:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKK8H-000558-At; Tue, 05 May 2026 18:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1300920;
 Tue, 05 May 2026 18:04:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKK8F-000552-JB
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:04:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKK8E-00DKn2-WB
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:04:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa312e-e002-0a2a0a5209dd-0a2a45028b28-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:04:30 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa312d-af86-0a2a45020019-a065830883d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:04:30 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id A564342A8FEC;
 Tue,  5 May 2026 14:03:36 -0400 (EDT)
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
Subject: [PATCH 0/3] Sphinx docs: Design Document for NUMA node-affine claim sets
Date: Tue,  5 May 2026 19:03:09 +0100
Message-Id: <cover.1778004073.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778004270-B3B60161-4CC5D9D5/0/0
X-purgate-type: clean
X-purgate-size: 5350
X-Rspamd-Queue-Id: 4FB1C4D2798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.928];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Dear reviewers,

This updated design document forms the basis of the NUMA claims v7
series and is intended to serve as a reference during review.

It extends Xen's memory claim design to support installing claim sets
spanning multiple NUMA nodes atomically. As Roger Pau Monné suggested:

   Ideally, we would need to introduce a new hypercall that allows
   making claims from multiple nodes in a single locked region, as
   to ensure success or failure in an atomic way.

This design documents that model in detail and is integrated into the
Sphinx site below Hypervisor Guide -> Design Documents -> NUMA Claims.

The rendered design document is available here for review:

https://xen.kaindl.dev/claims-v7-design-master/designs/claims/

The Sphinx site can be built and viewed locally as follows:

  git pull git@gitlab.com:bernhardkaindl/xen.git claims-v7-design-master
  make -C docs sphinx-env-build # xdg-open docs/sphinx/html/index.html
  or start a minimal HTTP server:
    (cd docs/sphinx/html; python -m http.server)

Changes since v6
----------------

The review comments from v6 have been incorporated.

In particular, Jan noted that "global" is ambiguous in this context,
and following his suggestion, this series adopts the term host claims
(short for host-wide claims) found here:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00026.html

The helper names have also been adjusted to make domain scope explicit
and to keep the release/set/get operations named consistently:

- deduct_global_claims()         -> domain_release_host_claims()
- deduct_node_claims()           -> domain_release_node_claims()
- domain_set_outstanding_pages() -> domain_set_claim_entries()
- new: domain_get_claim_entries()

This version also keeps the new code minimal for review and avoids
functional duplication. domain_set_claim_entries() now also handles
the legacy XENMEM_claim_pages interface for backwards compatibility,
replacing domain_set_outstanding_pages().

Best regards,

Bernhard

Bernhard Kaindl (3):
  Sphinx docs: Rearrange the design docs into a new dedicated design
    index
  Sphinx docs: Enable autosectionlabels and Mermaid support
  Sphinx docs: Design Document for NUMA node affine claim sets

 .readthedocs.yaml                             |   2 +-
 docs/conf.py                                  |  21 +
 docs/{misc => designs}/cache-coloring.rst     |   4 +-
 docs/designs/claims/accounting.rst            | 331 +++++++++++++++
 docs/designs/claims/design.rst                | 243 +++++++++++
 docs/designs/claims/development.rst           | 197 +++++++++
 docs/designs/claims/implementation.rst        | 393 ++++++++++++++++++
 docs/designs/claims/index.rst                 |  48 +++
 docs/designs/claims/installation.rst          |  70 ++++
 docs/designs/claims/invariants.mmd            |  35 ++
 docs/designs/claims/performance.rst           |  33 ++
 docs/designs/claims/protection.rst            | 200 +++++++++
 docs/designs/claims/redeeming.rst             |  71 ++++
 docs/designs/claims/terminology.rst           | 138 ++++++
 docs/designs/claims/use-cases.rst             |  39 ++
 docs/designs/index.rst                        |  17 +
 docs/designs/launch/hyperlaunch.rst           |   4 +-
 docs/designs/launch/index.rst                 |  10 +
 docs/glossary.rst                             |  12 +-
 .../dom/DOMCTL_claim_memory-data.mmd          |  43 ++
 .../dom/DOMCTL_claim_memory-seqdia.mmd        |  23 +
 .../dom/DOMCTL_claim_memory-workflow.mmd      |  23 +
 docs/guest-guide/dom/DOMCTL_claim_memory.rst  | 221 ++++++++++
 docs/guest-guide/dom/index.rst                |  14 +
 docs/guest-guide/index.rst                    |  23 +
 docs/guest-guide/mem/XENMEM_claim_pages.rst   | 102 +++++
 docs/guest-guide/mem/index.rst                |  12 +
 docs/hypervisor-guide/index.rst               |  12 +-
 docs/index.rst                                |   2 -
 29 files changed, 2331 insertions(+), 12 deletions(-)
 rename docs/{misc => designs}/cache-coloring.rst (99%)
 create mode 100644 docs/designs/claims/accounting.rst
 create mode 100644 docs/designs/claims/design.rst
 create mode 100644 docs/designs/claims/development.rst
 create mode 100644 docs/designs/claims/implementation.rst
 create mode 100644 docs/designs/claims/index.rst
 create mode 100644 docs/designs/claims/installation.rst
 create mode 100644 docs/designs/claims/invariants.mmd
 create mode 100644 docs/designs/claims/performance.rst
 create mode 100644 docs/designs/claims/protection.rst
 create mode 100644 docs/designs/claims/redeeming.rst
 create mode 100644 docs/designs/claims/terminology.rst
 create mode 100644 docs/designs/claims/use-cases.rst
 create mode 100644 docs/designs/index.rst
 create mode 100644 docs/designs/launch/index.rst
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory.rst
 create mode 100644 docs/guest-guide/dom/index.rst
 create mode 100644 docs/guest-guide/mem/XENMEM_claim_pages.rst
 create mode 100644 docs/guest-guide/mem/index.rst

-- 
2.39.5


