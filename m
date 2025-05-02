Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85051AA7726
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974788.1362594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA2-0006s2-2K; Fri, 02 May 2025 16:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974788.1362594; Fri, 02 May 2025 16:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA1-0006oX-Ql; Fri, 02 May 2025 16:22:49 +0000
Received: by outflank-mailman (input) for mailman id 974788;
 Fri, 02 May 2025 16:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9z-0005rZ-Lx
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:47 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aefd9725-2771-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 18:22:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so403589066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:47 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:45 -0700 (PDT)
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
X-Inumbo-ID: aefd9725-2771-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202966; x=1746807766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JrfvyxSkM64biX/am1b6/5d/FYxpOpOjwig6QZTZeo=;
        b=Z/P/C2+vOld7vSi0p4IgWn/3sXZWR/82a+xIVcBzNyw24qA9v5INVpoX7m2hqvYYJh
         TTScRbNwk60qKwUF5PqRSrG4sYwJ+1mBQjFM6i+/gR0rx2MKss5dPx+0P6UJgdh3hHFd
         +Ubt4xqE8o4c8u7WOPJeQ/6eJebFQlAtDIwkddYdzbIyNP52Y9ivaqn6ElhfFgfTHGNG
         ZLnuSEbWP3OzLIpAmUxYJBO7LYicPzUq8lDG3kl+ZOsDpNXhbtZPm89oA+pYuNqO2l3Z
         ldZFJLHjCEbQO67Vx05qN7bEAAUM/q2DQ9lcu0hQdcJL22gXn5QggJsuNk2APTAE7n1t
         U1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202966; x=1746807766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JrfvyxSkM64biX/am1b6/5d/FYxpOpOjwig6QZTZeo=;
        b=nPBEQuNQbw+7WtU5os6OV69QeIvY+keOk5Rq4lkzCX6U6KQZplgEhJFXiXEde+tWf9
         4Uxf/Jp+N1Rq14tvaoo1lnj7WV2xERW9D3Mz1VXNIC6aCV5VZfmlNDYnmhZvptVWPL+Q
         Uf3JyQbqXbAsokslDAFT/8KNDVDtuL03CXOizeOG4iA45Vw4ar0tg84mRA9aXkw40/Wp
         jjXmTNAdxFufYDTnvipOFxTXHJ7GLGzoMgfjBWLoBzkxbUZL64+W4LTmhGB4HL5TBQPU
         hxhBvTkjvP5pDZJvztRHdcDhJpZGIfX9fahUGZHVb+BFEHibRP0R4KeQRXudSoEH65cu
         tgCw==
X-Gm-Message-State: AOJu0YzBni+OxOywrwdoUL3BJm7EbYHhD/4SbYkC4ki3g6voEGD4C8bl
	CBQ5JUvjAlrG43B41oP9WgdzJleplIkAjh516YVDaxko+sMoHcyz/W5Svw==
X-Gm-Gg: ASbGncuXHdMSreGfk0/SSn2q4S4lddgvtVDl4A8r3mYUdv/xgkwOmVoN/rBX0ZGQMbx
	2tMRoNK4yCu4m+WpX29p6I8ijX2TI3tUZ5oJKsBY8LOJQRZL7XSNnEbm+uicv8CPQaOY46AU/y0
	fA/MDuDfM8eDJYJcEqzgw7kVOQzpc5OHbPm8S+z13h30DJgLkEcu55KedoS9HIPUeqkEfmx4DZa
	BRkI2XDNGEuyS5Hm+SFotUSQjg20o7M/i8Ojrsw8Av4iGQSWEBm8SmcQbQLo39l+3LreLOSxwRF
	BApaIai8qHyrFZ0Ky9o/8dmexTJ69o78cpIP0esY7yL4Ye2juNCFPa6AXJwvh6+E+mOrsLiuBIY
	IfMDAGi7g2A==
X-Google-Smtp-Source: AGHT+IGpvTrTs4R9+cvgRyOaBz28ykGN+IVQHA9MrRTcQ2GDeRdCTzBEXuHwDhoQTH1aibTwzjquoA==
X-Received: by 2002:a17:906:9c8c:b0:ac2:d0e6:2b99 with SMTP id a640c23a62f3a-ad17adc78d2mr327424366b.36.1746202966176;
        Fri, 02 May 2025 09:22:46 -0700 (PDT)
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
Subject: [PATCH v3 5/8] asm-generic: move some parts of Arm's domain_build.h to common
Date: Fri,  2 May 2025 18:22:35 +0200
Message-ID: <bac1324ae98b8cfae12978f7d965d0ecdf8bb769.1746199009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746199009.git.oleksii.kurochko@gmail.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing changed. Only some functions declaration are moved to xen/include/
headers as they are expected to be used by common code of domain builing
or dom0less.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/arm/include/asm/domain_build.h | 21 ++----------
 xen/arch/arm/kernel.c                   |  1 +
 xen/arch/arm/static-shmem.c             |  1 +
 xen/include/xen/fdt-domain-build.h      | 43 +++++++++++++++++++++++++
 7 files changed, 51 insertions(+), 18 deletions(-)
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
index 7eecd06d44..0310579863 100644
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
index df1c0fe301..397e408a1f 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,28 +5,13 @@
 #include <xen/sched.h>
 
 typedef __be32 gic_interrupt_t[3];
-typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
-                                     unsigned int order, void *extra);
-bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                             alloc_domheap_mem_cb cb, void *extra);
-bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                          paddr_t tot_size);
-void allocate_memory(struct domain *d, struct kernel_info *kinfo);
-int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo,
-                    const struct dt_device_node *node);
+
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
 
-unsigned int get_allocation_size(paddr_t size);
+int construct_hwdom(struct kernel_info *kinfo,
+                    const struct dt_device_node *node);
 
 /*
  * Helper to write an interrupts with the GIC format
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index f00fc388db..5759a3470a 100644
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
index 0000000000..b79e9fabfe
--- /dev/null
+++ b/xen/include/xen/fdt-domain-build.h
@@ -0,0 +1,43 @@
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
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+unsigned int get_allocation_size(paddr_t size);
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


