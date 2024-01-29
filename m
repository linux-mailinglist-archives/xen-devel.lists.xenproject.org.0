Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C4840EEA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673065.1047260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI5-0006vy-CG; Mon, 29 Jan 2024 17:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673065.1047260; Mon, 29 Jan 2024 17:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI5-0006sI-69; Mon, 29 Jan 2024 17:19:25 +0000
Received: by outflank-mailman (input) for mailman id 673065;
 Mon, 29 Jan 2024 17:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI3-0005vY-2s
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:23 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7c0322-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:21 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso2867033a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:21 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:19 -0800 (PST)
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
X-Inumbo-ID: 8a7c0322-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548760; x=1707153560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIa5rMBLPGQ7jfnyxO46jyMXIeNANfVTdO7DqWxwb4c=;
        b=0bBIkWqyMluE7NrkadFknPdyeo/VGnswpdj9g9pUTVsz4CNCqpK3zDsdYzY1sQd7Zu
         6tRXuIfl2p/P49daegDEtiRvgQ5OrIIucLxSbd3pqOXJu7hcYMd5KVAhM9tA6i5foJih
         tNWYSbkfRHyxpSF7k4Xaon9UlhRrUr1Hm9PoIju7HaD5EUgWpasrfAZaaBpw17w4kWVe
         T8yDhn8WR0z/xCI7IZbpnyaoqFBOVnF8lV3mQy4XlLRr0aPig3wJF3aqJCf2VD153UoZ
         v6sMknWjaM9w/7rMPFraAw7sNO7wDT7ZHObPjhgMa7Bl1W3wjLg3jJvs4gmako/SlJfk
         fxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548760; x=1707153560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIa5rMBLPGQ7jfnyxO46jyMXIeNANfVTdO7DqWxwb4c=;
        b=McVZpwsA/ECJJkbpKeQKPAK9qNNxC0X9Y8nKum8K4sea2gl4wr7thgHIC2G9t4xXRb
         3uJP+cyD2syNENnTxo1rLQ2RL5FZIzW7AvxVOnqhAHEBygwsHDV5YHbsx6CXg5Beiv3O
         dszMv0M8ZbcELe/5G3s8DYKw8va5kuUnvhaaL58tvlsx+OY9psMefcxvAUuj7phhGSQ1
         Hj4DqRm9hYX2R/bFqnjkGQQv1U2ZnnIVHq6Yp5l/OsWmL20T2FXwLXmaExOg5u17ae5R
         sgmCx/0Az42UcaTr3B1nmmySbOL+ns9UnkBr4/ESbFejrEafsmlmDihqriA9NOShFWCj
         v0rQ==
X-Gm-Message-State: AOJu0YwNDVJpxVmSBoOuBESCa2pFd6bYOdRadjJ9xPe3/bltCYOhfowz
	LOaqVsFLj7t5C8b0UjbpJRjiUp0mDFuP9ozQBghe3wX2DVRjiI8IMLOC/fu4MOeNAQWCbIeweDC
	PXf4=
X-Google-Smtp-Source: AGHT+IHLLjWbB9yMguzQrhksnw/TcTzEZ1IjvtsAG0LjISoDSw4ezhsFSU0FMy/J2KXuxCp8BBSGiQ==
X-Received: by 2002:aa7:cb53:0:b0:55f:19c4:600c with SMTP id w19-20020aa7cb53000000b0055f19c4600cmr1301080edt.37.1706548760210;
        Mon, 29 Jan 2024 09:19:20 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
