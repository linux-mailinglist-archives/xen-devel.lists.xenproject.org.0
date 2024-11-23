Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B509D6ACC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842159.1257595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutp-0001e1-FQ; Sat, 23 Nov 2024 18:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842159.1257595; Sat, 23 Nov 2024 18:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEutp-0001cW-CW; Sat, 23 Nov 2024 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 842159;
 Sat, 23 Nov 2024 18:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEumj-0006MT-A4
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:23:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb581bfc-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:23:06 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386070200329.6100039493838;
 Sat, 23 Nov 2024 10:21:10 -0800 (PST)
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
X-Inumbo-ID: fb581bfc-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiNTgxYmZjLWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTg3LjI2NzE5Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZWs7IeWmT+umhUvpU7XzMc5NSNYPa2xdZ//G3vlWJrGcHG+XLZKlJskDcaCplPQL7sAuY51YkBhay6Qm0GACCLbOJiA2wu+pr5XqDgTkK/dFge4znJDFzHc1+yx42GZOSCy/RubAX7ILpCMTWGWHPk2/EHAfit3IsZtZyNbuiSU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386074; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rShRbMHkLlgH633oW5JK+yICpJ3QPlDKQOW5Dw/tj1E=; 
	b=c+QTZlnWB/6t8ESve8HX/NXxfaFSjKuCJMf9kcI4yJECTug1cNu361+SlG01/4bxF1kumkbeGBQ2LTZk+lq2zA8/CccfGt8IU2I5R833Zo6dPEVPUerhWfYVbCOoIIfdi0veRCzCCHYTJ50cPW5iOiX8/ljDHza66+LvsnpF3j0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386074;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rShRbMHkLlgH633oW5JK+yICpJ3QPlDKQOW5Dw/tj1E=;
	b=C4oxj/A5x5OlBNpLcZe+QXpmLmgtDOfUiweDTX8bQixEYJseDHIBjKvSv9+/VE1i
	TYXjfP+3gFZaibMYg0RZ2MiBzS7Qer5govgBP2pvfRrtIZwfDV4KeJxQUZfwsEYN9nm
	KqyUvUXqM1OYu38WNr/wmzpd9JNSSy+AP1omBBf4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain config
Date: Sat, 23 Nov 2024 13:20:40 -0500
Message-Id: <20241123182044.30687-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the domain
node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/fdt.c | 31 ++++++++++++++++++++++++++++++-
 xen/arch/x86/domain_builder/fdt.h | 18 ++++++++++++++++++
 xen/arch/x86/setup.c              |  3 ++-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index bc8054a80ec1..3a6b4fbc09a9 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -9,6 +9,7 @@
 #include <xen/rangeset.h> /* required for asm/setup.h */
 
 #include <asm/bootinfo.h>
+#include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 
@@ -107,7 +108,7 @@ static int __init dom0less_module_node(
 static int __init process_domain_node(
     struct boot_info *bi, void *fdt, int dom_node)
 {
-    int node;
+    int node, property;
     struct boot_domain *bd = &bi->domains[bi->nr_domains];
     const char *name = fdt_get_name(fdt, dom_node, NULL);
     int address_size = fdt_address_cells(fdt, dom_node);
@@ -120,6 +121,28 @@ static int __init process_domain_node(
         return -EINVAL;
     }
 
+    fdt_for_each_property_offset(property, fdt, dom_node)
+    {
+        const struct fdt_property *prop;
+
+        prop = fdt_get_property_by_offset(fdt, property, NULL);
+        if ( !prop )
+            continue; /* silently skip */
+
+        if ( match_fdt_property(fdt, prop, "domid" ) )
+        {
+            uint32_t val = DOMID_INVALID;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n",
+                       name == NULL ? "unknown" : name);
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
@@ -186,6 +209,12 @@ static int __init process_domain_node(
         return -EFAULT;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else
+        if ( bd->domid != get_initial_domain_id() )
+            printk(XENLOG_WARNING "WARN: unsuported booting not using initial domid\n");
+
     return 0;
 }
 
diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
index ab2b43872e25..06ead05a2583 100644
--- a/xen/arch/x86/domain_builder/fdt.h
+++ b/xen/arch/x86/domain_builder/fdt.h
@@ -27,6 +27,24 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
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
+static inline bool __init match_fdt_property(
+    const void *fdt, const struct fdt_property *prop, const char *s)
+{
+    int slen, len = strlen(s);
+    const char *p = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &slen);
+
+    return p && (slen == len) && (memcmp(p, s, len) == 0);
+}
+
 static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
 {
     int ret;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eaac87b02f78..317349b80ac6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
-- 
2.30.2


