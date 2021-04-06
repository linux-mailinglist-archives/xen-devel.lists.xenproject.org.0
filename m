Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE83355102
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 12:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105770.202312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj55-00013B-6N; Tue, 06 Apr 2021 10:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105770.202312; Tue, 06 Apr 2021 10:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj55-00012j-20; Tue, 06 Apr 2021 10:37:11 +0000
Received: by outflank-mailman (input) for mailman id 105770;
 Tue, 06 Apr 2021 10:37:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZnD=JD=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lTj53-0000yp-D5
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 10:37:09 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f83f6325-47c0-461d-9c28-eef4abc65980;
 Tue, 06 Apr 2021 10:37:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10F38101E;
 Tue,  6 Apr 2021 03:37:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3E9C3F73D;
 Tue,  6 Apr 2021 03:37:05 -0700 (PDT)
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
X-Inumbo-ID: f83f6325-47c0-461d-9c28-eef4abc65980
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
Subject: [PATCH 2/3] docs: hypercalls sphinx skeleton for generated html
Date: Tue,  6 Apr 2021 11:36:02 +0100
Message-Id: <20210406103603.8530-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406103603.8530-1-luca.fancellu@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>

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
index a5eebf1213..dd3ca96b6f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -64,6 +64,7 @@ docs/xen.doxyfile
 docs/xen.doxyfile.tmp
 docs/doxygen_input.h
 docs/doxygen_input.h.tmp
+docs/hypercall-interfaces/index.rst
 extras/mini-os*
 install/*
 stubdom/*-minios-config.mk
diff --git a/docs/Makefile b/docs/Makefile
index dd651e9a93..2f29ca7e78 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -65,6 +65,9 @@ build: html txt pdf man-pages figs
 sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
 ifneq ($(SPHINXBUILD),)
 	$(DOXYGEN) xen.doxyfile
+	@echo "Generating hypercall-interfaces/index.rst"
+	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
+		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst
 	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
 else
 	@echo "Sphinx is not installed; skipping sphinx-html documentation."
@@ -113,6 +116,7 @@ clean: clean-man-pages
 	rm -f xen.doxyfile.tmp
 	rm -f doxygen_input.h
 	rm -f doxygen_input.h.tmp
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


