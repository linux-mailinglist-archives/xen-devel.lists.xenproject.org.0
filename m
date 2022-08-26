Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6325A2806
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393764.632989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoN-0004Gd-Bc; Fri, 26 Aug 2022 12:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393764.632989; Fri, 26 Aug 2022 12:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoN-0004Bj-3p; Fri, 26 Aug 2022 12:51:47 +0000
Received: by outflank-mailman (input) for mailman id 393764;
 Fri, 26 Aug 2022 12:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoL-00013M-HW
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6cc40dc-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:44 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id u9so2993938ejy.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:44 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:43 -0700 (PDT)
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
X-Inumbo-ID: d6cc40dc-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dZ3qv2o8Z5R8iaRWPpU2jN0ZDcc6sdXYlyjmn+N7fqM=;
        b=rmeyh6Filnzt+/RKgIchnVdgT0CM2K8b5Y1fMOcCTG7gdtnfy8xPkinC7mDfEpoVJP
         QFVDPe1HXyOshMooxclN2PDL8GhGUUDt1gGx0+FwCCkoesgPTHNpuEeUyr/tC07blIAP
         hmGqJ+hAz43s/2tIDsSBNONjNQ86JYz/y4yFT6TelWvwWkAoC+D9Lfs6fn/jYTZzIvDe
         GkayLPdo1q9PnCuoeUTAvFfpfq3bndlDWg1YKhx9yCUQWfxuqKju4YYHPlo1dDO6Tlup
         V2Cyza3aWxtMrgGzAJrud/32d57ueRuKnpUSi1EmsI6zx6NAGXC2ANoL9CkqQjLhBM5j
         /BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dZ3qv2o8Z5R8iaRWPpU2jN0ZDcc6sdXYlyjmn+N7fqM=;
        b=HeJGGFRIUKYaXdKuiUgOHo6LBrTo/j4AyLTOGnYn1E50/UF2Kj0aC6JC04U0v/EKWJ
         GJbW2W7jkDAJ1TaHsPVPqwWE/GdZGWW3cu+6DQsTeCKMFhHnQ1/7NPE3bnk4iF5J0RSA
         dqGMJ5g6Zj/TRzdChF3GwZXfrxcisxnPoc4LbKwtR3/xg2IrTP8JmaULFhdt0WhZqWLd
         idOe3iFfUln47UYCxC+nZTM4kZT7oyN/kSfZ1MQGDnAT0PQ6gTun6A7O9AjD2AGj+FIP
         C5GDt3tO1REmQsRaQDwrkpRCWEzRuFuaHqsMBQukXefzoJIB7uQX16PrLwBQepIiA+6V
         5tsg==
X-Gm-Message-State: ACgBeo1et4XhrnmAILGctgE4rmMITI2eQhYvJVzj1yllvqmA0kArhTkT
	rrWJ18ttqzU1FR7iRI8dFx2S21h9kFvcsw==
X-Google-Smtp-Source: AA6agR5OtsLrD0ECCjgz0yMmObcumL1gAUFhYfipVmPy1FhcCjfV6DVPgweww28OtGAQbO4ZhnuyaQ==
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id sb12-20020a1709076d8c00b007316c60ecedmr5513987ejc.266.1661518303914;
        Fri, 26 Aug 2022 05:51:43 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 11/12] xen/arm: add Xen cache colors command line parameter
Date: Fri, 26 Aug 2022 14:51:10 +0200
Message-Id: <20220826125111.152261-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a new command line parameter to configure Xen cache colors.
These colors can be dumped with the cache coloring info debug-key.

By default, Xen uses the first color.
Benchmarking the VM interrupt response time provides an estimation of
LLC usage by Xen's most latency-critical runtime task. Results on Arm
Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
reserves 64 KiB of L2, is enough to attain best responsiveness.

More colors are instead very likely to be needed on processors whose L1
cache is physically-indexed and physically-tagged, such as Cortex-A57.
In such cases, coloring applies to L1 also, and there typically are two
distinct L1-colors. Therefore, reserving only one color for Xen would
senselessly partitions a cache memory that is already private, i.e.
underutilize it. The default amount of Xen colors is thus set to one.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst  |  8 ++++----
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/arch/arm/coloring.c           | 30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index 5f9132e525..f347245093 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -16,8 +16,8 @@ In order to enable and use it, few steps are needed.
 - If needed, change the amount of memory reserved for the buddy allocator either
   from the Xen configuration file, via the CONFIG_BUDDY_ALLOCATOR_SIZE value,
   or with the command line option. See `Colored allocator and buddy allocator`.
