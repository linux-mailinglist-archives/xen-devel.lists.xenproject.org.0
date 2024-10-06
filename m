Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0A9921C5
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811326.1223909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ9L-0006YT-33; Sun, 06 Oct 2024 21:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811326.1223909; Sun, 06 Oct 2024 21:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ9K-0006UD-Vi; Sun, 06 Oct 2024 21:50:46 +0000
Received: by outflank-mailman (input) for mailman id 811326;
 Sun, 06 Oct 2024 21:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9K-0006RM-1H
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:50:46 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08be64d6-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:50:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251408844260.4452650836515;
 Sun, 6 Oct 2024 14:50:08 -0700 (PDT)
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
X-Inumbo-ID: 08be64d6-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251410; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RhoqR4I4q0pWLan9GBidh4YJmbywSpEZ/OScVBmithodruAlVI/SmieboFk950hhpG+XLWTTagdaWQAmdbE183lINDyjni7VLNZVFVrXuTlCBI+Yda64bskKs3QrLqzTbbmtZM7oX9c0kJC5l6/9vm6mdUGzqzJc7vfTfZ8PnIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251410; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=im/29rNxqImDLCcMDPqpn9SU0pgWzyuA70lRR35s2/Q=; 
	b=G8Dmt+bTfgEYHN5+vTUyB76SQUBETIEnqrR9qJnxL24Z+N8LUs0IpJ38ydaTjzy238w+dzJcN0aC+Y/ilXKYOUwpho+gRqIMTIgvOf7vmdY2XjKxXuaZuDm4al/U5ztU3T3OFxykQFHtw2ZC3uGkJth5xnTUhrZDt6E9JWs6/3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251410;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=im/29rNxqImDLCcMDPqpn9SU0pgWzyuA70lRR35s2/Q=;
	b=RF0elIhVwAv7b9mP7rI2DCkiGAyXl/yLiFfWROi/3QYR4WGYFCiqVjBNcxAJ0Dq4
	4IsGQNA2yzzDb7Ftz11tf51EhpLMyWPOoEO+Kbscu3SlN53w4NrDuHU+0+NKKSfu8Yi
	io/n48eNUjGgEc/kuBJ9tCmhGjudDRTxjNbfWnlw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 04/44] x86/boot: move mmap info to boot info
Date: Sun,  6 Oct 2024 17:49:15 -0400
Message-Id: <20241006214956.24339-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition the memory map info to be held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  5 +++++
 xen/arch/x86/setup.c                | 12 +++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 327038465a44..87d311ac1399 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,6 +8,8 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
+#include <xen/types.h>
+
 /*
  * Xen internal representation of information provided by the
  * bootloader/environment, or derived from the information.
@@ -17,6 +19,9 @@ struct boot_info {
 
     const char *loader;
     const char *cmdline;
+
+    paddr_t memmap_addr;
+    size_t memmap_length;
 };
 
 #endif /* __XEN_X86_BOOTINFO_H__ */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0921f296075f..f0482ca8cc55 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -296,6 +296,12 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     else
         bi->cmdline = "";
 
+    if ( mbi->flags & MBI_MEMMAP )
+    {
+        bi->memmap_addr = mbi->mmap_addr;
+        bi->memmap_length = mbi->mmap_length;
+    }
+
     return bi;
 }
 
@@ -1185,13 +1191,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         memmap_type = "Xen-e820";
     }
-    else if ( mbi->flags & MBI_MEMMAP )
+    else if ( bi->memmap_addr )
     {
         memmap_type = "Multiboot-e820";
-        while ( bytes < mbi->mmap_length &&
+        while ( bytes < bi->memmap_length &&
                 e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
         {
-            memory_map_t *map = __va(mbi->mmap_addr + bytes);
+            memory_map_t *map = __va(bi->memmap_addr + bytes);
 
             /*
              * This is a gross workaround for a BIOS bug. Some bootloaders do
-- 
2.30.2


