Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87F87CBCB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693759.1082316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5I1-0003ce-Jj; Fri, 15 Mar 2024 10:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693759.1082316; Fri, 15 Mar 2024 10:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5I0-0003UP-Nl; Fri, 15 Mar 2024 10:59:52 +0000
Received: by outflank-mailman (input) for mailman id 693759;
 Fri, 15 Mar 2024 10:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hx-0000aQ-L9
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:49 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 244b4dc5-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:49 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso3196346e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:49 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:47 -0700 (PDT)
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
X-Inumbo-ID: 244b4dc5-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500388; x=1711105188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy6uWZxsQOXNFgh1t1htiToV73nbyClGXslCHnFbHAI=;
        b=wnCszeK0MpHW9O9WgznMZiEFE77klpawPSJgJi8Auoj6514TVq5A84FHMu1QGOGuuM
         ll7KsRsbAjJ9bqpxl9Ayxx6mbiyNPgKMtMlF0nBKlLBwZJACsLj5mBjW4wiiztV/9pxI
         fk7dY3XUDeOgrXTOpGXrDYO1QQSWs7uH3DHdHPQQ1NzK85mkgjI0Io1bbKa+XLUD4erU
         +0TAvOj0+yrs9jgQGUJlJHVbi1kl79XH0trkdh4vhDB1pzyQA9CPWVKgE0t6n8gQRogB
         O0J+b6KvTfjmX9g+s3imX25Vcf1Iwj5t756+Wfj5XkzdvSi7rA4XVD4lLD1S5vStAl3o
         Nk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500388; x=1711105188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy6uWZxsQOXNFgh1t1htiToV73nbyClGXslCHnFbHAI=;
        b=KDyZTyhwi8COeFyoKkL8yMPmkWI5I5h4VSrGfQbrrN1Qa335/DBXqNl2CHjT0zrcpE
         zqqYAGcpZ5fBX98XYn2OLIBVRSXcCd1y5hrCxsRODXryW19gI4Wcbden6rMxkKhdy9KI
         JMWgWYocNDyOJ3W9VV8LESewtjZbPsN4JQDoVLkAV1+75RMs0g6mJBrz/Leg9zFlxAOH
         bK1hQkKe72rlTDc4vO3NEVGwxclo3J5BiHo9Kqk6sH7q4ij1IAqypjMxa0PxP6FebT6/
         rtFc11kk9F+RZ7NVA1HWf0hVTR1kMYMRtu/7/sV6fsdcj1iHz4bEU6xnJr/U/0j8LNlQ
         EMXQ==
X-Gm-Message-State: AOJu0YzkWv60aGsfVxZyVdh7wOFY3MpL1uWpjWmVxeyvIg9t6JTm8rwM
	CtORcQU/01CQtns6LdcUmWME55arMCg1bPJfNo2fcyjdjSkqTjtt/aMCKJqBeZOB9LvnxiHkfTk
	NAno=
X-Google-Smtp-Source: AGHT+IH/o8X1NzxhHhmnEuPlued9ZHWVlwWB4jolG9fXN+mFALODN5no3ZFup68S8jPAIXwcjRZW2w==
X-Received: by 2002:ac2:4ed1:0:b0:513:caa7:3773 with SMTP id p17-20020ac24ed1000000b00513caa73773mr2149934lfr.63.1710500388134;
        Fri, 15 Mar 2024 03:59:48 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v7 12/14] xen/arm: add Xen cache colors command line parameter
Date: Fri, 15 Mar 2024 11:59:00 +0100
Message-Id: <20240315105902.160047-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
v7:
- removed XEN_DEFAULT_COLOR
- XEN_DEFAULT_NUM_COLORS is now used in a for loop to set xen default colors
---
 docs/misc/cache-coloring.rst      |  2 ++
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/common/llc-coloring.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 50b6d94ffc..f427a14b65 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -122,6 +122,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``buddy-alloc-size`` | Buddy allocator reserved size |
 +----------------------+-------------------------------+
+| ``xen-llc-colors``   | Xen color configuration       |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 461403362f..fa18ec942e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2885,6 +2885,16 @@ mode.
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
index e34ba6b6ec..f1a7561d79 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -9,6 +9,8 @@
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
 
+#define XEN_DEFAULT_NUM_COLORS 1
+
 bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
 
@@ -22,6 +24,9 @@ static unsigned int __ro_after_init max_nr_colors;
 static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -79,6 +84,13 @@ static int __init parse_dom0_colors(const char *s)
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
@@ -147,6 +159,21 @@ void __init llc_coloring_init(void)
         panic("Number of LLC colors (%u) not in range [2, %u]\n",
               max_nr_colors, CONFIG_NR_LLC_COLORS);
 
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
+    else if ( !check_colors(xen_colors, xen_num_colors) )
+        panic("Bad LLC color config for Xen\n");
+
     arch_llc_coloring_init();
 }
 
@@ -157,6 +184,8 @@ void cf_check dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void cf_check domain_dump_llc_colors(const struct domain *d)
-- 
2.34.1


