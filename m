Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBXaER5koGnajAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:17:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5961A86D7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242115.1542830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvd7O-0005Y4-He; Thu, 26 Feb 2026 15:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242115.1542830; Thu, 26 Feb 2026 15:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvd7O-0005VK-EG; Thu, 26 Feb 2026 15:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1242115;
 Thu, 26 Feb 2026 15:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvd7M-0005VE-IM
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 15:17:32 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44625eed-1326-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 16:17:31 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 5F6E94142B87;
 Thu, 26 Feb 2026 10:17:09 -0500 (EST)
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
X-Inumbo-ID: 44625eed-1326-11f1-b164-2bf370ae4941
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
Subject: [PATCH v4 10/10] docs/guest-guide: document the memory claim hypercalls
Date: Thu, 26 Feb 2026 14:29:24 +0000
Message-Id: <66201baf1f046d5235ad629af35f456cd770344d.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: AB5961A86D7
X-Rspamd-Action: no action

Add guest-guide documentation for Xen’s memory-claim mechanism and
the two hypercalls for it to the docs:

- The legacy XENMEM_claim_pages (only for global host-wide claims)
- The new XEN_DOMCTL_claim_memory which adds NUMA-aware claims

Also document the implementation of claims in the hypervisor.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 .readthedocs.yaml                             |  13 +-
 docs/conf.py                                  |   6 +-
 .../dom/DOMCTL_claim_memory-classes.mmd       |  51 +++++++
 .../dom/DOMCTL_claim_memory-seqdia.mmd        |  23 ++++
 .../dom/DOMCTL_claim_memory-workflow.mmd      |  23 ++++
 docs/guest-guide/dom/DOMCTL_claim_memory.rst  | 125 ++++++++++++++++++
 docs/guest-guide/dom/index.rst                |  14 ++
 docs/guest-guide/index.rst                    |  23 ++++
 docs/guest-guide/mem/XENMEM_claim_pages.rst   |  68 ++++++++++
 docs/guest-guide/mem/index.rst                |  12 ++
 docs/hypervisor-guide/index.rst               |   5 +
 docs/hypervisor-guide/mm/claims.rst           | 114 ++++++++++++++++
 docs/hypervisor-guide/mm/index.rst            |  10 ++
 13 files changed, 485 insertions(+), 2 deletions(-)
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-classes.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory.rst
 create mode 100644 docs/guest-guide/dom/index.rst
 create mode 100644 docs/guest-guide/mem/XENMEM_claim_pages.rst
 create mode 100644 docs/guest-guide/mem/index.rst
 create mode 100644 docs/hypervisor-guide/mm/claims.rst
 create mode 100644 docs/hypervisor-guide/mm/index.rst

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index d3aff7662ebf..3be7334c7527 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -8,11 +8,22 @@ build:
 
   tools:
     python: "latest"
+    nodejs: "20"
 
   jobs:
     post_install:
+      # Required for rendering the mermaid diagrams in the offline
+      # documentation (PDF & ePub) formats.
+      - npm install -g @mermaid-js/mermaid-cli
       # Instead of needing a separate requirements.txt
-      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+      - >
+        python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+        sphinxcontrib-mermaid
 
 sphinx:
   configuration: docs/conf.py
