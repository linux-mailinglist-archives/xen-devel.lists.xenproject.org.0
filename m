Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323229F51A8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859574.1271707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb1y-0006ZE-52; Tue, 17 Dec 2024 17:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859574.1271707; Tue, 17 Dec 2024 17:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb1y-0006V4-1C; Tue, 17 Dec 2024 17:06:46 +0000
Received: by outflank-mailman (input) for mailman id 859574;
 Tue, 17 Dec 2024 17:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb1w-0006B0-K8
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:44 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a6bfb08-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:43 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so9612786a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:43 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:42 -0800 (PST)
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
X-Inumbo-ID: 4a6bfb08-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455203; x=1735060003; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRiXjScTKjjwC6ubbpUmf/5GyGMeNLHHwHKs6KCqd38=;
        b=T6BomwBXqEi05TR8U4IufFgmeqcFjTaAmxznVFo6TrfqdNTSbgzWPOSTA2bdL0vdht
         O1UhGcSbrQDqH5QYwDdtoOzDmEDkd9ubZoHNeBOYh06mE0N4EC9aCFW5QwZ6iZ81LSOK
         qDwNll9SnPV/EzBw/BAdlmhj4IfBR/JoVQ2g0UEtPRyP2SC/sPaHLWPkQY56zbfqMpFS
         W5mP/LbVdB1i0znVMiH/gYLUeNKTSntNZsI/XpjcUHGz3c7yx/u0J0QTYneb1JBLOsMc
         WsCu3pivm1i+8yAbfPrtNK+DDglpqKiPgkXKCxKTdcfmon63RDpEWNPCQ2URTpviXt6E
         B85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455203; x=1735060003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRiXjScTKjjwC6ubbpUmf/5GyGMeNLHHwHKs6KCqd38=;
        b=Aqu26L1WFobo5SQwbT0E3gJp7jWGQ4txXE2NKjH8ILS7x3vBX0eLevf/5W7FeivwhR
         6FA7XVaWy2Q15T0kpLFoqsKv+cON+0QQp1xHInZR3mFwZCRU6HE5ecAj/lFUn5n8syOI
         97y0kpz2PkrIsMH3xrcuye00ikQwhWjQClIp+XZJRPW/juwKRyJW5kaYSZxdDfFO0Pjf
         x042tUP8Qg7qAF/9cTdB8KHFYaxKUHVpvaaST4vM1HQweIIy35hqeHUbVCJ92KnYEAns
         DKNMK22omE6h74V9lWX8ShqTrVK10s4OFtOpyyH4d1sQcozO7CyHZZDKhFfqMZntRxKC
         QF7g==
X-Gm-Message-State: AOJu0YwEWQfeJEBDNnX/J5DCr9wZTZoRlqMQiiocgSkriZFdAF9McFMS
	nWBB2osV5dIY9GfYqcyZMF3k0aUeGNnwGMF0cMfFnsYUCiOuZS5hE3BNx15YHYqOK63K085sRRQ
	oew4=
X-Gm-Gg: ASbGncvgMfuteaIfmTdHSIkmZw2jv9zelYjlfAQaNnHHCryH8B0u7ThBns/H9CwqtmF
	TL3UD8Zd7Nat48Rg1MDQll3pWt6gquxcF53//962EnA7vLhhpIdUo8i9fQiZM2dQZQCPdDbv69Z
	hUwDCih3xxZamvT3IpLoaT0jYnwVnjZe78F80mxBYcgYcbNRNN7Qy9MlP5Jxo8O6zxv91S3SPMW
	brXpQEY2GX1vY7NBA7e6YsP1BUfCqqlikv3zRpvY6KR+IcMbh+R78LI56aLNF3fn3DnegBOxjEB
	n9w9/k0omS5OHgWa47qIpazev4Jr3iD5jj38j4HvEE4sYyzSQB8Lix2drkw=
X-Google-Smtp-Source: AGHT+IG8/f8xMijmze2k8W3XnEhE7dCYgbw/N1p0uKnCR58cGxdUxzFjMwod1mbqor/6uSqlFXmRqg==
X-Received: by 2002:a17:907:2d8e:b0:aa6:a05c:b076 with SMTP id a640c23a62f3a-aabdb3be7d5mr449039966b.26.1734455202735;
        Tue, 17 Dec 2024 09:06:42 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v13 02/12] xen/arm: add initial support for LLC coloring on arm64
Date: Tue, 17 Dec 2024 18:06:27 +0100
Message-ID: <20241217170637.233097-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
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
v13:
- no changes
v12:
- fixed build errors
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
 xen/common/llc-coloring.c            |  4 +-
 xen/include/xen/llc-coloring.h       |  6 +++
 9 files changed, 128 insertions(+), 1 deletion(-)
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
index 604aba4996..c5e7b74733 100644
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
index 0000000000..1c7b92bc45
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
+
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
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
index 545702d8a3..5f1993ffed 100644
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
@@ -334,6 +335,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    llc_coloring_init();
+
     setup_mm();
 
     vm_init();
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 335a907296..b034c0169c 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -8,6 +8,8 @@
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/types.h>
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
 
@@ -19,7 +21,7 @@
 static int8_t __initdata opt_llc_coloring = -1;
 boolean_param("llc-coloring", opt_llc_coloring);
 
-static bool __ro_after_init llc_coloring_enabled;
+bool __ro_after_init llc_coloring_enabled;
 
 static unsigned int __initdata llc_size;
 size_param("llc-size", llc_size);
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 0acd8d0ad6..a3ebb17186 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -8,13 +8,19 @@
 #ifndef __XEN_LLC_COLORING_H__
 #define __XEN_LLC_COLORING_H__
 
+#include <xen/types.h>
+
 struct domain;
 
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


