Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF0608E44
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428408.678497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGml-0002bw-9d; Sat, 22 Oct 2022 15:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428408.678497; Sat, 22 Oct 2022 15:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGml-0002Ys-5I; Sat, 22 Oct 2022 15:51:43 +0000
Received: by outflank-mailman (input) for mailman id 428408;
 Sat, 22 Oct 2022 15:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmj-0002Ir-90
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:41 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6993cab8-5221-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 17:51:39 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id u21so16364669edi.9
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:37 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:36 -0700 (PDT)
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
X-Inumbo-ID: 6993cab8-5221-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ninxl7zeTOLhM6GAnaxyPElcqi5G7SjegJNvFx79Nbc=;
        b=a7yjZpmIh+NPgVpmQ4LOTpYlC+ajUZTCNned8FpjQ6Bfl88T8wOaM5iXM0tnN+kYGZ
         X/C1sDj25h5P/QGrHHqK+XxoBiHnQ4stum+01cNp+AGCOYqbw5C1t4k01h7RFAoSpsRr
         vrRTixpBo7j1TmUT87JECol3ONuirv5uSmPmagr/B4nsY8jNtDnemjijmOWsiQ/Tbwdp
         nn3AsPbv+d+BsNhkR4HLw008peu6vUrbLXsFvjn64WncHwLyBfTbqxwEVFMuqHr7ojin
         bUMTNTagGWBbV9xrxCnClgaS/9X5icVARl9Oyxyz18fVYtD/idoOg2lXQmlnqmhMAfia
         lSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ninxl7zeTOLhM6GAnaxyPElcqi5G7SjegJNvFx79Nbc=;
        b=JfQusgq68//wwYimQuKnQ7JfMWCW14cRdUUgYCJBRpJR3UfUBRtCfA3YMi6L6xUt28
         NVwKOadDjeh9gahLKC7w6+YJSgPQ/NsHSKizhX0HJIJdAdn6nSMHLmppWrZ06w0sz5CR
         4xOgIOjJKq7QXfLk03AsGWSuOysWdFz6rd0FvsD2gtyc1u/e5SUbDKK+fItIRQPOVXIf
         2LXod2DRSELhRsx3RxkP7KFqm6dal7ToFKCNS3SXGp1PXvp0+EIZr720wLPpgMavxaY7
         OJo5lCRy3pCLRfUfyD37uiUW0cGG3d6sCeCI1lyWKmNMz2nbTTMcH810yLIMOl7/ACLa
         GlEA==
X-Gm-Message-State: ACrzQf0UuGCsi7+Sljll/YUdiEcuqD8jIV6avCJ2xHztALlFJ0mOdf4/
	+y2LscXU3RPsNxSKwnbKvnekEbGynyIBBA==
X-Google-Smtp-Source: AMsMyM7i71NKIiUcFaiGbkODGKyUICgpneseUE2cch5z2qksy95TN57zoUZBaQnk2RokXBoBoXiFZg==
X-Received: by 2002:a17:907:6d84:b0:78d:f2b0:14c8 with SMTP id sb4-20020a1709076d8400b0078df2b014c8mr19729711ejc.749.1666453896749;
        Sat, 22 Oct 2022 08:51:36 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 1/9] xen/arm: add cache coloring initialization
Date: Sat, 22 Oct 2022 17:51:12 +0200
Message-Id: <20221022155120.7000-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the cache coloring support initialization, Kconfig
options, command line parameters and the initial documentation.
The initialization consists of an auto probing of the cache layout
necessary to retrieve the LLC way size which is used to compute the
number of available colors. The Dom0 colors are then initialized with
default colors (all available ones) if not provided from the command line,
and they are checked for bad configuration.

It also adds a debug-key to dump general cache coloring info.
This includes LLC way size, total available colors and the mask used to
extract colors from physical addresses.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v3:
- HAS_CACHE_COLORING config added
- fixed CONFIG_MAX_CACHE_COLORS range and explained why such range
- __ro_after_init for coloring globals
- stub functions in case of coloring disabled, in coloring.c (like in v1)
- check number of colors in range [2, CONFIG_MAX_CACHE_COLORS] at runtime
- LLC way size and number of colors must be a power of 2
  (explained in docs and checked at runtime)
