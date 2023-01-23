Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD0678069
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483023.748912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3T-0000P8-FV; Mon, 23 Jan 2023 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483023.748912; Mon, 23 Jan 2023 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3T-0000Mj-BD; Mon, 23 Jan 2023 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 483023;
 Mon, 23 Jan 2023 15:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3R-0000MU-9t
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:17 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53df98c2-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id w14so15073375edi.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:14 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:14 -0800 (PST)
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
X-Inumbo-ID: 53df98c2-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H72rNsIsMCXOiG8PzTR5/Br1dIcMG15DtbAn/iuSxU=;
        b=JVD+VcoJ+qMw0GEPyI/HAIC+49qRXTxc0kArNiFfqCZMoo9Kzx2hBUDLaa6wRUVqxU
         eVvEcG08lJjQWSq81P4FMMdhzhoFjcfNNlSayV37vKZ3rKCLN/Hf5SXI+4A4NBteF6lR
         D9kfK0GSf3zaUIfddQ8AoqlAUOieMboczhZQiRoYGQGVpkJEN3fUcUBASAz/D8s2FwqH
         VSTquYU7Atb1Q+Fm8fX1wjW56gtYtSZPB3cRb35MxCwM6qCF5ZimwfsO7p89B7m0KsY0
         72g9ug7gJd3leY3gLluq/CeMOMnOmUbv/2YDgtE5ATdil0FFyhmmbdDbotQm4UrJNXju
         rhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H72rNsIsMCXOiG8PzTR5/Br1dIcMG15DtbAn/iuSxU=;
        b=3d5e6cZXjBBafW+8w39zounj1ISSX54BbC4JgLfzpm2P61jTnXmsDOPxxTjAWceChf
         9L/k/Xvdr2jvh+HB22IqwEd9EcCf58huAXffpFSg14bQxgUnOZebqALul2esk9+DKJ7b
         h93RFQk+xWHWjkX25Xr1vwwcZFcMbsRsao3Z8vQNLhTHVegMnLq1usj4Q/kvHxfCrwqV
         kjhPgKUSJC6aYLAaXAezdtblK/8hI/q0UU6GI5gmLgtrUAXh1u3v+jQHvePTnFGCc+PD
         FXhBZj+uZ5mknIIez07rZSR5LN2S5HskpnS3jLErHEUazSpqqhx6PPfF3/irZ+BPdLRH
         qEMA==
X-Gm-Message-State: AFqh2kr/UQjya6mOFmxadTB8T10c0snYqIKme8odYqYeuvojA/6bw4lH
	upHB3tyTh0IXb1CvxT2lkCId9tSRTGQxu64Z
X-Google-Smtp-Source: AMrXdXsn4lVaXUAIsFwRDoSu2MtLlAzePVMLFPMkmZ2nzcWg97aMcuSbdlgwa8aB7yIvmlgcmUbFfA==
X-Received: by 2002:a05:6402:1946:b0:48b:c8de:9d20 with SMTP id f6-20020a056402194600b0048bc8de9d20mr28353774edz.32.1674488894307;
        Mon, 23 Jan 2023 07:48:14 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 01/11] xen/common: add cache coloring common code
Date: Mon, 23 Jan 2023 16:47:25 +0100
Message-Id: <20230123154735.74832-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the Last Level Cache (LLC) coloring common header,
Kconfig options and stub functions for domain coloring. Since this is an
arch specific feature, actual implementation is postponed to later patches
and Kconfig options are placed under xen/arch.

LLC colors are represented as dynamic arrays plus their size and since
they have to be passed during domain creation, domain_create() is replaced
by domain_create_llc_colored(). domain_create() is then turned into a
wrapper of the colored version to let all the original call sites remain
untouched.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- Kconfig options moved to xen/arch
- removed range for CONFIG_NR_LLC_COLORS
- added "llc_coloring_enabled" global to later implement the boot-time
  switch
- added domain_create_llc_colored() to be able to pass colors
- added is_domain_llc_colored() macro
---
 xen/arch/Kconfig               | 17 +++++++++++
 xen/common/Kconfig             |  3 ++
 xen/common/domain.c            | 23 +++++++++++++--
 xen/common/keyhandler.c        |  4 +++
 xen/include/xen/llc_coloring.h | 54 ++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h        |  9 ++++++
 6 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 xen/include/xen/llc_coloring.h

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..39c23f2528 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -28,3 +28,20 @@ config NR_NUMA_NODES
 	  associated with multiple-nodes management. It is the upper bound of
 	  the number of NUMA nodes that the scheduler, memory allocation and
 	  other NUMA-aware components can handle.