-- Assign colors to domains using the `Color selection format`_ (see
-  `Coloring parameters`_ for more documentation pointers).
+- Assign colors to each memory pool (Xen, Dom0/DomUs) using the
+  `Color selection format`_ for `Coloring parameters`_ configuration.
 
 Background
 **********
@@ -110,8 +110,8 @@ Examples:
 Coloring parameters
 *******************
 
-LLC way size (as previously discussed) and Dom0 colors can be set using the
-appropriate command line parameters. See the relevant documentation in
+LLC way size (as previously discussed), Xen colors and Dom0 colors can be set
+using the appropriate command line parameters. See the relevant documentation in
 "docs/misc/xen-command-line.pandoc".
 
 DomUs colors can be set either in the xl configuration file (relative
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4e85c4dfe4..3b4f7d54a7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2736,6 +2736,15 @@ In the case that x2apic is in use, this option switches between physical and
 clustered mode.  The default, given no hint from the **FADT**, is cluster
 mode.
 
+### xen-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `0: the lowermost color`
+
+Specify Xen color configuration.
+Two colors are most likely needed on platforms where private caches are
+physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
+
 ### xenheap_megabytes (arm32)
 > `= <size>`
 
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 3fb86043d1..7ae4095dba 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -31,6 +31,10 @@
 #include <asm/processor.h>
 #include <asm/sysregs.h>
 
+/* By default Xen uses the lowestmost color */
+#define XEN_DEFAULT_COLOR       0
+#define XEN_DEFAULT_NUM_COLORS  1
+
 /* Size of a LLC way */
 static unsigned int llc_way_size;
 /* Number of colors available in the LLC */
@@ -42,6 +46,9 @@ static uint64_t addr_col_mask;
 #define addr_set_color(addr, color) (((addr) & ~addr_col_mask) \
                                      | ((color) << PAGE_SHIFT))
 
+static unsigned int xen_colors[CONFIG_MAX_CACHE_COLORS];
+static unsigned int xen_num_colors;
+
 static unsigned int dom0_colors[CONFIG_MAX_CACHE_COLORS];
 static unsigned int dom0_num_colors;
 
@@ -93,6 +100,12 @@ static int parse_color_config(const char *buf, unsigned int *colors,
 
 size_param("llc-way-size", llc_way_size);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, &xen_num_colors);
+}
+custom_param("xen-colors", parse_xen_colors);
+
 static int __init parse_dom0_colors(const char *s)
 {
     return parse_color_config(s, dom0_colors, &dom0_num_colors);
@@ -187,6 +200,8 @@ static void dump_coloring_info(unsigned char key)
     printk("LLC way size: %u KiB\n", llc_way_size >> 10);
     printk("Number of LLC colors supported: %u\n", max_colors);
     printk("Address color mask: 0x%lx\n", addr_col_mask);
+    printk("Xen colors: ");
+    print_colors(xen_colors, xen_num_colors);
 }
 
 bool __init coloring_init(void)
@@ -204,6 +219,21 @@ bool __init coloring_init(void)
     ASSERT((max_colors & (max_colors - 1)) == 0);
     addr_col_mask = (max_colors - 1) << PAGE_SHIFT;
 
+    if ( !xen_num_colors )
+    {
+        printk(XENLOG_WARNING
+               "Xen color config not found. Using default color: %u\n",
+               XEN_DEFAULT_COLOR);
+        xen_colors[0] = XEN_DEFAULT_COLOR;
+        xen_num_colors = XEN_DEFAULT_NUM_COLORS;
+    }
+
+    if ( !check_colors(xen_colors, xen_num_colors) )
+    {
+        printk(XENLOG_ERR "Bad color config for Xen\n");
+        return false;
+    }
+
     if ( !dom0_num_colors )
     {
         printk(XENLOG_WARNING
-- 
2.34.1


