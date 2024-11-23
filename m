Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18079D6AD0
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842178.1257645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuu9-0003Zl-Tx; Sat, 23 Nov 2024 18:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842178.1257645; Sat, 23 Nov 2024 18:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuu9-0003WV-QJ; Sat, 23 Nov 2024 18:30:49 +0000
Received: by outflank-mailman (input) for mailman id 842178;
 Sat, 23 Nov 2024 18:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEum5-0006MT-VJ
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:22:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4057396-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:22:27 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386063716280.39222882890044;
 Sat, 23 Nov 2024 10:21:03 -0800 (PST)
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
X-Inumbo-ID: e4057396-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU0MDU3Mzk2LWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTQ3Ljk3MzA3Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386067; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CA5ufyF49tWEw6HEUKFlIdTnFNCFdZM9fXV1eeYpdEbCK6N7KMzLSeDqTUZrS5+3pKut7pguGip938h0kqikUEAOplpK68wphBChOJurChqxS67tHTXXmHmt6lTnZlYTRz0w1jTsXZ8U8Oi26SGzvjCH/naS4BqGnCpB7VfJwio=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386067; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=50hQ5FtSJpLrNxu6yxxP08QLa9SwhIW1DEp9JlMJYIs=; 
	b=UXqmBAFUJ7uDZn4U+5B6DZLlS73amZ1gkzctwzvcc2q60vVLmd3edUpZmKd2xmf/LMjba/lv0DXt6/2oXzq92mmeOASV7+UlqkaW5/gSK1tK1uEshsRCJ/gtH39qQLmw0SxdvkfoDXFnSsTjW5qfP0/+ipBzxWIznt6bju2mvqc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386067;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=50hQ5FtSJpLrNxu6yxxP08QLa9SwhIW1DEp9JlMJYIs=;
	b=P21QJxxpnZoyOpzGdmbggaKgpYfpOewE+2FBhkAQvoVEHzTlAEdgTs0yqajshgQS
	NMlJJuBQc5dZqOKAcjjt2p53AWJM+LcqjVfyDaNfQibVCuYNpylegvDipB1he5ekNYy
	MsnipOwGC0SIgYPfX2feb2t1CL0SbTEDTDhdydNQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/15] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Sat, 23 Nov 2024 13:20:36 -0500
Message-Id: <20241123182044.30687-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/core.c  | 14 +++++++
 xen/arch/x86/domain_builder/fdt.c   | 64 ++++++++++++++++++++++++++++-
 xen/arch/x86/domain_builder/fdt.h   |  5 +++
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
index 211359895d84..a80f3711c306 100644
--- a/xen/arch/x86/domain_builder/core.c
+++ b/xen/arch/x86/domain_builder/core.c
@@ -40,7 +40,21 @@ void __init builder_init(struct boot_info *bi)
                    ret);
             bi->hyperlaunch_enabled = false;
         }
+    }
+
+    if ( bi->hyperlaunch_enabled )
+    {
+        int ret;
+
+        printk(XENLOG_INFO "Hyperlauch configuration:\n");
+        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
+        {
+            printk(XENLOG_INFO "  walk of device tree failed (%d)\n", ret);
+            bi->hyperlaunch_enabled = false;
+            return;
+        }
 
+        printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
     }
 }
 
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index 3f9dda8c34c3..ff1ba58b6907 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -14,14 +14,76 @@
 
 #include "fdt.h"
 
+static int __init find_hyperlaunch_node(void *fdt)
+{
+    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+    if ( hv_node >= 0 )
+    {
+        /* Anything other than zero indicates no match */
+        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
+            return -ENODATA;
+        else
+            return hv_node;
+    }
+    else
+    {
+        /* Lood for dom0less config */
+        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
+        if ( chosen_node < 0 )
+            return -ENOENT;
+
+        fdt_for_each_subnode(node, fdt, chosen_node)
+        {
+            if ( fdt_node_check_compatible(fdt, node, "xen,domain") == 0 )
+                return chosen_node;
+        }
+    }
+
+    return -ENODATA;
+}
+
 int __init has_hyperlaunch_fdt(struct boot_info *bi)
 {
     int ret = 0;
     void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
 
-    if ( fdt_check_header(fdt) < 0 )
+    if ( !fdt || fdt_check_header(fdt) < 0 )
         ret = -EINVAL;
+    else
+        ret = find_hyperlaunch_node(fdt);
+
+    bootstrap_unmap();
+
+    return ret < 0 ? ret : 0;
+}
+
+int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    int ret = 0, hv_node, node;
+    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( unlikely(!fdt) )
+        return -EINVAL;
+
+    hv_node = find_hyperlaunch_node(fdt);
+    if ( hv_node < 0 )
+    {
+        ret = hv_node;
+        goto err_out;
+    }
+
+    fdt_for_each_subnode(node, fdt, hv_node)
+    {
+        ret = fdt_node_check_compatible(fdt, node, "xen,domain");
+        if ( ret == 0 )
+            bi->nr_domains++;
+    }
+
+    /* Until multi-domain construction is added, throw an error */
+    if ( !bi->nr_domains || bi->nr_domains > 1 )
+        printk(XENLOG_ERR "Hyperlaunch only supports dom0 construction\n");
 
+ err_out:
     bootstrap_unmap();
 
     return ret;
diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
index 1c1569a9c633..84126db208ea 100644
--- a/xen/arch/x86/domain_builder/fdt.h
+++ b/xen/arch/x86/domain_builder/fdt.h
@@ -11,11 +11,16 @@
 
 #ifdef CONFIG_DOMAIN_BUILDER
 int has_hyperlaunch_fdt(struct boot_info *bi);
+int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
 static inline int __init has_hyperlaunch_fdt(struct boot_info *bi)
 {
     return -EINVAL;
 }
+static int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    return -EINVAL;
+}
 #endif
 
 #endif /* __XEN_X86_FDT_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 208bec90913d..683ca9dbe2e0 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -84,6 +84,7 @@ struct boot_info {
     bool hyperlaunch_enabled;
 
     unsigned int nr_modules;
+    unsigned int nr_domains;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
-- 
2.30.2