---
 docs/misc/arm/cache-coloring.rst     | 135 +++++++++++++++
 docs/misc/xen-command-line.pandoc    |  26 +++
 xen/arch/arm/Kconfig                 |  22 +++
 xen/arch/arm/Makefile                |   1 +
 xen/arch/arm/coloring.c              | 243 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/coloring.h  |  38 +++++
 xen/arch/arm/include/asm/processor.h |  16 ++
 xen/arch/arm/setup.c                 |   7 +
 xen/common/Kconfig                   |   3 +
 9 files changed, 491 insertions(+)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/coloring.c
 create mode 100644 xen/arch/arm/include/asm/coloring.h

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
new file mode 100644
index 0000000000..b0f9a2e917
--- /dev/null
+++ b/docs/misc/arm/cache-coloring.rst
@@ -0,0 +1,135 @@
+Xen cache coloring user guide
+=============================
+
+The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
+partition for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
+
+In order to enable and use it, few steps are needed.
+
+- Enable expert mode in Xen configuration file.
+
+        CONFIG_EXPERT=y
+- Enable cache coloring in Xen configuration file.
+
+        CONFIG_CACHE_COLORING=y
+- If needed, change the maximum number of colors in Xen configuration file
+  (refer to menuconfig help for value meaning and when it should be changed).
+
+        CONFIG_MAX_CACHE_COLORS=<n>
+- Assign colors to Dom0 using the `Color selection format`_ (see
+  `Coloring parameters`_ for more documentation pointers).
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
+cache size by the number of its ways. The second parameter is the minimum amount
+of memory that can be mapped by the hypervisor, thus dividing the way size by
+the page size, the number of total cache partitions is found. So for example,
+an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up to 16
+colors when pages are 4 KiB in size.
+
+Cache layout is probed automatically by Xen itself, but a possibility to
+manually set the way size it's left for the user to overcome failing situations
+or for debugging/testing purposes. See `Coloring parameters`_ section for more
+information on that.
+
+Colors selection format
+***********************
+
+Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
+the color selection can be expressed using the same syntax. In particular a
+comma-separated list of colors or ranges of colors is used.
+Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
+sides.
+
+Note that:
+ - no spaces are allowed between values.
+ - no overlapping ranges or duplicated colors are allowed.
+ - values must be written in ascending order.
+
+Examples:
+
++---------------------+-----------------------------------+
+|**Configuration**    |**Actual selection**               |
++---------------------+-----------------------------------+
+|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
++---------------------+-----------------------------------+
+|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
++---------------------+-----------------------------------+
+|  0                  | [0]                               |
++---------------------+-----------------------------------+
+
+Coloring parameters
+*******************
+
+LLC way size (as previously discussed) and Dom0 colors can be set using the
+appropriate command line parameters. See the relevant documentation in
+"docs/misc/xen-command-line.pandoc".
+
+Known issues and limitations
+****************************
+
+Cache coloring is intended only for embedded systems
+####################################################
+
+The current implementation aims to satisfy the need of predictability in
+embedded systems with small amount of memory to be managed in a colored way.
+Given that, some shortcuts are taken in the development. Expect worse
+performances on larger systems.
+
+The maximum number of colors supported is 32768
+###############################################
+
+The upper bound of the CONFIG_MAX_CACHE_COLORS range (which is an upper bound
+too) is set to 2^15 = 32768 colors because of some limitation on the domain
+configuration structure size used in domain creation. "uint16_t" is the biggest
+integer type that fit the constraint and 2^15 is the biggest power of 2 it can
+easily represent. This value is big enough for the generic case, though.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 68389843b2..3f04414134 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -903,6 +903,14 @@ Controls for the dom0 IOMMU setup.
 
     Incorrect use of this option may result in a malfunctioning system.
 
+### dom0-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `All available colors`
+
+Specify dom0 color configuration. If the parameter is not set, all available
+colors are chosen and the user is warned on Xen's serial console.
+
 ### dom0_ioports_disable (x86)
 > `= List of <hex>-<hex>`
 
