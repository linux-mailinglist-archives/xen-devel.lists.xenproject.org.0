Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7517577F5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565023.882832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyy-0000Nv-BJ; Tue, 18 Jul 2023 09:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565023.882832; Tue, 18 Jul 2023 09:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyy-0000Lg-5A; Tue, 18 Jul 2023 09:27:00 +0000
Received: by outflank-mailman (input) for mailman id 565023;
 Tue, 18 Jul 2023 09:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwZh=DE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qLgyx-0000LV-BX
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:26:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3da6c0a6-254d-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:26:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63D9FD75;
 Tue, 18 Jul 2023 02:27:40 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CB803F67D;
 Tue, 18 Jul 2023 02:26:56 -0700 (PDT)
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
X-Inumbo-ID: 3da6c0a6-254d-11ee-b23a-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/misra: diff-report.py: Fix UnifiedFormatParser change line registration
Date: Tue, 18 Jul 2023 10:26:35 +0100
Message-Id: <20230718092637.2433974-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718092637.2433974-1-luca.fancellu@arm.com>
References: <20230718092637.2433974-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the line number on the registration of a 'remove' change type when
consecutive 'remove' changes are registered.

Currently the algorithm registers consecutive 'remove' changes at the same
line it encounter the first one, 'add' changes type are not affected by the
bug.

Fixes: 1d7c45f895b6 ("xen/misra: diff-report.py: add report patching feature")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../xen_analysis/diff_tool/unified_format_parser.py        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
index 8b3fbc318df7..6c506caeafce 100644
--- a/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
+++ b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
@@ -144,6 +144,7 @@ class UnifiedFormatParser(object):
         file_linenum = 0
         hunk_a_linemax = 0
         hunk_b_linemax = 0
+        consecutive_remove = 0
         diff_elem = None
         parse_state = ParserState.FIND_DIFF_HEADER
         ChangeMode = ChangeSet.ChangeMode
@@ -210,14 +211,18 @@ class UnifiedFormatParser(object):
                 if (hunk_b_linemax > 0) and line.startswith("+"):
                     diff_elem.add_change(file_linenum, ChangeType.ADD)
                     hunk_b_linemax -= 1
+                    consecutive_remove = 0
                 elif (hunk_a_linemax > 0) and line.startswith("-"):
-                    diff_elem.add_change(file_linenum, ChangeType.REMOVE)
+                    diff_elem.add_change(file_linenum + consecutive_remove,
+                                         ChangeType.REMOVE)
                     hunk_a_linemax -= 1
                     file_linenum -= 1
+                    consecutive_remove += 1
                 elif ((hunk_a_linemax + hunk_b_linemax) > 0) and \
                         line.startswith(" "):
                     hunk_a_linemax -= 1 if (hunk_a_linemax > 0) else 0
                     hunk_b_linemax -= 1 if (hunk_b_linemax > 0) else 0
+                    consecutive_remove = 0
 
                 if (hunk_a_linemax + hunk_b_linemax) <= 0:
                     parse_state = ParserState.FIND_HUNK_OR_DIFF_HEADER
-- 
2.34.1


