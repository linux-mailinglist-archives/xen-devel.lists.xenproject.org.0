Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2198608E42
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428414.678563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmv-0004Rp-On; Sat, 22 Oct 2022 15:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428414.678563; Sat, 22 Oct 2022 15:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmv-0004Kr-KM; Sat, 22 Oct 2022 15:51:53 +0000
Received: by outflank-mailman (input) for mailman id 428414;
 Sat, 22 Oct 2022 15:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmt-0002Ir-5o
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:51 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710265bf-5221-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 17:51:50 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id a67so16325495edf.12
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:50 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:49 -0700 (PDT)
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
X-Inumbo-ID: 710265bf-5221-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+bXc+eUGwUw9pKJuzS9R2sHd4FPFFlOJJczFfA/Xfo=;
        b=SVMkJvKI59q+DF9RWoWnNA6MKfFZUQcGyxWuatT+x2LZl5gR2Kg+Qc7ue1fjFSf7nK
         qz/eSC0BnYzjP/3cdfdw9A5D7VmKK/ZkcZ7QJbBDgR4GhNgFVbFhmjCi7vMfZBvWUCNI
         vSs4ICN8sY8Xa0EDQ5xLsHpHnSpXJyyQD9UoXpPQYtrfLEmKdDNwpMyeqX2iMwc2yahK
         wc7qJOixltKVQjM710TXVHLFEGSvJRHZxelQxpLM6Tk6EublMbKQf1jTuO/TNy+4I5/p
         vinPxcmFIegiSpEI1eQEj5NkoiuwLwxe1VfEdwj5XcYDujxaNl0Z/7Cnc8cK4WloaTk6
         +f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+bXc+eUGwUw9pKJuzS9R2sHd4FPFFlOJJczFfA/Xfo=;
        b=vQPojUkQEVzFvPph2mRv1uMYGAliUyVCuvLqBAI38LYLgOR3ayh8391C57Y2KfRHNT
         Os9qPoLpcygiNFErQNrBwbYN8oHcuCn/kO6kUnXhYmGKYdQjKmXs5FwjAhvHAW/3Y+vD
         bCNkbg4jvO3wed1vcwZZcPUn6WP5L5U/zW8sVuVBvdE60JQ7rWAKKAuFkzGSF+xUpgnm
         MHJNPjy6Y8OBsOoaSu7uW5BWsngKEmi/IvyMnEnW43q8WhjoohYyEUDM4GRfJAJjr/wP
         giB0/biL2ZduCJR/xJ0JSf4CCzM+Jm0BT6NWi6oWxcTPupM9j4fPBD5cXOLWW5Who1KZ
         CErQ==
X-Gm-Message-State: ACrzQf3YsuRyibeU3LR1g6qiLFQNuB2gW7b2JiyqaJqgo6272oP3r1QW
	bLDVy/4Qgwc4Rx0pzHmxLxNxQv52aTUKWQ==
X-Google-Smtp-Source: AMsMyM5ezc5fcL/vFULr76ElxNM4qMC5gC1Qkvy2d09jfd8RqYnGhxgcRvLDj/ICdEDQ8rNj6bI16g==
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id wt9-20020a170906ee8900b0073d70c51a4emr19526601ejb.683.1666453909648;
        Sat, 22 Oct 2022 08:51:49 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v3 8/9] xen/arm: add Xen cache colors command line parameter
Date: Sat, 22 Oct 2022 17:51:19 +0200
Message-Id: <20221022155120.7000-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This commit adds a new command line parameter to configure Xen cache
colors. These colors can be dumped with the cache coloring info debug-key.

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

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst  |  8 ++++----
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/arch/arm/coloring.c           | 30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index 0c89278aee..80eb259dfa 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -19,8 +19,8 @@ In order to enable and use it, few steps are needed.
 - If needed, change the amount of memory reserved for the buddy allocator either
   from the Xen configuration file, via the CONFIG_BUDDY_ALLOCATOR_SIZE value,
   or with the command line option. See `Colored allocator and buddy allocator`.
-- Assign colors to domains using the `Color selection format`_ (see
-  `Coloring parameters`_ for more documentation pointers).
+- Assign colors to each memory pool (Xen, Dom0/DomUs) using the
+  `Color selection format`_ for `Coloring parameters`_ configuration.
 
 Background
 **********
@@ -113,8 +113,8 @@ Examples:
 Coloring parameters
 *******************
 
-LLC way size (as previously discussed) and Dom0 colors can be set using the
-appropriate command line parameters. See the relevant documentation in
+LLC way size (as previously discussed), Xen colors and Dom0 colors can be set
+using the appropriate command line parameters. See the relevant documentation in
 "docs/misc/xen-command-line.pandoc".
 
 DomUs colors can be set either in the xl configuration file (relative
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 25a59dd6a9..d831cf1196 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2754,6 +2754,15 @@ In the case that x2apic is in use, this option switches between physical and
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
index 2cae215cd2..80c76c057f 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -32,6 +32,10 @@
 #include <asm/processor.h>
 #include <asm/sysregs.h>
 
+/* By default Xen uses the lowest color */
+#define XEN_DEFAULT_COLOR       0
+#define XEN_DEFAULT_NUM_COLORS  1
+
 /* Size of an LLC way */
 static unsigned int __ro_after_init llc_way_size;
 /* Number of colors available in the LLC */
@@ -43,6 +47,9 @@ static uint64_t __ro_after_init addr_col_mask;
 #define addr_set_color(addr, color) (((addr) & ~addr_col_mask) \
                                      | ((color) << PAGE_SHIFT))
 
+static unsigned int xen_colors[CONFIG_MAX_CACHE_COLORS];
+static unsigned int xen_num_colors;
+
 static unsigned int dom0_colors[CONFIG_MAX_CACHE_COLORS];
 static unsigned int dom0_num_colors;
 
@@ -94,6 +101,12 @@ static int parse_color_config(const char *buf, unsigned int *colors,
 
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
@@ -188,6 +201,8 @@ static void dump_coloring_info(unsigned char key)
     printk("LLC way size: %u KiB\n", llc_way_size >> 10);
     printk("Number of LLC colors supported: %u\n", max_colors);
     printk("Address color mask: 0x%lx\n", addr_col_mask);
+    printk("Xen colors: ");
+    print_colors(xen_colors, xen_num_colors);
 }
 
 bool __init coloring_init(void)
@@ -225,6 +240,21 @@ bool __init coloring_init(void)
 
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


