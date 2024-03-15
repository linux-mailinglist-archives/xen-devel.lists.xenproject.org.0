Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2687CBBC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693748.1082214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hp-0000rK-Qq; Fri, 15 Mar 2024 10:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693748.1082214; Fri, 15 Mar 2024 10:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hp-0000pF-Lr; Fri, 15 Mar 2024 10:59:41 +0000
Received: by outflank-mailman (input) for mailman id 693748;
 Fri, 15 Mar 2024 10:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hn-0000aQ-M1
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:39 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dd7ebd2-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:38 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a468532272eso70034166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:38 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:37 -0700 (PDT)
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
X-Inumbo-ID: 1dd7ebd2-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500378; x=1711105178; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU4aBycHZ0QecrRZ6TOab+up3UUZUcn3g0RV4PB3Gco=;
        b=gD11aRHFzPjRsM+znDC5T0Rxh4GcfCQZ1W/K2KWKlGEBvSeP+GE5GT3UjZy8NG6agY
         6QMSQ1TcrrMDXVFs3g3nNZ23Cp8fB5n7WoM42g5b/muPmF9g1dl7YhegOCDZfhjcqpIm
         8ULMqcDh8ea/HhmH9oQXm4PMJBuzc1hMxemiKf69baq0iy+jdsVp6a8oS7ulxwwjeXhr
         YSSy7YItqW26zhBdo8rZj368fJY2PF9qRdo9U/ryNJqQDsdf+ECHa9jx+aQiH44SYix3
         JmQGUUcI4YhqDDWmKH+3cBJWjHSZczLyQDX+k0Kh3DQNSR821dWPv8La+Hl/xBdwTCbh
         sJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500378; x=1711105178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU4aBycHZ0QecrRZ6TOab+up3UUZUcn3g0RV4PB3Gco=;
        b=LSOa01bf78MSXhmbOSYJeJhKGDHjT2uUnk5cVelDrM1V4+7Da3eMOSKaX1hswlqR5r
         C0m38ncmQ8ho7oHR2XXf7kjMALE/kIE23D3p7yITLyDvCqdGUGjYwIBC25JbR2oVRmy8
         N0iPk//xeYD9gKNHz7yMOZ44sydkKhVffFtqcCDKbEmf5cTF5yqj4uB5YIJU+l15Zyq4
         t++XCtSO8Ia0zoe+HeF+pRq0Ox9kHeWGkbJDibqgmm5JpTgjGU40/ixSuvqIJmyodZ3X
         pKfcd6e4t20eLW+ivG9myE9ffB4qCcNjS6xdjrSULPbtsGJklB5gNDXa9BE3Q9V1KXqg
         qpZQ==
X-Gm-Message-State: AOJu0YwScwzANNnzox3xiCoxmeZAu96JxRScwahFKIQv3OIHnt3F4Y1w
	UtY7OcnjDtG9/TRl5vOvC0OPZm8xzctz8XQWcqoCDQWPKcZiSb5Dqwi3xoKMIBTqPDnSXehxH5X
	afzw=
X-Google-Smtp-Source: AGHT+IHpf4sk/rSBERwuRtgSuKJ0ojkJIgfaU82jJqHH5eJ7FVjgIBwXfanWGr1184XrtIB/o70CWg==
X-Received: by 2002:a17:906:1c93:b0:a46:22fc:74d3 with SMTP id g19-20020a1709061c9300b00a4622fc74d3mr2928027ejh.72.1710500377641;
        Fri, 15 Mar 2024 03:59:37 -0700 (PDT)
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
Subject: [PATCH v7 01/14] xen/common: add cache coloring common code
Date: Fri, 15 Mar 2024 11:58:49 +0100
Message-Id: <20240315105902.160047-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last Level Cache (LLC) coloring allows to partition the cache in smaller
chunks called cache colors. Since not all architectures can actually
implement it, add a HAS_LLC_COLORING Kconfig and put other options under
xen/arch.

