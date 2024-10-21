Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710379A5838
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822877.1236794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZS-00081d-Cu; Mon, 21 Oct 2024 00:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822877.1236794; Mon, 21 Oct 2024 00:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZS-0007xG-9X; Mon, 21 Oct 2024 00:46:54 +0000
Received: by outflank-mailman (input) for mailman id 822877;
 Mon, 21 Oct 2024 00:46:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZQ-000738-Bb
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:46:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f53e2ef6-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:46:51 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471587294458.09984789376335;
 Sun, 20 Oct 2024 17:46:27 -0700 (PDT)
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
X-Inumbo-ID: f53e2ef6-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471588; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jlh7GxHfaUm5qhXtMauf6Tf5AX8pJebhqnLsMrD9ahbn4ICgUXVkFnXvjQw+mDaA55qSBIvnZ4A7jmiYydgkStJWhgAaHOfDVmkXCXese6ptmd1p23s84B2CdNEc6Q7FLEW1JfbeWbwhmQdXg3qioPpcEJWwShdHe7Yt6tAX7Sw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471588; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4OnSYGb1tvM1Q1JcgOyBkYudm2zIjXBaFQ9ShM2msC8=; 
	b=KKVC+RnFgNC23zCDpwax22gldl40n6wIn2P1JcY6/Mb0Vc2RSswOZvJ7oyXm2xxNxYhd03XYAbLd3gDr7wfRpdVMj7d+TRSahC4xRCHu8QnxKioLxrWPqos8GI5kmg04oWXV0lf1vmcre9Tjwbs2b1pzFJ1/jvr25xgoh6Yn6os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471588;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4OnSYGb1tvM1Q1JcgOyBkYudm2zIjXBaFQ9ShM2msC8=;
	b=oK7Lm+cehUnPixaqW7H5dhzaVWm4kLqkz12buA77UcMW068nFlzjj9mjaHzMoruw
	bkcZJ5QmbOg8DnuKeuGaPYPi+v4qZFAr5CCtzT8fDr9h4WKzKjGW6sOu+Pzpq/f3Dxz
	vzQIBez/1DIPP/O5HgCFAmQRvx2pzyqX6lHSYZBU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 03/38] x86/boot: move headroom to boot modules
Date: Sun, 20 Oct 2024 20:45:38 -0400
Message-Id: <20241021004613.18793-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
Changes since v6:
- add blank line to separate comment from line above it

Changes since v5:
- reword and expand comment on headroom
- consolidated declaration and assignment
---
 xen/arch/x86/include/asm/bootinfo.h | 14 ++++++++++++++
 xen/arch/x86/setup.c                | 21 ++++++++++++---------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index ffa443406747..59e6696f9671 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -17,6 +17,20 @@
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
+
+    /*
+     * A boot module may contain a compressed kernel that will require
+     * additional space, before the module data, into which the kernel will be
+     * decompressed.
+     *
+     * Memory layout at boot:
+     *     [ compressed kernel ]
+     * After boot module relocation:
+     *     [ estimated headroom + PAGE_SIZE rounding ][ compressed kernel ]
+     * After kernel decompression:
+     *     [ decompressed kernel ][ unused rounding ]
+     */
+    unsigned long headroom;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1eafa0a61e0e..48809aa94451 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1028,7 +1028,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1394,7 +1394,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    bi->mods[0].headroom =
+        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
+                         bi->mods[0].mod->mod_end);
+
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1479,8 +1482,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * decompressor overheads of mod[0] (the dom0 kernel).  When we
              * move mod[0], we incorporate this as extra space at the start.
              */
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *bm = &bi->mods[j];
+            unsigned long size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
                 continue;
@@ -1493,14 +1496,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 continue;
 
             if ( s < end &&
-                 (headroom ||
+                 (bm->headroom ||
                   ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
             {
-                move_memory(end - size + headroom,
+                move_memory(end - size + bm->headroom,
                             (uint64_t)mod[j].mod_start << PAGE_SHIFT,
                             mod[j].mod_end);
                 mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += headroom;
+                mod[j].mod_end += bm->headroom;
                 mod[j].reserved = 1;
             }
         }
@@ -1527,7 +1530,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( bi->mods[0].headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2079,7 +2082,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
+    dom0 = create_dom0(mod, bi->mods[0].headroom,
                        initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
                        kextra, bi->loader);
     if ( !dom0 )
-- 
2.30.2


