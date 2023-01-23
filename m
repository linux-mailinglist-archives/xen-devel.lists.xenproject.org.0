Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FC678060
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483028.748962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3Y-0001j8-Ar; Mon, 23 Jan 2023 15:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483028.748962; Mon, 23 Jan 2023 15:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3Y-0001fV-5S; Mon, 23 Jan 2023 15:48:24 +0000
Received: by outflank-mailman (input) for mailman id 483028;
 Mon, 23 Jan 2023 15:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3W-0000MU-Sw
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:23 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 577425c4-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:12 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id v30so15061168edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:21 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:20 -0800 (PST)
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
X-Inumbo-ID: 577425c4-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCEtpCCeNNgVpjRAVcM3vcHvhd+PHR5ZkpezvuQcf7U=;
        b=ZmS5KDRC8hDJKnSaSUtwY94VSRuDHFI5eeajwzfWFv4jUrF4j87Lam0AO4mBGAn362
         tEylRS/pTFH81y2AlE0Qi0BsQ9AFSE4VNXzDdDScCCViLukyBDRPudPQElb0U1qDxlbv
         uFMlrqgE5CPhfvzKIRI36kHiE+O1TPz8keSqsAJG2rH2FAzRSMMfU7THLOUGwdOE5wXv
         X2v3L8mx9SsYPA3sgrry/Z5LfVfRllWNiWaMn8geQdX7Ep8UBwfmtntMysIdktvzpZVY
         sIH97GsxSWi8pHRn6HpRs62THQUgOTgqHeqrioAcKxG/UQWb/qc8tN02r8+LxXTNvWoY
         YxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCEtpCCeNNgVpjRAVcM3vcHvhd+PHR5ZkpezvuQcf7U=;
        b=wWfDmbdfJmUVCaDZDdi9BqxVRE48NtXakY9Q8ZOa3yYlnvkqamECdCvWF8NJx6LGXp
         Ob+mKKGTvYjIp5qV+rI7bRuBs/ifplHzL92dSojjMyfJIxNiqMD6rhWHrc1gqCZZK+H/
         mD3a5e8ne7+t7PFIj2q7jF7D3nf7TeH/QOUxb9rjrY0sinGal7ItxxysiEaIAXDt5b/m
         ylkHBKOaGf3PpQCzuhdRw3jwvbaQcPvBsaPsr+LeYppAAwkSLLs7bR1b4ukhx8X0c5bk
         B4H8l/XVip9PXt9yoGZGhlB8WYV2Phz9EmByxnE28KSLQliGwWqnAa9vAB464MKDAUKG
         6C2A==
X-Gm-Message-State: AFqh2koslRsgYA7G65X++4zyNcL8bpvGzGkv1Ydo9Sy4E8EJlVPQJTNS
	vZ5+ZjJgp12kWYcE90uukeya44lJBEsiuveo
X-Google-Smtp-Source: AMrXdXut7KoZPfG//rjtYHoVwSt6VSeDkbrs7aPZEjixUEAXRMFdPmXR9l3iIM2NZd+QELm5hPz0wA==
X-Received: by 2002:a05:6402:501a:b0:47e:bdb8:9133 with SMTP id p26-20020a056402501a00b0047ebdb89133mr33588255eda.38.1674488900372;
        Mon, 23 Jan 2023 07:48:20 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 06/11] xen/arm: add support for cache coloring configuration via device-tree
Date: Mon, 23 Jan 2023 16:47:30 +0100
Message-Id: <20230123154735.74832-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the "llc-colors" Device Tree attribute that can be used
for DomUs and Dom0less color configurations. The syntax is the same used
for every color config.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst        | 43 +++++++++++++++++++++++++
 docs/misc/arm/device-tree/booting.txt   |  4 +++
 xen/arch/arm/domain_build.c             | 18 ++++++++++-
 xen/arch/arm/include/asm/llc_coloring.h |  3 ++
 xen/arch/arm/llc_coloring.c             | 10 ++++++
 5 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index c2e0e87426..a28f75dc26 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -116,6 +116,49 @@ LLC way size (as previously discussed) and Dom0 colors can be set using the
 appropriate command line parameters. See the relevant documentation
 in "docs/misc/xen-command-line.pandoc".
 
+DomUs colors can be set either in the xl configuration file (relative
+documentation at "docs/man/xl.cfg.pod.5.in") or via Device Tree, also for
+Dom0less configurations (relative documentation in
+"docs/misc/arm/device-tree/booting.txt"), as in the following example:
+
+.. raw:: html
+
+    <pre>
+        xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-coloring=on llc-way-size=64K xen-llc-colors=0-1 dom0-llc-colors=2-6";
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
+            llc-colors = "4-8,10,11,12";
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
 **Note:** If no color configuration is provided for a domain, the default one,
 which corresponds to all available colors, is used instead.
 
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3879340b5e..ad71c16b00 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -162,6 +162,10 @@ with the following properties:
 
     An integer specifying the number of vcpus to allocate to the guest.
 
+- llc-colors
+    A string specifying the LLC color configuration for the guest.
+    Refer to "docs/misc/arm/cache_coloring.rst" for syntax.
+
 - vpl011
 
     An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 093d4ad6f6..2c1307d349 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3854,6 +3854,8 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str;
+    unsigned int *llc_colors = NULL, num_llc_colors = 0;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3960,12 +3962,26 @@ void __init create_domUs(void)
             d_cfg.max_maptrack_frames = val;
         }
 
+        if ( !dt_property_read_string(node, "llc-colors", &llc_colors_str) )
+        {
+            if ( !llc_coloring_enabled )
+                printk(XENLOG_WARNING
+                       "'llc-colors' found, but LLC coloring is disabled\n");
+            else if ( dt_find_property(node, "xen,static-mem", NULL) )
+                panic("static-mem and LLC coloring are incompatible\n");
+            else
+                llc_colors = llc_colors_from_str(llc_colors_str,
+                                                 &num_llc_colors);
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, flags);
+        d = domain_create_llc_colored(++max_init_domid, &d_cfg, flags,
+                                      llc_colors, num_llc_colors);
+
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
diff --git a/xen/arch/arm/include/asm/llc_coloring.h b/xen/arch/arm/include/asm/llc_coloring.h
index 382ff7de47..7a01b8841c 100644
--- a/xen/arch/arm/include/asm/llc_coloring.h
+++ b/xen/arch/arm/include/asm/llc_coloring.h
@@ -18,12 +18,15 @@
 bool __init llc_coloring_init(void);
 
 unsigned int *dom0_llc_colors(unsigned int *num_colors);
+unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors);
 
 #else /* !CONFIG_LLC_COLORING */
 
 static inline bool __init llc_coloring_init(void) { return true; }
 static inline unsigned int *dom0_llc_colors(
     unsigned int *num_colors) { return NULL; }
+static inline unsigned int *llc_colors_from_str(
+    const char *str, unsigned int *num_colors) { return NULL; }
 
 #endif /* CONFIG_LLC_COLORING */
 
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index 2d0457cdbc..ba5279a022 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -289,6 +289,16 @@ unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)
     return colors;
 }
 
+unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors)
+{
+    unsigned int *colors = alloc_colors(nr_colors);
+
+    if ( parse_color_config(str, colors, num_colors) )
+        panic("Error parsing LLC color configuration\n");
+
+    return colors;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


