Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F39D27D1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840122.1255916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz6-00083Y-R7; Tue, 19 Nov 2024 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840122.1255916; Tue, 19 Nov 2024 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz6-00081r-NT; Tue, 19 Nov 2024 14:13:40 +0000
Received: by outflank-mailman (input) for mailman id 840122;
 Tue, 19 Nov 2024 14:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz5-0007nd-LM
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76edd0eb-a680-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:13:35 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa4833e9c44so120858066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:35 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:34 -0800 (PST)
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
X-Inumbo-ID: 76edd0eb-a680-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2ZWRkMGViLWE2ODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI1NjE1LjQ4MDIyNiwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025615; x=1732630415; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ0Mqo/VVVpodAnrCuD1RTBLK1YlIRTEt2DutSu9Zdo=;
        b=vTzq1uGNqGgh8V1tSlrGUWNrlX55A5fLwVnzuhTzjxC16mEk3ENOB0po7s9C2QWMgB
         VZxlIAZdiiLak8B7LvC/K9tAcrpuxm80Hr7BWNt/zklcWtu5hYUQ++1pAbe0miipRlMY
         3VqGMjaXHN+1Io9iSAtTM8CAzgFb7+evP0nr6g2pOApkXYIH11ZyrtmYleyd0v32KcFA
         EJCke2ZZEJyYCfAKMKtlkpumKouT38ZBso3rLBypbW546c0d7IqiP0FLT+vAIwk9i7NN
         FAY/ghUps+S0MjxPQgIlD/JRJMZMSOQNb5BtlpPoxr6F8yLInqgdj5NGkXUrf1862p/N
         SdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025615; x=1732630415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZ0Mqo/VVVpodAnrCuD1RTBLK1YlIRTEt2DutSu9Zdo=;
        b=gFvYIRfeMTRbRJUjIGxTBaLQKmrZXbRIfTQyH3S7vGmrWrWno8OvFjZP5BxKa3h5X9
         rC+tWx3vsQseFI+OMfrVEc2WvUKBi0FpWD3txInE556ivUSleOUCcESivq8QoHGZEHS3
         kzLdahKb6XIoIgIDlUCfQH6NMX3fbGRjZJebLSeeyklPycxDtUxyoLehkNQrT+H/412G
         Ww95Q2NxoZLA+vX8+MnUwhJUOzoZmkqyRzdXfmTa+v93+8CDDVUIGDmddDzdDZ3z8wAL
         LuzC4mG9T6urkoFDcCHLhAve70tKZ/2f6EW5w00rgXX7erStBtTay6w5zbsTBCy8RLo0
         xdcA==
X-Gm-Message-State: AOJu0Yz7Uw91Nwjjj5CpLW+wVxEFrpMp8hagNwRHDCCKa15Me80s6q8H
	IomhAEzjI47/W9IDyv0ykcVlB5GNDT138ZeO1V7DRCatIEYx0f0UwqgfHYiLStO8ec1doT8vNHQ
	u
X-Google-Smtp-Source: AGHT+IET27SpmU1fFtZs0y0db25/+nd5qOZnnd+Rz1y7eohCrN5Gl7QJHDmK6KH6QMxOO3LdODhs5Q==
X-Received: by 2002:a17:907:3689:b0:a9e:8612:eeca with SMTP id a640c23a62f3a-aa48352b54bmr1502734566b.48.1732025614626;
        Tue, 19 Nov 2024 06:13:34 -0800 (PST)
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
Subject: [PATCH v10 02/12] xen/arm: add initial support for LLC coloring on arm64
Date: Tue, 19 Nov 2024 15:13:19 +0100
Message-ID: <20241119141329.44221-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
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
 xen/arch/arm/include/asm/processor.h | 16 ++++++
 xen/arch/arm/llc-coloring.c          | 78 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  3 ++
 xen/common/llc-coloring.c            |  2 +-
 xen/include/xen/llc-coloring.h       |  4 ++
 9 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/llc-coloring.c

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 0fe3830c40..b608284e9b 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -111,6 +111,20 @@ Auto-probing of LLC specs
 
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
index 15b2e4a227..7f0712e674 100644
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
index 8e02410465..ef33ea198c 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -18,6 +18,22 @@
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
+#define CSSELR_LEVEL_MASK  _AC(0x7, UL)
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
index 0000000000..a7e0907816
--- /dev/null
+++ b/xen/arch/arm/llc-coloring.c
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Last Level Cache (LLC) coloring support for ARM
+ *
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ * Copyright (C) 2024, Minerva Systems SRL
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
index 71ebaa77ca..84fecaabea 100644
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
index 29b75e0e0d..45b001b105 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -11,7 +11,7 @@
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
 
-static bool __ro_after_init llc_coloring_enabled;
+bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
 static unsigned int __initdata llc_size;
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 6ccf4613c2..ad2525e153 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -12,10 +12,14 @@
 #include <public/domctl.h>
 
 #ifdef CONFIG_LLC_COLORING
+extern bool llc_coloring_enabled;
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


