Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1BAB883A
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985644.1371590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYnx-0008Cq-6A; Thu, 15 May 2025 13:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985644.1371590; Thu, 15 May 2025 13:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYnx-0008BA-1s; Thu, 15 May 2025 13:39:21 +0000
Received: by outflank-mailman (input) for mailman id 985644;
 Thu, 15 May 2025 13:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXA-0006hT-BB
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:00 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9369a08a-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:21:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315172286991.1892485678771;
 Thu, 15 May 2025 06:19:32 -0700 (PDT)
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
X-Inumbo-ID: 9369a08a-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315174; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cpHNUiAY0CXjmYiDxn5XFLJkzsx4euGYMAwAntvWgZHSMVqu1SiN/JmNbWox+1Hr+n7+BaDHTAkQ0aUrt5O5jrRnXvma+PGiZc8nQD60tfF/pjJ+5TRzPenVx/sO/quoOpWdfc9BCkbdM7PXeQoEWcsn5lq0rtmvd4VBauPajVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315174; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VOh8i0DwJY/ONOyYgGyBDIv1dAYbBsfMWmmDU6GMhcQ=; 
	b=YJopmnY5r4QbMcNLTv23ZUGN+Ic8qnGsM4fSN1uIqzS30MLxcefMnkyZej6WI+RMnZodr6oxBsNc4jizpAKedKT+ZEqo6e6Jgk5rOI7pS6dlJi/nR0c4tbbEARNtXqiMhXPIIZZznxjTVGwL3jANRsqOiZKISBJyLRC0xlK+e/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315174;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VOh8i0DwJY/ONOyYgGyBDIv1dAYbBsfMWmmDU6GMhcQ=;
	b=L2hO5WThLR1QAwQZCfuboaJGAYqccttrrOgRSHX3yY+mXif6LkQl817BfbLW+6I7
	4Z4FbuG+qH3py7W16yTzPrV6m2HZoOsKbGcFkqN1kawlmnsP0dknjyzA/y6pz4pR7h3
	FuMYcyPkffA2C6/xJhvhC/jzJIrB7T2wWDfB9WXU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 26/38] x86/hyperlaunch: introduce domain builder general dom creation
Date: Thu, 15 May 2025 09:19:09 -0400
Message-Id: <20250515131912.5019-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the builder_create_domains() function that provides the general
domain construction abstraction that selects between classic dom0 construction
and the hyperlaunch domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/Makefile |  1 +
 xen/arch/x86/domain-builder/core.c   | 36 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h  | 26 ++++++++++++++++++++
 xen/arch/x86/setup.c                 | 23 +++++++++++++++---
 xen/include/xen/domain-builder.h     |  2 ++
 5 files changed, 85 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/core.c

diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
index 69a7c574a8d8..96040bf66a04 100644
--- a/xen/arch/x86/domain-builder/Makefile
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -1 +1,2 @@
+obj-y += core.o
 obj-y += domain.o
diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
new file mode 100644
index 000000000000..3b315e59b188
--- /dev/null
+++ b/xen/arch/x86/domain-builder/core.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025, Apertus Solutions, LLC
+ */
+
+#include <xen/domain-builder.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+#include <asm/bootinfo.h>
+
+unsigned int __init builder_create_domains(struct boot_info *bi)
+{
+    unsigned int build_count = 0;
+    struct boot_domain *bd = &bi->domains[0];
+
+    if ( bd->capabilities & DOMAIN_CAPS_HARDWARE && bd->kernel == NULL )
+        panic("%s: hardware domain missing kernel\n", __func__);
+
+
+    arch_create_dom(bi, bd);
+    if ( bd->d )
+        build_count++;
+
+    return build_count;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 5b2c93b1ef9e..430ae08cf5ef 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -132,6 +132,32 @@ static inline unsigned int __init next_boot_module_index(
           (i) <= (b)->nr_modules;                       \
           (i) = next_boot_module_index(b, t, i + 1) )
 
+/*
+ * next_boot_domain_index:
+ *     Finds the next boot domain with capability cap, starting at array index
+ *     start.
+ *
+ * Returns:
+ *      Success - index in boot_domains array
+ *      Failure - a value greater than MAX_NR_BOOTDOMS
+ */
+static inline unsigned int __init next_boot_domain_index(
+    const struct boot_info *bi, uint32_t cap, unsigned int start)
+{
+    int i;
+
+    for ( i = start; i < bi->nr_domains; i++ )
+    {
+        if ( bi->domains[i].capabilities & cap )
+            return i;
+    }
+
+    return MAX_NR_BOOTDOMS + 1;
+}
+
+#define first_boot_domain_index(bi, cap)              \
+    next_boot_domain_index(bi, cap, 0)
+
 #endif /* X86_BOOTINFO_H */
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2458a43902e6..b2c7846be18f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2026,9 +2026,26 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = arch_create_dom(bi, &bi->domains[0]);
-    if ( !dom0 )
-        panic("Could not set up DOM0 guest OS\n");
+    ret = builder_create_domains(bi);
+    if ( ret <= 0 )
+        panic("Could not set up boot-time domains\n");
+    else
+        printk(XENLOG_INFO "Constructed %d boot-time domains\n", ret);
+
+    /* Selection order: hardware domain, control domain, first domain */
+    i = first_boot_domain_index(bi, DOMAIN_CAPS_HARDWARE);
+    if ( i >= MAX_NR_BOOTDOMS )
+    {
+        i = first_boot_domain_index(bi, DOMAIN_CAPS_CONTROL);
+        if ( i >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING
+                   "A hwdom/ctrldom not detected, using 0th domain\n");
+            i = 0;
+        }
+    }
+
+    dom0 = bi->domains[i].d;
 
     heap_init_late();
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index a9df326682ac..c26f670d4f66 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -43,4 +43,6 @@ void domain_vcpus_create(struct domain *d);
 struct domain *arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd);
 
+unsigned int builder_create_domains(struct boot_info *bi);
+
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


