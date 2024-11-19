Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E49D27DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840129.1255975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzC-0000t7-6a; Tue, 19 Nov 2024 14:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840129.1255975; Tue, 19 Nov 2024 14:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzB-0000mR-Jq; Tue, 19 Nov 2024 14:13:45 +0000
Received: by outflank-mailman (input) for mailman id 840129;
 Tue, 19 Nov 2024 14:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz9-0007nQ-2V
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ab61f7-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:13:40 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cfd3a7e377so2124482a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:40 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:38 -0800 (PST)
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
X-Inumbo-ID: 79ab61f7-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5YWI2MWY3LWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NjIwLjA3NjI3OCwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025619; x=1732630419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF+NdGq6KKo6Z559YF1dCAHgEMawghN3gtyuN/F7QAs=;
        b=KNs3yI5HM745Iu3ZLNIspi+WjIUr6D+DDADi5UvIhS+v3ufVOw8zSmA1cjGK8S8k71
         KT5oO+Lk5xB6bsTxPLZaimtTHJyD/gxSJvvfyDAHLRZDF46Z5y1Zj1Jti7nsuW5j3l4M
         7XC57I1839eTXJV5gs+nVt5UeUqubPOLwuqlPZZuFbnK3qfnxwEdNzycldQaMvE8LmKc
         7KUwR3ZGC00tQJQNBAR7QpE4WKE2GMFH+m5Q+nnIQU4YuLXadO7xOiAemFvH+CgMNA7N
         WdWDerFg9M+I4g450iTQrllT9pCZR3GATPUGvTNUGZWqZGgEM3x4mQ598VZZYZYJGswg
         SkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025619; x=1732630419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF+NdGq6KKo6Z559YF1dCAHgEMawghN3gtyuN/F7QAs=;
        b=Z+nIbnq1vRNDsWFGlpp4gbjglYt4SWjqnoRNhQ16CsU3uJecuQdab4EXsyuuOSOWiU
         AkaTqwwTklptMJv/9gQWYz0zJBwey3d3A7xIl8McCmYtYaafi3V8hSnoxRtXNB2Z3EI+
         x6Xko91rmoUhQ6CxvdlDulr3M3AEDUTw6kxDi7IaR4LIm+3iZ4oUxOyoWoXueJw4T9v4
         5Xvgr62zsLMEPNiiDIjgN5XcFMWkJ0uddVEpwSYY3boAYsFFuk8iZQz2u2RAO497ZJIU
         HNhO8ZBSXtRrXlb9iBJ5yX0q756J3jkSwaVV8HbeJy9/mwS++Gufxud1XZJkILgSsihS
         Kl4Q==
X-Gm-Message-State: AOJu0Yz6GtgK4tJBSLyZECZUy0C2pA6oIw7W09TyCxgF92exfbg0Tdxe
	N6e00ztCPi5jcxNH/6opyeksrSwG3yXrb5vj6VhMqIlS/Xx4blXuXm2vWUrM7XKcBty/RzxxBuw
	h
X-Google-Smtp-Source: AGHT+IFpBXGFVUlxmalyDf2+g+zgL41gO1VVhRtyKzsco1NORamtl2AOSR61oPGAm1wyEP4F+9D+BQ==
X-Received: by 2002:a05:6402:34cf:b0:5cf:c268:1b16 with SMTP id 4fb4d7f45d1cf-5cfc2681cb0mr7039810a12.0.1732025619210;
        Tue, 19 Nov 2024 06:13:39 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v10 07/12] xen/arm: add support for cache coloring configuration via device-tree
Date: Tue, 19 Nov 2024 15:13:24 +0100
Message-ID: <20241119141329.44221-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
color configurations.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-Arm
---
v10:
- no changes
v9:
- use best-effort allocation in domain_set_llc_colors_from_str()
v8:
- fixed memory leak on error path of domain_set_llc_colors_from_str()
- realloc colors array after parsing from string to reduce memory usage
v7:
- removed alloc_colors() helper usage from domain_set_llc_colors_from_str()
v6:
- rewrote domain_set_llc_colors_from_str() to be more explicit
v5:
- static-mem check has been moved in a previous patch
- added domain_set_llc_colors_from_str() to set colors after domain creation
---
 docs/misc/arm/device-tree/booting.txt |  4 +++
 docs/misc/cache-coloring.rst          | 48 +++++++++++++++++++++++++++
 xen/arch/arm/dom0less-build.c         | 10 ++++++
 xen/common/llc-coloring.c             | 41 +++++++++++++++++++++++
 xen/include/xen/llc-coloring.h        |  1 +
 xen/include/xen/xmalloc.h             | 12 +++++++
 6 files changed, 116 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3a04f5c57f..9085645433 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -162,6 +162,10 @@ with the following properties:
 
     An integer specifying the number of vcpus to allocate to the guest.
 
+- llc-colors
+    A string specifying the LLC color configuration for the guest.
+    Refer to docs/misc/cache_coloring.rst for syntax.
+
 - vpl011
 
     An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index c5fb33996c..c14b6ee2f4 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -12,6 +12,7 @@ If needed, change the maximum number of colors with
 ``CONFIG_LLC_COLORS_ORDER=<n>``.
 
 Runtime configuration is done via `Command line parameters`_.
