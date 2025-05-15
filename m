Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3BAB87B1
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985317.1371229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTl-0002B5-Lq; Thu, 15 May 2025 13:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985317.1371229; Thu, 15 May 2025 13:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTl-00029B-Hq; Thu, 15 May 2025 13:18:29 +0000
Received: by outflank-mailman (input) for mailman id 985317;
 Thu, 15 May 2025 13:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYTj-0001J6-RS
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15408a81-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315074222738.0540513286182;
 Thu, 15 May 2025 06:17:54 -0700 (PDT)
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
X-Inumbo-ID: 15408a81-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315075; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L41bRSVDjkTH520YjWtEtAS+i8aZVraqdrGabqLvWiHr/Vtnylr5G0YZ6UnTs+5PWzcJl60jLOgkRE8UpTrK8S1kXMrLt2opVPP/p0hOZ/qng62jojDH02f0AdXWynBehr8hfHc/AfmfbUZj/vfn4eUW4s0w1aNX1JXElFeYFHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315075; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kTwQ0VDMzd1npZEkVq0RJCKCjq57ZhEZ7/qXtfJRi5k=; 
	b=KP5U69NMn4dyQAJPDUn+6duOI8pyO2bdI+ak0rgAffitfSBDUBC+uRbe21vzt3HBBgfPd5xQ2regKi0qkY0rXc10CZ1ZRs+UNUMqYa8rKzBkVDngupMzhqnzaI4w4egNyI9d2+WO8FXoSg6qT0HBlyJn09C+e3dhe3i5CIliMi0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315075;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kTwQ0VDMzd1npZEkVq0RJCKCjq57ZhEZ7/qXtfJRi5k=;
	b=JeGkgy6SrJYIsRID1FWmfO6hbdLqNgV7++WojRzASUdF1roeiFUB2bPczyb9ERx3
	+uqZRVhO/ZDNVI48D9WYiD/bTizavWu60QC3orLKh27GRDjX6X1Bzl9mF+FQB8qgxwm
	V1WtI4WGyAq0H+fhUgppaomzcpeeZY+FHy8xoWRM=
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
Subject: [RFCv2 03/38] x86/hyperlaunch: convert max vcpu determination to domain builder
Date: Thu, 15 May 2025 09:17:09 -0400
Message-Id: <20250515131744.3843-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The domain configuration may request more vcpus than are present in the system.
For dom0, the function dom0_max_vcpus() was used to clamp down to physically
available vcpus. Here we are introducing a generalized version,
dom_max_vcpus(), that takes a boot domain and sets the max vcpus based on the
lesser of the requested max and the available vcpus.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/Makefile                |  1 +
 xen/arch/x86/domain-builder/Makefile |  1 +
 xen/arch/x86/domain-builder/domain.c | 40 ++++++++++++++++++++++++++++
 xen/arch/x86/setup.c                 |  4 +--
 xen/include/xen/domain-builder.h     |  3 +++
 5 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/domain.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c2f1dcf301d6..80269c5e6b45 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -31,6 +31,7 @@ obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
 obj-bin-y += dom0_build.init.o
+obj-y += domain-builder/
 obj-y += domain_page.o
 obj-y += e820.o
 obj-y += emul-i8254.o
diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
new file mode 100644
index 000000000000..0c2e7085e21b
--- /dev/null
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -0,0 +1 @@
+obj-y += domain.init.o
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
new file mode 100644
index 000000000000..d8eba73dac28
--- /dev/null
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025, Apertus Solutions, LLC
+ */
+
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <public/bootfdt.h>
+
+#include <asm/bootinfo.h>
+
+unsigned int __init dom_max_vcpus(struct boot_domain *bd)
+{
+    unsigned int limit = bd->mode & BUILD_MODE_PARAVIRT ?
+                                    MAX_VIRT_CPUS : HVM_MAX_VCPUS;
+
+    if ( bd->capabilities & DOMAIN_CAPS_CONTROL )
+        limit = dom0_max_vcpus();
+    else
+        limit = min(limit,
+                    (uint32_t)cpumask_weight(cpupool_valid_cpus(cpupool0)));
+
+    if ( bd->max_vcpus == 0 || bd->max_vcpus > limit )
+        bd->max_vcpus = limit;
+
+    return bd->max_vcpus;
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index afc133b4d562..d3bde6c43e8d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1020,18 +1020,18 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 {
     char *cmdline = NULL;
     size_t cmdline_size;
+    struct boot_domain *bd = &bi->domains[0];
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        .max_vcpus = dom0_max_vcpus(),
+        .max_vcpus = dom_max_vcpus(bd),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
     if ( opt_dom0_pvh ||
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index 350e2eb2af8c..82c929cc48a1 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -5,6 +5,7 @@
 #include <xen/types.h>
 
 struct boot_info;
+struct boot_domain;
 
 /* Return status of builder_init(). Shows which boot mechanism was detected */
 enum fdt_kind
@@ -34,4 +35,6 @@ size_t builder_get_cmdline_size(const struct boot_info *bi, int offset);
 int builder_get_cmdline(const struct boot_info *bi, int offset,
                         char *cmdline, size_t size);
 
+unsigned int dom_max_vcpus(struct boot_domain *bd);
+
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


