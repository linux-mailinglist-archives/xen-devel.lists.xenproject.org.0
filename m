Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C45693E1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362540.592610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CFp-0006Wx-Fl; Wed, 06 Jul 2022 21:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362540.592610; Wed, 06 Jul 2022 21:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CFp-0006Ua-D3; Wed, 06 Jul 2022 21:08:13 +0000
Received: by outflank-mailman (input) for mailman id 362540;
 Wed, 06 Jul 2022 21:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CFI-0003HV-Oz
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:07:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa017a83-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:07:39 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141516660163.52773294084864;
 Wed, 6 Jul 2022 14:05:16 -0700 (PDT)
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
X-Inumbo-ID: aa017a83-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dFLnhlcLscM2iZicoi/+xsP7p2cnh9am/AF+aWaW7uI6a2L5Q49qlionMeMtt11RcPdGTppxE4RMf0KMM59eOZ8dxScKLyJlWWSa+kdXB87j5lprdsA0wug5lcgvjamjQvyDjembs059kUiNJX3LUW4eom39ICburkk9JUJusUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141519; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=A6AMQVyod82qQaiZjmSPOr+I3hcKRNwtWIcfRwtz3po=; 
	b=Xosg7reBeL0ZV68oKzyFJGUyXhGKQqw0EV1ygRN6bDcUaOCrwCSUE0QOIZEfmx1yh9h21WYjxavYRbqb1daB7C1DCZ9yNAmBKmrUkvAwEK3eqxT4NW7HxF/4/Z4UFFGR6kDGTtdReMK6ju+3x84Gq8mksMSaNlT0vTT8XDgE45I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141519;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=A6AMQVyod82qQaiZjmSPOr+I3hcKRNwtWIcfRwtz3po=;
	b=pRirURHJn2l6HPxONdBM7XV9yqVH3KutDYO5aDJWm7M4HkD0/n7clNGmoXavbIvf
	WDqes1mgJjiFQrsCkUOPGiVbNKw5+KZHdk1MqV2fsHtL7oAWD7r4aXKApWDswYhg7y+
	aTVvf/N4MBkJUMECOzgVqHLbL7cNjq9ijztnYcIw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 09/18] x86: introduce abstractions for domain builder
Date: Wed,  6 Jul 2022 17:04:44 -0400
Message-Id: <20220706210454.30096-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit expands the new boot info structs to provide the initial
abstractions for domain builder.  Additionally, it reuses the memory allocation
structures previously used for dom0, bring the structures and helper functions
under the domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/boot/boot_info32.h       |  3 ++
 xen/arch/x86/dom0_build.c             | 21 +---------
 xen/arch/x86/include/asm/bootdomain.h | 30 +++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h   |  2 +
 xen/include/xen/bootdomain.h          | 52 +++++++++++++++++++++++++
 xen/include/xen/bootinfo.h            |  4 ++
 xen/include/xen/domain_builder.h      | 55 +++++++++++++++++++++++++++
 7 files changed, 147 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h
 create mode 100644 xen/include/xen/bootdomain.h
 create mode 100644 xen/include/xen/domain_builder.h

diff --git a/xen/arch/x86/boot/boot_info32.h b/xen/arch/x86/boot/boot_info32.h
index 01af950efc..0e7821efb3 100644
--- a/xen/arch/x86/boot/boot_info32.h
+++ b/xen/arch/x86/boot/boot_info32.h
@@ -87,6 +87,9 @@ struct __packed boot_info {
     /* struct boot_module* */
     u64 mods;
 
+    /* struct domain_builder* */
+    u64 builder;
+
     /* struct arch_boot_info* */
     u64 arch;
 };
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 9ca5a99510..e44f7f3c43 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
@@ -22,31 +23,11 @@
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
 
-struct memsize {
-    long nr_pages;
-    unsigned int percent;
-    bool minus;
-};
-
 static struct memsize __initdata dom0_size;
 static struct memsize __initdata dom0_min_size;
 static struct memsize __initdata dom0_max_size = { .nr_pages = LONG_MAX };
 static bool __initdata dom0_mem_set;
 
-static bool __init memsize_gt_zero(const struct memsize *sz)
-{
-    return !sz->minus && sz->nr_pages;
-}
-
-static unsigned long __init get_memsize(const struct memsize *sz,
-                                        unsigned long avail)
-{
-    unsigned long pages;
-
-    pages = sz->nr_pages + sz->percent * avail / 100;
-    return sz->minus ? avail - pages : pages;
-}
-
 /*
  * dom0_mem=[min:<min_amt>,][max:<max_amt>,][<amt>]
  *
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
new file mode 100644
index 0000000000..6f37ac99dc
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -0,0 +1,30 @@
+#ifndef __ARCH_X86_BOOTDOMAIN_H__
+#define __ARCH_X86_BOOTDOMAIN_H__
+
+struct memsize {
+    long nr_pages;
+    unsigned int percent;
+    bool minus;
+};
+
+static inline bool memsize_gt_zero(const struct memsize *sz)
+{
+    return !sz->minus && sz->nr_pages;
+}
+
+static inline unsigned long get_memsize(
+    const struct memsize *sz, unsigned long avail)
+{
+    unsigned long pages;
+
+    pages = sz->nr_pages + sz->percent * avail / 100;
+    return sz->minus ? avail - pages : pages;
+}
+
+struct arch_domain_mem {
+    struct memsize mem_size;
+    struct memsize mem_min;
+    struct memsize mem_max;
+};
+
+#endif
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 2fcd576023..f02f4edcd7 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -45,6 +45,8 @@ struct __packed mb_memmap {
     uint32_t type;
 };
 
+struct arch_domain_builder { };
+
 static inline bool loader_is_grub2(const char *loader_name)
 {
     /* GRUB1="GNU GRUB 0.xx"; GRUB2="GRUB 1.xx" */
