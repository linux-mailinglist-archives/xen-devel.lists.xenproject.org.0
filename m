Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500352AB89D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22468.48798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dE-0003yz-K9; Mon, 09 Nov 2020 12:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22468.48798; Mon, 09 Nov 2020 12:50:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dE-0003yS-FK; Mon, 09 Nov 2020 12:50:48 +0000
Received: by outflank-mailman (input) for mailman id 22468;
 Mon, 09 Nov 2020 12:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dC-0003tf-GG
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:46 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3ff9ada-bce0-421f-b7dd-51132a6a6695;
 Mon, 09 Nov 2020 12:50:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h23so5662951ljg.13
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:37 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:35 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dC-0003tf-GG
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:46 +0000
X-Inumbo-ID: d3ff9ada-bce0-421f-b7dd-51132a6a6695
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d3ff9ada-bce0-421f-b7dd-51132a6a6695;
	Mon, 09 Nov 2020 12:50:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h23so5662951ljg.13
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0raAmTH7axJ0YbWj1RALaYgyVMCqkwur6fbc6S2x+mQ=;
        b=PMkxzd3meXfxMFb+8V9v7umIklIQVDgU3Yej5GLf8NU7kAmMU2+X+iujw4xkvoPWDZ
         Fm/28ucP6ws+K2JsF3+RpNyd7b6UwSmSOHJh85uxzWU994fDaFsECOoIbCHjR1prI4yU
         64eHPDI4OgRvuOqOUEqXAzGgTRhri8UvuIRYqKmWb2PUtZrH4WabsDma9liElDpwz7as
         j4D8EPtr5S2d5pa4JGAhP3pVYZ8xGTwjkK0lbRPgJI/mqdvu9ywBmCcLBjSbegicuWlt
         r9myYOftERyVCLaQPMnDbSM29lZW/loDtF+lNO+cwK27Yf3Iql1Qak7N2Ca/XgdZzDZE
         LqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0raAmTH7axJ0YbWj1RALaYgyVMCqkwur6fbc6S2x+mQ=;
        b=mUuxg36vtPtT76VLpOey1FIxB3yqOt6KeFX7knzis4E7rBJJ7PvoFFVH7vwn/rU1E5
         LIpOYonDKLj0cD6Uh8/mbRVv//gojnXjCIaACX+V457vvp++ScGth8UNXAe7d/D+3474
         bgIudVKR5rXGU8hZXLaKR3ZQCFELjepYNgpC939+ZQ8IdBwSrdFNZfo220kQtdzs284s
         dFd3lrm07pHJsH97uYyE80kMTRajkm0mOoo66oBSa44TV5FFD8zhwycp0tdMcvqzsfQK
         BOJr54VoK7a15foXsswtIFpCoU9ExktFtPZRy8J6DZVOgR/M6UYemnHqinh+dbzTPfwO
         ZVQg==
X-Gm-Message-State: AOAM531pz4c5Iv3Vg/bt6bipIwoxVS7Sdx9dsxeYfo5Rx51QtErdLhcC
	rimt9U27DvEtBZbKFJp9DkU=
X-Google-Smtp-Source: ABdhPJzP9fZHRdiYOs6Ll6Bu1EWUvCyMJ+eVtThjJRLcocKF8qx9PQqAen8FQrTxH96C4NWdi/wfBA==
X-Received: by 2002:a2e:9694:: with SMTP id q20mr139176lji.279.1604926236043;
        Mon, 09 Nov 2020 04:50:36 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:35 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Date: Mon,  9 Nov 2020 14:50:23 +0200
Message-Id: <20201109125031.26409-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The original code depends on pciback to manage assignable device list.
The functionality which is implemented by the pciback and the toolstack
and which is relevant/missing/needed for ARM:

1. pciback is used as a database for assignable PCI devices, e.g. xl
   pci-assignable-{add|remove|list} manipulates that list. So, whenever the
   toolstack needs to know which PCI devices can be passed through it reads
   that from the relevant sysfs entries of the pciback.

2. pciback is used to hold the unbound PCI devices, e.g. when passing through
   a PCI device it needs to be unbound from the relevant device driver and bound
   to pciback (strictly speaking it is not required that the device is bound to
   pciback, but pciback is again used as a database of the passed through PCI
   devices, so we can re-bind the devices back to their original drivers when
   guest domain shuts down)

1. As ARM doesn't use pciback implement the above with additional sysctls:
 - XEN_SYSCTL_pci_device_set_assigned
 - XEN_SYSCTL_pci_device_get_assigned
 - XEN_SYSCTL_pci_device_enum_assigned
