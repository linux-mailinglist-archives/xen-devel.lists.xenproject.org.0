Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9BF469E62
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239287.414745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG3N-0001hb-3B; Mon, 06 Dec 2021 15:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239287.414745; Mon, 06 Dec 2021 15:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG3M-0001fV-W8; Mon, 06 Dec 2021 15:37:20 +0000
Received: by outflank-mailman (input) for mailman id 239287;
 Mon, 06 Dec 2021 15:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7EA=QX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1muG3K-0001Ov-Sf
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:37:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6470d889-56aa-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 16:37:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB0281042;
 Mon,  6 Dec 2021 07:37:16 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D8463F5A1;
 Mon,  6 Dec 2021 07:37:15 -0800 (PST)
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
X-Inumbo-ID: 6470d889-56aa-11ec-a5e1-b9374ead2679
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/efi: Handle Xen bootargs from both xen.cfg and DT
Date: Mon,  6 Dec 2021 15:36:58 +0000
Message-Id: <20211206153658.49727-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently the Xen UEFI stub can accept Xen boot arguments from
the Xen configuration file using the "options=" keyword, but also
directly from the device tree specifying xen,xen-bootargs
property.

When the configuration file is used, device tree boot arguments
are ignored and overwritten even if the keyword "options=" is
not used.

This patch handle this case, if xen,xen-bootargs is found in the
device tree, it is used for xen boot arguments regardless they
are specified in the Xen configuration file or not.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/efi.pandoc        | 4 ++++
 xen/arch/arm/efi/efi-boot.h | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index abafb3452758..b7d99de87f15 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -249,6 +249,10 @@ UEFI stub for module loading.
 When adding DomU modules to device tree, also add the property
 xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
 Otherwise, Xen will skip the config file and rely on device tree alone.
+When using the Xen configuration file in conjunction with the device tree, you
+can specify the Xen boot arguments in the configuration file with the "options="
+keyword or in the device tree with the "xen,xen-bootargs" property, but be
+aware that a device tree value has a precedence over the configuration file.
 
 Example 1 of how to boot a true dom0less configuration:
 
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index c4ed41284597..fc1f2b9ad60e 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -497,6 +497,13 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     if ( chosen < 0 )
         blexit(L"Unable to find chosen node");
 
+    /* If xen,bootargs is found in /chosen, use it for Xen */
+    if ( fdt_get_property(fdt, chosen, "xen,xen-bootargs", NULL) )
+    {
+        PrintStr(L"Using Xen boot arguments from device tree.\r\n");
+        return;
+    }
+
     status = efi_bs->AllocatePool(EfiBootServicesData, EFI_PAGE_SIZE, (void **)&buf);
     if ( EFI_ERROR(status) )
         PrintErrMesg(L"Unable to allocate string buffer", status);
-- 
2.17.1


