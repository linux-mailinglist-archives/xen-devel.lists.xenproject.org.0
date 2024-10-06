Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379279921EB
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811415.1224239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFs-0006uI-F6; Sun, 06 Oct 2024 21:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811415.1224239; Sun, 06 Oct 2024 21:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFs-0006qS-82; Sun, 06 Oct 2024 21:57:32 +0000
Received: by outflank-mailman (input) for mailman id 811415;
 Sun, 06 Oct 2024 21:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZBS-00051E-TN
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 580a8eea-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:52:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172825142887696.29494057344664;
 Sun, 6 Oct 2024 14:50:28 -0700 (PDT)
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
X-Inumbo-ID: 580a8eea-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jJzy7FhjHrKYYkfDzW82tNVzizfhfrM5oeOLo+W/ef03H2uzWQZE1RMJbmomBzr7yuJ5tRm/lTK3cOS7peDUVExqmeZw/GAPey/qiSyJQkNF6+vRm/XnQ0mcf0xSpDvbhzv+UjxmSAp99qVwmxY3y16CbU6jZIBv7l1Uz3Bh5Dk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251430; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KVTUDBf5itHqMtcxsfp0xgFE01OmBqCDzmFITv9nlQc=; 
	b=BiV8zUzkA4pwde/ZeTvSzmQl7S/0z/w+sZ7jozKPUjtXQfPtdAC7H3xaMaiKMqnqFRuO8IK5+giXdmkzGi85VagWERViZd98Wshh57ttmNuz4EqRDM+ZiPGGHPeLXzIRNGGN+6T8y/v4gfhCqm84doieY3/7gkwVNyQbWkGuSL4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251430;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KVTUDBf5itHqMtcxsfp0xgFE01OmBqCDzmFITv9nlQc=;
	b=hcqnVXJQx58AauJ0JQOQSP0iuHt8lDEUGUih0+X07oDBmnqq2BmGKe+JI3LAB11N
	jcslhyy5N3fSTEIIjJl/Mzx3f4FLRWirPE2lGpL6KFjc1aY+7aVwZ8oived+ZCvFTUp
	uyZ3CcimJ5K1VafiL4Jwf5+ZjxZYcn+2zH0tU6qM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 21/44] x86/boot: convert ramdisk locating to struct boot_module
Date: Sun,  6 Oct 2024 17:49:32 -0400
Message-Id: <20241006214956.24339-22-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Locate the first unclaimed struct boot_module and mark it as ramdisk. If there
are any remaining unclaimed struct boot_module instances, report to the
console. In the change, the new boot module iterator is used to find the
initrd index, which returns a signed int. Switch initrdidx from unsigned to
signed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e560fa798d71..e42afb0c30cb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1033,7 +1033,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
-    unsigned int initrdidx, num_parked = 0;
+    unsigned int num_parked = 0;
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
@@ -1042,7 +1042,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     bool vm_init_done = false;
-    int ret;
+    int initrdidx, ret;
     struct ns16550_defaults ns16550 = {
         .data_bits = 8,
         .parity    = 'n',
@@ -2085,20 +2085,30 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, bi->nr_modules);
-    bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
-    bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
-    if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
+    /*
+     * At this point all capabilities that consume boot modules should have
+     * claimed their boot modules. Find the first unclaimed boot module and
+     * claim it as the initrd ramdisk. Do a second search to see if there are
+     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * candidates.
+     */
+    initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    if ( initrdidx >= 0 )
+    {
+        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+        if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) >= 0 )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
+    }
 
     /*
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
     dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ?
+                       (initrdidx >= 0 && initrdidx < bi->nr_modules) ?
                             bi->mods[initrdidx].mod : NULL,
                        kextra, bi->loader);
     if ( !dom0 )
-- 
2.30.2