2. Extend struct pci_dev to hold assignment state.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/libxc/include/xenctrl.h |   9 +++
 tools/libxc/xc_domain.c       |   1 +
 tools/libxc/xc_misc.c         |  46 +++++++++++++++
 tools/libxl/Makefile          |   4 ++
 tools/libxl/libxl_pci.c       | 105 ++++++++++++++++++++++++++++++++--
 xen/arch/arm/sysctl.c         |  66 ++++++++++++++++++++-
 xen/drivers/passthrough/pci.c |  93 ++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h   |  40 +++++++++++++
 xen/include/xen/pci.h         |  12 ++++
 9 files changed, 370 insertions(+), 6 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 4c89b7294c4f..77029013da7d 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -2652,6 +2652,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+typedef xen_sysctl_pci_device_enum_assigned_t xc_pci_device_enum_assigned_t;
+
+int xc_pci_device_set_assigned(xc_interface *xch, uint32_t machine_sbdf,
+                               bool assigned);
+int xc_pci_device_get_assigned(xc_interface *xch, uint32_t machine_sbdf);
+
+int xc_pci_device_enum_assigned(xc_interface *xch,
+                                xc_pci_device_enum_assigned_t *e);
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
index 71829c2bce3e..d515191e9243 100644
--- a/tools/libxc/xc_domain.c
+++ b/tools/libxc/xc_domain.c
@@ -2321,6 +2321,7 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
 }
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
index 3820394413a9..d439c4ba1019 100644
--- a/tools/libxc/xc_misc.c
+++ b/tools/libxc/xc_misc.c
@@ -988,6 +988,52 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
     return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
 }
 
+int xc_pci_device_set_assigned(
+    xc_interface *xch,
+    uint32_t machine_sbdf,
+    bool assigned)
+{
+    DECLARE_SYSCTL;
+
+    sysctl.cmd = XEN_SYSCTL_pci_device_set_assigned;
+    sysctl.u.pci_set_assigned.machine_sbdf = machine_sbdf;
+    sysctl.u.pci_set_assigned.assigned = assigned;
+
+    return do_sysctl(xch, &sysctl);
+}
+
+int xc_pci_device_get_assigned(
+    xc_interface *xch,
+    uint32_t machine_sbdf)
+{
+    DECLARE_SYSCTL;
+
+    sysctl.cmd = XEN_SYSCTL_pci_device_get_assigned;
+    sysctl.u.pci_get_assigned.machine_sbdf = machine_sbdf;
+
+    return do_sysctl(xch, &sysctl);
+}
+
+int xc_pci_device_enum_assigned(xc_interface *xch,
+                                xc_pci_device_enum_assigned_t *e)
+{
+    int ret;
+    DECLARE_SYSCTL;
+
+    sysctl.cmd = XEN_SYSCTL_pci_device_enum_assigned;
+    sysctl.u.pci_enum_assigned.idx = e->idx;
+    sysctl.u.pci_enum_assigned.report_not_assigned = e->report_not_assigned;
+    ret = do_sysctl(xch, &sysctl);
+    if ( ret )
+        errno = EINVAL;
+    else
+    {
+        e->domain = sysctl.u.pci_enum_assigned.domain;
+        e->machine_sbdf = sysctl.u.pci_enum_assigned.machine_sbdf;
+    }
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index f3806aafcb4e..6f76ba35aec7 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -130,6 +130,10 @@ endif
 
 LIBXL_LIBS += -lyajl
 
+ifeq ($(CONFIG_X86),y)
+CFALGS += -DCONFIG_PCIBACK
+endif
+
 ifeq ($(CONFIG_ARM),y)
 CFALGS += -DCONFIG_ARM
 endif
diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index b93cf976642b..41f89b8aae10 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -319,6 +319,7 @@ retry_transaction2:
 
 static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int *num)
 {
+#ifdef CONFIG_PCIBACK
     char **domlist;
     unsigned int nd = 0, i;
 
@@ -356,6 +357,33 @@ static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int
             }
         }
     }
