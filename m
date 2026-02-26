Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGutN8lZoGlPigQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:33:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1F1A79D9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241822.1542718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcQ0-0003zs-7w; Thu, 26 Feb 2026 14:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241822.1542718; Thu, 26 Feb 2026 14:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcQ0-0003xa-58; Thu, 26 Feb 2026 14:32:44 +0000
Received: by outflank-mailman (input) for mailman id 1241822;
 Thu, 26 Feb 2026 14:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcPz-0003xU-6L
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:32:43 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff1aa8e9-131f-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 15:32:37 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 0AA59427FB2E;
 Thu, 26 Feb 2026 09:32:15 -0500 (EST)
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
X-Inumbo-ID: ff1aa8e9-131f-11f1-9ccf-f158ae23cfc8
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v4 0/10] xen: Add NUMA-aware memory claims for domains
Date: Thu, 26 Feb 2026 14:29:14 +0000
Message-Id: <cover.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid]
X-Rspamd-Queue-Id: 00B1F1A79D9
X-Rspamd-Action: no action


This series introduces NUMA-aware memory claims. Xen allocates the claimed
memory only for allocations from domains with a claim for this memory.

The new hypercall API is designed to support staking claims on multiple NUMA
nodes for a domain. It provides a foundation that can be extended to support
multi-node claims without changing the hypercall API.

Patch Structure:

 1. xen/page_alloc:  Extract claim consumption on allocation into static inline
 2. xen/page_alloc:  Add per-node free page counts; make counters unsigned long
 3. xen/page_alloc:  Add the implementation of NUMA-node-specific claims
 4. xen/page_alloc:  Consolidate per-node counters into avail[node][maxzone+x]
                     Is optional: transparent, no functional change, not needed
 5. xen/domain:      Add the XEN_DOMCTL_claim_memory hypercall handler
 6. xsm/flask:       Add a Flask security policy for the new hypercall
 7. libs/ctrl/xc:    Add the libxenctrl API xc_domain_claim_memory()
 8. ocaml/libx/xc:   Add the OCaml binding for xc_domain_claim_memory()
 9. tools/tests:     Add testing per-node claims and claims protection
10. doc/guest-guide: Add comprehensive API documentation

The updated guest-guide is deployed here for reviewing the created output:
https://bernhardk-xen-review.readthedocs.io/v4.22-claims.v4/guest-guide/

Changes in v4:

- The logic for adjusting claimed pages on allocation has been completely
  reworked to align with recent upstream changes. (Roger Pau Monné)

- The check for node memory availability has been replaced with a corrected
  implementation. (Marcus Granado, Roger Pau Monné, Bernhard Kaindl)

- The new hypercall API patch has been refactored and split into separate
  patches for the DOMCTL, Flask policy, and libxenctrl implementation.

- Added initial tests and Sphinx documentation for the new API.

- With improvements and rebasing on upstream changes, this series has changed
  very much. Reviewing it as a whole is recommended over an incremental review.

Credits:

- Alejandro Vallejo developed the initial version
- Roger Pau Monné updated the implementation and upstreamed key improvements
- Marcus Granado contributed analysis and suggestions during development
- Bernhard Kaindl developed the new domctl API, extended tests and documentation
  and developed the refactored handler for consuming claims on allocation.

Comments and feedback welcome.

Bernhard Kaindl (10):
  xen/page_alloc: Extract code for consuming claims into inline function
  xen/page_alloc: Optimize getting per-NUMA-node free page counts
  xen/page_alloc: Implement NUMA-node-specific claims
  xen/page_alloc: Consolidate per-node counters into avail[] array
  xen/domain: Add DOMCTL handler for claiming memory with NUMA awareness
  xsm/flask: Add XEN_DOMCTL_claim_memory to flask
  tools/lib/ctrl/xc: Add xc_domain_claim_memory() to libxenctrl
  tools/ocaml/libs/xc: add OCaml domain_claim_memory binding
  tools/tests: Update the claims test to test claim_memory hypercall
  docs/guest-guide: document the memory claim hypercalls

 .readthedocs.yaml                             |  13 +-
 docs/conf.py                                  |   6 +-
 .../dom/DOMCTL_claim_memory-classes.mmd       |  51 ++++
 .../dom/DOMCTL_claim_memory-seqdia.mmd        |  23 ++
 .../dom/DOMCTL_claim_memory-workflow.mmd      |  23 ++
 docs/guest-guide/dom/DOMCTL_claim_memory.rst  | 125 ++++++++
 docs/guest-guide/dom/index.rst                |  14 +
 docs/guest-guide/index.rst                    |  23 ++
 docs/guest-guide/mem/XENMEM_claim_pages.rst   |  68 +++++
 docs/guest-guide/mem/index.rst                |  12 +
 docs/hypervisor-guide/index.rst               |   5 +
 docs/hypervisor-guide/mm/claims.rst           | 114 +++++++
 docs/hypervisor-guide/mm/index.rst            |  10 +
 tools/flask/policy/modules/dom0.te            |   1 +
 tools/flask/policy/modules/xen.if             |   1 +
 tools/include/xenctrl.h                       |   4 +
 tools/libs/ctrl/xc_domain.c                   |  27 ++
 tools/ocaml/libs/xc/xenctrl.ml                |  11 +
 tools/ocaml/libs/xc/xenctrl.mli               |  11 +
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  43 +++
 tools/tests/mem-claim/test-mem-claim.c        | 277 ++++++++++++++++--
 xen/common/domain.c                           |  32 +-
 xen/common/domctl.c                           |   9 +
 xen/common/memory.c                           |   3 +-
 xen/common/page_alloc.c                       | 254 +++++++++++++---
 xen/include/public/domctl.h                   |  38 +++
 xen/include/xen/domain.h                      |   2 +
 xen/include/xen/mm.h                          |   4 +-
 xen/include/xen/sched.h                       |   1 +
 xen/xsm/flask/hooks.c                         |   3 +
 xen/xsm/flask/policy/access_vectors           |   2 +
 31 files changed, 1134 insertions(+), 76 deletions(-)
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-classes.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory.rst
 create mode 100644 docs/guest-guide/dom/index.rst
 create mode 100644 docs/guest-guide/mem/XENMEM_claim_pages.rst
 create mode 100644 docs/guest-guide/mem/index.rst
 create mode 100644 docs/hypervisor-guide/mm/claims.rst
 create mode 100644 docs/hypervisor-guide/mm/index.rst

-- 
2.39.5


