Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617E9F1236
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856979.1269498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Zn-0003vV-8y; Fri, 13 Dec 2024 16:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856979.1269498; Fri, 13 Dec 2024 16:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Zn-0003sO-5Y; Fri, 13 Dec 2024 16:31:39 +0000
Received: by outflank-mailman (input) for mailman id 856979;
 Fri, 13 Dec 2024 16:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wx-0003wR-4i
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:43 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 505d4768-b96f-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:28:41 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d0f6fa6f8bso2959123a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:41 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:40 -0800 (PST)
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
X-Inumbo-ID: 505d4768-b96f-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107321; x=1734712121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2Fqewzc4NSZqd78RnQVSVrm5ltUTfiMxSBWlBJDggY=;
        b=EHFdkXKTEw1TeJrN+BsMuKpktu1qTB606QygXx3YIYkbDWEDp6+RtqWYziQJ8eSL60
         fzwT8ft2c4JcPF7e6Dg3qBmR+o8Gd1p+5YBKPxNoGDQZfE0FKEu1zvDGESuXeyjHomsv
         FJMZeQs6oeVbpH0Rp/P8OGDpbVAhmaql7prL7AraodyJOnTWiK+JQXjngVjj0hkGEVeJ
         SVYB9ilzKTEePprDwnHRgwjAFVWCO90h4MLZmzy308JSt/NIyHjF/yuAz00x4BuLKflf
         PW2pzOb/rCnsDBj6mNE6Fw5A2ZbrNah6dOc3HvwFCOWAuUdkbAT6YocCPPhWnKfFFNuw
         b5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107321; x=1734712121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2Fqewzc4NSZqd78RnQVSVrm5ltUTfiMxSBWlBJDggY=;
        b=JCODZws/jptT6MY9afuv4zhfe+3au4IhKBbt/vlferTDYFiuT7SUUEaXqRZEeHU2dL
         J6reGjqEaQQD1UItliR3Myi2C7xmckbqHdWOphJNGz2PczMVpBoTOQSCMXJrUDPywChV
         3+9ql5wdjnQmJpNvnceNq8ll3VTdtbCs5CGN9GjZmd0Ez8zvvSseVw7HTvcV1/vh4RYX
         3Nnl09aNH8b+c3Sl+FOQstDWKi+xGxi6x+aY2Qm8M+6H/+V+WBG+akEx0NN15YcqP6sx
         xPhnckcSslfEd1ptyTi7mmGAtr8jaL/iJJAsMbHNdREK806irAAkgwIDaTHtkZahaKLc
         CwbA==
X-Gm-Message-State: AOJu0YxZkVR/sXmmG4JIFoC/0poCNLJfJyWsMKxgghZW/Q0JWRXA5/3W
	9oum3MNeuFtq2+v4yxXPlkZUvAfVqz0L/eKVeOAltRY1saGuGVQTo57J9SK/nRCvOwDsC9UrrH7
	V1pM=
X-Gm-Gg: ASbGnctaMu5a1ZOg5DUnQEVvnpvVG7qdlqfXAjPr0mYN2+sa/0x5rffkxRRYGGwyJCL
	oFoJHOXw0JqZfuglG8c4P21bo3TZuCUaNmc9MHw6O1e0ycCxgSPgRWpQW/fhCOdp4q1WxrtISqf
	7aFegRVdBjSmHzcbniYCwRAvnoP0YnS6fT8t2h4gCtctNa2A7kEPTcENjy6vx8cjWLu9rls6e2m
	nanhYTUUkBbggYf1WAhzDlGK9wGIrrpDjKYedIFQwhczKkcNWZJTW0hORlm15arxQwj/LHY6oZH
	10rL4R2HQmGxE+Ff
X-Google-Smtp-Source: AGHT+IHGkm6ZpHTtlOX8qen1IdvyvNBfDHKUBnmNDwp2fqelZbnS9mSI2VsNF3FnqMeTMzhDYb9+sw==
X-Received: by 2002:a17:907:9705:b0:aab:75f1:e520 with SMTP id a640c23a62f3a-aab779b3b5fmr328981166b.34.1734107320717;
        Fri, 13 Dec 2024 08:28:40 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v12 10/12] xen/arm: add Xen cache colors command line parameter
Date: Fri, 13 Dec 2024 17:28:13 +0100
Message-ID: <20241213162815.9196-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
v12:
- no changes
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
index ec6b0d3bff..ff4837fcc6 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -13,6 +13,7 @@
 #include <xen/types.h>
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
+#define XEN_DEFAULT_NUM_COLORS 1
 
 /*
  * -1: not specified (disabled unless llc-size and llc-nr-ways present)
@@ -36,6 +37,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -94,6 +98,13 @@ static int __init parse_dom0_colors(const char *s)
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
@@ -178,6 +189,22 @@ void __init llc_coloring_init(void)
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
 
@@ -188,6 +215,8 @@ void dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void domain_dump_llc_colors(const struct domain *d)
-- 
2.43.0