+For DomUs follow `DomUs configuration`_.
 
 Background
 **********
@@ -147,6 +148,53 @@ LLC specs can be manually set via the above command line parameters. This
 bypasses any auto-probing and it's used to overcome failing situations, such as
 flawed probing logic, or for debugging/testing purposes.
 
+DomUs configuration
+*******************
+
+DomUs colors can be set either in the ``xl`` configuration file (documentation
+at `docs/man/xl.cfg.pod.5.in`) or via Device Tree, also for Dom0less
+configurations (documentation at `docs/misc/arm/device-tree/booting.txt`) using
+the ``llc-colors`` option. For example:
+
+::
+
+    xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-coloring=on dom0-llc-colors=2-6";
+    xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen root=/dev/ram0"
+
+    dom0 {
+        compatible = "xen,linux-zimage" "xen,multiboot-module";
+        reg = <0x0 0x1000000 0x0 15858176>;
+    };
+
+    dom0-ramdisk {
+        compatible = "xen,linux-initrd" "xen,multiboot-module";
+        reg = <0x0 0x2000000 0x0 20638062>;
+    };
+
+    domU0 {
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        compatible = "xen,domain";
+        memory = <0x0 0x40000>;
+        llc-colors = "4-8,10,11,12";
+        cpus = <0x1>;
+        vpl011 = <0x1>;
+
+        module@2000000 {
+            compatible = "multiboot,kernel", "multiboot,module";
+            reg = <0x2000000 0xffffff>;
+            bootargs = "console=ttyAMA0";
+        };
+
+        module@30000000 {
+            compatible = "multiboot,ramdisk", "multiboot,module";
+            reg = <0x3000000 0xffffff>;
+        };
+    };
+
+**Note:** If no color configuration is provided for a domain, the default one,
+which corresponds to all available colors is used instead.
+
 Known issues and limitations
 ****************************
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 67b1503647..49d1f14d65 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -817,6 +817,7 @@ void __init create_domUs(void)
     bool iommu = false;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -965,6 +966,10 @@ void __init create_domUs(void)
 #endif
         }
 
+        dt_property_read_string(node, "llc-colors", &llc_colors_str);
+        if ( !llc_coloring_enabled && llc_colors_str )
+            panic("'llc-colors' found, but LLC coloring is disabled\n");
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
@@ -975,6 +980,11 @@ void __init create_domUs(void)
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
 
+        if ( llc_coloring_enabled &&
+             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
+            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
         d->is_console = true;
         dt_device_set_used_by(node, d->domain_id);
 
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 3cfd0ce78c..14e056fb10 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024, Advanced Micro Devices, Inc.
  * Copyright (C) 2024, Minerva Systems SRL
  */
+#include "xen/xmalloc.h"
 #include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
@@ -270,6 +271,46 @@ void domain_llc_coloring_free(struct domain *d)
     xfree(__va(__pa(d->llc_colors)));
 }
 
+int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
+{
+    int err;
+    unsigned int *colors, num_colors;
+
+    if ( !str )
+    {
+        domain_set_default_colors(d);
+        return 0;
+    }
+
+    colors = xmalloc_array(unsigned int, max_nr_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    err = parse_color_config(str, colors, max_nr_colors, &num_colors);
+    if ( err )
+    {
+        printk(XENLOG_ERR "Error parsing LLC color configuration");
+        xfree(colors);
+        return err;
+    }
+
+    if ( !check_colors(colors, num_colors) )
+    {
+        printk(XENLOG_ERR "%pd: bad LLC color config\n", d);
+        xfree(colors);
+        return -EINVAL;
+    }
+
+    /* Adjust the size cause it was initially set to max_nr_colors */
+    d->llc_colors = xrealloc_array(colors, num_colors);
+    if ( !d->llc_colors )
+        d->llc_colors = colors;
+
+    d->num_llc_colors = num_colors;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 657f4d0a10..76d3cbae0e 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -32,6 +32,7 @@ void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
 int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config);
+int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
 #endif /* __COLORING_H__ */
 
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index b903fa2e26..f0412fb4e0 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -37,6 +37,9 @@
     ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))
 #define xzalloc_array(_type, _num) \
     ((_type *)_xzalloc_array(sizeof(_type), __alignof__(_type), _num))
+#define xrealloc_array(_ptr, _num)                                  \
+    ((typeof(_ptr))_xrealloc_array(_ptr, sizeof(typeof(*(_ptr))),   \
+                                   __alignof__(typeof(*(_ptr))), _num))
 
 /* Allocate space for a structure with a flexible array of typed objects. */
 #define xzalloc_flex_struct(type, field, nr) \
@@ -98,6 +101,15 @@ static inline void *_xzalloc_array(
     return _xzalloc(size * num, align);
 }
 
+static inline void *_xrealloc_array(
+    void *ptr, unsigned long size, unsigned long align, unsigned long num)
+{
+    /* Check for overflow. */
+    if ( size && num > UINT_MAX / size )
+        return NULL;
+    return _xrealloc(ptr, size * num, align);
+}
+
 /*
  * Pooled allocator interface.
  */
-- 
2.43.0


