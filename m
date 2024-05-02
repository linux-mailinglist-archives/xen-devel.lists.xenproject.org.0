Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FB8B9EFE
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715949.1117955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zii-000739-KN; Thu, 02 May 2024 16:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715949.1117955; Thu, 02 May 2024 16:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zii-0006uI-Ex; Thu, 02 May 2024 16:55:44 +0000
Received: by outflank-mailman (input) for mailman id 715949;
 Thu, 02 May 2024 16:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zig-0006Lf-F7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:42 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1a9237-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:41 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso134698611fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:41 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:40 -0700 (PDT)
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
X-Inumbo-ID: cf1a9237-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668941; x=1715273741; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQIt6EqAhVSChAJtwNddHFJtbh/THZTAMqTRnNcVJEs=;
        b=jSFX0KHkYBXIaoPeifOO/6mr6iU+PP9auXhL2gwBjQCjkh4dj+l/VxIPDamJtctki0
         D4FhyLWVzxaHTjTKF8aOjaZXtMtAfbZQLBB7rbuq4zCbn3EkqBYjYiHTlYjsBGlE3FCT
         LZ+zrXXx5vAU7AzQzbA2SXPdscKs0ZU3Va54675pHyKUimb0PGZ075GyIWAw2vzj9uca
         jKVKPyfftBh5usEXknMX64dpGH9jsNlTsbHqEVXOKA5E4fjAlfffGSdKykjnRpEGb+7+
         occ7+VgAvKJBg0/MidhOnLs94HidALAiQNzx3SujaGpjtncMfBDskKHPwg/iH/xgaksA
         Z/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668941; x=1715273741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQIt6EqAhVSChAJtwNddHFJtbh/THZTAMqTRnNcVJEs=;
        b=wzGJcA0WxZ30ABiRoECSJXLuE3/PC9NMoFO5f+elrL33U2Adk8jJt1PLpSYEmyT2sA
         BPiWb5qN67byBiQNyhQgN7iVIsFd+0EPGpQpM5rtsD0Emk7gA7bNafB9KacKXhO9MY0/
         ZFrayJ0O97fign5X3s7s2Ch0Nfbj5WvrZefW7bAJXWa6QoIeXZxwvYK6RtJmDcIqAjo/
         YLOh7yE8ElRdQOV0ozssoSWHVhU1bPwP6r4CpO2DJZHC3T5GsYQaJz0QGhOYEB32PKrf
         992lk4aR5Mq2iIwoWqqJL9KsxycIh7BnPpXzodadNpSZjsKJXcO7tgSUkBbVudHR2sru
         3wZw==
X-Gm-Message-State: AOJu0YzPvvuvmaOnMtbYLnXFaHsc0fZ+FACOuW9YsL1ILXX/+Qq5Qb8c
	FJh8JsZhWZTDwV1MEIbX69mZuhTooGXxwr0ht2WHiBuQcTkflxRUzI4U/lztED4KStTqsqsSMNt
	U
X-Google-Smtp-Source: AGHT+IFfTaHyfpFw1bJI3YbMS0k968SxK3ibfMEZ2lxT+qyoIgawCS1WBjyfcSqxwSdRD47+M/u78g==
X-Received: by 2002:a2e:b04a:0:b0:2df:b2d5:5935 with SMTP id d10-20020a2eb04a000000b002dfb2d55935mr287080ljl.28.1714668940688;
        Thu, 02 May 2024 09:55:40 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 04/13] xen/arm: add Dom0 cache coloring support
Date: Thu,  2 May 2024 18:55:24 +0200
Message-Id: <20240502165533.319988-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
---
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
 docs/misc/cache-coloring.rst      |  29 +++++++
 docs/misc/xen-command-line.pandoc |   9 +++
 xen/arch/arm/domain_build.c       |  10 ++-
 xen/common/domain.c               |   3 +
 xen/common/llc-coloring.c         | 128 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   3 +
 6 files changed, 180 insertions(+), 2 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 404262b728..26b306a0ff 100644
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
index 906822a491..2923e1fad4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
 
 Specify a list of IO ports to be excluded from dom0 access.
 
+### dom0-llc-colors
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
index ba2e48ecc7..c0ed07051d 100644
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
@@ -2250,6 +2251,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2277,10 +2279,16 @@ void __init create_dom0(void)
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
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6773f7fb90..a3cfb3bf37 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -33,6 +33,7 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
+#include <xen/llc-coloring.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
@@ -1219,6 +1220,8 @@ void domain_destroy(struct domain *d)
 
     BUG_ON(!d->is_dying);
 
+    domain_llc_coloring_free(d);
+
     /* May be already destroyed, or get_domain() can race us. */
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index bcc651cc10..26270cda9c 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -19,6 +19,66 @@ static unsigned int __initdata llc_nr_ways;
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
+static int __init parse_color_config(const char *buf, unsigned int *colors,
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
 
 static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
@@ -43,9 +103,26 @@ static void print_colors(const unsigned int *colors, unsigned int num_colors)
     printk(" }\n");
 }
 
+static bool __init check_colors(const unsigned int *colors,
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
@@ -79,6 +156,9 @@ void __init llc_coloring_init(void)
     } else if ( max_nr_colors < 2 )
         panic("Number of LLC colors %u < 2\n", max_nr_colors);
 
+    for ( i = 0; i < max_nr_colors; i++ )
+        default_colors[i] = i;
+
     arch_llc_coloring_init();
 }
 
@@ -100,6 +180,52 @@ void domain_dump_llc_colors(const struct domain *d)
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
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
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
+void domain_llc_coloring_free(struct domain *d)
+{
+    if ( !llc_coloring_enabled || d->llc_colors == default_colors )
+        return;
+
+    /* free pointer-to-const using __va(__pa()) */
+    xfree(__va(__pa(d->llc_colors)));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 67b27c995b..ee82932266 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -16,16 +16,19 @@ extern bool llc_coloring_enabled;
 void llc_coloring_init(void);
 void dump_llc_coloring_info(void);
 void domain_dump_llc_colors(const struct domain *d);
+void domain_llc_coloring_free(struct domain *d);
 #else
 #define llc_coloring_enabled false
 
 static inline void llc_coloring_init(void) {}
 static inline void dump_llc_coloring_info(void) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
+static inline void domain_llc_coloring_free(struct domain *d) {}
 #endif
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __COLORING_H__ */
 
-- 
2.34.1


