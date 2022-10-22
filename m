Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8A608E49
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428411.678530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmp-0003RC-AZ; Sat, 22 Oct 2022 15:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428411.678530; Sat, 22 Oct 2022 15:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmp-0003OK-7T; Sat, 22 Oct 2022 15:51:47 +0000
Received: by outflank-mailman (input) for mailman id 428411;
 Sat, 22 Oct 2022 15:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmn-000237-Na
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ddd540c-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:44 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id m15so16315002edb.13
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:44 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:43 -0700 (PDT)
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
X-Inumbo-ID: 6ddd540c-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IqxEd6ecjPYBOtLoN10L6xas1AQwaOpYMS5dlVn26c=;
        b=AnibrlyVna0JrSAb+Wcx608MliwsWks84GNTUO3gu30o7DKgQLNyjjYMPpMdcVWfk8
         dvd+CjWrZ+hH3VD8aIIEh/Vuk+I8wRj9n93vfsUDYUWsObo9orS1EpxSX4ONEJgdkB6i
         8r+96FmkVCI4Zia20IHhdH8OO/hTK0BmunIay8Kx5n1OL8J/Rp/q5kMwZKwZTvTtPZbk
         c6axh+eNWabSv+VkBWw+0k9B0J6j3uoy+RyBu116L4xzXBEJFLNyLDcT2zn9FDy1cn0f
         pWQqtdFrD+fLM90dNR15b1KUZCQDi9+sLS+V38hiXf8oN9dtPtsRYDpbWoN3t2L6Q3dG
         2Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IqxEd6ecjPYBOtLoN10L6xas1AQwaOpYMS5dlVn26c=;
        b=zzFTw+JWFKGnCEChIQk/PQn3BMegkvl4nPwP3KOYM1zRMGVWtVHmAjn75fPbq0Ed3g
         Qfs0QyeMEUvWur7W+ByWg+o13f7tLNF6KAJnCqPQ9+Rp+Kahx1NCuBSRDScFQm4/66P9
         zrEOKMcGZvVByLL8vlIszfbUYr5BIEylmtg9XsPWO8qj2ggO4UZUk4a35wP8MSZAd0kd
         zezZGAl5WRr1yEALxjjZC1zQkrHB3uG95XEgqtwv5F8rK7wWXZGAD0aqkxc/N+84yJEe
         Tj8JBY8D5/zOmLy9c/QiUlHiA4YTugPo4J9fbOX2g5mtF+mxVyQegq222SOg3W8fQKUt
         JD7Q==
X-Gm-Message-State: ACrzQf0RieeIULocoQlcajLJ2xu0M8rpqfHFRskEstUO06Oxp4GM3gnQ
	G6Qo8rC6AD+mJlZMPz4jLQoRjZHluEae1g==
X-Google-Smtp-Source: AMsMyM5kZAsF9pqs0EPB0QqBNlKxkIbAGyFH/lxOkA1oUz5eDfTOahALIsuwSHfCwkMqxwaJ5ad07Q==
X-Received: by 2002:a17:907:2c4f:b0:78d:eebe:f413 with SMTP id hf15-20020a1709072c4f00b0078deebef413mr20626768ejc.221.1666453904210;
        Sat, 22 Oct 2022 08:51:44 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 5/9] xen/arm: add support for cache coloring configuration via device-tree
Date: Sat, 22 Oct 2022 17:51:16 +0200
Message-Id: <20221022155120.7000-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the "colors" Device Tree attribute that can be used for
DomUs and Dom0less color configurations. The syntax is the same used
for every color config.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst      | 45 +++++++++++++++++++++++++++
 docs/misc/arm/device-tree/booting.txt |  4 +++
 xen/arch/arm/coloring.c               | 17 ++++++++++
 xen/arch/arm/domain_build.c           | 13 ++++++++
 xen/arch/arm/include/asm/coloring.h   |  5 +++
 5 files changed, 84 insertions(+)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index e8ee8fafde..dd2e851a26 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -114,6 +114,51 @@ LLC way size (as previously discussed) and Dom0 colors can be set using the
 appropriate command line parameters. See the relevant documentation in
 "docs/misc/xen-command-line.pandoc".
 
