Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561FC782ED7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587727.919125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BI-0003DK-RU; Mon, 21 Aug 2023 16:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587727.919125; Mon, 21 Aug 2023 16:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BI-000369-Nj; Mon, 21 Aug 2023 16:55:08 +0000
Received: by outflank-mailman (input) for mailman id 587727;
 Mon, 21 Aug 2023 16:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIpk=EG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qY8BH-0002jC-6V
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:55:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a1648ec-4043-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 18:55:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 3B28C4EE073D;
 Mon, 21 Aug 2023 18:55:04 +0200 (CEST)
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
X-Inumbo-ID: 7a1648ec-4043-11ee-9b0c-b553b5be7939
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
Subject: [RFC PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
Date: Mon, 21 Aug 2023 18:54:38 +0200
Message-Id: <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692636338.git.nicola.vetrini@bugseng.com>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to check for the existence of the necessary subsections in
the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
file that is built.

This file is generated from 'C-runtime-failures.rst' in docs/misra
and the configuration is updated accordingly.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/Makefile       |  7 ++++++-
 docs/misra/Makefile | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
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
index 000000000000..f62cd936bfcc
--- /dev/null
+++ b/docs/misra/Makefile
@@ -0,0 +1,36 @@
+XEN_ROOT=$(CURDIR)/../..
+include $(XEN_ROOT)/Config.mk
+-include $(XEN_ROOT)/config/Docs.mk
+
+
+TARGETS := $(addprefix C-runtime-failures,.c .o)
+
+all: $(TARGETS)
+
+define MISRA_HEADER
+/*
+
+endef
+
+define MISRA_FOOTER
+
+*/
+
+endef
+export MISRA_HEADER
+export MISRA_FOOTER
+
+C-runtime-failures.c: C-runtime-failures.rst
+# sed is used in place of cat to prevent occurrences of '*/'
+# in the .rst from breaking the compilation
+	( \
+	  echo "$${MISRA_HEADER}"; \
+	  sed -e 's|*/|*//*|' $<; \
+	  echo "$${MISRA_FOOTER}" \
+	) > $@
+
+%.o: %.c
+	$(CC) -c $< -o $@
+
+clean:
+	rm -f *.c *.o
-- 
2.34.1


