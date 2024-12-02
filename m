Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5F9E093D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846764.1261934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lk-0007gY-SV; Mon, 02 Dec 2024 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846764.1261934; Mon, 02 Dec 2024 16:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lk-0007eb-ON; Mon, 02 Dec 2024 16:59:32 +0000
Received: by outflank-mailman (input) for mailman id 846764;
 Mon, 02 Dec 2024 16:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9li-0006wq-DJ
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:30 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb840a3a-b0ce-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 17:59:29 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53df67d6659so6805931e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:29 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:28 -0800 (PST)
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
X-Inumbo-ID: cb840a3a-b0ce-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158769; x=1733763569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+tyePsYcLfjXIwoyPcyVhlRR1rCp6P8smeteExEhoc=;
        b=Ugyzb1brD6MFs42axqquuGznUi3WpDPNFShOSo1N+ZbkIJpmOneOV0X+Uhb2walngJ
         C7dCMcQ/nltrsEFBCl+ghyDVro3LSYogv6uy92GinlLU0Vx1z/fOueCxxzR9h0Pj5Vgv
         lOqDnxSsrO8uT33+qiSw3JE3jMiYX9xXgjOAtaD0Htj/b+2xQUVbN/UbWAfDXHdD2+2q
         JvnU6OatehL0e20fqoTtN3Ri3IwP6/fy4VkgFvxO+kHSQjBVLPh2iRo8/rG2lUak612f
         bQqXb2TprN5Q0ea/ghu8XZJs+2T3fq6eQJT8SfC1BAN979wOdzLS4Eq8xO4ZGYMI+TYl
         E8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158769; x=1733763569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+tyePsYcLfjXIwoyPcyVhlRR1rCp6P8smeteExEhoc=;
        b=fEZPmXaDttQQW6c+DCmjVyODt2OZ511PZDU3nidGWELL4N4FsW7plFDobUSK+JEPIu
         urqj/2r1iCUubT1avD8sziCxaTRQc8tsSg6IeIzVxkXlnqUoW3RMh1SV6WtulumFY0hA
         a8PMmcRHvf5rPzP73Q3bz12kq10P/tIvC5YAk44bnifM/5HIqEvpwVj7r4yS+NrxbkYX
         8J4c+0JTo6AitwvZ82zPNfwC4UziMKFiuPzofySlAewlvCsk3yGRAfnJhUfoANagg7r/
         mhQx8WYoduVgualx5ZiPtnKPsGKw4rqOdporiRATOOe8fKwfbZ5jynO77HEo93nOr1q5
         qcSA==
X-Gm-Message-State: AOJu0YzF8xb+A/Nv0l3zJ/iJ3ZIhu52zmWPvmTXnioO3tSQJW7R7d667
	l+QdutWXCHMjXGQ8QYjUnz24VmDWCb7Wm4ZBpSNz3OZMcmhWYC1eIxfmBPSQB7pCWLc43QKSI4U
	h
X-Gm-Gg: ASbGnctinbbUXRmeLrVGGx2Yk8Gqgd6a5DRyLNJ6pQePBZWc1Q+oKm4LSaxizL9zpKj
	lr2GKvGU4EUmvP88spisb7mewUMPZHVfUcBUe1gKUfPG6qpN9Jnovba8dd1ogsxqnWz5NpGGtxI
	sJiZFHn3yR5jHnXJRIdutdIstbPA2Mp01ENkLlldPgA8JOm9GT++XeGaCsa3G3p+QYcLeycCQYE
	5TdfBhoAMoN/EuvzapYQ2phzpjGv8T4XWVQ+c44KbucllO5CLlY2ppNvaLY5+nV6ZgoyBEE5TDc
	Yp+/CrO8n5EWyju3vclV47vvY1zw/jFSfKDgws/Wex2Q67rVhkIF
X-Google-Smtp-Source: AGHT+IEU8H5NoSdw3aNt7spYNOY0Mw2YbA0JS1+Va/g8Yz/R+xHt3Znt9iJeAGBGJtmADcICqNJniQ==
X-Received: by 2002:a05:6512:3994:b0:53d:a025:1142 with SMTP id 2adb3069b0e04-53df01172c2mr18687189e87.54.1733158768743;
        Mon, 02 Dec 2024 08:59:28 -0800 (PST)
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
Subject: [PATCH v11 04/12] xen/arm: add Dom0 cache coloring support
Date: Mon,  2 Dec 2024 17:59:13 +0100
Message-ID: <20241202165921.249585-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v11:
- minor changes
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
 xen/common/llc-coloring.c         | 120 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   1 +
 5 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 12972dbb2c..7b47d0ed92 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -107,6 +107,35 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
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
index 2b8cba9b2f..83d7585e7e 100644
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
@@ -2285,6 +2286,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2312,10 +2314,16 @@ void __init create_dom0(void)
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
+        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
+
     if ( alloc_dom0_vcpu0(dom0) == NULL )
         panic("Error creating domain 0 vcpu0\n");
 
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 5139890e3d..8f076849c1 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -25,6 +25,66 @@ static unsigned int __initdata llc_nr_ways;
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
@@ -49,9 +109,27 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
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
+            printk(XENLOG_ERR "LLC color %u >= %u (max allowed)\n", colors[i],
+                   max_nr_colors);
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
 
     if ( (llc_coloring_enabled < 0) && (llc_size && llc_nr_ways) )
     {
@@ -89,6 +167,9 @@ void __init llc_coloring_init(void)
     else if ( max_nr_colors < 2 )
         panic("Number of LLC colors %u < 2\n", max_nr_colors);
 
+    for ( i = 0; i < max_nr_colors; i++ )
+        default_colors[i] = i;
+
     arch_llc_coloring_init();
 }
 
@@ -110,6 +191,43 @@ void domain_dump_llc_colors(const struct domain *d)
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
+    if ( (dom0_num_colors > max_nr_colors) ||
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
index ee0c58ab1c..4ce14e4e4a 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -26,6 +26,7 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
-- 
2.43.0


