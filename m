Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8FAA9B3E
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976210.1363446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HA-0006fu-Hi; Mon, 05 May 2025 18:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976210.1363446; Mon, 05 May 2025 18:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HA-0006bi-Bl; Mon, 05 May 2025 18:10:48 +0000
Received: by outflank-mailman (input) for mailman id 976210;
 Mon, 05 May 2025 18:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0H8-0005wU-90
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:46 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c6444a-29dc-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 20:10:45 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso7291598a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:45 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:43 -0700 (PDT)
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
X-Inumbo-ID: 43c6444a-29dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468645; x=1747073445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlG03+gXnXCUtXssnU/J0TI7pH+zT0PZJfNCpBDG6K0=;
        b=jrceSAMscZZ7Dr6HvcTBofoMZ2jMqTODlpNaRVoQuEq6Cx7O/MA3kiqXsFKobtdu0f
         r/pWbzD8oWqvI4767PfyyZV/IsJQ0l33YMujXwVA9LsNH37XyHy1yVrz6qLzNL/wL0xx
         QGa8uClYbJonQ/Nn5mKEfai4ulJE5HgwtzdtaDRZAwurjBuPvgUwB1xYqU0x162cPXiT
         ZYoQ7Eono50SBGgTAUkxyxy6Abjuk4Tnv0KiUNDJoy313wxf8rDD+ssKS/Wx99ENo4xF
         BZcaVtRplBmaojWjpoWkSR7GyIJJpiKxAo8jR4RRblKMRGzjro8DBMJg7/6BZ9QfogRY
         xdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468645; x=1747073445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlG03+gXnXCUtXssnU/J0TI7pH+zT0PZJfNCpBDG6K0=;
        b=N5NXbHtRkc/c2LiEWexeWBBmBtPrV+2/MFyhRsdbusRUKnmwJlozu9hltwhN2dmkkj
         8m77PlvBsKVK27Q7OB4FzGt48gxZgFsxXXlnRYH0a/kbBPHnqF7W49KXQWOAWJJw4Eul
         nFZXV2eeunl0pFpHOUYV/E3fEtUDz/+1nr1w3+/8J9chrjXAy1rkUngAVZYBM6wY43KH
         43FmDWFmcNFVpUZoQ56OVW0bK/s471fRoCl74DfbAJ/c2RZNqq/Ml2VWXfJ4xn/KQV+U
         HJbz94fQsmTUWNylyv8/IwwRQjurlwC0HfpLObMbJ6EwiWWCenoLIGC251Rrm4AeyiBg
         grGg==
X-Gm-Message-State: AOJu0YxQ/pW/aXbftAkgDOJFBdrgI50/tJMTw9YgHhpApWH5EmXpEbLq
	bEZgNFfHFfUzVCxRSvxLeGen091t4nveh60k3WWOX/Djm8WsToWMWWm7rA==
X-Gm-Gg: ASbGncuNXZoLdeZDlXyXag3c8ezXryCkjXGGIL4lSEw4I2cmgC5/WNzNN44Kn8o6JQ3
	6cG3ByKTz4vYzA5M48XlLibjePyVFUVho73Kx2gst5NcEyGWqNBacLUd6mMkvakguD3sfeSKedb
	LCcPAVG9PlZbgzdS4b98pVcXY/E52Q9tQqwxG/+/jasF6XE9wmz7JZCjrChMGOhMXx6PLdZFi7i
	48C9Z3ij+tFShGZXxrxj2VZD0bh8CwON2p2yCKxy/Bl30dYdnPsQN5nXNvW0R0PDIBCl6hV75Sx
	LwQmdK9734RLBYLk/XMuWRuNwsR0ZqlLa1zbAWn1pm5Dk7vItuf6CxHLX5t0XizjLa6F0/zpgJ2
	PVtNr0lomWg==
X-Google-Smtp-Source: AGHT+IFX97REERVNC4KQ9UY17R25rYwsjgOlf0v8AFy1Kit/MJpLDE3DtVEtQPqvosYWLu9W0t87Nw==
X-Received: by 2002:a17:907:968c:b0:ad1:7858:a74c with SMTP id a640c23a62f3a-ad1a4931545mr663380666b.22.1746468644604;
        Mon, 05 May 2025 11:10:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 5/8] asm-generic: move some parts of Arm's domain_build.h to common
Date: Mon,  5 May 2025 20:10:35 +0200
Message-ID: <3e8bcf195a5c7bec8b32aaf01a128dcb25e68b9e.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746468003.git.oleksii.kurochko@gmail.com>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing changed. Only some functions declaration are moved to xen/include/
headers as they are expected to be used by common code of domain builing
or dom0less.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Chnages in v4:
 - Move declaration of allocate_*() to the patch where defintions of them are introduced.
 - Move declaration of 'int construct_hwdom(struct kernel_info *kinfo,
   const struct dt_device_node *node) to fdt-domain-build.h.
 - Drop declaration of get_allocation_size() from fdt-domain-build.h as defintion/declaration
   will be added in the further patch of this patch series.
---
 Chnages in v3:
 - Drop inclusion of <asm/domain_build.h> from xen/fdt-domain-build.h.
 - Add empty line after license tag in xen/fdt-domain-build.h.
---
 Chnages in v2:
  - Add missed declaration of construct_hwdom().
  - Drop unnessary blank line.
  - Introduce xen/fdt-domain-build.h and move parts of Arm's domain_build.h to
    it.
  - Update the commit message.
---
 xen/arch/arm/acpi/domain_build.c        |  1 +
 xen/arch/arm/dom0less-build.c           |  1 +
 xen/arch/arm/domain_build.c             |  1 +
 xen/arch/arm/include/asm/domain_build.h | 11 +-------
 xen/arch/arm/kernel.c                   |  1 +
 xen/arch/arm/static-shmem.c             |  1 +
 xen/include/xen/fdt-domain-build.h      | 35 +++++++++++++++++++++++++
 7 files changed, 41 insertions(+), 10 deletions(-)
 create mode 100644 xen/include/xen/fdt-domain-build.h

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index f9ca8b47e5..1c3555d814 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -10,6 +10,7 @@
  */
 
 #include <xen/compile.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7e9cedb0c8..47eb38b9ad 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/err.h>
 #include <xen/event.h>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8c7a054718..9d649b06b3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/init.h>
 #include <xen/compile.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/lib.h>
 #include <xen/llc-coloring.h>
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index df1c0fe301..9d72108f35 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -9,21 +9,12 @@ typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
                                      unsigned int order, void *extra);
 bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                              alloc_domheap_mem_cb cb, void *extra);
+
 bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
 void allocate_memory(struct domain *d, struct kernel_info *kinfo);
-int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo,
-                    const struct dt_device_node *node);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
-int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-                         int addrcells, int sizecells);
-int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-                     int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
-int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
 unsigned int get_allocation_size(paddr_t size);
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 34c8233853..aea8f44413 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -7,6 +7,7 @@
 #include <xen/byteorder.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/guest_access.h>
 #include <xen/gunzip.h>
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 14ae48fb1e..1f8441d920 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/device_tree.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/rangeset.h>
 #include <xen/sched.h>
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
new file mode 100644
index 0000000000..30d5358a0f
--- /dev/null
+++ b/xen/include/xen/fdt-domain-build.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __XEN_FDT_DOMAIN_BUILD_H__
+#define __XEN_FDT_DOMAIN_BUILD_H__
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
+#include <xen/types.h>
+
+struct domain;
+struct page_info;
+struct membanks;
+
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int construct_hwdom(struct kernel_info *kinfo,
+                    const struct dt_device_node *node);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.49.0


