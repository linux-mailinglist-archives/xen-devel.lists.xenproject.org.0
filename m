Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770779FCC10
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863289.1274740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDz-0007Sr-2D; Thu, 26 Dec 2024 17:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863289.1274740; Thu, 26 Dec 2024 17:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDy-0007QH-Ue; Thu, 26 Dec 2024 17:00:38 +0000
Received: by outflank-mailman (input) for mailman id 863289;
 Thu, 26 Dec 2024 17:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrDw-0005x0-Q3
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 17:00:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec3fc082-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 18:00:36 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232287974875.2271421466353;
 Thu, 26 Dec 2024 08:58:07 -0800 (PST)
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
X-Inumbo-ID: ec3fc082-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232292; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lAfxM47CKcNwo4zgMtfQIL0ekyx8y0H3HohdlAJPDAILxbXBPRpE3PTCGlhQzaVaT+i7NisTLOBkKsncLw3pvwmeY0TuZZXw/CamRAK+Wz/vI6P3JWrpVOTddWWfIq+fq16+EMgYaYoxU6HiaN5rifigzy2cwgX0EbsvogqCLm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232292; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8524a/8T2VisnHlwnmnufZLPjAccP9s5FDSrPRklWJU=; 
	b=grdtl4e00u6mpMKVSsKSXPCRD5OvNa3Cmdz5d3E+ukF5kkKJlkyCxy0+/5gCaM4lNsKHw0QbZSA4Md9pKUCrqHqy/YwFZJMHCPwOvd295RDe+vkDHD7v7aolusBenIuqC3G/jsOFDSgKirLbR8YrjORb1kfn93RZ6BZ3Q+OmM38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232292;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8524a/8T2VisnHlwnmnufZLPjAccP9s5FDSrPRklWJU=;
	b=sM3x+Hf8Y8Y0OT2ykY+7cIpkwCJjMLni+j/bLu1vkYVpiBNCjpd1y/aTuJQESi0P
	mPwXw1/3oP7IAiJipG4RUCa1pBBcMlWBDCjnLUJG/WPYCogZHXLYM2YIMW2NEg676bU
	h2xM5aqWria8jaPJz9MyypPV0pFu0C+zLigp3s4g=
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
Subject: [PATCH v2 13/15] x86/hyperlaunch: add memory parsing to domain config
Date: Thu, 26 Dec 2024 11:57:38 -0500
Message-Id: <20241226165740.29812-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add three properties, memory, mem-min, and mem-max, to the domain node device
tree parsing to define the memory allocation for a domain. All three fields are
expressed in kb and written as a u64 in the device tree entries.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v1
- moved common fdt parsing to libfdt
- dropped ternary for name selection
- swtich over from match_fdt to strncmp
- change mem prints to kb
---
 xen/arch/x86/dom0_build.c             |  8 +++++++
 xen/arch/x86/domain-builder/fdt.c     | 34 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/include/xen/libfdt/libfdt-xen.h   |  9 +++++++
 4 files changed, 55 insertions(+)

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
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index db584ba78e92..aff1b8c3235d 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -6,6 +6,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/guest.h>
@@ -113,6 +114,39 @@ static int __init process_domain_node(
             else
                 printk("PV\n");
         }
+        else if ( strncmp(prop_name, "memory", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  memory: %ld kb\n", kb);
+        }
+        else if ( strncmp(prop_name, "mem-min", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->min_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  min memory: %ld kb\n", kb);
+        }
+        else if ( strncmp(prop_name, "mem-max", name_len) == 0 )
+        {
+            uint64_t kb;
+            if ( fdt_prop_as_u64(prop, &kb) != 0 )
+            {
+                printk("  failed processing memory for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->max_pages = PFN_DOWN(kb * SZ_1K);
+            printk("  max memory: %ld kb\n", kb);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 5918aaf6bb63..d7092bc32ad7 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -20,6 +20,10 @@ struct boot_domain {
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
     uint32_t mode;
 
+    unsigned long mem_pages;
+    unsigned long min_pages;
+    unsigned long max_pages;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index 2057030dda45..3b653e626842 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -37,6 +37,15 @@ static inline int __init fdt_prop_as_u32(
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
 static inline int __init fdt_get_prop_by_offset(
     const void *fdt, int node, const char *name, unsigned long *offset)
 {
-- 
2.30.2


