Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE49F121B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856850.1269408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wm-00053j-6w; Fri, 13 Dec 2024 16:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856850.1269408; Fri, 13 Dec 2024 16:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wm-00050P-26; Fri, 13 Dec 2024 16:28:32 +0000
Received: by outflank-mailman (input) for mailman id 856850;
 Fri, 13 Dec 2024 16:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wk-0003wR-Mg
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49909045-b96f-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:28:30 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa6aee68a57so291062666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:30 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:28 -0800 (PST)
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
X-Inumbo-ID: 49909045-b96f-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107309; x=1734712109; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFD4/otmPlpgzMGg8v7puJ0h1cJQAWQfjG2jho9su4o=;
        b=OvLlQeYoMIj8E8MmaHjm82ncBrWUntu/ATAwuwGKQexr15kBAhERAXoRM5mNexQaeP
         vzo9iDJqclQBttIBnMYnwTItF3GTlafrb57+uh6qNccb/r9XY8AAXRcclaRwMF34GFr5
         bGu0iwENHN448LUhd7520PoFFYNIhudvWuE7zL92ULs3f1HMawmjyopZsLX+WGyJ/5BT
         ujgVXNLiaSzDBAIfaBJT0Rlbt4VO5m+mRvYOoG2Z5rR+XG58pNGKns1QXUzxzyPPxNjZ
         dzEdjZqynAlU+C0sb6VHhCmyv2omHzu0mOGiSHWnpAWqWKjIiftPUCniw0SwJ15tDlno
         ex1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107309; x=1734712109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFD4/otmPlpgzMGg8v7puJ0h1cJQAWQfjG2jho9su4o=;
        b=f2Q1+n8yYtv5RsG3RTZw7vFAqfOlt2W/o4B6BaryftJlfbpuCVIDdxzKqjyjBk8HGs
         BXIuBuIKUGLg5f5xMMaYtWlbove2paN0MsLsaRuHv+BbhcF1NE2/CM73ZAlY/KJG3EmU
         mp0ohxmD7gP5ak3GvuE/xTUaEgmMeBozjUyv6rrTtP8wtD+pwZpo3RQ4Wc/iiVncLkZY
         RD5uhDQzDUHyvMFpQLT0bpIMf+SB7etEmBoHqzifutY8V2xvU+cvp1RXxsbulROB5ZuO
         bBsz9XSM/CRfGzNDjYHYpoTMhqzvm4aXso+BxSU4X/q9vp+IPOjIReEEwqJUxzPw1zQp
         67lQ==
X-Gm-Message-State: AOJu0YzPoEEcnCwBSvZ0nrOf0yeTETLcuQpj8DhjuWfiQ0vOGcRqsOtg
	TDBvVyGLi0Sts3SZO/XMR4C57ihfoh3zYDu2SXZhE78rqxo3dgQ6F7x0Mt+6cjT5q3iL4NFa4bE
	o/rw=
X-Gm-Gg: ASbGncsLHuNGuwjGy8qvhJZNAmrEtNhWVgvYj2JqCNz5UoZGaIDmDnGtnSWDT3nN+iR
	VicMbQ+FN7hRGBZfMpLXjdZ+fLNbexevLntjrmLroFfB2BVfMSubIFTId88B6PSQHxViZSupuhg
	MqKhv+5dmnx3a0+q/n/OS5tXeBa0hg1urIBZp5DI73mHIa6FVon9wIDTYZ4Ig8lsc6TZk18wFX+
	aETu8tJV0pu+Nwab9FqczJHDILa2bzscy7lyEd1beHHXHFF6MJpJA5/IEzaaiZ5nIQBslRONRcm
	01Wojjq1g5LjZs/z
X-Google-Smtp-Source: AGHT+IGNIJkZzVMpAqUGf1C+5+Vp3SD/XGAGPAJTPJOU7edrzGVEySLsPzi7s6m5CcvyMvSd5TRKkQ==
X-Received: by 2002:a17:907:3f1b:b0:aa6:7165:504b with SMTP id a640c23a62f3a-aab779b3ff3mr408116366b.31.1734107309284;
        Fri, 13 Dec 2024 08:28:29 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 04/12] xen/arm: add Dom0 cache coloring support
Date: Fri, 13 Dec 2024 17:28:07 +0100
Message-ID: <20241213162815.9196-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
v12:
- no changes
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
 xen/arch/arm/domain_build.c       |   9 ++-
 xen/common/llc-coloring.c         | 120 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   1 +
 5 files changed, 166 insertions(+), 2 deletions(-)

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
index bfcff99194..d7c9be4c4b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2358,6 +2358,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2385,10 +2386,16 @@ void __init create_dom0(void)
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
index 78a50c15a7..1eb733285e 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -29,6 +29,66 @@ static unsigned int __initdata llc_nr_ways;
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
@@ -53,9 +113,27 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
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
 
     llc_coloring_enabled = (opt_llc_coloring == 1);
     if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
@@ -94,6 +172,9 @@ void __init llc_coloring_init(void)
     else if ( max_nr_colors < 2 )
         panic("Number of LLC colors %u < 2\n", max_nr_colors);
 
+    for ( i = 0; i < max_nr_colors; i++ )
+        default_colors[i] = i;
+
     arch_llc_coloring_init();
 }
 
@@ -115,6 +196,43 @@ void domain_dump_llc_colors(const struct domain *d)
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
index a3ebb17186..d29ebeb4c5 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -28,6 +28,7 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
-- 
2.43.0