+#else
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    int ret;
+    xc_pci_device_enum_assigned_t e;
+
+    *list = NULL;
+    *num = 0;
+
+    memset(&e, 0, sizeof(e));
+    do {
+        ret = xc_pci_device_enum_assigned(ctx->xch, &e);
+        if ( ret && errno == EINVAL )
+            break;
+        *list = realloc(*list, sizeof(libxl_device_pci) * (e.idx + 1));
+        if (*list == NULL)
+            return ERROR_NOMEM;
+
+        pcidev_struct_fill(*list + e.idx,
+                           e.domain,
+                           e.machine_sbdf >> 8 & 0xff,
+                           PCI_SLOT(e.machine_sbdf),
+                           PCI_FUNC(e.machine_sbdf),
+                           0 /*vdevfn*/);
+        e.idx++;
+    } while (!ret);
+    *num = e.idx;
+#endif
     libxl__ptr_add(gc, *list);
 
     return 0;
@@ -411,13 +439,20 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
-    libxl_device_pci *pcidevs = NULL, *new, *assigned;
+    libxl_device_pci *pcidevs = NULL, *new;
+    int r;
+#ifdef CONFIG_PCIBACK
+    libxl_device_pci *assigned;
+    int num_assigned;
     struct dirent *de;
     DIR *dir;
-    int r, num_assigned;
+#else
+    xc_pci_device_enum_assigned_t e;
+#endif
 
     *num = 0;
 
+#ifdef CONFIG_PCIBACK
     r = get_all_assigned_devices(gc, &assigned, &num_assigned);
     if (r) goto out;
 
@@ -453,6 +488,32 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 
     closedir(dir);
 out:
+#else
+    memset(&e, 0, sizeof(e));
+    e.report_not_assigned = 1;
+    do {
+        r = xc_pci_device_enum_assigned(ctx->xch, &e);
+        if ( r && errno == EINVAL )
+            break;
+        new = realloc(pcidevs, (e.idx + 1) * sizeof(*new));
+        if (NULL == new)
+            continue;
+
+        pcidevs = new;
+        new = pcidevs + e.idx;
+
+        memset(new, 0, sizeof(*new));
+
+        pcidev_struct_fill(new,
+                           e.domain,
+                           e.machine_sbdf >> 8 & 0xff,
+                           PCI_SLOT(e.machine_sbdf),
+                           PCI_FUNC(e.machine_sbdf),
+                           0 /*vdevfn*/);
+        e.idx++;
+    } while (!r);
+    *num = e.idx;
+#endif
     GC_FREE;
     return pcidevs;
 }
@@ -606,6 +667,7 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
     return false;
 }
 
+#ifdef CONFIG_PCIBACK
 /*
  * A brief comment about slots.  I don't know what slots are for; however,
  * I have by experimentation determined:
@@ -648,11 +710,13 @@ out:
     fclose(f);
     return rc;
 }
+#endif
 
 static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
 {
-    char * spath;
     int rc;
+#ifdef CONFIG_PCIBACK
+    char * spath;
     struct stat st;
 
     if ( access(SYSFS_PCIBACK_DRIVER, F_OK) < 0 ) {
@@ -663,22 +727,27 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
         }
         return -1;
     }
-
     spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
                       pcidev->domain, pcidev->bus,
                       pcidev->dev, pcidev->func);
     rc = lstat(spath, &st);
-
     if( rc == 0 )
         return 1;
     if ( rc < 0 && errno == ENOENT )
         return 0;
     LOGE(ERROR, "Accessing %s", spath);
     return -1;
+#else
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    rc = xc_pci_device_get_assigned(ctx->xch, pcidev_encode_bdf(pcidev));
+    return rc == 0 ? 1 : 0;
+#endif
 }
 
 static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pcidev)
 {
+#ifdef CONFIG_PCIBACK
     int rc;
 
     if ( (rc=pciback_dev_has_slot(gc, pcidev)) < 0 ) {
@@ -697,10 +766,17 @@ static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pcidev)
         return ERROR_FAIL;
     }
     return 0;
+#else
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    return xc_pci_device_set_assigned(ctx->xch, pcidev_encode_bdf(pcidev),
+                                      true);
+#endif
 }
 
 static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
 {
+#ifdef CONFIG_PCIBACK
     /* Remove from pciback */
     if ( sysfs_dev_unbind(gc, pcidev, NULL) < 0 ) {
         LOG(ERROR, "Couldn't unbind device!");
@@ -716,6 +792,12 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
         }
     }
     return 0;
+#else
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    return xc_pci_device_set_assigned(ctx->xch, pcidev_encode_bdf(pcidev),
+                                      false);
+#endif
 }
 
 #define PCIBACK_INFO_PATH "/libxl/pciback"
@@ -780,10 +862,15 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
 
     /* See if the device exists */
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
+#ifdef CONFIG_PCI_SYSFS_DOM0
     if ( lstat(spath, &st) ) {
         LOGE(ERROR, "Couldn't lstat %s", spath);
         return ERROR_FAIL;
     }
