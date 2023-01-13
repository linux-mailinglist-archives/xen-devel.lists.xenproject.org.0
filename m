Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3D668B53
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476497.738719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdS-0006Pj-Ku; Fri, 13 Jan 2023 05:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476497.738719; Fri, 13 Jan 2023 05:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdS-0006N9-Hf; Fri, 13 Jan 2023 05:29:50 +0000
Received: by outflank-mailman (input) for mailman id 476497;
 Fri, 13 Jan 2023 05:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdR-0005sP-38
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4ac93ded-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:29:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E26FEC;
 Thu, 12 Jan 2023 21:30:28 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D0063F587;
 Thu, 12 Jan 2023 21:29:44 -0800 (PST)
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
X-Inumbo-ID: 4ac93ded-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 02/40] xen/arm: make ARM_EFI selectable for Arm64
Date: Fri, 13 Jan 2023 13:28:35 +0800
Message-Id: <20230113052914.3845596-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Currently, ARM_EFI will mandatorily selected by Arm64.
Even if the user knows for sure that their images will not
start in the EFI environment, they can't disable the EFI
support for Arm64. This means there will be about 3K lines
unused code in their images.

So in this patch, we make ARM_EFI selectable for Arm64, and
based on that, we can use CONFIG_ARM_EFI to gate the EFI
specific code in head.S for those images that will not be
booted in EFI environment.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New patch
---
 xen/arch/arm/Kconfig      | 10 ++++++++--
 xen/arch/arm/arm64/head.S | 15 +++++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..ace7178c9a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,7 +7,6 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
-	select ARM_EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
@@ -37,7 +36,14 @@ config ACPI
 	  an alternative to device tree on ARM64.
 
 config ARM_EFI
-	bool
+	bool "UEFI boot service support"
+	depends on ARM_64
+	default y
+	help
+	  This option provides support for boot services through
+	  UEFI firmware. A UEFI stub is provided to allow Xen to
+	  be booted as an EFI application. This is only useful for
+	  Xen that may run on systems that have UEFI firmware.
 
 config GICV3
 	bool "GICv3 driver"
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index ad014716db..93f9b0b9d5 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -22,8 +22,11 @@
 
 #include <asm/page.h>
 #include <asm/early_printk.h>
+
+#ifdef CONFIG_ARM_EFI
 #include <efi/efierr.h>
 #include <asm/arm64/efibind.h>
+#endif
 
 #define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
@@ -172,8 +175,10 @@ efi_head:
         .byte   0x52
         .byte   0x4d
         .byte   0x64
-        .long   pe_header - efi_head        /* Offset to the PE header. */
-
+#ifndef CONFIG_ARM_EFI
+        .long   0                    /* 0 means no PE header. */
+#else
+        .long   pe_header - efi_head /* Offset to the PE header. */
         /*
          * Add the PE/COFF header to the file.  The address of this header
          * is at offset 0x3c in the file, and is part of Linux "Image"
@@ -279,6 +284,8 @@ section_table:
         .short  0                /* NumberOfLineNumbers  (0 for executables) */
         .long   0xe0500020       /* Characteristics (section flags) */
         .align  5
+#endif /* CONFIG_ARM_EFI */
+
 real_start:
         /* BSS should be zeroed when booting without EFI */
         mov   x26, #0                /* x26 := skip_zero_bss */
@@ -913,6 +920,8 @@ putn:   ret
 ENTRY(lookup_processor_type)
         mov  x0, #0
         ret
+
+#ifdef CONFIG_ARM_EFI
 /*
  *  Function to transition from EFI loader in C, to Xen entry point.
  *  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
@@ -971,6 +980,8 @@ ENTRY(efi_xen_start)
         b     real_start_efi
 ENDPROC(efi_xen_start)
 
+#endif /* CONFIG_ARM_EFI */
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.25.1


