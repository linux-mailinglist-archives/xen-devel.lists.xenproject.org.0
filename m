Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D98A5BEAF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907856.1315058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbB-0006kk-I6; Tue, 11 Mar 2025 11:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907856.1315058; Tue, 11 Mar 2025 11:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxbB-0006i9-DM; Tue, 11 Mar 2025 11:16:37 +0000
Received: by outflank-mailman (input) for mailman id 907856;
 Tue, 11 Mar 2025 11:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbA-0006Sq-1X
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:36 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af8f589-fe6a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:16:35 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30bf5d7d107so41455011fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:35 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:33 -0700 (PDT)
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
X-Inumbo-ID: 4af8f589-fe6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691794; x=1742296594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04wizIaLTSFlmJKWvZpRMDn++A6FwzgnmnVliYBR7HQ=;
        b=jtaj1sBtZdLX/b90XHXChtuaoPnJUehP/M0ug+7A8jzopvqfv8mgSj72lQ+tiZENXH
         vfvijZ1GiS75IWd8QVXKe09oEbK3TRaoxc3DUb1dq5Ofku7wpXPpQAjWe4uYBnPijOgI
         3dfwXSUG+19XhwFSHTcxWv4G4b2L5u7fwkpqwT68tjjOnlsMRYwYAJZ8NtKeMxLU9DAi
         fst5Z3BZ9X0Ll8aSbMnCO7+xn+Gq1EcoV9Lsh1CnSC7ajd8qGTMOegbUGcKRzhI8WV9H
         OkhRskyt4lPVp7OMcnOAhzTEUTGtSX9N6yDC0Didv9Ul/9FonWpkcukwDV7ycQm8DIvk
         Cv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691794; x=1742296594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04wizIaLTSFlmJKWvZpRMDn++A6FwzgnmnVliYBR7HQ=;
        b=IeAuyYT1KWJULU2MoYRBQCirL9TqbrtR8pUoSWKnmvgGJZ7/cRdlPwvL7+yMftMl7m
         dc4xiEGkvXxaTtq3BaIIWFzYfHK0Q/5wSV5+A7UEfLI1CENYxX+k5gu+VvmMC5dKrh6b
         vyaGUKvmIx8O0lcA83ZmCyCNhd6Q4nFCgbcwE79aTlpJ3r/lcu/do1bZumXotqu+1mYZ
         QV8Nm9uEYF3DD6DE4jkF9RqYoeifkuXif9K9Vgtn/KouXdBHyDdLKPVsEtON/mD/BBOf
         38iHbB8Wt0CLSJbdCOO24y+ZERfcKB3IePoo3+yvxHX1FXZ067QFAL9tGrnuo1KT515h
         QSrg==
X-Gm-Message-State: AOJu0Ywi0hYqOEK3DH5Ati1kV+BccZB2VjYo8MzBMZnPSGAhA3iZM/xg
	MDUYRgK/jeiIhH9jPhUatx/dWXxDbN+JlRskA/HiL87CFxgq4CtDUtsU8rA4
X-Gm-Gg: ASbGncuD/qw3HIuxtB2x9Xi3dOA+IPIASAeRiwBhuuKcPMdMXgwczjVUppMPY1kb6aC
	ltLtJgRRWzIHNOGA8bVa/D2G3q+G4/jVAWKxu7Ub3vuZ9WW/y934d4VvWet82+ekFfdAQN13dzW
	ojac0IKiQXbtxCUyv0eXk1E8rMNR2hBMhHyek3sans7CEWxjI/H7T8hBQ/99xcO8tnKT9Ypfvj1
	pcNNa+upwQoonNBp6rptugLHfanq7xGx981luW8+bWfERbx0WGRSiifDmFg4w7bFrWxcOp+KU4f
	WD2Td9+BURX6ut4zzgh0ak6q5ceFd0ptKLcoRDVGpaie/XuB0bweQXxOweKXds+mcAg7WrqXogs
	ZVM8bBzwb5faXSc+qsSNTfok/rJ/K4EZ6rdhZVg==
X-Google-Smtp-Source: AGHT+IEMbJFWqRghLmu/ZOG4/DATF4wm6MfGWoKHG9Dg4MGsf5di/UXYyq9/MBiw5MgtsVaoqqO4MA==
X-Received: by 2002:a05:6512:1597:b0:549:4e86:75cc with SMTP id 2adb3069b0e04-54990e2bc0cmr6156848e87.4.1741691793579;
        Tue, 11 Mar 2025 04:16:33 -0700 (PDT)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
