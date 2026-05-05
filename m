Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFntDvox+mlXKgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:07:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F84D27F9
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300975.1575377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKBK-0006jN-Ap; Tue, 05 May 2026 18:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300975.1575377; Tue, 05 May 2026 18:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKBK-0006hm-6v; Tue, 05 May 2026 18:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1300975;
 Tue, 05 May 2026 18:07:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKKBI-0006hQ-3C
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:07:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKKBH-00AewW-GX
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:07:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31b2-2eae-0a2a0a5409dd-0a2a45099292-38
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:07:39 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31ea-2497-0a2a45090019-a06583098070-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:07:38 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 1741C81E0C37;
 Tue,  5 May 2026 14:06:34 -0400 (EDT)
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
Subject: [PATCH 3/3] Sphinx docs: Design Document for NUMA node affine claim sets
Date: Tue,  5 May 2026 19:03:12 +0100
Message-Id: <cb3104caf3e1c80a6027058488b32f81a616becf.1778004073.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778004073.git.bernhard.kaindl@citrix.com>
References: <cover.1778004073.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778004459-400AB9F3-9B7EB872/3/8697954094
X-purgate-type: clean.bounce
X-purgate-size: 107997
X-Rspamd-Queue-Id: 5E7F84D27F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.935];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]

This design extends Xen's memory claim handling to support claim sets
spanning multiple NUMA nodes. Roger Pau Monné described it as:

  Ideally, we would need to introduce a new hypercall that allows
  making claims from multiple nodes in a single locked region, as to
  ensure success or failure in an atomic way.

This design documents this model in detail and is integrated into the
Sphinx site below Hypervisor Guide -> Design Documents -> NUMA Claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
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
 docs/designs/index.rst                        |   1 +
 docs/glossary.rst                             |  12 +-
 .../dom/DOMCTL_claim_memory-data.mmd          |  43 ++
 .../dom/DOMCTL_claim_memory-seqdia.mmd        |  23 +
 .../dom/DOMCTL_claim_memory-workflow.mmd      |  23 +
 docs/guest-guide/dom/DOMCTL_claim_memory.rst  | 221 ++++++++++
 docs/guest-guide/dom/index.rst                |  14 +
 docs/guest-guide/index.rst                    |  23 +
 docs/guest-guide/mem/XENMEM_claim_pages.rst   | 102 +++++
 docs/guest-guide/mem/index.rst                |  12 +
 22 files changed, 2269 insertions(+), 3 deletions(-)
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
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory.rst
 create mode 100644 docs/guest-guide/dom/index.rst
 create mode 100644 docs/guest-guide/mem/XENMEM_claim_pages.rst
 create mode 100644 docs/guest-guide/mem/index.rst

