Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9589D27D4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840123.1255926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz8-0008Jh-6f; Tue, 19 Nov 2024 14:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840123.1255926; Tue, 19 Nov 2024 14:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz8-0008H3-2p; Tue, 19 Nov 2024 14:13:42 +0000
Received: by outflank-mailman (input) for mailman id 840123;
 Tue, 19 Nov 2024 14:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz6-0007nQ-15
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7805611e-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:13:37 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cfbeed072dso3603891a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:37 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:36 -0800 (PST)
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
X-Inumbo-ID: 7805611e-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc4MDU2MTFlLWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NjE3LjMwOTMxMywic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025616; x=1732630416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSS8OjeN81AaxAwiIdMOBdnmEpWyp3080hfiDG+hD5A=;
        b=nL9leXc7qvT57ecCHIHdMEVs4Flvar5Md8flDiIKJ/OH7TzonpMNiUu3BuB5I2aEVf
         EEY2d8DVILaqrkoYgKdTEhgcQLqFMd/zxqjgXa4sTKSzbYxJSUC6MgRCs5GO+Mjq39Ub
         Y1c0VJc++MxrU2B4Ab/9JQY+4oyD9U6xDhdx3URojpmAHfUW1hD2kF+p3NAgzs7StVqF
         VD4Ld9NoPEkU8z4uYxqdgV47acU82QCBs30vRQ8c5lSOckZp/1aNK9cBwjEY/HXEPGoj
         7EYkKN/cVR3HIWR8gY6lbz9kiY85vWWsLrDwk3bCTxYhCrsyGbhFHAw+wwDYmWt08pz6
         7sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025616; x=1732630416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSS8OjeN81AaxAwiIdMOBdnmEpWyp3080hfiDG+hD5A=;
        b=eCU4uEtELRT94B5NI6VwvnVBUnlgBE44v9GgtN9VtVhw2SY5H+6W1OFDWiVhyJGV/w
         djsLlArBXZixCsHQeqbpmySRZmVkQraOVdPOR3eKfP1BfcI6tRh7oPJNi2uCHdWngMF9
         2iSU9jUmCfRXyLNMuLR25JdNiJ/YTRrdAUu11j7ARZAPGj5dlnF+zcVgC1BwZeA95Fqx
         nDdxukL+3VKOmFQakRXRNrALvRTq0a40NTmRj1nkGMqnXF9UN1yggHS1mBNkCARTUzCU
         9mWb+DhuBFEPV+SWJDRZsT0TsK/JpVJ3sOaxCsnSo6oBaTCQ4crbbMrweQkAHz7bXS49
         LS8Q==
X-Gm-Message-State: AOJu0YyZeLw+t0aSCHCUoi5clM/rhDGz0/LqG0pKdeBj8cnqlerrXWBL
	XBWd3Tyec4WjSwhsIZ0T8/BOSLSvtQt8ma9TRa245aTQ+QLr4rursWD4hBGzxY9G5WIt19r0myM
	l
X-Google-Smtp-Source: AGHT+IEkgnVbNUJaTPmh+VwjKkA+x1O9Oqhen9Z899NT2wb4z8lfP1B5T2xmQDI0/iyRtM7XWu2rig==
X-Received: by 2002:a17:907:f79b:b0:aa4:ce42:fa7f with SMTP id a640c23a62f3a-aa4ce4304fcmr208509866b.7.1732025616541;
        Tue, 19 Nov 2024 06:13:36 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 04/12] xen/arm: add Dom0 cache coloring support
Date: Tue, 19 Nov 2024 15:13:21 +0100
Message-ID: <20241119141329.44221-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a command line parameter to allow the user to set the coloring
configuration for Dom0.
A common configuration syntax for cache colors is introduced and
documented.
Take the opportunity to also add:
 - default configuration notion.
 - function to check well-formed configurations.

Direct mapping Dom0 isn't possible when coloring is enabled, so
CDF_directmap flag is removed when creating it.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v10:
- fixed array type for colors parameter in check_colors()
v9:
- moved domain_llc_coloring_free() in next patch cause it's never used for dom0
v8:
- added bound check on dom0_num_colors
- default colors array set just once
v7:
- parse_color_config() doesn't accept leading/trailing commas anymore
- removed alloc_colors() helper
v6:
- moved domain_llc_coloring_free() in this patch
- removed domain_alloc_colors() in favor of a more explicit allocation
- parse_color_config() now accepts the size of the array to be filled
- allocate_memory() moved in another patch
v5:
- Carlo Nonato as the new author
- moved dom0 colors parsing (parse_colors()) in this patch
- added dom0_set_llc_colors() to set dom0 colors after creation
- moved color allocation and checking in this patch
- error handling when allocating color arrays
- FIXME: copy pasted allocate_memory() cause it got moved
v4:
- dom0 colors are dynamically allocated as for any other domain
  (colors are duplicated in dom0_colors and in the new array, but logic
  is simpler)
---
 docs/misc/cache-coloring.rst      |  29 ++++++++
 docs/misc/xen-command-line.pandoc |   9 +++
 xen/arch/arm/domain_build.c       |  10 ++-
 xen/common/llc-coloring.c         | 119 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   1 +
 5 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index b608284e9b..c5fb33996c 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -105,6 +105,35 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``llc-nr-ways``      | Set the LLC number of ways    |
 +----------------------+-------------------------------+
