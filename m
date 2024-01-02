Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936082191D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660560.1030043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR8-00067P-5V; Tue, 02 Jan 2024 09:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660560.1030043; Tue, 02 Jan 2024 09:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR8-00062C-21; Tue, 02 Jan 2024 09:51:50 +0000
Received: by outflank-mailman (input) for mailman id 660560;
 Tue, 02 Jan 2024 09:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbR6-00060C-NN
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a3e4b36-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:45 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55642663ac4so1250055a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:45 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:43 -0800 (PST)
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
X-Inumbo-ID: 8a3e4b36-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189105; x=1704793905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL4f1m83hPDbhj+UPG8Dssp4ZlvBduVN7Pf6KlCuLUs=;
        b=AInNBGg08I/EQ/0YT/Gn+lWam/v6iGIhI0kr02EYUETYauv/2UfBYihP/9XOmZobUP
         +POWQ6ELWsz8v/7w9CFq2uIYj2/DubZClVol/RPfNa7swuG8SzQqAhDdXSE2joeuECQx
         TTgtaZulXK3OtByAg76+FtVintmeLMtbRB2lEmJfMK8Hj4pxElyBrmZElgHKejEExYhI
         IcNddVqNq3kiRVlifG+72qrjmtZlngV0RYAHrIO+qI8iohnd+4g3CkDQANGUSlxZ/qdn
         xZRLPtxFTV8zm8BIci8Isu3DHxDjfBeIp3HaXUq3dBCtsTtHF/B3RYwBToDUxPcelIR4
         OEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189105; x=1704793905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL4f1m83hPDbhj+UPG8Dssp4ZlvBduVN7Pf6KlCuLUs=;
        b=lREI+2s3LG2H77MOv+YKvkI6FoI4oRAy/USgot9RSgPwlw8/w9guY6Ldiz4kC41Uj0
         9KQQczrnr1WATGXYYF5KD7sXgzUJTfZUQSbmRQKC1zFv6vTimXfCp1tKdNk6Z/0O23N3
         8zMa/PKsSTEd+zDkLXmuWknBLyCgx59h9VRMikAxBLgGK9fyXw4M1sn6NuO7liay8nTz
         Y8LmsRrbqoEZTP9fXEkqfIQTWng0gUiMyYUpMqKfy5D6WmssVOlswO4xuoleiK8EgyeO
         /OxWEGhwXlLMrG45GOD9D7HbtJ51xBNFq57PHEneKJB0LgJTELeh3o4ifiXU0LdPqtL3
         zTVg==
X-Gm-Message-State: AOJu0YzFl2UN3jGtjLT9a2rTcGDDyDHRnBWGT1I4OkF2GKPuoxa4Kt11
	42/jAVdX0U7wA5dEN6Wx+VWrnVB/1HrJlD2h81BfyzXPV/0=
X-Google-Smtp-Source: AGHT+IGcYzPzPCk3GYwYAqo1Lq5Eg2hqUHGkXA0KpjTSuGSGSbKgCvXr8KlByYLBYBmcIr9weZWytA==
X-Received: by 2002:a17:906:c801:b0:a26:ac91:143a with SMTP id cx1-20020a170906c80100b00a26ac91143amr8018799ejb.50.1704189104654;
        Tue, 02 Jan 2024 01:51:44 -0800 (PST)
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
Subject: [PATCH v5 01/13] xen/common: add cache coloring common code
Date: Tue,  2 Jan 2024 10:51:26 +0100
Message-Id: <20240102095138.17933-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the Last Level Cache (LLC) coloring common header, Kconfig
options and functions. Since this is an arch specific feature, actual
implementation is postponed to later patches and Kconfig options are placed
under xen/arch.

LLC colors are a property of the domain, so the domain struct has to be
extended.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- used - instead of _ for filenames
- removed domain_create_llc_colored()
- removed stub functions
- coloring domain fields are now #ifdef protected
v4:
- Kconfig options moved to xen/arch
- removed range for CONFIG_NR_LLC_COLORS
- added "llc_coloring_enabled" global to later implement the boot-time
  switch
- added domain_create_llc_colored() to be able to pass colors
- added is_domain_llc_colored() macro
---
 xen/arch/Kconfig               | 16 ++++++++++++
 xen/common/Kconfig             |  3 +++
 xen/common/domain.c            |  4 +++
 xen/common/keyhandler.c        |  4 +++
 xen/include/xen/llc-coloring.h | 46 ++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h        |  5 ++++
 6 files changed, 78 insertions(+)
 create mode 100644 xen/include/xen/llc-coloring.h

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 67ba38f32f..aad7e9da38 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -31,3 +31,19 @@ config NR_NUMA_NODES
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
+	  coloring. Refer to cache coloring documentation for how to compute the
+	  number of colors supported by the platform. This is only an upper
+	  bound. The runtime value is autocomputed or manually set via cmdline.
+	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
+	  more than what needed in the general case.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229c..e383f09d97 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -71,6 +71,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_LLC_COLORING
+	bool
+
 config HAS_PMAP
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f6f5574996..491585b0bb 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -7,6 +7,7 @@
 #include <xen/compat.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/ctype.h>
 #include <xen/err.h>
 #include <xen/param.h>
@@ -1144,6 +1145,9 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
     struct vcpu *v;
     int i;
 
+    if ( is_domain_llc_colored(d) )
+        domain_llc_coloring_free(d);
+
     /*
      * Flush all state for the vCPU previously having run on the current CPU.
      * This is in particular relevant for x86 HVM ones on VMX, so that this
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 99a2d72a02..27c2d324d8 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -6,6 +6,7 @@
 #include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/llc-coloring.h>
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
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
new file mode 100644
index 0000000000..cedd97d4b5
--- /dev/null
+++ b/xen/include/xen/llc-coloring.h
@@ -0,0 +1,46 @@
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
+#include <asm/llc-coloring.h>
+
+#ifdef CONFIG_LLC_COLORING
+extern bool llc_coloring_enabled;
+#define llc_coloring_enabled (llc_coloring_enabled)
+#endif
+
+#endif
+
+#ifndef llc_coloring_enabled
+#define llc_coloring_enabled (false)
+#endif
+
+#define is_domain_llc_colored(d) (llc_coloring_enabled)
+
+void domain_llc_coloring_free(struct domain *d);
+void domain_dump_llc_colors(struct domain *d);
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
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9da91e0e62..dae7fab673 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -626,6 +626,11 @@ struct domain
 
     /* Holding CDF_* constant. Internal flags for domain creation. */
     unsigned int cdf;
+
+#ifdef CONFIG_LLC_COLORING
+    unsigned int *llc_colors;
+    unsigned int num_llc_colors;
+#endif
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.34.1


