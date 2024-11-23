Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124FA9D6ACD
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842161.1257601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutp-0001jl-MC; Sat, 23 Nov 2024 18:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842161.1257601; Sat, 23 Nov 2024 18:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutp-0001eD-JE; Sat, 23 Nov 2024 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 842161;
 Sat, 23 Nov 2024 18:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEun4-0006MT-E1
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:23:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080b27b4-a9c8-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:23:28 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386073413790.5767891836485;
 Sat, 23 Nov 2024 10:21:13 -0800 (PST)
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
X-Inumbo-ID: 080b27b4-a9c8-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA4MGIyN2I0LWE5YzgtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MjA4LjM5MDI3NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fr24IfvJgyLHtBIZMvNA8kHeL2+RsVYv0RhJ4yAxFJyTlxqYn2D4FRww19YzzMwu76LQkFoybkoEwI17HCd0Sa+xTIQ/d7UE41XZumujoS7XXWmnVttuLPBumDhYyajuwiQfMivW/9rJRhyBG5dV7jwKZg3kdnTTu8vkUbbj93o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386077; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cScA2Yfp0/eaEM0ZCMnKxC8CljJcPTHUxp3FhbTB/C4=; 
	b=dDB77pWuYRQ2YVkbG3j4HZSjXhguTE57cU6E8ID9VY+4YqlJSNsYLlDUGdbOyf80Es+2Pk7R6Q0TuK7luoRHkvYzkChBFTTEAms+bIQvSYafRzMAWPpSdOjeA1Drlvn/l6BJyQklEDBq/MHbylFj0McbR9nU10KceRSsDp8reB4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386077;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cScA2Yfp0/eaEM0ZCMnKxC8CljJcPTHUxp3FhbTB/C4=;
	b=U77LMkFA0Ehw9RB61uLGdSeicuHgW1VBgmtWneKnZbKmT+ikxCJcAJhJ8y+m7anF
	Q16kWVHgNeS6bhrYJybjBlGJ8oAXS7ysJx3L+iPSPxKamzdV06KMvleaWDtvHOv2OOq
	19dhIMoUpNk5YdSGHbk+wFtdwj/SBrABg6zrlbec=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain config
Date: Sat, 23 Nov 2024 13:20:42 -0500
Message-Id: <20241123182044.30687-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  8 ++++++
 xen/arch/x86/domain_builder/fdt.c     | 37 +++++++++++++++++++++++++++
 xen/arch/x86/domain_builder/fdt.h     |  9 +++++++
 xen/arch/x86/include/asm/bootdomain.h |  4 +++
 4 files changed, 58 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index c231191faec7..1c3b7ff0e658 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -609,6 +609,14 @@ int __init construct_dom0(struct boot_domain *bd)
 
     process_pending_softirqs();
 
+    /* If param dom0_size was not set and HL config provided memory size */
+    if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
+        dom0_size.nr_pages = bd->mem_pages;
+    if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
+        dom0_size.nr_pages = bd->min_pages;
+    if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
+        dom0_size.nr_pages = bd->max_pages;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index 09e72d96a752..b8ace5c18c6a 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -7,6 +7,7 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/rangeset.h> /* required for asm/setup.h */
+#include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/guest.h>
@@ -160,6 +161,42 @@ static int __init process_domain_node(
             else
                 printk("PV\n");
         }
+        if ( match_fdt_property(fdt, prop, "memory" ) )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  memory: %ld\n", bd->mem_pages << PAGE_SHIFT);
+        }
+        if ( match_fdt_property(fdt, prop, "mem-min" ) )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+            bd->min_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  min memory: %ld\n", bd->min_pages << PAGE_SHIFT);
+        }
+        if ( match_fdt_property(fdt, prop, "mem-max" ) )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n",
+                       name == NULL ? "unknown" : name);
+                return -EINVAL;
+            }
+            bd->max_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
index 06ead05a2583..73d02019b3c7 100644
--- a/xen/arch/x86/domain_builder/fdt.h
+++ b/xen/arch/x86/domain_builder/fdt.h
@@ -36,6 +36,15 @@ static inline int __init fdt_prop_as_u32(
     return fdt_cell_as_u32((fdt32_t *)prop->data, val);
 }
 
+static inline int __init fdt_prop_as_u64(
+    const struct fdt_property *prop, uint64_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u64) )
+        return -EINVAL;
+
+    return fdt_cell_as_u64((fdt32_t *)prop->data, val);
+}
+
 static inline bool __init match_fdt_property(
     const void *fdt, const struct fdt_property *prop, const char *s)
 {
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 50c33d183e07..9a5ba2931665 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -24,6 +24,10 @@ struct boot_domain {
 #define BUILD_MODE_LONG          (1 << 2) /* 64 BIT | 32 BIT  */
     uint32_t mode;
 
+    unsigned long mem_pages;
+    unsigned long min_pages;
+    unsigned long max_pages;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
-- 
2.30.2


