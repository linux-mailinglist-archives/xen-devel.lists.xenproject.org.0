Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987A9F121F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856861.1269437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Ws-0005y0-EB; Fri, 13 Dec 2024 16:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856861.1269437; Fri, 13 Dec 2024 16:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Ws-0005vC-8p; Fri, 13 Dec 2024 16:28:38 +0000
Received: by outflank-mailman (input) for mailman id 856861;
 Fri, 13 Dec 2024 16:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wr-0003wJ-CU
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:37 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d06218e-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:35 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so244931666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:35 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:34 -0800 (PST)
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
X-Inumbo-ID: 4d06218e-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107315; x=1734712115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFP3lN2u/aPjbY0TPsAh1rRXnFfL4x53loEQEUCcn44=;
        b=erXJPmim0KqLyg6def0UtsQBNp+ujx6JhrYPtot1NH/enVMLz0TrZ/F7XZ/N6jvT12
         QzUDTvjMbTFvxIhSJpeqVPSZqI6wP43tcZErAMj2kGV0s/ZzPz3T71txBuRkCl/fyQBB
         JkObvrc6OWdpwd153NoDalc2mkEUwOv3nadfP5/zLlZm/fYSMmVeaQxXqZff1wMtF2O7
         DSKooLdsKVEB/WXNoRaIKwiYLD/o5U97od8DDR12h/L79Bjse74JyHhgSAtp3y4uMP5+
         LGmTCJgH99404sNIu/1OX5DEALyFUFDA1Vbz/soV5Kwamth2VKciKHBwaCK+vH7+i5Og
         Soog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107315; x=1734712115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFP3lN2u/aPjbY0TPsAh1rRXnFfL4x53loEQEUCcn44=;
        b=kuzNvToEYJ5rwAG9T7kK4mymwZv7cZT9Y32tH1mjiQJu0xB1sXA4liRr8zPHYvYsuB
         YoBF24jDu86jXG06x2pS6MeUq2kF5iaRKbs7iuBtgOjJu7J28h1q8QKuwcp400vE5C/1
         TqqkNF/32GEjff4hEdiq7nnUbwy7/xcPDy1wFKwSJcC9c2x9CdQiGstbFFKltG3AP8KA
         onSb2dA1DVl0KZW8CaRnRvt9799Kw+Tf1YEkSqN6QOZP5Gz9EAREUmdsX5l2TGLKYGYs
         SRiCw47a9kUppxasBYIUzovr6F4QexvJjDRt5TVDuihJA3uivMS9c8yeNwplRfIqVbC0
         t5sg==
X-Gm-Message-State: AOJu0YzvdxpfJ6oydpR0haeLQpXA424Vpm2OixIG9qAUJ0XSZZoGYdFt
	Zboa07COc0Kx2VSZaHMTIXNmmBWi+eaW6AKgO3tiIm0Be9SxBqr7yHWYn5o8X5ZEiT2XYep6ZOu
	G8dk=
X-Gm-Gg: ASbGncvWkChpEjZI1F784LTC6C1T6ZUYEHUzppGk2D69ckW54BnsnSVXmR11kGHBf+E
	4ljSmd1/Uxieov7ytvjJfkmd/tEcoUVNcnoRlDuWK8HI2sK51HmSn0VYc1DYudHLXmIShKLxOpT
	a3vderjoUxVNa0O7H75fZC6uhnN+ht+J/+SydDb2bEyLkOwhyJvLZnE9l9JiZ1coQPnKYe+7pGv
	F1wSKXS4clFVT+LubZfhtWVGA1SKIOZvMuTjy44Xx50E8AZnvnRBGsOTxUEtFbspj6GtjpOHj6t
	5nidNB8pmGVLS9Bw
X-Google-Smtp-Source: AGHT+IEbA6dke+2U6A9aM1+Ezqd72LDaJoNfLha9Msq7ItRiGcv/T9srLySBjaHSM/f6EDE+2W9YCQ==
X-Received: by 2002:a05:6402:2786:b0:5d3:ff93:f5f9 with SMTP id 4fb4d7f45d1cf-5d63c3432f6mr6594350a12.20.1734107314996;
        Fri, 13 Dec 2024 08:28:34 -0800 (PST)
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v12 07/12] xen/arm: add support for cache coloring configuration via device-tree
Date: Fri, 13 Dec 2024 17:28:10 +0100
Message-ID: <20241213162815.9196-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "llc-colors" Device Tree property to express DomUs and Dom0less
color configurations.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-Arm
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v12:
- no changes
v11:
- made clear that llc-colors device-tree property is Arm64-only in booting.txt
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
 docs/misc/arm/device-tree/booting.txt |  5 +++
 docs/misc/cache-coloring.rst          | 48 +++++++++++++++++++++++++++
 xen/arch/arm/dom0less-build.c         | 10 ++++++
 xen/common/llc-coloring.c             | 40 ++++++++++++++++++++++
 xen/include/xen/llc-coloring.h        |  1 +
 xen/include/xen/xmalloc.h             | 12 +++++++
 6 files changed, 116 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3a04f5c57f..9c881baccc 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -162,6 +162,11 @@ with the following properties:
 
     An integer specifying the number of vcpus to allocate to the guest.
 
+- llc-colors
+    A string specifying the LLC color configuration for the guest.
+    Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
+    only to Arm64 guests.
+
 - vpl011
 
     An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 7b47d0ed92..e097e74032 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -14,6 +14,7 @@ If needed, change the maximum number of colors with
 ``CONFIG_LLC_COLORS_ORDER=<n>``.
 
 Runtime configuration is done via `Command line parameters`_.
+For DomUs follow `DomUs configuration`_.
 
 Background
 **********
@@ -149,6 +150,53 @@ LLC specs can be manually set via the above command line parameters. This
 bypasses any auto-probing and it's used to overcome failing situations, such as
 flawed probing logic, or for debugging/testing purposes.
 
+DomUs configuration
+*******************
+
+DomUs colors can be set either in the ``xl`` configuration file (documentation
+at `docs/man/xl.cfg.pod.5.in`) or via Device Tree (documentation at
+`docs/misc/arm/device-tree/booting.txt`) using the ``llc-colors`` option.
+For example:
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
index d7d797e4d2..1a0e02ddb0 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -282,6 +282,46 @@ void domain_llc_coloring_free(struct domain *d)
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
index 26353c808a..5d1355b3c9 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -34,6 +34,7 @@ void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
 int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config);
+int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
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