Date: Tue, 11 Mar 2025 13:16:12 +0200
Message-Id: <20250311111618.1850927-2-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
between the Domains and the Firmware. Also it allows SCI drivers to perform
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_ARM_SCI device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
  sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |  13 ++
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 187 +++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 214 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +
 xen/common/domctl.c                     |  13 ++
 xen/drivers/passthrough/device_tree.c   |   7 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 15 files changed, 486 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca98f..c0e8143dca63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -526,6 +526,12 @@ S:	Supported
 F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
 
+SCI MEDIATORS
+M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/sci
+F:	xen/include/asm-arm/sci
+
 TOOLSTACK
 M:	Anthony PERARD <anthony.perard@vates.tech>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba8e..bdab96a408c4 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
 
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
 
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res = sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
 
     res = map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d659b..c463ab3eaca5 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -14,6 +14,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
@@ -321,6 +322,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
+    res = sci_assign_dt_device(kinfo->d, node);
+    if ( res )
+        return res;
+
     res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
     if ( res < 0 )
         return res;
@@ -970,6 +975,14 @@ void __init create_domUs(void)
         if ( !llc_coloring_enabled && llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
 
+        /*
+         * TODO: enable ARM SCI for dom0less case
+         * The configuration need to be retrieved from DT
+         *  - arch.arm_sci_type, like "xen,sci_type"
+         *  - arch.arm_sci_agent_id, like "xen,sci_agent_id"
+         */
+        d_cfg.arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f86633..652aeb7a55de 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -25,6 +25,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -694,7 +695,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
 
 int arch_domain_create(struct domain *d,
@@ -786,6 +787,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+    if ( (rc = sci_domain_init(d, config)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
@@ -846,6 +850,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1039,6 +1044,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
 
@@ -1098,6 +1104,10 @@ int domain_relinquish_resources(struct domain *d)
         ret = relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret = sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
 
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade196..36d28b52a418 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -24,6 +24,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1888,6 +1889,9 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         return 0;
     }
 
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1988,6 +1992,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
+        res = sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd43..fc7918c7fc56 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediators
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
 
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
index a5e454266625..71bdefc24afb 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) += sci.o
 obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 000000000000..1fb6b55e030a
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator = ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index = 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret = cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct dt_device_node *dev;
+    int ret = 0;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_assign_device:
+        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
+        {
+            ret = -EINVAL;
+            break;
+        }
+
+        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
+                                    domctl->u.assign_device.u.dt.size, &dev);
+        if ( ret )
+            return ret;
+
+        ret = sci_assign_dt_device(d, dev);
+        if ( ret )
+            break;
+
+        break;
+    default:
+        /* do not fail here as call is chained with iommu handling */
+        break;
+    }
+
+    return ret;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci = 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc = device_init(np, DEVICE_ARM_SCI, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found second %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc != -EBADF && rc != -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48df..fa0898b7cf80 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -118,6 +118,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
 
 }  __cacheline_aligned;
 
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
new file mode 100644
index 000000000000..4c6f624723c5
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,214 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new domain
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes it
+     * need to handle and decide if those nodes need to be provided to Dom0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *node);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to guest,
+     * so SCI driver can enable device access to the domain if SCI FW provides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_spec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionality
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform steps
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can enable
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+
+/*
+ * SCI domctl handler
+ *
+ * Only XEN_DOMCTL_assign_device is handled for now.
+ */
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return false;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a120c..51b3c0297314 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled = handle_sip(regs);
+            if ( !handled )
+                handled = sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 05abb581a03d..b48ad20a6e2b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -27,6 +27,7 @@
 #include <xen/vm_event.h>
 #include <xen/monitor.h>
 #include <asm/current.h>
+#include <asm/firmware/sci.h>
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
@@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_deassign_device:
     case XEN_DOMCTL_get_device_group:
         ret = iommu_do_domctl(op, d, u_domctl);
+
+        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
+        {
+            /*
+             * TODO: RFC
+             * This change will allow to pass DT nodes/devices to
+             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
+             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
+             * is disabled) without failure.
+             */
+            ret = sci_do_domctl(op, d, u_domctl);
+        }
         break;
 
     case XEN_DOMCTL_get_paging_mempool_size:
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 075fb25a3706..f2ee0a72f541 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -318,6 +318,13 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
         }
 
+        /* TODO: RFC allow assignment of devices without IOMMU protection. */
+        if ( !dt_device_is_protected(dev) )
+        {
+            ret = 0;
+            break;
+        }
+
         ret = iommu_assign_dt_device(d, dev);
 
         if ( ret )
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8b4..9fcdabfda9bc 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_ARM_SCI,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24840eeaa666..55eed9992c9d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
 
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.34.1


