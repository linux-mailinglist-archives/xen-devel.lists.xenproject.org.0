Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D117DCDBB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625717.975307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiM-0004va-EL; Tue, 31 Oct 2023 13:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625717.975307; Tue, 31 Oct 2023 13:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiM-0004sQ-AG; Tue, 31 Oct 2023 13:23:26 +0000
Received: by outflank-mailman (input) for mailman id 625717;
 Tue, 31 Oct 2023 13:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiK-0003uy-1p
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id aa35b860-77f0-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:23:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC94C15;
 Tue, 31 Oct 2023 06:24:04 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 639AB3F738;
 Tue, 31 Oct 2023 06:23:21 -0700 (PDT)
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
X-Inumbo-ID: aa35b860-77f0-11ee-98d6-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 4/8] exclude-list: add entries to the excluded list for codestyle
Date: Tue, 31 Oct 2023 13:23:00 +0000
Message-Id: <20231031132304.2573924-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclusion list, so that they can be excluded
from the formatting tool.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/exclude-list.json | 100 +++++++++++++++++++++++++++++++++++
 docs/misra/exclude-list.rst  |   2 +
 2 files changed, 102 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 575ed22a7f67..d48dcf3ac971 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -1,6 +1,11 @@
 {
     "version": "1.0",
     "content": [
+        {
+            "rel_path": "arch/arm/arm32/lib/assembler.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "arch/arm/arm64/cpufeature.c",
             "comment": "Imported from Linux, ignore for now"
@@ -13,6 +18,31 @@
             "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/arm/include/asm/arm32/macros.h",
+            "comment": "Includes only assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/arm64/macros.h",
+            "comment": "Includes only assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/alternative.h",
+            "comment": "Imported from Linux, ignore for now",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/asm_defns.h",
+            "comment": "Includes mostly assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/macros.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "arch/x86/acpi/boot.c",
             "comment": "Imported from Linux, ignore for now"
@@ -69,6 +99,36 @@
             "rel_path": "arch/x86/cpu/mwait-idle.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/x86/include/asm/alternative-asm.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/asm_defns.h",
+            "comment": "Includes mostly assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/asm-defns.h",
+            "comment": "Includes mostly assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/bug.h",
+            "comment": "Includes mostly assembly macro",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/mpspec.h",
+            "comment": "Imported from Linux, also designated initializers ranges are not handled very well by clang-format, ignore for now",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/spec_ctrl_asm.h",
+            "comment": "Includes mostly assembly macro",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "arch/x86/delay.c",
             "comment": "Imported from Linux, ignore for now"
@@ -189,10 +249,45 @@
             "rel_path": "include/acpi/acpixf.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "include/efi/*.h",
+            "comment": "Imported from gnu-efi-3.0k, prefer their formatting",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "include/public/arch-x86/cpufeatureset.h",
+            "comment": "This file contains some inputs for the gen-cpuid.py script, leave it out",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "include/public/*",
+            "comment": "Public headers are quite sensitive to format tools",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "include/xen/acpi.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "include/xen/cper.h",
+            "comment": "Header does not follow Xen coding style",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "include/xen/nodemask.h",
+            "comment": "Imported from Linux, also designated initializers ranges are not handled by clang-format, ignore for now",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "include/xen/xen.lds.h",
+            "comment": "This file contains only macros used inside the linker script",
+            "checkers": "codestyle"
+        },
+        {
+            "rel_path": "include/hypercall-defs.c",
+            "comment": "This file contains only C preprocessing syntax, the other lines are not C and are used to generate the hypercall definition by another script.",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "lib/list-sort.c",
             "comment": "Imported from Linux, ignore for now"
@@ -205,6 +300,11 @@
             "rel_path": "lib/xxhash*.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "tools/*",
+            "comment": "Contains host tools imported from Linux, ignore for now",
+            "checkers": "codestyle"
+        },
         {
             "rel_path": "xsm/flask/*",
             "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
index 42dbceb82523..ade314100663 100644
--- a/docs/misra/exclude-list.rst
+++ b/docs/misra/exclude-list.rst
@@ -46,6 +46,8 @@ Here is an explanation of the fields inside an object of the "content" array:
    Current implemented values for this field are:
     - xen-analysis: the xen-analysis.py script exclude this entry for both MISRA
       and static analysis scan. (Implemented only for Cppcheck tool)
+    - codestyle: the codestyle.py script exclude this entry from the formatting
+      tool.
 
 To ease the review and the modifications of the entries, they shall be listed in
 alphabetical order referring to the rel_path field.
-- 
2.34.1