LLC colors are a property of the domain, so the domain struct has to be
extended.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v7:
- SUPPORT.md changes added to this patch
- extended documentation to better address applicability of cache coloring
- "llc-nr-ways" and "llc-size" params introduced in favor of "llc-way-size"
- moved dump_llc_coloring_info() call in 'm' keyhandler (pagealloc_info())
v6:
- moved almost all code in common
- moved documentation in this patch
- reintroduced range for CONFIG_NR_LLC_COLORS
- reintroduced some stub functions to reduce the number of checks on
  llc_coloring_enabled
- moved domain_llc_coloring_free() in same patch where allocation happens
- turned "d->llc_colors" to pointer-to-const
- llc_coloring_init() now returns void and panics if errors are found
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
 SUPPORT.md                        |   7 ++
 docs/misc/cache-coloring.rst      | 125 ++++++++++++++++++++++++++++++
 docs/misc/xen-command-line.pandoc |  37 +++++++++
 xen/arch/Kconfig                  |  20 +++++
 xen/common/Kconfig                |   3 +
 xen/common/Makefile               |   1 +
 xen/common/keyhandler.c           |   3 +
 xen/common/llc-coloring.c         | 102 ++++++++++++++++++++++++
 xen/common/page_alloc.c           |   3 +
 xen/include/xen/llc-coloring.h    |  36 +++++++++
 xen/include/xen/sched.h           |   5 ++
 11 files changed, 342 insertions(+)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

diff --git a/SUPPORT.md b/SUPPORT.md
index 510bb02190..456abd42bf 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -364,6 +364,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
     Status, x86 HVM: Tech Preview
     Status, ARM: Tech Preview
 
+### Cache coloring
+
+Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and Xen
+itself.
+
+    Status, Arm64: Experimental
+
 ## Resource Management
 
 ### CPU Pools
diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
new file mode 100644
index 0000000000..52ce52ffbd
--- /dev/null
+++ b/docs/misc/cache-coloring.rst
@@ -0,0 +1,125 @@
+Xen cache coloring user guide
+=============================
+
+The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
+partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
+Cache coloring realizes per-set cache partitioning in software and is applicable
+to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CPUs.
+
+To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
+
+If needed, change the maximum number of colors with
+``CONFIG_NR_LLC_COLORS=<n>``.
+
+Runtime configuration is done via `Command line parameters`_.
+
+Background
+**********
+
+Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
+to each core (hence using multiple cache units), while the last level is shared
+among all of them. Such configuration implies that memory operations on one
+core (e.g. running a DomU) are able to generate interference on another core
+(e.g. hosting another DomU). Cache coloring realizes per-set cache-partitioning
+in software and mitigates this, guaranteeing higher and more predictable
+performances for memory accesses.
+Software-based cache coloring is particularly useful in those situations where
+no hardware mechanisms (e.g., DSU-based way partitioning) are available to
+partition caches. This is the case for e.g., Cortex-A53, A57 and A72 CPUs that
+feature a L2 LLC cache shared among all cores.
+
+The key concept underlying cache coloring is a fragmentation of the memory
+space into a set of sub-spaces called colors that are mapped to disjoint cache
+partitions. Technically, the whole memory space is first divided into a number
+of subsequent regions. Then each region is in turn divided into a number of
+subsequent sub-colors. The generic i-th color is then obtained by all the
+i-th sub-colors in each region.
+
+::
+
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
+
+How colors are actually defined depends on the function that maps memory to
+cache lines. In case of physically-indexed, physically-tagged caches with linear
+mapping, the set index is found by extracting some contiguous bits from the
+physical address. This allows colors to be defined as shown in figure: they
+appear in memory as subsequent blocks of equal size and repeats themselves after
+``n`` different colors, where ``n`` is the total number of colors.
+
+If some kind of bit shuffling appears in the mapping function, then colors
+assume a different layout in memory. Those kind of caches aren't supported by
+the current implementation.
+
+**Note**: Finding the exact cache mapping function can be a really difficult
+task since it's not always documented in the CPU manual. As said Cortex-A53, A57
+and A72 are known to work with the current implementation.
+
+How to compute the number of colors
+###################################
+
+Given the linear mapping from physical memory to cache lines for granted, the
+number of available colors for a specific platform is computed using three
+parameters:
+
+- the size of the LLC.
+- the number of the LLC ways.
+- the page size used by Xen.
+
+The first two parameters can be found in the processor manual, while the third
+one is the minimum mapping granularity. Dividing the cache size by the number of
+its ways we obtain the size of a way. Dividing this number by the page size,
+the number of total cache colors is found. So for example an Arm Cortex-A53
+with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when pages are
+4 KiB in size.
+
+LLC size and number of ways are probed automatically by default so there's
+should be no need to compute the number of colors by yourself.
+
+Effective colors assignment
+###########################
+
+When assigning colors:
+
+1. If one wants to avoid cache interference between two domains, different
+   colors needs to be used for their memory.
+
+2. To improve spatial locality, color assignment should privilege continuity in
+   the partitioning. E.g., assigning colors (0,1) to domain I and (2,3) to
+   domain J is better than assigning colors (0,2) to I and (1,3) to J.
+
+Command line parameters
+***********************
+
+Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
+
++----------------------+-------------------------------+
+| **Parameter**        | **Description**               |
++----------------------+-------------------------------+
+| ``llc-coloring``     | enable coloring at runtime    |
++----------------------+-------------------------------+
+| ``llc-size``         | set the LLC size              |
++----------------------+-------------------------------+
+| ``llc-nr-ways``      | set the LLC number of ways    |
++----------------------+-------------------------------+
+
+Auto-probing of LLC specs
+#########################
+
+LLC size and number of ways are probed automatically by default.
+
+LLC specs can be manually set via the above command line parameters. This
+bypasses any auto-probing and it's used to overcome failing situations or for
+debugging/testing purposes.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 54edbc0fbc..2936abea2c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1706,6 +1706,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
 in hypervisor context to be able to dump the Last Interrupt/Exception To/From
 record with other registers.
 
