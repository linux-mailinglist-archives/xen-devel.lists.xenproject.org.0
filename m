Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB887CBBE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693751.1082244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hs-0001aY-Pq; Fri, 15 Mar 2024 10:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693751.1082244; Fri, 15 Mar 2024 10:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hs-0001Y0-I0; Fri, 15 Mar 2024 10:59:44 +0000
Received: by outflank-mailman (input) for mailman id 693751;
 Fri, 15 Mar 2024 10:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hr-0000xG-Cd
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fbae93e-e2bb-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:59:41 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4682272ff6so74871766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:41 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:40 -0700 (PDT)
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
X-Inumbo-ID: 1fbae93e-e2bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500380; x=1711105180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2v5J5S6fkJ+uKCqq6m+sZTt6B+LqvwXJp/jvybin1k=;
        b=BPTzWojcNtCaSf1/MrwzKjYozF8M+g8IoQPW3OW9B9qUldhHoMRfAaxw2MqEw3/QoW
         zQ/iegoaVeeFxTcWFCySQVd3kj4ee+Nd/+uILiO0+n9udLasHSexWh+GNOUgciQ6km2a
         VjNBI8ksZMROox4AEEarHd379lF7zQZyVd+iMNY+qUY9/Vn6jOIpF4FbbyMgFBc+fsv7
         8ZR8F3kGQBdWQM4ufDWdefkRFLF/zrRIGZN0Qu+NVRWdL2sMdSSzPEL6bPVn5HmCl9BK
         xH1ZMbnEL/BPtXdJL456c8uWfRYdM9Mn2kb/I8zi8qciag7VS7nOnBCr7ZJgbfyBKe70
         TIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500380; x=1711105180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2v5J5S6fkJ+uKCqq6m+sZTt6B+LqvwXJp/jvybin1k=;
        b=BpYj95qh8xdVkAa1TV0Qvl0YCPEpD762yRvRPi63F4Wn/mh71OcAUBR6Lj/CKWIOMS
         q8x6yXi3C8yeBd1JnkTBY3eAVsm+dXC80TTOcWAt4aHDpyvKd7Rq66EVbfAgQB1tfNmd
         Dq/CGjSwCX+NiM43d286MrSArwdIgwoILYgnaDhFy9EU7/XYDAgbOHztAUbIuhqpoKlG
         mY2ykzY/Or0ltNpWT3ew4pyx/leqyPs43lczXkQEOYAiWBWHCKC8f2vNCEnkfEmJsZWm
         3719755U4zC1+4VEPtXbMW17sTs0EVOZKtrYbL9s3amAtxUy2sLQGDCKOPWrkgT7vzWJ
         m8Cw==
X-Gm-Message-State: AOJu0Yz9is77vaSvQnmE12xAF45Y6EgPuNU3wr/94eNIaFEhop5v8Z5E
	NH8A6t1hkivNIn7KwiHxq3MRGlQUqOYXrKXsc4zCmQmPN03fo4M1sgZaCx/UDgHcSKRiQq2oeh9
	cN+Q=
X-Google-Smtp-Source: AGHT+IG0AJsxocPF4EmR44olv+T0FuBTWutAsozsmvN0BMhXTg/2NAX/gD+c4ZdKPiRK9F9JUb4AgQ==
X-Received: by 2002:a17:906:e286:b0:a46:220b:25b4 with SMTP id gg6-20020a170906e28600b00a46220b25b4mr2436716ejb.11.1710500380493;
        Fri, 15 Mar 2024 03:59:40 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
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
Subject: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
Date: Fri, 15 Mar 2024 11:58:52 +0100
Message-Id: <20240315105902.160047-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
 xen/common/llc-coloring.c         | 128 ++++++++++++++++++++++++++++++
 xen/include/xen/llc-coloring.h    |   3 +
 6 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 871e7a3ddb..4c859135cb 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -114,6 +114,35 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``llc-nr-ways``      | set the LLC number of ways    |
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
index 2936abea2c..28035a214d 100644
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
index d21be2c57b..3de1659836 100644
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
@@ -2208,6 +2209,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2235,10 +2237,16 @@ void __init create_dom0(void)
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
index 51eae90ad5..ebd7087dc2 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -18,6 +18,63 @@ integer_param("llc-nr-ways", llc_nr_ways);
 /* Number of colors available in the LLC */
 static unsigned int __ro_after_init max_nr_colors;
 
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
+
 static void print_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
@@ -41,6 +98,22 @@ static void print_colors(const unsigned int *colors, unsigned int num_colors)
     printk(" }\n");
 }
 
+static bool check_colors(const unsigned int *colors, unsigned int num_colors)
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
     unsigned int way_size;
@@ -91,6 +164,61 @@ void cf_check domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
+static int domain_set_default_colors(struct domain *d)
+{
+    unsigned int *colors = xmalloc_array(unsigned int, max_nr_colors);
+    unsigned int i;
+
+    if ( !colors )
+        return -ENOMEM;
+
+    printk(XENLOG_WARNING
+           "LLC color config not found for %pd, using all colors\n", d);
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
+    if ( !check_colors(dom0_colors, dom0_num_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
+        return -EINVAL;
+    }
+
+    colors = xmalloc_array(unsigned int, dom0_num_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    /* Static type checking */
+    (void)(colors == dom0_colors);
+    memcpy(colors, dom0_colors, sizeof(*colors) * dom0_num_colors);
+    d->llc_colors = colors;
+    d->num_llc_colors = dom0_num_colors;
+
+    return 0;
+}
+
+void domain_llc_coloring_free(struct domain *d)
+{
+    if ( !llc_coloring_enabled )
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


