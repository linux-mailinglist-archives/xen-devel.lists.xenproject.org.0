Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705268B9F03
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715956.1118025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zip-0000S2-B5; Thu, 02 May 2024 16:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715956.1118025; Thu, 02 May 2024 16:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zio-0000NP-VC; Thu, 02 May 2024 16:55:50 +0000
Received: by outflank-mailman (input) for mailman id 715956;
 Thu, 02 May 2024 16:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zim-0006N3-Ow
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:48 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d254c69c-08a4-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 18:55:46 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a58a36008ceso1024928566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:46 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:46 -0700 (PDT)
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
X-Inumbo-ID: d254c69c-08a4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668946; x=1715273746; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2LM23qNbULSHEplCwn2ygOn0A5pB1f/lEILoWDwehY=;
        b=EdhfhOOl01LJETvsGwmmXcWY/iJqkxkb1SF6GlwzkCVjor1eauEh/lWdehSJx7a0x9
         OY1l/w3PrF+/WnydKz7nyyloQw3UN5j4bvbVTASYnUHcbKMO8mVMHX+eiINN1gtVTRTS
         CQZGsggcUbEurwfTOt21+pDImh56p6k9bHy6wotISDRX5voS3yKhlxsy5zRpDA5Sa7H+
         DcQaa15gmFdPQSfdSwYPvfgw9l2Jx/zN7M64jUmoA1VazzIe/iwvgVzApT6VAhLvyN8M
         hsVpw862VfuqMq3J9HYVySbVAKtI9cE1ati9KbH2I0LU9bmNqJnsKlDskPZSW85w/krR
         YYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668946; x=1715273746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2LM23qNbULSHEplCwn2ygOn0A5pB1f/lEILoWDwehY=;
        b=A8063wtrAGAol44CPP3ppYahdjkwdtyx86X3hdce3TOdPWuUUEtGClCedLvvr3IZhC
         BiU5KEftGYQFtAR89lrAdeamVRyA+JHCC0CPsu8fdCkp7mca52CQjteQPPfQxXfhSRBr
         3GcABCzCtSmAL4YLRO+emOo+TwXU+76o2sA/byjoC0kCl05zwUXUftC5MftHpAfBmG7W
         O0p3z1GtyzgIylJivrIaJ+unp/wSo0Z/UBQe/1iXdedC5aKM3UnVw8/BgDKhZMIuWf0k
         KEh5Z2X3BGNUfwBDECu28CFPZyy1M/iiSf33kLlasU9vAU3yAfpLbIIHFzuo/7YuS4ur
         Oe2Q==
X-Gm-Message-State: AOJu0Yxv8Or+oNWTg9ptj3naAvhMHjLxyH9uJNw/tmu5eGDuEV5ybqj3
	Yg/xAIK+51MJVI7HStiXyNeIHQHu3E06lMvLi/wT1t4MHZ+QpFEqaytnkZcGHjTHXH1eaRL/n+n
	Q
X-Google-Smtp-Source: AGHT+IF4jfiVFArle54ykP0fTOLLkWR9rD9jCanhWbQyFsRvUeSfTo1P5MXi9h0x0Akki+DHOaZYOA==
X-Received: by 2002:a17:906:a159:b0:a58:e71d:d74 with SMTP id bu25-20020a170906a15900b00a58e71d0d74mr73203ejb.13.1714668946329;
        Thu, 02 May 2024 09:55:46 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v8 11/13] xen/arm: add Xen cache colors command line parameter
Date: Thu,  2 May 2024 18:55:31 +0200
Message-Id: <20240502165533.319988-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
---
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
index f996627d0d..ad42d6b811 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -113,6 +113,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``buddy-alloc-size`` | Buddy allocator reserved size |
 +----------------------+-------------------------------+
+| ``xen-llc-colors``   | Xen color configuration       |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d4d1e37272..2427f865c5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2915,6 +2915,16 @@ mode.
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
index c598eb4bf7..0ddd6946f1 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -11,6 +11,7 @@
 #include <xen/param.h>
 
 #define NR_LLC_COLORS          (1 << CONFIG_MAX_LLC_COLORS_ORDER)
+#define XEN_DEFAULT_NUM_COLORS 1
 
 bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
@@ -27,6 +28,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -85,6 +89,13 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, ARRAY_SIZE(xen_colors),
+                              &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
@@ -163,6 +174,22 @@ void __init llc_coloring_init(void)
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
 
@@ -173,6 +200,8 @@ void dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void domain_dump_llc_colors(const struct domain *d)
-- 
2.34.1


