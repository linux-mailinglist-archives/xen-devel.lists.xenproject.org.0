Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50209921E2
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811401.1224168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFR-0002Jv-RP; Sun, 06 Oct 2024 21:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811401.1224168; Sun, 06 Oct 2024 21:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFR-0002Br-Ju; Sun, 06 Oct 2024 21:57:05 +0000
Received: by outflank-mailman (input) for mailman id 811401;
 Sun, 06 Oct 2024 21:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9j-0006RM-FG
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:11 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 186e355f-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:51:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172825141245318.856694027254207;
 Sun, 6 Oct 2024 14:50:12 -0700 (PDT)
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
X-Inumbo-ID: 186e355f-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251414; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cm4ml96E4fcgfoUNWfSuPxDqelAqZ0lePU0r5/3SZRmqTO12TvlSGFYClPWgYy+WQ7uM7hyTJP3rYuWzue6Tu+NWlSmrsHSTAlvEBQeXLGkvn1LyyT5gP8FjiMWsMMywmf9GqD5qO4WSt96sIKoUmlmVQkfT9WGHFBlWYlwFQDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251414; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wmEpNJvCOY3XSQWugWw1bHFHppHVSJwVFmalxOGZtqI=; 
	b=lW0W2zWt6MbfSfzIZ+4Hj2h6xbhXlff8VC6AA+CfeA6Jd+axN2tDlzRMPCNKW8C0cxm54bd4EnYLXlTLhzFYbvSKj8Y7dbG9WDS+ciEqrkVPHIRlA5XaE0voU1Ma+z79opQii3qlv12/E7/K1H9dXNmjU8Cy38AhuSpOCZ2A+mg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251414;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=wmEpNJvCOY3XSQWugWw1bHFHppHVSJwVFmalxOGZtqI=;
	b=RUb41T8+0zFUMaqXfWuc0g5LkaRAHrNm3PhTsiZ36dzwgTlQiwvXpmtJ9q2hsqZ2
	Hf4CotJkX/vKJIaANtlwk78//gI9foC1SiWvBcBwvE0GPmbGuaCNFb+oe28tuhjUFpf
	DeH7576HCakcDhkvC4IGyeVo1gXVhBAr3x9rVNic=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 07/44] x86/boot: move headroom to boot modules
Date: Sun,  6 Oct 2024 17:49:18 -0400
Message-Id: <20241006214956.24339-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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
---
 xen/arch/x86/include/asm/bootinfo.h |  5 +++++
 xen/arch/x86/setup.c                | 23 ++++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index d19473d8941e..c7e6b4ebf0da 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -17,6 +17,11 @@
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
+    /*
+     * A boot module may contain a compressed kernel that Xen will need space
+     * reserved, into which it will be decompressed.
+     */
+    unsigned long headroom;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ba9f110d98c6..dd82ca3d43e2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1012,7 +1012,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1371,7 +1371,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    bi->mods[0].headroom =
+        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
+                         bi->mods[0].mod->mod_end);
+
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1456,8 +1459,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * decompressor overheads of mod[0] (the dom0 kernel).  When we
              * move mod[0], we incorporate this as extra space at the start.
              */
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *bm = &bi->mods[j];
+            unsigned long size;
+
+            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
                 continue;
@@ -1470,14 +1475,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1504,7 +1509,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( bi->mods[0].headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2056,7 +2061,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