+#else
+    (void)st;
+    printf("IMPLEMENT_ME: %s lstat %s\n", __func__, spath);
+#endif
 
     /* Check to see if it's already assigned to pciback */
     rc = pciback_dev_is_assigned(gc, pcidev);
@@ -1350,8 +1437,12 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+#ifdef CONFIG_PCI_SYSFS_DOM0
         rc = ERROR_FAIL;
         goto out;
+#else
+        goto out_no_irq;
+#endif
     }
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
         if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
@@ -1522,7 +1613,11 @@ static int libxl_pcidev_assignable(libxl_ctx *ctx, libxl_device_pci *pcidev)
             break;
     }
     free(pcidevs);
+#ifdef CONFIG_PCIBACK
     return i != num;
+#else
+    return 1;
+#endif
 }
 
 static void device_pci_add_stubdom_wait(libxl__egc *egc,
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e8473c..84e933b2eb45 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <xen/guest_access.h>
 #include <public/sysctl.h>
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
@@ -20,7 +21,70 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
-    return -ENOSYS;
+    long ret = 0;
+    bool copyback = 0;
+
+    switch ( sysctl->cmd )
+    {
+    case XEN_SYSCTL_pci_device_set_assigned:
+    {
+        u16 seg;
+        u8 bus, devfn;
+        uint32_t machine_sbdf;
+
+        machine_sbdf = sysctl->u.pci_set_assigned.machine_sbdf;
+
+#if 0
+        ret = xsm_pci_device_set_assigned(XSM_HOOK, d);
+        if ( ret )
+            break;
+#endif
+
+        seg = machine_sbdf >> 16;
+        bus = PCI_BUS(machine_sbdf);
+        devfn = PCI_DEVFN2(machine_sbdf);
+
+        pcidevs_lock();
+        ret = pci_device_set_assigned(seg, bus, devfn,
+                                      !!sysctl->u.pci_set_assigned.assigned);
+        pcidevs_unlock();
+        break;
+    }
+    case XEN_SYSCTL_pci_device_get_assigned:
+    {
+        u16 seg;
+        u8 bus, devfn;
+        uint32_t machine_sbdf;
+
+        machine_sbdf = sysctl->u.pci_set_assigned.machine_sbdf;
+
+        seg = machine_sbdf >> 16;
+        bus = PCI_BUS(machine_sbdf);
+        devfn = PCI_DEVFN2(machine_sbdf);
+
+        pcidevs_lock();
+        ret = pci_device_get_assigned(seg, bus, devfn);
+        pcidevs_unlock();
+        break;
+    }
+    case XEN_SYSCTL_pci_device_enum_assigned:
+    {
+        ret = pci_device_enum_assigned(sysctl->u.pci_enum_assigned.report_not_assigned,
+                                       sysctl->u.pci_enum_assigned.idx,
+                                       &sysctl->u.pci_enum_assigned.domain,
+                                       &sysctl->u.pci_enum_assigned.machine_sbdf);
+        copyback = 1;
+        break;
+    }
+    default:
+        ret = -ENOSYS;
+        break;
+    }
+    if ( copyback && (!ret || copyback > 0) &&
+         __copy_to_guest(u_sysctl, sysctl, 1) )
+        ret = -EFAULT;
+
+    return ret;
 }
 
 /*
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 98e8a2fade60..49b4279c63bd 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -879,6 +879,43 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+#ifdef CONFIG_ARM
+int pci_device_set_assigned(u16 seg, u8 bus, u8 devfn, bool assigned)
+{
+    struct pci_dev *pdev;
+
+    pdev = pci_get_pdev(seg, bus, devfn);
+    if ( !pdev )
+    {
+        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
+               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        return -ENODEV;
+    }
+
+    pdev->assigned = assigned;
+    printk(XENLOG_ERR "pciback %sassign PCI device %04x:%02x:%02x.%u\n",
+           assigned ? "" : "de-",
+           seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+
+    return 0;
+}
+
+int pci_device_get_assigned(u16 seg, u8 bus, u8 devfn)
+{
+    struct pci_dev *pdev;
+
+    pdev = pci_get_pdev(seg, bus, devfn);
+    if ( !pdev )
+    {
+        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
+               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        return -ENODEV;
+    }
+
+    return pdev->assigned ? 0 : -ENODEV;
+}
+#endif
+
 #ifndef CONFIG_ARM
 /*TODO :Implement MSI support for ARM  */
 static int pci_clean_dpci_irq(struct domain *d,
@@ -1821,6 +1858,62 @@ int iommu_do_pci_domctl(
     return ret;
 }
 
+#ifdef CONFIG_ARM
+struct list_assigned {
+    uint32_t cur_idx;
+    uint32_t from_idx;
+    bool assigned;
+    domid_t *domain;
+    uint32_t *machine_sbdf;
+};
+
+static int _enum_assigned_pci_devices(struct pci_seg *pseg, void *arg)
+{
+    struct list_assigned *ctxt = arg;
+    struct pci_dev *pdev;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        if ( pdev->assigned == ctxt->assigned )
+        {
+            if ( ctxt->cur_idx == ctxt->from_idx )
+            {
+                *ctxt->domain = pdev->domain->domain_id;
+                *ctxt->machine_sbdf = pdev->sbdf.sbdf;
+                return 1;
+            }
+            ctxt->cur_idx++;
+        }
+    }
+    return 0;
+}
+
+int pci_device_enum_assigned(bool report_not_assigned,
+                             uint32_t from_idx, domid_t *domain,
+                             uint32_t *machine_sbdf)
+{
+    struct list_assigned ctxt = {
+        .assigned = !report_not_assigned,
+        .cur_idx = 0,
+        .from_idx = from_idx,
+        .domain = domain,
+        .machine_sbdf = machine_sbdf,
+    };
+    int ret;
+
+    pcidevs_lock();
+    ret = pci_segments_iterate(_enum_assigned_pci_devices, &ctxt);
+    pcidevs_unlock();
+    /*
+     * If not found then report as EINVAL to mark
+     * enumeration process finished.
+     */
+    if ( !ret )
+        return -EINVAL;
+    return 0;
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index a07364711794..5ca73c538688 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1062,6 +1062,40 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+/*
+ * These are to emulate pciback device (de-)assignment used by the tools
+ * to track current device assignments: all the PCI devices that can
+ * be passed through must be assigned to the pciback to mark them
+ * as such. As on ARM we do not run pci{back|front} and are emulating
+ * PCI host bridge in Xen, so we need to maintain the assignments on our
+ * own in Xen itself.
+ *
+ * Note on xen_sysctl_pci_device_get_assigned: ENOENT is used to report
+ * that there are no assigned devices left.
+ */
+struct xen_sysctl_pci_device_set_assigned {
+    /* IN */
+    /* FIXME: is this really a machine SBDF or as Domain-0 sees it? */
+    uint32_t machine_sbdf;
+    uint8_t assigned;
+};
+
+struct xen_sysctl_pci_device_get_assigned {
+    /* IN */
+    uint32_t machine_sbdf;
+};
+
+struct xen_sysctl_pci_device_enum_assigned {
+    /* IN */
+    uint32_t idx;
+    uint8_t report_not_assigned;
+    /* OUT */
+    domid_t domain;
+    uint32_t machine_sbdf;
+};
+typedef struct xen_sysctl_pci_device_enum_assigned xen_sysctl_pci_device_enum_assigned_t;
+DEFINE_XEN_GUEST_HANDLE(xen_sysctl_pci_device_enum_assigned_t);
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1092,6 +1126,9 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_pci_device_set_assigned       30
+#define XEN_SYSCTL_pci_device_get_assigned       31
+#define XEN_SYSCTL_pci_device_enum_assigned      32
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1122,6 +1159,9 @@ struct xen_sysctl {
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
+        struct xen_sysctl_pci_device_set_assigned pci_set_assigned;
+        struct xen_sysctl_pci_device_get_assigned pci_get_assigned;
+        struct xen_sysctl_pci_device_enum_assigned pci_enum_assigned;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 2bc4aaf4530c..7bf439de4de0 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -132,6 +132,13 @@ struct pci_dev {
 
     /* Data for vPCI. */
     struct vpci *vpci;
+#ifdef CONFIG_ARM
+    /*
+     * Set if this PCI device is eligible for pass through,
+     * e.g. just like it was assigned to pciback driver.
+     */
+    bool assigned;
+#endif
 };
 
 #define for_each_pdev(domain, pdev) \
@@ -168,6 +175,11 @@ const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_device_set_assigned(u16 seg, u8 bus, u8 devfn, bool assigned);
+int pci_device_get_assigned(u16 seg, u8 bus, u8 devfn);
+int pci_device_enum_assigned(bool report_not_assigned,
+                             uint32_t from_idx, domid_t *domain,
+                             uint32_t *machine_sbdf);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(int seg, int bus, int devfn);
-- 
2.17.1