diff --git a/docs/designs/claims/accounting.rst b/docs/designs/claims/accounting.rst
new file mode 100644
index 000000000000..cf0aad56a0a8
--- /dev/null
+++ b/docs/designs/claims/accounting.rst
@@ -0,0 +1,331 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Accounting
+##########
+
+.. contents:: Table of Contents
+   :local:
+
+.. note::
+   Claims accounting state is only updated while holding the :c:var:`heap_lock`.
+   See :ref:`designs/claims/accounting:Locking of the claims state` for details
+   on the locks used to protect the claims accounting state.
+
+This section formalises the internal state and invariants that Xen must
+maintain to ensure correctness.
+
+
+For readers following the design in order, the preceding sections are:
+
+1. :doc:`/designs/claims/design` introduces the overall model and goals.
+2. :doc:`/designs/claims/installation` explains how claim sets are installed.
+3. :doc:`/designs/claims/protection` describes how claimed memory is protected
+   during allocation.
+4. :doc:`/designs/claims/redeeming` explains how claims are redeemed when
+   allocations succeed.
+
+Overview
+^^^^^^^^
+
+.. table:: Table 1: Claims accounting: All accesses, Aggregate state,
+           and invariants protected by :c:var:`heap_lock`.
+   :widths: auto
+
+   ============ =========================================== =======================
+   Level           Claims must be lower or equal to          the available memory
+   ============ =========================================== =======================
+   Total        :c:var:`outstanding_claims` =               :c:var:`total_avail_pages` =
+
+                 = Aggregate state:
+                  SUM() over all domains:                   Aggregate state:
+                  SUM(:c:member:`domain.outstanding_pages`)   SUM(:c:var:`node_avail_pages`)
+
+                Also, it is the sum of claims
+                over all nodes:
+
+                 = Aggregate state:
+                  SUM(:c:expr:`node_outstanding_claims[*]`)
+   Node         :c:expr:`node_outstanding_claims[node]`     :c:expr:`node_avail_pages[node]`
+
+                  Aggregate state over all domains:          Aggregate of the free
+                  SUM(:c:expr:`domain.claims[node]`)         lists of all zones on node
+   Dom per-node :c:member:`domain.node_claims` =
+                SUM(:c:expr:`domain.claims[node]`)          :c:expr:`node_avail_pages[node]`
+   Total claims :c:member:`domain.outstanding_pages`        :c:var:`total_avail_pages`
+   Memory limit :c:member:`domain.outstanding_pages`         Invariant: must be
+                + :c:func:`domain_tot_pages`                 lower or equal to
+                                                             :c:member:`domain.max_pages`
+   ============ =========================================== =======================
+
+
+Total claims and available memory
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+ These variables tracking the total claims and available memory in the system
+ are aggregates of the actual per-node and per-domain values.
+
+
+ They are only maintained for efficient checks in the allocator hot paths, to
+ quickly determine if an allocation can be satisfied from unclaimed memory or
+ if further checks are needed to determine if the claims of the domain can be
+ used to free up memory for the allocation. This also ensures that the sum of
+ all claims never exceeds the total free memory in the system.
+
+
+ The number of unclaimed pages across all nodes in the system is derived as
+ :c:var:`total_avail_pages` minus :c:var:`outstanding_claims`.
+ This number is then used to:
+
+ - Permit allocation requests if they can be satisfied from unclaimed pages.
+ - Ensure that the sum of all claims never exceeds the total free memory.
+
+ .. c:var:: unsigned long total_avail_pages
+
+   Total available pages in the system across all NUMA nodes.
+   It is the aggregate of the per-node available pages:
+   :c:var:`total_avail_pages` = SUM(:c:expr:`node_avail_pages[MAX_NUMNODES]`)
+
+ .. c:var:: unsigned long outstanding_claims
+
+   The total sum of all claims across all domains.
+   :c:var:`outstanding_claims` =
+   SUM(:c:var:`domain.outstanding_pages`)
+
+Per-node claims and available memory
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+ .. c:var:: unsigned long node_avail_pages[MAX_NUMNODES]
+
+   Available pages for each NUMA node, including both free and claimed pages.
+   This is used for validating that node claims do not exceed the available
+   memory on the respective NUMA node.
+
+ .. c:var:: unsigned long node_outstanding_claims[MAX_NUMNODES]
+
+   The total claims across all domains for each NUMA node, indexed by node
+   ID. This is maintained for efficient checks in the allocator hot paths.
+
+This diagram illustrates the claims accounting state and the invariants:
+
+Accounting diagram
+^^^^^^^^^^^^^^^^^^
+
+ .. mermaid:: invariants.mmd
+   :caption: Diagram: Claims accounting state and invariants
+
+Claims accounting state for each domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+ .. c:struct:: domain
+
+   The main structure representing a domain in Xen. It includes the
+   claims accounting state for the domain, including both host-wide
+   and node-specific claims, as well as the maximum page limits for the
+   domain and the lock protecting the domain's page allocation counts.
+
+   While the domain's page counts are currently `unsigned int`, work is
+   underway to change them to `unsigned long` to support larger page counts
+   beyond 16 TB. The code is already designed to anticipate this change and
+   work with either `unsigned int` or `unsigned long` page counts equally well.
+
+   .. c:member:: unsigned int outstanding_pages
+
+      The domain's total claim, representing the number of pages claimed
+      for the domain.
+
+   .. c:member:: unsigned int node_claims
+
+      The total of the domain's node-affine claims, maintained for efficient
+      checks in the allocator hot paths without needing to sum over the
+      per-node claims each time. It is equal to the sum of
+      :c:expr:`claims[MAX_NUMNODES]` for all nodes.
+
+   .. c:member:: unsigned int claims[MAX_NUMNODES]
+
+      The domain's claims for each :term:`NUMA node`, indexed by node ID.
+
+      As the storage for ``struct`` :c:struct:`domain` is allocated using a
+      dedicated page for each domain, this array allows for efficient and
+      fast storage with direct indexing, without consuming any additional
+      memory for an extra allocation.
+
+
+      The claims for each node are used for NUMA-affine domains to specify
+      the amount of memory claimed for each node, to ensure that the domain's
+      claims for each node do not exceed the available memory on that node,
+      and to allow the allocator to redeem claims from the appropriate nodes
+      when allocating memory for the domain.
+
+      .. literalinclude:: ../../../xen/common/domain.c
+         :language: C
+         :caption: Allocation of the domain structure in ``xen/common/domain.c``
+         :start-at: alloc_domain_struct
+         :end-at: }
+         :emphasize-lines: 7, 12, 14
+         :linenos:
+         :lineno-match:
+
+      The page allocated for ``struct`` :c:struct:`domain` is large enough
+      to accommodate this array several times, even beyond the current
+      :c:macro:`MAX_NUMNODES` limit of 64. It should be sufficient even for
+      future expansion of the maximum number of supported NUMA nodes if
+      needed. The allocation has a build-time assertion for safety to ensure
+      that ``struct`` :c:struct:`domain` fits within the allocated page.
+
+
+      The sum of these claims is stored in :c:member:`domain.node_claims`
+      for efficient checks in the allocator hot paths which need to know
+      the total number of node claims for the :term:`domain`.
+
+   .. c:member:: unsigned int max_pages
+
+      The maximum number of pages the domain is allowed to claim, set at
+      domain creation time.
+
+   .. c:member:: rspinlock_t page_alloc_lock
+
+      Lock for checking :c:func:`domain_tot_pages` on top of new claims
+      against :c:member:`domain.max_pages` when installing these new claims.
+      This is a recursive spinlock to allow for nested calls into the allocator
+      while holding it, such as when redeeming claims during page allocation.
+      It is taken before :c:var:`heap_lock` when installing claims to ensure a
+      consistent locking order and must not be taken while holding
+      :c:var:`heap_lock` to avoid deadlocks.
+
+   .. c:member:: nodemask_t node_affinity
+
+      A :c:type:`nodemask_t` representing the set of NUMA nodes the domain
+      is affine to. This is used for efficient checks in the allocator hot
+      paths to quickly get the set of nodes a domain is affine to for
+      memory allocation decisions.
+
+Claims accounting invariants
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+   Xen must maintain the following invariants at all times to ensure correctness
+   of claims accounting:
+
+ - For all claims, including node-affine and host-wide claims:
+    :c:var:`outstanding_claims` :math:`\le` :c:var:`total_avail_pages`
+
+ - For node-specific claims:
+    :c:expr:`node_outstanding_claims[alloc_node]` :math:`\le`
+    :c:expr:`node_avail_pages[alloc_node]`
+
+ - For a domain's overall claims:
+    :c:var:`domain.outstanding_pages` +
+    :c:var:`domain_tot_pages` :math:`\le` :c:var:`domain.max_pages`
+
+    See :doc:`redeeming` for more information on this invariant.
+
+Constants
+^^^^^^^^^
+
+ .. c:macro:: MAX_NUMNODES
+
+   The maximum number of NUMA nodes supported by Xen. Used for validating
+   node IDs in the :c:type:`memory_claim_t` entries of claim sets.
+   When Xen is built without NUMA support, it is 1.
+
+   The default on x86_64 is 64 which is sufficient for current hardware and
+   allows for efficient storage of e.g. the :c:var:`node_online_map` for
+   online nodes and :c:member:`domain.node_affinity` in a single 64-bit value,
+   and in the :c:expr:`domain.claims[MAX_NUMNODES]` array.
+
+   ``xen/arch/Kconfig`` limits the maximum number of NUMA nodes to 64. While
+   Xen can be compiled for up to 254 nodes, configuring machines to split
+   the installed memory into more than 64 nodes would be unusual.
+   For example, dual-socket servers, even when using multiple chips per CPU
+   package should typically be configured for 2 NUMA nodes by default.
+
+ .. c:var:: nodemask_t node_online_map
+
+   A bitmap representing which NUMA nodes are currently online in the system.
+   This is used for validating that claims are only made for online nodes and
+   for efficient checks in the allocator hot paths to quickly determine which
+   nodes are online. Currently, Xen does not support hotplug of NUMA nodes,
+   so this is set at boot time based on the platform firmware configuration
+   and does not change at runtime.
+
+Types
+^^^^^
+
+ .. c:type:: uint8_t nodeid_t
+
+   Type for :term:`NUMA node` IDs. It is passed to Xenctrl using the
+   :c:var:`mem_flags` argument of :c:func:`xc_domain_populate_physmap()`
+   and passed to Xen in this form.
+
+   It allocates 8 bits in the flags for the node ID, which limits the
+   theoretical maximum value of :c:macro:`CONFIG_NR_NUMA_NODES` at 254
+   (255 is :c:macro:`NUMA_NO_NODE`), which is far beyond the current
+   maximum of 64 supported by Xen and should be sufficient for all
+   practical purposes. This also allows for efficient storage of NUMA
+   nodes in arrays indexed by node ID and in :c:type:`nodemask_t` bitmaps
+   :c:var:`node_online_map` and :c:member:`domain.node_affinity` for
+   efficient checks in the allocator hot paths.
+
+ .. c:type:: nodemask_t
+
+   A bitmap representing a set of NUMA nodes, used for status information
+   like :c:var:`node_online_map` and the :c:member:`domain.node_affinity`,
+   and to track which nodes are online and which nodes are in a domain's
+   node affinity.
+
+Memflags
+^^^^^^^^
+
+ .. c:type:: memflags
+
+    Flags for memory allocation requests that can affect the allocation
+    behaviour, such as node preference and whether the request is for an
+    exact node.
+
+ .. c:macro:: MEMF_no_owner
+
+    Flag for memory allocation requests to indicate that the allocation
+    shall not be owned by a domain, and as part of that,
+    :c:macro:`MEMF_no_refcount` is also set.
+
+ .. c:macro:: MEMF_no_refcount
+
+    Flag for memory allocation requests to indicate that the request is not
+    reference-counted to a domain's memory allocation state, and as part of
+    that, claims of a domain cannot be used to protect and redeem the
+    allocation using claims. This is used for requests which are not for
+    domains or which explicitly bypass reference-counting for other reasons.
+
+ .. c:macro:: MEMF_no_scrub
+
+    Flag for memory allocation requests to indicate that the allocated memory
+    should not be scrubbed (zeroed) before being used. This is used for
+    performance reasons for certain types of allocations where the caller
+    guarantees that the memory will be properly initialized before use.
+
+Locking of the claims state
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+ .. :c:member:: domain.page_alloc_lock
+
+    If :c:var:`domain.page_alloc_lock` is needed, e.g. to check
+    :c:func:`domain_tot_pages` on top of new claims against
+    :c:var:`domain.max_pages` for the domain, it needs to be taken before
+    :c:var:`heap_lock` for consistent locking order to avoid deadlocks.
+
+ .. c:var:: spinlock_t heap_lock
+
+    Lock for all heap operations including claims. It protects the claims
+    state and invariants from concurrent updates and ensures that checks
+    in the allocator hot paths see a consistent view of the claims state.
+
+Helper functions
+^^^^^^^^^^^^^^^^
+
+ .. c:function:: inline unsigned int domain_tot_pages(struct domain *d)
+
+   :param d: The domain for which to calculate the total pages.
+   :type d: struct domain *
+   :returns: The total pages allocated to the domain.
+
+   This function is used for validating that an allocation and the domain's
+   claims do not exceed :c:member:`domain.max_pages`.
diff --git a/docs/designs/claims/design.rst b/docs/designs/claims/design.rst
new file mode 100644
index 000000000000..882dc3c5c1f1
--- /dev/null
+++ b/docs/designs/claims/design.rst
@@ -0,0 +1,243 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+#############
+Claims Design
+#############
+
+.. contents:: Table of Contents
+    :backlinks: entry
+    :local:
+
+************
+Introduction
+************
+
+Xen's page allocator supports a :term:`claims` API that allows privileged
+:term:`domain builders` to reserve a quantity of available memory before
+:term:`populating` the :term:`guest physical memory` of new :term:`domains`
+they are creating, configuring, and building.
+
+These reservations are called :term:`claims`. They ensure that the claimed
+memory remains available for the :term:`domains` when allocating it, even if
+other :term:`domains` are allocating memory at the same time.
+
+:term:`Installing claims` is a privileged operation performed by
+:term:`domain builders` before they populate the :term:`guest physical memory`.
+This prevents other :term:`domains` from allocating memory earmarked for
+:term:`domains` under construction. Xen maintains the per-domain claim state
+for pages that are claimed but not yet allocated.
+
+When claim installation succeeds, Xen updates the claim state to reflect the
+new targets and protects the claimed memory until it is allocated or the claim
+is released. As Xen allocates pages for the domain, claims are redeemed by
+reducing the claim state by the size of each allocation.
+
+************
+Design Goals
+************
+
+The design's primary goals are:
+
+1. Allow :term:`domain builders` to claim memory
+   on multiple :term:`NUMA nodes` using a :term:`claim set` atomically.
+
+2. Preserve the existing :c:macro:`XENMEM_claim_pages` hypercall command
+   for compatibility with existing :term:`domain builders` and its legacy
+   semantics, while introducing a new, unrestricted hypercall command for
+   new use cases such as NUMA-aware claim sets.
+
+3. Host-wide claims are supported for compatibility with existing
+   :term:`domain builders` and for use cases where a flexible claim that
+   can exists in the level of the host is desirable.
+
+   It means the global outstanding claims count of the host is not obsolete
+   and needs to be maintained as it needs to account for such host-wide claims.
+
+4. Use fast allocation-time claims protection in the allocator's hot paths
+   to protect claimed memory from parallel allocations by other domain
+   builders in case of parallel domain builds, and to protect claimed
+   memory from all other allocations as well.
+
+***************
+Design Overview
+***************
+
+The legacy :c:macro:`XENMEM_claim_pages` hypercall is superseded by
+:c:macro:`XEN_DOMCTL_claim_memory`. This hypercall installs a :term:`claim set`.
+It is an array of :c:type:`memory_claim_t` entries, where each entry specifies
+a page count and a target: either a specific NUMA node ID or a selector.
+
+Like legacy claims, claim sets are validated and installed under
+:c:member:`domain.page_alloc_lock` and :c:var:`heap_lock`: Either the entire
+set is accepted, or the request fails with no side effects.  Repeated calls
+to install claims replace any existing claims for the domain rather than
+accumulating.
+
+As installing claim sets after allocations is not a supported use case,
+the legacy behaviour of subtracting existing allocations from installed
+claims is somewhat surprising and counterintuitive, and page exchanges
+make incremental per-node tracking of already-allocated pages on a per-node
+basis difficult. Therefore, claim sets do not retain the legacy behaviour of
+subtracting existing allocations, optionally on a per-node basis, from the
+installed claims across the individual claim set entries.
+
+Summary:
+
+- Legacy domain builders can continue to use the previous (now deprecated)
+  :c:expr:`XENMEM_claim_pages` hypercall command to install legacy claims.
+
+- Updated domain builders can take advantage of claim sets to install
+  NUMA-aware :term:`claims` on multiple :term:`NUMA nodes` and/or claims
+  that are not bound to specific nodes. It has more intuitive semantics
+  that do not subtract existing allocations from the installed claims.
+  Such semantics are also simpler to understand and maintain, and are not
+  affected by the complexity of tracking existing allocations on a per-node
+  basis across page exchanges happening concurrently with claim installation
+  for new domains under construction.
+
+For readers following the design in order, the next sections cover the
+following topics:
+
+1. :doc:`/designs/claims/installation` explains how claim sets are installed.
+2. :doc:`/designs/claims/protection` describes how claimed memory is
+   protected during allocation.
+3. :doc:`/designs/claims/redeeming` explains how claims are redeemed as
+   allocations succeed.
+4. :doc:`/designs/claims/accounting` describes the accounting model that
+   underpins those steps.
+
+********************
+Key design decisions
+********************
+
+.. glossary::
+
+ :c:expr:`node_outstanding_claims[MAX_NUMNODES]`
+  Tracks the sum of all claims on a node. :c:func:`get_free_buddy()` checks
+  it before scanning zones on a node, so claimed memory is protected from
+  other allocations.
+
+ :c:expr:`redeem_claims_for_allocation()`
+   When allocating memory for a domain, the page allocator redeems the matching
+   claims for this allocation, ensuring the domain's total memory allocation as
+   :c:func:`domain_tot_pages` plus :c:member:`domain.outstanding_pages` remain
+   within the domain's limits, defined by :c:member:`domain.max_pages`.
+   See :doc:`redeeming` for details on redeeming claims.
+
+ :c:expr:`domain.outstanding_pages`
+  It remains the authoritative source for the total outstanding claims of a
+  domain, and is updated on claim installation and redemption. It includes
+  both host-wide claims and node-specific claims.
+  Support for :term:`host-wide claims` is maintained for two reasons: first,
+  for compatibility with existing domain builders, and second, for use cases
+  where a flexible claim that can be satisfied from any node is desirable.
+
+  When the preferred NUMA node(s) for a domain do not have sufficient free
+  memory to satisfy the domain's memory requirements, host-wide claims provide
+  a flexible fallback for the memory shortfall from the preferred node(s) that
+  can be satisfied from any available node.
+
+  In this case, :term:`domain builders` can use a combination of passing
+  the preferred node to :c:func:`xc_domain_populate_physmap()` and
+  :term:`NUMA node affinity` to steer allocations towards the preferred
+  NUMA node(s), while letting host-wide claims ensure that the shortfall
+  is available.
+
+  This allows the domain builder to define a set of desired NUMA nodes to
+  allocate from and even specify which nodes to prefer for an allocation,
+  but the claim for the shortfall is flexible, not specific to any node.
+
+*********
+Non-goals
+*********
+
+Using per-node allocator data
+=============================
+
+Some data structures could be moved into the per-node allocator data
+allocated by `init_node_heap()` to avoid bouncing those data structures
+between nodes. Those can be moved to the per-node allocator data in the
+future, but that is not a priority. While that would reduce this bouncing,
+it would not eliminate the need to take the global :c:var:`heap_lock`,
+which is still needed to protect the allocator's state during allocation
+and freeing of pages.
+
+The synchronisation point for taking the global :c:var:`heap_lock` is
+the main point of contention during allocation, freeing and scrubbing
+pages. The overhead of accessing the per-node claims accounting data
+is expected to be minimal.
+
+Avoiding the :c:var:`heap_lock` would be difficult to achieve as it
+would require updating the page allocator to maintain atomic updates
+of a new ``total_unclaimed_pages`` counter, which would be decremented
+on allocation and claims installation and incremented on freeing of
+pages and claims, and to check that counter in the hot path of the
+allocator to protect claimed memory from other allocations.
+
+However, we aim to move that data into the per-node allocator data in the
+future to reduce the need to bounce those data structures between nodes.
+
+Legacy behaviours
+=================
+
+Installing claims is a privileged operation performed by domain builders
+before they populate guest memory. As such, tracking previous allocations
+is not in scope for claims.
+
+For the following reasons, claim sets do not retain the legacy behaviour
+of subtracting existing allocations from installed claims:
+
+- Xen does not currently maintain a ``d->node_tot_pages[node]`` count,
+  and the hypercall to exchange extents of memory with new memory makes
+  such accounting relatively complicated.
+
+- The legacy behaviour is somewhat surprising and counterintuitive.
+  Because installing claims after allocations is not a supported use case,
+  subtracting existing allocations at installation time is unnecessary.
+
+- Claim sets are a new API and can provide more intuitive semantics
+  without subtracting existing allocations from installed claims. This
+  also simplifies the implementation and makes it easier to maintain.
+
+Versioned hypercall
+===================
+
+The :term:`domain builders` using the :c:macro:`XEN_DOMCTL_claim_memory`
+hypercall also need to use other version-controlled hypercalls which
+are wrapped through the :term:`libxenctrl` library.
+
+Wrapping this call in :term:`libxenctrl` is therefore a practical approach;
+otherwise, we would have a mix of version-controlled and unversioned
+:term:`hypercalls`, which could be confusing for API users and for future
+maintenance.
+
+From the domain builders' viewpoint, it is more consistent to expose
+the claims :term:`hypercalls` in the same way as the other calls they use.
+
+Stable interfaces also have drawbacks: with stable syscalls, Linux needs
+to maintain the old interface indefinitely, which can be a maintenance burden
+and can limit the ability to make improvements or changes to the interface
+in the future. Linux carries many system call successor families, e.g.,
+``oldstat``, ``stat``, ``newstat``, ``stat64``, ``fstatat``, ``statx``,
+with similar examples including ``openat``, ``openat2``, ``clone3``, ``dup3``,
+``waitid``, ``mmap2``, ``epoll_create1``, ``pselect6`` and many more.
+Glibc hides that complexity from users by providing a consistent API, but it
+still needs to maintain the old system calls for compatibility.
+
+In contrast, versioned :term:`hypercalls` allow for more flexibility and
+evolution of the API while still providing a clear path to adopt new features.
+The reserved fields and reserved bits in the structures of this hypercall
+allow for many future extensions without breaking existing callers.
+
+*****************
+Future extensions
+*****************
+
+The reserved fields and bits in the structures of this
+hypercall allow for many future extensions without breaking existing callers.
+
+Future extensions could include support for claims on superpages, claims for
+requests with :c:macro:`MEMF_no_refcount`, which allocate P2M, HAP and so on.
+
+See :ref:`designs/claims/protection:Callers using MEMF_no_refcount`
+for more information.
diff --git a/docs/designs/claims/development.rst b/docs/designs/claims/development.rst
new file mode 100644
index 000000000000..c4805b2e080d
--- /dev/null
+++ b/docs/designs/claims/development.rst
@@ -0,0 +1,197 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Development
+###########
+
+.. note::
+
+   This section provides historical context on the development
+   of NUMA-aware claims, including previous implementations and
+   feedback received, to give a better understanding of the
+   design decisions made in the current implementation.
+
+Version history
+---------------
+
+The initial `implementation of single-node claims <v1_>`_ by Alejandro Vallejo
+used the legacy claims hypercall :c:macro:`XENMEM_claim_pages` and passed a
+NUMA node in the existing NUMA node bits of
+:c:expr:`xen_memory_reservation.mem_flags`. This added the flag
+``d->claim_node`` to ``struct`` :c:struct:`domain`, which defined the target
+node for the domain's claims.
+
+.. epigraph::
+
+   Roger Pau Monné reviewed it and proposed an `initial multi-node claim-sets
+   specification <v1m_>`_ that inspired this design:
+
+    The interface here seems to be focused on domains only being allowed to
+    allocate from a single node, or otherwise you must first allocate memory
+    from a node before moving to the next one (which defeats the purpose of
+    claims?).
+
+    I think we want to instead convert ``d->outstanding_pages``
+    into a per-node array, so that a domain can have outstanding
+    claims for multiple NUMA nodes?
+
+    The hypercall interface becomes a bit awkward then, as the toolstack has
+    to perform a different hypercall for each memory claim from a different
+    node (and rollback in case of failure). Ideally we would need to introduce
+    a new hypercall that allows making claims from multiple nodes in a single
+    locked region, as to ensure success or failure in an atomic way.
+
+    -- Roger Pau Monné
+
+   This led to the `v2 <v2_>`_ and `v3 <v3_>`_ series, adding a new hypercall
+   API which designated passing an array of claims. This allowed for a more
+   flexible claim set design targeting multiple NUMA nodes and host-wide claims,
+   but only supported a single claim per domain at that time.
+
+.. sidebar:: Feedback and suggestions for multi-node claim sets
+
+   The initial implementations of single-node claims received
+   feedback from the community, with multiple suggestions to
+   extend the API to support `multi-node claim sets <v1m_>`_.
+   This feedback highlighted the need for a more flexible
+   design that could accommodate claims on multiple NUMA nodes.
+
+Between v3 and v4, `Roger Pau Monné and Andrew Cooper developed and merged
+several critical fixes <fix1_>`_ for Xen's overall claims implementation.
+These fixes also allowed Roger to improve the implementation for redeeming
+claims during domain memory allocation. With a further suggestion by
+Bernhard Kaindl, this enabled a fully working implementation that protected
+claimed memory against parallel allocations by other domain builders.
+
+.. glossary:
+
+v4 series
+ With the `v4 series <v4_>`_, we submitted the combined work that completed the
+ fixes for protecting claimed memory on NUMA nodes. The review process indicated
+ that supporting multiple claim sets would require a `redesign <v4-03_>`_ of
+ claim installation and management, which led to this design document.
+
+v5 series
+ The `v5 series <v5_>`_ implemented the `Claim Sets Design Version 1 <d1>`_
+ with support for multiple claim records per domain, and with a terminology
+ of "consuming claims" for the process of redeeming claims during domain memory
+ allocation and "retiring claims" for releasing claims for the low-level
+ action of reducing the number of claimed pages for redeeming claims for an
+ allocation, when destroying a domain or when claims must be recalled if all
+ memory is claimed and then memory is offlined, which is needed to maintain
+ the invariant that claimed memory can never be larger than free memory.
+
+v6 series
+ The `v6 series <v6_>`_ implemented the `Claim Sets Design Version 2 <d2>`_.
+ The only difference between the two versions is that with design version 2,
+ the initial term `"consuming claims"` was changed to `"redeeming claims"`
+ and the term `"retiring claims"` was changed to `"deducting claims"`.
+
+v7 series
+---------
+
+ The v7 series will implement the `Claim Sets Design Version 3 <d3>`_ or newer
+ with further improvements to the design and implementation:
+
+ 1. As the code often needs the total sum of claims of a domain, this update
+    keeps :c:member:`domain.outstanding_pages` as the total sum of outstanding
+    claims of a domain. This obsoletes the former ``d->global_claims`` which
+    only tracked the unbound claims which were not affine to a NUMA node.
+
+ 2. Avoid code duplication: Replace :c:func:`domain_set_outstanding_pages()`,
+    which handled the legacy claims hypercall :c:macro:`XENMEM_claim_pages`.
+    The new claim sets hypercall handler :c:func:`domain_install_claim_set()`,
+    integrates installing legacy claims for backwards compatibility.
+    The former :c:func:`domain_set_outstanding_pages()` is removed to
+    avoid duplicating the logic of installing claims in both places.
+
+ 3. Improve the clarity of function and variable names. For example, the new
+    hypercall handler :c:func:`domain_install_claim_set()` is more descriptive
+    of its purpose than the former :c:func:`domain_set_outstanding_pages()`:
+
+    ==================================  =======================================
+      Former function name              New function name
+    ==================================  =======================================
+    ``domain_set_outstanding_pages()``  :func:`domain_set_claim_entries()`
+                                        :func:`domain_get_claim_entries()`
+    ``deduct_global_claims()``          :func:`domain_release_host_claims()`
+    ``deduct_node_claims()``            :func:`domain_release_node_claims()`
+    ==================================  =======================================
+
+Testing
+-------
+
+The basis of the `v4 series <v4_>`_ is included in the XenServer XS9 preview
+release, and besides functional product testing, it has been tested to
+meet the performance expectation of customers from improved NUMA placement.
+
+With the `v6 series <v6_>`_, a comprehensive set of functional system tests
+was added to the submission. Also, `a separate host-side integration test
+suite <tv2_>`_ for validating the `v6 series <v6_>`_ was posted.
+
+Further development
+-------------------
+
+Based on review feedback, there is the wish to normalise the page counts of
+the page allocator to ``unsigned long``. A `first patch <u1_>`_ in this direction
+was posted to normalise the types of :c:var:`total_avail_pages` and
+:c:var:`outstanding_claims` to ``unsigned long`` in the page allocator.
+
+Acknowledgements
+----------------
+
+The claim sets design builds on the single-node claims implementation
+described above and the feedback it generated. The following people
+should be acknowledged for their contributions:
+
+- *Edwin Török* for developing the `initial best-effort NUMA placement
+  feature in the XAPI toolstack <xapi_>`_, which inspired the initial
+  implementation of NUMA-aware claims, and his work in productizing and
+  validating the integration of NUMA claims with the XAPI toolstack.
+
+- *Alejandro Vallejo* for starting the development of the NUMA claims series.
+
+- *Jan Beulich* for providing review suggestions that led to many improvements.
+
+- *Roger Pau Monné* for reviewing the initial implementation, `proposing
+  the initial multi-node claim-sets specification <_v1>`_, developing and
+  merging `critical fixes <fix1_>`_ upstream that enabled product-quality
+  support for single-node claims which is the basis of the multi-node
+  claim sets implementation.
+
+- *Andrew Cooper* for integrating and validating the work internally,
+  helping to stabilise and productise the single-node implementation.
+
+- *Bernhard Kaindl* for collaborating on the single-node implementation,
+  developing the claim sets hypercall since version 2, designing and
+  implementing the multi-node claim sets design, the functional system-level
+  test suite and the host-side integration test suite for validating the
+  claim sets implementation.
+
+- *Marcus Granado* for leading the development effort inside XenServer for
+  productising the single-node claims implementation, for providing feedback
+  and suggestions for improving the design and implementation. This included
+  coordinating the work of multiple contributors and stakeholders, integrating
+  the work into XenServer products and ensuring it meets customer requirements.
+
+.. _xapi: https://xapi-project.github.io/new-docs/toolstack/features/NUMA
+.. _fix1:
+   https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00164.html
+.. _v1:
+   https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
+.. _v1m:
+   https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg00484.html
+.. _v2: https://lists.xen.org/archives/html/xen-devel/2025-08/msg01076.html
+.. _v3: https://patchew.org/Xen/cover.1757261045.git.bernhard.kaindl@cloud.com/
+.. _v4:
+    https://lists.xenproject.org/archives/html/xen-devel/2026-02/msg01387.html
+.. _v4-03: https://patchwork.kernel.org/project/xen-devel/
+   patch/6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423
+   .git.bernhard.kaindl@citrix.com/
+.. _d1:
+   https://bernhard-xen.readthedocs.io/en/claim-sets-v1-design/designs/claims
+.. _d2:
+   https://bernhard-xen.readthedocs.io/en/claim-sets-v2-design/designs/claims
+.. _v5: https://patchwork.kernel.org/project/xen-devel/list/?series=1078053
+.. _v6: https://patchwork.kernel.org/project/xen-devel/list/?series=1081139
+.. _tv2: https://patchwork.kernel.org/project/xen-devel/list/?series=1083329
+.. _u1: https://patchwork.kernel.org/project/xen-devel/list/?series=1084344
diff --git a/docs/designs/claims/implementation.rst b/docs/designs/claims/implementation.rst
new file mode 100644
index 000000000000..ed8ed82877af
--- /dev/null
+++ b/docs/designs/claims/implementation.rst
@@ -0,0 +1,393 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Implementation
+##############
+
+.. contents:: Table of Contents
+    :backlinks: entry
+    :local:
+
+.. note:: This part describes implementation details of claims and their
+    interaction with memory allocation in Xen. It covers the functions and
+    data structures involved in :term:`installing claims` and allocating memory
+    with :term:`claims`.
+
+Functions related to the implementation of claims and their interaction
+with memory allocation.
+
+**********************
+Installation of claims
+**********************
+
+This section describes the functions and data structures involved in
+:term:`installing claims` for domains, and the internal functions for
+validating and installing claim sets.
+
+ .. c:function:: int domain_set_outstanding_pages(domain, pages)
+
+    This function is replaced by :c:func:`domain_set_claim_entries()`.
+
+ .. c:function:: int domain_set_claim_entries(domain, nr_entries, claim_set)
+
+    :param domain: The domain for which to set the node claims
+    :param nr_entries: The number of claims in the claim set
+    :param claim_set: The claim set to install for the domain
+    :type domain: struct domain *
+    :type nr_entries: unsigned int
+    :type claim_set: memory_claim_t *
+    :returns: 0 on success, or a negative error code on failure.
+
+    Handles :term:`installing claim sets`. It performs validation of the
+    :term:`claim set` and updates the domain's claims accordingly.
+
+    The function works in four phases:
+
+     1. Validate claim entries and check node-specific claims availability
+     2. Validate the host-wide request against the remaining availability
+     3. Reset any current claims of the domain
+     4. Install the claim set as the domain's claiming state
+
+    Phase 1 checks claim entries for validity and memory availability:
+
+     5. Target must be :c:macro:`XEN_DOMCTL_CLAIM_MEMORY_TOTAL` or a node.
+     6. Each target node may only appear once in the claim set.
+     7. For node-specific claims, requested pages must not exceed the
+        available memory on that node after accounting for existing claims.
+     8. The explicit padding field must be zero for forward compatibility.
+
+    Phase 2 checks:
+
+     9. The total sum of the requested pages must not exceed the total
+        unclaimed memory of the host after accounting for existing claims.
+     10. The claims must not exceed the :c:member:`domain.max_pages` limit.
+         See :doc:`accounting` and :doc:`redeeming` for the accounting
+         checks that enforce the domain's :c:member:`domain.max_pages` limit.
+
+    .. versionadded:: claims-v5
+
+ .. c:function:: int domain_get_claim_entries(domain, nr_entries, claim_set)
+
+    :param domain: The domain for which to retrieve a claim set
+    :param nr_entries: The number of claims in the claim set
+    :param claim_set: The preallocated buffer for up to nr_entries claim entries
+    :type domain: struct domain *
+    :type nr_entries: unsigned int *
+    :type claim_set: memory_claim_t *
+    :returns: 0 on success with nr_entries updated to the number of claims
+              written to the buffer, or a negative error code on failure.
+
+    Retrieves a claim set for the current claims of the domain and writes
+    it to the provided buffer. The number of claims written to the buffer
+    is stored in the variable pointed to by ``nr_entries``.
+
+    ``nr_entries`` specifies the size of the provided buffer for claim
+    entries, and the function writes up to that many claim entries to
+    the buffer. If the buffer is too small to hold all claim entries,
+    the function returns -:c:macro:`ERANGE` and updates ``nr_entries``
+    to the number of entries needed to hold all claim entries.
+
+ .. versionadded:: claims-v7
+
+************************************
+Helper functions for managing claims
+************************************
+
+ .. c:function:: unsigned long domain_release_host_claims(domain, release)
+
+    :param domain: The domain for which to release host-wide claims
+    :param release: The number of pages to release
+    :type domain: struct domain *
+    :type release: unsigned long
+    :returns: The number of host-wide pages actually deducted from the domain.
+
+    This function releases the specified number of host-wide claims.
+    It limits the release to the number of host-wide claims actually held by
+    the domain and updates the overall claim state accordingly.
+
+    .. versionadded:: claims-v4
+
+ .. c:function:: unsigned long domain_release_node_claims(domain, node, release)
+
+    :param domain: The domain for which to release the node claims
+    :param node: The node for which to release the claim
+    :param release: The number of pages to release from the claim
+    :type domain: struct domain *
+    :type node: nodeid_t
+    :type release: unsigned long
+    :returns: The number of pages actually deducted from the domain's claim.
+
+    This function deducts a specified number of pages from a domain's
+    claim on a specific node. It limits the release to the number of
+    pages actually claimed by the domain on that node and updates the
+    node-local claims currently held by the domain on that node,
+    and it updates the host-wide and node-specific claim state accordingly.
+
+    .. versionadded:: claims-v5
+
+ .. c:function:: void domain_recall_node_claims(domain, recall)
+
+    :param domain: The domain for which to recall node claims
+    :param recall: The number of node-specific pages to recall
+    :type domain: struct domain *
+    :type recall: unsigned long
+
+    This function recalls the specified number of node-specific claims
+    from the domain and updates the overall claim state accordingly.
+
+    It iterates over the domain's node-specific claims, calls
+    :c:func:`domain_release_node_claims()` to up to the given pages from
+    the node claims until the specified number of pages has been recalled,
+    or all node-specific claims have been exhausted.
+
+    This function is used to recall node-specific claims from a domain when
+    offlining memory or when pages for a domain are allocated on other
+    nodes than the claimed node.
+
+    .. versionadded:: claims-v5
+
+**********************
+Allocation with claims
+**********************
+
+The functions below play a key role in allocating memory for domains.
+
+ .. c:function:: int xc_domain_populate_physmap(xch, domid, extents, order, \
+                                                mem_flags, extent_start)
+
+    :param xch: The :term:`libxenctrl` interface
+    :param domid: The ID of the domain
+    :param extents: Number of extents
+    :param order: Order of the extents
+    :param mem_flags: Allocation flags
+    :param extent_start: Starting PFN
+    :type xch: xc_interface *
+    :type domid: uint32_t
+    :type extents: unsigned long
+    :type order: unsigned int
+    :type mem_flags: unsigned int
+    :type extent_start: xen_pfn_t *
+    :returns: 0 on success, or a negative error code on failure.
+
+    This function is a wrapper for the ``XENMEM_populate_physmap`` hypercall,
+    which is handled by the :c:func:`populate_physmap()` function in the
+    hypervisor. It is used by :term:`libxenguest` for populating the
+    :term:`guest physical memory` of a domain. :term:`domain builders` can
+    set the :term:`NUMA node affinity` and pass the preferred node to this
+    function to steer allocations towards the preferred NUMA node(s) and let
+    :term:`claims` ensure that the memory will be available even in cases
+    of :term:`parallel domain builds` where multiple domains are being built
+    at the same time.
+
+The :term:`meminit` API calls :c:func:`xc_domain_populate_physmap()`
+for populating the :term:`guest physical memory`. It invokes the restartable
+``XENMEM_populate_physmap`` hypercall implemented by
+:c:func:`populate_physmap()`.
+
+.. c:function:: void populate_physmap(struct memop_args *a)
+
+    :param a: Provides status and hypercall restart info
+    :type a: struct memop_args *
+
+    Allocates memory for building a domain and uses it for populating the
+    :term:`physmap`. For allocation, it uses
+    :c:func:`alloc_domheap_pages()`, which forwards the request to
+    :c:func:`alloc_heap_pages()`.
+
+    During domain creation, it adds the :c:macro:`MEMF_no_scrub` flag to the request
+    for populating the :term:`physmap` to optimise domain startup by allowing
+    the use of unscrubbed pages.
+
+    When that happens, it scrubs the pages as needed using hypercall
+    continuation to avoid long hypercall latency and watchdog timeouts.
+
+    Domain builders can optimise on-demand scrubbing by running
+    :term:`physmap` population pinned to the domain's NUMA node,
+    keeping scrubbing local and avoiding cross-node traffic.
+
+.. c:function:: struct page_info *alloc_heap_pages(unsigned int zone_lo, \
+                                                   unsigned int zone_hi, \
+                                                   unsigned int order, \
+                                                   unsigned int memflags, \
+                                                   struct domain *d)
+
+    :param zone_lo: The lowest zone index to consider for allocation
+    :param zone_hi: The highest zone index to consider for allocation
+    :param order: The order of the pages to allocate (2^order pages)
+    :param memflags: Memory allocation flags that may affect the allocation
+    :param d: The domain for which to allocate memory or NULL
+    :type zone_lo: unsigned int
+    :type zone_hi: unsigned int
+    :type order: unsigned int
+    :type memflags: unsigned int
+    :type d: struct domain *
+    :returns: The allocated page_info structure, or NULL on failure
+
+    This function allocates a contiguous block of pages from the heap.
+    It checks claims and available memory before attempting the
+    allocation. On success, it updates relevant counters and redeems
+    claims as necessary.
+
+    It first checks whether the request can be satisfied given the domain's
+    claims and available memory using :c:func:`claims_permit_request()`.
+    If claims and availability permit the request, it calls
+    :c:func:`get_free_buddy()` to find a suitable block of free pages
+    while respecting node and zone constraints.
+
+    Simplified pseudocode of its logic:
+
+.. code:: C
+
+    struct page_info *alloc_heap_pages(unsigned int zone_lo,
+                                       unsigned int zone_hi,
+                                       unsigned int order,
+                                       unsigned int memflags,
+                                       struct domain *d) {
+        /* D's claims and available memory need to permit the request. */
+        if (!claims_permit_request(1UL << order, total_avail_pages, memflags,
+                                   NUMA_NO_NODE, d,  outstanding_claims))
+            return NULL;
+
+        /* Find a suitable buddy block. Pass the zone range, order and
+         * memflags so the helper can apply node and zone selection. */
+        pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
+        if (!pg)
+            return NULL;
+
+        redeem_claims_for_allocation(d, 1UL << order, node_of(pg));
+        update_counters_and_stats(d, order);
+        if (pg_has_dirty_pages(pg))
+            scrub_dirty_pages(pg);
+        return pg;
+    }
+
+.. c:function:: struct page_info *get_free_buddy(zone_lo, zone_hi, order, \
+                                                 memflags, domain)
+
+    :param zone_lo: The lowest zone index to consider for allocation
+    :param zone_hi: The highest zone index to consider for allocation
+    :param order: The order of the pages to allocate (2^order pages)
+    :param memflags: Flags for conducting the allocation
+    :param domain: domain to allocate memory for or NULL
+    :type zone_lo: unsigned int
+    :type zone_hi: unsigned int
+    :type order: unsigned int
+    :type memflags: unsigned int
+    :type domain: struct domain *
+    :returns: The allocated page_info structure, or NULL on failure
+
+    This function finds a suitable block of free pages in the buddy
+    allocator while respecting claims and node-level available memory.
+
+    Called by :c:func:`alloc_heap_pages()` after verifying the request is
+    permissible, it iterates over nodes and zones to find a buddy block
+    that satisfies the request. It checks node-local claims before
+    attempting allocation from a node.
+
+    Using :c:func:`claims_permit_request()`, it checks whether the node
+    has enough unclaimed memory to satisfy the request or whether the
+    domain's claims can permit the request on that node after accounting
+    for outstanding claims.
+
+    If the node can satisfy the request, it searches for a suitable block
+    in the specified zones. If found, it returns the block; otherwise it
+    tries the next node until all online nodes are exhausted.
+
+    Simplified pseudocode of its logic:
+
+.. code:: C
+
+    /*
+     * preferred_node_or_next_node() represents the policy to first try the
+     * preferred/requested node then fall back to other online nodes.
+     */
+    struct page_info *get_free_buddy(unsigned int zone_lo,
+                                     unsigned int zone_hi,
+                                     unsigned int order,
+                                     unsigned int memflags,
+                                     const struct domain *d) {
+        nodeid_t request_node = MEMF_get_node(memflags);
+
+        /*
+         * Iterate over candidate nodes: start with preferred node (if any),
+         * then try other online nodes according to the normal placement policy.
+         */
+        while (there are more nodes to try) {
+            nodeid_t node = preferred_node_or_next_node(request_node);
+            unsigned long avail_pages = node_avail_pages[node] -
+                                        node_outstanding_claims[node]
+                                        + ((d && !(memflags & MEMF_no_refcount))
+                                           ? d->claims[node] : 0);
+
+            /* Ensure the target node and the claims permit can this allocation */
+            if ( avail_pages < (1UL << order) )
+                goto next_node;
+
+            /* Find a zone on this node with a suitable buddy */
+            for (int zone = highest_zone; zone >= lowest_zone; zone--)
+                for (int j = order; j <= MAX_ORDER; j++)
+                    if ((pg = remove_head(&heap(node, zone, j))) != NULL)
+                        return pg;
+         next_node:
+            if (request_node != NUMA_NO_NODE && (memflags & MEMF_exact_node))
+                return NULL;
+            /* Fall back to the next node and repeat. */
+        }
+        return NULL;
+    }
+
+.. note:: The actual implementation includes additional details
+   but the pseudocode captures the core logic of checking claims
+   and available memory while searching for a suitable buddy.
+
+**************************************
+Offlining memory in presence of claims
+**************************************
+
+When offlining pages, Xen must ensure that available memory on a node
+and the total number of free pages does not fall below their respective
+outstanding claims. If it does, Xen recalls claims from domains until
+accounting is valid again.
+
+This is triggered by privileged domains via the
+``XEN_SYSCTL_page_offline_op`` sysctl or by machine-check memory errors.
+
+Offlining currently allocated pages cannot remove those in-use pages from
+circulation. They are marked for offlining and are offlined when freed back
+to the allocator. However, when already free pages are directly offlined,
+free memory the outstanding claims may need to be adjusted directly too.
+
+:c:func:`reserve_offlined_page()` needs to check whether offlining the page
+causes :c:var:`total_avail_pages` to fall below :c:var:`outstanding_claims` or
+:c:expr:`node_avail_pages[page->node]` to fall below
+:c:expr:`node_outstanding_claims[page->node]`. If so,
+:c:func:`reserve_offlined_page()` must look for domains with relevant claims
+and recall those claims until the claim accounting is valid again.
+
+- When
+  :c:expr:`node_outstanding_claims[page->node]` exceeds
+  :c:expr:`node_avail_pages[page->node]` for the offlined page,
+  :c:func:`reserve_offlined_page()` should call
+  :c:func:`domain_release_node_claims()`
+  to recall claims on that node from domains with claims on the node of the
+  offlined buddy until the claim accounting of the node is valid again.
+
+- When total :c:var:`outstanding_claims` exceeds :c:var:`total_avail_pages`,
+  :c:func:`reserve_offlined_page()` calls
+  :c:func:`domain_release_host_claims()` to recall host-wide claims
+  from domains until the overall claims accounting is valid again.
+
+This can violate claim guarantees, but it is necessary to maintain system
+stability when memory must be offlined.
+
+.. c:function:: int reserve_offlined_page(struct page_info *head)
+
+    :param head: The page being offlined
+    :type head: struct page_info *
+    :returns: 0 on success, or a negative error code on failure.
+
+    This function is called during the offlining process to offline pages.
+
+    If offlining a page causes available memory to fall below outstanding
+    claims, it checks the node-specific and host-wide claim accounting
+    and recalls claims from domains as necessary to ensure accounting
+    invariants hold after a buddy is offlined.
diff --git a/docs/designs/claims/index.rst b/docs/designs/claims/index.rst
new file mode 100644
index 000000000000..218632c6e22f
--- /dev/null
+++ b/docs/designs/claims/index.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+NUMA Claims
+===========
+
+Design and implementation of NUMA-aware claim sets.
+
+Status: Draft for review
+
+This design first introduces the external behaviour of claim sets: how claims
+are installed, how they protect allocations, and how they are redeemed.
+It then covers the underlying accounting model and implementation details.
+
+For readers following the design in order, the next sections cover these
+topics:
+
+1.  :doc:`/designs/claims/use-cases` describes the use cases for claim sets.
+2.  :doc:`/designs/claims/performance` describes the performance test results.
+3.  :doc:`/designs/claims/development` provides the development history and future work.
+4.  :doc:`/designs/claims/design` introduces the overall model and goals.
+5.  :doc:`/designs/claims/installation` describes how claim sets are installed.
+6.  :doc:`/designs/claims/protection` describes how claimed memory is
+    protected during allocation.
+7.  :doc:`/designs/claims/redeeming` explains how claims are redeemed when
+    allocations succeed.
+8.  :doc:`/designs/claims/accounting` describes the accounting model that
+    underpins those steps.
+9.  :doc:`/designs/claims/implementation` documents the functions used for the
+    implementation.
+10. :doc:`/designs/claims/terminology` defines the terms used in this design.
+
+.. toctree:: :caption: Contents
+   :maxdepth: 2
+
+   use-cases
+   performance
+   development
+   design
+   installation
+   protection
+   redeeming
+   accounting
+   implementation
+   terminology
+
+.. contents::
+    :backlinks: entry
+    :local:
diff --git a/docs/designs/claims/installation.rst b/docs/designs/claims/installation.rst
new file mode 100644
index 000000000000..2073da2c33ee
--- /dev/null
+++ b/docs/designs/claims/installation.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Installation
+############
+
+**********
+Claim sets
+**********
+
+A claim set is an array of :c:type:`memory_claim_t` entries.
+
+.. c:type:: memory_claim_t
+
+   The ``typedef`` for :c:type:`xen_memory_claim`, used for
+   passing an array of claim set entries to the hypervisor.
+
+.. c:struct:: xen_memory_claim
+
+   Underlying structure for passing claim sets to the hypervisor.
+
+   This structure represents an individual claim entry in a claim set.
+   It specifies the number of pages claimed and the target of the claim,
+   which can be a specific NUMA node or a special value for host-wide claims.
+
+   The structure includes padding for future expansion. It is important to
+   zero-initialise it or use designated initialisers to ensure forward
+   compatibility. Members are as follows:
+
+   .. c:member:: uint64_aligned_t pages
+
+      Number of pages for this claim entry.
+
+   .. c:member:: uint32_t cmd
+
+      Command field reserved for future use. It must be initialised to 0
+      for forward compatibility.
+
+   .. c:member:: uint32_t target
+
+
+      The target of the claim entry. It can be a special selector, which could
+      in the future include flags and additional information, or simply a NUMA
+      node ID.
+
+      See :ref:`guest-guide/dom/DOMCTL_claim_memory:Hypercall API`
+      for the defined special selectors and their semantics.
+
+.. c:type:: uint64_aligned_t
+
+   64-bit unsigned integer type with alignment requirements suitable for
+   representing page counts in the claim structure.
+
+**********************
+Claim set installation
+**********************
+
+
+Claim set installation is invoked via :c:macro:`XEN_DOMCTL_claim_memory`, and
+:c:func:`domain_install_claim_set()` implements the claim set installation logic.
+
+See :doc:`accounting` for details on the claims accounting state.
+
+*************************
+Legacy claim installation
+*************************
+
+Legacy claims are set via the :c:macro:`XENMEM_claim_pages` hypercall command.
+
+.. note:: The legacy path is deprecated.
+   Use :c:macro:`XEN_DOMCTL_claim_memory` for new code.
diff --git a/docs/designs/claims/invariants.mmd b/docs/designs/claims/invariants.mmd
new file mode 100644
index 000000000000..317c51536ed3
--- /dev/null
+++ b/docs/designs/claims/invariants.mmd
@@ -0,0 +1,35 @@
+%% SPDX-License-Identifier: CC-BY-4.0
+%% Claim variables and their Invariants
+flowchart TD
+
+subgraph "Access&nbsp;under&nbsp;the&nbsp;<tt><b>heap_lock</b></tt>&nbsp;only:"
+   direction TB
+   Memory_of_Nodes --"&nbsp; Contribute to &nbsp;"--> Overall_Memory
+   Overall_Memory --"&nbsp; Available to &nbsp;"--> Memory_of_Domains
+end
+
+subgraph Memory_of_Nodes["Per-node claims and available memory"]
+    direction LR
+    per_node_claims -->|"&nbsp; less or equal to &nbsp;"| node_avail_pages
+    per_node_claims["Claims on the node:
+                     <tt>node_outstanding_claims[n]"]
+    node_avail_pages["Available pages on the node:
+                      <tt>node_avail_pages[n]"]
+end
+
+subgraph Overall_Memory["Overall claims and available memory"]
+    direction LR
+    outstanding -->|"&nbsp; less or equal to &nbsp;"| avail_pages
+    outstanding["Total claims on the host:
+                 <tt>outstanding_claims"]
+    avail_pages["Available pages on the host:
+                 <tt>total_avail_pages"]
+end
+
+subgraph Memory_of_Domains["Per-domain&nbsp;claims and available memory"]
+    direction LR
+    claims -->|"&nbsp; less or equal to &nbsp;"| available_memory_for_domains
+    claims["Claims of the domain:<br><tt>d->outstanding_pages"]
+    available_memory_for_domains["Available pages:<br><tt>node_avail_pages[n]
+                                                          total_avail_pages"]
+end
diff --git a/docs/designs/claims/performance.rst b/docs/designs/claims/performance.rst
new file mode 100644
index 000000000000..694c97ca3321
--- /dev/null
+++ b/docs/designs/claims/performance.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Performance
+***********
+
+The single-node claims implementation which is the basis of the
+NUMA claims v4 series and the multi-node claim sets design forms
+the groundwork for the NUMA design and implementation in XenServer 9.
+
+An early version of it is available as the XenServer XS9 preview
+release: https://www.xenserver.com/downloads/xs9-preview.
+The performance of this release has been tested in real
+customer environments with customer workloads.
+
+On dual-socket Intel servers, the **average aggregate CPU usage across
+all VMs at peak times** (peak user load) was **~16% less** than with
+`XenServer 8.4` (overall average at all times **~8.5% less**) compared
+to the previous release, which is a significant improvement in CPU
+efficiency for memory-intensive workloads, attributed to the
+improved NUMA placement enabled by `NUMA-aware claims`.
+
+The customer's response time metric from their application, which is the
+key measure the customer uses for end user observed performance, showed
+an ~8% improvement, matching the improvement in average CPU usage.
+
+These numbers were observed using `Intel dual-socket servers`.
+The performance benefits with AMD servers (judging by preliminary tests) are
+expected to be considerably higher than the results with dual-socket Intel
+servers.
+
+The multi-node claim sets design is expected to extend these benefits
+to configurations that require claiming memory from multiple NUMA nodes
+adjacent to each other for optimal performance.
diff --git a/docs/designs/claims/protection.rst b/docs/designs/claims/protection.rst
new file mode 100644
index 000000000000..c7eec95b99e4
--- /dev/null
+++ b/docs/designs/claims/protection.rst
@@ -0,0 +1,200 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Protection
+##########
+
+.. contents:: Table of Contents
+    :backlinks: entry
+    :local:
+
+Claimed memory must be protected from allocations without applicable claims
+while remaining available to allocations with applicable claims.
+
+Claims exist as long as they are outstanding, which is from the moment they
+are installed until they are redeemed by allocations.
+
+During this time, they are a commitment of memory to a domain, and the
+hypervisor must ensure that this commitment is respected by protecting
+claimed memory from being allocated without redeeming applicable claims.
+
+Redeeming claims is the process of applying a portion of the claims of
+a domain to an allocation to allow the allocation to proceed by exchanging
+the claim for the allocated memory, so that the allocation can use the
+claimed memory and the portion of the claim used for the allocation is
+no longer outstanding.
+
+For example, if a domain has an outstanding claim of 100 pages on a node,
+and it redeems 20 pages of that claim for an allocation, the domain would
+have 80 pages of that claim still outstanding, and the allocation would be
+satisfied using the claimed memory, so the domain can use that allocated
+memory and the claim would be reduced by the redeemed amount.
+
+For the protection of claims, the allocator performs checks to ensure that
+claimed memory is not allocated without redeeming applicable claims, while
+still allowing the claiming domain to allocate claimed memory by redeeming
+claims.
+
+When the system is not under heavy memory pressure and not fully-claimed,
+the allocator can satisfy allocation requests using unclaimed memory.
+
+However, when the system is under heavy memory pressure or nearly fully-claimed,
+the checks for protecting claims become critical to ensure that claimed memory
+is not allocated without redeeming applicable claims.
+
+*********************************
+Reference-counting of allocations
+*********************************
+
+Claims protection distinguishes between two kinds of allocation requests.
+
+Reference-counted requests
+==========================
+
+This means that the request comes for a domain and the :c:expr:`memflags`
+of the request do not include :c:expr:`MEMF_no_refcount`.
+
+In this case, the request is reference-counted to the domain's
+total memory allocation, and the domain's claims can be used
+to protect and redeem the allocation using claims.
+
+For example, the allocation requests by :term:`domain builders` for the
+:term:`guest physical memory` of domains are always reference-counted,
+and as such, can be protected and redeemed by claims to the extent
+the claims are applicable and sufficient for the allocation.
+
+Not reference-counted requests
+==============================
+
+This means that the request is not for a domain, or the :c:type:`memflags`
+of the request includes :c:macro:`MEMF_no_refcount`.
+
+In this case, the request is not reference-counted to a domain's
+memory allocation state, and as part of that, claims of a domain
+cannot be used to protect and redeem the allocation using claims.
+
+As such, the allocation request is not protected and redeemed by claims and
+the allocator does not consider claims to check whether the request can
+be satisfied, so the request can only be satisfied using unclaimed memory.
+
+Therefore, such requests can only be satisfied using unclaimed memory.
+
+Callers using MEMF_no_refcount
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Example callers which use :c:macro:`MEMF_no_refcount` when allocating memory
+or use :c:macro:`MEMF_no_owner` which also sets :c:macro:`MEMF_no_refcount`
+in the context of domains include:
+
+- ``p2m_alloc_page()`` for allocating pages for the page-to-machine mapping.
+- ``hap_set_allocation()`` for allocating memory for hardware-assisted paging.
+- ``vmx_alloc_vlapic_mapping()`` for allocating the vLAPIC page for a HVM guest.
+- ``vmtrace_alloc_buffer()`` for allocating the buffer for VM tracing.
+- ``ioreq_server_alloc_mfn()`` for allocating memory for I/O requests.
+
+Example actions happening at runtime on the request of running domains
+which use :c:macro:`MEMF_no_refcount` or :c:macro:`MEMF_no_owner` to
+bypass reference-counting include:
+
+- ``memory_exchange()`` for exchanging memory pages of a domain.
+- ``gnttab_transfer()`` for transferring pages between domains.
+
+***********************
+Claim protection checks
+***********************
+
+Unless the request is an exact-node request for a node-specific claim,
+the allocator performs two protective checks to protect claimed memory
+from being allocated to other domains while still allowing the claiming
+domain to allocate it.
+
+Before starting, the allocator takes the global :c:var:`heap_lock`.
+This ensures that any previous changes to the state of the system's
+unclaimed memory and the domain's total outstanding claims are complete
+and visible, and no concurrent changes to those values can happen.
+
+Protection of host-wide claims
+==============================
+
+The first check [1]_ the allocator performs is a check protecting host-wide
+claims which are part of the total pool of the claims on the entire host.
+
+1. Get the total amount of unclaimed memory available in the system.
+   It is the sum of the free pages on all NUMA nodes
+   (:c:var:`total_avail_pages`) minus the total amount of claimed
+   memory across all domains (:c:var:`outstanding_claims`). This
+   includes all host-wide claims and all node-specific claims.
+
+2. Check whether the request can be satisfied by the unclaimed memory itself.
+
+   If so, the allocation calls :c:func:`get_free_buddy()` to perform the
+   node-specific checks and find free pages on the appropriate node(s)
+   to satisfy the request.
+
+   This is the common case, especially for smaller allocations and when the
+   host is not under heavy memory pressure and not fully-claimed.
+
+If the request cannot proceed based on the unclaimed memory, it is under
+heavy memory pressure as the unclaimed memory is very low, which is where
+the protection of claims becomes critical.
+
+In these situations, the allocator needs to ensure that the domain has
+enough claims to redeem the claimed memory to satisfy this request,
+otherwise the request has to fail:
+
+1. If the request is not for a domain or the request is disabling reference
+   counting, the request fails.
+
+2. If the total claims of the domain (:c:member:`domain.outstanding_claims`)
+   cover the amount of claims needed to satisfy the request,
+   the allocation can proceed further. Else, the request fails.
+
+Protection of node-specific claims
+==================================
+
+This check protects claimed memory on the specific node from being allocated
+without sufficient claims.
+
+After passing the host-wide claims protection check, the allocator calls
+:c:expr:`get_free_buddy()` to pick nodes for allocation and check the
+node's suitability [2]_ for this request:
+
+1. Get the number of unclaimed memory available on that node using the
+   free pages on that NUMA node (``node_avail_pages[node]``) minus the
+   total amount of claimed memory across all domains for that node
+   (``node_outstanding_claims[node]``).
+
+2. If the request can be satisfied by the sum of the unclaimed memory
+   on that node and the claims of the domain for that node, the allocation
+   can proceed on that node, else this node cannot satisfy this request.
+
+3. If the allocation is an exact-node request, or the allocator
+   has no further nodes to consider, the allocation fails.
+
+4. Else, if the allocator has to consider further nodes for this request,
+   the allocator continues to repeat the same process for the next node.
+
+.. rubric:: Footnotes
+
+.. [1] In principle, the host-wide check for the protection of host-wide claims
+       could be skipped for node-exact requests that are reference-counted and
+       covered by the claims of the domain for that node. The added code for
+       This additional check would add complexity to the code, and as long as
+       Xen must track global memory counters, those counters would still need
+       to be accessed for all requests, so the added code could only delay the
+       access to those global counters while adding more checks to all other
+       requests. Therefore, that's not considered beneficial for now.
+
+       However, if we want to replace the global :c:var:`heap_lock` serving
+       as a global synchronisation point for all memory allocations with
+       finer-grained (per-node) locks in the future, then this check could be
+       added to allow more concurrency for node-exact allocations (and all
+       free_page() calls) while still protecting claims, but that would be a
+       future project, requiring significant changes to the code.
+
+.. [2] If the request is reference-counted and the request is covered by
+       the claims of the domain for that node, the request could proceed.
+       But that would add complexity to the code, and as long as Xen must track
+       per-node memory counters, those counters would still need to be updated
+       for all allocations from this node, so the added code could only delay
+       the access to those per-node counters while adding more checks to all
+       other requests. Therefore, that's not considered beneficial for now.
diff --git a/docs/designs/claims/redeeming.rst b/docs/designs/claims/redeeming.rst
new file mode 100644
index 000000000000..a5eb045c1bce
--- /dev/null
+++ b/docs/designs/claims/redeeming.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Redeeming
+#########
+
+.. contents:: Table of Contents
+    :backlinks: entry
+    :local:
+
+After the buddy allocator returned the pages for the allocation,
+:c:func:`redeem_claims_for_allocation()` redeems claims up to the size of
+the allocation in the same critical region that updates the free-page counters.
+
+The function performs the following steps to redeem the matching
+claims for this allocation. It ensures that the domain's total memory
+allocation as :c:func:`domain_tot_pages` plus its outstanding
+claims as :c:member:`domain.outstanding_pages` remain within the
+domain's limits, defined by :c:member:`domain.max_pages`:
+
+Steps to redeem claims for an allocation
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Step 1:
+  Redeem claims from :c:expr:`domain.claims[alloc_node]` on the allocation
+  node, up to the size of that claim.
+Step 2:
+  If the allocation exceeds :c:expr:`domain.claims[alloc_node]`, redeem the
+  remaining pages from the host-wide claims
+  (:c:member:`domain.outstanding_pages` - :c:member:`domain.node_claims`),
+  up to the size of the host-wide claims.
+Step 3:
+  If the allocation exceeds the combination of those claims, redeem the
+  remaining pages from other per-node claims so that the domain's total
+  allocation plus claims remain within the domain's :c:member:`domain.max_pages`
+  limit.
+
+Enforcing the domain's max_pages limit
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+:c:func:`domain_tot_pages` + :c:member:`domain.outstanding_pages`
+must not exceed the :c:member:`domain.max_pages` limit, otherwise
+the domain could exceed its memory entitlement.
+
+At claim installation time, :c:func:`domain_install_claim_set()` performs
+this check.
+
+.. :sidebar::
+   See :ref:`designs/claims/accounting:Locking of claims accounting`
+   for the locks used to protect claims accounting state and invariants.
+
+At memory allocation time
+  If (unexpectedly) a domain builder ends up allocating memory from
+  different nodes than it claimed from, the domain's total allocation
+  plus claims could exceed the domain's :c:member:`domain.max_pages`
+  limit, unless the page allocator redeems claims from other nodes
+  to ensure the sum of the domain's claims and populated pages
+  remains within the :c:member:`domain.max_pages` limit.
+
+  :c:func:`redeem_claims_for_allocation()`
+  cannot reliably check :c:member:`domain.max_pages` race-free because
+  :c:member:`domain.max_pages` is not protected by the :c:var:`heap_lock`
+  taken by the page allocator during allocation.
+
+  To check the domain's limits, it would have to take the
+  :c:member:`domain.page_alloc_lock` to inspect the domain's
+  limits and its current allocation. However, taking that lock
+  while holding the :c:var:`heap_lock` would invert the locking
+  order and could lead to deadlocks.
+
+  Therefore, :c:func:`redeem_claims_for_allocation()`
+  redeems the remaining allocation from other-node claims in Step 3.
diff --git a/docs/designs/claims/terminology.rst b/docs/designs/claims/terminology.rst
new file mode 100644
index 000000000000..62bc32ae93b5
--- /dev/null
+++ b/docs/designs/claims/terminology.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Terminology
+###########
+
+.. Terms should appear in alphabetical order by their initial synonym.
+
+.. glossary::
+
+ claims
+  Reservations of memory for :term:`domains` that are installed by
+  :term:`domain builders` before :term:`populating` the domain's memory.
+  Claims ensure that the reserved memory remains available for the
+  :term:`domains` when allocating it, even if other :term:`domains` are
+  allocating memory at the same time.
+
+ claim set
+  An array of :c:type:`memory_claim_t` entries, each specifying a page count
+  and a target (either a NUMA node ID or a special value for host-wide claims),
+  that can be installed atomically for a domain to reserve memory on multiple
+  NUMA nodes. The chapter on :ref:`designs/claims/installation:claim sets`
+  provides further information on the structure and semantics of claim sets.
+
+ claim set installation
+ installing claim sets
+ installing claims
+  The process of validating and installing a claim set for a domain under
+  :c:member:`domain.page_alloc_lock` and :c:var:`heap_lock`, ensuring that
+  either the entire set is accepted and installed, or the request fails with
+  no side effects.
+  The chapter on :ref:`designs/claims/installation:claim set installation`
+  provides further information on the structure and semantics of claim sets.
+
+ domain builders
+  Privileged entities (such as :term:`toolstacks` in management :term:`domains`)
+  responsible for constructing and configuring :term:`domains`, including
+  installing :term:`claims`, :term:`populating` memory, and setting up other
+  resources before the :term:`domains` are started.
+
+ host-wide claims
+  :term:`claims` that can be satisfied from any NUMA node, required for
+  compatibility with existing domain builders and for use cases where
+  strict node-local placement is not required or not possible, such as on
+  UMA machines or as a fallback for memory that comes available on any node.
+
+ libxenctrl
+  A low-level C API library to interact with the Xen hypervisor, to make
+  :term:`hypercalls`. If hypercalls are to Xen what system calls are to the
+  Linux kernel, then :term:`libxenctrl` is the universal, low-level system C
+  runtime library that provides the interface for making those hypercalls.
+
+ libxenguest
+  A higher-level library, layered on top of :term:`libxenctrl`,
+  specifically designed for :term:`domain builders` to build and
+  configure :term:`domains`, including installing :term:`claims`
+  and :term:`populating` :term:`guest physical memory`. It provides
+  a more convenient and domain-builder-friendly interface for these
+  operations, abstracting away details of creating the architecture-specific
+  memory map expected by guest operating systems which were initially
+  written to run on the bare metal (on full hardware) and not in a
+  virtualized environment.
+
+ meminit
+  The phase of a domain build where the guest's physical memory is populated,
+  which involves allocating and mapping physical memory for the domain's guest
+  :term:`physmap`. This should be performed after installing :term:`claims`
+  to protect the process against parallel allocations of other domain builder
+  processes in case of parallel domain builds.
+
+  It is implemented in :term:`libxenguest` and optionally installs
+  :term:`claims` to ensure the claimed memory is reserved before populating
+  the :term:`physmap` using calls to :c:func:`xc_domain_populate_physmap()`.
+
+ nodemask
+  A bitmap representing a set of NUMA nodes, used for status information
+  like :c:var:`node_online_map` and the :c:member:`domain.node_affinity`.
+
+ node
+ NUMA node
+ NUMA nodes
+  A grouping of CPUs and memory in a NUMA architecture. NUMA nodes have
+  varying access latencies to memory, and NUMA-aware claims allow
+  :term:`domain builders` to reserve memory on specific NUMA nodes
+  for performance reasons. Platform firmware configures what constitutes
+  a NUMA node, and Xen relies on that configuration for NUMA-related features.
+
+  When this design refers to NUMA nodes, it is referring to the NUMA nodes
+  as defined by the platform firmware and exposed to Xen, initialized at boot
+  time and not changing at runtime (so far).
+
+  The NUMA node ID is a numeric identifier for a NUMA node, used whenever code
+  specifies a NUMA node, such as the target of a claim or indexing into arrays
+  related to NUMA nodes.
+
+  NUMA node IDs start at 0 and are less than :c:macro:`MAX_NUMNODES`.
+
+  Some NUMA nodes may be offline, and the :c:var:`node_online_map` is used
+  to track which nodes are online. Currently, Xen does not support hotplug
+  of NUMA nodes, so the set of online NUMA nodes is determined at boot time
+  based on the platform firmware configuration and does not change at runtime.
+
+ NUMA node affinity
+  The preference of a :term:`domain` for a set of NUMA nodes, which can
+  be set up by :term:`domain builders` to make :c:func:`get_free_buddy`
+  (which selects the NUMA node to allocate from) prefer specific NUMA nodes for
+  performance reasons.
+
+  It is represented by the :c:member:`domain.node_affinity`, which is a
+  bitmap of NUMA nodes indicating the preferred NUMA nodes for the domain.
+  By default, domains have NUMA node auto-affinity, which means their NUMA
+  node affinity is determined automatically by the hypervisor based on the
+  CPU affinity of their vCPUs, but it can be disabled and configured manually
+  by domain builders.
+
+ guest physical memory
+ physmap
+  The mapping of a domain's guest physical memory to the host's
+  machine address space. The :term:`physmap` defines how the guest's
+  physical memory corresponds to the actual memory locations on the host.
+
+ populating
+  The process of allocating and mapping physical memory for a domain's guest
+  :term:`physmap`, performed by the :term:`domain builders`, preferably after
+  installing :term:`claims` to protect the process against parallel allocations
+  of other domain builder processes in case of parallel domain builds.
+
+ toolstacks
+  Privileged entities (running in privileged :term:`domains`) responsible for
+  managing :term:`domains`, including building, configuring, and controlling
+  their lifecycle using :term:`domain builders`. One toolstack may run
+  multiple :term:`domain builders` in parallel to build multiple :term:`domains`
+  at the same time.
+
+ Xenctrl
+  An OCaml library provided by Xen for :term:`domain builders` running
+  in privileged :term:`domains` to interact with the hypervisor, including
+  making hypercalls to install claims and :term:`populating`
+  :term:`guest physical memory`.
\ No newline at end of file
diff --git a/docs/designs/claims/use-cases.rst b/docs/designs/claims/use-cases.rst
new file mode 100644
index 000000000000..5a618f0d0280
--- /dev/null
+++ b/docs/designs/claims/use-cases.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+#########
+Use Cases
+#########
+
+.. glossary::
+
+ Parallel :term:`domain builds`
+
+  When many domains need to be created and built, many :term:`domain builders`
+  compete for the same pools of memory, which can lead to inefficient NUMA
+  placement of :term:`guest physical memory` and thus suboptimal performance
+  for the domains.
+
+  NUMA-aware claims can help solve this problem and ensure that memory
+  is available on the appropriate NUMA nodes.
+
+ Domain builds
+
+  The process of constructing and configuring :term:`domains` by
+  :term:`domain builders`, which includes installing :term:`claims`,
+  :term:`populating` memory, and setting up other resources before the
+  :term:`domains` are started. When multiple :term:`domain builders` can
+  run in parallel, this is referred to as parallel domain builds, which can
+  benefit from NUMA-aware claims because the domain builders are competing for
+  the same pools of memory on the NUMA nodes.
+
+ Boot storms
+
+  It is common for many domains to be booted at the same time, such as during
+  system startup or when large numbers of domains need to be started.
+
+ Parallel migrations
+
+  Similar to :term:`boot storms`, except that the domains are being migrated
+  instead of booted, which can happen when other hosts are being drained
+  for maintenance (host evacuation) or when workloads are being rebalanced
+  across hosts.
diff --git a/docs/designs/index.rst b/docs/designs/index.rst
index 54d45c2bc321..1f4537957827 100644
--- a/docs/designs/index.rst
+++ b/docs/designs/index.rst
@@ -14,3 +14,4 @@ and for those interested in the internal workings of Xen.
 
    launch/index
    cache-coloring
+   claims/index
diff --git a/docs/glossary.rst b/docs/glossary.rst
index 5c3229a8c4fd..f73de9b85cf6 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -12,6 +12,7 @@ Glossary
      to create and manage other domains on the system.
 
    domain
+   domains
      A domain is Xen's unit of resource ownership, and generally has at the
      minimum some RAM and virtual CPUs.
 
@@ -58,13 +59,18 @@ Glossary
 
      In the code, "guest context" and "guest state" is considered in terms of
      the CPU architecture, and contrasted against hypervisor context/state.
-     In this case, it refers to all code running lower privilege privilege
-     level the hypervisor.  As such, it covers all domains, including ones
+     In this case, it refers to all code running lower privilege level than
+     the hypervisor.  As such, it covers all domains, including ones
      providing system services.
 
    hardware domain
      A :term:`domain`, commonly dom0, which shares responsibility with Xen
      about the system as a whole.
 
-     By default it gets all devices, including all disks and network cards, so
+     By default, it gets all devices, including all disks and network cards, and
      is responsible for multiplexing guest I/O.
+
+   hypercall
+   hypercalls
+     A mechanism for a :term:`guest` to request services from the hypervisor.
+     Hypercalls are analogous to system calls in a traditional operating system.
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
new file mode 100644
index 000000000000..8d45322ba939
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
@@ -0,0 +1,43 @@
+%% SPDX-License-Identifier: CC-BY-4.0
+classDiagram
+class do_domctl["Args passed to <tt>do_domctl()</tt>"] {
+    +uint32_t cmd: XEN_DOMCTL_claim_memory
+    +uint32_t domain: Domain ID
+    +xen_domctl_claim_memory: Claim set
+}
+class xen_domctl_claim_memory["Claim set passed to <tt>do_domctl()</tt>"] {
+    +memory_claim_t* claims: Claim entries
+    +uint32_t nr_claims: Number of claim entries
+    +uint32_t pad: always 0 for future use
+}
+class memory_claim_t["Claim set: Array of claim entries"] {
+    +pages: Pages to claim
+    +node: Claim selector or node
+    +pad: always 0 for future use
+}
+class xc_domain_claim_memory["xc_domain_claim_memory()"] {
+    +xc_interface* xch
+    +uint32_t domid
+    +uint32_t nr_claims
+    +memory_claim_t* claims
+}
+class outstanding_pages["Total claims of domains"] {
+    global free = total_avail_pages - outstanding_claims
+    node free = node_avail_pages[node] - node_outstanding_claims[node]
+}
+class claim["XEN_DOMCTL_claim_memory"] {
+    +domain_set_outstanding_pages()
+    +domain_set_node_claims()
+}
+class domain["Claim fields in struct domain"] {
+    +outstanding_pages - Total outstanding claims of the domain
+    +node_claims - Sum of claims on all nodes of the domain
+    +claims[] - Array of claims on specific nodes
+}
+xen_domctl_claim_memory o--> memory_claim_t
+do_domctl o--> xen_domctl_claim_memory
+xc_domain_claim_memory ..> do_domctl: passes<br> <tt>Claim set</tt>
+xc_domain_claim_memory ..> claim : calls <tt>do_domctl()</tt>
+claim ..> xen_domctl_claim_memory : reads
+claim ..> domain : sets
+domain ..> outstanding_pages : updates outstanding claims
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
new file mode 100644
index 000000000000..10ed8f4aa094
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
@@ -0,0 +1,23 @@
+%% SPDX-License-Identifier: CC-BY-4.0
+sequenceDiagram
+
+actor DomainBuilder
+participant OcamlStub as OCaml stub for<br>xc_domain<br>claim_memory
+participant Libxc as xc_domain<br>claim_memory
+participant Domctl as XEN_DOMCTL<br>claim_memory
+#participant DomainLogic as claim_memory
+participant Alloc as domain<br>set<br>outstanding_pages
+
+DomainBuilder->>OcamlStub: claims
+OcamlStub->>OcamlStub: marshall claims -----> OCaml to C
+OcamlStub->>Libxc: claims
+
+Libxc->>Domctl: do_domctl
+
+Domctl->>Domctl: copy_from_guest(claim)
+Domctl->>Domctl: validate claim
+Domctl->>Alloc: set<br>outstanding_pages
+Alloc-->>Domctl: result
+Domctl-->>Libxc: rc
+Libxc-->>OcamlStub: rc
+OcamlStub-->>DomainBuilder: claim_result
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
new file mode 100644
index 000000000000..372f2bb7a616
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
@@ -0,0 +1,23 @@
+%% SPDX-License-Identifier: CC-BY-4.0
+sequenceDiagram
+
+participant Toolstack
+participant Xen
+participant NUMA Node memory
+
+Toolstack->>Xen: XEN_DOMCTL_createdomain
+Toolstack->>Xen: XEN_DOMCTL_max_mem(max_pages)
+
+Toolstack->>Xen: XEN_DOMCTL_claim_memory(pages, node)
+Xen->>NUMA Node memory: Claim pages on node
+Xen-->>Toolstack: Claim granted
+
+Toolstack->>Xen: XEN_DOMCTL_set_nodeaffinity(node)
+
+loop Populate domain memory
+    Toolstack->>Xen: XENMEM_populate_physmap(memflags:node)
+    Xen->>NUMA Node memory: alloc from claimed node
+end
+
+Toolstack->>Xen: XEN_DOMCTL_claim_memory(0, NO_NODE)
+Xen-->>Toolstack: Remaining claims released
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory.rst b/docs/guest-guide/dom/DOMCTL_claim_memory.rst
new file mode 100644
index 000000000000..c0d0070a0c58
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory.rst
@@ -0,0 +1,221 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+claim_memory
+************
+
+ .. c:macro:: XEN_DOMCTL_claim_memory
+
+  Hypercall command for installing claim sets for a domain.
+
+  This command allows :term:`domain builders` to install a :term:`claim set`
+  for a domain, which the Xen hypervisor tracks and enforces during memory
+  allocation.
+
+  The claimed memory is protected from other allocations and the domain's
+  memory requirements can be met even when other parallel domain builders
+  are also allocating memory for other domains in parallel.
+
+  :ref:`designs/claims/installation:Claim set installation` describes how the
+  hypervisor processes the claim sets installed via this hypercall command.
+
+Hypercall API
+-------------
+
+See :ref:`designs/claims/installation:Claim sets`
+for more details on the claim sets data structure.
+
+Definitions
+^^^^^^^^^^^
+
+Mode
+~~~~
+ .. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_SET
+
+    Install the given claim set for the domain.
+
+ .. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_GET
+
+    Retrieve the claim set for the current claims of the domain.
+
+Target selectors
+~~~~~~~~~~~~~~~~
+  .. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_HOST
+
+    Special target selector for host-wide claims,
+    which can be satisfied from any NUMA node.
+
+  .. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_LEGACY
+
+    Special target selector for legacy claims, which is interpreted as the
+    total memory target for the domain, with existing allocations subtracted
+    from it to determine the domain's new total host-wide outstanding claim.
+    It is provided for compatibility with existing :term:`domain builders`
+    and can only be used in a single-entry claim set.
+
+domctl.h structure
+^^^^^^^^^^^^^^^^^^
+
+ .. code-block:: C
+
+    struct xen_memory_claim {
+        uint64_aligned_t pages; /* Number of pages to claim */
+        uint32_t target; /* NUMA node or claim type like legacy or host-wide */
+        uint32_t cmd;    /* Command reserved for future use, initialize to 0 */
+    };
+    typedef struct xen_memory_claim memory_claim_t;
+    DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
+
+    /* Special claim targets for the target field of memory_claim_t */
+    #define XEN_DOMCTL_CLAIM_MEMORY_HOST     0x80000000U /* Host-wide claims */
+    #define XEN_DOMCTL_CLAIM_MEMORY_LEGACY   0x40000000U /* Legacy semantics */
+
+    /*
+     * XEN_DOMCTL_claim_memory
+     *
+     * Install a claim set to claim memory for a guest domain. Claims work like
+     * tickets in exchange for allocating memory for a domain later.
+     */
+    struct xen_domctl_claim_memory {
+        /* IN/OUT: Array of struct xen_memory_claim */
+        XEN_GUEST_HANDLE_64(memory_claim_t) claim_set;
+        /* IN/OUT: Number of records in the claim_set array handle. */
+        uint32_t nr_entries;
+        uint32_t mode;
+    #define XEN_DOMCTL_CLAIM_MEMORY_GET 0U /* Get a claim set for the domain. */
+    #define XEN_DOMCTL_CLAIM_MEMORY_SET 1U /* Set a claim set for the domain. */
+    };
+
+
+C API by libxenctrl
+-------------------
+
+ .. c:function:: int xc_domain_claim_memory(xch, domid, mode, nr_entries, \
+                                            claim_set)
+
+   :param xch:       The :term:`libxenctrl` interface to use for the hypercall
+   :param domid:     The ID of the domain for which to install the claim set
+   :param mode:      The mode for the claim set installation
+   :param nr_entries: The number of entries in the claim set
+   :param claim_set:  The claim set to install for the domain
+   :type xch:        xc_interface *
+   :type domid:      uint32_t
+   :type mode:       uint32_t
+   :type nr_entries: uint32_t *
+   :type claim_set:  memory_claim_t *
+   :returns:         0 on success, or a negative error code on failure.
+
+   C API function for installing or retrieving claim sets for a domain
+   using the :expr:`XEN_DOMCTL_claim_memory` hypercall command.
+
+   This function allows :term:`domain builders` to install a
+   :term:`claim set` for a domain, which the Xen hypervisor
+   tracks and enforces during memory allocation and can also
+   be used to retrieve the current claim set for a domain.
+
+   When mode is :c:macro:`XEN_DOMCTL_CLAIM_MEMORY_SET`, the former mode
+   is used, where the function validates and installs the given claim set.
+   ``nr_entries`` specifies the number of entries in the ``claim_set`` array,
+   and ``claim_set`` points to the array of :c:type:`memory_claim_t` entries.
+
+   When mode is :c:macro:`XEN_DOMCTL_CLAIM_MEMORY_GET`, the function
+   retrieves the current claim set into the memory pointed to by ``claim_set``.
+   The number of claims retrieved is stored in the variable pointed to by
+   ``nr_entries``.
+
+   This function is part of the :term:`libxenctrl` library.
+
+   Corresponding OCaml bindings are also available for this function in the
+   :term:`Xenctrl` OCaml library, providing a convenient interface for OCaml
+   :term:`domain builders` to install claim sets for a domain.
+
+C API Usage example
+^^^^^^^^^^^^^^^^^^^
+
+ The example below shows how a domain builder can install a claim set and
+ later replace or clear it. :c:expr:`memory_claim_t` contains an additional
+ field for future expansion; zero-initialise the structure or use designated
+ initializers to ensure forward compatibility.
+
+ .. code-block:: C
+
+  #include <xenctrl.h>
+
+  void install_example_claims(xc_interface *xch, uint32_t domid)
+  {
+    /*
+     * Claim 1024 pages on node 0, 1024 pages on node 1, and by setting
+     * the total claim target to 3072 pages, an additional host-wide claim of
+     * 1024 pages which is never bound to any specific node is also installed.
+     */
+    memory_claim_t claims[] = {
+      {.pages = 1024, .target = 0},
+      {.pages = 1024, .target = 1},
+      {.pages = 1024, .target = XEN_DOMCTL_CLAIM_MEMORY_HOST},
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(claims), claims);
+
+    /* Replace the claim set with claims on nodes 1, 2, and 3 */
+    memory_claim_t claims2[] = {
+      {.pages = 1024, .target = 1},
+      {.pages = 1024, .target = 2},
+      {.pages = 1024, .target = 3},
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(claims2), claims2);
+
+    /* Release all remaining claims once the domain is built */
+    memory_claim_t clear[] = {
+      {.pages = 0, .target = XEN_DOMCTL_CLAIM_MEMORY_HOST}
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(clear), clear);
+  }
+
+Using the Xenctrl OCaml bindings
+--------------------------------
+
+ The OCaml bindings for libxenctrl also provide an interface for installing
+ claim sets using the :c:expr:`XEN_DOMCTL_claim_memory` hypercall command.
+
+ The example below shows how to install a claim set and later release it
+ using the OCaml bindings.
+
+ .. code-block:: OCaml
+
+  let install_example_claims xch domid =
+    let claims = [|
+      { Xenctrl.pages = 1024L; node = 0l };
+      { Xenctrl.pages = 1024L; node = 1l };
+      { Xenctrl.pages = 3072L; node = XEN_DOMCTL_CLAIM_MEMORY_TOTAL };
+    |] in
+    Xenctrl.domain_claim_memory xch domid claims;
+
+  let release_all_claims xch domid =
+    let clear = [|
+      { Xenctrl.pages = 0L; node = XEN_DOMCTL_CLAIM_MEMORY_TOTAL };
+    |] in
+    Xenctrl.domain_claim_memory xch domid clear
+
+Call sequence diagram
+---------------------
+
+ The following sequence diagram illustrates the call flow for claiming memory
+ for a domain using this hypercall command from an OCaml domain builder:
+
+ .. mermaid:: DOMCTL_claim_memory-seqdia.mmd
+   :caption: Sequence diagram: Call flow for claiming memory for a domain
+
+Claim workflow
+--------------
+
+ This diagram illustrates a workflow for claiming and populating memory:
+
+ .. mermaid:: DOMCTL_claim_memory-workflow.mmd
+   :caption: Workflow diagram: Claiming and populating memory for a domain
+
+Used functions & data structures
+--------------------------------
+
+ This diagram illustrates the key functions and data structures involved in
+ installing claims via the :c:expr:`XEN_DOMCTL_claim_memory` hypercall command:
+
+ .. mermaid:: DOMCTL_claim_memory-data.mmd
+   :caption: Diagram: Function and data relationships for installing claims
diff --git a/docs/guest-guide/dom/index.rst b/docs/guest-guide/dom/index.rst
new file mode 100644
index 000000000000..cb33a230eb5d
--- /dev/null
+++ b/docs/guest-guide/dom/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+`DOMCTL Hypercalls`
+===================
+
+Through `DOMCTL` `hypercalls`, `toolstacks` in privileged domains can perform
+operations related to domain management.  This includes operations such as
+creating, destroying, and modifying domains, as well as querying domain
+information.
+
+.. toctree::
+   :maxdepth: 2
+
+   DOMCTL_claim_memory
diff --git a/docs/guest-guide/index.rst b/docs/guest-guide/index.rst
index 5455c67479cf..d9611cd7504d 100644
--- a/docs/guest-guide/index.rst
+++ b/docs/guest-guide/index.rst
@@ -3,6 +3,29 @@
 Guest documentation
 ===================
 
+Xen exposes a set of hypercalls that allow domains and toolstacks in
+privileged contexts (such as Dom0) to request services from the hypervisor.
+
+Through these hypercalls, privileged domains can perform privileged operations
+such as querying system information, memory and domain management,
+and enabling inter-domain communication via shared memory and event channels.
+
+These hypercalls are documented in the following sections, grouped by their
+functionality. Each section provides an overview of the hypercalls, their
+parameters, and examples of how to use them.
+
+Hypercall API documentation
+---------------------------
+
+.. toctree::
+   :maxdepth: 2
+
+   dom/index
+   mem/index
+
+Hypercall ABI documentation
+---------------------------
+
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/guest-guide/mem/XENMEM_claim_pages.rst b/docs/guest-guide/mem/XENMEM_claim_pages.rst
new file mode 100644
index 000000000000..5128317cb821
--- /dev/null
+++ b/docs/guest-guide/mem/XENMEM_claim_pages.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _XENMEM_claim_pages:
+
+claim_pages
+***********
+
+ .. note:: This API is deprecated;
+    Use :c:expr:`XEN_DOMCTL_claim_memory` for new code.
+
+ .. c:macro:: XENMEM_claim_pages
+
+   Hypercall command for installing legacy claims.
+
+   :ref:`designs/claims/installation:Legacy claim installation` describes
+   the API for installing legacy claims via this hypercall command.
+
+   It passes a single claim entry to the hypervisor via a
+   :c:struct:`xen_memory_reservation` structure with the page count in the
+   :c:member:`xen_memory_reservation.nr_extents` field and the domain ID
+   :c:member:`xen_memory_reservation.domid` field. The claim entry's target is
+   implicitly global, and the legacy claim path is invoked in the hypervisor
+   to process the claim:
+
+Data structure for the hypercall command for installing legacy claims:
+
+ .. c:struct:: xen_memory_reservation
+
+   Structure for passing claim requests to the hypervisor via
+   :c:macro:`XENMEM_claim_pages` and other memory :term:`hypercalls`.
+
+   .. code-block:: C
+
+      struct xen_memory_reservation {
+          xen_pfn_t  * extent_start; // not used for XENMEM_claim_pages
+          xen_ulong_t  nr_extents;   // pass page counts to claim
+          unsigned int extent_order; // must be 0
+          unsigned int mem_flags;    // XENMEMF flags.
+          domid_t      domid;        // domain to apply the claim to
+      };
+      typedef struct xen_memory_reservation xen_memory_reservation_t;
+
+   .. c:member:: xen_ulong_t nr_extents
+
+      For :c:macro:`XENMEM_claim_pages`, the page count to claim.
+
+   .. c:member:: domid_t domid
+
+      Domain ID for the claim.
+
+   .. c:member:: unsigned int mem_flags
+
+      Not used for :c:macro:`XENMEM_claim_pages` (must be 0)
+
+      In principle, it supports all the :c:expr:`XENMEMF_*` flags, including
+      the possibility of passing a single NUMA node ID, but using it to pass
+      a NUMA node ID is not currently supported by the legacy claim path.
+
+      During review of the NUMA extension of the legacy claim path, it
+      was used, but the request was made to instead create a new hypercall
+      which is now :c:macro:`XEN_DOMCTL_claim_memory` with support for claim sets.
+
+   .. c:member:: unsigned int extent_order
+   .. c:member:: xen_pfn_t *extent_start
+
+      Both are not used for :c:macro:`XENMEM_claim_pages`, but are used for other
+      memory :term:`hypercalls`.
+
+See :ref:`designs/claims/installation:Legacy claim installation` for details.
+
+API example using libxenctrl
+----------------------------
+
+ The example below claims pages, populates the domain,
+ and then clears the claim.
+
+ .. code-block:: C
+
+  #include <xenctrl.h>
+
+  int build_with_claims(xc_interface *xch, uint32_t domid,
+                        unsigned long nr_pages)
+  {
+      int ret;
+
+      /* Claim pages for the domain build. */
+      ret = xc_domain_claim_pages(xch, domid, nr_pages);
+      if ( ret < 0 )
+          return ret;
+
+      /* Populate the domain's physmap. */
+      ret = xc_domain_populate_physmap(xch, domid, /* ... */);
+      if ( ret < 0 )
+          return ret;
+
+      /* Release any remaining claim after populating the domain memory. */
+      ret = xc_domain_claim_pages(xch, domid, 0);
+      if ( ret < 0 )
+          return ret;
+
+      /* Unpause the domain to allow it to run. */
+      return xc_unpause_domain(xch, domid);
+  }
diff --git a/docs/guest-guide/mem/index.rst b/docs/guest-guide/mem/index.rst
new file mode 100644
index 000000000000..042fb88bfbeb
--- /dev/null
+++ b/docs/guest-guide/mem/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+`MEMCTL Hypercalls`
+-------------------
+
+The XENMEM hypercall interface allows guests to perform various control
+operations related to memory management.
+
+.. toctree::
+   :maxdepth: 2
+
+   XENMEM_claim_pages
-- 
2.39.5


