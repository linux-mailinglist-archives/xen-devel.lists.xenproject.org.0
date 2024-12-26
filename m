Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60E9FCC0C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863269.1274710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDY-0005zT-6n; Thu, 26 Dec 2024 17:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863269.1274710; Thu, 26 Dec 2024 17:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDY-0005xh-2r; Thu, 26 Dec 2024 17:00:12 +0000
Received: by outflank-mailman (input) for mailman id 863269;
 Thu, 26 Dec 2024 17:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrDW-0004jO-KQ
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:00:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbdf9205-c3aa-11ef-99a3-01e77a169b0f;
 Thu, 26 Dec 2024 18:00:08 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232285226312.33226760964567;
 Thu, 26 Dec 2024 08:58:05 -0800 (PST)
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
X-Inumbo-ID: dbdf9205-c3aa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1735232289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=alYzYrV8sfRXiHHUPlqhlhrlh6i/cb6wtqTfUkTWwlrqacFGbx2fSB9+rC3IF5RJ9z3szvw9Sob4cKBzpn7FgQ0xHT77KpxNcdSqsc3zLjbX9NEjZ6a+KPkVnfVMj87IYjzE3p9RFoYTJQ1Grr8fdGBL9eud6TNbr4HEYN0MRhM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232289; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+3VU4l/0ipLKSYE0pW048JWQkTZXYcfFfQtanDIG30U=; 
	b=nzRcXdI0vSxNjSz+XvFb4lTgtxnF56fEYDLlLt2L6GfLarDvp1U09DFjjJydtaRiZhGJXrD2X0Rzo8AgS9T+bzckdArJvZGokoYi4W0HykuvybNw1kWT2xgkUvtoZ99G/FG5z+tkhyAJCXzxVc56uaTGI/gHb+FsEZYdRCF7N4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232289;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+3VU4l/0ipLKSYE0pW048JWQkTZXYcfFfQtanDIG30U=;
	b=QD1XEnj7i2BhFh19jpZHoN32WCt8CZZs4DmM0CwPG6uQUaOrBCBENwbskRjNUXXO
	r5rqxyMagDb/7vZthgGgmOpT2Pc1E/6m8GMMIJWfMpiNGW5GoGZKG663rLTTi3Pn8FJ
	lzm49s/eAo38pFIEDJMEytHwvAmPB9+TBKhlWan8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 11/15] x86/hyperlaunch: add domain id parsing to domain config
Date: Thu, 26 Dec 2024 11:57:36 -0500
Message-Id: <20241226165740.29812-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the domain
node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v1
- coding style changes
- moved comment with code movement
- updated warning message
- unrolled match_fdt_property()
---
 xen/arch/x86/domain-builder/fdt.c   | 63 ++++++++++++++++++++++++++++-
 xen/arch/x86/setup.c                |  5 ++-
 xen/include/xen/libfdt/libfdt-xen.h |  9 +++++
 3 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 27bc37ad45c9..efce0927c645 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -8,6 +8,7 @@
 #include <xen/libfdt/libfdt.h>
 
 #include <asm/bootinfo.h>
+#include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 
@@ -61,10 +62,40 @@ static int __init dom0less_module_index(
 static int __init process_domain_node(
     struct boot_info *bi, void *fdt, int dom_node)
 {
-    int node;
+    int node, property;
     struct boot_domain *bd = &bi->domains[bi->nr_domains];
     const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
 
+    fdt_for_each_property_offset(property, fdt, dom_node)
+    {
+        const struct fdt_property *prop;
+        const char *prop_name;
+        int name_len;
+
+        prop = fdt_get_property_by_offset(fdt, property, NULL);
+        if ( !prop )
+            continue; /* silently skip */
+
+        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
+
+        if ( strncmp(prop_name, "domid", name_len) == 0 )
+        {
+            uint32_t val = DOMID_INVALID;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            if ( val >= DOMID_FIRST_RESERVED )
+            {
+                printk("  invalid domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->domid = (domid_t)val;
+            printk("  domid: %d\n", bd->domid);
+        }
+    }
+
     fdt_for_each_subnode(node, fdt, dom_node)
     {
         if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
@@ -125,7 +156,29 @@ static int __init process_domain_node(
         else if (
             fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
         {
-            int idx = dom0less_module_node(fdt, node, size_size, address_size);
+            unsigned int idx;
+            int ret = 0;
+
+            if ( bd->ramdisk )
+            {
+                printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",
+                       name);
+                continue;
+            }
+
+            /* Try hyperlaunch property, fall back to dom0less property. */
+            if ( hl_module_index(fdt, node, &idx) < 0 )
+            {
+                int address_size = fdt_address_cells(fdt, dom_node);
+                int size_size = fdt_size_cells(fdt, dom_node);
+
+                if ( address_size < 0 || size_size < 0 )
+                    ret = -EINVAL;
+                else
+                    ret = dom0less_module_index(
+                            fdt, node, size_size, address_size, &idx);
+            }
+
             if ( idx < 0 )
             {
                 printk("  failed processing ramdisk module for domain %s\n",
@@ -154,6 +207,12 @@ static int __init process_domain_node(
         return -EFAULT;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else if ( bd->domid != get_initial_domain_id() )
+        printk(XENLOG_WARNING
+               "WARN: Booting without initial domid not supported.\n");
+
     return 0;
 }
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 25ff029ecdda..027b224151d1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1029,8 +1029,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index 0e54aeeb6cc2..2057030dda45 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -28,6 +28,15 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
     return 0;
 }
 
+static inline int __init fdt_prop_as_u32(
+    const struct fdt_property *prop, uint32_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
+        return -EINVAL;
+
+    return fdt_cell_as_u32((fdt32_t *)prop->data, val);
+}
+
 static inline int __init fdt_get_prop_by_offset(
     const void *fdt, int node, const char *name, unsigned long *offset)
 {
-- 
2.30.2


