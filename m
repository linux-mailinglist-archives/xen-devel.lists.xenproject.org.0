Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE39921D8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811370.1224059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEx-0005DE-5r; Sun, 06 Oct 2024 21:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811370.1224059; Sun, 06 Oct 2024 21:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEx-0005AI-1F; Sun, 06 Oct 2024 21:56:35 +0000
Received: by outflank-mailman (input) for mailman id 811370;
 Sun, 06 Oct 2024 21:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZBo-00051E-MH
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 650a9e33-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:53:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251432400543.0775612505048;
 Sun, 6 Oct 2024 14:50:32 -0700 (PDT)
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
X-Inumbo-ID: 650a9e33-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251434; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wo8l/iqs0v+YfsaZggX/JdItZU2EmCAUgfcamMKYsfid1EJDnECFn4sKQJAHUyxaeNoJZx77kzctPUMAiCEE3FPuZJdTVYq0mFoyNv0deqgNymhsgE2nZKxOE8hkqMDpgCj2do7bb8kxhFRMjFGTanGN0yBThnxHXBEsiXGyjeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251434; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DcuCOm6F9wLbL6EWI6TTjiee10KbQ7Dlc1P2+oEs++8=; 
	b=OEG2q/wo8v1TSZnurKIcogeSRcN0SIJHJx4/3DPCCD5dqepJNRwK+THd/e1lBr9Fjz95vclJfhzCdHw4Qi9lyPxJ0hGvQBSbX3tnTV70N8A0IR8fPs+4Rs4QzRf7RaCpu3r8JSWmnuhFMpDEru3w0YeMjId5cKDEdDw2C7rIrew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251434;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DcuCOm6F9wLbL6EWI6TTjiee10KbQ7Dlc1P2+oEs++8=;
	b=B0mBQ53ebkIPVGD6KF5U3rj4y012k0er12okRIsoW5dXagXZ1xAP9ZPE0hVUyqSG
	pbI6CLMhIRbcSQ8luiw7Y9dsHjrhQ4Wvhp7L7JmywDTwNcT/DU5vU4HTBzFVTwDPpu+
	iZlCeOz+MOBnbtu++fqPqfxiZwc68GtGri85uFhg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 24/44] x86/boot: remove module_map usage by ramdisk loading
Date: Sun,  6 Oct 2024 17:49:35 -0400
Message-Id: <20241006214956.24339-25-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The ramdisk loading is the last user of module_map, remove
its usage and any remaining remnants of module_map.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b0946216ea3f..0d2ee19998aa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1037,7 +1037,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1187,15 +1187,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( bi->nr_modules > sizeof(module_map) * 8 )
+    if ( bi->nr_modules > MAX_NR_BOOTMODS + 1 )
     {
-        bi->nr_modules = sizeof(module_map) * 8;
-        printk("Excessive boot modules - using the first %u only\n",
+        bi->nr_modules = MAX_NR_BOOTMODS + 1;
+        printk("Excessive multiboot modules - using the first %u only\n",
                bi->nr_modules);
     }
 
-    bitmap_fill(module_map, bi->nr_modules);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
     bi->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
-- 
2.30.2


