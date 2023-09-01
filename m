Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7DA78FA73
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 11:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594513.927867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07F-0003Ij-DX; Fri, 01 Sep 2023 09:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594513.927867; Fri, 01 Sep 2023 09:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07F-0003Dn-5L; Fri, 01 Sep 2023 09:06:57 +0000
Received: by outflank-mailman (input) for mailman id 594513;
 Fri, 01 Sep 2023 09:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qc07D-00035h-M1
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 09:06:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f9913a-48a6-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 11:06:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 12DB94EE073A;
 Fri,  1 Sep 2023 11:06:53 +0200 (CEST)
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
X-Inumbo-ID: e4f9913a-48a6-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
Date: Fri,  1 Sep 2023 11:06:39 +0200
Message-Id: <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693558913.git.nicola.vetrini@bugseng.com>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to check for the existence of the necessary subsections in
the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
file that is built.

This file is generated from 'C-runtime-failures.rst' in docs/misra
and the configuration is updated accordingly.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes from RFC:
- Dropped unused/useless code
- Revised the sed command
- Revised the clean target
---
 docs/Makefile       |  7 ++++++-
 docs/misra/Makefile | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 docs/misra/Makefile

diff --git a/docs/Makefile b/docs/Makefile
index 966a104490ac..ff991a0c3ca2 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
 all: build
 
 .PHONY: build
-build: html txt pdf man-pages figs
+build: html txt pdf man-pages figs misra
 
 .PHONY: sphinx-html
 sphinx-html:
@@ -66,9 +66,14 @@ endif
 .PHONY: pdf
 pdf: $(DOC_PDF)
 
+.PHONY: misra
+misra:
+	$(MAKE) -C misra
+
 .PHONY: clean
 clean: clean-man-pages
 	$(MAKE) -C figs clean
+	$(MAKE) -C misra clean
 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
 	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
 	rm -rf html txt pdf sphinx/html
diff --git a/docs/misra/Makefile b/docs/misra/Makefile
new file mode 100644
index 000000000000..8ea0505c8a20
--- /dev/null
+++ b/docs/misra/Makefile
@@ -0,0 +1,17 @@
+TARGETS := C-runtime-failures.o
+
+all: $(TARGETS)
+
+# sed is used in place of cat to prevent occurrences of '*/'
+# in the .rst from breaking the compilation
+$(TARGETS:.o=.c): %.c: %.rst
+	echo "/*\n" > $@.tmp
+	sed -e 's|\*/|*//*|g' $< >> $@.tmp
+	echo "\n*/" >> $@.tmp
+	mv $@.tmp $@
+
+%.o: %.c
+	$(CC) -c $< -o $@
+
+clean:
+	rm -f C-runtime-failures.c *.o *.tmp
-- 
2.34.1


