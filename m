Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544C821922
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660570.1030141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRH-0000Cf-Je; Tue, 02 Jan 2024 09:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660570.1030141; Tue, 02 Jan 2024 09:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRH-00004y-6n; Tue, 02 Jan 2024 09:51:59 +0000
Received: by outflank-mailman (input) for mailman id 660570;
 Tue, 02 Jan 2024 09:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRF-0006VR-Dt
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:57 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90d9161f-a954-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 10:51:56 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-556431c7d51so1221806a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:56 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:55 -0800 (PST)
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
X-Inumbo-ID: 90d9161f-a954-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189116; x=1704793916; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+nY1AcQoCECW9cvYTyCa0KuWYpxftrNLY7zKkG+lX0=;
        b=p6VmLlhs+6VMCbJpQVSixQtlUe1Oi/JKJPsU1NYopCtF2sJotzmkVfKuzWkl671LCv
         po14ttvQCW15jRP72qS6GhyEhjB6wefiN91JpzK58NGqRL8CXwzFfAms2J8HDWt36HiA
         VHd3luFdG7a2nHwSUThJJ4+A019YAtZYoPxG9XU7tBu7Cp4v4qACUe3DaZdO04MDiPVg
         p4r9cFtRWJ2DYa9Wto4kXzLXYQJTfGPOTGSwY3XeKywR836k5FQpNNQUhqg8/YV9bMOb
         Gw7g6i7SU38fjcqx43vL6mfQLyIDThvUJQ9tbbG5Wj2R3E4jq61bWE7UyCfyLn9b5/mq
         3HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189116; x=1704793916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+nY1AcQoCECW9cvYTyCa0KuWYpxftrNLY7zKkG+lX0=;
        b=HDLId8AAinwNaupFWMNuP7SjyupgmRp5Pf5JMRQfNRJwGqptuNkeV9pQkQ0pF2TWcI
         N191fTFnK4d8nfAXmElqFQgA89FJihy+/1PI4kyAHiRWVZkR0T6wW6LhVJ5ajR0QlBBY
         zD5iRcGV4M5zPsiQylBCJUNNKmpiUWigtuDbgFL9jN5LxmnvGQAPOrKJTqmFc6o6uFNg
         sY2Or7dm439u3Qh39D+aiP8X9AFwFdN4h7UeY2nNlBB3/zJxeUZ23Iz6ky331r36V+ss
         Ft4ggehmuLBQaDZrlxTvLBU0TsEuhUky4gwfHP646Kgkgtr73d5NjD4jlHtItJAWXDTw
         vtGQ==
X-Gm-Message-State: AOJu0YynuSRSJv46kxTnyp/7BlNugnQE+pgZmE/Dzui+k5xN0ALgIRus
	PDXGc5hZPkVA7rCbNI02/SSORD0ve/82z8uxAB1/QCpEtO0=
X-Google-Smtp-Source: AGHT+IH4y/zq1O7BDpjHBHIcYJ/XVuHSLzMuDKRzUA0tlTTyF5q1wpx+WPkHpbSnn0Tf82YWSlUSVg==
X-Received: by 2002:a17:906:1d6:b0:a26:8dee:a601 with SMTP id 22-20020a17090601d600b00a268deea601mr4140269ejj.247.1704189116239;
        Tue, 02 Jan 2024 01:51:56 -0800 (PST)
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
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v5 12/13] xen/arm: add Xen cache colors command line parameter
Date: Tue,  2 Jan 2024 10:51:37 +0100
Message-Id: <20240102095138.17933-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

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

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/arch/arm/llc-coloring.c       | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 163fe7bcb1..f983f22796 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2877,6 +2877,16 @@ mode.
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
 
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 526129cc43..99ea69ad39 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -18,6 +18,9 @@
 #include <asm/processor.h>
 #include <asm/sysregs.h>
 
+#define XEN_DEFAULT_COLOR       0
+#define XEN_DEFAULT_NUM_COLORS  1
+
 bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
@@ -30,6 +33,9 @@ static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
 static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __ro_after_init dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -87,6 +93,12 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 /* Return the LLC way size by probing the hardware */
 static unsigned int __init get_llc_way_size(void)
 {
@@ -161,6 +173,8 @@ static void dump_coloring_info(unsigned char key)
     printk("'%c' pressed -> dumping LLC coloring general info\n", key);
     printk("LLC way size: %u KiB\n", llc_way_size >> 10);
     printk("Number of LLC colors supported: %u\n", nr_colors);
+    printk("Xen has %u LLC colors: ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 static bool check_colors(unsigned int *colors, unsigned int num_colors)
@@ -217,6 +231,21 @@ bool __init llc_coloring_init(void)
         return false;
     }
 
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