@@ -1645,6 +1653,24 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
 in hypervisor context to be able to dump the Last Interrupt/Exception To/From
 record with other registers.
 
+### llc-way-size (arm64)
+> `= <size>`
+
+> Default: `Obtained from the hardware`
+
+Specify the way size of the Last Level Cache. This parameter is only useful with
+cache coloring support enabled. It is an optional, expert-only parameter and it
+is used to calculate the number of available colors on the platform. It can be
+obtained by dividing the total LLC size by the number of its associative ways.
+By default, the value is automatically computed by probing the hardware, but in
+case of specific needs, it can be manually set. Those include failing probing
+and debugging/testing purposes so that it's possibile to emulate platforms with
+different number of supported colors.
+An important detail to highlight is that the current implementation of the
+cache coloring technique requires the number of colors to be a power of 2, and
+consequently, also the LLC way size must be so. A value that doesn't match this
+requirement is aligned down to the previous power of 2.
+
 ### loglvl
 > `= <level>[/<rate-limited level>]` where level is `none | error | warning | info | debug | all`
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..c45a9c5917 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select ARM_EFI
 	select HAS_FAST_MULTIPLY
+	select HAS_CACHE_COLORING
 
 config ARM
 	def_bool y
@@ -131,6 +132,27 @@ config ARM64_BTI
 	  Branch Target Identification support.
 	  This feature is not supported in Xen.
 
+config CACHE_COLORING
+	bool "Last Level Cache (LLC) coloring" if EXPERT
+	depends on HAS_CACHE_COLORING
+
+config MAX_CACHE_COLORS
+	int "Maximum number of cache colors"
+	default 128
+	range 2 32768
+	depends on CACHE_COLORING
+	help
+	  This config value is an upper bound for the actual number of cache colors
+	  supported by the architecture. Xen preallocates this amount of cache
+	  colors at boot. Refer to the documentation for how to compute the number
+	  of colors supported by the platform.
+	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
+	  more than what needed in the normal case.
+	  The max value corresponds to a 2 GiB 16-ways LLC which should never be
+	  reached.
+	  Note that if, at any time, a color configuration with more colors than the
+	  maximum is employed, an error is produced.
+
 config TEE
 	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b..12940ba761 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
