Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA959966BAC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786796.1196596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bj-0006u5-Eh; Fri, 30 Aug 2024 21:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786796.1196596; Fri, 30 Aug 2024 21:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bj-0006lv-96; Fri, 30 Aug 2024 21:56:39 +0000
Received: by outflank-mailman (input) for mailman id 786796;
 Fri, 30 Aug 2024 21:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Ub-00065G-HM
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b30bd153-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:16 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054472969909.2016091326745;
 Fri, 30 Aug 2024 14:47:52 -0700 (PDT)
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
X-Inumbo-ID: b30bd153-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054475; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KUfmCtxNnGmntY9ieNlaQabAEenLPhdpW++jT/YEBx4k5VZcX7A7kJ+4Up2Xell391zbwyXvHuHDIcVKKMHsocxEeo/tzJSvO7PvW6Vx6pVjCq8nFZxjppUoznhZAfzHNVIJCRmz1e6pmDGCrDBDA8JyijGA/By6udcoDG3Wgfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054475; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hMDag8iJyDBnao+fi0n8bnFwJVAPf0gtfWYWCLly+Do=; 
	b=FulD+ajNsq2Sratk39+2vvEScHrSK04+ijZU34RHXjflMYw4eMszCASSZy3Aren4gYfyXQfxck3QWmKGiGQycaLf6d7cebuWbXv14WPaSoCMwhh3l7PcU1JhPmcMPX1alQO18CeJ/2g1uPDo0/rLdhUSbBlN775TSIXRN063loQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054475;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hMDag8iJyDBnao+fi0n8bnFwJVAPf0gtfWYWCLly+Do=;
	b=UsCkLTR/qZ20iBtGI+FDIwx165HevcceSuvREt9dKW8qc097SFWGR8Brzw/EOc8p
	20fcveaBonum0QXiLuLdo2CM0bJqUcg2SoxLEc3/kjxyakCcQlT0mx7YPWMdovCKe4C
	TVO5hh40fPtHPOFqps2fgPL53scx3c/Ak37cn55M=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 12/44] x86/boot: add start and size fields to struct boot_module
Date: Fri, 30 Aug 2024 17:46:57 -0400
Message-Id: <20240830214730.1621-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the start and size fields to struct boot_module and adds
a corresponding bootstrap mapping function, bootstrap_map_bm.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/include/asm/setup.h    |  2 ++
 xen/arch/x86/setup.c                | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index baf6d74db754..37132afb4e6a 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -27,6 +27,8 @@ struct boot_module {
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 
+    paddr_t start;
+    size_t size;
 };
 
 struct boot_info {
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 15dcb62cb5ac..165ca744ba34 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -2,6 +2,7 @@
 #define __X86_SETUP_H_
 
 #include <xen/multiboot.h>
+#include <asm/bootinfo.h>
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
@@ -36,6 +37,7 @@ unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map_addr(uint64_t start, uint64_t end);
 void *bootstrap_map(const module_t *mod);
+void *bootstrap_map_bm(const struct boot_module *bm);
 
 int remove_xen_ranges(struct rangeset *r);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 47e4fcc2a8ce..021c5699f86c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -311,8 +311,13 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
     info.mods = boot_mods;
 
     for ( i=0; i < info.nr_mods; i++ )
+    {
         boot_mods[i].early_mod = &mods[i];
 
+        boot_mods[i].start = (paddr_t)mods[i].mod_start;
+        boot_mods[i].size = mods[i].mod_end - mods[i].mod_start;
+    }
+
     /* map the last mb module for xen entry */
     boot_mods[info.nr_mods].type = BOOTMOD_XEN;
     boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
@@ -477,6 +482,14 @@ void *__init bootstrap_map(const module_t *mod)
                               pfn_to_paddr(mod->mod_start) + mod->mod_end);
 }
 
+void *__init bootstrap_map_bm(const struct boot_module *bm)
+{
+    if ( !bm )
+        return bootstrap_map_addr(0, 0);
+
+    return bootstrap_map_addr(bm->start, bm->start + bm->size);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
-- 
2.30.2


