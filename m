Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0349D27DB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840133.1255998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzE-0001hr-QC; Tue, 19 Nov 2024 14:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840133.1255998; Tue, 19 Nov 2024 14:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzE-0001Wk-ES; Tue, 19 Nov 2024 14:13:48 +0000
Received: by outflank-mailman (input) for mailman id 840133;
 Tue, 19 Nov 2024 14:13:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOzC-0007nd-9x
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:46 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b557aec-a680-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:13:42 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso7885388a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:42 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:41 -0800 (PST)
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
X-Inumbo-ID: 7b557aec-a680-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdiNTU3YWVjLWE2ODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI1NjIyLjg2MTc1Miwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025622; x=1732630422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AJ6okQYUIeSH/YkzEeG8TfAqCBqc7r0nOUuYA65Dfs=;
        b=f5J6aQYanOhIGkoVr0o6GGPIVteYK/H42X5CUU7HSKgE1S89ofcdCIxGUmankLslDd
         KlcEdHFJOqlbEj6xsXcCCOooLYZ8WrR2UFIx169kk49/sKT3jYdl6VPQ4/jovqiRJpck
         jA9vlAfyBQ00zbwUHdopQXA1CaoX2AMVihJ4zGFrFfE+95CNj2pZlxwyJvIeIPxcw6Al
         jB07THOR2ta0FA+fRZ0rEBuLKZh3ibmwF6V6Ruz6pNlc1iTiMLpmInIyn4bfgiEMbECD
         AIVDCJldvjhPysXSVVpz7EJmBf2QTGX1kEgQGEEMwfqL0J4DcE+SLhBbS8bPh178OLtQ
         Ri3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025622; x=1732630422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AJ6okQYUIeSH/YkzEeG8TfAqCBqc7r0nOUuYA65Dfs=;
        b=pQRIX+8y3PEP1YPimWMFyqRulYX6ZjBn0/Jnkoub49mf61QciMM7BGOusPGxczPciA
         R8kuiQjX54hhh+6kTwakAR7EpTL+Dpzr9aRcCSZjRJ+ZgdD2EasvehXPqe2J2x/v8MNy
         RG3ng4xgmD83mzMV5H9vFRSYn+DFboQmdTc56X7Fdre06H7k0qgpeCORkIDhlsqP6uR0
         99PRloTbiHMKQWDAndthEbmt2R8pACYgsRwo+0doHnxyBbcUGGgt4VlFsqXrOGO0YUT5
         Fnzf7MMl4tcgEQBhdM+hZWDl6hRkw/IU4W5mSGj/7gDXJu0LE5My0UdLuuEly1Cmod2k
         yM1g==
X-Gm-Message-State: AOJu0YwF/Eflyqwct7X/qjs/D+bpsDlXcn1lhH3OYMgxFI5RXcWK4jvN
	JS/gf98PPfOapjFDd9W9Nusfwu3axjG2Z5ZalbwmeiQehdq4GHoIYy/vixZI46HQ0rdazUaTJBm
	Q
X-Google-Smtp-Source: AGHT+IHQ/5pea+N6U8Ama8taGDG4dsUijf3lo4Y7emSDPUeo9qTcWRL51/89uNTQls715GmOB2CWrg==
X-Received: by 2002:a05:6402:2688:b0:5cf:bfab:f0ca with SMTP id 4fb4d7f45d1cf-5cfbfabf229mr7009224a12.32.1732025621953;
        Tue, 19 Nov 2024 06:13:41 -0800 (PST)
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
Subject: [PATCH v10 10/12] xen/arm: add Xen cache colors command line parameter
Date: Tue, 19 Nov 2024 15:13:27 +0100
Message-ID: <20241119141329.44221-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
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
 xen/common/llc-coloring.c         | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 25f015c2de..f967df7360 100644
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
index 6ba9fb72ca..6e7a652884 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -12,6 +12,7 @@
 #include <xen/param.h>
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
+#define XEN_DEFAULT_NUM_COLORS 1
 
 bool __ro_after_init llc_coloring_enabled;
 boolean_param("llc-coloring", llc_coloring_enabled);
@@ -28,6 +29,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -86,7 +90,14 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
-static void print_colors(const unsigned int colors[], unsigned int num_colors)
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, ARRAY_SIZE(xen_colors),
+                              &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
+static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
 
@@ -167,6 +178,22 @@ void __init llc_coloring_init(void)
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
 
@@ -177,6 +204,8 @@ void dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void domain_dump_llc_colors(const struct domain *d)
-- 
2.43.0


