Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4EA9D6ACE
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842162.1257616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutr-0002AD-Vy; Sat, 23 Nov 2024 18:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842162.1257616; Sat, 23 Nov 2024 18:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutr-00027E-SO; Sat, 23 Nov 2024 18:30:31 +0000
Received: by outflank-mailman (input) for mailman id 842162;
 Sat, 23 Nov 2024 18:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEumZ-0006MT-Es
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:22:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5953219-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:22:57 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386068616924.1851128683724;
 Sat, 23 Nov 2024 10:21:08 -0800 (PST)
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
X-Inumbo-ID: f5953219-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY1OTUzMjE5LWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTc3LjIzOTQyNiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386073; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O2H3MgRv1sOoO7bTYKOWHf8SEqYjZeaNb5QEwUVLaWUHqNNdDCPCkbuqq7zVs3nu6PG9d4gvzo06ME8I+UxlgNFoYKpGzAyC5GvNutgNa0XxQvhYdrcqb9JvRZTpbuPUO/SXy26XlYLfZ83UtkbFH7YSHKZzbGxJCN/v4ZtGOTY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386073; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=scVK3BeFw1PvCPw+5+IJFV23lyxFsbSuS2LWmdnsIGU=; 
	b=WAGg98RlGwHi+eBGWTjI5a90lKB1xyPtHab/BmbdRdNDmBkc2ksi57bRXLazi/m4ff9ELwyyHl4/Ij/c+m++6+oWEndd2qHJ7NB1dORxkfkW5stb0qJm4656027ZhFe0bp5k3ZANNRXojTTbzl8LM9BxHp1xi/NaqKQ6wlb5k1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386072;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=scVK3BeFw1PvCPw+5+IJFV23lyxFsbSuS2LWmdnsIGU=;
	b=oPaf+LuNH1U8j4O9iPJgi844HDJIy9ob5SKz5Wr0pVlo5NtUYgxp5NElWPVH7fAA
	FisYz8cvC9diNy6SLXC1e904Q0zFGaGpeRViEXaTfmp8xA1xAV41cn9yY9CCghsXbQS
	ZSs1/rXeeu3zWQmXY0rxYLbDxTu9czevbKf5RQiA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/15] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Sat, 23 Nov 2024 13:20:39 -0500
Message-Id: <20241123182044.30687-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Look for a subnode of type `multiboot,ramdisk` within a domain node. If
found, process the reg property for the MB1 module index.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/fdt.c | 25 ++++++++++++++++++++++
 xen/arch/x86/setup.c              | 35 +++++++++++++++++--------------
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index f8ddb11b339e..bc8054a80ec1 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -152,6 +152,31 @@ static int __init process_domain_node(
                 if ( ret > 0 )
                     bd->kernel->fdt_cmdline = true;
             }
+
+            continue;
+        }
+        if ( fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        {
+            int idx = dom0less_module_node(fdt, node, size_size, address_size);
+            if ( idx < 0 )
+            {
+                printk("  failed processing ramdisk module for domain %s\n",
+                       name == NULL ? "unknown" : name);
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
index fda4fc71e205..eaac87b02f78 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1094,7 +1094,7 @@ void asmlinkage __init noreturn __start_xen(void)
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
-    unsigned int initrdidx, num_parked = 0;
+    unsigned int num_parked = 0;
     struct boot_info *bi;
     unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
@@ -2137,22 +2137,25 @@ void asmlinkage __init noreturn __start_xen(void)
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


