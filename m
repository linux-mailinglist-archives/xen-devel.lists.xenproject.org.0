Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A0840EE6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673061.1047218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI1-0005yJ-RY; Mon, 29 Jan 2024 17:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673061.1047218; Mon, 29 Jan 2024 17:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI1-0005vt-OT; Mon, 29 Jan 2024 17:19:21 +0000
Received: by outflank-mailman (input) for mailman id 673061;
 Mon, 29 Jan 2024 17:19:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI0-0005vY-EV
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:20 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8903ff3e-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:18 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55eb1f9d1f0so3956913a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:18 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:17 -0800 (PST)
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
X-Inumbo-ID: 8903ff3e-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548758; x=1707153558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hv5wbDw5zgCt9ccmVowLGqtempCv7CEDV12eNerpQk=;
        b=d41rw/jC27kx6CDnGc4OsdN8fF1X8tt9xuRirbD289tr374hiZcZyUShOx9RQ/9DHC
         OPxxc8wLoiNBASPcT1rvJk7Vj5oH6Sxl/VEvdg6e2UMHblZwLDb6zbpDVXvWEc/0iRWT
         NuGB59aG70XcKn80elQqduhlCkgBfrNzGvLYvt+lA+XPxn2spOXXySeD36yo/hIooVUU
         rmTnysPv83OhgzzTphJODIuLFbMsWny2iKNo5hH2N2Luvgqe/1Hxlfhl1jmzZUaRQHYT
         7RNVUvlYZPbtzI3naqU1xqJXApTEhfm68G0lpXm6ybnsJyQn1c7SycgI4msbFqPrqzYY
         MAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548758; x=1707153558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hv5wbDw5zgCt9ccmVowLGqtempCv7CEDV12eNerpQk=;
        b=neKxYdVTELuQVs4bUczDT0HnyogZb4mjufOcWY0gKrCCFY7LzboP2X42k7eCyyrHN6
         XWotXNZtBAKwL6aH5HD6vJPi2En5rEO2pHEUQoGWU+7UjhgI2nvj9JL6qk3dEPBD18qb
         uEy2CgbVgwbJSHRbvzbXH8VYYfZq0GF5T/QzKJtmPNpbXkctEAgJD7L4lL5PTd8Envaz
         /wDCXdkrTDCfThTmFpkaXB6e91bIqiSpGz/0EJ4N0dtYPVXI8AQP3gN4Jam/PfO9pSxx
         vbr8JLe9ADvCws//ZcAlzMvrk6vSnNdP6/mPghtc0kzIx1M2BdqOP9fwNNEebfPMH4B1
         s0xQ==
X-Gm-Message-State: AOJu0YwLdIwbnoyHLtC3Du5adVnc56qy87QCWePxnTnthu9PpKnzGEFF
	Zeqz/MffIZgeZPO1VPMgv3XB8UZLNZxf6bnVNTpDODd3t07TdJr5t9u4YpOYVBwqvA/k+hhPCha
	UNXg=
X-Google-Smtp-Source: AGHT+IEXJpomaco9S1o1pO/0EpXOhqKzjixYigXXi2qXJK2rcOISoW4ZekLLP4YaXURpOECuZYCm4w==
X-Received: by 2002:aa7:c312:0:b0:55e:eb6e:ff51 with SMTP id l18-20020aa7c312000000b0055eeb6eff51mr3877944edq.12.1706548757791;
        Mon, 29 Jan 2024 09:19:17 -0800 (PST)
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
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 01/15] xen/common: add cache coloring common code
Date: Mon, 29 Jan 2024 18:17:57 +0100
Message-Id: <20240129171811.21382-2-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
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
 docs/misc/cache-coloring.rst      | 87 +++++++++++++++++++++++++++++++
 docs/misc/xen-command-line.pandoc | 27 ++++++++++
 xen/arch/Kconfig                  | 17 ++++++
 xen/common/Kconfig                |  3 ++
 xen/common/Makefile               |  1 +
 xen/common/keyhandler.c           |  3 ++
 xen/common/llc-coloring.c         | 87 +++++++++++++++++++++++++++++++
 xen/include/xen/llc-coloring.h    | 38 ++++++++++++++
 xen/include/xen/sched.h           |  5 ++
 9 files changed, 268 insertions(+)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
