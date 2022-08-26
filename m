Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628DF5A2807
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393757.632930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoE-0002ZH-Sd; Fri, 26 Aug 2022 12:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393757.632930; Fri, 26 Aug 2022 12:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoE-0002V7-Nl; Fri, 26 Aug 2022 12:51:38 +0000
Received: by outflank-mailman (input) for mailman id 393757;
 Fri, 26 Aug 2022 12:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoD-00013M-3t
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c65ce9-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:36 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id h22so2987366ejk.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:36 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:35 -0700 (PDT)
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
X-Inumbo-ID: d1c65ce9-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/k6VvB3GlpUbTg4zEznZ7s2FszL8KBjsUm71X4Idjuk=;
        b=TkjcBMbK5k+ifi9o1Ju2dmUOhDYdZocxEf3v1aJeONp3N/Qm9YFiXb/9q9AMinR2kl
         YhnGZb95x3BQtTbpDeqkH491kkSW2V1K6ZdKXZyY4S6hG1GRen613zzRtrGgY059aQ5M
         B7phPR0z0xvb+U5Xhiy44RXY0MSCmhb/zAYbas8hb48iLI7ypAlslyI+sb3EnmhrBXhZ
         6G+XFBtOmFB/vn3axX4wWZfiLzGMe2KM6RzDlcvmK/UZNWyV+EjDY3Mv05EAMmJr84a0
         lWf3mbjvsxt7dgNILST3Br5ATKgl4Y86pALj2BQpIg9PsVZv0PB9XeZz0vFnHV0rqpa/
         qycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/k6VvB3GlpUbTg4zEznZ7s2FszL8KBjsUm71X4Idjuk=;
        b=NM6vVkUnhW6fHQ+4YYx+9ufLwBgcv9NoT/YYEbFBbNMpk/4fuzSRv4H5yoQzIWkH9R
         /03G2KiYWsIXzeig+WGmzoznjkQATC7kCRjkd1BfZO4RxrFwwDsQtA02vQX57StOdhEG
         meG8ZuIhFh3dtLX6WOHOoOzH6bwk1AyIpYHC9cuX1IMRopwrSFLRWNVNrEZMclVDUEP6
         poxbWxs5dw44ZEkAHqe8BUAKWqqeaQTgSN+lQ+6KwVIXQ7nt9Rw/dN/3z9kainnLwqV9
         nu9dPDz8XONrvPuo8iE/GyashnwKUpGtar1Erw78rt/dFgc/GQi6k2UdkQ78rUeRo67R
         aqJA==
X-Gm-Message-State: ACgBeo1QHgVqHXqzc7rTTxeY7LNBsfrRYnO4gEAxBeCXMZCz66VtIS23
	hwtvbQheCDvwh2FPwysZyN1CIo1a7tsNRw==
X-Google-Smtp-Source: AA6agR4cmYT6GhJBqHIWhFgE6ZHbq+wC+jPgGthC2iv6Rv7beNG7K5JqPb+y3XB5NXs2nrKOgup5Rw==
X-Received: by 2002:a17:907:9484:b0:738:6f9f:6032 with SMTP id dm4-20020a170907948400b007386f9f6032mr5437827ejc.602.1661518295433;
        Fri, 26 Aug 2022 05:51:35 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 05/12] xen/arm: add support for cache coloring configuration via device-tree
Date: Fri, 26 Aug 2022 14:51:04 +0200
Message-Id: <20220826125111.152261-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the "colors" Device Tree attribute that can be used for
DomUs and Dom0less color configurations. The syntax is the same used
for every color config.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst      | 45 +++++++++++++++++++++++++++
 docs/misc/arm/device-tree/booting.txt |  4 +++
 xen/arch/arm/coloring.c               | 17 ++++++++++
 xen/arch/arm/domain_build.c           |  9 ++++++
 xen/arch/arm/include/asm/coloring.h   |  3 ++
 5 files changed, 78 insertions(+)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index 345d97cb56..763acd2d3f 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -111,5 +111,50 @@ LLC way size (as previously discussed) and Dom0 colors can be set using the
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
\ No newline at end of file
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..82e8dd89c8 100644
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
index 40a07617cc..87e20b952e 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -252,8 +252,11 @@ int domain_coloring_init(struct domain *d,
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
@@ -283,6 +286,20 @@ void domain_dump_coloring_info(struct domain *d)
     print_colors(d->arch.colors, d->arch.num_colors);
 }
 
+void prepare_color_domain_config(struct xen_arch_domainconfig *config,
+                                 const char *colors_str)
+{
+    unsigned int num;
+
+    config->colors.p = xzalloc_array(unsigned int, max_colors);
+    if ( !config->colors.p )
+        panic("Unable to allocate cache colors\n");
+
+    if ( parse_color_config(colors_str, config->colors.p, &num) )
+        panic("Error parsing the color configuration\n");
+    config->num_colors = (uint16_t)num;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4d4cb692fc..979b9c8906 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -34,6 +34,7 @@
 #include <xen/serial.h>
 
 #ifdef CONFIG_CACHE_COLORING
+#include <asm/coloring.h>
 #define XEN_DOM0_CREATE_FLAGS CDF_privileged
 #else
 #define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
@@ -3275,6 +3276,7 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char * __maybe_unused colors_str;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3354,6 +3356,13 @@ void __init create_domUs(void)
             d_cfg.cpupool_id = pool_id;
         }
 
+#ifdef CONFIG_CACHE_COLORING
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+            panic("static-mem is not valid when cache coloring is enabled\n");
+        if ( !dt_property_read_string(node, "colors", &colors_str) )
+            prepare_color_domain_config(&d_cfg.arch, colors_str);
+#endif
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 967031ae04..b7fa323870 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -36,4 +36,7 @@ int domain_coloring_init(struct domain *d,
 void domain_coloring_free(struct domain *d);
 void domain_dump_coloring_info(struct domain *d);
 
+void prepare_color_domain_config(struct xen_arch_domainconfig *config,
+                                 const char *colors_str);
+
 #endif /* !__ASM_ARM_COLORING_H__ */
-- 
2.34.1


