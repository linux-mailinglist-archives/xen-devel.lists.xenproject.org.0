Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20933766691
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571372.895048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPIZv-0004SP-Qz; Fri, 28 Jul 2023 08:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571372.895048; Fri, 28 Jul 2023 08:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPIZv-0004PU-NU; Fri, 28 Jul 2023 08:12:03 +0000
Received: by outflank-mailman (input) for mailman id 571372;
 Fri, 28 Jul 2023 08:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B1pf=DO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qPIZu-0004AY-CM
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 08:12:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6cd904e3-2d1e-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 10:11:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14C43D75;
 Fri, 28 Jul 2023 01:12:42 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DD3F3F67D;
 Fri, 28 Jul 2023 01:11:57 -0700 (PDT)
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
X-Inumbo-ID: 6cd904e3-2d1e-11ee-b24d-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Date: Fri, 28 Jul 2023 09:11:40 +0100
Message-Id: <20230728081144.4124309-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728081144.4124309-1-luca.fancellu@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclusion list, so that they can be excluded
from the formatter tool.

TBD: add a field on each entry to understand for what tool is the
exclusion

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/exclude-list.json | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index ca1e2dd678ff..c103c69209c9 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -1,6 +1,10 @@
 {
     "version": "1.0",
     "content": [
+        {
+            "rel_path": "arch/arm/arm32/lib/assembler.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
+        },
         {
             "rel_path": "arch/arm/arm64/cpufeature.c",
             "comment": "Imported from Linux, ignore for now"
@@ -13,6 +17,26 @@
             "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/arm/include/asm/arm32/macros.h",
+            "comment": "Includes only assembly macro"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/arm64/macros.h",
+            "comment": "Includes only assembly macro"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/alternative.h",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/asm_defns.h",
+            "comment": "Includes mostly assembly macro"
+        },
+        {
+            "rel_path": "arch/arm/include/asm/macros.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
+        },
         {
             "rel_path": "arch/x86/acpi/boot.c",
             "comment": "Imported from Linux, ignore for now"
@@ -69,6 +93,30 @@
             "rel_path": "arch/x86/cpu/mwait-idle.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/x86/include/asm/alternative-asm.h",
+            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/asm_defns.h",
+            "comment": "Includes mostly assembly macro"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/asm-defns.h",
+            "comment": "Includes mostly assembly macro"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/bug.h",
+            "comment": "Includes mostly assembly macro"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/mpspec.h",
+            "comment": "Imported from Linux, also case ranges are not handled by clang-format, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/spec_ctrl_asm.h",
+            "comment": "Includes mostly assembly macro"
+        },
         {
             "rel_path": "arch/x86/delay.c",
             "comment": "Imported from Linux, ignore for now"
@@ -181,6 +229,42 @@
             "rel_path": "drivers/video/font_*",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "include/efi/*.h",
+            "comment": "Imported from gnu-efi-3.0k"
+        },
+        {
+            "rel_path": "include/public/arch-x86/cpufeatureset.h",
+            "comment": "This file contains some inputs for the gen-cpuid.py script, leave it out"
+        },
+        {
+            "rel_path": "include/public/**/**/*.h",
+            "comment": "Public headers are quite sensitive to format tools"
+        },
+        {
+            "rel_path": "include/public/**/*.h",
+            "comment": "Public headers are quite sensitive to format tools"
+        },
+        {
+            "rel_path": "include/public/*.h",
+            "comment": "Public headers are quite sensitive to format tools"
+        },
+        {
+            "rel_path": "include/xen/cper.h",
+            "comment": "Header does not follow Xen coding style"
+        },
+        {
+            "rel_path": "include/xen/nodemask.h",
+            "comment": "Imported from Linux, also case ranges are not handled by clang-format, ignore for now"
+        },
+        {
+            "rel_path": "include/xen/xen.lds.h",
+            "comment": "This file contains only macros used inside the linker script"
+        },
+        {
+            "rel_path": "include/hypercall-defs.c",
+            "comment": "This file contains only C preprocessing syntax, the other lines are not C and are used to generate the hypercall definition by another script."
+        },
         {
             "rel_path": "lib/list-sort.c",
             "comment": "Imported from Linux, ignore for now"
@@ -193,6 +277,10 @@
             "rel_path": "lib/xxhash*.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "tools/*",
+            "comment": "Contains host tools imported from Linux, ignore for now"
+        },
         {
             "rel_path": "xsm/flask/*",
             "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
-- 
2.34.1


