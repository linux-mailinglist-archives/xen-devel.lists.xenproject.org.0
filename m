Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2C9FCC11
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863304.1274759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE3-0008On-OR; Thu, 26 Dec 2024 17:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863304.1274759; Thu, 26 Dec 2024 17:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE3-0008Kj-Jr; Thu, 26 Dec 2024 17:00:43 +0000
Received: by outflank-mailman (input) for mailman id 863304;
 Thu, 26 Dec 2024 17:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrCP-00026T-KG
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:59:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b37db99d-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:59:00 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232279134554.1038478858385;
 Thu, 26 Dec 2024 08:57:59 -0800 (PST)
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
X-Inumbo-ID: b37db99d-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232282; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fhGuED3b+9JwfOn7hRYVcnYzUL01IFndlyCMN2Wxeo93W7iny9sMxjpM2R/YqL/m2OJRaFFWTYqCenY3p0FIKPQOxPg5cPFRvP5k8pCQVEHPUb+VR7bqJKaNI9S+gibLnmaTIs86xbuFMbhVb82C+T6zcGSyvYrCye+Uzghd/XU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232282; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l+K1+PF6tYPPI/bcF6jnw9iyso5PFiGOwV6wSVyGzFo=; 
	b=GyELEK1whqY5u+kDlK3kz6yhxnwgvd9zJeybyCNvf3HL8VZ8qElJHm3GWl9rHoMyl0+lsdNVOCV20xMPbPhCU2AqJcbXAk4FCDglzF3ht/jwO0Xti7VJ209MWQw0Wyqf8M8/88A7lygbPXPeqVjD7LCWJ8b9MPf9VW9dzDKhaqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232282;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=l+K1+PF6tYPPI/bcF6jnw9iyso5PFiGOwV6wSVyGzFo=;
	b=aF7r3pBsYUANy8qnqymROiM6burn8IsJCAIud6gNabC5tcOo3GvzY9QvaYPvRY/Z
	r+ZY0/5Uce4q7aXxVBkfprvICfANYeVGzUWPk7XpZyL8N6rQ25GgE2ReRnZ+rZNSIOa
	GxYfrE0PtzyDazkufBdwE/aFMpaVYbt0mGfTkEXc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/15] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Thu, 26 Dec 2024 11:57:32 -0500
Message-Id: <20241226165740.29812-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting an error if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v1:
- corrected typo in error message
- clarified commit message on "reporting"
- added missing inline decl
- code style
---
 xen/arch/x86/domain-builder/core.c  | 15 +++++++
 xen/arch/x86/domain-builder/fdt.c   | 65 ++++++++++++++++++++++++++++-
 xen/arch/x86/domain-builder/fdt.h   |  5 +++
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index d6ae94f45c72..c50eff34fb68 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -44,6 +44,21 @@ void __init builder_init(struct boot_info *bi)
             break;
         }
     }
+
+    if ( bi->hyperlaunch_enabled )
+    {
+        int ret;
+
+        printk(XENLOG_INFO "Hyperlaunch configuration:\n");
+        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
+        {
+            printk(XENLOG_INFO "  walk of device tree failed (%d)\n", ret);
+            bi->hyperlaunch_enabled = false;
+            return;
+        }
+
+        printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
+    }
 }
 
 /*
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 4a3f80648f86..5793bdc9fd47 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -13,14 +13,77 @@
 
 #include "fdt.h"
 
+static int __init find_hyperlaunch_node(const void *fdt)
+{
+    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+
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
     const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
 
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
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index 1c1569a9c633..f5b89cb54b29 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -11,11 +11,16 @@
 
 #ifdef CONFIG_DOMAIN_BUILDER
 int has_hyperlaunch_fdt(struct boot_info *bi);
+int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
 static inline int __init has_hyperlaunch_fdt(struct boot_info *bi)
 {
     return -EINVAL;
 }
+static inline int __init walk_hyperlaunch_fdt(struct boot_info *bi)
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