+DomUs colors can be set either in the xl configuration file (relative
+documentation at "docs/man/xl.cfg.pod.5.in") or via Device Tree, also for
+Dom0less configurations, as in the following example:
+
+.. raw:: html
+
+    <pre>
+        xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-way-size=64K xen-colors=0-1 dom0-colors=2-6";
+        xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen root=/dev/ram0"
+
+        dom0 {
+            compatible = "xen,linux-zimage" "xen,multiboot-module";
+            reg = <0x0 0x1000000 0x0 15858176>;
+        };
+
+        dom0-ramdisk {
+            compatible = "xen,linux-initrd" "xen,multiboot-module";
+            reg = <0x0 0x2000000 0x0 20638062>;
+        };
+
+        domU0 {
+            #address-cells = <0x1>;
+            #size-cells = <0x1>;
+            compatible = "xen,domain";
+            memory = <0x0 0x40000>;
+            colors = "4-8,10,11,12";
+            cpus = <0x1>;
+            vpl011 = <0x1>;
+
+            module@2000000 {
+                compatible = "multiboot,kernel", "multiboot,module";
+                reg = <0x2000000 0xffffff>;
+                bootargs = "console=ttyAMA0";
+            };
+
+            module@30000000 {
+                compatible = "multiboot,ramdisk", "multiboot,module";
+                reg = <0x3000000 0xffffff>;
+            };
+        };
+    </pre>
+
+Please refer to the relative documentation in
+"docs/misc/arm/device-tree/booting.txt".
+
 Note that if no color configuration is provided for domains, they fallback to
 the default one, which corresponds simply to all available colors.
 
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index c47a05e0da..3aa493c66d 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -162,6 +162,10 @@ with the following properties:
 
     An integer specifying the number of vcpus to allocate to the guest.
 
+- colors
+    A string specifying the color configuration for the guest. Refer to
+    "docs/misc/arm/cache_coloring.rst" for syntax.
+
 - vpl011
 
     An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index cf8aa8a2ca..685a431c3d 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -273,8 +273,11 @@ int domain_coloring_init(struct domain *d,
         if ( config->from_guest )
             copy_from_guest(d->arch.colors, config->colors, config->num_colors);
         else
+        {
             memcpy(d->arch.colors, config->colors.p,
                    sizeof(unsigned int) * config->num_colors);
+            xfree(config->colors.p);
+        }
     }
 
     if ( !d->arch.colors )
@@ -305,6 +308,20 @@ void domain_dump_coloring_info(struct domain *d)
     print_colors(d->arch.colors, d->arch.num_colors);
 }
 
+void prepare_color_domain_config(struct xen_arch_domainconfig *config,
+                                 const char *colors_str)
+{
+    unsigned int num_colors;
+
+    config->colors.p = xzalloc_array(unsigned int, max_colors);
+    if ( !config->colors.p )
+        panic("Unable to allocate cache colors\n");
+
+    if ( parse_color_config(colors_str, config->colors.p, &num_colors) )
+        panic("Error parsing the color configuration\n");
+    config->num_colors = (uint16_t)num_colors;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 97f2060007..b95e655331 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -25,6 +25,7 @@
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
+#include <asm/coloring.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
@@ -3826,6 +3827,7 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *colors_str;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3914,6 +3916,17 @@ void __init create_domUs(void)
             d_cfg.cpupool_id = pool_id;
         }
 
+        if ( !dt_property_read_string(node, "colors", &colors_str) )
+        {
+            if ( !IS_ENABLED(CONFIG_CACHE_COLORING) )
+                printk(XENLOG_WARNING
+                       "Property 'colors' found, but coloring is disabled\n");
+            else if ( dt_find_property(node, "xen,static-mem", NULL) )
+                panic("static-mem isn't allowed when coloring is enabled\n");
+            else
+                prepare_color_domain_config(&d_cfg.arch, colors_str);
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index a16736819e..549eb408a3 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -38,6 +38,9 @@ int domain_coloring_init(struct domain *d,
 void domain_coloring_free(struct domain *d);
 void domain_dump_coloring_info(struct domain *d);
 
+void prepare_color_domain_config(struct xen_arch_domainconfig *config,
+                                 const char *colors_str);
+
 #else /* !CONFIG_CACHE_COLORING */
 
 static inline bool __init coloring_init(void) { return true; }
@@ -45,6 +48,8 @@ static inline int domain_coloring_init(
     struct domain *d, const struct xen_arch_domainconfig *config) { return 0; }
 static inline void domain_coloring_free(struct domain *d) {}
 static inline void domain_dump_coloring_info(struct domain *d) {}
+static inline void prepare_color_domain_config(
+    struct xen_arch_domainconfig *config, const char *colors_str) {}
 
 #endif /* CONFIG_CACHE_COLORING */
 #endif /* __ASM_ARM_COLORING_H__ */
-- 
2.34.1