+obj-$(CONFIG_CACHE_COLORING) += coloring.o
 
 extra-y += xen.lds
 
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
new file mode 100644
index 0000000000..36eea2d6c0
--- /dev/null
+++ b/xen/arch/arm/coloring.c
@@ -0,0 +1,243 @@
+/*
+ * xen/arch/arm/coloring.c
+ *
+ * Coloring support for ARM
+ *
+ * Copyright (C) 2019 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *    Carlo Nonato <carlo.nonato@minervasys.tech>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <xen/bitops.h>
+#include <xen/errno.h>
+#include <xen/keyhandler.h>
+#include <xen/param.h>
+#include <xen/types.h>
+
+#include <asm/coloring.h>
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+
+/* Size of an LLC way */
+static unsigned int __ro_after_init llc_way_size;
+/* Number of colors available in the LLC */
+static unsigned int __ro_after_init max_colors = CONFIG_MAX_CACHE_COLORS;
+/* Mask to retrieve coloring relevant bits */
+static uint64_t __ro_after_init addr_col_mask;
+
+#define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
+#define addr_set_color(addr, color) (((addr) & ~addr_col_mask) \
+                                     | ((color) << PAGE_SHIFT))
+
+static unsigned int dom0_colors[CONFIG_MAX_CACHE_COLORS];
+static unsigned int dom0_num_colors;
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
+            if ( start > end ||
+                 *num_colors + end - start >= max_colors )
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
+size_param("llc-way-size", llc_way_size);
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_colors, &dom0_num_colors);
+}
+custom_param("dom0-colors", parse_dom0_colors);
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
+    if ( num_colors > max_colors )
+        return false;
+
+    for ( i = 0; i < num_colors; i++ )
+        if ( colors[i] >= max_colors )
+            return false;
+
+    return true;
+}
+
+static unsigned int set_default_domain_colors(unsigned int *colors)
+{
+    unsigned int i;
+
+    if ( !colors )
+        return 0;
+
+    for ( i = 0; i < max_colors; i++ )
+        colors[i] = i;
+    return max_colors;
+}
+
+static void dump_coloring_info(unsigned char key)
+{
+    printk("'%c' pressed -> dumping coloring general info\n", key);
+    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
+    printk("Number of LLC colors supported: %u\n", max_colors);
+    printk("Address color mask: 0x%lx\n", addr_col_mask);
+}
+
+bool __init coloring_init(void)
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
+     * map colors to bits of an address, so also the LLC way size must be so.
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
+    max_colors = llc_way_size >> PAGE_SHIFT;
+
+    if ( max_colors < 2 || max_colors > CONFIG_MAX_CACHE_COLORS )
+    {
+        printk(XENLOG_ERR
+               "Max number of colors (%u) not in range [2, config max (%u)]\n",
+               max_colors, CONFIG_MAX_CACHE_COLORS);
+        return false;
+    }
+
+    addr_col_mask = (max_colors - 1) << PAGE_SHIFT;
+
+    if ( !dom0_num_colors )
+    {
+        printk(XENLOG_WARNING
+               "Dom0 color config not found. Using default (all colors)\n");
+        dom0_num_colors = set_default_domain_colors(dom0_colors);
+    }
+
+    if ( !check_colors(dom0_colors, dom0_num_colors) )
+    {
+        printk(XENLOG_ERR "Bad color config for Dom0\n");
+        return false;
+    }
+
+    register_keyhandler('K', dump_coloring_info, "dump coloring info", 1);
+
+    return true;
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
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
new file mode 100644
index 0000000000..3b563d3b90
--- /dev/null
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -0,0 +1,38 @@
+/*
+ * xen/arm/include/asm/coloring.h
+ *
+ * Coloring support for ARM
+ *
+ * Copyright (C) 2019 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *    Carlo Nonato <carlo.nonato@minervasys.tech>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_ARM_COLORING_H__
+#define __ASM_ARM_COLORING_H__
+
+#ifdef CONFIG_CACHE_COLORING
+
+#include <xen/init.h>
+
+bool __init coloring_init(void);
+
+#else /* !CONFIG_CACHE_COLORING */
+
+static inline bool __init coloring_init(void) { return true; }
+
+#endif /* CONFIG_CACHE_COLORING */
+#endif /* __ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1dd81d7d52..85ff0caf1e 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -18,6 +18,22 @@
 #define CTR_IDC_SHIFT       28
 #define CTR_DIC_SHIFT       29
 
+/* CCSIDR Current Cache Size ID Register */
+#define CCSIDR_LINESIZE_MASK            0x7
+#define CCSIDR_NUMSETS_SHIFT            13
+#define CCSIDR_NUMSETS_MASK             0x3FFF
+#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
+#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  0xFFFFFF
+
+/* CCSELR Cache Size Selection Register */
+#define CCSELR_LEVEL_MASK  0x7
+#define CCSELR_LEVEL_SHIFT 1
+
+/* CLIDR Cache Level ID Register */
+#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
+#define CLIDR_CTYPEn_MASK     0x7
+#define CLIDR_CTYPEn_LEVELS   7
+
 #define ICACHE_POLICY_VPIPT  0
 #define ICACHE_POLICY_AIVIVT 1
 #define ICACHE_POLICY_VIPT   2
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 4395640019..acc3e4ad72 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -53,6 +53,7 @@
 #include <asm/setup.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
+#include <asm/coloring.h>
 
 struct bootinfo __initdata bootinfo;
 
@@ -1035,6 +1036,12 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+    {
+        if ( !coloring_init() )
+            panic("Xen cache coloring support: setup failed\n");
+    }
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..d7968127be 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -31,6 +31,9 @@ config ARCH_MAP_DOMAIN_PAGE
 config HAS_ALTERNATIVE
 	bool
 
+config HAS_CACHE_COLORING
+	bool
+
 config HAS_COMPAT
 	bool
 
-- 
2.34.1


