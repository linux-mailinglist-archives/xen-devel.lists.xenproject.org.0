Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B8966B81
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786674.1196316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9U0-0007Eu-BD; Fri, 30 Aug 2024 21:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786674.1196316; Fri, 30 Aug 2024 21:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9U0-0007D9-74; Fri, 30 Aug 2024 21:48:40 +0000
Received: by outflank-mailman (input) for mailman id 786674;
 Fri, 30 Aug 2024 21:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Tz-00065G-3d
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c1d208c-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:48:37 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054467441405.8525706873397;
 Fri, 30 Aug 2024 14:47:47 -0700 (PDT)
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
X-Inumbo-ID: 9c1d208c-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hIA7N2SJZp89HintuCk+GAjbeXw1wAB4oYeGTSk2lJS5U9LoFNlQZzBCdw/eYsYnnZXkNN3pNzeNuWTkoeLuu1ppCn+UE22Ct2rq89eZI04Z6S0+WhIJQzlU5V46M4F/A+crL8HnA+pGB9tASmU6dtYuOLDzCkSO5+4ZjV22rZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054469; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fxUow580sXI5NW+SdFuYYRTiCwP+vMd1bOEnrXKFUj4=; 
	b=mCMqZzAeeWwKuBQbud9mZdBYmAMGXR3G3uMXd8c3M3LwJ6UX2YfQW9uzjiwEJ5A7Z41uhRE2QbY0mqMY9x9krSETPoBTaFghijgkEOtqPC4iNCUmf0Ph9xwUNOKeGG89OS7zAXMGs9FPO1IfHiSb4WNpW4xchDgNz32IlVLFHBk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054469;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=fxUow580sXI5NW+SdFuYYRTiCwP+vMd1bOEnrXKFUj4=;
	b=nAiTT+NBAuq1xI+ZCeVXuPl9MrtoOoqzE4vnjoPfgYSGwDZWEbPI+yFmlVkogkpK
	x6Ha9alBUZJbRDFd7WPTlP4LBNUqq3uAfXrA6g0A79+q0Z/06zExLPPhvPWV2DeRHHY
	YwnsUSmN2k8KU3kfXl8jBWYE3tMuz5PHE3pC8hsc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 07/44] x86/boot: move headroom to boot modules
Date: Fri, 30 Aug 2024 17:46:52 -0400
Message-Id: <20240830214730.1621-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The purpose of struct boot_module is to encapsulate the state of boot modules.
Doing locates boot module state with its respective boot module, reduces
globals and multiple state variables being passed around. It also lays the
ground work for hyperlaunch where more multiple instances of these state
variables like headroom will be needed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 844262495962..3e0e36df096b 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -13,6 +13,7 @@
 
 struct boot_module {
     module_t *early_mod;
+    unsigned long headroom;
 };
 
 struct boot_info {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8912956ee7f1..fd6cc7fac907 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1031,7 +1031,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1390,7 +1390,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    boot_info->mods[0].headroom = bzimage_headroom(
+                        bootstrap_map(boot_info->mods[0].early_mod),
+                        boot_info->mods[0].early_mod->mod_end);
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1475,8 +1477,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * decompressor overheads of mod[0] (the dom0 kernel).  When we
              * move mod[0], we incorporate this as extra space at the start.
              */
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *bm = &boot_info->mods[j];
+            unsigned long size;
+
+            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
                 continue;
@@ -1489,14 +1493,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1523,7 +1527,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( boot_info->mods[0].headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
@@ -2077,7 +2081,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
+    dom0 = create_dom0(mod, boot_info->mods[0].headroom,
                        initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
                        kextra, boot_info->boot_loader_name);
     if ( !dom0 )
-- 
2.30.2


