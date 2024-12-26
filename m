Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D69FCC0B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863268.1274699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDO-00053g-TO; Thu, 26 Dec 2024 17:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863268.1274699; Thu, 26 Dec 2024 17:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDO-00051a-Qg; Thu, 26 Dec 2024 17:00:02 +0000
Received: by outflank-mailman (input) for mailman id 863268;
 Thu, 26 Dec 2024 17:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrDN-0004jO-Ea
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:00:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d63973b0-c3aa-11ef-99a3-01e77a169b0f;
 Thu, 26 Dec 2024 17:59:59 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232283698320.3434638736318;
 Thu, 26 Dec 2024 08:58:03 -0800 (PST)
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
X-Inumbo-ID: d63973b0-c3aa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1735232287; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ijMgNeCTT+xj8yjpmZwQ/fAql3ZKsKdy3Y/i7OEnwbe1A6LLFtJ9Sm2Hoa8Tg9FGEDZqryhIznlzw2QS14sT4Vc69L+q66LCvFXyQ6Xb3zI6C5okVr6yJnwFYELxeFe22ACBu2yaKowy2wX6FSsovfu5pgQOFDXr2QHX0a21P2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232287; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FcFHTvIehUz+pCAW6d935kvWaFMj2gZMq8dfpZ6OKRU=; 
	b=V76opvHZbjx0B5F+qFLAq6tiaVAzp2Cq1LSeQFo/MkjruwH5xEDIHurLraLnl2RppGZvKGcX2vNo1Delfj4BWlfJDYUlgWNJj22sZJC9ozXAnYeXG4eXu3o9rm/imerEtlgIYdnjTMH3elyyJwrq3c/ztmVJDVR1jCJM+podp6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232287;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=FcFHTvIehUz+pCAW6d935kvWaFMj2gZMq8dfpZ6OKRU=;
	b=tk8KiUFqogVIv/IkS1BHWxC1p39GfaV9IismgTdSk2RakH4MF2uHp6g2nWdvER2v
	G3OUBVu/55ow6aoASIk+UQJVmOMITA2p8AmuLJcwgITZUfwJ9sIFf1DOyJgP14sw5VJ
	VTXCN14kpphecT2SeaULz2s5c4er/Tx6VjOHH+gc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/15] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Thu, 26 Dec 2024 11:57:35 -0500
Message-Id: <20241226165740.29812-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Look for a subnode of type `multiboot,ramdisk` within a domain node. If
found, process the reg property for the MB1 module index.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v1:
- switch to nested else/if
- dropped ternary name selection
---
 xen/arch/x86/domain-builder/fdt.c | 26 +++++++++++++++++++++++
 xen/arch/x86/setup.c              | 35 +++++++++++++++++--------------
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 1094c8dc8838..27bc37ad45c9 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -119,6 +119,32 @@ static int __init process_domain_node(
                 if ( ret > 0 )
                     bd->kernel->fdt_cmdline = true;
             }
+
+            continue;
+        }
+        else if (
+            fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        {
+            int idx = dom0less_module_node(fdt, node, size_size, address_size);
+            if ( idx < 0 )
+            {
+                printk("  failed processing ramdisk module for domain %s\n",
+                       name);
+                return -EINVAL;
+            }
+
+            if ( idx > bi->nr_modules )
+            {
+                printk("  invalid ramdisk module index for domain node (%d)\n",
+                       bi->nr_domains);
+                return -EINVAL;
+            }
+
+            printk("  ramdisk: boot module %d\n", idx);
+            bi->mods[idx].type = BOOTMOD_RAMDISK;
+            bd->ramdisk = &bi->mods[idx];
+
+            continue;
         }
     }
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3dd04b9afca7..25ff029ecdda 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1103,7 +1103,7 @@ void asmlinkage __init noreturn __start_xen(void)
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
-    unsigned int initrdidx, num_parked = 0;
+    unsigned int num_parked = 0;
     struct boot_info *bi;
     unsigned long nr_pages, raw_max_page;
     int i, j, bytes = 0;
@@ -2141,22 +2141,25 @@ void asmlinkage __init noreturn __start_xen(void)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    /*
-     * At this point all capabilities that consume boot modules should have
-     * claimed their boot modules. Find the first unclaimed boot module and
-     * claim it as the initrd ramdisk. Do a second search to see if there are
-     * any remaining unclaimed boot modules, and report them as unusued initrd
-     * candidates.
-     */
-    initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    if ( initrdidx < MAX_NR_BOOTMODS )
+    if ( !bi->hyperlaunch_enabled )
     {
-        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
-        bi->domains[0].ramdisk = &bi->mods[initrdidx];
-        if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
-            printk(XENLOG_WARNING
-                   "Multiple initrd candidates, picking module #%u\n",
-                   initrdidx);
+        /*
+         * At this point all capabilities that consume boot modules should have
+         * claimed their boot modules. Find the first unclaimed boot module and
+         * claim it as the initrd ramdisk. Do a second search to see if there are
+         * any remaining unclaimed boot modules, and report them as unusued initrd
+         * candidates.
+         */
+        unsigned int initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+        if ( initrdidx < MAX_NR_BOOTMODS )
+        {
+            bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+            bi->domains[0].ramdisk = &bi->mods[initrdidx];
+            if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
+                printk(XENLOG_WARNING
+                       "Multiple initrd candidates, picking module #%u\n",
+                       initrdidx);
+        }
     }
 
     /*
-- 
2.30.2


