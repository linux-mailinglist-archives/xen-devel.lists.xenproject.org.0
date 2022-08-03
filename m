Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8464588B9A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 13:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379814.613600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCzz-0007U5-8K; Wed, 03 Aug 2022 11:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379814.613600; Wed, 03 Aug 2022 11:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCzz-0007RZ-5P; Wed, 03 Aug 2022 11:57:15 +0000
Received: by outflank-mailman (input) for mailman id 379814;
 Wed, 03 Aug 2022 11:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oJCzx-0007RT-RY
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:57:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 67e7bfe5-1323-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 13:57:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFC411FB;
 Wed,  3 Aug 2022 04:57:10 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4744A3F67D;
 Wed,  3 Aug 2022 04:57:09 -0700 (PDT)
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
X-Inumbo-ID: 67e7bfe5-1323-11ed-924f-1f966e50362f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Date: Wed,  3 Aug 2022 12:57:02 +0100
Message-Id: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling python tools to convert misra documentation or merge
cppcheck xml files, use $(PYTHON).
While there fix misra document conversion script to be executable.

Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- use $(PYTHON) in Makefile to call convert misra doc script
- use $(PYTHON) in Makefile to call merge cppcheck script
- change title as mode change is only a small part
- add "fixes" for the merge change
 xen/Makefile                   | 4 ++--
 xen/tools/convert_misra_doc.py | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 xen/tools/convert_misra_doc.py

diff --git a/xen/Makefile b/xen/Makefile
index 3d926e1015..69b4dc960f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -703,7 +703,7 @@ cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
                    --output-file=$@ $<
 
 quiet_cmd_merge_cppcheck_reports = CPPCHECK-MERGE $@
-cmd_merge_cppcheck_reports = $(srctree)/tools/merge_cppcheck_reports.py $^ $@
+cmd_merge_cppcheck_reports = $(PYTHON) $(srctree)/tools/merge_cppcheck_reports.py $^ $@
 
 quiet_cmd_cppcheck_html = CPPCHECK-HTML $<
 cmd_cppcheck_html = $(CPPCHECK_HTMLREPORT) --file=$< --source-dir=$(srctree) \
@@ -742,7 +742,7 @@ cppcheck-version:
 # cppcheck in json format including the list of rules to ignore.
 #
 cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
-	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
+	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
 
 # convert_misra_doc is generating both files.
 cppcheck-misra.json: cppcheck-misra.txt
diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
old mode 100644
new mode 100755
-- 
2.25.1