new file mode 100644
index 0000000000..9fe01e99e1
--- /dev/null
+++ b/docs/misc/cache-coloring.rst
@@ -0,0 +1,87 @@
+Xen cache coloring user guide
+=============================
+
+The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
+partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
+
+To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
+
+If needed, change the maximum number of colors with
+``CONFIG_NR_LLC_COLORS=<n>``.
+
+Compile Xen and the toolstack and then configure it via
+`Command line parameters`_.
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
+Cache layout is probed automatically by looking at the CLIDR_EL1 arm register.
+This means that other system caches that aren't visible there, are ignored.
+The possibility of manually setting the way size is left to the user to overcome
+failing situations or for debugging/testing purposes. See
+`Command line parameters`_ for more information on that.
+
+Command line parameters
+***********************
+
+More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
+
++----------------------+-------------------------------+
+| **Parameter**        | **Description**               |
++----------------------+-------------------------------+
+| ``llc-coloring``     | enable coloring at runtime    |
++----------------------+-------------------------------+
+| ``llc-way-size``     | set the LLC way size          |
++----------------------+-------------------------------+
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18..11f9f209d1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1713,6 +1713,33 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
 in hypervisor context to be able to dump the Last Interrupt/Exception To/From
 record with other registers.
 
+### llc-coloring
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable LLC coloring support at runtime. This options is
+available only when `CONFIG_LLC_COLORING` is enabled. See the general
+cache coloring documentation for more info.
+
+### llc-way-size
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
+consequently, also the LLC way size must be so.
+
 ### lock-depth-size
 > `= <integer>`
 
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 67ba38f32f..c1157bcbcb 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -31,3 +31,20 @@ config NR_NUMA_NODES
 	  associated with multiple-nodes management. It is the upper bound of
 	  the number of NUMA nodes that the scheduler, memory allocation and
 	  other NUMA-aware components can handle.
+
+config LLC_COLORING
+	bool "Last Level Cache (LLC) coloring" if EXPERT
+	depends on HAS_LLC_COLORING
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
+	  more than what needed in the general case.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229c..e383f09d97 100644
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
index 69d6aa626c..409cc53e2a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -24,6 +24,7 @@ obj-y += keyhandler.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
+obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 99a2d72a02..8d90b613f7 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -6,6 +6,7 @@
 #include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/llc-coloring.h>
 #include <xen/param.h>
 #include <xen/shutdown.h>
 #include <xen/event.h>
@@ -307,6 +308,8 @@ static void cf_check dump_domains(unsigned char key)
 
         arch_dump_domain_info(d);
 
+        domain_dump_llc_colors(d);
+
         rangeset_domain_printk(d);
 
         dump_pageframe_info(d);
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
new file mode 100644
index 0000000000..10729e70c1
--- /dev/null
+++ b/xen/common/llc-coloring.c
@@ -0,0 +1,87 @@
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
+bool __ro_after_init llc_coloring_enabled;
+boolean_param("llc-coloring", llc_coloring_enabled);
+
+/* Size of an LLC way */
+static unsigned int __ro_after_init llc_way_size;
+size_param("llc-way-size", llc_way_size);
+/* Number of colors available in the LLC */
+static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
+
+static void print_colors(const unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    printk("{ ");
+    for ( i = 0; i < num_colors; i++ ) {
+        unsigned int start = colors[i], end = colors[i];
+
+        printk("%u", start);
+
+        for ( ;
+              i < num_colors - 1 && colors[i] + 1 == colors[i + 1];
+              i++, end++ );
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
+static void dump_coloring_info(unsigned char key)
+{
+    printk("'%c' pressed -> dumping LLC coloring general info\n", key);
+    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
+    printk("Number of LLC colors supported: %u\n", max_nr_colors);
+}
+
+void __init llc_coloring_init(void)
+{
+    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
+        panic("Probed LLC coloring way size is 0 and no custom value found\n");
+
+    /*
+     * The maximum number of colors must be a power of 2 in order to correctly
+     * map them to bits of an address, so also the LLC way size must be so.
+     */
+    if ( llc_way_size & (llc_way_size - 1) )
+        panic("LLC coloring way size (%u) isn't a power of 2\n", llc_way_size);
+
+    max_nr_colors = llc_way_size >> PAGE_SHIFT;
+
+    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
+        panic("Number of LLC colors (%u) not in range [2, %u]\n",
+              max_nr_colors, CONFIG_NR_LLC_COLORS);
+
+    register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
+
+    arch_llc_coloring_init();
+}
+
+void domain_dump_llc_colors(const struct domain *d)
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
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
new file mode 100644
index 0000000000..5e12eb426f
--- /dev/null
+++ b/xen/include/xen/llc-coloring.h
@@ -0,0 +1,38 @@
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
+extern bool llc_coloring_enabled;
+
+void llc_coloring_init(void);
+void domain_dump_llc_colors(const struct domain *d);
+#else
+#define llc_coloring_enabled false
+
+static inline void llc_coloring_init(void) {}
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
index 9da91e0e62..8df0f29335 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -626,6 +626,11 @@ struct domain
 
     /* Holding CDF_* constant. Internal flags for domain creation. */
     unsigned int cdf;
+
+#ifdef CONFIG_LLC_COLORING
+    unsigned const int *llc_colors;
+    unsigned int num_llc_colors;
+#endif
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.34.1