+### llc-coloring
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable LLC coloring support at runtime. This option is
+available only when `CONFIG_LLC_COLORING` is enabled. See the general
+cache coloring documentation for more info.
+
+### llc-nr-ways
+> `= <integer>`
+
+> Default: `Obtained from hardware`
+
+Specify the number of ways of the Last Level Cache. This option is available
+only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
+to find the number of supported cache colors. By default the value is
+automatically computed by probing the hardware, but in case of specific needs,
+it can be manually set. Those include failing probing and debugging/testing
+purposes so that it's possibile to emulate platforms with different number of
+supported colors. If set, also "llc-size" must be set, otherwise the default
+will be used.
+
+### llc-size
+> `= <size>`
+
+> Default: `Obtained from hardware`
+
+Specify the size of the Last Level Cache. This option is available only when
+`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
+the number of supported cache colors. By default the value is automatically
+computed by probing the hardware, but in case of specific needs, it can be
+manually set. Those include failing probing and debugging/testing purposes so
+that it's possibile to emulate platforms with different number of supported
+colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
+used.
+
 ### lock-depth-size
 > `= <integer>`
 
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 67ba38f32f..a65c38e53e 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -31,3 +31,23 @@ config NR_NUMA_NODES
 	  associated with multiple-nodes management. It is the upper bound of
 	  the number of NUMA nodes that the scheduler, memory allocation and
 	  other NUMA-aware components can handle.
+
+config LLC_COLORING
+	bool "Last Level Cache (LLC) coloring" if EXPERT
+	depends on HAS_LLC_COLORING
+	depends on !NUMA
+
+config NR_LLC_COLORS
+	int "Maximum number of LLC colors"
+	range 2 1024
+	default 128
+	depends on LLC_COLORING
+	help
+	  Controls the build-time size of various arrays associated with LLC
+	  coloring. Refer to cache coloring documentation for how to compute the
+	  number of colors supported by the platform. This is only an upper
+	  bound. The runtime value is autocomputed or manually set via cmdline.
+	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
+	  more than what's needed in the general case. Use only power of 2 values.
+	  1024 is the number of colors that fit in a 4 KiB page when integers are 4
+	  bytes long.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a5c3d5a6bf..1e467178bd 100644
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
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index e5eee19a85..3054254a7d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -23,6 +23,7 @@ obj-y += keyhandler.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
+obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 127ca50696..778f93e063 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -5,6 +5,7 @@
 #include <asm/regs.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/llc-coloring.h>
 #include <xen/param.h>
 #include <xen/shutdown.h>
 #include <xen/event.h>
@@ -303,6 +304,8 @@ static void cf_check dump_domains(unsigned char key)
 
         arch_dump_domain_info(d);
 
+        domain_dump_llc_colors(d);
+
         rangeset_domain_printk(d);
 
         dump_pageframe_info(d);
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
new file mode 100644
index 0000000000..db96a83ddd
--- /dev/null
+++ b/xen/common/llc-coloring.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Last Level Cache (LLC) coloring common code
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ */
+#include <xen/keyhandler.h>
+#include <xen/llc-coloring.h>
+#include <xen/param.h>
+
+static bool __ro_after_init llc_coloring_enabled;
+boolean_param("llc-coloring", llc_coloring_enabled);
+
+static unsigned int __initdata llc_size;
+size_param("llc-size", llc_size);
+static unsigned int __initdata llc_nr_ways;
+integer_param("llc-nr-ways", llc_nr_ways);
+/* Number of colors available in the LLC */
+static unsigned int __ro_after_init max_nr_colors;
+
+static void print_colors(const unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    printk("{ ");
+    for ( i = 0; i < num_colors; i++ )
+    {
+        unsigned int start = colors[i], end = start;
+
+        printk("%u", start);
+
+        for ( ; i < num_colors - 1 && end + 1 == colors[i + 1]; i++, end++ )
+            ;
+
+        if ( start != end )
+            printk("-%u", end);
+
+        if ( i < num_colors - 1 )
+            printk(", ");
+    }
+    printk(" }\n");
+}
+
+void __init llc_coloring_init(void)
+{
+    unsigned int way_size;
+
+    if ( !llc_coloring_enabled )
+        return;
+
+    if ( llc_size && llc_nr_ways )
+        way_size = llc_size / llc_nr_ways;
+    else
+    {
+        way_size = get_llc_way_size();
+        if ( !way_size )
+            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
+    }
+
+    /*
+     * The maximum number of colors must be a power of 2 in order to correctly
+     * map them to bits of an address.
+     */
+    max_nr_colors = way_size >> PAGE_SHIFT;
+
+    if ( max_nr_colors & (max_nr_colors - 1) )
+        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);
+
+    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
+        panic("Number of LLC colors (%u) not in range [2, %u]\n",
+              max_nr_colors, CONFIG_NR_LLC_COLORS);
+
+    arch_llc_coloring_init();
+}
+
+void cf_check dump_llc_coloring_info(void)
+{
+    if ( !llc_coloring_enabled )
+        return;
+
+    printk("LLC coloring info:\n");
+    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+}
+
+void cf_check domain_dump_llc_colors(const struct domain *d)
+{
+    if ( !llc_coloring_enabled )
+        return;
+
+    printk("%u LLC colors: ", d->num_llc_colors);
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
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2ec17df9b4..c38edb9a58 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -126,6 +126,7 @@
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
@@ -2623,6 +2624,8 @@ static void cf_check pagealloc_info(unsigned char key)
     }
 
     printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
+
+    dump_llc_coloring_info();
 }
 
 static __init int cf_check pagealloc_keyhandler_init(void)
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
new file mode 100644
index 0000000000..c60c8050c5
--- /dev/null
+++ b/xen/include/xen/llc-coloring.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Last Level Cache (LLC) coloring common header
+ *
+ * Copyright (C) 2022 Xilinx Inc.
+ */
+#ifndef __COLORING_H__
+#define __COLORING_H__
+
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+#ifdef CONFIG_LLC_COLORING
+void llc_coloring_init(void);
+void dump_llc_coloring_info(void);
+void domain_dump_llc_colors(const struct domain *d);
+#else
+static inline void llc_coloring_init(void) {}
+static inline void dump_llc_coloring_info(void) {}
+static inline void domain_dump_llc_colors(const struct domain *d) {}
+#endif
+
+unsigned int get_llc_way_size(void);
+void arch_llc_coloring_init(void);
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
index 37f5922f32..96cc934fc3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -627,6 +627,11 @@ struct domain
 
     /* Holding CDF_* constant. Internal flags for domain creation. */
     unsigned int cdf;
+
+#ifdef CONFIG_LLC_COLORING
+    unsigned int num_llc_colors;
+    const unsigned int *llc_colors;
+#endif
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.34.1


