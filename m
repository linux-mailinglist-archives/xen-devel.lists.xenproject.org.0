Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74022A945A7
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960028.1352096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GNE-0005md-VV; Sat, 19 Apr 2025 22:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960028.1352096; Sat, 19 Apr 2025 22:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GNE-0005jq-S7; Sat, 19 Apr 2025 22:09:20 +0000
Received: by outflank-mailman (input) for mailman id 960028;
 Sat, 19 Apr 2025 22:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GND-0004ik-FL
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:19 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef1c04f2-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:09:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100512455384.54233147742355;
 Sat, 19 Apr 2025 15:08:32 -0700 (PDT)
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
X-Inumbo-ID: ef1c04f2-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100514; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kea+OpCMbrU3niOqZ4LOEwuW42skHXjA8N5TrltliYaj/a6mW4QNYiGU3lwmAZbzWUKba8mcY/i6Odpa4LFMHDfqm5NiEPedJLUmR/8JJx1EcZlT04TIZXNL7b7D2YC7jI3pVtN0n6Z23FegLNH6aCmcfH03ylXooy0EOsR8i4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100514; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YokNzpGdgI0vQMpM08lo4NE+yMaBURARXSs0s10k4IU=; 
	b=EHi61hS/Sa1kndbQpbdGURi8SKMwBdvwG2DsXey3X1ecXJRER2y9woP9g/P5UCK85cNydRfYIcuIxJkc9UXojONewLZCHLSZ5VrqIe9rayRwu+eH4oJb9eXvF3uJo/LkD2iFFFSOUCdxSzEDF0F4OWAbeVfnNfyYO0aWTlEfiXw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100514;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=YokNzpGdgI0vQMpM08lo4NE+yMaBURARXSs0s10k4IU=;
	b=CRabSLX/9Tp3KlF0bltxA3SF8iGKnnVgyojCoTdMzwINEkuTMieLstBIHwYXf8mG
	bwQUQSmn9xaDs9k6IPaAeJHUE0ut2hkmwztFL6Qi0H6K8uu1KbgNPuL2JHeJQadqDSo
	njvPS1h/vtAJ8jvF1hpBJZSso/9Yihnr0j8xHueg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 03/38] x86/hyperlaunch: convert max vcpu determination to domain builder
Date: Sat, 19 Apr 2025 18:07:45 -0400
Message-Id: <20250419220820.4234-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/domain-builder/Makefile      |  1 +
 xen/arch/x86/domain-builder/domain.c      | 38 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |  1 +
 xen/arch/x86/setup.c                      |  4 +--
 4 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/domain.c

diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
index b10cd56b286b..67024b5cb213 100644
--- a/xen/arch/x86/domain-builder/Makefile
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
 obj-y += core.init.o
+obj-y += domain.init.o
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
new file mode 100644
index 000000000000..f2277b9e3cf3
--- /dev/null
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <asm/bootinfo.h>
+
+unsigned int __init dom_max_vcpus(struct boot_domain *bd)
+{
+    unsigned int limit = bd->mode & BUILD_MODE_PARAVIRT ?
+                                    MAX_VIRT_CPUS : HVM_MAX_VCPUS;
+
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
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
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 7518b6ddf3b9..f37f73e2255b 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -8,5 +8,6 @@ int __init builder_get_cmdline(
     struct boot_info *bi, int offset, char *cmdline, size_t size);
 
 void builder_init(struct boot_info *bi);
+unsigned int dom_max_vcpus(struct boot_domain *bd);
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6a939ccede3f..86bbd7c72ccd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1010,18 +1010,18 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     char *cmdline = NULL;
     size_t cmdline_size;
     unsigned int create_flags = 0;
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
-- 
2.30.2


