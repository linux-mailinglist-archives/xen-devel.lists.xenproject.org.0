Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D870C9E0944
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846772.1261992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lq-0000nN-LN; Mon, 02 Dec 2024 16:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846772.1261992; Mon, 02 Dec 2024 16:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lq-0000kD-BV; Mon, 02 Dec 2024 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 846772;
 Mon, 02 Dec 2024 16:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lp-0006x4-1m
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee59eaa-b0ce-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 17:59:35 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa549d9dffdso738908866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:35 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:34 -0800 (PST)
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
X-Inumbo-ID: cee59eaa-b0ce-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158775; x=1733763575; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pagk7URGKJuUs/rn2A1jGcJIDnUg2XZUgAYh+RZjekY=;
        b=qOW3mCgU3OWgm47gnss4elRvvY4Aws7VCrjynaN1mmVf6huVWHbKfDLdPMqGpaigyf
         7d0xSM6xfIvm1JHBvMr0tW0HidxTgXLXmgOH0ZQP26WKZQUzCb2EXYEerEZGWLn2422U
         bmKlqJAbXVl9ltXyz3x/FuvM6sDJu9hhxkKarKg3y55RpQPuzpAQ536+AWpwIchsd3up
         4gLCZudmhCKK8Ax0RPmzHXtrEh3oMYbaZIMNZiHVUiAyg/fJwodXvS90gsv3KFzzDEV4
         940TA6HDUFw2fLm2ICS5KMpn3vEZfKc5B6w7r7rqvUh87UZkEjJMLDl0gIvEVtyKWikB
         y8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158775; x=1733763575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pagk7URGKJuUs/rn2A1jGcJIDnUg2XZUgAYh+RZjekY=;
        b=e0f9n+qj3LTioLwGoeZ1kHNRRGIaKUzL5bHFsNQcZywqttL3GD5YianBPuSpcL+cB4
         MOfRYyZ2nJ7Mi5fKlAr74N57JopO7ckrIcauZfd9XS+EZSudGhvhDXL28WRGkz528lLP
         jAoOelJfxmeMm87gYIUnhJtM4j3HdumFymD2VnzhxHuYadJavsbcnh3OhTU28Ga3313h
         IRpWEwmPgVNw9voVwHloO/13lGLviwqwpzQAte+vE1kbSoXARZT4B8XvtUkPxV4oXE0g
         g8kCkLJF4qFDS0qZjJPKEbEMZFckKzhWN2YRNO2nDqiixMElVV1/fmXAGKLiT9QJAQrm
         OL2A==
X-Gm-Message-State: AOJu0YzfA4bbEdF/nZmp8oG0ZRldVy/X8lmpr4a/AXvZuPDzCaFotg2B
	gwTvEPFGDogXSkE1Z2dUVgI05N3o+M6Op5iMn+fnOL/ivbpxxTyOf+mfu0rLOKcMqTMz+zVeIpq
	4
X-Gm-Gg: ASbGncsZmsgctVXcAv0vQRYZiBsQAsMV/k7DiCqH2WlkJm4A5pqr/CjWeGkpvFx/gVD
	OcG9g2GmatBLXx6TD6yHQKnUaDzZvtrCITiLJDBUQH06unVxP1SqhoorhGzjvkbGH6lijUYbaFs
	LyuHdYzhEVtRdwyyl95U3yuFoi5Z6c1H6TSZaYNR6XiEso3l5YQeHVfqvSCL6hlfUo2ph+F/E/i
	WmNHD1h9rW5s/ZK1KObgdHu2U+9MQ7WgEI7qNfu+zNXz9vfTZ2703HD2bALk/hjv4PPN8yJZndT
	euYFDtuecNwc2tD5BDuzGp0I2DdSXLkRvfrt5IT3sPNF3p5hZLxd
X-Google-Smtp-Source: AGHT+IHqanNwJRkV0inBQ2YdQNsACfSn8h1bYFVsTBn8btuIFrbCKnK748o/hg+sTWcfgvVbkaZ1lQ==
X-Received: by 2002:a17:906:3096:b0:aa5:3782:53af with SMTP id a640c23a62f3a-aa580f57d1dmr2144670766b.27.1733158774671;
        Mon, 02 Dec 2024 08:59:34 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v11 10/12] xen/arm: add Xen cache colors command line parameter
Date: Mon,  2 Dec 2024 17:59:19 +0100
Message-ID: <20241202165921.249585-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add a new command line parameter to configure Xen cache colors.
These colors are dumped together with other coloring info.

Benchmarking the VM interrupt response time provides an estimation of
LLC usage by Xen's most latency-critical runtime task. Results on Arm
Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
reserves 64 KiB of L2, is enough to attain best responsiveness:
- Xen 1 color latency:  3.1 us
- Xen 2 color latency:  3.1 us

Since this is the most common target for Arm cache coloring, the default
amount of Xen colors is set to one.

More colors are instead very likely to be needed on processors whose L1
cache is physically-indexed and physically-tagged, such as Cortex-A57.
In such cases, coloring applies to L1 also, and there typically are two
distinct L1-colors. Therefore, reserving only one color for Xen would
senselessly partitions a cache memory that is already private, i.e.
underutilize it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v11:
- no changes
v10:
- no changes
v9:
- no changes
v8:
- added bound check on xen_colors in llc_coloring_init()
v7:
- removed XEN_DEFAULT_COLOR
- XEN_DEFAULT_NUM_COLORS is now used in a for loop to set xen default colors
---
 docs/misc/cache-coloring.rst      |  2 ++
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/common/llc-coloring.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 5224b27afe..e156062aa2 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -115,6 +115,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``buddy-alloc-size`` | Buddy allocator reserved size |
 +----------------------+-------------------------------+
+| ``xen-llc-colors``   | Xen color configuration       |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 3a70c49c05..992e1f993e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2923,6 +2923,16 @@ mode.
 **WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
 The latter takes precedence if both are set.**
 
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
 
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 0f22a9b72c..2e7c0f505d 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -11,6 +11,7 @@
 #include <xen/param.h>
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
+#define XEN_DEFAULT_NUM_COLORS 1
 
 /*
  * -1: not specified (disabled unless llc-size and llc-nr-ways present)
@@ -32,6 +33,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -90,6 +94,13 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, ARRAY_SIZE(xen_colors),
+                              &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 static void print_colors(const unsigned int colors[], unsigned int num_colors)
 {
     unsigned int i;
@@ -173,6 +184,22 @@ void __init llc_coloring_init(void)
     for ( i = 0; i < max_nr_colors; i++ )
         default_colors[i] = i;
 
+    if ( !xen_num_colors )
+    {
+        unsigned int i;
+
+        xen_num_colors = MIN(XEN_DEFAULT_NUM_COLORS, max_nr_colors);
+
+        printk(XENLOG_WARNING
+               "Xen LLC color config not found. Using first %u colors\n",
+               xen_num_colors);
+        for ( i = 0; i < xen_num_colors; i++ )
+            xen_colors[i] = i;
+    }
+    else if ( xen_num_colors > max_nr_colors ||
+              !check_colors(xen_colors, xen_num_colors) )
+        panic("Bad LLC color config for Xen\n");
+
     arch_llc_coloring_init();
 }
 
@@ -183,6 +210,8 @@ void dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void domain_dump_llc_colors(const struct domain *d)
-- 
2.43.0


