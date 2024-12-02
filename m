Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB49E0946
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846762.1261910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9li-00073N-3y; Mon, 02 Dec 2024 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846762.1261910; Mon, 02 Dec 2024 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lh-0006yd-VZ; Mon, 02 Dec 2024 16:59:29 +0000
Received: by outflank-mailman (input) for mailman id 846762;
 Mon, 02 Dec 2024 16:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lg-0006wq-Tu
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca396b30-b0ce-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 17:59:27 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d0d71d7f00so3185832a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:27 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:26 -0800 (PST)
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
X-Inumbo-ID: ca396b30-b0ce-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158767; x=1733763567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOkVSMHCBjXldk0yaSWMOLuz0CcNMdAPNEbfMOACw4Y=;
        b=UA/DMkuxSNoEAhcOqW1TcLMcuaJDTpc//g+y2sfLZmzDM2s7/GuzjskQ34ojdtLfMd
         yTEP5Csbi2CplteQCrzR7T4RQVWjFmZbbCrIuPh1VILbOXNF9e+ZR0AkD9L+heh6MtM9
         qf3D5c+4re/WTisDKnJuyUBMVAQRCBJQTSbkHeWW5iqbNigluELcWFion2wzkqHkgPUT
         h4Y8nJIUpS5cyBrGeLyICQn98S5ee4pdMR1Nb+w9Byb/kUhuFMs7P6MQ86eZDCR9rt1O
         nXOwqyy4kpi/UtrdNcejFXDrfmT34MJsdoNmG7yiyW+lPrUku/sdZCv4jd4DdibZbJVy
         1tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158767; x=1733763567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOkVSMHCBjXldk0yaSWMOLuz0CcNMdAPNEbfMOACw4Y=;
        b=anw84XyU8RXW+OXEQ2vnoWt2Q3PXW7d3fwaDEuvhGl9aFOkjqTHLeDwdtJNMcriK/O
         XbG7/wMPuQn9vPvwtG3V0/Dp4y2VTJdXNC0/zUDSCeM2h58IC9DvRJx84OeTmTqePDea
         ai1rNfWdlvTMNhVvRsOwCorAopy0yi7nej5q8ove28Z+F1HTDl+LUtUWFqfk3R7oTGvA
         YoZDENqGNKRzAoSZbzOqZn6FgVOhtF6RpRZgxJnQfvhGHCeyybJZEemxdBMzcx3yLKET
         oWGZ4HBy9k+jwLRpd3Cpn2PSzX5rCv0dcMg3Ui3+E+lr/t8eOMrgOPSGDmC50KzSqOdr
         llYg==
X-Gm-Message-State: AOJu0YzigsdXlw+G69UAfKc5hB9l1f3qCWJ8+Mtgpdzs+WyR12B+nGHt
	GQ2ykpXCtyqOHa2a4LxTWgBNiinDRn2clUcFZkdRGkQ5+4YF9x78oxQkjfF3aixYTofETG+hsvm
	o
X-Gm-Gg: ASbGncsDwqdRBVmqnr+L4nnpGPzyvEIw1uRy3HRS0LFdl5WEPO1rQoC1bQA3zSN4XnN
	NOuJR/P6kinvIycuZLBjTtxq1PK1zllqMGbcSjul18WROKTkNJeZFNHVeO5Sxa67c5JGysDjF6z
	u4BsA5d36JDzvj78cWbH3PIO4BHIlAsUc+QVBBT5MKl74pVLdRC/xgfa93z8FOfWnVfrG8Kotkn
	kcJy98KZQS28riHLrkc4lJd259/oY3TOO5Fgt4H1CSEv7AbwH20RYFF89Iq2bMEtvNg3xR6Z+MS
	/Fs5xWelYfAGaX0TbZxH1KQt88MI5uqy3uGt63WDZvPSEqmmoR9q
X-Google-Smtp-Source: AGHT+IGHILtzOHKu/xnfwr24UkOR6vkT7e9vLWHdOFJmAPcnVR0/UyHLIlLBk551tmX0Tr4FlZMdcg==
X-Received: by 2002:a17:906:315b:b0:aa5:3853:553e with SMTP id a640c23a62f3a-aa58103dbb5mr2664708966b.47.1733158766635;
        Mon, 02 Dec 2024 08:59:26 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 02/12] xen/arm: add initial support for LLC coloring on arm64