Date: Mon, 29 Jan 2024 18:18:00 +0100
Message-Id: <20240129171811.21382-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
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
 docs/misc/cache-coloring.rst      |  29 ++++++
 docs/misc/xen-command-line.pandoc |   9 ++
 xen/arch/arm/domain_build.c       |  10 +-
 xen/common/domain.c               |   3 +
 xen/common/llc-coloring.c         | 153 ++++++++++++++++++++++++++++++
 xen/include/xen/llc-coloring.h    |   3 +
 6 files changed, 206 insertions(+), 1 deletion(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 0535b5c656..c347725525 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -85,6 +85,35 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``llc-way-size``     | set the LLC way size          |
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
 
 Known issues and limitations
 ****************************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 11f9f209d1..25da997b5b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
 
 Specify a list of IO ports to be excluded from dom0 access.
 
+### dom0-llc-colors
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `All available LLC colors`
+
+Specify dom0 LLC color configuration. This options is available only when
+`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
+colors are used.
+
 ### dom0_max_vcpus
 
 Either:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e5310aff..e380d25dca 100644
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
@@ -2161,6 +2162,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2188,10 +2190,16 @@ void __init create_dom0(void)
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
index f6f5574996..f144b54f4f 100644
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
@@ -1208,6 +1209,8 @@ void domain_destroy(struct domain *d)
 
     BUG_ON(!d->is_dying);
 
+    domain_llc_coloring_free(d);
+
     /* May be already destroyed, or get_domain() can race us. */
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 10729e70c1..983de44a47 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -17,6 +17,63 @@ size_param("llc-way-size", llc_way_size);
 /* Number of colors available in the LLC */
 static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
 
+static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
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
+static int parse_color_config(const char *buf, unsigned int *colors,
+                              unsigned int num_colors, unsigned int *num_parsed)
+{
+    const char *s = buf;
+
+    if ( !colors || !num_colors )
+        return -EINVAL;
+
+    *num_parsed = 0;
+
+    while ( *s != '\0' )
+    {
+        if ( *s != ',' )
+        {
+            unsigned int color, start, end;
+
+            start = simple_strtoul(s, &s, 0);
+
+            if ( *s == '-' )    /* Range */
+            {
+                s++;
+                end = simple_strtoul(s, &s, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( start > end || (end - start) > (UINT_MAX - *num_parsed) ||
+                 (*num_parsed + (end - start)) >= num_colors )
+                return -EINVAL;
+            for ( color = start; color <= end; color++ )
+                colors[(*num_parsed)++] = color;
+        }
+        else
+            s++;
+    }
+
+    return *s ? -EINVAL : 0;
+}
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_colors, max_nr_colors, &dom0_num_colors);
+}
+custom_param("dom0-llc-colors", parse_dom0_colors);
+
 static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
@@ -47,6 +104,29 @@ static void dump_coloring_info(unsigned char key)
     printk("Number of LLC colors supported: %u\n", max_nr_colors);
 }
 
+static bool check_colors(const unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    if ( num_colors > max_nr_colors )
+    {
+        printk(XENLOG_ERR "Number of LLC colors requested > %u\n",
+               max_nr_colors);
+        return false;
+    }
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
     if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
@@ -70,12 +150,85 @@ void __init llc_coloring_init(void)
     arch_llc_coloring_init();
 }
 
+void domain_llc_coloring_free(struct domain *d)
+{
+    xfree(__va(__pa(d->llc_colors)));
+}
+
 void domain_dump_llc_colors(const struct domain *d)
 {
     printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
+static unsigned int *alloc_colors(unsigned int num_colors)
+{
+    unsigned int *colors;
+
+    if ( num_colors > max_nr_colors )
+        return NULL;
+
+    colors = xmalloc_array(unsigned int, num_colors);
+    if ( !colors )
+        return NULL;
+
+    return colors;
+}
+
+static int domain_check_colors(const struct domain *d)
+{
+    if ( !d->num_llc_colors )
+    {
+        printk(XENLOG_ERR "No LLC color config found for %pd\n", d);
+        return -ENODATA;
+    }
+    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int domain_set_default_colors(struct domain *d)
+{
+    unsigned int *colors = alloc_colors(max_nr_colors);
+    unsigned int i;
+
+    if ( !colors )
+        return -ENOMEM;
+
+    printk(XENLOG_WARNING
+           "LLC color config not found for %pd, using default\n", d);
+
+    for ( i = 0; i < max_nr_colors; i++ )
+        colors[i] = i;
+
+    d->llc_colors = colors;
+    d->num_llc_colors = max_nr_colors;
+
+    return 0;
+}
+
+int __init dom0_set_llc_colors(struct domain *d)
+{
+    unsigned int *colors;
+
+    if ( !dom0_num_colors )
+        return domain_set_default_colors(d);
+
+    colors = alloc_colors(dom0_num_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);
+    d->llc_colors = colors;
+    d->num_llc_colors = dom0_num_colors;
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 5e12eb426f..1a73080c98 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -14,16 +14,19 @@
 extern bool llc_coloring_enabled;
 
 void llc_coloring_init(void);
+void domain_llc_coloring_free(struct domain *d);
 void domain_dump_llc_colors(const struct domain *d);
 #else
 #define llc_coloring_enabled false
 
 static inline void llc_coloring_init(void) {}
+static inline void domain_llc_coloring_free(struct domain *d) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
 #endif
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __COLORING_H__ */
 
-- 
2.34.1


