Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203B77F3AF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585227.916281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX2-00068O-WA; Thu, 17 Aug 2023 09:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585227.916281; Thu, 17 Aug 2023 09:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX2-00066D-Sb; Thu, 17 Aug 2023 09:43:08 +0000
Received: by outflank-mailman (input) for mailman id 585227;
 Thu, 17 Aug 2023 09:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWZX1-00065w-6G
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:43:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77923730-3ce2-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 11:43:06 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id D00F44EE0739;
 Thu, 17 Aug 2023 11:43:05 +0200 (CEST)
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
X-Inumbo-ID: 77923730-3ce2-11ee-8779-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] automation/eclair: update configuration
Date: Thu, 17 Aug 2023 11:42:55 +0200
Message-Id: <577236484d748d2941f6fc07b7e4fc3fa7501e95.1692261955.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692261955.git.federico.serafini@bugseng.com>
References: <cover.1692261955.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark more files as "adopted" and configure Rule 8.3 in order to:
- exclude violations involving the type ret_t;
- exclude violations involving both an internal and an external file,
  thus avoiding touching adopted code.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 29 +++++++++++++++++++
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   |  3 ++
 2 files changed, 32 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 696618b59e..d8170106b4 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -175,6 +175,35 @@ const-qualified."
 -config=MC3R1.R8.2,reports+={deliberate,"any_area(any_loc(file(adopted_r8_2)))"}
 -doc_end
 
+-doc_begin="The type ret_t is deliberately used and defined as int or long depending on the architecture."
+-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
+-doc_end
+
+-doc_begin="The following files are imported from Linux and decompress.h defines a unique and documented interface towards all the (adopted) decompress functions."
+-file_tag+={adopted_decompress_r8_3,"^xen/common/bunzip2\\.c$"}
+-file_tag+={adopted_decompress_r8_3,"^xen/common/unlz4\\.c$"}
+-file_tag+={adopted_decompress_r8_3,"^xen/common/unlzma\\.c$"}
+-file_tag+={adopted_decompress_r8_3,"^xen/common/unlzo\\.c$"}
+-file_tag+={adopted_decompress_r8_3,"^xen/common/unxz\\.c$"}
+-file_tag+={adopted_decompress_r8_3,"^xen/common/unzstd\\.c$"}
+-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
+-doc_end
+
+-doc_begin="The following file is imported from Linux: ignore for now."
+-file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
+-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
+-doc_end
+
+-doc_begin="The following file is imported from Linux: ignore for now."
+-file_tag+={adopted_cpu_idle_r8_3,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
+-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
+-doc_end
+
+-doc_begin="The following file is imported from Linux: ignore for now."
+-file_tag+={adopted_mpparse_r8_3,"^xen/arch/x86/mpparse\\.c$"}
+-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
+-doc_end
+
 -doc_begin="The following variables are compiled in multiple translation units
 belonging to different executables and therefore are safe."
 -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
index 44db6997b5..e1ec4a607c 100644
--- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -22,6 +22,9 @@
 -file_tag+={adopted,"^xen/drivers/acpi/numa\\.c$"}
 -file_tag+={adopted,"^xen/drivers/acpi/osl\\.c$"}
 -file_tag+={adopted,"^xen/drivers/acpi/tables\\.c$"}
+-file_tag+={adopted,"^xen/include/xen/acpi\\.h$"}
+-file_tag+={adopted,"^xen/include/acpi/acpiosxf\\.h$"}
+-file_tag+={adopted,"^xen/include/acpi/acpixf\\.h$"}
 -file_tag+={adopted,"^xen/lib/list-sort\\.c$"}
 -file_tag+={adopted,"^xen/lib/rbtree\\.c$"}
 -file_tag+={adopted,"^xen/lib/xxhash.*\\.c$"}
-- 
2.34.1


