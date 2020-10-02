Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351C28111C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1956.5816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ5F-00024i-8n; Fri, 02 Oct 2020 11:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1956.5816; Fri, 02 Oct 2020 11:18:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ5F-000248-58; Fri, 02 Oct 2020 11:18:41 +0000
Received: by outflank-mailman (input) for mailman id 1956;
 Fri, 02 Oct 2020 11:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kOJ5E-00023m-1p
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:40 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ca75921-f737-44f8-890b-af011fc82ecf;
 Fri, 02 Oct 2020 11:18:38 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIa6F016911;
 Fri, 2 Oct 2020 05:18:36 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXo008607;
 Fri, 2 Oct 2020 05:18:33 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kOJ5E-00023m-1p
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:40 +0000
X-Inumbo-ID: 0ca75921-f737-44f8-890b-af011fc82ecf
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ca75921-f737-44f8-890b-af011fc82ecf;
	Fri, 02 Oct 2020 11:18:38 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIa6F016911;
	Fri, 2 Oct 2020 05:18:36 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXo008607;
	Fri, 2 Oct 2020 05:18:33 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v9 1/4] efi/boot.c: add file.need_to_free
Date: Fri,  2 Oct 2020 07:18:19 -0400
Message-Id: <20201002111822.42142-2-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002111822.42142-1-hudson@trmm.net>
References: <20201002111822.42142-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Fri, 02 Oct 2020 05:18:34 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.2
X-Spam-Level: 

The config file, kernel, initrd, etc should only be freed if they
are allocated with the UEFI allocator.  On x86 the ucode, and on
ARM the dtb, are also marked as need_to_free when allocated or
expanded.

This also fixes a memory leak in ARM fdt_increase_size() if there
is an error in building the new device tree.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/efi/efi-boot.h | 11 +++++++++--
 xen/arch/x86/efi/efi-boot.h |  2 +-
 xen/common/efi/boot.c       | 10 ++++++----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 27dd0b1a94..c6200fda0e 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -314,7 +314,10 @@ static void __init *fdt_increase_size(struct file *fdtfile, int add_size)
     if ( fdt_size )
     {
         if ( fdt_open_into(dtbfile.ptr, new_fdt, pages * EFI_PAGE_SIZE) )
+        {
+            efi_bs->FreePages(fdt_addr, pages);
             return NULL;
+        }
     }
     else
     {
@@ -326,7 +329,10 @@ static void __init *fdt_increase_size(struct file *fdtfile, int add_size)
          * system table that is passed in the FDT.
          */
         if ( fdt_create_empty_tree(new_fdt, pages * EFI_PAGE_SIZE) )
+        {
+            efi_bs->FreePages(fdt_addr, pages);
             return NULL;
+        }
     }
 
     /*
@@ -335,12 +341,13 @@ static void __init *fdt_increase_size(struct file *fdtfile, int add_size)
      * code will free it.  If the original FDT came from a configuration
      * table, we don't own that memory and can't free it.
      */
-    if ( dtbfile.size )
+    if ( dtbfile.need_to_free )
         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
 
     /* Update 'file' info for new memory so we clean it up on error exits */
     dtbfile.addr = fdt_addr;
     dtbfile.size = pages * EFI_PAGE_SIZE;
+    dtbfile.need_to_free = true;
     return new_fdt;
 }
 
@@ -546,7 +553,7 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
-    if ( dtbfile.addr && dtbfile.size )
+    if ( dtbfile.need_to_free )
         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
     if ( memmap )
         efi_bs->FreePool(memmap);
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index eef3f52789..1025000afd 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -689,7 +689,7 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
-    if ( ucode.addr )
+    if ( ucode.need_to_free )
         efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
 }
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8123523194..9d6dc8ff4f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {
 
 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         char *str;
@@ -287,13 +288,13 @@ void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();
 
-    if ( cfg.addr )
+    if ( cfg.need_to_free )
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.need_to_free )
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.need_to_free )
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.need_to_free )
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
 
     efi_arch_blexit();
@@ -588,6 +589,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     }
     else
     {
+        file->need_to_free = true;
         file->size = size;
         if ( file != &cfg )
         {
-- 
2.25.1


