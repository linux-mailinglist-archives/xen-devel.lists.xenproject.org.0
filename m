Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FF67806A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483032.749001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3e-0002w2-Cp; Mon, 23 Jan 2023 15:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483032.749001; Mon, 23 Jan 2023 15:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3e-0002mz-6u; Mon, 23 Jan 2023 15:48:30 +0000
Received: by outflank-mailman (input) for mailman id 483032;
 Mon, 23 Jan 2023 15:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3c-00006V-3K
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:28 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6078c854-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:48:27 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id vw16so31591843ejc.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:27 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:26 -0800 (PST)
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
X-Inumbo-ID: 6078c854-9b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptsteZfIhpfF2UQfbP6Zi8kakL6wMfzWUQYlwBmp7AM=;
        b=2DpkluxTwEf/rRNWROpMgUV2g5OJe6zodA3z8G79y/tFiEa/xuzYvvNsjq/cJp25DW
         ch2upGGp+OeeGZEH6uBjtwDVFTSlDD8ATwiiqu5BC06x7KMJiD/PaAIMqCoaXEumAZ+K
         +woTazI9Bikae17grp8UM2v2O6EqVxuhcxIymq04xG0UN8WDtJiUYAFHecber9pBv+ws
         75JLet58stpmZ34/+wVep9dcDpkOD73930kMyI/ET80Bf/OW60CznHxRlYnimonmum2A
         ZCmPHqZ/hUQSvmpcWT19bI3V0n9vRSwJOOGDFQHA7N4aO9FIwsdHVKgUjcYYaYRJJGJv
         8UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptsteZfIhpfF2UQfbP6Zi8kakL6wMfzWUQYlwBmp7AM=;
        b=xPtW4JrAjcThHGahy3YpOb7auqnFAYLGy4p2HHe3xH4hBGfpLWV9FuazxggQZRjxtr
         rCYPnCozuDtNwjEhpFyJt6JDdRLX3dqYq16/U6rgjQVtQj4Ry6ikq2ApqmzD0ZgjzSlI
         O0ecd2hIMS5D6VEKd1cQjSfcSphs3Dky1g8siAKTqzoNCX0Mp+IdhcoiIaT31snFSWqs
         JSnwTSxdRrTTKzPH2z+8WFOwcxeqLlSvpgHf4FFPnGLKw71V3dpAhpfD/DUP5MIT5TPp
         0TOjsNsGcHfD6Nm7neIwbGwujvDBvjSKtYA8cu0RFfdtVnLcGjyKSYJ2U57ZojMDM4MV
         SPyg==
X-Gm-Message-State: AFqh2krpmuO6DKKEMw+Fs/7bB8rZTLb5whqH59wkIIrFoyqr7+h/Nmqd
	vRQfX274/VWOg6vnRevaxNbxw6g036932PV0
X-Google-Smtp-Source: AMrXdXufOtlIu4zh2FVI6Bx7clwNuhDAjNxjB+9zPKqe3JEQrOrwigNGOjnHHO0yrWiiAXQBqeVl5A==
X-Received: by 2002:a17:906:a09:b0:7c1:4a3a:dc97 with SMTP id w9-20020a1709060a0900b007c14a3adc97mr32277336ejf.0.1674488906739;
        Mon, 23 Jan 2023 07:48:26 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v4 10/11] xen/arm: add Xen cache colors command line parameter
Date: Mon, 23 Jan 2023 16:47:34 +0100
Message-Id: <20230123154735.74832-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
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
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/arch/arm/llc_coloring.c       | 30 ++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a89c0cef61..d486946648 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2796,6 +2796,16 @@ In the case that x2apic is in use, this option switches between physical and
 clustered mode.  The default, given no hint from the **FADT**, is cluster
 mode.
 
+### xen-llc-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `0: the lowermost color`
+
+Specify Xen LLC color configuration. This options is available only when
+`CONFIG_LLC_COLORING` is enabled.
+Two colors are most likely needed on platforms where private caches are
+physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
+
 ### xenheap_megabytes (arm32)
 > `= <size>`
 
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index 22612d455b..745e93a61a 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -19,6 +19,10 @@
 #include <asm/processor.h>
 #include <asm/sysregs.h>
 
+/* By default Xen uses the lowest color */
+#define XEN_DEFAULT_COLOR       0
+#define XEN_DEFAULT_NUM_COLORS  1
+
 bool llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
@@ -33,6 +37,9 @@ static paddr_t __ro_after_init addr_col_mask;
 static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __ro_after_init dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
 
 /*
@@ -83,6 +90,12 @@ static int parse_color_config(const char *buf, unsigned int *colors,
     return *s ? -EINVAL : 0;
 }
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 static int __init parse_dom0_colors(const char *s)
 {
     return parse_color_config(s, dom0_colors, &dom0_num_colors);
@@ -166,6 +179,8 @@ static void dump_coloring_info(unsigned char key)
     printk("LLC way size: %u KiB\n", llc_way_size >> 10);
     printk("Number of LLC colors supported: %u\n", nr_colors);
     printk("Address to LLC color mask: 0x%lx\n", addr_col_mask);
+    printk("Xen LLC colors: ");
+    print_colors(xen_colors, xen_num_colors);
 }
 
 bool __init llc_coloring_init(void)
@@ -202,6 +217,21 @@ bool __init llc_coloring_init(void)
 
     addr_col_mask = (nr_colors - 1) << PAGE_SHIFT;
 
+    if ( !xen_num_colors )
+    {
+        printk(XENLOG_WARNING
+               "Xen LLC color config not found. Using default color: %u\n",
+               XEN_DEFAULT_COLOR);
+        xen_colors[0] = XEN_DEFAULT_COLOR;
+        xen_num_colors = XEN_DEFAULT_NUM_COLORS;
+    }
+
+    if ( !check_colors(xen_colors, xen_num_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for Xen\n");
+        return false;
+    }
+
     register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
 
     return true;
-- 
2.34.1


