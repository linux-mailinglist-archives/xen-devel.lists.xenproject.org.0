Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5379A2A3D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820882.1234573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyN-0004ui-3H; Thu, 17 Oct 2024 17:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820882.1234573; Thu, 17 Oct 2024 17:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyM-0004rN-Uz; Thu, 17 Oct 2024 17:07:38 +0000
Received: by outflank-mailman (input) for mailman id 820882;
 Thu, 17 Oct 2024 17:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TvU-0006TN-4f
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e382022c-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184623813332.0053578314786;
 Thu, 17 Oct 2024 10:03:43 -0700 (PDT)
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
X-Inumbo-ID: e382022c-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bosGKq7O4GCzRI4fX0jqTRkaseg7RuA6hZrxT1cfZgkyUMfmeh15/QP1CBZfVrpIOztoM28vf92y/HY90CVXoKLU70epYOy5d+pSV+rEB/Qu2H+So9y5jCiL8HTXtaRiQtJlgsk/LF9JQssaRjHvtHbqVd6DNOzhglKLZyRiYCo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184626; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H7+H2K1xx8lIY92L5+m10RhDN9p6bY+Wrz/xIahDxoc=; 
	b=CZDOVR2sT/N5kYCYadGbQgv7rlUjSFtwQIEleQV5X2jczsVYEUnAY/d2qz+tij+Dx25bVcnjn5JowllPVK1XR0d5zuvg7mSbC7eLMCgNXfR+7gwUusCToPBmo08zS/yRRz/k1M3X+XKkY2Sgdrhmf6sg5qldL0KYMcL0v1m93T4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184626;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=H7+H2K1xx8lIY92L5+m10RhDN9p6bY+Wrz/xIahDxoc=;
	b=Zr+oNKk3rc/45DjoWREHaupFr7RYaQSsjF4bgSyExxxKzb8XPG6rxwNaA5yCQG2u
	bEifx013yw++oO58VT46KWzwVotzdCGLdBcJbYiJrzBHdJtAmxEwy1JHe2GNWTUQpdV
	E8R6eK1YOo6XrYcGEF9Y2c/u94YP6Zo2fduzqrSs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 07/44] x86/boot: move headroom to boot modules
Date: Thu, 17 Oct 2024 13:02:47 -0400
Message-Id: <20241017170325.3842-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
Changes since v5:
- reword and expand comment on headroom
- consolidated declaration and assignment
---
 xen/arch/x86/include/asm/bootinfo.h | 13 +++++++++++++
 xen/arch/x86/setup.c                | 21 ++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index d19473d8941e..5fe4f1387d03 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -17,6 +17,19 @@
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
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
index 10934bf31d7f..11e1027d72dd 100644
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
@@ -1456,8 +1459,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * decompressor overheads of mod[0] (the dom0 kernel).  When we
              * move mod[0], we incorporate this as extra space at the start.
              */
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *bm = &bi->mods[j];
+            unsigned long size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
                 continue;
@@ -1470,14 +1473,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1504,7 +1507,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( bi->mods[0].headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
@@ -2056,7 +2059,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


