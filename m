Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B09AFEE7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825711.1240063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy9-0007QO-HE; Fri, 25 Oct 2024 09:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825711.1240063; Fri, 25 Oct 2024 09:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy9-0007JT-Bk; Fri, 25 Oct 2024 09:50:57 +0000
Received: by outflank-mailman (input) for mailman id 825711;
 Fri, 25 Oct 2024 09:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4Gy7-0005WM-Lp
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:50:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0af0c54-92b6-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 11:50:55 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cacb76e924so2386283a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:50:55 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:53 -0700 (PDT)
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
X-Inumbo-ID: a0af0c54-92b6-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849854; x=1730454654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3YSYZZGzDA1A2+rRg1kiZQBh+Nb+gR1I0/CKDqg1TA=;
        b=U8gMB2jyEPEw74/Vt/K+ObRgYvZhzA1jxjG7bcf/QvwJ7p98fZPrHx23iyxZfrT1SO
         ImlV1NOE9X5xRErz5SgTcM299XCAUMTp08jENvl+koWN3Rx5/pgOoQ87opxO7JxekGZa
         GM0qFzosGAdljQWCXHloOgcBpoGMeAlPkmjas4cVXfydK02ncvNTaSSWQijwa+EPncwR
         LPvHoFKrKSipg3sjEnlwvRyAW3PU7agvQAA0xUxfuXjJtvOjVQus560LKHdnn0cEJYGP
         NeD7bZpNSZS2S3/vfayQgzYJ5M8ioLArxydsKECKsfMQvHSMHRPiScFr35/ozgAMfDlb
         aVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849854; x=1730454654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3YSYZZGzDA1A2+rRg1kiZQBh+Nb+gR1I0/CKDqg1TA=;
        b=fSJYDOJCAV4pcZx7wEBDXnp1l4Cbih3NEGLIPe6qykRlRF7KtPHBd3oM29LehWAXN+
         sPnl0NCTMKMBXwQBlZEGGbJVYraMazskKKpcIlugkSaJzfthP6pG5Gh3Vb2muOeCwdis
         xVYS4tCF1ApXgLYMerJGjpXH9TdnYJBcBp3vozTETCFnOcl8RcMxNbrf9rFhWWsu1XCf
         ESCnmGBKn9YVtZgZkCiinikgbofPbYAnRWz8kmvVf0MkYt5c5DW5C3xpeWYvYCHJCeKW
         4q6EYSbj3uS8tYhMGkU1WPpAszP34MxjCOYUGLZL5NDmmPeZjfp9eLGN0lRagRyHbUrq
         ebyw==
X-Gm-Message-State: AOJu0YwaJ7JNrJ3XKdLNcgh0OxU7IDcCdkz4/ZMF270aOSaKbqhqA8cF
	BIPgyWxEW4I+ttAuIr+puVJgF9tNTw0+duBBbcMGNCTxjUdeumejkj4FFUvPSBmi4zlc42AuSZV
	+Oro=
X-Google-Smtp-Source: AGHT+IFAsBC48HB8S0chYmKLi82qaDD2YqIVbVwlPylhFyTCBL/R6Ga8rwtQEytxqdB5SptWR5aPbg==
X-Received: by 2002:a05:6402:2106:b0:5c3:cd88:a0a with SMTP id 4fb4d7f45d1cf-5cb8b1ac807mr6980556a12.18.1729849854078;
        Fri, 25 Oct 2024 02:50:54 -0700 (PDT)
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
	Jan Beulich <jbeulich@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v9 07/13] xen/arm: add support for cache coloring configuration via device-tree
Date: Fri, 25 Oct 2024 11:50:08 +0200
Message-ID: <20241025095014.42376-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
color configurations.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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
index 2ab0bb10a3..03d6c7054c 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2022 Xilinx Inc.
  */
+#include "xen/xmalloc.h"
 #include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
@@ -266,6 +267,46 @@ void domain_llc_coloring_free(struct domain *d)
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
index b3801fca00..49ebd1e712 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -31,6 +31,7 @@ void arch_llc_coloring_init(void);
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


