Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1B8B9EFF
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715947.1117940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zih-0006k7-MD; Thu, 02 May 2024 16:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715947.1117940; Thu, 02 May 2024 16:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zih-0006cS-G3; Thu, 02 May 2024 16:55:43 +0000
Received: by outflank-mailman (input) for mailman id 715947;
 Thu, 02 May 2024 16:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zif-0006N3-92
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:41 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd95efbb-08a4-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 18:55:39 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a56d7d457a1so1078769566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:39 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:37 -0700 (PDT)
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
X-Inumbo-ID: cd95efbb-08a4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668938; x=1715273738; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GREHaaEsQD6UfemfISve1bYOvLW8rS5iYyct68ZwSw=;
        b=EqkbhmjnI5QoSSieWG72gWd8+4WMPVc+PQY79pbvAjCKVb6Cc2krGEkzrqTZt15UJ7
         D/aaGH+7NEZzmVqH1z3BrB0rHKdZlXBlWryDohpTShvVsCBXanIN+c++GDzNGjR8QJlP
         n64GzWgrorq8uEyWT32Hi3bwQN+OKwW2ARDTvzn8oBZUqAUpQO6jtFjKbZ7K1d1lGT8P
         UwkdWiDVxFgcoTlgj3Mi4TR/rp9KuImRqyBgYUDFkeOGy0rJct8agmydMDG1ZSQh655S
         dDzafiqspXMKc91FI3GAuceW3dzWbfuvz6Q1XDZu7QykuDPw20C2CTUHUmeklbmv2lm9
         vldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668938; x=1715273738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GREHaaEsQD6UfemfISve1bYOvLW8rS5iYyct68ZwSw=;
        b=Bjj3gM3UJnpkQ+q1sIc9h11aTWHD+becgTq4cvBHcoID0x9Kxb7hjy4/4ht6etqpZn
         qaV1AXIaYIAo51rPCdDeU3ghSJoLyXZ19YLwXm5GhzoTwrXXSeUfzdjk3Tuw2mEgyd1V
         BHjtQ1m03CxjG0Of5H5uZP2IZwPaA8tUpW0Xs1hMhnsZTMUN7bFkbM8Yuey+/hpX3dVW
         mi8ZqSnukSgpi5VemtEb/u3UjY6gCsVtW7PAKf2pMpSF6wnpCbwMrYxQNzCe40x6htNj
         uWSh1LoCjC9Xgr2DvDYdJa2MVzh8PieySuEvPvjozmcdAuRn5bPV3C9wk94lpsvZ5oYc
         6CJg==
X-Gm-Message-State: AOJu0Yzkftn3aKF60QzL+a0DpOjAB9fR1aVoRxluDd54KOfbo5Yb6j9l
	eYqvdsNgroWWdgrBwYcKzK4rGpZ3rLLXJOL4kr7aRQ+4g4ImBLZdJYfcyq/BAd12HF6UEO1IaA7
	E
X-Google-Smtp-Source: AGHT+IGWDc2DdScTkoTEys0xZwfnpda0hlZJeAncLA0A4bzwwXZSpr1rHSW9ZFbwc0DxtB10fwE7BA==
X-Received: by 2002:a17:906:c048:b0:a59:146:1c4e with SMTP id bm8-20020a170906c04800b00a5901461c4emr53013ejb.58.1714668938113;
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
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 01/13] xen/common: add cache coloring common code
Date: Thu,  2 May 2024 18:55:21 +0200
Message-Id: <20240502165533.319988-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last Level Cache (LLC) coloring allows to partition the cache in smaller
chunks called cache colors.

Since not all architectures can actually implement it, add a HAS_LLC_COLORING
Kconfig option.
MAX_LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
because that's the number of colors that fit in a 4 KiB page when integers
are 4 bytes long.

LLC colors are a property of the domain, so struct domain has to be extended.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v8:
- minor documentation fixes
- "llc-coloring=on" is inferred from "llc-nr-ways" and "llc-size" usage
- turned CONFIG_NR_LLC_COLORS to CONFIG_MAX_LLC_COLORS_ORDER, base-2 exponent
- moved Kconfig options to common/Kconfig
- don't crash if computed max_nr_colors is too large
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
 docs/misc/cache-coloring.rst      | 116 ++++++++++++++++++++++++++++++
 docs/misc/xen-command-line.pandoc |  37 ++++++++++
 xen/common/Kconfig                |  22 ++++++
 xen/common/Makefile               |   1 +
 xen/common/keyhandler.c           |   3 +
 xen/common/llc-coloring.c         | 111 ++++++++++++++++++++++++++++
 xen/common/page_alloc.c           |   3 +
 xen/include/xen/llc-coloring.h    |  36 ++++++++++
 xen/include/xen/sched.h           |   5 ++
 10 files changed, 341 insertions(+)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

