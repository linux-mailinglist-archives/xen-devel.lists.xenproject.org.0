Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E25821929
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660565.1030094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRC-0007Qo-Si; Tue, 02 Jan 2024 09:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660565.1030094; Tue, 02 Jan 2024 09:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRC-0007Hp-Nz; Tue, 02 Jan 2024 09:51:54 +0000
Received: by outflank-mailman (input) for mailman id 660565;
 Tue, 02 Jan 2024 09:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRB-00060C-4b
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d959b31-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-555f95cc2e4so2216417a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:51 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:49 -0800 (PST)
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
X-Inumbo-ID: 8d959b31-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189110; x=1704793910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73zQ6mdEMBzClWviA9+IRZfbHegcYkbBhPrmh7vmHt4=;
        b=F4F9GaksiUKI3IZ3Peu9TSrsm47aaKlskPmQAiwbvJlcMLE+EKZamgIRI8pQ98OOj8
         9sdW7UiokQF4tQjmZndgct2xtAAvDgVcKzpu3Kd4eJffwRc3mTn5urTZwxMn7mCsQGom
         BgusOrednWyD0ti226c4/WXqiWkodJ75qIEbq/YRwJrHvxOvrDz91/3XLfyUI5cVbzYP
         CNYygw86AggOm4WBYaC9zAMC/En5TiGztwvV1xpYSdp4AZyNFRcYOkl2pSFqK1yYTIHW
         8RntLPGNWUNUjkr+EfBdPAtFdyZOGZaEe0kOO1SacIGQyg14BmFFTRrhPS96UXPklB4l
         R1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189110; x=1704793910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73zQ6mdEMBzClWviA9+IRZfbHegcYkbBhPrmh7vmHt4=;
        b=O/5Mz6cTE6KfThrPieu2Wt66fe3enggep21sLub3haPmqOaFI9+0kUPQDkyzGCtTOA
         0sJ0SqTLUHKONcB3QyZHBRRyJevj+pP38fRX8uZN55q/yyFfbWNZEJIinVPJiYJu9WPb
         CUsYI1y8W73jpFShGpUHN0Eh+kRfRWD8uEoaXeCnJTrqcll7960r/F76R/024uPk+mPW
         k3U8HSwCA2pKtoEa1vOV5u+eRRCNExvZ0b0YpsxdJE3nWKZqmQnlUEHS4nPCmEUhi/4n
         gJPBvdn9mEIQsaQCwDvWP1t1v6JGuXZ7G/AXEe5JOHZ9xtBSatOUah5nNNs5WEKbeWpa
         UEkQ==
X-Gm-Message-State: AOJu0Yzte09I2YFUE37VFKXW9/A6LJ/2vG9fRsb8ENf5KuUXnnCrhJv1
	Mf9W8xIp1kQuroaNNZX3dtULZw1HsaNOmZ6GR/wjoC5/68g=
X-Google-Smtp-Source: AGHT+IHjx+BBxiNfQf2Ybyxnqy1PrJ9FjTW1mafSepJnbgj3AtAc3jBAug91zSRILwH3dvu/0L5UZg==
X-Received: by 2002:a17:906:74cc:b0:a28:61f7:bbdb with SMTP id z12-20020a17090674cc00b00a2861f7bbdbmr135203ejl.71.1704189110245;
        Tue, 02 Jan 2024 01:51:50 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 06/13] xen/arm: add support for cache coloring configuration via device-tree
Date: Tue,  2 Jan 2024 10:51:31 +0100
Message-Id: <20240102095138.17933-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the "llc-colors" Device Tree attribute that can be used
for DomUs and Dom0less color configurations. The syntax is the same used
for every color config.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- static-mem check has been moved in a previous patch
- added domain_set_llc_colors_from_str() to set colors after domain creation
---
 docs/misc/arm/cache-coloring.rst        | 48 ++++++++++++++++++++++++-
 docs/misc/arm/device-tree/booting.txt   |  4 +++
 xen/arch/arm/dom0less-build.c           | 13 +++++++
 xen/arch/arm/include/asm/llc-coloring.h |  1 +
 xen/arch/arm/llc-coloring.c             | 17 +++++++++
 5 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index acf82c3df8..ae1dd8f4af 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -10,7 +10,7 @@ If needed, change the maximum number of colors with
 ``CONFIG_NR_LLC_COLORS=<n>``.
 
 Compile Xen and the toolstack and then configure it via
-`Command line parameters`_.
+`Command line parameters`_. For DomUs follow `DomUs configuration`_.
 
 Background
 **********
@@ -114,6 +114,52 @@ Examples:
 | 0                 | [0]                         |
 +-------------------+-----------------------------+
 
+DomUs configuration
+*******************
+
+DomUs colors can be set via Device Tree, also for Dom0less configurations
+(documentation at `docs/misc/arm/device-tree/booting.txt`) using the
+``llc-colors`` option. For example:
+
+::
+
+    xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-coloring=on llc-way-size=64K dom0-llc-colors=2-6";
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
+which corresponds to all available colors, is used instead.
+
 Known issues and limitations
 ****************************
 
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..e9f9862e9c 100644
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
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1142f7f74a..eb39f5291f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -850,6 +850,7 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -993,6 +994,13 @@ void __init create_domUs(void)
 #endif
         }
 
+        dt_property_read_string(node, "llc-colors", &llc_colors_str);
+        if ( llc_coloring_enabled && !llc_colors_str )
+            panic("'llc-colors' is required when LLC coloring is enabled\n");
+        else if ( !llc_coloring_enabled && llc_colors_str)
+            printk(XENLOG_WARNING
+                   "'llc-colors' found, but LLC coloring is disabled\n");
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
@@ -1003,6 +1011,11 @@ void __init create_domUs(void)
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
 
+        if ( llc_coloring_enabled &&
+             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
+            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
         d->is_console = true;
         dt_device_set_used_by(node, d->domain_id);
 
diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
index ee5551e3cc..5f9b0a8121 100644
--- a/xen/arch/arm/include/asm/llc-coloring.h
+++ b/xen/arch/arm/include/asm/llc-coloring.h
@@ -15,6 +15,7 @@
 
 bool __init llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
+int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
 #endif /* __ASM_ARM_COLORING_H__ */
 
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index a08614ec36..d3de5f14cb 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -295,6 +295,23 @@ int domain_set_llc_colors_domctl(struct domain *d,
     return domain_check_colors(d);
 }
 
+int domain_set_llc_colors_from_str(struct domain *d, const char *str)
+{
+    int err;
+
+    if ( domain_alloc_colors(d, nr_colors) )
+        return -ENOMEM;
+
+    err = parse_color_config(str, d->llc_colors, &d->num_llc_colors);
+    if ( err )
+    {
+        printk(XENLOG_ERR "Error parsing LLC color configuration.");
+        return err;
+    }
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


