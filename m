Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC63840EE3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673068.1047289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI8-0007hK-Md; Mon, 29 Jan 2024 17:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673068.1047289; Mon, 29 Jan 2024 17:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI8-0007ed-Cj; Mon, 29 Jan 2024 17:19:28 +0000
Received: by outflank-mailman (input) for mailman id 673068;
 Mon, 29 Jan 2024 17:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI6-0005vb-6X
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c250c6d-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:24 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55eee4a042eso1826854a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:24 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:22 -0800 (PST)
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
X-Inumbo-ID: 8c250c6d-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548763; x=1707153563; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd9miIuow0BSRA/mBkMSExaPwqKXz3kDkiwlSiWY+B4=;
        b=YILSwGn9Sntoo7c2TagcwF/e8aZis6MwIaMDKjbOmgjpERiav2OBF7FoK+TuXvpOv3
         tTzPQJi7IoYi7AObCo2c5mr9BuGIfI5w3GHj/odO4nsT5EqoGRMyViHyhp1sB4VaLoUU
         zXxx5SUyKv3B0aymc3opCT74rVFpdvvcI+fXo6W6NuIKQKcskkl/cPhc429PLr2+ceHE
         lmf6rLYJgDlBsfKwbvEJpi8ITcnc3Eznwb4TN4OcMN3NQXm1wZ+GsW/GCC942RLO/cTI
         MxfRJmG6cQpgSOPnA7L3xpqy43YZyrFTkgNUa/2ebONliobmLsmuwfEmaSFdM51Wwfzk
         lCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548763; x=1707153563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd9miIuow0BSRA/mBkMSExaPwqKXz3kDkiwlSiWY+B4=;
        b=ndKVgIyUN5O+vydHXkJh0yB1FOmcVgZX6U1B/TzYRWouXIsnKSTNKWGMPQXK5g4iXL
         3dWJZWW6Xd1khnqUNo9rRrIWk2+5AjnEBzkWVywSAD3JNgHjImfANBp03NlYX4wdnpgw
         sOXIVV4dFYLfHnSMRVU64SarP7NLhkYgyaa8tB7htuqY/LZf1fisWcz7mK2Ey19miCtN
         c11EQRxew/2RDffElg/GfxavQZmX0hiawZPc55HYo4GPNJNtmRu2HVYlaV6zTjoBEYZ9
         8dWEkzlVXFOYdanlPONPLmVp9uyVIhmDbRVi81sVm9erdFPyLUU/Kvob9Sa+PYMRpZyu
         LDaw==
X-Gm-Message-State: AOJu0YyU0k6ea2tH7VpjCrbULgerEbmzKZP44bEPv/0lKDly8QoA4Xx3
	DbmRS8tAk9b//6DIbELtKVSDMEYM7cCRpWC7MNk1rNoWjyE6SVD24zFRXCjmN2pBetSUv5aysRL
	Bnvo=
X-Google-Smtp-Source: AGHT+IHA3GyKmzTknu0xDrqSyZtKBYr/88PUTlzm4Vz+aC0G/wQTLAnjXEd2qFQNtW5kr5XXujwQJA==
X-Received: by 2002:a05:6402:3509:b0:55e:c6e3:5e24 with SMTP id b9-20020a056402350900b0055ec6e35e24mr3633682edd.36.1706548763268;
        Mon, 29 Jan 2024 09:19:23 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 07/15] xen/arm: add support for cache coloring configuration via device-tree
Date: Mon, 29 Jan 2024 18:18:03 +0100
Message-Id: <20240129171811.21382-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
color configurations.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v6:
- rewrote domain_set_llc_colors_from_str() to be more explicit
v5:
- static-mem check has been moved in a previous patch
- added domain_set_llc_colors_from_str() to set colors after domain creation
---
 docs/misc/arm/device-tree/booting.txt |  4 +++
 docs/misc/cache-coloring.rst          | 48 ++++++++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c         | 11 ++++++
 xen/common/llc-coloring.c             | 23 +++++++++++++
 xen/include/xen/llc-coloring.h        |  2 +-
 5 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..bbe49faadc 100644
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
index c347725525..bf055d7e7f 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -10,7 +10,7 @@ If needed, change the maximum number of colors with
 ``CONFIG_NR_LLC_COLORS=<n>``.
 
 Compile Xen and the toolstack and then configure it via
-`Command line parameters`_.
+`Command line parameters`_. For DomUs follow `DomUs configuration`_.
 
 Background
 **********
@@ -115,6 +115,52 @@ Examples:
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
+which corresponds to all available colors is used instead.
+
 Known issues and limitations
 ****************************
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 992080e61a..efc1bbbc3e 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -807,6 +807,7 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -950,6 +951,11 @@ void __init create_domUs(void)
 #endif
         }
 
+        dt_property_read_string(node, "llc-colors", &llc_colors_str);
+        if ( !llc_coloring_enabled && llc_colors_str)
+            printk(XENLOG_WARNING
+                   "'llc-colors' found, but LLC coloring is disabled\n");
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
@@ -960,6 +966,11 @@ void __init create_domUs(void)
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
index aaf0606c00..a932a61e0c 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -254,6 +254,29 @@ int domain_set_llc_colors_domctl(struct domain *d,
     return domain_check_colors(d);
 }
 
+int domain_set_llc_colors_from_str(struct domain *d, const char *str)
+{
+    int err;
+    unsigned int *colors;
+
+    if ( !str )
+        return domain_set_default_colors(d);
+
+    colors = alloc_colors(max_nr_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    err = parse_color_config(str, colors, max_nr_colors, &d->num_llc_colors);
+    if ( err )
+    {
+        printk(XENLOG_ERR "Error parsing LLC color configuration.");
+        return err;
+    }
+    d->llc_colors = colors;
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index a82081367f..63785c8319 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -27,7 +27,7 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
-
+int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 int domain_set_llc_colors_domctl(struct domain *d,
                                  const struct xen_domctl_set_llc_colors *config);
 
-- 
2.34.1


