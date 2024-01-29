Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F8840EE5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673063.1047231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI2-0006Dn-Iu; Mon, 29 Jan 2024 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673063.1047231; Mon, 29 Jan 2024 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI2-00067g-Em; Mon, 29 Jan 2024 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 673063;
 Mon, 29 Jan 2024 17:19:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI1-0005vY-2g
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897d3212-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:19 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d04f3d9332so11475611fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:19 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:18 -0800 (PST)
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
X-Inumbo-ID: 897d3212-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548759; x=1707153559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWZWToXQ8ShJksi8sO6nrYFAeFvPtEgXsN4D6Ih4w4M=;
        b=N7h8ofh4vNcJvAuAl+GtpIGq/F0uLrwq4X0NlzMfyWrhzLxk8c4ci8hXN1XjTJeflE
         Lwbz7aaeCHkPqAkLZHzN//Zhqbj9Xd6yXjIaj9IB9RrKqWcFjqxyKdNvaczusK9bHpCY
         ZX6C4tFiSdMhIQd0mU7hg2TU4OxMxD0VzLqOIxgZua2jv2WoTW90ed/D6V+yDwJzUFtx
         LYz8OLznlSUaY7RR7h1VbaTv4zZDZm9SBffl30QJM9Mxf27cYm0CNjFXBHxJWR1DHTl7
         V6Hwup6rfMVY/ag3UotIOxxnnUFhC/DywdHq5b7xUcSoIa4UxW7aKvMVobHv+ujZ02qI
         iPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548759; x=1707153559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWZWToXQ8ShJksi8sO6nrYFAeFvPtEgXsN4D6Ih4w4M=;
        b=E8hC6j7NqWtOrTE/8FKpMczgFxbg1YRzZssUciYi09vu4Xm9zOs380RZtK30tjVKy1
         /TfMPs/GuOhn1OWzoiTekaZ+yj8IEUg+ReJN581PsdQCrIJmc+SDiOdumQAoUnXpPpbk
         blkkBm4VlB4DcPZkAXN8pjsb8fqEu69ccz6/hC1GxIRPofuk15OC2gCJmy1c1Gs4Wve7
         nTgno/bI+JSKvOyZwjNkmVFVx+DoYpFYLEbj+nhEkGWPQ+rE1JGozypU57PKiUV/VUQl
         FVJNCPpHFvPjw/h8vDGqIKJYBNfXmjb1IPOy30AAyleOsTeljQEAr3RrFl90ebQphV+3
         UASw==
X-Gm-Message-State: AOJu0Yw52lnhXeMM3RKqr/l4xM5IQ2i9cVMgfwfhofyX+xD7vGgS+Bfn
	2+3LNXeMPnLJFNfpZYPZD+yUBEgm4oEwIec6jlW3yWYhbCDIefx4qq1cqOIKfmVyrjyON7OJ0rQ
	em1Y=
X-Google-Smtp-Source: AGHT+IE3Mu8k13ywcg8aZZoB34Z++ujFBvsu5KpGB9UD0c/Rz5sLZvuBZ10GgtiPkDmZprzjT7rJ2Q==
X-Received: by 2002:a2e:b705:0:b0:2cf:1c39:86eb with SMTP id j5-20020a2eb705000000b002cf1c3986ebmr4381850ljo.31.1706548758593;
        Mon, 29 Jan 2024 09:19:18 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 02/15] xen/arm: add initial support for LLC coloring on arm64
Date: Mon, 29 Jan 2024 18:17:58 +0100
Message-Id: <20240129171811.21382-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLC coloring needs to know the last level cache layout in order to make the
best use of it. This can be probed by inspecting the CLIDR_EL1 register,
so the Last Level is defined as the last level visible by this register.
Note that this excludes system caches in some platforms.

Static memory allocation and cache coloring are incompatible because static
memory can't be guaranteed to use only colors assigned to the domain.
Panic during DomUs creation when both are enabled.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v6:
- get_llc_way_size() now checks for at least separate I/D caches
v5:
- used - instead of _ for filenames
- moved static-mem check in this patch
- moved dom0 colors parsing in next patch
- moved color allocation and configuration in next patch
- moved check_colors() in next patch
- colors are now printed in short form
v4:
- added "llc-coloring" cmdline option for the boot-time switch
- dom0 colors are now checked during domain init as for any other domain
- fixed processor.h masks bit width
- check for overflow in parse_color_config()
- check_colors() now checks also that colors are sorted and unique
---
 docs/misc/cache-coloring.rst         | 11 ++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/Makefile                |  1 +
 xen/arch/arm/dom0less-build.c        |  6 +++
 xen/arch/arm/include/asm/processor.h | 16 ++++++
 xen/arch/arm/llc-coloring.c          | 75 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  3 ++
 7 files changed, 113 insertions(+)
 create mode 100644 xen/arch/arm/llc-coloring.c

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 9fe01e99e1..0535b5c656 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -85,3 +85,14 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``llc-way-size``     | set the LLC way size          |
 +----------------------+-------------------------------+