Date: Mon,  2 Dec 2024 17:59:11 +0100
Message-ID: <20241202165921.249585-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v11:
- removed useless #define from processor.h
v10:
- moved CONFIG_NUMA check in arch/arm/Kconfig
v9:
- no changes
v8:
- no changes
v7:
- only minor changes
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
 docs/misc/cache-coloring.rst         | 14 +++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/Makefile                |  1 +
 xen/arch/arm/dom0less-build.c        |  6 +++
 xen/arch/arm/include/asm/processor.h | 15 ++++++
 xen/arch/arm/llc-coloring.c          | 79 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  3 ++
 xen/common/llc-coloring.c            |  2 +-
 xen/include/xen/llc-coloring.h       |  4 ++
 9 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/llc-coloring.c

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 371f21a0e7..12972dbb2c 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -113,6 +113,20 @@ Auto-probing of LLC specs
 
 LLC size and number of ways are probed automatically by default.
 
+In the Arm implementation, this is done by inspecting the CLIDR_EL1 register.
+This means that other system caches that aren't visible there are ignored.
+
 LLC specs can be manually set via the above command line parameters. This
 bypasses any auto-probing and it's used to overcome failing situations, such as
 flawed probing logic, or for debugging/testing purposes.
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
index 23bbc91aad..4ec9ef8334 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_LLC_COLORING if !NUMA
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..ccbfc61f88 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f328a044e9..d93a85434e 100644
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
@@ -890,7 +891,12 @@ void __init create_domUs(void)
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
index 8e02410465..60b587db69 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -18,6 +18,21 @@
 #define CTR_IDC_SHIFT       28
 #define CTR_DIC_SHIFT       29
 
+/* CCSIDR Current Cache Size ID Register */
+#define CCSIDR_LINESIZE_MASK            _AC(0x7, UL)
+#define CCSIDR_NUMSETS_SHIFT            13
+#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, UL)
+#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
+#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, UL)
+
+/* CSSELR Cache Size Selection Register */
+#define CSSELR_LEVEL_SHIFT 1
+
+/* CLIDR Cache Level ID Register */
+#define CLIDR_CTYPEn_SHIFT(n) (3 * ((n) - 1))
+#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
+#define CLIDR_CTYPEn_LEVELS   7
+
 #define ICACHE_POLICY_VPIPT  0
 #define ICACHE_POLICY_AIVIVT 1
 #define ICACHE_POLICY_VIPT   2
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
new file mode 100644
index 0000000000..6c8fa6b576
--- /dev/null
+++ b/xen/arch/arm/llc-coloring.c
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Last Level Cache (LLC) coloring support for ARM
+ *
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ * Copyright (C) 2024, Minerva Systems SRL
+ */
+#include <xen/init.h>
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
+                           CLIDR_CTYPEn_MASK;
+
+        /* Unified cache (see Arm ARM DDI 0487J.a D19.2.27) */
+        if ( ctype_n == 0b100 )
+            break;
+    }
+
+    if ( n == 0 )
+        return 0;
+
+    WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
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
+
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
+void __init arch_llc_coloring_init(void)
+{
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2e27af4560..568a49b274 100644
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
@@ -326,6 +327,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    llc_coloring_init();
+
     setup_mm();
 
     vm_init();
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 54d76e3aca..5139890e3d 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -16,7 +16,7 @@
  *  0: explicitly disabled through cmdline
  *  1: explicitly enabled through cmdline
  */
-static int8_t __ro_after_init llc_coloring_enabled = -1;
+int8_t __ro_after_init llc_coloring_enabled = -1;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
 static unsigned int __initdata llc_size;
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 0acd8d0ad6..ee0c58ab1c 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -11,10 +11,14 @@
 struct domain;
 
 #ifdef CONFIG_LLC_COLORING
+extern int8_t llc_coloring_enabled;
+
 void llc_coloring_init(void);
 void dump_llc_coloring_info(void);
 void domain_dump_llc_colors(const struct domain *d);
 #else
+#define llc_coloring_enabled false
+
 static inline void llc_coloring_init(void) {}
 static inline void dump_llc_coloring_info(void) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
-- 
2.43.0


