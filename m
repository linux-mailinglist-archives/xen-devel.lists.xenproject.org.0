Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE901678068
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483024.748918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3T-0000Wk-T7; Mon, 23 Jan 2023 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483024.748918; Mon, 23 Jan 2023 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3T-0000RA-PX; Mon, 23 Jan 2023 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 483024;
 Mon, 23 Jan 2023 15:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3S-00006V-Bh
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:18 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a0824ac-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:48:16 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id kt14so31671499ejc.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:16 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:15 -0800 (PST)
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
X-Inumbo-ID: 5a0824ac-9b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sITnfQ4HJpU2pnVbt8P3FE0rc8UsS7v3Y6FN0Y7K5Ec=;
        b=vXTZorvaFk7tPS6jRfp7QIKsrCHMKF9khIGSKPHjfyZ5k58PzWiuOwCPFjg3/4r58q
         EpK9luHJgPdCU2C2nI/vgHL5aK0H6yyURP5ln2b2IRo8mPmcH4o9oXjMgl+4DfTcpMLz
         st0HY028TtxFNUD4T1QO7Ck3IRqiF/02d4ZwsnsbXM09jekhAEvvwJAWPb6o9teZG9IZ
         EhSbsiRQqB15fJ65gIh+BP+LeybR/6hHLuPHshMimBqaFqekSoiQOs/4CT0Ac8ObpgC9
         7CeI/eqHPJdq3ilu4XCFE8MuM7ciZhdaYsaYHlIEeWkAQxSTTPSc97ltBMS1fkKpzYpD
         Sz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sITnfQ4HJpU2pnVbt8P3FE0rc8UsS7v3Y6FN0Y7K5Ec=;
        b=qqQEJ2FEwU21ad/D3Jp8Z+qkGDeCgkuqmc+O2yLpUBkd9UFdA2+af+n56gsVxTKEz0
         jGr/UN/DzNLPZAQQyLU2dyQ7UHNE+iTWoSW5Q3Spd5Nu2qFHs+DDR2zPOPfde8MgT74/
         jwscX5ke/mZcUzDC5Mcqs60hWgE0kMFCq82ogSR4AdLnAuGCLcqhAuHP0riT11AcjWDY
         ML9i6HdVbZKaWGIGh6cNhm78aPjnO8BT9kfodsq9vOeECWmcNhclouaK5NCJCR5OCXUh
         KDRPqP8WTDEZmSYBC+HIWrJKq+AAsN55LLUE3xxkesKJbJ1UX+OxekBHWJ61M38oj/s8
         VjVQ==
X-Gm-Message-State: AFqh2koDccIR9Oum7OnSvV8y2PuIYUrm+zvYokTFGMcZbjLjksJVtDtj
	p9hHHQ7ZGPqx06BZAovyosi3ApmrM3pSS/8e
X-Google-Smtp-Source: AMrXdXuTeuyZHvSU1zURldM42WGe0cZ6rMCvu9LEzN1p6IVaH8Iv1xR+F3P9p6aDuAIgIKU8uAgFXg==
X-Received: by 2002:a17:906:2542:b0:877:6e07:92df with SMTP id j2-20020a170906254200b008776e0792dfmr20135507ejb.15.1674488895626;
        Mon, 23 Jan 2023 07:48:15 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 02/11] xen/arm: add cache coloring initialization
Date: Mon, 23 Jan 2023 16:47:26 +0100
Message-Id: <20230123154735.74832-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit implements functions declared in the LLC coloring common header
for arm64 and adds documentation. It also adds two command line options: a
runtime switch for the cache coloring feature and the LLC way size
parameter.

The feature init function consists of an auto probing of the cache layout
necessary to retrieve the LLC way size which is used to compute the number
of platform colors. It also adds a debug-key to dump general cache coloring
info.

The domain init function, instead, allocates default colors if needed and
checks the provided configuration for errors.