+
+Known issues and limitations
+****************************
+
+"xen,static-mem" isn't supported when coloring is enabled
+#########################################################
+
+In the domain configuration, "xen,static-mem" allows memory to be statically
+allocated to the domain. This isn't possible when LLC coloring is enabled,
+because that memory can't be guaranteed to use only colors assigned to the
+domain.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1a..55143f86a9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_LLC_COLORING
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 33c677672f..c9a1cd298d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..1142f7f74a 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -5,6 +5,7 @@
 #include <xen/grant_table.h>
 #include <xen/iocap.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/llc-coloring.h>
 #include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/sizes.h>
@@ -879,7 +880,12 @@ void __init create_domUs(void)
             panic("No more domain IDs available\n");
 
         if ( dt_find_property(node, "xen,static-mem", NULL) )
+        {
+            if ( llc_coloring_enabled )
+                panic("LLC coloring and static memory are incompatible\n");
+
             flags |= CDF_staticmem;
+        }
 
         if ( dt_property_read_bool(node, "direct-map") )
         {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 8e02410465..336933ee62 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -18,6 +18,22 @@
 #define CTR_IDC_SHIFT       28
 #define CTR_DIC_SHIFT       29
 
+/* CCSIDR Current Cache Size ID Register */
+#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
+#define CCSIDR_NUMSETS_SHIFT            13
+#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, ULL)
+#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
+#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, ULL)
+
+/* CSSELR Cache Size Selection Register */
+#define CSSELR_LEVEL_MASK  _AC(0x7, UL)
+#define CSSELR_LEVEL_SHIFT 1
+
+/* CLIDR Cache Level ID Register */
+#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
+#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
+#define CLIDR_CTYPEn_LEVELS   7
+
 #define ICACHE_POLICY_VPIPT  0
 #define ICACHE_POLICY_AIVIVT 1
 #define ICACHE_POLICY_VIPT   2
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
new file mode 100644
index 0000000000..eee1e80e2d
--- /dev/null
+++ b/xen/arch/arm/llc-coloring.c
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Last Level Cache (LLC) coloring support for ARM
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ */
+#include <xen/llc-coloring.h>
+#include <xen/types.h>
+
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+
+/* Return the LLC way size by probing the hardware */
+unsigned int __init get_llc_way_size(void)
+{
+    register_t ccsidr_el1;
+    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
+    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
+    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
+    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
+    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
+    unsigned int n, line_size, num_sets;
+
+    for ( n = CLIDR_CTYPEn_LEVELS; n != 0; n-- )
+    {
+        uint8_t ctype_n = (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
+                          CLIDR_CTYPEn_MASK;
+
+        /* At least separate I/D caches (see Arm ARM DDI 0487H.a D13.2.27) */
+        if ( ctype_n > 0b011 )
+            break;
+    }
+
+    if ( n == 0 )
+        return 0;
+
+    WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
+
+    isb();
+
+    ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
+
+    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
+    line_size = 1U << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
+
+    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout */
+    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
+    {
+        ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
+        ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
+    }
+    /* Arm ARM: (Number of sets in cache) - 1 */
+    num_sets = ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numsets_mask) + 1;
+
+    printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num: %u)\n",
+           n, line_size, num_sets);
+
+    /* Restore value in CSSELR_EL1 */
+    WRITE_SYSREG(csselr_el1, CSSELR_EL1);
+    isb();
+
+    return line_size * num_sets;
+}
+
+void __init arch_llc_coloring_init(void) {}
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 59dd9bb25a..14cb023783 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -12,6 +12,7 @@
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
+#include <xen/llc-coloring.h>
 #include <xen/types.h>
 #include <xen/string.h>
 #include <xen/serial.h>
@@ -746,6 +747,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    llc_coloring_init();
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.34.1