diff --git a/xen/include/xen/bootdomain.h b/xen/include/xen/bootdomain.h
new file mode 100644
index 0000000000..b172d16f4e
--- /dev/null
+++ b/xen/include/xen/bootdomain.h
@@ -0,0 +1,52 @@
+#ifndef __XEN_BOOTDOMAIN_H__
+#define __XEN_BOOTDOMAIN_H__
+
+#include <xen/bootinfo.h>
+#include <xen/types.h>
+
+#include <public/xen.h>
+
+#include <asm/bootdomain.h>
+
+struct domain;
+
+struct boot_domain {
+#define BUILD_PERMISSION_NONE          (0)
+#define BUILD_PERMISSION_CONTROL       (1 << 0)
+#define BUILD_PERMISSION_HARDWARE      (1 << 1)
+    uint32_t permissions;
+
+#define BUILD_FUNCTION_NONE            (0)
+#define BUILD_FUNCTION_BOOT            (1 << 0)
+#define BUILD_FUNCTION_CRASH           (1 << 1)
+#define BUILD_FUNCTION_CONSOLE         (1 << 2)
+#define BUILD_FUNCTION_STUBDOM         (1 << 3)
+#define BUILD_FUNCTION_XENSTORE        (1 << 30)
+#define BUILD_FUNCTION_INITIAL_DOM     (1 << 31)
+    uint32_t functions;
+                                                /* On     | Off    */
+#define BUILD_MODE_PARAVIRTUALIZED     (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM    | PVH     */
+#define BUILD_MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT  */
+    uint32_t mode;
+
+    domid_t domid;
+    uint8_t uuid[16];
+
+    uint32_t ncpus;
+    struct arch_domain_mem meminfo;
+
+#define BUILD_MAX_SECID_LEN 64
+    unsigned char secid[BUILD_MAX_SECID_LEN];
+
+    struct boot_module *kernel;
+    struct boot_module *ramdisk;
+#define BUILD_MAX_CONF_MODS 2
+#define BUILD_DTB_CONF_IDX 0
+#define BUILD_DOM_CONF_IDX 1
+    struct boot_module *configs[BUILD_MAX_CONF_MODS];
+
+    struct domain *domain;
+};
+
+#endif
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 477294dc10..1d76d99a40 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -1,6 +1,7 @@
 #ifndef __XEN_BOOTINFO_H__
 #define __XEN_BOOTINFO_H__
 
+#include <xen/bootdomain.h>
 #include <xen/mm.h>
 #include <xen/types.h>
 
@@ -15,6 +16,7 @@ typedef enum {
     BOOTMOD_XSM,
     BOOTMOD_UCODE,
     BOOTMOD_GUEST_DTB,
+    BOOTMOD_GUEST_CONF,
 }  bootmodule_kind;
 
 typedef enum {
@@ -48,6 +50,8 @@ struct __packed boot_info {
     uint32_t nr_mods;
     struct boot_module *mods;
 
+    struct domain_builder *builder;
+
     struct arch_boot_info *arch;
 };
 
diff --git a/xen/include/xen/domain_builder.h b/xen/include/xen/domain_builder.h
new file mode 100644
index 0000000000..79785ef251
--- /dev/null
+++ b/xen/include/xen/domain_builder.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef XEN_DOMAIN_BUILDER_H
+#define XEN_DOMAIN_BUILDER_H
+
+#include <xen/bootdomain.h>
+#include <xen/bootinfo.h>
+
+#include <asm/setup.h>
+
+struct domain_builder {
+    bool fdt_enabled;
+#define BUILD_MAX_BOOT_DOMAINS 64
+    uint16_t nr_doms;
+    struct boot_domain domains[BUILD_MAX_BOOT_DOMAINS];
+
+    struct arch_domain_builder *arch;
+};
+
+static inline bool builder_is_initdom(struct boot_domain *bd)
+{
+    return bd->functions & BUILD_FUNCTION_INITIAL_DOM;
+}
+
+static inline bool builder_is_ctldom(struct boot_domain *bd)
+{
+    return (bd->functions & BUILD_FUNCTION_INITIAL_DOM ||
+            bd->permissions & BUILD_PERMISSION_CONTROL );
+}
+
+static inline bool builder_is_hwdom(struct boot_domain *bd)
+{
+    return (bd->functions & BUILD_FUNCTION_INITIAL_DOM ||
+            bd->permissions & BUILD_PERMISSION_HARDWARE );
+}
+
+static inline struct domain *builder_get_hwdom(struct boot_info *info)
+{
+    int i;
+
+    for ( i = 0; i < info->builder->nr_doms; i++ )
+    {
+        struct boot_domain *d = &info->builder->domains[i];
+
+        if ( builder_is_hwdom(d) )
+            return d->domain;
+    }
+
+    return NULL;
+}
+
+void builder_init(struct boot_info *info);
+uint32_t builder_create_domains(struct boot_info *info);
+
+#endif /* XEN_DOMAIN_BUILDER_H */
-- 
2.20.1


