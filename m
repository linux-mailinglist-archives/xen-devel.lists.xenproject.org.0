Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA88B9F00
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715948.1117947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zii-0006nz-0G; Thu, 02 May 2024 16:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715948.1117947; Thu, 02 May 2024 16:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zih-0006ij-Mg; Thu, 02 May 2024 16:55:43 +0000
Received: by outflank-mailman (input) for mailman id 715948;
 Thu, 02 May 2024 16:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zif-0006N3-VL
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce01ee55-08a4-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 18:55:39 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-572babec735so938445a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:39 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:38 -0700 (PDT)
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
X-Inumbo-ID: ce01ee55-08a4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668939; x=1715273739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCgujxNjMSkmhKzG/UmU41GDMYeB6voszmPxr4Qdo+o=;
        b=Yl1jixmoGr0qtFNK9iMplMDmSp+DGO0hnjggMSKf/sqMTMZSDB7xOAnausgc5rCZE8
         fo9fpAD+1o0vFSfdt617ommsQaETQByiSL/qPaCbAmKQPSMlo/NsTlE5lbNku5JRn5kM
         9RReyMmnK0N2U1g10osGaSfARxqRyitC2ApoQT+zdsKtpEeBbqASDh5PdKpdOIn0PA+1
         HGD6U0TAveG9odokZ8sVSivxBjuIkMbwZORwmkXdqFFiCbzFyFlFnRit2LeWRfAJZ9lX
         XEYkE0ShYyllGrgO48kNwG9xRsmW2X0KWIkzcTT6Sk9JnIgYiCdPEhM2MBbGm/lQvsq0
         up9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668939; x=1715273739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCgujxNjMSkmhKzG/UmU41GDMYeB6voszmPxr4Qdo+o=;
        b=UnGxarK5N1LatJpnbiZYnbQSEsUiyurEcZ14Txe403xsexk6DXYA9ql5LDdi0NN4Hk
         2bHxHVpsFCwsngGyWfF4PVQwNPvy0BKj8eb7liMrS1WDAZM6jJXh8wBZKevsR/NnSUZY
         vo2EYJLTgA5bPefmeA3+LJ2qsPozSbmxAGebT61+UCZzo/HvFJBjxAqOLpGfuJ4IqDZ2
         kQBz+PT+SwnnCM458n2DdAraoT9haiTDYHd1lT5zY9HmRsWvczFEAi2SSGEyxnwKSL1X
         cv6TcCAZAN1RaWtGYuCwsuzHrShRln8dVjCl3AzyGocsbZibk6DVAg+v+qFlwy/XLtYZ
         4HwQ==
X-Gm-Message-State: AOJu0YxAK4tRqGmYtgRqRGJr5uQMmzQ5DSKwq8ERb7eD9R5Pg2jzhXzf
	ew6uhQwFmRrjXzjo6bsLurKvRNCYEdGIq8QZc9WhI7+sjQZjig4fEGaXvsFrWy5wQbh6eS++ANk
	Z
X-Google-Smtp-Source: AGHT+IFUMs2AimGGb+Nekd0DlA/Awn9vWPGIcCYkVDdvV6g6eekdDqZurnlmAEDoy1p37abPu6BM/w==
X-Received: by 2002:a17:906:5604:b0:a58:fcd2:759c with SMTP id f4-20020a170906560400b00a58fcd2759cmr212910ejq.34.1714668938966;
        Thu, 02 May 2024 09:55:38 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 02/13] xen/arm: add initial support for LLC coloring on arm64
Date: Thu,  2 May 2024 18:55:22 +0200
Message-Id: <20240502165533.319988-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
 xen/arch/arm/llc-coloring.c          | 77 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  3 ++
 xen/common/llc-coloring.c            |  2 +-
 xen/include/xen/llc-coloring.h       |  4 ++
 9 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/llc-coloring.c

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index bcb45e9344..404262b728 100644
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
index f8139a773a..36dfdc53c4 100644
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
index 7b1350e2ef..18ae566521 100644
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
index 74f053c242..ca7519cf3b 100644
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
@@ -880,7 +881,12 @@ void __init create_domUs(void)
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
index 0000000000..66c8db2baf
--- /dev/null
+++ b/xen/arch/arm/llc-coloring.c
@@ -0,0 +1,77 @@
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
index d242674381..bbb3e1eea5 100644
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
@@ -776,6 +777,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    llc_coloring_init();
+
     setup_mm();
 
     vm_init();
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 65ed96603a..bcc651cc10 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -10,7 +10,7 @@
 
 #define NR_LLC_COLORS          (1 << CONFIG_MAX_LLC_COLORS_ORDER)
 
-static bool __ro_after_init llc_coloring_enabled;
+bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
 static unsigned int __initdata llc_size;
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index c60c8050c5..67b27c995b 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -11,10 +11,14 @@
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
2.34.1


