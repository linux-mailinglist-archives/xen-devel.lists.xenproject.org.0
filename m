Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE204E2216
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292790.497214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIL-0002pg-E5; Mon, 21 Mar 2022 08:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292790.497214; Mon, 21 Mar 2022 08:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIL-0002i7-8W; Mon, 21 Mar 2022 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 292790;
 Mon, 21 Mar 2022 08:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWDIJ-0002eF-Rq
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:21:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id edb003f3-a8ef-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 09:21:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92391424;
 Mon, 21 Mar 2022 01:21:37 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.72.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05BDC3F73B;
 Mon, 21 Mar 2022 01:21:35 -0700 (PDT)
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
X-Inumbo-ID: edb003f3-a8ef-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: Make use of helpers defined in xen_lds.h
Date: Mon, 21 Mar 2022 09:21:14 +0100
Message-Id: <20220321082114.49953-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321082114.49953-1-michal.orzel@arm.com>
References: <20220321082114.49953-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Header file xen_lds.h defines common macros to be used in arch specific
linker scripts. Include this header and make use of its helpers.

Making use of common helpers defined based on x86 linker script
improves arm linker script with:
-explicit list of debug sections that otherwise are seen as "orphans"
by the linker. This will allow to fix issues after enabling linker
option --orphan-handling one day
-re-arrangement of ordering/sorting in constructors section to match the
default linker script
-extended list of discarded section to include: .discard, desctructors
related sections, .fini_array which can reference .text.exit
-extended list of stabs section to include sections placed by ld.lld.
Even though Xen on arm compilation with LLVM support is not ready yet,
these sections do not cause problem to GNU ld

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/xen.lds.S | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 7921d8fa28..9e1832e94c 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -3,6 +3,7 @@
 /* Modified for ARM Xen by Ian Campbell */
 
 #include <xen/cache.h>
+#include <xen/xen_lds.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
@@ -68,10 +69,7 @@ SECTIONS
        __proc_info_end = .;
 
 #ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
+       VPCI_SECTION
 #endif
   } :text
 
@@ -109,10 +107,7 @@ SECTIONS
        __end_schedulers_array = .;
 
 #ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
+       HYPFS_SECTION
 #endif
 
        *(.data .data.*)
@@ -178,10 +173,7 @@ SECTIONS
        __alt_instructions_end = .;
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
+       LOCK_PROFILE_SECTION
 #endif
 
        *(.init.data)
@@ -221,22 +213,17 @@ SECTIONS
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
 
+  /*
+   * Explicitly list debug sections, to avoid these sections being viewed as
+   * "orphan" by the linker.
+   */
+  DWARF_DEBUG_SECTIONS
+
   /* Sections to be discarded */
-  /DISCARD/ : {
-       *(.exit.text)
-       *(.exit.data)
-       *(.exitcall.exit)
-       *(.eh_frame)
-  }
+  DISCARD_SECTIONS
 
   /* Stabs debugging sections.  */
-  .stab 0 : { *(.stab) }
-  .stabstr 0 : { *(.stabstr) }
-  .stab.excl 0 : { *(.stab.excl) }
-  .stab.exclstr 0 : { *(.stab.exclstr) }
-  .stab.index 0 : { *(.stab.index) }
-  .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) }
+  STABS_DEBUG_SECTIONS
 }
 
 /*
-- 
2.25.1


