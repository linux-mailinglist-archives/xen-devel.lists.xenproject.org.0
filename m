Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C887CBC0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693753.1082264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hv-0002Dc-Iv; Fri, 15 Mar 2024 10:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693753.1082264; Fri, 15 Mar 2024 10:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hv-00027S-DK; Fri, 15 Mar 2024 10:59:47 +0000
Received: by outflank-mailman (input) for mailman id 693753;
 Fri, 15 Mar 2024 10:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hs-0000aQ-VU
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:44 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212f74e8-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:44 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-568a5114881so1760170a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:44 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:42 -0700 (PDT)
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
X-Inumbo-ID: 212f74e8-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500383; x=1711105183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+Vu4Fggbp4Y0GsyZklBM1aj7v1C64ye9Ydxu/52UA4=;
        b=oFxcQO8haE1PxcQFVgrfHyCmmc37zHKpyPaPYyFxlL/+XgUi760o9xRe3FytITDw+1
         RZUE1i2pyMsmAeMQsEwlHl+nGsk/2nvAQ6xfudS/9AcdBr30sZTqizZ2osznHxaVLs4A
         XDPBUJ0V2OmtWe7Z4nfiu4Yaka1XRfSw6stzN+H/4jeYlpY/3hdrcablgxKgv8jT8XNI
         F/kYBW7H/XrjxkwOKbNb2hyww0NQUxgKMUeggUakZ+VsVolOFuOFhguF6oVSUVQwD4yR
         jN9jBIlcgXZI49SP9MMVP/eP2OWzwwXyIKkHBuQKgL82+q58GC/p0Oi201pbi9gk/7EV
         I0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500383; x=1711105183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+Vu4Fggbp4Y0GsyZklBM1aj7v1C64ye9Ydxu/52UA4=;
        b=cFhzb1j1MGi54u5VdJ5fd6kNgP4O4HYuK2Dg0jh3n0Bw6au8N20+ji1z1iLZc1rrfc
         XZY9bRoj3gAmRtTW6LBQVrV0AOQnq5UlEVc6ce7X2pBtOKwv9kq5Q/WY/xMHUmyJr9WC
         tVsm++hdoo3IB0GchrNXDUYL4oGMxENf6qtmn5a/KeY6koHxfDbQULn2zEfrOUQkYy2K
         st/JgpStdlSqxMB9YpjewxL61aksB4JhpJ3HHFtcM5Yo+NQVCaZ9XrpZYXdoZazATu3V
         29/RGVpLikclcYp9dGmMXHIcJcPllfrL/Rm+lnmyETlTH4yvn0X/I6eKpiJBd1x0J+3t
         SlNQ==
X-Gm-Message-State: AOJu0Yx6GUemoitrkW+J3Kg4qr+FfUtvoXcFORorXxrSSVCiEY2ZQS/v
	UWglIdV7542QiVSjyx2bz8G6tSywglNksc6uUOzspKKi4r3wZNMIYPACEDxHmWHRguaS3ZDSGxB
	7PKo=
X-Google-Smtp-Source: AGHT+IESDraWCMlp4kM9GuRaW/ZTZSKmJifqtNLUnrRbvvn0kvJI180ejOrrRWcSpx3DHP6Bs3jhqw==
X-Received: by 2002:a17:907:cbc5:b0:a46:7ba4:9cb with SMTP id vk5-20020a170907cbc500b00a467ba409cbmr2517075ejc.9.1710500383400;
        Fri, 15 Mar 2024 03:59:43 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
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
Subject: [PATCH v7 07/14] xen/arm: add support for cache coloring configuration via device-tree
Date: Fri, 15 Mar 2024 11:58:55 +0100
Message-Id: <20240315105902.160047-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
color configurations.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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
 xen/common/llc-coloring.c             | 31 +++++++++++++++++
 xen/include/xen/llc-coloring.h        |  1 +
 5 files changed, 94 insertions(+)

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
index 4c859135cb..028aecda28 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -12,6 +12,7 @@ If needed, change the maximum number of colors with
 ``CONFIG_NR_LLC_COLORS=<n>``.
 
 Runtime configuration is done via `Command line parameters`_.
+For DomUs follow `DomUs configuration`_.
 
 Background
 **********
@@ -156,6 +157,53 @@ LLC specs can be manually set via the above command line parameters. This
 bypasses any auto-probing and it's used to overcome failing situations or for
 debugging/testing purposes.
 
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
index 992080e61a..f7ac9b9900 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -807,6 +807,7 @@ void __init create_domUs(void)
     struct dt_device_node *node;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -950,6 +951,10 @@ void __init create_domUs(void)
 #endif
         }
 
+        dt_property_read_string(node, "llc-colors", &llc_colors_str);
+        if ( !llc_coloring_enabled && llc_colors_str)
+            panic("'llc-colors' found, but LLC coloring is disabled\n");
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
@@ -960,6 +965,11 @@ void __init create_domUs(void)
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
index 9c1f152b96..77d24553e0 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -253,6 +253,37 @@ int domain_set_llc_colors(struct domain *d,
     return 0;
 }
 
+int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
+{
+    int err;
+    unsigned int *colors, num_colors;
+
+    if ( !str )
+        return domain_set_default_colors(d);
+
+    colors = xmalloc_array(unsigned int, max_nr_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    err = parse_color_config(str, colors, max_nr_colors, &num_colors);
+    if ( err )
+    {
+        printk(XENLOG_ERR "Error parsing LLC color configuration");
+        return err;
+    }
+
+    if ( !check_colors(colors, num_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
+        return -EINVAL;
+    }
+
+    d->llc_colors = colors;
+    d->num_llc_colors = num_colors;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index b3801fca00..49ebd1e712 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -31,6 +31,7 @@ void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
 int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config);
+int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
 #endif /* __COLORING_H__ */
 
-- 
2.34.1