+| ``dom0-llc-colors``  | Dom0 color configuration      |
++----------------------+-------------------------------+
+
+Colors selection format
+***********************
+
+Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
+the color selection can be expressed using the same syntax. In particular a
+comma-separated list of colors or ranges of colors is used.
+Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
+sides.
+
+Note that:
+
+- no spaces are allowed between values.
+- no overlapping ranges or duplicated colors are allowed.
+- values must be written in ascending order.
+
+Examples:
+
++-------------------+-----------------------------+
+| **Configuration** | **Actual selection**        |
++-------------------+-----------------------------+
+| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
++-------------------+-----------------------------+
+| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
++-------------------+-----------------------------+
+| 0                 | [0]                         |
++-------------------+-----------------------------+
 
 Auto-probing of LLC specs
 #########################
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index abd8dae96f..bfdc8b0002 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
 
 Specify a list of IO ports to be excluded from dom0 access.
 
+### dom0-llc-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `All available LLC colors`
+
+Specify dom0 LLC color configuration. This option is available only when
+`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
+colors are used.
+
 ### dom0_max_vcpus
 
 Either:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a95376dcdc..01aa9016f5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain_page.h>
@@ -2284,6 +2285,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2311,10 +2313,16 @@ void __init create_dom0(void)
             panic("SVE vector length error\n");
     }
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
+    if ( !llc_coloring_enabled )
+        flags |= CDF_directmap;
+
+    dom0 = domain_create(0, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
 
+    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
+        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
+
     if ( alloc_dom0_vcpu0(dom0) == NULL )
         panic("Error creating domain 0 vcpu0\n");
 
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 45b001b105..740b5b9e4f 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -20,6 +20,66 @@ static unsigned int __initdata llc_nr_ways;
 integer_param("llc-nr-ways", llc_nr_ways);
 /* Number of colors available in the LLC */
 static unsigned int __ro_after_init max_nr_colors;
+/* Default coloring configuration */
+static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
+
+static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
+static unsigned int __initdata dom0_num_colors;
+
+/*
+ * Parse the coloring configuration given in the buf string, following the
+ * syntax below.
+ *
+ * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
+ * RANGE               ::= COLOR-COLOR
+ *
+ * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
+ */
+static int __init parse_color_config(const char *buf, unsigned int colors[],
+                                     unsigned int max_num_colors,
+                                     unsigned int *num_colors)
+{
+    const char *s = buf;
+
+    *num_colors = 0;
+
+    while ( *s != '\0' )
+    {
+        unsigned int color, start, end;
+
+        start = simple_strtoul(s, &s, 0);
+
+        if ( *s == '-' )    /* Range */
+        {
+            s++;
+            end = simple_strtoul(s, &s, 0);
+        }
+        else                /* Single value */
+            end = start;
+
+        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
+             (*num_colors + (end - start)) >= max_num_colors )
+            return -EINVAL;
+
+        /* Colors are range checked in check_colors() */
+        for ( color = start; color <= end; color++ )
+            colors[(*num_colors)++] = color;
+
+        if ( *s == ',' )
+            s++;
+        else if ( *s != '\0' )
+            break;
+    }
+
+    return *s ? -EINVAL : 0;
+}
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),
+                              &dom0_num_colors);
+}
+custom_param("dom0-llc-colors", parse_dom0_colors);
 
 static void print_colors(const unsigned int colors[], unsigned int num_colors)
 {
@@ -44,9 +104,26 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
     printk(" }\n");
 }
 
+static bool __init check_colors(const unsigned int colors[],
+                                unsigned int num_colors)
+{
+    unsigned int i;
+
+    for ( i = 0; i < num_colors; i++ )
+    {
+        if ( colors[i] >= max_nr_colors )
+        {
+            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], max_nr_colors);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 void __init llc_coloring_init(void)
 {
-    unsigned int way_size;
+    unsigned int way_size, i;
 
     if ( llc_size && llc_nr_ways )
     {
@@ -83,6 +160,9 @@ void __init llc_coloring_init(void)
     } else if ( max_nr_colors < 2 )
         panic("Number of LLC colors %u < 2\n", max_nr_colors);
 
+    for ( i = 0; i < max_nr_colors; i++ )
+        default_colors[i] = i;
+
     arch_llc_coloring_init();
 }
 
@@ -104,6 +184,43 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
+static void __init domain_set_default_colors(struct domain *d)
+{
+    printk(XENLOG_WARNING
+           "LLC color config not found for %pd, using all colors\n", d);
+
+    d->llc_colors = default_colors;
+    d->num_llc_colors = max_nr_colors;
+}
+
+int __init dom0_set_llc_colors(struct domain *d)
+{
+    typeof(*dom0_colors) *colors;
+
+    if ( !dom0_num_colors )
+    {
+        domain_set_default_colors(d);
+        return 0;
+    }
+
+    if ( dom0_num_colors > max_nr_colors ||
+         !check_colors(dom0_colors, dom0_num_colors) )
+    {
+        printk(XENLOG_ERR "%pd:  bad LLC color config\n", d);
+        return -EINVAL;
+    }
+
+    colors = xmalloc_array(typeof(*dom0_colors), dom0_num_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    memcpy(colors, dom0_colors, sizeof(*colors) * dom0_num_colors);
+    d->llc_colors = colors;
+    d->num_llc_colors = dom0_num_colors;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index ad2525e153..9cf49f574e 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -27,6 +27,7 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __COLORING_H__ */
 
-- 
2.43.0