+
+# Build PDF & ePub
+formats:
+  - epub
+  - pdf
\ No newline at end of file
diff --git a/docs/conf.py b/docs/conf.py
index 2fb8bafe6589..9316202d3318 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -61,7 +61,11 @@ needs_sphinx = '1.4'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = []
+extensions = ['sphinxcontrib.mermaid']
+
+mermaid_init_js = """
+mermaid.initialize({ theme: 'Neo', startOnLoad: true });
+"""
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-classes.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-classes.mmd
new file mode 100644
index 000000000000..1406a4919442
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory-classes.mmd
@@ -0,0 +1,51 @@
+%% SPDX-License-Identifier: CC-BY-4.0
+classDiagram
+
+class xen_domctl {
+    +uint32_t cmd
+    +uint32_t interface_version
+    +uint32_t domain
+    +xen_domctl_claim_memory
+}
+
+class xen_domctl_claim_memory {
+    +memory_claim_t* claims
+    +uint32_t nr_claims
+    +uint32_t pad
+}
+
+class memory_claim_t {
+    +uint64_aligned_t pages
+    +uint32_t node
+    +uint32_t pad
+}
+
+class xc_domain_claim_memory["xc_domain_claim_memory()"] {
+    +xc_interface* xch
+    +uint32_t domid
+    +uint32_t nr_claims
+    +memory_claim_t* claims
+}
+
+class page_alloc_globals["xen/common/page_alloc.c"] {
+    +unsigned long outstanding_claims
+    +unsigned long node_outstanding_claims[]
+}
+
+class claim["DOMCTL_claim_memory"] {
+    +int claim_memory(d, uinfo)
+    +int domain_set_outstanding_pages(d, pages, node)
+}
+
+class domain["struct domain"] {
+    +unsigned_int outstanding_pages
+    +nodeid_t claim_node
+}
+
+xen_domctl_claim_memory o--> memory_claim_t
+xen_domctl o--> xen_domctl_claim_memory
+xc_domain_claim_memory ..> xen_domctl : populates
+xc_domain_claim_memory ..> claim : calls via <tt>do_domctl()</tt>
+claim ..> xen_domctl_claim_memory : reads
+claim ..> domain : sets
+claim ..> page_alloc_globals : updates outstanding claims
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
new file mode 100644
index 000000000000..05d688c59f13
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
\ No newline at end of file
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
index 000000000000..8be37585f02a
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _XEN_DOMCTL_claim_memory:
+
+XEN_DOMCTL_claim_memory
+=======================
+
+This **domctl** command allows a privileged domain to stake a memory claim for
+a domain identical to :ref:`XENMEM_claim_pages`, but with support for
+NUMA-aware memory claims.
+
+A claim entry with a node value of ``XEN_DOMCTL_CLAIM_MEMORY_NO_NODE`` stakes
+a claim for host memory, exactly like :ref:`XENMEM_claim_pages` does.
+
+NUMA-aware memory claims
+------------------------
+
+Memory locality is an important factor for performance in NUMA systems.
+Allocating memory close to the CPU that will use it can reduce latency
+and improve overall performance.
+
+By claiming memory on specific NUMA nodes, toolstacks can ensure that they
+will be able to allocate memory for the domain on those nodes. This is
+particularly beneficial for workloads that are sensitive to memory latency,
+such as in-memory databases.
+
+**Note:** The ABI supports multiple claims for future expansion. At the moment,
+Xen accepts a single claim entry (either a NUMA-aware or host-wide claim).
+
+Implementation notes
+--------------------
+
+As described in :ref:`XENMEM_claim_pages`, Xen keeps track of the number
+of claimed pages in the domain's ``d->outstanding_pages`` counter.
+
+Xen declares a NUMA-aware claim by assigning ``d->claim_node`` to a NUMA node,
+which declares that ``d->outstanding_pages`` is claimed on ``d->claim_node``.
+
+See :ref:`hypervisor-guide` > :ref:`memory_management` > :ref:`memory_claims`
+for more details on the implementation on the details how claims are handled
+by the buddy allocator, and how a toolstack can populate the memory of a domain
+from the claimed node, even if it needs to wait for scrubbing to complete.
+
+Used functions & data structures
+--------------------------------
+
+This diagram illustrates the key functions and data structures involved in the
+implementation of the ``domctl`` hypercall command ``XEN_DOMCTL_claim_memory``:
+
+.. mermaid:: DOMCTL_claim_memory-classes.mmd
+  :caption: Diagram: Function and data relationships of XEN_DOMCTL_claim_memory
+
+Call sequence diagram
+---------------------
+
+The following sequence diagram illustrates the call flow for claiming memory
+for a domain using this hypercall command from an OCaml toolstack:
+
+.. mermaid:: DOMCTL_claim_memory-seqdia.mmd
+  :caption: Sequence diagram: Call flow for claiming memory for a domain
+
+Claim workflow
+--------------
+
+The following diagram illustrates a workflow for claiming and populating memory:
+
+.. mermaid:: DOMCTL_claim_memory-workflow.mmd
+  :caption: Workflow diagram: Claiming and populating memory for a domain
+
+API example (libxc)
+-------------------
+The following example demonstrates how a toolstack can claim memory before
+building the domain and then releasing the claim once the memory population
+is complete.
+
+Note: ``memory_claim_t`` contains padding to allow for future expansion.
+Thus, the structure must be zero-initialised to ensure forward compatibility.
+This can be achieved by using the ``XEN_NODE_CLAIM_INIT`` macro, which sets the
+pages and node fields while zero-initialising the padding of the structure,
+zero-initialising the entire structure, or by using a compound literal with
+designated initialisers to set the pages and node fields while zero-initialising
+the padding of the structure.
+
+.. code-block:: C
+
+  #include <xenctrl.h>
+
+  int claim_guest_memory(xc_interface *xch, uint32_t domid,
+                         uint64_t pages)
+  {
+      memory_claim_t claim[] = {
+        /*
+         * Example 1:
+         * Uses the ``XEN_NODE_CLAIM_INIT`` macro to zero-initialise the padding
+         * and set the pages and node fields for a NUMA-aware claim on node 0.
+         */
+        XEN_NODE_CLAIM_INIT(pages, 0)  /* Claim memory on NUMA node 0 */
+      };
+
+      /* Claim memory from NUMA node 0 for the domain build. */
+      return xc_domain_claim_memory(xch, domid, 1, claim);
+  }
+
+  int release_claim(xc_interface *xch, uint32_t domid)
+  {
+      memory_claim_t claim[] = {
+        /*
+         * Example 2:
+         * Uses a compound literal with designated initialisers to set the
+         * fields to release the claim while zero-initialising the rest
+         * of the structure for forward compatibility.
+         */
+        (memory_claim_t){
+          /*
+           * pages == 0 releases any outstanding claim.
+           * The node field is not used in this case, but must be set to
+           * XEN_DOMCTL_CLAIM_MEMORY_NO_NODE for forward compatibility.
+           */
+          .pages = 0,
+          .node = XEN_DOMCTL_CLAIM_MEMORY_NO_NODE,
+        }
+      };
+
+      /* Release any remaining claim once population is done. */
+      return xc_domain_claim_memory(xch, domid, 1, claim);
+  }
diff --git a/docs/guest-guide/dom/index.rst b/docs/guest-guide/dom/index.rst
new file mode 100644
index 000000000000..445ccf599047
--- /dev/null
+++ b/docs/guest-guide/dom/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domctl Hypercall
+================
+
+Through domctl hypercalls, toolstacks in privileged domains can perform
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
index 000000000000..7d465d2a87fe
--- /dev/null
+++ b/docs/guest-guide/mem/XENMEM_claim_pages.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _XENMEM_claim_pages:
+
+XENMEM_claim_pages
+==================
+
+This **xenmem** command allows a privileged guest to stake a memory claim for a
+domain, identical to :ref:`XEN_DOMCTL_claim_memory`, but without support for
+NUMA-aware memory claims.
+
+Memory claims in Xen
+--------------------
+
+The Xen hypervisor maintains a counter of outstanding pages for each domain
+which maintains a number of pages claimed, but not allocated for that domain.
+
+If the outstanding pages counter is zero, this hypercall allows a privileged
+guest to stake a claim for a specified number of pages of system memory for the
+domain.
+
+If the claim is successful, Xen updates the domain's outstanding pages counter
+to reflect the new claim, Xen allocates from the pool of claimed memory only
+for allocations for domains with a claim for this memory.
+
+A domain builder (toolstack in a privileged domain) building the domain can then
+allocate the guest memory for the domain, which converts the outstanding claim
+into actual memory of the new domain, backed by physical pages.
+
+Note that the resulting claim is relative to the already allocated pages for the
+domain, so the **pages** argument of this hypercall is absolute and must
+correspond to the total number expected to be allocated for the domain,
+and not incremental to the already allocated pages.
+
+Memory allocations by Xen for the domain also consume the claim, so toolstacks
+should stake a claim that is larger than the guest memory requirement to
+account for Xen's own memory usage. The exact amount of extra memory required
+depends on the configuration and features used by the domain, the host
+architecture and the features enabled by the Xen hypervisor on the host.
+
+Life-cycle of a claim
+---------------------
+
+The Domain's maximum memory limit must be set prior to staking a claim as
+the sum of the already allocated pages and the claim must be within that limit.
+
+To release the claim after the domain build is complete, call this hypercall
+command with the pages argument set to zero. This releases any remaining claim.
+`libxenguest` does this after the guest memory has been allocated for the domain
+and Xen does this also when it kills the domain.
+
+API example (libxc)
+-------------------
+The following example demonstrates how a toolstack can claim memory before
+building the domain and then releasing the claim once the memory population
+is complete.
+
+.. code-block:: C
+
+  #include <xenctrl.h>
+  ...
+      /* Claim memory for the domain build. */
+      int ret = xc_domain_claim_pages(xch, domid, nr_pages);
+
+      /* Build the domain and allocate memory for it. */
+      ...
+
+      /* Release any remaining claim after populating the domain memory. */
+      int ret = xc_domain_claim_pages(xch, domid, 0);
diff --git a/docs/guest-guide/mem/index.rst b/docs/guest-guide/mem/index.rst
new file mode 100644
index 000000000000..dabd1fd0153e
--- /dev/null
+++ b/docs/guest-guide/mem/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Memctl Hypercall
+================
+
+The memctl hypercall interface allows guests to perform various control
+operations related to memory management.
+
+.. toctree::
+   :maxdepth: 2
+
+   XENMEM_claim_pages
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
index 520fe01554ab..fef35a1ac4fe 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -1,12 +1,17 @@
 .. SPDX-License-Identifier: CC-BY-4.0
