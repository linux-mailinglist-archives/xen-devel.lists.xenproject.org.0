Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F9372837
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 11:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122053.230197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldrdH-0003si-7k; Tue, 04 May 2021 09:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122053.230197; Tue, 04 May 2021 09:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldrdH-0003sE-4e; Tue, 04 May 2021 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 122053;
 Tue, 04 May 2021 09:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldrdG-0003rw-0f
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 09:46:22 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eb85e37c-4f06-4477-8daa-31c153a25d06;
 Tue, 04 May 2021 09:46:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0266ED1;
 Tue,  4 May 2021 02:46:19 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E30F3F73B;
 Tue,  4 May 2021 02:46:18 -0700 (PDT)
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
X-Inumbo-ID: eb85e37c-4f06-4477-8daa-31c153a25d06
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/3] docs: hypercalls sphinx skeleton for generated html
Date: Tue,  4 May 2021 10:46:05 +0100
Message-Id: <20210504094606.7125-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504094606.7125-1-luca.fancellu@arm.com>
References: <20210504094606.7125-1-luca.fancellu@arm.com>

Create a skeleton for the documentation about hypercalls

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .gitignore                             |  1 +
 docs/Makefile                          |  4 ++++
 docs/hypercall-interfaces/arm32.rst    |  4 ++++
 docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
 docs/hypercall-interfaces/index.rst.in |  7 ++++++
 docs/hypercall-interfaces/x86_64.rst   |  4 ++++
 docs/index.rst                         |  8 +++++++
 7 files changed, 60 insertions(+)
 create mode 100644 docs/hypercall-interfaces/arm32.rst
 create mode 100644 docs/hypercall-interfaces/arm64.rst
 create mode 100644 docs/hypercall-interfaces/index.rst.in
 create mode 100644 docs/hypercall-interfaces/x86_64.rst

diff --git a/.gitignore b/.gitignore
index d271e0ce6a..a9aab120ae 100644
--- a/.gitignore
+++ b/.gitignore
@@ -64,6 +64,7 @@ docs/xen.doxyfile
 docs/xen.doxyfile.tmp
 docs/xen-doxygen/doxygen_include.h
 docs/xen-doxygen/doxygen_include.h.tmp
+docs/hypercall-interfaces/index.rst
 extras/mini-os*
 install/*
 stubdom/*-minios-config.mk
diff --git a/docs/Makefile b/docs/Makefile
index 2f784c36ce..b02c3dfb79 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -61,6 +61,9 @@ build: html txt pdf man-pages figs
 sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
 ifneq ($(SPHINXBUILD),no)
 	$(DOXYGEN) xen.doxyfile
+	@echo "Generating hypercall-interfaces/index.rst"
+	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
+		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst
 	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
 else
 	@echo "Sphinx is not installed; skipping sphinx-html documentation."
@@ -108,6 +111,7 @@ clean: clean-man-pages
 	rm -f xen.doxyfile.tmp
 	rm -f xen-doxygen/doxygen_include.h
 	rm -f xen-doxygen/doxygen_include.h.tmp
+	rm -f hypercall-interfaces/index.rst
 
 .PHONY: distclean
 distclean: clean
diff --git a/docs/hypercall-interfaces/arm32.rst b/docs/hypercall-interfaces/arm32.rst
new file mode 100644
index 0000000000..4e973fbbaf
--- /dev/null
+++ b/docs/hypercall-interfaces/arm32.rst
@@ -0,0 +1,4 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall Interfaces - arm32
+============================
diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
new file mode 100644
index 0000000000..5e701a2adc
--- /dev/null
+++ b/docs/hypercall-interfaces/arm64.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall Interfaces - arm64
+============================
+
+Starting points
+---------------
+.. toctree::
+   :maxdepth: 2
+
+
+
+Functions
+---------
+
+
+Structs
+-------
+
+
+Enums and sets of #defines
+--------------------------
+
+
+Typedefs
+--------
+
+
+Enum values and individual #defines
+-----------------------------------
+
+
diff --git a/docs/hypercall-interfaces/index.rst.in b/docs/hypercall-interfaces/index.rst.in
new file mode 100644
index 0000000000..e4dcc5db8d
--- /dev/null
+++ b/docs/hypercall-interfaces/index.rst.in
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall Interfaces
+====================
+
+.. toctree::
+   @XEN_TARGET_ARCH@
diff --git a/docs/hypercall-interfaces/x86_64.rst b/docs/hypercall-interfaces/x86_64.rst
new file mode 100644
index 0000000000..3ed70dff95
--- /dev/null
+++ b/docs/hypercall-interfaces/x86_64.rst
@@ -0,0 +1,4 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall Interfaces - x86_64
+=============================
diff --git a/docs/index.rst b/docs/index.rst
index b75487a05d..52226a42d8 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -53,6 +53,14 @@ kind of development environment.
    hypervisor-guide/index
 
 
+Hypercall Interfaces documentation
+----------------------------------
+
+.. toctree::
+   :maxdepth: 2
+
+   hypercall-interfaces/index
+
 Miscellanea
 -----------
 
-- 
2.17.1