+
+config LLC_COLORING
+	bool "Last Level Cache (LLC) coloring" if EXPERT
+	depends on HAS_LLC_COLORING
+
+config NR_LLC_COLORS
+	int "Maximum number of LLC colors"
+	default 128
+	depends on LLC_COLORING
+	help
+	  Controls the build-time size of various arrays associated with LLC
+	  coloring. Refer to the documentation for how to compute the number
+	  of colors supported by the platform.
+	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
+	  more than what needed in the general case.
+	  Note that if, at any time, a color configuration with more colors than
+	  the maximum is employed, an error is produced.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..c796c633f1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -49,6 +49,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_LLC_COLORING
+	bool
+
 config HAS_PDX
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 626debbae0..87aae86081 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -7,6 +7,7 @@
 #include <xen/compat.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/llc_coloring.h>
 #include <xen/ctype.h>
 #include <xen/err.h>
 #include <xen/param.h>
@@ -549,9 +550,11 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
-struct domain *domain_create(domid_t domid,
-                             struct xen_domctl_createdomain *config,
-                             unsigned int flags)
+struct domain *domain_create_llc_colored(domid_t domid,
+                                         struct xen_domctl_createdomain *config,
+                                         unsigned int flags,
+                                         unsigned int *llc_colors,
+                                         unsigned int num_llc_colors)
 {
     struct domain *d, **pd, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
@@ -663,6 +666,10 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        if ( llc_coloring_enabled &&
+             (err = domain_llc_coloring_init(d, llc_colors, num_llc_colors)) )
+            return ERR_PTR(err);
     }
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
@@ -769,6 +776,13 @@ struct domain *domain_create(domid_t domid,
     return ERR_PTR(err);
 }
 
+struct domain *domain_create(domid_t domid,
+                             struct xen_domctl_createdomain *config,
+                             unsigned int flags)
+{
+    return domain_create_llc_colored(domid, config, flags, 0, 0);
+}
+
 void __init setup_system_domains(void)
 {
     /*
@@ -1103,6 +1117,9 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
     struct vcpu *v;
     int i;
 
+    if ( is_domain_llc_colored(d) )
+        domain_llc_coloring_free(d);
+
     /*
      * Flush all state for the vCPU previously having run on the current CPU.
      * This is in particular relevant for x86 HVM ones on VMX, so that this
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0a551033c4..56f7731595 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -6,6 +6,7 @@
 #include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/llc_coloring.h>
 #include <xen/param.h>
 #include <xen/shutdown.h>
 #include <xen/event.h>
@@ -307,6 +308,9 @@ static void cf_check dump_domains(unsigned char key)
 
         arch_dump_domain_info(d);
 
+        if ( is_domain_llc_colored(d) )
+            domain_dump_llc_colors(d);
+
         rangeset_domain_printk(d);
 
         dump_pageframe_info(d);
diff --git a/xen/include/xen/llc_coloring.h b/xen/include/xen/llc_coloring.h
new file mode 100644
index 0000000000..625930d378
--- /dev/null
+++ b/xen/include/xen/llc_coloring.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Last Level Cache (LLC) coloring common header
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ *
+ * Authors:
+ *    Carlo Nonato <carlo.nonato@minervasys.tech>
+ */
+#ifndef __COLORING_H__
+#define __COLORING_H__
+
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+#ifdef CONFIG_HAS_LLC_COLORING
+
+#include <asm/llc_coloring.h>
+
+extern bool llc_coloring_enabled;
+
+int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
+                             unsigned int num_colors);
+void domain_llc_coloring_free(struct domain *d);
+void domain_dump_llc_colors(struct domain *d);
+
+#else
+
+#define llc_coloring_enabled (false)
+
+static inline int domain_llc_coloring_init(struct domain *d,
+                                           unsigned int *colors,
+                                           unsigned int num_colors)
+{
+    return 0;
+}
+static inline void domain_llc_coloring_free(struct domain *d) {}
+static inline void domain_dump_llc_colors(struct domain *d) {}
+
+#endif /* CONFIG_HAS_LLC_COLORING */
+
+#define is_domain_llc_colored(d) (llc_coloring_enabled)
+
+#endif /* __COLORING_H__ */
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
\ No newline at end of file
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 12be794002..754f6cb1da 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -602,6 +602,9 @@ struct domain
 
     /* Holding CDF_* constant. Internal flags for domain creation. */
     unsigned int cdf;
+
+    unsigned int *llc_colors;
+    unsigned int num_llc_colors;
 };
 
 static inline struct page_list_head *page_to_list(
@@ -685,6 +688,12 @@ static inline void domain_update_node_affinity(struct domain *d)
  */
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
 
+struct domain *domain_create_llc_colored(domid_t domid,
+                                         struct xen_domctl_createdomain *config,
+                                         unsigned int flags,
+                                         unsigned int *colors,
+                                         unsigned int num_colors);
+
 /*
  * Create a domain: the configuration is only necessary for real domain
  * (domid < DOMID_FIRST_RESERVED).
-- 
2.34.1