+.. _hypervisor-guide:
 
 Hypervisor documentation
 ========================
 
+See :ref:`memory_claims` for more details on the implementation of the claims
+mechanism in the Hypervisor and its interaction with the buddy allocator.
+
 .. toctree::
    :maxdepth: 2
 
    code-coverage
 
+   mm/index
    x86/index
    arm/index
\ No newline at end of file
diff --git a/docs/hypervisor-guide/mm/claims.rst b/docs/hypervisor-guide/mm/claims.rst
new file mode 100644
index 000000000000..97eb8a68fb1e
--- /dev/null
+++ b/docs/hypervisor-guide/mm/claims.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _memory_claims:
+
+Memory Claims
+=============
+
+Overview
+--------
+
+Xen's page allocator supports a **claims** mechanism that allows a domain
+builder to reserve memory before allocation begins, preventing concurrent
+allocations from exhausting available pages mid-build.
+A claim can be global (host-wide) or target a specific NUMA node, ensuring
+that a domain's memory is allocated locally on the same node as its vCPUs.
+
+The host-wide claims check subtracts global claims from total available pages.
+If the domain has claims, its ``d->outstanding_pages`` are added back as
+available (simplified pseudo-code):
+
+.. code:: C
+
+   ASSERT(spin_is_locked(&heap_lock));
+   unsigned long global_avail = total_avail_pages - outstanding_claims
+                                                    + d->outstanding_pages;
+   return alloc_request <= global_avail;
+
+Similarly, the per-node check enforces node-level claims by subtracting
+outstanding node claims from available node pages, and adding back the domain's
+claim if allocating from the claimed node:
+
+.. code:: C
+
+   ASSERT(spin_is_locked(&heap_lock));
+   unsigned long avail = node_avail_pages(node)
+                         - node_outstanding_claims(node)
+                         + (node == d->claim_node ? d->outstanding_pages : 0);
+   return alloc_request <= avail;
+
+Simplified pseudo-code for the claims checks in the buddy allocator:
+
+.. code:: C
+
+    struct page_info *get_free_buddy(order, memflags, d) {
+        for ( ; ; ) {
+            node = preferred_node_or_next_node();
+            if (!node_allocatable_request(d, memflags, 1 << order, node))
+                goto try_next_node;
+            /* Find a zone on this node with a suitable buddy */
+            for (zone = highest_zone; zone >= lowest_zone; zone--)
+                for (j = order; j <= MAX_ORDER; j++)
+                    if (pg = remove_head(&heap(node, zone, j)))
+                        return pg;
+         try_next_node:
+            if (req_node != NUMA_NO_NODE && memflags & MEMF_exact_node)
+                return NULL;
+            /* Fall back to the next node and repeat. */
+        }
+    }
+
+    struct page_info *alloc_heap_pages(d, order, memflags) {
+        if (!host_allocatable_request(d, memflags, 1 << order))
+            return NULL;
+        pg = get_free_buddy(order, memflags, d);
+        if (!pg) /* Retry allowing unscrubbed pages */
+            pg = get_free_buddy(order, memflags|MEMF_no_scrub, d);
+        if (!pg)
+            return NULL;
+        if (pg has dirty pages)
+            scrub_dirty_pages(pg);
+        return pg;
+    }
+
+.. note:: The first ``get_free_buddy()`` pass skips unscrubbed pages and may
+    fall back to other nodes. With ``memflags & MEMF_exact_node``, no fallback
+    occurs, so the first pass may return ``NULL``.
+    The 2nd pass with ``MEMF_no_scrub`` will consider the unscrubbed pages.
+    ``alloc_heap_pages()`` then scrubs them before returning, guaranteeing the
+    domain gets the desired node-local pages even when scrubbing is pending.
+
+    Therefore, toolstacks should set ``MEMF_exact_node`` in ``memflags`` when
+    allocating for a domain with a NUMA-aware claim to with
+    ``XENMEMF_exact_node(node)``.
+
+    For efficient scrubbing, toolstacks might want to run domain builds
+    pinned on a CPU of the target NUMA node to scrub the pages on that node
+    without cross-node traffic and lower latency to speed up domain build.
+
+Data Structures
+---------------
+
+The following diagram shows the relationships between global, per-node,
+and per-domain claim counters, all protected by the global ``heap_lock``.
+
+.. mermaid::
+
+   graph TB
+    subgraph "Protected by the heap_lock"
+       direction TB
+       Global --Sum of--> Per-node
+       Per-node --Sum of--> Per-domain
+    end
+    subgraph Per-domain
+        direction LR
+        claim_node["d->claim_node"]
+        claim_node --claims on--> outstanding_pages["d->outstanding_pages"]
+    end
+    subgraph Per-node
+        direction LR
+        node_outstanding_claims--constrains-->node_avail_pages
+    end
+    subgraph Global
+        direction LR
+        outstanding_claims--constrains-->total_avail_pages
+    end
diff --git a/docs/hypervisor-guide/mm/index.rst b/docs/hypervisor-guide/mm/index.rst
new file mode 100644
index 000000000000..9b5d60e3181a
--- /dev/null
+++ b/docs/hypervisor-guide/mm/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _memory_management:
+
+Memory Management
+=================
+
+.. toctree::
+   :maxdepth: 2
+
+   claims
-- 
2.39.5


