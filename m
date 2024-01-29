Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E99840EE8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673073.1047329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVID-0000Je-Ac; Mon, 29 Jan 2024 17:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673073.1047329; Mon, 29 Jan 2024 17:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIC-00009f-Qp; Mon, 29 Jan 2024 17:19:32 +0000
Received: by outflank-mailman (input) for mailman id 673073;
 Mon, 29 Jan 2024 17:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI9-0005vY-FN
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:29 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8effc653-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:28 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55c2c90c67dso3037320a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:28 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:27 -0800 (PST)
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
X-Inumbo-ID: 8effc653-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548768; x=1707153568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+y6eeYNyMDcSQ1B2g6r23A3/4HXzjPsqAidl0fgzB0=;
        b=jCQJR1Y70S1Rwq78IJw45VxIymXcXBu3OEAkBsMrDaKD/lWcPUUKV73bCp6YdhoL2L
         vbV9RN59oi4VCwfJF4iForykkbvCQPQqJ6XhcXfWagkvjeKv30v0LbbT4N+26Q0APnsJ
         iBLUCDoK4CBGs6pwoRqP+Zoujd+0q13GZmjdHkY2toP1F76nktKMiACiG+FeEdrHNtTv
         ZkJAXGpa11tYXIHP7njziGPNKnZxLlwz4HTRu4OTl4F/OaHOt/ZPPRrXLB5rsWdLg8vc
         RWi6rMBgkEJ8cZRNk+7wcTTOrisrEu8om3csJ7CLaZudp5XRtm8CkNbJOKZcXOab4/FG
         7dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548768; x=1707153568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+y6eeYNyMDcSQ1B2g6r23A3/4HXzjPsqAidl0fgzB0=;
        b=Xg1T4KBgnfbOk6iihSa+UqB1W+KUp84ombp+eHygqMpX3pmTls5A1PX4XVgqzyFCve
         cY/NrtVJaMfusxRYuoIj8QvNnm0K5qnRtKk6zsCZRDUSvo844Ngk4q8kppY9wPH78rg4
         tk4MRjkY+rhFioA4b839ffbbqbb3xxrdM3C9DNYuJWlCZ6gkUhnYllslAiNqLIg2hMqv
         1PgqacOSkLsUFwsGS3zxxlikZOJ7pT5vpBZztormQ1Wj3fNECcnQOWwMjA1TRHj8Lk8h
         c8tAh6dhblKChytD5W7hc35ATD8VHUO8ND9a+vpfii2cS2WSMPVQ5GXyOAxemdusrgyH
         9x0w==
X-Gm-Message-State: AOJu0YxiYWzHMTYU3pvzqZrnMJsULZojNJgdgFcoLJTEj5p8deWPFzDV
	d3zlrUxzy4WQtmbwyFVLencXhdkgZ09+vZVHpWZPeC/tnaYeJLV0ej1DbjiC/3f1xW++qMnAjT1
	DZBs=
X-Google-Smtp-Source: AGHT+IEI0GWlrodDNe0XQ3RXAMWNHoRmW/litoKg62TwP7wpr4XGruDNLNLR5Mz7/13p7Z4pZQdQGA==
X-Received: by 2002:aa7:d30c:0:b0:55e:e9f3:4f63 with SMTP id p12-20020aa7d30c000000b0055ee9f34f63mr2758139edq.3.1706548767846;
        Mon, 29 Jan 2024 09:19:27 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v6 12/15] xen/arm: add Xen cache colors command line parameter
Date: Mon, 29 Jan 2024 18:18:08 +0100
Message-Id: <20240129171811.21382-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add a new command line parameter to configure Xen cache colors.
These colors can be dumped with the cache coloring info debug-key.

By default, Xen uses the first color.
Benchmarking the VM interrupt response time provides an estimation of
LLC usage by Xen's most latency-critical runtime task. Results on Arm
Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
reserves 64 KiB of L2, is enough to attain best responsiveness:
- Xen 1 color latency:  3.1 us
- Xen 2 color latency:  3.1 us

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
 xen/common/llc-coloring.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d52d38b97a..8c2b799f1e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2876,6 +2876,16 @@ mode.
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
index 25e0861733..dace881b55 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -9,6 +9,9 @@
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
 
+#define XEN_DEFAULT_COLOR       0
+#define XEN_DEFAULT_NUM_COLORS  1
+
 bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
@@ -21,6 +24,9 @@ static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
 static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -78,6 +84,12 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, max_nr_colors, &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
@@ -106,6 +118,8 @@ static void dump_coloring_info(unsigned char key)
     printk("'%c' pressed -> dumping LLC coloring general info\n", key);
     printk("LLC way size: %u KiB\n", llc_way_size >> 10);
     printk("Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("Xen has %u LLC colors: ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 static bool check_colors(const unsigned int *colors, unsigned int num_colors)
@@ -149,6 +163,18 @@ void __init llc_coloring_init(void)
         panic("Number of LLC colors (%u) not in range [2, %u]\n",
               max_nr_colors, CONFIG_NR_LLC_COLORS);
 
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
+        panic("Bad LLC color config for Xen\n");
+
     register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
 
     arch_llc_coloring_init();
-- 
2.34.1


