Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70336A9443
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505655.778537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1se-000278-Hw; Fri, 03 Mar 2023 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505655.778537; Fri, 03 Mar 2023 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1se-0001yb-B3; Fri, 03 Mar 2023 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 505655;
 Fri, 03 Mar 2023 09:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmbX=63=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pY1sd-0001qu-9V
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:39:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3fe1e7c1-b9a7-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 10:39:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD1932F4;
 Fri,  3 Mar 2023 01:39:52 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 317413F587;
 Fri,  3 Mar 2023 01:39:08 -0800 (PST)
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
X-Inumbo-ID: 3fe1e7c1-b9a7-11ed-96af-2f268f93b82a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 2/3] xen/misra: add entries to exclude-list.json
Date: Fri,  3 Mar 2023 09:38:55 +0000
Message-Id: <20230303093856.2169227-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303093856.2169227-1-luca.fancellu@arm.com>
References: <20230303093856.2169227-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclude-list.json for those files that need to be
excluded from the analysis scan.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This list is originated from Michal's work here:
https://patchwork.kernel.org/project/xen-devel/patch/20221116092032.4423-1-michal.orzel@amd.com/#25123099
and changed to adapt to this task.
Changes from v2:
 - Add Stefano's R-by
Changes from v1:
 - updated list with new files from Stefano
 - add comment field for every entry (Jan)
---
---
 docs/misra/exclude-list.json | 199 ++++++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 1fb0ac67747b..ca1e2dd678ff 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -1,4 +1,201 @@
 {
     "version": "1.0",
-    "content": []
+    "content": [
+        {
+            "rel_path": "arch/arm/arm64/cpufeature.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/arm/arm64/insn.c",
+            "comment": "Imported on Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/acpi/boot.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpu_idle.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpuidle_menu.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/acpi/lib.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/amd.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/centaur.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/common.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/hygon.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/intel.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/intel_cacheinfo.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mtrr/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mwait-idle.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/delay.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/dmi_scan.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/mpparse.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/srat.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/time.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/bitmap.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/bunzip2.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/earlycpio.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/inflate.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/libfdt/*",
+            "comment": "External library"
+        },
+        {
+            "rel_path": "common/livepatch_elf.c",
+            "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
+        },
+        {
+            "rel_path": "common/lzo.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/lz4/decompress.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/radix-tree.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/ubsan/ubsan.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/un*.c",
+            "comment": "unlz4.c implementation by Yann Collet, the others un* are from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/xz/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "common/zstd/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "crypto/*",
+            "comment": "Origin is external and documented in crypto/README.source"
+        },
+        {
+            "rel_path": "drivers/acpi/apei/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/hwregs.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/numa.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/osl.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/tables.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/tables/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/acpi/utilities/*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "drivers/video/font_*",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "lib/list-sort.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "lib/rbtree.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "lib/xxhash*.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "xsm/flask/*",
+            "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
+        }
+    ]
 }
-- 
2.34.1


