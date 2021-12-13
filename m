Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78375472BC8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 12:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246002.424348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjpL-0000XZ-QL; Mon, 13 Dec 2021 11:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246002.424348; Mon, 13 Dec 2021 11:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjpL-0000Uv-MI; Mon, 13 Dec 2021 11:49:07 +0000
Received: by outflank-mailman (input) for mailman id 246002;
 Mon, 13 Dec 2021 11:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKfH=Q6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mwjpJ-0008O8-Ni
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 11:49:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id abf8f7b2-5c0a-11ec-b1ef-a74572bcbcad;
 Mon, 13 Dec 2021 12:49:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364A06D;
 Mon, 13 Dec 2021 03:49:04 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9DCE3F793;
 Mon, 13 Dec 2021 03:49:02 -0800 (PST)
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
X-Inumbo-ID: abf8f7b2-5c0a-11ec-b1ef-a74572bcbcad
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/efi: Handle Xen bootargs from both xen.cfg and DT
Date: Mon, 13 Dec 2021 11:48:54 +0000
Message-Id: <20211213114854.25632-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently the Xen UEFI stub can accept Xen boot arguments from
the Xen configuration file using the "options=" keyword, but also
directly from the device tree specifying xen,xen-bootargs
property.

When the configuration file is used, device tree boot arguments
are ignored and overwritten even if the keyword "options=" is
not used.

This patch handle this case, so if the Xen configuration file is not
specifying boot arguments, the device tree boot arguments will be
used, if they are present.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
 - Changed logic, now xen cfg bootarg value has precedence over DT
---
 docs/misc/efi.pandoc        |  4 ++++
 xen/arch/arm/efi/efi-boot.h | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index abafb3452758..71fdc316b67b 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -249,6 +249,10 @@ UEFI stub for module loading.
 When adding DomU modules to device tree, also add the property
 xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
 Otherwise, Xen will skip the config file and rely on device tree alone.
+When using the Xen configuration file in conjunction with the device tree, you
+can specify the Xen boot arguments in the configuration file with the "options="
+keyword or in the device tree with the "xen,xen-bootargs" property, but be
+aware that the Xen configuration file value has a precedence over the DT value.
 
 Example 1 of how to boot a true dom0less configuration:
 
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 4fb345f225c8..ae8627134e5a 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -503,11 +503,26 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
 
     if ( cfgfile_options )
     {
+        PrintMessage(L"Using bootargs from Xen configuration file.");
         prop_len += snprintf(buf + prop_len,
                                EFI_PAGE_SIZE - prop_len, " %s", cfgfile_options);
         if ( prop_len >= EFI_PAGE_SIZE )
             blexit(L"FDT string overflow");
     }
+    else
+    {
+        /* Get xen,xen-bootargs in /chosen if it is specified */
+        const char *dt_bootargs_prop = fdt_getprop(fdt, chosen,
+                                                   "xen,xen-bootargs", NULL);
+        if ( dt_bootargs_prop )
+        {
+            PrintMessage(L"Using bootargs from device tree.");
+            prop_len += snprintf(buf + prop_len, EFI_PAGE_SIZE - prop_len,
+                                 " %s", dt_bootargs_prop);
+            if ( prop_len >= EFI_PAGE_SIZE )
+                blexit(L"FDT string overflow");
+        }
+    }
 
     if ( cmdline_options )
     {
-- 
2.17.1