diff --git a/SUPPORT.md b/SUPPORT.md
index e10d46d924..94048adef2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -381,6 +381,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
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
index 0000000000..bcb45e9344
--- /dev/null
+++ b/docs/misc/cache-coloring.rst
@@ -0,0 +1,116 @@
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
+``CONFIG_MAX_LLC_COLORS_ORDER=<n>``.
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
+in software and mitigates this, guaranteeing more predictable performances for
+memory accesses.
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
+Effective colors assignment
+###########################
+
+When assigning colors, if one wants to avoid cache interference between two
+domains, different colors needs to be used for their memory.
+
+Command line parameters
+***********************
+
+Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
+
++----------------------+-------------------------------+
+| **Parameter**        | **Description**               |
++----------------------+-------------------------------+
+| ``llc-coloring``     | Enable coloring at runtime    |
++----------------------+-------------------------------+
+| ``llc-size``         | Set the LLC size              |
++----------------------+-------------------------------+
+| ``llc-nr-ways``      | Set the LLC number of ways    |
++----------------------+-------------------------------+
+
+Auto-probing of LLC specs
+#########################
+
+LLC size and number of ways are probed automatically by default.
+
+LLC specs can be manually set via the above command line parameters. This
+bypasses any auto-probing and it's used to overcome failing situations, such as
+flawed probing logic, or for debugging/testing purposes.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e760f3266e..906822a491 100644
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
+purposes so that it's possible to emulate platforms with different number of
+supported colors. If set, also "llc-size" must be set, otherwise the default
+will be used. Note that using these two options implies "llc-coloring=on".
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
+that it's possible to emulate platforms with different number of supported
+colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
+used. Note that using these two options implies "llc-coloring=on".
+
 ### lock-depth-size
 > `= <integer>`
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index cff3166ff9..276ef4e0f9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -71,6 +71,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_LLC_COLORING
+	bool
+
 config HAS_PIRQ
 	bool
 
@@ -513,4 +516,23 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
+config LLC_COLORING
+	bool "Last Level Cache (LLC) coloring" if EXPERT
+	depends on HAS_LLC_COLORING
+	depends on !NUMA
+
+config MAX_LLC_COLORS_ORDER
+	int "Maximum number of LLC colors (base-2 exponent)"
+	range 1 10
+	default 7
+	depends on LLC_COLORING
+	help
+	  Controls the build-time size of various arrays associated with LLC
+	  coloring. The value is a base-2 exponent. Refer to cache coloring
+	  documentation for how to compute the number of colors supported by the
+	  platform. This is only an upper bound. The runtime value is autocomputed
+	  or manually set via cmdline parameters.
+	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
+	  more than what's needed in the general case.
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index d512cad524..7aa74a74ce 100644
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
index 0000000000..65ed96603a
--- /dev/null
+++ b/xen/common/llc-coloring.c
@@ -0,0 +1,111 @@
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
+#define NR_LLC_COLORS          (1 << CONFIG_MAX_LLC_COLORS_ORDER)
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
+    if ( llc_size && llc_nr_ways )
+    {
+        llc_coloring_enabled = true;
+        way_size = llc_size / llc_nr_ways;
+    }
+    else if ( !llc_coloring_enabled )
+        return;
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
+    if ( max_nr_colors > NR_LLC_COLORS )
+    {
+        printk(XENLOG_WARNING
+               "Number of LLC colors (%u) too big. Using configured max %u\n",
+               max_nr_colors, NR_LLC_COLORS);
+        max_nr_colors = NR_LLC_COLORS;
+    } else if ( max_nr_colors < 2 )
+        panic("Number of LLC colors %u < 2\n", max_nr_colors);
+
+    arch_llc_coloring_init();
+}
+
+void dump_llc_coloring_info(void)
+{
+    if ( !llc_coloring_enabled )
+        return;
+
+    printk("LLC coloring info:\n");
+    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+}
+
+void domain_dump_llc_colors(const struct domain *d)
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
index 7c1bdfc046..d2032a79b0 100644
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
@@ -2625,6 +2626,8 @@ static void cf_check pagealloc_info(unsigned char key)
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
index 132b841995..1bdb4767dd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -629,6 +629,11 @@ struct domain
 
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


