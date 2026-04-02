Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABnmFDtCzmlQmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:17:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E672387945
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271437.1559605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EpF-0004uY-5j; Thu, 02 Apr 2026 09:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271437.1559605; Thu, 02 Apr 2026 09:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EpF-0004re-2a; Thu, 02 Apr 2026 09:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1271437;
 Thu, 02 Apr 2026 09:58:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1w8EpD-0004rY-S1
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:58:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8EpB-004b1f-MO
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:58:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69ce3dd2-5cb7-0a2a0a5109dd-0a2a4508b1ae-34
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:58:55 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69ce3ddd-fab6-0a2a45080019-a0658308d9ec-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:58:54 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id BF8514270A5C;
 Thu,  2 Apr 2026 05:58:15 -0400 (EDT)
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
To: bernhard.kaindl@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Add Draft Design Documentation for NUMA-aware claim sets
Date: Thu,  2 Apr 2026 10:57:35 +0100
Message-Id: <40bc3d33bda11ac8526a50e8165aef1e8642c719.1775123578.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775123934-F6D4B737-C0001AD6/0/0
X-purgate-type: clean
X-purgate-size: 97289
X-Spamd-Result: default: False [4.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@gmail.com,m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bernhardkaindl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,xenproject.org:url,suse.com:email,bernhard-xen.readthedocs.io:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 9E672387945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The NUMA-aware claims v4 series allowed a domain to claim memory on a
single NUMA node, but not across multiple nodes.

There was no strong practical need for multi-node claims at the time,
as customers generally saw the best performance when domains were
aligned 1:1 with NUMA nodes.

Jan hinted that a multi-node implementation would look quite different,
and also Roger Pau Monné proposed this design earlier:
https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg00484.html

Quote:

> Ideally, we would need to introduce a new hypercall that allows
> making claims from multiple nodes in a single locked region,
> as to ensure success or failure in an atomic way.

This is a significant change, and so this design document is intended to
provide a reference for the rationale behind the design decisions, and
to support review of the implementation.

It is integrated into the Sphinx documentation for the Xen hypervisor
below ./docs/designs, and is structured in a way that allows readers
to easily navigate to the sections that are most relevant to them.

It uses Sphinx's integrated C domain, which makes it possible to create
surprisingly comprehensive documentation for C code, including function
signatures, parameters, return values and types. For reference:
https://www.sphinx-doc.org/en/master/usage/domains/c.html

Suggested-by: Jan Beulich <jbeulich@suse.com>
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

--
Dear reviewers,

for convenience, the rendered design document is available here for review:
https://bernhard-xen.readthedocs.io/en/claim-sets-v1-design/designs/claims/

The Sphinx site can be built and viewed locally with the following commands:

git pull git@gitlab.com:bernhardkaindl/xen.git claim-sets-v1-design

make -C docs sphinx-env-build # xdg-open docs/sphinx/html/index.html
or start a minimal HTTP server: (cd docs/sphinx/html; python -m http.server)

The specific acknowledgements are included in the design document.
Many thanks to everyone who has contributed to the previous work and
implementation of this feature, and to everyone who will review it.

Best regards,

  Bernhard
---
 .readthedocs.yaml                             |   4 +-
 docs/.gitignore                               |   1 +
 docs/Makefile                                 |  12 +-
 docs/conf.py                                  |  36 +-
 docs/designs/claims/accounting.rst            | 270 ++++++++++
 docs/designs/claims/design.rst                | 330 ++++++++++++
 docs/designs/claims/edge-cases.rst            |  24 +
 docs/designs/claims/history.rst               |  82 +++
 docs/designs/claims/implementation.rst        | 502 ++++++++++++++++++
 docs/designs/claims/index.rst                 |  43 ++
 docs/designs/claims/installation.rst          | 122 +++++
 docs/designs/claims/invariants.mmd            |  36 ++
 docs/designs/claims/protection.rst            |  41 ++
 docs/designs/claims/retirement.rst            |  70 +++
 docs/designs/claims/usecases.rst              |  39 ++
 docs/designs/index.rst                        |  16 +
 docs/designs/launch/hyperlaunch.rst           |   4 +-
 .../dom/DOMCTL_claim_memory-data.mmd          |  43 ++
 .../dom/DOMCTL_claim_memory-seqdia.mmd        |  23 +
 .../dom/DOMCTL_claim_memory-workflow.mmd      |  23 +
 docs/guest-guide/dom/DOMCTL_claim_memory.rst  |  81 +++
 docs/guest-guide/dom/index.rst                |  14 +
 docs/guest-guide/index.rst                    |  23 +
 docs/guest-guide/mem/XENMEM_claim_pages.rst   | 100 ++++
 docs/guest-guide/mem/index.rst                |  12 +
 docs/hypervisor-guide/index.rst               |   7 +
 docs/index.rst                                |   7 +-
 27 files changed, 1955 insertions(+), 10 deletions(-)
 create mode 100644 docs/designs/claims/accounting.rst
 create mode 100644 docs/designs/claims/design.rst
 create mode 100644 docs/designs/claims/edge-cases.rst
 create mode 100644 docs/designs/claims/history.rst
 create mode 100644 docs/designs/claims/implementation.rst
 create mode 100644 docs/designs/claims/index.rst
 create mode 100644 docs/designs/claims/installation.rst
 create mode 100644 docs/designs/claims/invariants.mmd
 create mode 100644 docs/designs/claims/protection.rst
 create mode 100644 docs/designs/claims/retirement.rst
 create mode 100644 docs/designs/claims/usecases.rst
 create mode 100644 docs/designs/index.rst
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-seqdia.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory-workflow.mmd
 create mode 100644 docs/guest-guide/dom/DOMCTL_claim_memory.rst
 create mode 100644 docs/guest-guide/dom/index.rst
 create mode 100644 docs/guest-guide/mem/XENMEM_claim_pages.rst
 create mode 100644 docs/guest-guide/mem/index.rst

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index d3aff7662ebf..f6dbb4ffa86f 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -12,7 +12,9 @@ build:
   jobs:
     post_install:
       # Instead of needing a separate requirements.txt
-      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+      - >
+        python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+        sphinxcontrib-mermaid
 
 sphinx:
   configuration: docs/conf.py
diff --git a/docs/.gitignore b/docs/.gitignore
index c3ce50335ae6..80c3d14ede69 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -1,3 +1,4 @@
+/.sphinx/
 /figs/*.png
 /html/
 /man/xl.cfg.5.pod
diff --git a/docs/Makefile b/docs/Makefile
index 8e68300e3b44..47e9f366ce7a 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -55,6 +55,16 @@ build: html txt pdf man-pages figs
 sphinx-html:
 	sphinx-build -b html . sphinx/html
 
+# Sphinx build target that sets up a virtual environment and installs
+# dependencies. This is intended for use by developers who want to build
+# the Sphinx documentation locally. Keep it the dependencies in sync with
+# .readthedocs.yaml.
+sphinx-env-build:
+	if [ ! -d .sphinx ]; then python -m venv .sphinx; fi
+	. .sphinx/bin/activate && \
+	pip install sphinx-rtd-theme sphinxcontrib-mermaid && \
+	$(MAKE) sphinx-html
+
 .PHONY: html
 html: $(DOC_HTML) html/index.html
 
@@ -76,7 +86,7 @@ pdf: $(DOC_PDF)
 clean: clean-man-pages
 	$(MAKE) -C figs clean
 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
-	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
+	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core .sphinx
 	rm -rf html txt pdf sphinx/html
 
 .PHONY: distclean
diff --git a/docs/conf.py b/docs/conf.py
index 2fb8bafe6589..5e51df6a21b9 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -61,7 +61,33 @@ needs_sphinx = '1.4'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = []
+extensions = ["sphinx.ext.autosectionlabel"]
+
+try:
+    import sphinxcontrib.mermaid
+except ImportError:
+    sys.stderr.write("""
+        Warning: The Sphinx 'sphinxcontrib.mermaid' extension was not found.
+        Make sure you have the extension installed to render mermaid diagrams
+        in the documentation. On Debian-based systems, you can install it with:
+        sudo apt install python3-sphinxcontrib-mermaid\n
+        In any case, after installing pipx, you can install the latest versions
+        of sphinx and the needed extras in an isolated environment with:\n
+        pipx install sphinx
+        pipx inject sphinx sphinxcontrib-mermaid sphinx-rtd-theme\n
+        """)
+else:
+    extensions.append("sphinxcontrib.mermaid")
+
+# Extension options
+
+# sphinxcontrib.mermaid
+mermaid_init_js = """
+mermaid.initialize({ startOnLoad: true });
+"""
+
+# sphinx.ext.autosectionlabel
+autosectionlabel_prefix_document = True
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -82,7 +108,7 @@ language = 'en'
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
 # This pattern also affects html_static_path and html_extra_path.
-exclude_patterns = [u'sphinx/output', 'Thumbs.db', '.DS_Store']
+exclude_patterns = [u'sphinx/output', 'Thumbs.db', '.DS_Store', '.sphinx']
 
 # The name of the Pygments (syntax highlighting) style to use.
 pygments_style = None
@@ -99,7 +125,11 @@ highlight_language = 'none'
 try:
     import sphinx_rtd_theme
     html_theme = 'sphinx_rtd_theme'
-    html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
+    # The sphinx_rtd_theme package versions prior to 3.0.0 require the theme
+    # path to be added to html_theme_path, while newer are warning about it:
+    # https://sphinx-rtd-theme.readthedocs.io/en/stable/changelog.html#deprecations
+    if sphinx_rtd_theme.__version__.split('.') < ['3', '0', '0']:
+        html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
 except ImportError:
     sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.\n')
 
diff --git a/docs/designs/claims/accounting.rst b/docs/designs/claims/accounting.rst
new file mode 100644
index 000000000000..79843406d92a
--- /dev/null
+++ b/docs/designs/claims/accounting.rst
@@ -0,0 +1,270 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Claims Accounting
+-----------------
+
+.. contents:: Table of Contents
+   :local:
+
+.. note::
+   Claims accounting state is only updated while holding :c:expr:`heap_lock`.
+   See :ref:`designs/claims/accounting:Locking of claims accounting`
+   for details on the locks used to protect claims accounting state.
+
+This section formalizes the internal state and invariants that Xen must
+maintain to ensure correctness.
+
+For readers following the design in order, the preceding sections are:
+
+1. :doc:`/designs/claims/design` introduces the overall model and goals.
+2. :doc:`/designs/claims/installation` explains how claim sets are installed.
+3. :doc:`/designs/claims/protection` describes how claimed memory is
+   protected during allocation.
+4. :doc:`/designs/claims/retirement` explains how claims are retired as
+   allocations succeed.
+
+Overview
+^^^^^^^^
+
+.. table:: Table 1: Claims accounting - All accesses, Aggregate state,
+           and invariants protected by :c:expr:`heap_lock`.
+   :widths: auto
+
+   ============ ======================================= =======================
+   Level           Claims must be lower or equal to       Available memory
+   ============ ======================================= =======================
+   Node         :c:expr:`node_outstanding_claims[node]` :c:expr:`node_avail_pages[node]`
+                  Aggregate state:
+
+                  Over all domains:
+
+                  SUM(:c:expr:`domain.claims[node]`)
+   Global       :c:expr:`outstanding_claims` =          :c:expr:`total_avail_pages` =
+                 Aggregate state:                        Aggregate state:
+
+                 SUM() over all domains:                 SUM() over all nodes:
+
+                 :c:expr:`domain.global_claims` +        :c:expr:`node_avail_pages[]`
+                 :c:expr:`domain.node_claims`
+
+                 Also, the sum over all nodes:
+
+                 :c:expr:`node_outstanding_claims[*]`
+   Dom global   :c:expr:`domain.global_claims`          :c:expr:`total_avail_pages`
+   Dom per-node :c:expr:`domain.claims[node]`           :c:expr:`node_avail_pages[node]`
+   Dom slow tot :c:expr:`domain.global_claims` +        :c:expr:`total_avail_pages`
+                SUM(:c:expr:`domain.claims[node]`)
+   Aggregate:   :c:expr:`domain.node_claims` =
+                SUM(:c:expr:`domain.claims[node]`)
+   Domain total :c:expr:`domain.global_claims`          :c:expr:`total_avail_pages`
+                + :c:expr:`domain.node_claims`
+   Domain mem   :c:expr:`domain_tot_pages(domain)`      Invariant: must be
+                 - plus :c:expr:`domain.global_claims`   lower or equal to
+
+                 + plus :c:expr:`domain.node_claims`     :c:expr:`domain.max_pages`
+   ============ ======================================= =======================
+
+Claims accounting state
+^^^^^^^^^^^^^^^^^^^^^^^
+
+When installing claims and retiring them during allocation, the page
+allocator updates:
+
+:c:expr:`domain.global_claims`
+  The domain's global claim.
+
+:c:expr:`domain.claims[MAX_NUMNODES]`
+  The domain's claims for specific NUMA nodes, indexed by node ID.
+
+Aggregate state
+^^^^^^^^^^^^^^^
+
+Xen also maintains aggregate state for fast checks in allocator hot paths:
+
+:c:expr:`outstanding_claims`:
+  The sum of all claims across all domains for global and node claims.
+
+:c:expr:`node_outstanding_claims[MAX_NUMNODES]`:
+  The sum of all claims across all domains for specific NUMA nodes, indexed
+  by node ID, used for efficient checks in the allocator hot paths to ensure
+  that node claims do not exceed the available memory on the respective node.
+
+:c:expr:`domain.node_claims`:
+  The total of the domain's node claims,
+  equal to the sum of :c:expr:`domain.claims[MAX_NUMNODES]` for all nodes
+  and used for efficient checks in the allocator.
+
+:c:expr:`domain_tot_pages(domain)`
+  The total pages allocated to the domain, used for validating that claims do
+  not exceed the domain's maximum page limits. This is the sum of the
+  domain's global claim and node claims, i.e. :c:expr:`domain.global_claims`
+  + :c:expr:`domain.node_claims`.
+
+Claims accounting invariants
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Xen must maintain the following invariants:
+
+- Global claims:
+    :c:expr:`outstanding_claims` :math:`\le` :c:expr:`total_avail_pages`
+
+- Node claims:
+    :c:expr:`node_outstanding_claims[alloc_node]` :math:`\le`
+    :c:expr:`node_avail_pages[alloc_node]`
+- Domain claims:
+    :c:expr:`domain.global_claims` + :c:expr:`domain.node_claims` +
+    :c:expr:`domain_tot_pages(domain)` :math:`\le` :c:expr:`domain.max_pages`
+
+   See :doc:`retirement` for details on the latter invariant.
+
+Locking of claims accounting
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+.. c:alias:: domain.page_alloc_lock
+
+.. c:var:: spinlock_t heap_lock
+
+   Lock for all heap operations including claims. It protects the claims state
+   and invariants from concurrent updates and ensures that checks in the
+   allocator hot paths see a consistent view of the claims state.
+
+   If :c:expr:`domain.page_alloc_lock` is needed to check
+   :c:expr:`domain_tot_pages(domain)` on top of new claims against
+   :c:expr:`domain.max_pages` for the domain, it needs to be taken
+   before :c:expr:`heap_lock` for consistent locking order to avoid deadlocks.
+
+Variables and data structures
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+.. c:type:: uint8_t nodeid_t
+
+   Type for :term:`NUMA node` IDs. The :c:expr:`memflags` variable of
+   :c:expr:`xc_populate_physmap()` and related functions for populating
+   the :term:`physmap` allocates 8 bits in the flags for the node ID, which
+   limits the theoretical maximum value of ``CONFIG_NR_NUMA_NODES`` at 254,
+   which is far beyond the current maximum of 64 supported by Xen and should
+   be sufficient for the foreseeable future.
+
+.. c:macro:: MAX_NUMNODES
+
+   The maximum number of NUMA nodes supported by Xen. Used for validating
+   node IDs in the :c:expr:`memory_claim_t` entries of claim sets.
+   When Xen is built without NUMA support, it is 1.
+   The default on x86_64 is 64 which is sufficient for current hardware and
+   allows for efficient storage of e.g. the :c:expr:`node_online_map` for
+   online nodes and :c:expr:`domain.node_affinity` in a single 64-bit value,
+   and in the :c:expr:`domain.claims[MAX_NUMNODES]` array.
+
+   ``xen/arch/Kconfig`` limits the maximum number of NUMA nodes to 64. While
+   Xen can be compiled for up to 254 nodes, configuring machines to split
+   the installed memory into more than 64 nodes would be unusual.
+   For example, dual-socket servers, even when using multiple chips per CPU
+   package should typically be configured for 2 NUMA nodes by default.
+
+.. c:var:: long total_avail_pages
+
+   Total available pages in the system, including both free and claimed pages.
+   This is used for validating that global claims do not exceed the total
+   available memory in the system.
+
+.. c:var:: long outstanding_claims
+
+   The total global claims across all domains. This is maintained for
+   efficient checks in the allocator hot paths to ensure the global claims
+   invariant that total claims do not exceed the total available memory is not
+   violated.
+
+.. c:var:: long node_avail_pages[MAX_NUMNODES]
+
+   Available pages for each NUMA node, including both free and claimed pages.
+   This is used for validating that node claims do not exceed the available
+   memory on the respective NUMA node.
+
+.. c:var:: long node_outstanding_claims[MAX_NUMNODES]
+
+   The total claims across all domains for each NUMA node, indexed by node
+   ID. This is maintained for efficient checks in the allocator hot paths.
+
+.. c:macro:: domain_tot_pages(domain)
+
+   The total pages allocated to the domain, used for validating that this
+   allocation and the domain's claims do not exceed :c:expr:`domain.max_pages`.
+
+.. c:struct:: domain
+
+   .. c:member:: unsigned int global_claims
+
+      The domain's global claim, representing the number of pages claimed
+      globally for the domain.
+
+   .. c:member:: unsigned int node_claims
+
+      The total of the domain's node claims, equal to the sum of
+      :c:expr:`claims` for all nodes.
+      It is maintained for efficient checks in the allocator hot paths
+      without needing to sum over the per-node claims each time.
+
+   .. c:member:: unsigned int claims[MAX_NUMNODES]
+
+      The domain's claims for each :term:`NUMA node`, indexed by node ID.
+
+      As :c:expr:`domain` is allocated using a dedicated page for each domain,
+      this allows for efficient and fast storage with direct indexing without
+      consuming any additional memory for an additional allocation.
+
+      The page allocated for struct :c:expr:`domain` is large enough
+      to accommodate this array several times, even beyond the current
+      :c:expr:`MAX_NUMNODES` limit of 64, so it should be sufficient even
+      for future expansion of the maximum number of supported NUMA nodes
+      if needed. The allocation has a build-time assertion for safety to
+      ensure that struct :c:expr:`domain` fits within the allocated page.
+
+      The sum of these claims is stored in :c:expr:`domain.node_claims`
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
+      Lock for checking :c:expr:`domain_tot_pages(domain)` on top of new claims
+      against :c:expr:`domain.max_pages` when installing these new claims.
+      This is a recursive spinlock to allow for nested calls into the allocator
+      while holding it, such as when retiring claims during page allocation.
+      It is taken before :c:expr:`heap_lock` when installing claims to ensure a
+      consistent locking order and may not be taken while holding
+      :c:expr:`heap_lock` to avoid deadlocks.
+
+   .. c:member:: nodemask_t node_affinity
+
+      A :c:expr:`nodemask_t` representing the set of NUMA nodes the domain
+      is affine to. This is used for efficient checks in the allocator hot
+      paths to quickly get the set of nodes a domain is affine to for
+      memory allocation decisions.
+
+.. c:type:: nodemask_t
+
+   A bitmap representing a set of NUMA nodes, used for status information
+   like :c:expr:`node_online_map` and the :c:expr:`domain.node_affinity`
+   and to track which nodes are online and which nodes are in a domain's
+   node affinity.
+
+.. c:var:: nodemask_t node_online_map
+
+   A bitmap representing which NUMA nodes are currently online in the system.
+   This is used for validating that claims are only made for online nodes and
+   for efficient checks in the allocator hot paths to quickly determine which
+   nodes are online. Currently, Xen does not support hotplug of NUMA nodes,
+   so this is set at boot time based on the platform firmware configuration
+   and does not change at runtime.
+
+Claims Accounting Diagram
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This diagram illustrates the claims accounting state and the invariants:
+
+.. mermaid:: invariants.mmd
+  :caption: Diagram: Claims accounting state and invariants
diff --git a/docs/designs/claims/design.rst b/docs/designs/claims/design.rst
new file mode 100644
index 000000000000..8d313da2387e
--- /dev/null
+++ b/docs/designs/claims/design.rst
@@ -0,0 +1,330 @@
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
+:term:`domain builders` to reserve an amount of available memory before
+:term:`populating` the :term:`guest physical memory` of new :term:`domains`
+they are creating, configuring and building.
+
+These reservations are called :term:`claims`. They ensure that the claimed
+memory remains available for the :term:`domains` when allocating it, even
+if other :term:`domains` are allocating memory at the same time.
+
+:term:`Installing claims` is a privileged operation performed by
+:term:`domain builders` before they populate the :term:`guest physical memory`.
+This prevents other :term:`domains` from allocating memory earmarked
+for :term:`domains` under construction. Xen maintains the per-domain
+claim state for pages that are claimed but not yet allocated.
+
+When claim installation succeeds, Xen updates the claim state to reflect
+the new targets and protects the claimed memory until it is allocated or
+the claim is released. As Xen allocates pages for the domain, claims are
+retired by reducing the claim state by the size of each allocation.
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
+2. Preserve the existing :c:expr:`XENMEM_claim_pages` hypercall command
+   for compatibility with existing :term:`domain builders` and its legacy
+   semantics, while introducing a new, unrestricted hypercall command for
+   new use cases such as NUMA-aware claim sets.
+
+3. Global claims are supported for compatibility with existing domain builders
+   and for use cases where a flexible claim that can be satisfied from any node
+   is desirable, such as on UMA machines or as a fallback for memory that comes
+   available on any node. This means we cannot remove or replace the legacy
+   global claim call nor the needed variables maintaining the global claim
+   state. They are still very much needed: claims are not just for NUMA use
+   cases, but for :term:`parallel domain builds` in general.
+
+   Only on UMA machines is a global claim the same as a claim on node 0,
+   but the same is not true for NUMA machines, where global claims can claim
+   more memory than any single node, and the global claim can be used as a
+   flexible fallback for claiming memory on any node, which can be useful
+   when preferred NUMA node(s) should be claimed, but may have insufficient
+   free memory at the time of claim installation, and the global claim can
+   ensure that the shortfall is available from any node.
+
+4. Use fast allocation-time claims protection in the allocator's hot paths
+   to protect claimed memory from parallel allocations from other domain
+   builders in case of parallel domain builds, and to protect claimed
+   memory from allocations from already running domains.
+
+***************
+Design Overview
+***************
+
+The legacy :ref:`XENMEM_claim_pages` hypercall is superseded by
+:c:expr:`XEN_DOMCTL_claim_memory`. This hypercall installs a :term:`claim set`.
+It is an array of :c:expr:`memory_claim_t` entries, where each entry specifies
+a page count and a target: either a specific NUMA node ID or a special selector
+(for example, a global or flexible claim).
+
+Like legacy claims, claim sets are validated and installed under
+:c:expr:`domain.page_alloc_lock` and :c:expr:`heap_lock`: Either the entire
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
+  :c:expr:`XENMEM_claim_pages` hypercall command to install single-node claims
+  with the legacy semantics and, aside from improvements or fixes to global
+  claims in general, observe no changes in their behaviour.
+- Updated domain builders can take advantage of claim sets to install
+  NUMA-aware :term:`claims` on multiple :term:`NUMA nodes` and/or globally
+  in a single step.
+
+For readers following the design in order, the next sections cover the
+following topics:
+
+1. :doc:`/designs/claims/installation` explains how claim sets are installed.
+2. :doc:`/designs/claims/protection` describes how claimed memory is
+   protected during allocation.
+3. :doc:`/designs/claims/retirement` explains how claims are retired as
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
+  Tracks the sum of all claims on a node. :c:expr:`get_free_buddy()` checks
+  it before scanning zones on a node, so claimed memory is protected from
+  other allocations.
+
+ :c:expr:`claims_retire_allocation()`
+  Retires claims in order: First, it retires claims from the allocation node's
+  claim. If this is not sufficient, it retires claims from the global claim as
+  a fallback. This allows the global claim to be used as a flexible fallback
+  for claiming allocations on any node. Finally, remaining claims are retired
+  from other nodes to prevent the increase of :c:expr:`domain_tot_pages(domain)`
+  caused by the allocation on top of
+  :c:expr:`domain.global_claims` and :c:expr:`domain.node_claims` to exceed
+  :c:expr:`domain.max_pages`.
+
+ :c:expr:`domain.global_claims` (formerly :c:expr:`domain.outstanding_claims`)
+  Support for :term:`global claims` is maintained for two reasons: first,
+  for compatibility with existing domain builders, and second, for use cases
+  where a flexible claim that can be satisfied from any node is desirable.
+
+  When the preferred NUMA node(s) for a domain do not have sufficient free
+  memory to satisfy the domain's memory requirements, global claims provide
+  a flexible fallback for the memory shortfall from the preferred node(s) that
+  can be satisfied from any available node.
+
+  In this case, :term:`domain builders` can exploit a combination of passing
+  the preferred node to :c:expr:`xc_domain_populate_physmap()` and
+  :term:`NUMA node affinity` to steer allocations towards the preferred NUMA
+  node(s), while letting the global claim ensure that the shortfall is
+  available.
+
+  This allows the domain builder to define a set of desired NUMA nodes to
+  allocate from and even specify which nodes to prefer for an allocation,
+  but the claim for the shortfall is flexible, not specific to any node.
+
+*********
+Non-goals
+*********
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
+The :term:`domain builders` using the :c:expr:`XEN_DOMCTL_claim_memory`
+hypercall also need to use other version-controlled hypercalls which
+are wrapped through the :term:`libxenctrl` library.
+
+Wrapping this call in :term:`libxenctrl` is therefore a practical approach;
+otherwise, we would have a mix of version-controlled and unversioned hypercalls,
+which could be confusing for API users and for future maintenance. From the
+domain builders' viewpoint, it is more consistent to expose the claims
+hypercall in the same way as the other calls they use.
+
+Stable interfaces also have drawbacks: with stable syscalls, Linux needs
+to maintain the old interface indefinitely, which can be a maintenance burden
+and can limit the ability to make improvements or changes to the interface
+in the future. Linux carries many system call successor families, e.g., oldstat,
+stat, newstat, stat64, fstatat, statx, with similar examples including openat,
+openat2, clone3, dup3, waitid, mmap2, epoll_create1, pselect6 and many more.
+Glibc hides that complexity from users by providing a consistent API, but it
+still needs to maintain the old system calls for compatibility.
+
+In contrast, versioned hypercalls allow for more flexibility and evolution of
+the API while still providing a clear path to adopt new features. The reserved
+fields and reserved bits in the structures of this hypercall allow for many
+future extensions without breaking existing callers.
+
+********
+Glossary
+********
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
+  An array of :c:expr:`memory_claim_t` entries, each specifying a page count
+  and a target (either a NUMA node ID or a special value for global claims),
+  that can be installed atomically for a domain to reserve memory on multiple
+  NUMA nodes. The chapter on :ref:`designs/claims/installation:claim sets`
+  provides further information on the structure and semantics of claim sets.
+
+ claim set installation
+ installing claim sets
+ installing claims
+  The process of validating and installing a claim set for a domain under
+  :c:expr:`domain.page_alloc_lock` and :c:expr:`heap_lock`, ensuring that
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
+ domains
+  Virtual machine instances managed by Xen, built by :term:`domain builders`.
+
+ global claims
+  :term:`claims` that can be satisfied from any NUMA node, required for
+  compatibility with existing domain builders and for use cases where
+  strict node-local placement is not required or not possible, such as on
+  UMA machines or as a fallback for memory that comes available on any node.
+
+ libxenctrl
+  A library used by :term:`domain builders` running in privileged
+  :term:`domains` to interact with the hypervisor, including making
+  hypercalls to install claims and populate memory.
+
+ libxenguest
+  A library used by :term:`domain builders` running in privileged
+  :term:`domains` to interact with the hypervisor, including making
+  hypercalls to install claims and populate memory.
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
+  the :term:`physmap` using calls to :c:expr:`xc_domain_populate_physmap()`.
+
+ nodemask
+  A bitmap representing a set of NUMA nodes, used for status information
+  like :c:expr:`node_online_map` and the :c:expr:`domain.node_affinity`.
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
+  NUMA node IDs start at 0 and are less than :c:expr:`MAX_NUMNODES`.
+
+  Some NUMA nodes may be offline, and the :c:expr:`node_online_map` is used
+  to track which nodes are online. Currently, Xen does not support hotplug
+  of NUMA nodes, so the set of online NUMA nodes is determined at boot time
+  based on the platform firmware configuration and does not change at runtime.
+
+ NUMA node affinity
+  The preference of a :term:`domain` for a set of NUMA nodes, which can be used
+  by :term:`domain builders` to guide memory allocation even when not forcing
+  the buddy allocator to only consider (or prefer) a specific node when
+  allocating memory, but even a set of preferred NUMA nodes.
+
+  By default, domains have NUMA node auto-affinity, which means their NUMA
+  node affinity is determined automatically by the hypervisor based on the
+  CPU affinity of their vCPUs, but it can be disabled and configured.
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
diff --git a/docs/designs/claims/edge-cases.rst b/docs/designs/claims/edge-cases.rst
new file mode 100644
index 000000000000..cfb37ef24259
--- /dev/null
+++ b/docs/designs/claims/edge-cases.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Handling Edge Cases
+-------------------
+
+Allocations exceeding claims
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+When an allocation exceeds the domain's claims, the allocator must check
+whether unclaimed memory can satisfy the remainder of the request before
+rejecting the allocation.
+
+Previously, if a domain's remaining claim did not fully cover a request,
+the allocator rejected the allocation even when enough unclaimed memory
+existed to satisfy it.
+
+This forced the :term:`meminit` API to fall back from ``1G`` pages to ``2M``
+and eventually to ``4K`` pages, reducing performance due to higher TLB
+pressure and increased page bookkeeping.
+
+Supporting the use of unclaimed memory to satisfy the remainder of the
+request in such cases lets builders continue to use large pages when the
+combination of claims and unclaimed memory allows it, possibly improving
+runtime performance in such scenarios.
diff --git a/docs/designs/claims/history.rst b/docs/designs/claims/history.rst
new file mode 100644
index 000000000000..3c6d745e948c
--- /dev/null
+++ b/docs/designs/claims/history.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+*******************
+Development History
+*******************
+
+.. note:: This section provides historical context on the development of
+   NUMA-aware claims, including previous implementations and feedback received,
+   to give a better understanding of the design decisions made in the current
+   implementation.
+
+The initial `implementation of single-node claims <v1_>`_ (by Alejandro Vallejo)
+introduced node-exact claims, allowing :term:`domain builders` to claim memory
+on one :term:`NUMA node`. It passed a NUMA node in the node bits of the
+:c:expr:`xen_memory_reservation.mem_flags`
+field of the pre-existing claims hypercall :ref:`XENMEM_claim_pages` and, by
+adding the flag ``d->claim_node`` and updating it to the passed node, defined
+the target of the claim as either the specified NUMA node or global memory.
+
+.. sidebar:: Feedback and suggestions for multi-node claim sets
+
+   The initial implementations of single-node claims received feedback from the
+   community, with multiple suggestions to extend the API to support `multi-node
+   claim sets <v1m_>`_. This feedback highlighted the need for a more flexible
+   and extensible design that could accommodate claims on multiple NUMA nodes.
+
+This design was relatively simple and allowed for a quick implementation of
+single-node claims, but it had limitations in terms of flexibility and future
+extensibility.
+
+The `v2 series added a hypercall API for multi-node claims <v2_>`_, opening the
+door to future multi-node claim sets and further work in that direction.
+
+The `v3 series refactored and improved the implementation <v3_>`_, protecting
+claimed memory against parallel allocations by other domain builders.
+
+Between v3 and v4, `Roger Pau Monné and Andrew Cooper developed and merged
+several critical fixes <fix1_>`_ for Xen's overall claims implementation.
+These fixes also allowed Roger to improve the implementation for retiring
+claims during domain memory allocation. In turn, this enabled a
+fully working implementation that protected claimed memory against parallel
+allocations by other domain builders.
+
+With the `v4 series <v4_>`_, we submitted the combined work that completed the
+fixes for protecting claimed memory on NUMA nodes. The review process indicated
+that supporting multiple claim sets would require a `redesign <v4-03_>`_ of
+claim installation and management, which led to this design document.
+
+Acknowledgements
+----------------
+
+The claim sets design builds on the single-node claims implementation
+described above and the feedback it generated. The following people
+should be acknowledged for their contributions:
+
+- *Alejandro Vallejo* for initiating the single-node NUMA claims series.
+- *Roger Pau Monné* for merging critical fixes and proposing the initial
+   multi-node claim-sets specification that inspired this design.
+- *Andrew Cooper* for integrating and validating the work internally,
+   helping to stabilise and productise the single-node implementation.
+- *Jan Beulich* for providing reviews that led to many improvements.
+- *Bernhard Kaindl* for maintaining the single-node series, initiating
+   the multi-node implementation and authoring this design document.
+- *Marcus Granado* and *Edwin Török* for contributing design input,
+   providing guidance, debugging and testing of single-node implementations.
+
+.. _fix1:
+   https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00164.html
+
+.. _v1:
+   https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
+.. _v1m:
+   https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg00484.html
+.. _v2:
+   https://lists.xen.org/archives/html/xen-devel/2025-08/msg01076.html
+.. _v3:
+   https://patchew.org/Xen/cover.1757261045.git.bernhard.kaindl@cloud.com/
+.. _v4:
+    https://lists.xenproject.org/archives/html/xen-devel/2026-02/msg01387.html
+.. _v4-03: https://patchwork.kernel.org/project/xen-devel/
+   patch/6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423
+   .git.bernhard.kaindl@citrix.com/
diff --git a/docs/designs/claims/implementation.rst b/docs/designs/claims/implementation.rst
new file mode 100644
index 000000000000..ebc5b045701a
--- /dev/null
+++ b/docs/designs/claims/implementation.rst
@@ -0,0 +1,502 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+#####################
+Claims Implementation
+#####################
+
+.. contents:: Table of Contents
+    :backlinks: entry
+    :local:
+
+.. note:: This part describes implementation details of claims and their
+    interaction with memory allocation in Xen. It covers the functions and
+    data structures involved in :term:`installing claims`, allocating memory
+    with :term:`claims`, and handling related edge cases.
+
+Functions related to the implementation of claims and their interaction
+with memory allocation.
+
+**********************
+Installation of claims
+**********************
+
+This section describes the functions and data structures involved
+in :term:`installing claims` for domains and the internal functions for
+validating and installing claim sets.
+
+xc_domain_claim_memory()
+------------------------
+
+.. c:function:: int xc_domain_claim_memory(xc_interface *xch, \
+                                           uint32_t domid, \
+                                           uint32_t nr_claims, \
+                                           memory_claim_t *claims)
+
+    :param xch:       The libxenctrl interface to use for the hypercall
+    :param domid:     The ID of the domain for which to install the claim set
+    :param nr_claims: The number of claims in the claim set
+    :param claims:    The claim set to install for the domain
+    :type xch:        xc_interface *
+    :type domid:      uint32_t
+    :type nr_claims:  uint32_t
+    :type claims:     memory_claim_t *
+    :returns:         0 on success, or a negative error code on failure.
+
+    Wrapper for :c:expr:`XEN_DOMCTL_claim_memory` to install
+    :ref:`claim sets <designs/claims/installation:claim sets>` for a domain.
+
+domain_set_outstanding_pages()
+------------------------------
+
+.. c:function:: int domain_set_outstanding_pages(struct domain *d, \
+                                                 unsigned long pages)
+
+    :param d:     The domain for which to set the outstanding claims
+    :param pages: The number of pages to claim globally for the domain
+    :type d:      struct domain *
+    :type pages:  unsigned long
+    :returns: 0 on success, or a negative error code on failure.
+
+    Handles claim installation for :c:expr:`XENMEM_claim_pages` and
+    :c:expr:`XEN_DOMCTL_claim_memory` with
+    :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_LEGACY` by setting the domain's
+    :term:`global claims` to the specified number of pages. It calculates
+    the claims as the requested pages minus the domain's total pages.
+    When :c:expr:`pages == 0`, it clears the claims of the domain.
+
+domain_set_node_claims()
+------------------------
+
+.. c:function:: int domain_set_node_claims(struct domain *d, \
+                                           unsigned int nr_claims, \
+                                           memory_claim_t *claims)
+
+    :param d: The domain for which to set the node claims
+    :param nr_claims: The number of claims in the claim set
+    :param claims: The claim set to install for the domain
+    :type claims: memory_claim_t *
+    :type d: struct domain *
+    :type nr_claims: unsigned int
+    :returns: 0 on success, or a negative error code on failure.
+
+    Handles :term:`installing claim sets`. It performs the validation
+    of the :term:`claim set` and updates the domain's claims accordingly.
+
+    The function works in four phases:
+
+     1. Validating claim entries and checking node-local availability
+     2. Validating total claims and checking global availability
+     3. Resetting any current claims of the domain
+     4. Installing the claim set as the domain's claiming state
+
+    Phase 1 checks claim entries for validity and memory availability:
+
+     1. Target must be :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_GLOBAL` or a node.
+     2. Each target node may only appear once in the claim set.
+     3. For node-local claims, requested pages must not exceed the available
+        memory on that node after accounting for existing claims.
+     4. The explicit padding field must be zero for forward compatibility.
+
+    Phase 2 checks:
+
+     1. The sum of claims must not exceed globally available memory.
+     2. The claims must not exceed the :c:expr:`domain.max_pages` limit.
+        See :doc:`accounting` and :doc:`retirement` for the accounting
+        checks that enforce the domain's :c:expr:`domain.max_pages` limit.
+
+************************************
+Helper functions for managing claims
+************************************
+
+:c:expr:`claims_retire_global()` and :c:expr:`claims_retire_node()` are helper
+functions used to retire claims when necessary:
+
+- :c:expr:`claims_retire_allocation()`
+  uses them to retire claims when allocating memory.
+- :c:expr:`claims_retire_nodes()`
+  uses :c:expr:`claims_retire_node()` to reset all node-local claims
+  of a domain when resetting the claim state of the domain.
+- :c:expr:`reserve_offlined_page()`
+  uses them to recall claims when offlining pages reduces
+  available memory below the currently claimed memory. See
+  :ref:`designs/claims/implementation:Offlining memory in presence of claims`
+  for further information.
+
+claims_retire_global()
+----------------------
+
+.. c:function:: unsigned long claims_retire_global(struct domain *d, \
+                                                   unsigned long \
+                                                   pages_to_retire)
+
+    :param d: The domain for which to retire the global claim
+    :param pages_to_retire: The number of pages to retire
+    :type d: struct domain *
+    :type pages_to_retire: unsigned long
+    :returns: The number of pages actually retired from the global claim.
+
+    This function retires the specified number of globally claimed pages
+    and updates the global outstanding totals accordingly.
+
+claims_retire_node()
+--------------------
+
+.. c:function:: unsigned long claims_retire_node(struct domain *d, \
+                                                 nodeid_t node, \
+                                                 unsigned long pages_to_retire)
+
+    :param d: The domain for which to retire the node claim
+    :param node: The node for which to retire the claim
+    :param pages_to_retire: The number of pages to retire from the claim
+    :type d: struct domain *
+    :type node: nodeid_t
+    :type pages_to_retire: unsigned long
+    :returns: The number of pages actually retired from the claim
+
+    This function retires a specified number of pages from a domain's
+    claim on a specific node. It limits the retirement to the number of
+    pages actually claimed by the domain on that node and updates the
+    node-local claims currently held by the domain on that node,
+    and it updates the global and node-level claim state accordingly.
+
+claims_retire_nodes()
+---------------------
+
+.. c:function:: void claims_retire_nodes(struct domain *d)
+
+    :param d: The domain for which to retire the node claims.
+    :type d: struct domain *
+
+    This function is used by
+    :ref:`designs/claims/implementation:domain_set_outstanding_pages()`
+    to reset node-local parts of the domain's claiming state.
+
+**********************
+Allocation with claims
+**********************
+
+The functions below play a key role in allocating memory for domains.
+
+xc_domain_populate_physmap()
+----------------------------
+
+ .. c:function:: int xc_domain_populate_physmap(xc_interface *xch, \
+                                           uint32_t domid, \
+                                           unsigned long nr_extents, \
+                                           unsigned int extent_order, \
+                                           unsigned int mem_flags, \
+                                           xen_pfn_t *extent_start)
+
+    :param xch: The :term:`libxenctrl` interface
+    :param domid: The ID of the domain
+    :param nr_extents: Number of extents
+    :param extent_order: Order of the extents
+    :param mem_flags: Allocation flags
+    :param extent_start: Starting PFN
+    :type xch: xc_interface *
+    :type domid: uint32_t
+    :type nr_extents: unsigned long
+    :type extent_order: unsigned int
+    :type mem_flags: unsigned int
+    :type extent_start: xen_pfn_t *
+    :returns: 0 on success, or a negative error code on failure.
+
+    This function is a wrapper for the ``XENMEM_populate_physmap`` hypercall,
+    which is handled by the :c:expr:`populate_physmap()` function in the
+    hypervisor. It is used by :term:`libxenguest` for populating the
+    :term:`guest physical memory` of a domain. :term:`domain builders` can
+    set the :term:`NUMA node affinity` and pass the preferred node to this
+    function to steer allocations towards the preferred NUMA node(s) and let
+    :term:`claims` ensure that the memory will be available even in cases
+    of :term:`parallel domain builds` where multiple domains are being built
+    at the same time.
+
+
+populate_physmap()
+------------------
+
+The :term:`meminit` API calls :c:expr:`xc_domain_populate_physmap()`
+for populating the :term:`guest physical memory`. It invokes the restartable
+``XENMEM_populate_physmap`` hypercall implemented by
+:c:expr:`populate_physmap()`.
+
+.. c:function:: void populate_physmap(struct memop_args *a)
+
+    :param a: Provides status and hypercall restart info
+    :type a: struct memop_args *
+
+    Allocates memory for building a domain and uses it for populating the
+    :term:`physmap`. For allocation, it uses
+    :c:expr:`alloc_domheap_pages()`, which forwards the request to
+    :c:expr:`alloc_heap_pages()`.
+
+    During domain creation, it adds the ``MEMF_no_scrub`` flag to the request
+    for populating the :term:`physmap` to optimize domain startup by allowing
+    the use of unscrubbed pages.
+
+    When that happens, it scrubs the pages as needed using hypercall
+    continuation to avoid long hypercall latency and watchdog timeouts.
+
+    Domain builders can optimise on-demand scrubbing by running
+    :term:`physmap` population pinned to the domain's NUMA node,
+    keeping scrubbing local and avoiding cross-node traffic.
+
+alloc_heap_pages()
+------------------
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
+    allocation. On success, it updates relevant counters and retires
+    claims as necessary.
+
+    It first checks whether the request can be satisfied given the domain's
+    claims and available memory using :c:expr:`claims_permit_request()`.
+    If claims and availability permit the request, it calls
+    :c:expr:`get_free_buddy()` to find a suitable block of free pages
+    while respecting node and zone constraints.
+
+    If ``MEMF_no_scrub`` is allowed, it may return unscrubbed pages. When that
+    happens, :c:expr:`populate_physmap()` scrubs them if needed with hypercall
+    continuation to avoid long hypercall latency and watchdog timeouts.
+
+    Simplified pseudo-code of its logic:
+.. code:: C
+
+    struct page_info *alloc_heap_pages(unsigned int zone_lo,
+                                       unsigned int zone_hi,
+                                       unsigned int order,
+                                       unsigned int memflags,
+                                       struct domain *d) {
+        /* Check whether claims and available memory permit the request.
+         * `avail_pages` and `claims` are placeholders for the appropriate
+         * global or node-local availability/counts used by the real code. */
+        if (!claims_permit_request(d, avail_pages, claims, memflags,
+                                   1UL << order, NUMA_NO_NODE))
+            return NULL;
+
+        /* Find a suitable buddy block. Pass the zone range, order and
+         * memflags so the helper can apply node and zone selection. */
+        pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
+        if (!pg)
+            return NULL;
+
+        claims_retire_allocation(d, 1UL << order, node_of(pg));
+        update_counters_and_stats(d, order);
+        if (pg_has_dirty_pages(pg))
+            scrub_dirty_pages(pg);
+        return pg;
+    }
+
+get_free_buddy()
+----------------
+
+.. c:function:: struct page_info *get_free_buddy(unsigned int zone_lo, \
+                                                 unsigned int zone_hi, \
+                                                 unsigned int order, \
+                                                 unsigned int memflags, \
+                                                 const struct domain *d)
+
+    :param zone_lo: The lowest zone index to consider for allocation
+    :param zone_hi: The highest zone index to consider for allocation
+    :param order: The order of the pages to allocate (2^order pages)
+    :param memflags: Flags for conducting the allocation
+    :param d: domain to allocate memory for or NULL
+    :type zone_lo: unsigned int
+    :type zone_hi: unsigned int
+    :type order: unsigned int
+    :type memflags: unsigned int
+    :type d: struct domain *
+    :returns: The allocated page_info structure, or NULL on failure
+
+    This function finds a suitable block of free pages in the buddy
+    allocator while respecting claims and node-level available memory.
+
+    Called by :c:expr:`alloc_heap_pages()` after verifying the request is
+    permissible, it iterates over nodes and zones to find a buddy block
+    that satisfies the request. It checks node-local claims before
+    attempting allocation from a node.
+
+    Using :c:expr:`claims_permit_request()`, it checks whether the node
+    has enough unclaimed memory to satisfy the request or whether the
+    domain's claims can permit the request on that node after accounting
+    for outstanding claims.
+
+    If the node can satisfy the request, it searches for a suitable block
+    in the specified zones. If found, it returns the block; otherwise it
+    tries the next node until all online nodes are exhausted.
+
+    Simplified pseudo-code of its logic:
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
+            if (!node_allocatable_request(d, node_avail_pages[node],
+                                          node_outstanding_claims[node],
+                                          memflags, 1UL << order, node))
+                goto try_next_node;
+
+            /* Find a zone on this node with a suitable buddy */
+            for (int zone = highest_zone; zone >= lowest_zone; zone--)
+                for (int j = order; j <= MAX_ORDER; j++)
+                    if ((pg = remove_head(&heap(node, zone, j))) != NULL)
+                        return pg;
+         try_next_node:
+            if (request_node != NUMA_NO_NODE && (memflags & MEMF_exact_node))
+                return NULL;
+            /* Fall back to the next node and repeat. */
+        }
+        return NULL;
+    }
+
+*******************************************
+Helper functions for allocation with claims
+*******************************************
+
+For allocating memory while respecting claims, :c:expr:`alloc_heap_pages()`
+and :c:expr:`get_free_buddy()` use :c:expr:`claims_permit_request()` to
+check whether the claims permit the request before attempting allocation.
+
+If permitted, the allocation proceeds, and after success,
+:c:expr:`claims_retire_allocation()` retires the claims for the allocation
+based on the domain's claiming state and the node of the allocation.
+
+See :ref:`designs/claims/design:Key design decisions` for the
+rationale behind this design and the accounting checks that enforce
+the :c:expr:`domain.max_pages` limit during allocation with claims.
+
+claims_permit_request()
+-----------------------
+
+.. c:function:: bool claims_permit_request(const struct domain *d, \
+                                           unsigned long avail_pages, \
+                                           unsigned long claims, \
+                                           unsigned int memflags, \
+                                           unsigned long request, \
+                                           nodeid_t node)
+
+    :param d: domain for which to check
+    :param avail_pages: pages available globally or on node
+    :param claims: outstanding claims globally or on node
+    :param memflags: memory allocation flags for the request
+    :param request: pages requested for allocation
+    :param node: node of the request or NUMA_NO_NODE for global
+    :type d: const struct domain *
+    :type avail_pages: unsigned long
+    :type claims: unsigned long
+    :type memflags: unsigned int
+    :type request: unsigned long
+    :type node: nodeid_t
+    :returns: true if claims and available memory permit the request, \
+              false otherwise.
+
+    This function checks whether a memory allocation request can be
+    satisfied given the current state of available memory and outstanding
+    claims for the domain. It calculates the amount of unclaimed memory
+    and determines whether it is sufficient to satisfy the request.
+
+    If unclaimed memory is insufficient, it checks if the domain's claims
+    can cover the shortfall, taking into account whether the request is
+    node-specific or global.
+
+claims_retire_allocation()
+--------------------------
+
+.. c:function:: void claims_retire_allocation(struct domain *d, \
+                                              unsigned long allocation, \
+                                              nodeid_t alloc_node)
+
+    :param d: The domain for which to retire claims
+    :param allocation: The number of pages allocated
+    :param alloc_node: The node on which the allocation was made
+    :type d: struct domain *
+    :type allocation: unsigned long
+    :type alloc_node: nodeid_t
+
+    See :doc:`retirement` for details on retiring claims after allocation.
+
+**************************************
+Offlining memory in presence of claims
+**************************************
+
+When offlining pages, Xen must ensure that available memory on a node or
+globally does not fall below outstanding claims. If it does, Xen recalls
+claims from domains until accounting is valid again.
+
+This is triggered by privileged domains via the
+``XEN_SYSCTL_page_offline_op`` sysctl or by machine-check memory errors.
+
+Offlining currently allocated pages does not immediately reduce available
+memory: pages are marked offlining and become offline only when freed.
+Pages marked offlining will not become available again, so this does not
+affect claim invariants.
+
+However, when already free pages are offlined, free memory can drop
+below outstanding claims; in that case the offlining process calls
+:c:expr:`reserve_offlined_page()` to offline the page.
+
+It checks whether offlining the page would cause available memory on the
+page's node, or globally, to fall below the respective outstanding claims:
+
+- When
+  :c:expr:`node_outstanding_claims[offline_node]` exceeds
+  :c:expr:`node_avail_pages[offline_node]` for the node of the offlined page,
+  :c:expr:`reserve_offlined_page()` calls :c:expr:`claims_retire_node()`
+  to recall claims on that node from domains with claims on the node of the
+  offlined buddy until the claim accounting of the node is valid again.
+
+- When total :c:expr:`outstanding_claims` exceeds :c:expr:`total_avail_pages`,
+  :c:expr:`reserve_offlined_page()` calls :c:expr:`claims_retire_global()` to
+  recall global claims from domains with global claims until global accounting
+  is valid again.
+
+This can violate claim guarantees, but it is necessary to maintain system
+stability when memory must be offlined.
+
+reserve_offlined_page()
+-----------------------
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
+    claims, it checks the node and global claim accounting and recalls
+    claims from domains as necessary to ensure accounting invariants hold
+    after a buddy is offlined.
diff --git a/docs/designs/claims/index.rst b/docs/designs/claims/index.rst
new file mode 100644
index 000000000000..1d4eff32850b
--- /dev/null
+++ b/docs/designs/claims/index.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+NUMA-aware Claim Sets
+=====================
+
+Design and implementation of NUMA-aware claim sets.
+
+Status: Draft for review
+
+This design first introduces the external behaviour of claim sets: how claims
+are installed, how they protect allocations, and how they are retired.
+It then covers the underlying accounting model and implementation details.
+
+For readers following the design in order, the next sections cover the
+following topics:
+
+1. :doc:`/designs/claims/usecases` describes the use cases for claim sets.
+2. :doc:`/designs/claims/history` provides the development's historical context
+3. :doc:`/designs/claims/design` introduces the overall model and goals.
+4. :doc:`/designs/claims/installation` explains how claim sets are installed.
+5. :doc:`/designs/claims/protection` describes how claimed memory is
+   protected during allocation.
+6. :doc:`/designs/claims/retirement` explains how claims are retired as
+   allocations succeed.
+7. :doc:`/designs/claims/accounting` describes the accounting model that
+   underpins those steps.
+
+.. toctree:: :caption: Contents
+   :maxdepth: 2
+
+   usecases
+   history
+   design
+   installation
+   protection
+   retirement
+   accounting
+   implementation
+   edge-cases
+
+.. contents::
+    :backlinks: entry
+    :local:
diff --git a/docs/designs/claims/installation.rst b/docs/designs/claims/installation.rst
new file mode 100644
index 000000000000..70f97abbae66
--- /dev/null
+++ b/docs/designs/claims/installation.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+########################
+Claim Installation Paths
+########################
+
+**********
+Claim sets
+**********
+
+A claim set is an array of :c:expr:`memory_claim_t` entries, each specifying
+a page count and a target.  Targets are either a NUMA node ID, or one of two
+special values:
+
+.. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_GLOBAL
+
+   Value for the :c:expr:`xen_memory_claim.target` field of a claim set entry
+   to specify a global claim satisfied from any node, useful when strict
+   per-node placement is not required or as a fallback for memory that
+   may be populated on any node.
+
+   These claims are retired on allocation only when the allocation node's
+   claims are exhausted, so they provide a way to claim memory when the
+   available memory on the allocation nodes is not fully sufficient to
+   satisfy the domain's needs, but the global pool has sufficient free
+   memory to cover the shortfall and the domain can tolerate some fallback
+   to non-preferred nodes without selecting a specific node for the fallback.
+
+   Supported by :c:expr:`XEN_DOMCTL_claim_memory` but not the legacy claim path.
+
+.. c:macro:: XEN_DOMCTL_CLAIM_MEMORY_LEGACY
+
+   This is a special selector for :c:expr:`xen_memory_claim.target` that can
+   only be used in a single-entry claim set to indicate that the claim set
+   should be processed by the legacy claim installation logic. It is not a
+   valid target for regular claims and is not supported for multi-entry
+   claim sets and is only used for backward compatibility and is not
+   intended for use in new code.
+
+.. note:: The legacy path is deprecated. Use :c:expr:`XEN_DOMCTL_claim_memory`
+   with :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_GLOBAL` for global claims in new
+   code instead of :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_LEGACY`.
+
+.. c:type:: memory_claim_t
+
+   Typedef for :c:expr:`xen_memory_claim`,
+   the structure for passing claim sets to the hypervisor.
+
+.. c:struct:: xen_memory_claim
+
+   Underlying structure for passing claim sets to the hypervisor.
+
+   This structure represents an individual claim entry in a claim set.
+   It specifies the number of pages claimed and the target of the claim,
+   which can be a specific NUMA node or a special value for global claims.
+
+   The structure includes padding for future expansion, and it is important
+   to zero-initialise it or use designated initializers to ensure forward
+   compatibility. Members are as follows:
+
+   .. c:member:: uint64_aligned_t pages
+
+      Number of pages for this claim entry.
+
+   .. c:member:: uint32_t target
+
+      The target of the claim, which can be a specific NUMA node
+      or a special selector to steer the claim to the global pool
+      or to invoke the legacy claim path.
+      Valid values are either a node ID in the range of valid NUMA nodes, or:
+
+      :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_GLOBAL` for a global claim, or
+      :c:expr:`XEN_DOMCTL_CLAIM_MEMORY_LEGACY` for the legacy claim path.
+
+   .. c:member:: uint32_t pad
+
+      Reserved for future use, must be 0 for forward compatibility.
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
+Claim set installation is invoked via :c:expr:`XEN_DOMCTL_claim_memory` and
+:ref:`designs/claims/implementation:domain_set_node_claims()` implements
+the claim set installation logic.
+
+Claim sets using
+:c:expr:`XEN_DOMCTL_CLAIM_MEMORY_LEGACY` are dispatched to
+:ref:`designs/claims/implementation:domain_set_outstanding_pages()`
+for the legacy claim installation logic.
+
+See :doc:`accounting` for details on the claims accounting state.
+
+*************************
+Legacy claim installation
+*************************
+
+.. note:: The legacy path is deprecated.
+   Use :c:expr:`XEN_DOMCTL_claim_memory` for new code.
+
+Legacy claims are set via the :ref:`XENMEM_claim_pages` command,
+implemented by
+:ref:`designs/claims/implementation:domain_set_outstanding_pages()`
+with the following semantics:
+
+- The request contains exactly one global claim entry of the form
+  :c:expr:`xen_memory_claim.target = XEN_DOMCTL_CLAIM_MEMORY_LEGACY`.
+- It sets :c:expr:`domain.global_claims` to the requested pages, minus
+  the domain's total pages, i.e. the pages allocated to the domain so far,
+  so that the domain's global outstanding claims reflect the shortfall of
+  allocated pages from claimed pages:
+  :c:expr:`xen_memory_claim.pages - domain_tot_pages(domain)`.
+- Passing :c:expr:`xen_memory_claim.pages == 0`
+  clears all claims installed for the domain.
+
+Aside from the edge cases for allocations exceeding claims and
+offlining pages, the legacy path is functionally unchanged.
diff --git a/docs/designs/claims/invariants.mmd b/docs/designs/claims/invariants.mmd
new file mode 100644
index 000000000000..ac9bfba34d49
--- /dev/null
+++ b/docs/designs/claims/invariants.mmd
@@ -0,0 +1,36 @@
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
+    claims["Claims of the domain:<br><tt>d->claims[n]
+                                         d->global_claims"]
+    available_memory_for_domains["Available pages:<br><tt>node_avail_pages[n]
+                                                          total_avail_pages"]
+end
\ No newline at end of file
diff --git a/docs/designs/claims/protection.rst b/docs/designs/claims/protection.rst
new file mode 100644
index 000000000000..2de6097d2c74
--- /dev/null
+++ b/docs/designs/claims/protection.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Protection of Claims
+--------------------
+
+Claimed memory must be protected from unrelated allocations while remaining
+available to the claiming domain.
+
+The allocator performs two checks.
+
+Global check
+^^^^^^^^^^^^
+
+``alloc_heap_pages()`` first verifies whether the request fits the global
+pool after accounting for claims. The request is permitted when either:
+
+- Enough unclaimed memory exists globally to satisfy the request.
+- The requesting domain's outstanding claims cover the shortfall.
+
+For this check, the domain's applicable claim is
+``d->global_claims + d->node_claims``. The domain therefore receives
+credit for its complete claim set, whether reservations are global,
+per-node, or both.
+
+Node check
+^^^^^^^^^^
+
+After passing the global check, the allocator calls ``get_free_buddy()``
+to find free pages. It loops over the NUMA nodes to find a suitable
+node with enough free memory to satisfy the request.
+
+It performs an additional node-local claims check using the domain's claim
+for that node (``d->claims[node]``) to determine whether the node is qualified
+to satisfy the request before examining that node's free lists.
+
+Unless the caller requested an exact node, the allocator loops
+over nodes until it finds one where the request can be satisfied
+by the unclaimed memory and the node-local claim for that node.
+
+If no qualifying node is found, the allocator rejects the request
+due to insufficient memory.
diff --git a/docs/designs/claims/retirement.rst b/docs/designs/claims/retirement.rst
new file mode 100644
index 000000000000..2912a082b878
--- /dev/null
+++ b/docs/designs/claims/retirement.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Claim Retirement
+----------------
+
+After a successful allocation,
+:ref:`designs/claims/implementation:claims_retire_allocation()` retires
+claims up to the size of the allocation in the same critical region
+that updates the free-page counters.
+
+The function performs the following steps to retire the matching claims
+for this allocation, ensuring the domain's total memory allocation as
+:c:expr:`domain_tot_pages(domain)` plus its outstanding claims as
+:c:expr:`domain.global_claims + domain.node_claims` remain within the
+domain's limits, defined by :c:expr:`domain.max_pages`:
+
+Step 1:
+ Retire claims from :c:expr:`domain.claims[alloc_node]` on the allocation
+ node, up to the size of that claim.
+Step 2:
+ If the allocation exceeds :c:expr:`domain.claims[alloc_node]`, retire the
+ remaining pages from the global fallback claim :c:expr:`domain.global_claims`
+ (if one exists).
+Step 3:
+ If the allocation exceeds the combination of those claims, retire the
+ remaining pages from other per-node claims so that the domain's total
+ allocation plus claims remain within the domain's :c:expr:`domain.max_pages`
+ limit.
+
+Enforcing the :c:expr:`domain.max_pages` limit
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+:c:expr:`domain_tot_pages(domain)` +
+:c:expr:`domain.global_claims + domain.node_claims`
+must not exceed the :c:expr:`domain.max_pages` limit, otherwise
+the domain would exceed its memory entitlement.
+
+At claim installation time
+ This check is done by
+ :c:expr:`domain_set_node_claims()` and
+ :c:expr:`domain_set_outstanding_pages()`.
+
+.. :sidebar::
+   See :ref:`designs/claims/accounting:Locking of claims accounting`
+   for the locks used to protect claims accounting state and invariants.
+
+A memory allocation time
+ It is also possible for claims to become excessive after allocating memory
+ if the domain has claims that are not retired by the allocation:
+
+ If allocations would not retire enough claims to keep the sum of the domain's
+ allocation and claims within the domain's :c:expr:`domain.max_pages` limit,
+ the combination of the allocation and claims could exceed the domain's limit.
+
+ In this case, the domain's claims could exceed its memory entitlement.
+ Such excess beyond :c:expr:`domain.max_pages` claims could be actually
+ physically allocated for that domain, but would still prevent other
+ domains from using the excess claimed memory.
+
+ :ref:`designs/claims/implementation:claims_retire_allocation()` cannot execute
+ this exact step race-free during step 3 because it would have to take the
+ :c:expr:`domain.page_alloc_lock` to inspect the domain's limits
+ and current allocation. Taking that lock while holding the
+ :c:expr:`heap_lock` would invert the locking order and could
+ lead to deadlocks.
+
+Therefore, :ref:`designs/claims/implementation:claims_retire_allocation()`
+retires the remaining allocation from other-node claims to ensure
+the sum of the domain's claims and populated pages remains within the
+domain's :c:expr:`domain.max_pages` limit.
diff --git a/docs/designs/claims/usecases.rst b/docs/designs/claims/usecases.rst
new file mode 100644
index 000000000000..5a618f0d0280
--- /dev/null
+++ b/docs/designs/claims/usecases.rst
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
new file mode 100644
index 000000000000..036653303231
--- /dev/null
+++ b/docs/designs/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Design documents
+================
+
+Design documents and implementation details for the Xen hypervisor itself.
+This is intended for developers working on the Xen hypervisor,
+and for those interested in the internal workings of Xen.
+
+.. toctree::
+   :maxdepth: 2
+   :numbered: 4
+
+   launch/hyperlaunch
+   launch/hyperlaunch-devicetree
+   claims/index
diff --git a/docs/designs/launch/hyperlaunch.rst b/docs/designs/launch/hyperlaunch.rst
index 3bed36f97637..aa7c2798a380 100644
--- a/docs/designs/launch/hyperlaunch.rst
+++ b/docs/designs/launch/hyperlaunch.rst
@@ -2,8 +2,6 @@
 Hyperlaunch Design Document
 ###########################
 
-.. sectnum:: :depth: 4
-
 This post is a Request for Comment on the included v4 of a design document that
 describes Hyperlaunch: a new method of launching the Xen hypervisor, relating
 to dom0less and work from the Hyperlaunch project. We invite discussion of this
@@ -13,6 +11,8 @@ Xen Development mailing list.
 
 
 .. contents:: :depth: 3
+   :backlinks: entry
+   :local:
 
 
 Introduction
diff --git a/docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd b/docs/guest-guide/dom/DOMCTL_claim_memory-data.mmd
new file mode 100644
index 000000000000..50687392fd20
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
+class global_claimss["Global and Node claim counters"] {
+    global free = total_avail_pages - outstanding_claims
+    node free = node_avail_pages[node] - node_outstanding_claims[node]
+}
+class claim["XEN_DOMCTL_claim_memory"] {
+    +domain_set_outstanding_pages()
+    +domain_set_node_claims()
+}
+class domain["Claim fields in struct domain"] {
+    +global_claims - Global claims of the domain
+    +node_claims - Sum of claims on all nodes of the domain
+    +claims[] - Array of claims on specific nodes
+}
+xen_domctl_claim_memory o--> memory_claim_t
+do_domctl o--> xen_domctl_claim_memory
+xc_domain_claim_memory ..> do_domctl: passes<br> <tt>Claim set</tt>
+xc_domain_claim_memory ..> claim : calls <tt>do_domctl()</tt>
+claim ..> xen_domctl_claim_memory : reads
+claim ..> domain : sets
+domain ..> global_claimss : updates outstanding claims
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
index 000000000000..d435799c57a6
--- /dev/null
+++ b/docs/guest-guide/dom/DOMCTL_claim_memory.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+.. c:macro:: XEN_DOMCTL_claim_memory
+
+   Hypercall command for installing claim sets for a domain.
+
+   This hypercall command allows :term:`domain builders` to install a
+   :term:`claim set` targeting :term:`NUMA nodes` and :term:`global claims`.
+
+   The hypervisor tracks the installed claims for each domain and enforces
+   them during memory allocation, so that claimed memory is protected from
+   other allocations and the domain's memory requirements can be met even
+   when other parallel domain builders are also allocating memory for other
+   domains in parallel.
+
+   :ref:`designs/claims/installation:Claim set installation` describes
+   how the Xen hypervisor processes the claim sets installed via this
+   hypercall command.
+
+API example using libxenctrl
+----------------------------
+
+The example below shows how a domain builder can install a claim set and
+later replace or clear it. :c:expr:`memory_claim_t` contains padding for future
+expansion; zero-initialise the structure or use designated initializers to
+ensure forward compatibility.
+
+.. code-block:: C
+
+  #include <xenctrl.h>
+
+  void example_claims(xc_interface *xch, uint32_t domid)
+  {
+    /* Claim 1024 pages on node 0, 1024 pages on node 1, and 1024 global */
+    memory_claim_t claims[] = {
+      {.pages = 1024, .node = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL},
+      {.pages = 1024, .node = 0},
+      {.pages = 1024, .node = 1}
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(claims), claims);
+
+    /* Replace the claim set with claims on nodes 1, 2, and 3 */
+    memory_claim_t claims2[] = {
+      {.pages = 1024, .node = 1},
+      {.pages = 1024, .node = 2},
+      {.pages = 1024, .node = 3},
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(claims2), claims2);
+
+    /* Release any remaining claim once the domain is built */
+    memory_claim_t clear[] = {
+      {.pages = 0, .node = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL}
+    };
+    xc_domain_claim_memory(xch, domid, ARRAY_SIZE(clear), clear);
+  }
+
+Call sequence diagram
+---------------------
+
+The following sequence diagram illustrates the call flow for claiming memory
+for a domain using this hypercall command from an OCaml domain builder:
+
+.. mermaid:: DOMCTL_claim_memory-seqdia.mmd
+  :caption: Sequence diagram: Call flow for claiming memory for a domain
+
+Claim workflow
+--------------
+
+This diagram illustrates a workflow for claiming and populating memory:
+
+.. mermaid:: DOMCTL_claim_memory-workflow.mmd
+  :caption: Workflow diagram: Claiming and populating memory for a domain
+
+Used functions & data structures
+--------------------------------
+
+This diagram illustrates the key functions and data structures involved in
+installing claims via the :c:expr:`XEN_DOMCTL_claim_memory` hypercall command:
+
+.. mermaid:: DOMCTL_claim_memory-data.mmd
+  :caption: Diagram: Function and data relationships for installing claims
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
index 000000000000..1e8a50afc856
--- /dev/null
+++ b/docs/guest-guide/mem/XENMEM_claim_pages.rst
@@ -0,0 +1,100 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+.. _XENMEM_claim_pages:
+
+XENMEM_claim_pages
+==================
+
+.. note:: This API is deprecated;
+   Use :c:expr:`XEN_DOMCTL_claim_memory` for new code.
+
+.. c:macro:: XENMEM_claim_pages
+
+   Hypercall command for installing legacy claims.
+
+   :ref:`designs/claims/installation:Legacy claim installation` describes
+   the API for installing legacy claims via this hypercall command.
+
+   It passes a single claim entry to the hypervisor via a
+   :c:expr:`xen_memory_reservation` structure with the page count in the
+   :c:expr:`xen_memory_reservation.nr_extents` field and the domain ID
+   :c:expr:`xen_memory_reservation.domid` field. The claim entry's target is
+   implicitly global, and the legacy claim path is invoked in the hypervisor
+   to process the claim:
+
+.. c:struct:: xen_memory_reservation
+
+   Structure for passing claim requests to the hypervisor via
+   :ref:`XENMEM_claim_pages` and other memory reservation hypercalls.
+
+   .. code-block:: C
+
+      struct xen_memory_reservation {
+          xen_pfn_t   *extent_start; /* not used for XENMEM_claim_pages */
+          xen_ulong_t  nr_extents;   /* pass page counts to claim */
+          unsigned int extent_order; /* must be 0 */
+          unsigned int mem_flags;    /* XENMEMF flags. */
+          domid_t      domid;        /* domain to apply the claim to */
+      };
+      typedef struct xen_memory_reservation xen_memory_reservation_t;
+
+   .. c:member:: xen_ulong_t nr_extents
+
+      For :ref:`XENMEM_claim_pages`, the page count to claim.
+
+   .. c:member:: domid_t domid
+
+        Domain ID for the claim.
+
+   .. c:member:: unsigned int mem_flags
+
+      Must be 0 for :ref:`XENMEM_claim_pages`; not used for claims.
+
+      In principle, it supports all the :c:expr:`XENMEMF_*` flags, including
+      the possibility of passing a single NUMA node ID, but using it to pass
+      a NUMA node ID is not currently supported by the legacy claim path.
+
+      During review of the NUMA extension of the legacy claim path, it
+      was used, but the request was made to instead create a new hypercall
+      which is now :c:expr:`XEN_DOMCTL_claim_memory` with support for claim sets.
+
+   .. c:member:: unsigned int extent_order
+   .. c:member:: xen_pfn_t *extent_start
+
+      Both are not used for :ref:`XENMEM_claim_pages`, but are used for other
+      memory reservation hypercalls.
+
+   See :ref:`designs/claims/installation:Legacy claim installation` for details.
+
+API example using libxenctrl
+----------------------------
+
+The example below claims pages, populates the domain,
+and then clears the claim.
+
+.. code-block:: C
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
index 000000000000..086281f082a0
--- /dev/null
+++ b/docs/guest-guide/mem/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Memctl Hypercall
+================
+
+The XENMEM hypercall interface allows guests to perform various control
+operations related to memory management.
+
+.. toctree::
+   :maxdepth: 2
+
+   XENMEM_claim_pages
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
index 520fe01554ab..904f8daeb79e 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -3,9 +3,16 @@
 Hypervisor documentation
 ========================
 
+.. The toctree of the hypervisor design documentation,
+   providing an overview and links to the various design
+   documents are added in the `designs` directory and
+   are referenced using the `designs/index` page here.
+   (this is a documentation comment which is not rendered)
+
 .. toctree::
    :maxdepth: 2
 
+   ../designs/index
    code-coverage
 
    x86/index
diff --git a/docs/index.rst b/docs/index.rst
index bd87d736b9c3..b6803f6a341e 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -53,17 +53,18 @@ kind of development environment.
    hypervisor-guide/index
    misc/ci
 
-
 Unsorted documents
 ------------------
 
 Documents in need of some rearranging.
 
+.. The design documentation is added in the `designs` directory
+   included in the hypervisor guide now.
+   (this is a documentation comment which is not rendered)
+
 .. toctree::
    :maxdepth: 2
 
-   designs/launch/hyperlaunch
-   designs/launch/hyperlaunch-devicetree
    misc/xen-makefiles/makefiles
    misra/index
    fusa/index
-- 
2.39.5


