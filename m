Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA79BA1B6
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829582.1244597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Htv-0007PW-JA; Sat, 02 Nov 2024 17:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829582.1244597; Sat, 02 Nov 2024 17:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Htv-0007Mu-FO; Sat, 02 Nov 2024 17:27:03 +0000
Received: by outflank-mailman (input) for mailman id 829582;
 Sat, 02 Nov 2024 17:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Htu-0005zO-3A
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a999790a-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:26:59 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568366662651.7865909718565;
 Sat, 2 Nov 2024 10:26:06 -0700 (PDT)
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
X-Inumbo-ID: a999790a-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE5OTk3OTBhLTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDE5Ljk1MTM0Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MDs4UQlt+6cs2MV/bWPoLf5yewGv93jWyeHDuTpMW6SgVw2/JVod3CnrXWklN+pLDNKziIrJb9KVATzKRFkUxkZuokVak1GIfmKZI8C6K8lL4qVUVKMQvzDVcxyKnTcW8d8bizs3lctc4ihG6PjNksGe4w3eCDaSWz0e9tKJjfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568379; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IkU4V9zheGmMbE9F1wh08/Ap7m7WOTpvdQ1/oa+ZpD8=; 
	b=NYUw0b5xZJxFu0ddjhlUI0/2WD7p6PD+ndizVHfUaKOUjDxTg6o37hSHMrVklqUupX1pb8ndpRoyshKCX3LozvxiX9tuIkFeW98JQlrstT6VeeOjEWD3E05Ze6bKbb1OvZ1oVbclB4EBK45mjibU9ChedPKOPJc7+66XjfI9NVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568379;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IkU4V9zheGmMbE9F1wh08/Ap7m7WOTpvdQ1/oa+ZpD8=;
	b=dY/uCFEpDm5b3izFTvNScs7KUuXIQXWi+S3qUfNUXqYyvWtVqtXq5U4KZBgoYpWm
	7yu8yXnXIPkgY+3iIqTr8+eMc42UmqB7W/nMPpmqS60p3qKtUgOwx3JxaQOFQC9yqTE
	J7hmKJGntWDgOtQuwd956fZieo6gAi52IyUFQocc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/12] x86/boot: move headroom to boot modules
Date: Sat,  2 Nov 2024 13:25:44 -0400
Message-Id: <20241102172551.17233-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The purpose of struct boot_module is to encapsulate the state of boot module as
it is processed by Xen. Locating boot module state struct boot_module reduces
the number of global variables as well as the number of state variables that
must be passed around. It also lays the groundwork for hyperlaunch mult-domain
construction, where multiple instances of state variables like headroom will be
needed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v7:
- adopted headroom comment from Andy Cooper

Changes since v6:
- add blank line to separate comment from line above it

Changes since v5:
- reword and expand comment on headroom
- consolidated declaration and assignment
---
 xen/arch/x86/include/asm/bootinfo.h | 22 ++++++++++++++++++++++
 xen/arch/x86/setup.c                | 23 ++++++++---------------
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index b1549d8c8f93..e337baa905f0 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -30,6 +30,28 @@ struct boot_module {
 
     enum bootmod_type type;
 
+    /*
+     * A boot module may need decompressing by Xen.  Headroom is an estimate of
+     * the additional space required to decompress the module.
+     *
+     * Headroom is accounted for at the start of the module.  Decompressing is
+     * done in-place with input=start, output=start-headroom, expecting the
+     * pointers to become equal (give or take some rounding) when decompression
+     * is complete.
+     *
+     * Memory layout at boot:
+     *
+     *               start ----+
+     *                         v
+     *   |<-----headroom------>|<------size------->|
+     *                         +-------------------+
+     *                         | Compressed Module |
+     *   +---------------------+-------------------+
+     *   |           Decompressed Module           |
+     *   +-----------------------------------------+
+     */
+    unsigned long headroom;
+
     /*
      * Module State Flags:
      *   relocated: indicates module has been relocated in memory.
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e6d2d25fd038..633319d39d80 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1062,7 +1062,7 @@ void asmlinkage __init noreturn __start_xen(void)
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
     struct boot_info *bi;
-    unsigned long nr_pages, raw_max_page, modules_headroom;
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1443,7 +1443,7 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->mod->mod_end   = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom =
+    bi->mods[0].headroom =
         bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
                          bi->mods[0].mod->mod_end);
     bootstrap_unmap();
@@ -1526,14 +1526,7 @@ void asmlinkage __init noreturn __start_xen(void)
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             struct boot_module *bm = &bi->mods[j];
-
-            /*
-             * 'headroom' is a guess for the decompressed size and
-             * decompressor overheads of mod[0] (the dom0 kernel).  When we
-             * move mod[0], we incorporate this as extra space at the start.
-             */
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + bm->mod->mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
             if ( bm->relocated )
                 continue;
@@ -1546,13 +1539,13 @@ void asmlinkage __init noreturn __start_xen(void)
                 continue;
 
             if ( s < end &&
-                 (headroom ||
+                 (bm->headroom ||
                   ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
             {
-                move_memory(end - size + headroom,
+                move_memory(end - size + bm->headroom,
                             pfn_to_paddr(bm->mod->mod_start), bm->mod->mod_end);
                 bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
-                bm->mod->mod_end += headroom;
+                bm->mod->mod_end += bm->headroom;
                 bm->relocated = true;
             }
         }
@@ -1579,7 +1572,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( modules_headroom && !bi->mods[0].relocated )
+    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2145,7 +2138,7 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi->mods[0].mod, modules_headroom,
+    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
                        initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
                                                   : NULL,
                        kextra, bi->loader);
-- 
2.30.2


