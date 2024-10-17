Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C262D9A2AC2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821053.1234865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBJ-0007BK-34; Thu, 17 Oct 2024 17:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821053.1234865; Thu, 17 Oct 2024 17:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBI-00079f-Vs; Thu, 17 Oct 2024 17:21:00 +0000
Received: by outflank-mailman (input) for mailman id 821053;
 Thu, 17 Oct 2024 17:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Txm-00014B-Tg
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:02 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38cd6bc6-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:01 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184645708207.7226848723384;
 Thu, 17 Oct 2024 10:04:05 -0700 (PDT)
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
X-Inumbo-ID: 38cd6bc6-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SJYiZ1sUG49vabG9vcQXWN55T3uHptNU1UAWTTCUhGuzX4sb0NITpr7LUck7C36p+VnZutGul0pYr3k/mi5VufsxCfhs707nEBT40jWiundcnHOgJ2dgZHbd8o1vQ5VAE6CWUzBYCfQlxElg3z536OpmW8X9hj97UtbtQZgL3FE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184648; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AlPw4EAVQKE/AEdlatH3NgpfKfcwbCqOnaIcZsRcFfU=; 
	b=NkkOhsKT9bH/kMaNOkR4KvOxRRnXWpggDWemdGITiY/O8ZMlsVUT6hXAxhjRJNW2DFTk7zpcwIGEqO0wdD0QjNcYDzV82phiDs18mZkNrMIrbEZJzxRj48e6ZMio4mo+95N0fxCKNFQmQNAbrzVfCCnyKZY3x65vToK2GAxFqFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184648;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=AlPw4EAVQKE/AEdlatH3NgpfKfcwbCqOnaIcZsRcFfU=;
	b=ncTHZpOwvInORTU5zOa2lR3cK3RNc3VWl35npYLPcApdMoUXNO9cukYWWx/o0ETh
	niJYbKYIKLrtbv/yQDByfZDl9hjQMNvKBjsxQud9flWzSIK7bwiOcseBGMZfefcFKYs
	c8oP/zx5pmKlNkMQLFICiZxommBIEArKPW2js30g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 24/44] x86/boot: remove module_map usage by ramdisk loading
Date: Thu, 17 Oct 2024 13:03:04 -0400
Message-Id: <20241017170325.3842-25-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The ramdisk loading is the last user of module_map, remove
its usage and any remaining remnants of module_map.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- set excessive module check down to MAX_NR_BOOTMODS
---
 xen/arch/x86/setup.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 91110ba96f73..08319f871a5d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1036,7 +1036,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1186,15 +1186,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( bi->nr_modules > sizeof(module_map) * 8 )
+    if ( bi->nr_modules > MAX_NR_BOOTMODS )
     {
-        bi->nr_modules = sizeof(module_map) * 8;
-        printk("Excessive boot modules - using the first %u only\n",
+        bi->nr_modules = MAX_NR_BOOTMODS;
+        printk("Excessive multiboot modules - using the first %u only\n",
                bi->nr_modules);
     }
 
-    bitmap_fill(module_map, bi->nr_modules);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
     bi->mods[0].flags = BOOTMOD_FLAG_X86_CONSUMED;
 
-- 
2.30.2