Note that until this patch, there are no implemented methods for actually
configuring cache colors for domains and all the configurations fall back
to the default one.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- added "llc-coloring" cmdline option for the boot-time switch
- dom0 colors are now checked during domain init as for any other domain
- fixed processor.h masks bit width
- check for overflow in parse_color_config()
- check_colors() now checks also that colors are sorted and unique
---
 docs/misc/arm/cache-coloring.rst        | 105 +++++++++
 docs/misc/xen-command-line.pandoc       |  37 ++++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/include/asm/llc_coloring.h |  36 ++++
 xen/arch/arm/include/asm/processor.h    |  16 ++
 xen/arch/arm/llc_coloring.c             | 272 ++++++++++++++++++++++++
 xen/arch/arm/setup.c                    |   7 +
 8 files changed, 475 insertions(+)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/include/asm/llc_coloring.h
 create mode 100644 xen/arch/arm/llc_coloring.c

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
new file mode 100644
index 0000000000..0244d2f606
--- /dev/null
+++ b/docs/misc/arm/cache-coloring.rst
@@ -0,0 +1,105 @@
+Xen cache coloring user guide
+=============================
+
+The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
+partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
+
+In order to enable and use it, few steps are needed.
+
+In Kconfig:
+
+- Enable LLC coloring.
+
+        CONFIG_LLC_COLORING=y
+- If needed, change the maximum number of colors (refer to menuconfig help for
+  value meaning and when it should be changed).
+
+        CONFIG_NR_LLC_COLORS=<n>
+
+Compile Xen and the toolstack and then:
+
+- Set the `llc-coloring=on` command line option.
+- Set `Coloring parameters and domain configurations`_.
+
+Background
+**********
+
+Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
+to each core (hence using multiple cache units), while the last level is shared
+among all of them. Such configuration implies that memory operations on one
+core (e.g. running a DomU) are able to generate interference on another core
+(e.g .hosting another DomU). Cache coloring allows eliminating this
+mutual interference, and thus guaranteeing higher and more predictable
+performances for memory accesses.
+The key concept underlying cache coloring is a fragmentation of the memory
+space into a set of sub-spaces called colors that are mapped to disjoint cache
+partitions. Technically, the whole memory space is first divided into a number
+of subsequent regions. Then each region is in turn divided into a number of
+subsequent sub-colors. The generic i-th color is then obtained by all the
+i-th sub-colors in each region.
+
+.. raw:: html
+
+    <pre>
+                            Region j            Region j+1
+                .....................   ............
+                .                     . .
+                .                       .
+            _ _ _______________ _ _____________________ _ _
+                |     |     |     |     |     |     |
+                | c_0 | c_1 |     | c_n | c_0 | c_1 |
+           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
+                    :                       :
+                    :                       :...         ... .
+                    :                            color 0
+                    :...........................         ... .
+                                                :
+          . . ..................................:
+    </pre>
+
+There are two pragmatic lesson to be learnt.
+
+1. If one wants to avoid cache interference between two domains, different
+   colors needs to be used for their memory.
+
+2. Color assignment must privilege contiguity in the partitioning. E.g.,
+   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
+   assigning colors (0,2) to I and (1,3) to J.
+
+How to compute the number of colors
+***********************************
+
+To compute the number of available colors for a specific platform, the size of
+an LLC way and the page size used by Xen must be known. The first parameter can
+be found in the processor manual or can be also computed dividing the total
+cache size by the number of its ways. The second parameter is the minimum
+amount of memory that can be mapped by the hypervisor, thus dividing the way
+size by the page size, the number of total cache partitions is found. So for
+example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up
+to 16 colors when pages are 4 KiB in size.
+
+Cache layout is probed automatically by Xen itself, but a possibility to
+manually set the way size it's left for the user to overcome failing situations
+or for debugging/testing purposes. See `Coloring parameters and domain
+configurations`_ section for more information on that.
+
+Coloring parameters and domain configurations
+*********************************************
+
+LLC way size (as previously discussed) can be set using the appropriate command
+line parameter. See the relevant documentation in
+"docs/misc/xen-command-line.pandoc".
+
+**Note:** If no color configuration is provided for a domain, the default one,
+which corresponds to all available colors, is used instead.
+
+Known issues and limitations
+****************************
+
+"xen,static-mem" isn't supported when coloring is enabled
+#########################################################
+
+In the domain configuration, "xen,static-mem" allows memory to be statically
+allocated to the domain. This isn't possibile when LLC coloring is enabled,
+because that memory can't be guaranteed to use only colors assigned to the
+domain.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 923910f553..eb105c03af 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -908,6 +908,15 @@ Controls for the dom0 IOMMU setup.
 
 Specify a list of IO ports to be excluded from dom0 access.
 
+### dom0-llc-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `All available LLC colors`
+
+Specify dom0 LLC color configuration. This options is available only when
+`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
+colors are chosen and the user is warned on Xen serial console.
+
 ### dom0_max_vcpus
 
 Either:
@@ -1645,6 +1654,34 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
 in hypervisor context to be able to dump the Last Interrupt/Exception To/From
 record with other registers.
 
+### llc-coloring (arm64)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable LLC coloring support at runtime. This options is
+available only when `CONFIG_LLC_COLORING` is enabled. See the general
+cache coloring documentation for more info.
+
+### llc-way-size (arm64)
+> `= <size>`
+
+> Default: `Obtained from the hardware`
+
+Specify the way size of the Last Level Cache. This options is available only
+when `CONFIG_LLC_COLORING` is enabled. It is an optional, expert-only parameter
+and it is used to calculate the number of available LLC colors on the platform.
+It can be obtained by dividing the total LLC size by the number of its
+associative ways.
+By default, the value is automatically computed by probing the hardware, but in
+case of specific needs, it can be manually set. Those include failing probing
+and debugging/testing purposes so that it's possibile to emulate platforms with
+different number of supported colors.
+An important detail to highlight is that the current implementation of the
+cache coloring technique requires the number of colors to be a power of 2, and
+consequently, also the LLC way size must be so. A value that doesn't match this
+requirement is aligned down to the previous power of 2.
+
 ### lock-depth-size
 > `= <integer>`
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..97eac24ee3 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select ARM_EFI
 	select HAS_FAST_MULTIPLY
+	select HAS_LLC_COLORING
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b..7f5cb8ef26 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_LLC_COLORING) += llc_coloring.o
 obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/include/asm/llc_coloring.h b/xen/arch/arm/include/asm/llc_coloring.h
new file mode 100644
index 0000000000..c7985c8fd0
--- /dev/null
+++ b/xen/arch/arm/include/asm/llc_coloring.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Last Level Cache (LLC) coloring support for ARM
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *    Carlo Nonato <carlo.nonato@minervasys.tech>
+ */
+#ifndef __ASM_ARM_COLORING_H__
+#define __ASM_ARM_COLORING_H__
+
+#include <xen/init.h>
+
+#ifdef CONFIG_LLC_COLORING
+
+bool __init llc_coloring_init(void);
+
+#else /* !CONFIG_LLC_COLORING */
+
+static inline bool __init llc_coloring_init(void) { return true; }
+
+#endif /* CONFIG_LLC_COLORING */
+
+#endif /* __ASM_ARM_COLORING_H__ */
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
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1dd81d7d52..1c5f6d6e7a 100644
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
+/* CCSELR Cache Size Selection Register */
+#define CCSELR_LEVEL_MASK  _AC(0x7, UL)
+#define CCSELR_LEVEL_SHIFT 1
+
+/* CLIDR Cache Level ID Register */
+#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
+#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
+#define CLIDR_CTYPEn_LEVELS   7
+
 #define ICACHE_POLICY_VPIPT  0
 #define ICACHE_POLICY_AIVIVT 1
 #define ICACHE_POLICY_VIPT   2
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
new file mode 100644
index 0000000000..44b601915e
--- /dev/null
+++ b/xen/arch/arm/llc_coloring.c
@@ -0,0 +1,272 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Last Level Cache (LLC) coloring support for ARM
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *    Carlo Nonato <carlo.nonato@minervasys.tech>
+ */
+#include <xen/bitops.h>
+#include <xen/errno.h>
+#include <xen/keyhandler.h>
+#include <xen/llc_coloring.h>
+#include <xen/param.h>
+#include <xen/types.h>
+
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+
+bool llc_coloring_enabled;
+boolean_param("llc-coloring", llc_coloring_enabled);
+
+/* Size of an LLC way */
+static unsigned int __ro_after_init llc_way_size;
+size_param("llc-way-size", llc_way_size);
+/* Number of colors available in the LLC */
+static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
+/* Mask to extract coloring relevant bits */
+static paddr_t __ro_after_init addr_col_mask;
+
+static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init dom0_num_colors;
+
+/*
+ * Parse the coloring configuration given in the buf string, following the
+ * syntax below.
+ *
+ * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
+ * RANGE               ::= COLOR-COLOR
+ *
+ * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
+ */
+static int parse_color_config(const char *buf, unsigned int *colors,
+                              unsigned int *num_colors)
+{
+    const char *s = buf;
+
+    if ( !colors || !num_colors )
+        return -EINVAL;
+
+    *num_colors = 0;
+
+    while ( *s != '\0' )
+    {
+        if ( *s != ',' )
+        {
+            unsigned int color, start, end;
+
+            start = simple_strtoul(s, &s, 0);
+
+            if ( *s == '-' )    /* Range */
+            {
+                s++;
+                end = simple_strtoul(s, &s, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( start > end || (end - start) > UINT_MAX - *num_colors ||
+                 *num_colors + (end - start) >= nr_colors )
+                return -EINVAL;
+            for ( color = start; color <= end; color++ )
+                colors[(*num_colors)++] = color;
+        }
+        else
+            s++;
+    }
+
+    return *s ? -EINVAL : 0;
+}
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_colors, &dom0_num_colors);
+}
+custom_param("dom0-llc-colors", parse_dom0_colors);
+
+/* Return the LLC way size by probing the hardware */
+static unsigned int __init get_llc_way_size(void)
+{
+    register_t ccsidr_el1;
+    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
+    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
+    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
+    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
+    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
+    unsigned int n, line_size, num_sets;
+
+    for ( n = CLIDR_CTYPEn_LEVELS;
+          n != 0 && !((clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) & CLIDR_CTYPEn_MASK);
+          n-- );
+
+    if ( n == 0 )
+        return 0;
+
+    WRITE_SYSREG(((n - 1) & CCSELR_LEVEL_MASK) << CCSELR_LEVEL_SHIFT,
+                 CSSELR_EL1);
+    isb();
+
+    ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
+
+    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
+    line_size = 1 << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
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
+static bool check_colors(unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    if ( num_colors > nr_colors )
+        return false;
+
+    for ( i = 0; i < num_colors; i++ )
+        if ( colors[i] >= nr_colors ||
+             (i != num_colors - 1 && colors[i] >= colors[i + 1]) )
+            return false;
+
+    return true;
+}
+
+static void print_colors(unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    printk("[ ");
+    for ( i = 0; i < num_colors; i++ )
+        printk("%u ", colors[i]);
+    printk("]\n");
+}
+
+static void dump_coloring_info(unsigned char key)
+{
+    printk("'%c' pressed -> dumping LLC coloring general info\n", key);
+    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
+    printk("Number of LLC colors supported: %u\n", nr_colors);
+    printk("Address to LLC color mask: 0x%lx\n", addr_col_mask);
+}
+
+bool __init llc_coloring_init(void)
+{
+    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
+    {
+        printk(XENLOG_ERR
+               "Probed LLC way size is 0 and no custom value provided\n");
+        return false;
+    }
+
+    /*
+     * The maximum number of colors must be a power of 2 in order to correctly
+     * map them to bits of an address, so also the LLC way size must be so.
+     */
+    if ( llc_way_size & (llc_way_size - 1) )
+    {
+        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2.\n",
+               llc_way_size);
+        llc_way_size = 1U << flsl(llc_way_size);
+        printk(XENLOG_WARNING
+               "Using %u instead. Performances will be suboptimal\n",
+               llc_way_size);
+    }
+
+    nr_colors = llc_way_size >> PAGE_SHIFT;
+
+    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )
+    {
+        printk(XENLOG_ERR "Number of LLC colors (%u) not in range [2, %u]\n",
+               nr_colors, CONFIG_NR_LLC_COLORS);
+        return false;
+    }
+
+    addr_col_mask = (nr_colors - 1) << PAGE_SHIFT;
+
+    register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
+
+    return true;
+}
+
+static unsigned int *alloc_colors(unsigned int num_colors)
+{
+    unsigned int *colors = xmalloc_array(unsigned int, num_colors);
+
+    if ( !colors )
+        panic("Unable to allocate LLC colors\n");
+
+    return colors;
+}
+
+int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
+                             unsigned int num_colors)
+{
+    unsigned int i;
+
+    if ( is_domain_direct_mapped(d) )
+    {
+        printk(XENLOG_ERR
+               "LLC coloring and direct mapping are incompatible (%pd)\n", d);
+        return -EINVAL;
+    }
+
+    if ( !colors || num_colors == 0 )
+    {
+        printk(XENLOG_WARNING
+               "LLC color config not found for %pd. Using default\n", d);
+        colors = alloc_colors(nr_colors);
+        num_colors = nr_colors;
+        for ( i = 0; i < nr_colors; i++ )
+            colors[i] = i;
+    }
+
+    d->llc_colors = colors;
+    d->num_llc_colors = num_colors;
+
+    if ( !check_colors(d->llc_colors, d->num_llc_colors) )
+    {
+        /* d->llc_colors will be freed in domain_destroy() */
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
+        print_colors(d->llc_colors, d->num_llc_colors);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+void domain_llc_coloring_free(struct domain *d)
+{
+    xfree(d->llc_colors);
+}
+
+void domain_dump_llc_colors(struct domain *d)
+{
+    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
+    print_colors(d->llc_colors, d->num_llc_colors);
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
index 1f26f67b90..c04e5012f0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -12,6 +12,7 @@
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
+#include <xen/llc_coloring.h>
 #include <xen/types.h>
 #include <xen/string.h>
 #include <xen/serial.h>
@@ -1026,6 +1027,12 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    if ( llc_coloring_enabled )
+    {
+        if ( !llc_coloring_init() )
+            panic("Xen LLC coloring support: setup failed\n");
+    }
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.34.1


