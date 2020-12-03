Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A742CD909
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43531.78215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYC-0000So-UD; Thu, 03 Dec 2020 14:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43531.78215; Thu, 03 Dec 2020 14:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYC-0000SD-OD; Thu, 03 Dec 2020 14:25:40 +0000
Received: by outflank-mailman (input) for mailman id 43531;
 Thu, 03 Dec 2020 14:25:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpYA-0000Rk-Nc
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:25:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpY9-0006LQ-5P; Thu, 03 Dec 2020 14:25:37 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpY8-00015c-K4; Thu, 03 Dec 2020 14:25:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=x251MOkO+WZaIbWbqux/NxcA8FNSIJPomM8sJBWlLiA=; b=NHJ8V3KC27N59oVeHtcyxMdfbW
	6lQzBGUjT+1JjCQ0FPXhkre2oAybEgadidVJWF6A4iTDtfKTemRSift3dihgMVE3MlZVgb6tWD2E+
	KECW/F91WS2S14GNBYOHbGaD+hueAwRGHN9ylm+FBrU1ezAVTwbMwNQLEx6s+8toO2eM=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
Date: Thu,  3 Dec 2020 14:25:12 +0000
Message-Id: <20201203142534.4017-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
is confusing and also compromises use of some macros used for other device
types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
of this duality.

This patch purges use of 'pcidev' from the libxl code, allowing evaluation of
DEFINE_DEVICE_TYPE_STRUCT_X to be replaced with DEFINE_DEVICE_TYPE_STRUCT,
hence allowing removal of the former.

For consistency the xl and libs/util code is also modified, but in this case
it is purely cosmetic.

NOTE: Some of the more gross formatting errors (such as lack of spaces after
      keywords) that came into context have been fixed in libxl_pci.c.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v5:
 - Minor cosmetic fix
---
 tools/include/libxl.h             |  17 +-
 tools/libs/light/libxl_create.c   |   6 +-
 tools/libs/light/libxl_dm.c       |  18 +-
 tools/libs/light/libxl_internal.h |  45 ++-
 tools/libs/light/libxl_pci.c      | 582 +++++++++++++++---------------
 tools/libs/light/libxl_types.idl  |   2 +-
 tools/libs/util/libxlu_pci.c      |  36 +-
 tools/xl/xl_parse.c               |  26 +-
 tools/xl/xl_pci.c                 |  68 ++--
 tools/xl/xl_sxp.c                 |  12 +-
 10 files changed, 408 insertions(+), 404 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 1ea5b4f446e8..fbe4c81ba511 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -444,6 +444,13 @@
  */
 #define LIBXL_HAVE_DISK_SAFE_REMOVE 1
 
+/*
+ * LIBXL_HAVE_CONFIG_PCIS indicates that the 'pcidevs' and 'num_pcidevs'
+ * fields in libxl_domain_config have been renamed to 'pcis' and 'num_pcis'
+ * respectively.
+ */
+#define LIBXL_HAVE_CONFIG_PCIS 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2300,15 +2307,15 @@ int libxl_device_pvcallsif_destroy(libxl_ctx *ctx, uint32_t domid,
 
 /* PCI Passthrough */
 int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
-                         libxl_device_pci *pcidev,
+                         libxl_device_pci *pci,
                          const libxl_asyncop_how *ao_how)
                          LIBXL_EXTERNAL_CALLERS_ONLY;
 int libxl_device_pci_remove(libxl_ctx *ctx, uint32_t domid,
-                            libxl_device_pci *pcidev,
+                            libxl_device_pci *pci,
                             const libxl_asyncop_how *ao_how)
                             LIBXL_EXTERNAL_CALLERS_ONLY;
 int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
-                             libxl_device_pci *pcidev,
+                             libxl_device_pci *pci,
                              const libxl_asyncop_how *ao_how)
                              LIBXL_EXTERNAL_CALLERS_ONLY;
 
@@ -2352,8 +2359,8 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  * added or is not bound, the functions will emit a warning but return
  * SUCCESS.
  */
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pcidev, int rebind);
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pcidev, int rebind);
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
 
 /* CPUID handling */
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 321a13e519b5..1f5052c52033 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1100,7 +1100,7 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         goto error_out;
     }
 
-    bool need_pt = d_config->num_pcidevs || d_config->num_dtdevs;
+    bool need_pt = d_config->num_pcis || d_config->num_dtdevs;
     if (c_info->passthrough == LIBXL_PASSTHROUGH_DEFAULT) {
         c_info->passthrough = need_pt
             ? LIBXL_PASSTHROUGH_ENABLED : LIBXL_PASSTHROUGH_DISABLED;
@@ -1141,7 +1141,7 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
      * assignment when PoD is enabled.
      */
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
-        d_config->num_pcidevs && pod_enabled) {
+        d_config->num_pcis && pod_enabled) {
         ret = ERROR_INVAL;
         LOGD(ERROR, domid,
              "PCI device assignment for HVM guest failed due to PoD enabled");
@@ -1817,7 +1817,7 @@ const libxl__device_type *device_type_tbl[] = {
     &libxl__vtpm_devtype,
     &libxl__usbctrl_devtype,
     &libxl__usbdev_devtype,
-    &libxl__pcidev_devtype,
+    &libxl__pci_devtype,
     &libxl__dtdev_devtype,
     &libxl__vdispl_devtype,
     &libxl__vsnd_devtype,
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 3da83259c08e..8ebe1b60c9d7 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -442,7 +442,7 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
 
     /* Might not expose rdm. */
     if (strategy == LIBXL_RDM_RESERVE_STRATEGY_IGNORE &&
-        !d_config->num_pcidevs)
+        !d_config->num_pcis)
         return 0;
 
     /* Query all RDM entries in this platform */
@@ -469,13 +469,13 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
     }
 
     /* Query RDM entries per-device */
-    for (i = 0; i < d_config->num_pcidevs; i++) {
+    for (i = 0; i < d_config->num_pcis; i++) {
         unsigned int n, nr_entries;
 
-        seg = d_config->pcidevs[i].domain;
-        bus = d_config->pcidevs[i].bus;
-        devfn = PCI_DEVFN(d_config->pcidevs[i].dev,
-                          d_config->pcidevs[i].func);
+        seg = d_config->pcis[i].domain;
+        bus = d_config->pcis[i].bus;
+        devfn = PCI_DEVFN(d_config->pcis[i].dev,
+                          d_config->pcis[i].func);
         nr_entries = 0;
         rc = libxl__xc_device_get_rdm(gc, 0,
                                       seg, bus, devfn, &nr_entries, &xrdm);
@@ -488,7 +488,7 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
         assert(xrdm);
 
         rc = libxl__device_pci_setdefault(gc, DOMID_INVALID,
-                                          &d_config->pcidevs[i], false);
+                                          &d_config->pcis[i], false);
         if (rc)
             goto out;
 
@@ -516,7 +516,7 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
                      * global policy in this case.
                      */
                     d_config->rdms[j].policy
-                        = d_config->pcidevs[i].rdm_policy;
+                        = d_config->pcis[i].rdm_policy;
                     new = false;
                     break;
                 }
@@ -526,7 +526,7 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
                 add_rdm_entry(gc, d_config,
                               pfn_to_paddr(xrdm[n].start_pfn),
                               pfn_to_paddr(xrdm[n].nr_pages),
-                              d_config->pcidevs[i].rdm_policy);
+                              d_config->pcis[i].rdm_policy);
         }
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index e26cda9b5045..3e70ff639b3c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1709,7 +1709,7 @@ _hidden int libxl__pci_topology_init(libxl__gc *gc,
 /* from libxl_pci */
 
 _hidden void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
-                                   libxl_device_pci *pcidev, bool starting,
+                                   libxl_device_pci *pci, bool starting,
                                    libxl__ao_device *aodev);
 _hidden void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
                                            libxl__multidev *);
@@ -3945,30 +3945,27 @@ struct libxl__device_type {
     device_set_xenstore_config_fn_t set_xenstore_config;
 };
 
-#define DEFINE_DEVICE_TYPE_STRUCT_X(name, sname, kind, ...)                    \
-    const libxl__device_type libxl__ ## name ## _devtype = {                   \
-        .type          = LIBXL__DEVICE_KIND_ ## kind,                       \
-        .ptr_offset    = offsetof(libxl_domain_config, name ## s),             \
-        .num_offset    = offsetof(libxl_domain_config, num_ ## name ## s),     \
-        .dev_elem_size = sizeof(libxl_device_ ## sname),                       \
-        .add           = libxl__add_ ## name ## s,                             \
-        .set_default   = (device_set_default_fn_t)                             \
-                         libxl__device_ ## sname ## _setdefault,               \
-        .to_device     = (device_to_device_fn_t)libxl__device_from_ ## name,   \
-        .init          = (device_init_fn_t)libxl_device_ ## sname ## _init,    \
-        .copy          = (device_copy_fn_t)libxl_device_ ## sname ## _copy,    \
-        .dispose       = (device_dispose_fn_t)                                 \
-                         libxl_device_ ## sname ## _dispose,                   \
-        .compare       = (device_compare_fn_t)                                 \
-                         libxl_device_ ## sname ## _compare,                   \
-        .update_devid  = (device_update_devid_fn_t)                            \
-                         libxl__device_ ## sname ## _update_devid,             \
-        __VA_ARGS__                                                            \
+#define DEFINE_DEVICE_TYPE_STRUCT(name, kind, ...)                           \
+    const libxl__device_type libxl__ ## name ## _devtype = {                 \
+        .type          = LIBXL__DEVICE_KIND_ ## kind,                        \
+        .ptr_offset    = offsetof(libxl_domain_config, name ## s),           \
+        .num_offset    = offsetof(libxl_domain_config, num_ ## name ## s),   \
+        .dev_elem_size = sizeof(libxl_device_ ## name),                      \
+        .add           = libxl__add_ ## name ## s,                           \
+        .set_default   = (device_set_default_fn_t)                           \
+                         libxl__device_ ## name ## _setdefault,              \
+        .to_device     = (device_to_device_fn_t)libxl__device_from_ ## name, \
+        .init          = (device_init_fn_t)libxl_device_ ## name ## _init,   \
+        .copy          = (device_copy_fn_t)libxl_device_ ## name ## _copy,   \
+        .dispose       = (device_dispose_fn_t)                               \
+                         libxl_device_ ## name ## _dispose,                  \
+        .compare       = (device_compare_fn_t)                               \
+                         libxl_device_ ## name ## _compare,                  \
+        .update_devid  = (device_update_devid_fn_t)                          \
+                         libxl__device_ ## name ## _update_devid,            \
+        __VA_ARGS__                                                          \
     }
 
-#define DEFINE_DEVICE_TYPE_STRUCT(name, kind, ...)                             \
-    DEFINE_DEVICE_TYPE_STRUCT_X(name, name, kind, __VA_ARGS__)
-
 static inline void **libxl__device_type_get_ptr(
     const libxl__device_type *dt, const libxl_domain_config *d_config)
 {
@@ -3995,7 +3992,7 @@ extern const libxl__device_type libxl__nic_devtype;
 extern const libxl__device_type libxl__vtpm_devtype;
 extern const libxl__device_type libxl__usbctrl_devtype;
 extern const libxl__device_type libxl__usbdev_devtype;
-extern const libxl__device_type libxl__pcidev_devtype;
+extern const libxl__device_type libxl__pci_devtype;
 extern const libxl__device_type libxl__vdispl_devtype;
 extern const libxl__device_type libxl__p9_devtype;
 extern const libxl__device_type libxl__pvcallsif_devtype;
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index bc5843b13701..8c30642252f5 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -25,51 +25,51 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
-static unsigned int pcidev_encode_bdf(libxl_device_pci *pcidev)
+static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
 
-    value = pcidev->domain << 16;
-    value |= (pcidev->bus & 0xff) << 8;
-    value |= (pcidev->dev & 0x1f) << 3;
-    value |= (pcidev->func & 0x7);
+    value = pci->domain << 16;
+    value |= (pci->bus & 0xff) << 8;
+    value |= (pci->dev & 0x1f) << 3;
+    value |= (pci->func & 0x7);
 
     return value;
 }
 
-static void pcidev_struct_fill(libxl_device_pci *pcidev, unsigned int domain,
-                               unsigned int bus, unsigned int dev,
-                               unsigned int func, unsigned int vdevfn)
+static void pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
+                            unsigned int bus, unsigned int dev,
+                            unsigned int func, unsigned int vdevfn)
 {
-    pcidev->domain = domain;
-    pcidev->bus = bus;
-    pcidev->dev = dev;
-    pcidev->func = func;
-    pcidev->vdevfn = vdevfn;
+    pci->domain = domain;
+    pci->bus = bus;
+    pci->dev = dev;
+    pci->func = func;
+    pci->vdevfn = vdevfn;
 }
 
 static void libxl_create_pci_backend_device(libxl__gc *gc,
                                             flexarray_t *back,
                                             int num,
-                                            const libxl_device_pci *pcidev)
+                                            const libxl_device_pci *pci)
 {
     flexarray_append(back, GCSPRINTF("key-%d", num));
-    flexarray_append(back, GCSPRINTF(PCI_BDF, pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func));
+    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func));
     flexarray_append(back, GCSPRINTF("dev-%d", num));
-    flexarray_append(back, GCSPRINTF(PCI_BDF, pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func));
-    if (pcidev->vdevfn)
-        flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pcidev->vdevfn));
+    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func));
+    if (pci->vdevfn)
+        flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pci->vdevfn));
     flexarray_append(back, GCSPRINTF("opts-%d", num));
     flexarray_append(back,
               GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d",
-                             pcidev->msitranslate, pcidev->power_mgmt,
-                             pcidev->permissive));
+                             pci->msitranslate, pci->power_mgmt,
+                             pci->permissive));
     flexarray_append_pair(back, GCSPRINTF("state-%d", num), GCSPRINTF("%d", XenbusStateInitialising));
 }
 
-static void libxl__device_from_pcidev(libxl__gc *gc, uint32_t domid,
-                                      const libxl_device_pci *pcidev,
-                                      libxl__device *device)
+static void libxl__device_from_pci(libxl__gc *gc, uint32_t domid,
+                                   const libxl_device_pci *pci,
+                                   libxl__device *device)
 {
     device->backend_devid = 0;
     device->backend_domid = 0;
@@ -80,7 +80,7 @@ static void libxl__device_from_pcidev(libxl__gc *gc, uint32_t domid,
 }
 
 static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
-                                     const libxl_device_pci *pcidev,
+                                     const libxl_device_pci *pci,
                                      int num)
 {
     flexarray_t *front = NULL;
@@ -94,15 +94,15 @@ static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
     LOGD(DEBUG, domid, "Creating pci backend");
 
     /* add pci device */
-    libxl__device_from_pcidev(gc, domid, pcidev, &device);
+    libxl__device_from_pci(gc, domid, pci, &device);
 
     flexarray_append_pair(back, "frontend-id", GCSPRINTF("%d", domid));
     flexarray_append_pair(back, "online", "1");
     flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateInitialising));
     flexarray_append_pair(back, "domain", libxl__domid_to_name(gc, domid));
 
-    for (i = 0; i < num; i++, pcidev++)
-        libxl_create_pci_backend_device(gc, back, i, pcidev);
+    for (i = 0; i < num; i++, pci++)
+        libxl_create_pci_backend_device(gc, back, i, pci);
 
     flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num));
     flexarray_append_pair(front, "backend-id", GCSPRINTF("%d", 0));
@@ -116,7 +116,7 @@ static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
 
 static int libxl__device_pci_add_xenstore(libxl__gc *gc,
                                           uint32_t domid,
-                                          const libxl_device_pci *pcidev,
+                                          const libxl_device_pci *pci,
                                           bool starting)
 {
     flexarray_t *back;
@@ -136,7 +136,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
                                                 LIBXL__DEVICE_KIND_PCI);
     num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
     if (!num_devs)
-        return libxl__create_pci_backend(gc, domid, pcidev, 1);
+        return libxl__create_pci_backend(gc, domid, pci, 1);
 
     libxl_domain_type domtype = libxl__domain_type(gc, domid);
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
@@ -151,7 +151,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
 
     LOGD(DEBUG, domid, "Adding new pci device to xenstore");
     num = atoi(num_devs);
-    libxl_create_pci_backend_device(gc, back, num, pcidev);
+    libxl_create_pci_backend_device(gc, back, num, pci);
     flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num + 1));
     if (!starting)
         flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateReconfiguring));
@@ -170,8 +170,8 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
         rc = libxl__get_domain_configuration(gc, domid, &d_config);
         if (rc) goto out;
 
-        device_add_domain_config(gc, &d_config, &libxl__pcidev_devtype,
-                                 pcidev);
+        device_add_domain_config(gc, &d_config, &libxl__pci_devtype,
+                                 pci);
 
         rc = libxl__dm_check_start(gc, &d_config, domid);
         if (rc) goto out;
@@ -201,7 +201,7 @@ out:
     return rc;
 }
 
-static int libxl__device_pci_remove_xenstore(libxl__gc *gc, uint32_t domid, libxl_device_pci *pcidev)
+static int libxl__device_pci_remove_xenstore(libxl__gc *gc, uint32_t domid, libxl_device_pci *pci)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     char *be_path, *num_devs_path, *num_devs, *xsdev, *tmp, *tmppath;
@@ -231,8 +231,8 @@ static int libxl__device_pci_remove_xenstore(libxl__gc *gc, uint32_t domid, libx
         unsigned int domain = 0, bus = 0, dev = 0, func = 0;
         xsdev = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/dev-%d", be_path, i));
         sscanf(xsdev, PCI_BDF, &domain, &bus, &dev, &func);
-        if (domain == pcidev->domain && bus == pcidev->bus &&
-            pcidev->dev == dev && pcidev->func == func) {
+        if (domain == pci->domain && bus == pci->bus &&
+            pci->dev == dev && pci->func == func) {
             break;
         }
     }
@@ -350,7 +350,7 @@ static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int
                     *list = realloc(*list, sizeof(libxl_device_pci) * ((*num) + 1));
                     if (*list == NULL)
                         return ERROR_NOMEM;
-                    pcidev_struct_fill(*list + *num, dom, bus, dev, func, 0);
+                    pci_struct_fill(*list + *num, dom, bus, dev, func, 0);
                     (*num)++;
                 }
             }
@@ -361,8 +361,8 @@ static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int
     return 0;
 }
 
-static int is_pcidev_in_array(libxl_device_pci *assigned, int num_assigned,
-                       int dom, int bus, int dev, int func)
+static int is_pci_in_array(libxl_device_pci *assigned, int num_assigned,
+                           int dom, int bus, int dev, int func)
 {
     int i;
 
@@ -383,7 +383,7 @@ static int is_pcidev_in_array(libxl_device_pci *assigned, int num_assigned,
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
 static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
-                           libxl_device_pci *pcidev)
+                           libxl_device_pci *pci)
 {
     int rc, fd;
     char *buf;
@@ -394,8 +394,8 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
         return ERROR_FAIL;
     }
 
-    buf = GCSPRINTF(PCI_BDF, pcidev->domain, pcidev->bus,
-                    pcidev->dev, pcidev->func);
+    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus,
+                    pci->dev, pci->func);
     rc = write(fd, buf, strlen(buf));
     /* Annoying to have two if's, but we need the errno */
     if (rc < 0)
@@ -411,7 +411,7 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
-    libxl_device_pci *pcidevs = NULL, *new, *assigned;
+    libxl_device_pci *pcis = NULL, *new, *assigned;
     struct dirent *de;
     DIR *dir;
     int r, num_assigned;
@@ -436,40 +436,40 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
-        if (is_pcidev_in_array(assigned, num_assigned, dom, bus, dev, func))
+        if (is_pci_in_array(assigned, num_assigned, dom, bus, dev, func))
             continue;
 
-        new = realloc(pcidevs, ((*num) + 1) * sizeof(*new));
+        new = realloc(pcis, ((*num) + 1) * sizeof(*new));
         if (NULL == new)
             continue;
 
-        pcidevs = new;
-        new = pcidevs + *num;
+        pcis = new;
+        new = pcis + *num;
 
         memset(new, 0, sizeof(*new));
-        pcidev_struct_fill(new, dom, bus, dev, func, 0);
+        pci_struct_fill(new, dom, bus, dev, func, 0);
         (*num)++;
     }
 
     closedir(dir);
 out:
     GC_FREE;
-    return pcidevs;
+    return pcis;
 }
 
 /* Unbind device from its current driver, if any.  If driver_path is non-NULL,
  * store the path to the original driver in it. */
-static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pcidev,
+static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
                             char **driver_path)
 {
     char * spath, *dp = NULL;
     struct stat st;
 
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pcidev->domain,
-                           pcidev->bus,
-                           pcidev->dev,
-                           pcidev->func);
+                           pci->domain,
+                           pci->bus,
+                           pci->dev,
+                           pci->func);
     if ( !lstat(spath, &st) ) {
         /* Find the canonical path to the driver. */
         dp = libxl__zalloc(gc, PATH_MAX);
@@ -483,7 +483,7 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pcidev,
 
         /* Unbind from the old driver */
         spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pcidev) < 0 ) {
+        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
             LOGE(ERROR, "Couldn't unbind device");
             return -1;
         }
@@ -495,11 +495,11 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pcidev,
     return 0;
 }
 
-static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pcidev)
+static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_vendor_path =
             GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/vendor",
-                      pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+                      pci->domain, pci->bus, pci->dev, pci->func);
     uint16_t read_items;
     uint16_t pci_device_vendor;
 
@@ -507,7 +507,7 @@ static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pcidev)
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have vendor attribute",
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         return 0xffff;
     }
     read_items = fscanf(f, "0x%hx\n", &pci_device_vendor);
@@ -515,18 +515,18 @@ static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pcidev)
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read vendor of pci device "PCI_BDF,
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         return 0xffff;
     }
 
     return pci_device_vendor;
 }
 
-static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pcidev)
+static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_device_path =
             GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/device",
-                      pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+                      pci->domain, pci->bus, pci->dev, pci->func);
     uint16_t read_items;
     uint16_t pci_device_device;
 
@@ -534,7 +534,7 @@ static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pcidev)
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have device attribute",
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         return 0xffff;
     }
     read_items = fscanf(f, "0x%hx\n", &pci_device_device);
@@ -542,25 +542,25 @@ static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pcidev)
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read device of pci device "PCI_BDF,
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         return 0xffff;
     }
 
     return pci_device_device;
 }
 
-static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pcidev,
+static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pci,
                                unsigned long *class)
 {
     char *pci_device_class_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/class",
-                     pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+                     pci->domain, pci->bus, pci->dev, pci->func);
     int read_items, ret = 0;
 
     FILE *f = fopen(pci_device_class_path, "r");
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have class attribute",
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         ret = ERROR_FAIL;
         goto out;
     }
@@ -569,7 +569,7 @@ static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pcidev,
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read class of pci device "PCI_BDF,
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         ret = ERROR_FAIL;
     }
 
@@ -588,16 +588,16 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
     uint16_t pt_vendor, pt_device;
     unsigned long class;
 
-    for (i = 0 ; i < d_config->num_pcidevs ; i++) {
-        libxl_device_pci *pcidev = &d_config->pcidevs[i];
-        pt_vendor = sysfs_dev_get_vendor(gc, pcidev);
-        pt_device = sysfs_dev_get_device(gc, pcidev);
+    for (i = 0 ; i < d_config->num_pcis ; i++) {
+        libxl_device_pci *pci = &d_config->pcis[i];
+        pt_vendor = sysfs_dev_get_vendor(gc, pci);
+        pt_device = sysfs_dev_get_device(gc, pci);
 
         if (pt_vendor == 0xffff || pt_device == 0xffff ||
             pt_vendor != 0x8086)
             continue;
 
-        if (sysfs_dev_get_class(gc, pcidev, &class))
+        if (sysfs_dev_get_class(gc, pci, &class))
             continue;
         if (class == 0x030000)
             return true;
@@ -621,8 +621,8 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
  * already exist.
  */
 
-/* Scan through /sys/.../pciback/slots looking for pcidev's BDF */
-static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pcidev)
+/* Scan through /sys/.../pciback/slots looking for pci's BDF */
+static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
 {
     FILE *f;
     int rc = 0;
@@ -635,11 +635,11 @@ static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pcidev)
         return ERROR_FAIL;
     }
 
-    while(fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func)==4) {
-        if(dom == pcidev->domain
-           && bus == pcidev->bus
-           && dev == pcidev->dev
-           && func == pcidev->func) {
+    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func) == 4) {
+        if (dom == pci->domain
+            && bus == pci->bus
+            && dev == pci->dev
+            && func == pci->func) {
             rc = 1;
             goto out;
         }
@@ -649,7 +649,7 @@ out:
     return rc;
 }
 
-static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
+static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
     char * spath;
     int rc;
@@ -665,8 +665,8 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
     }
 
     spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pcidev->domain, pcidev->bus,
-                      pcidev->dev, pcidev->func);
+                      pci->domain, pci->bus,
+                      pci->dev, pci->func);
     rc = lstat(spath, &st);
 
     if( rc == 0 )
@@ -677,40 +677,40 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
     return -1;
 }
 
-static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pcidev)
+static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pci)
 {
     int rc;
 
-    if ( (rc=pciback_dev_has_slot(gc, pcidev)) < 0 ) {
+    if ( (rc = pciback_dev_has_slot(gc, pci)) < 0 ) {
         LOGE(ERROR, "Error checking for pciback slot");
         return ERROR_FAIL;
     } else if (rc == 0) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
-                             pcidev) < 0 ) {
+                             pci) < 0 ) {
             LOGE(ERROR, "Couldn't bind device to pciback!");
             return ERROR_FAIL;
         }
     }
 
-    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pcidev) < 0 ) {
+    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pci) < 0 ) {
         LOGE(ERROR, "Couldn't bind device to pciback!");
         return ERROR_FAIL;
     }
     return 0;
 }
 
-static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
+static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
 {
     /* Remove from pciback */
-    if ( sysfs_dev_unbind(gc, pcidev, NULL) < 0 ) {
+    if ( sysfs_dev_unbind(gc, pci, NULL) < 0 ) {
         LOG(ERROR, "Couldn't unbind device!");
         return ERROR_FAIL;
     }
 
     /* Remove slot if necessary */
-    if ( pciback_dev_has_slot(gc, pcidev) > 0 ) {
+    if ( pciback_dev_has_slot(gc, pci) > 0 ) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
-                             pcidev) < 0 ) {
+                             pci) < 0 ) {
             LOGE(ERROR, "Couldn't remove pciback slot");
             return ERROR_FAIL;
         }
@@ -721,49 +721,49 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
 #define PCIBACK_INFO_PATH "/libxl/pciback"
 
 static void pci_assignable_driver_path_write(libxl__gc *gc,
-                                            libxl_device_pci *pcidev,
+                                            libxl_device_pci *pci,
                                             char *driver_path)
 {
     char *path;
 
     path = GCSPRINTF(PCIBACK_INFO_PATH"/"PCI_BDF_XSPATH"/driver_path",
-                     pcidev->domain,
-                     pcidev->bus,
-                     pcidev->dev,
-                     pcidev->func);
+                     pci->domain,
+                     pci->bus,
+                     pci->dev,
+                     pci->func);
     if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", driver_path) < 0 ) {
         LOGE(WARN, "Write of %s to node %s failed.", driver_path, path);
     }
 }
 
 static char * pci_assignable_driver_path_read(libxl__gc *gc,
-                                              libxl_device_pci *pcidev)
+                                              libxl_device_pci *pci)
 {
     return libxl__xs_read(gc, XBT_NULL,
                           GCSPRINTF(
                            PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH "/driver_path",
-                           pcidev->domain,
-                           pcidev->bus,
-                           pcidev->dev,
-                           pcidev->func));
+                           pci->domain,
+                           pci->bus,
+                           pci->dev,
+                           pci->func));
 }
 
 static void pci_assignable_driver_path_remove(libxl__gc *gc,
-                                              libxl_device_pci *pcidev)
+                                              libxl_device_pci *pci)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
 
     /* Remove the xenstore entry */
     xs_rm(ctx->xsh, XBT_NULL,
           GCSPRINTF(PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH,
-                    pcidev->domain,
-                    pcidev->bus,
-                    pcidev->dev,
-                    pcidev->func) );
+                    pci->domain,
+                    pci->bus,
+                    pci->dev,
+                    pci->func) );
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
-                                            libxl_device_pci *pcidev,
+                                            libxl_device_pci *pci,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -773,10 +773,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     struct stat st;
 
     /* Local copy for convenience */
-    dom = pcidev->domain;
-    bus = pcidev->bus;
-    dev = pcidev->dev;
-    func = pcidev->func;
+    dom = pci->domain;
+    bus = pci->bus;
+    dev = pci->dev;
+    func = pci->func;
 
     /* See if the device exists */
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
@@ -786,7 +786,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pcidev);
+    rc = pciback_dev_is_assigned(gc, pci);
     if ( rc < 0 ) {
         return ERROR_FAIL;
     }
@@ -796,7 +796,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
-    if ( sysfs_dev_unbind(gc, pcidev, &driver_path ) ) {
+    if ( sysfs_dev_unbind(gc, pci, &driver_path ) ) {
         LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
             dom, bus, dev, func);
         return ERROR_FAIL;
@@ -805,9 +805,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     /* Store driver_path for rebinding to dom0 */
     if ( rebind ) {
         if ( driver_path ) {
-            pci_assignable_driver_path_write(gc, pcidev, driver_path);
+            pci_assignable_driver_path_write(gc, pci, driver_path);
         } else if ( (driver_path =
-                     pci_assignable_driver_path_read(gc, pcidev)) != NULL ) {
+                     pci_assignable_driver_path_read(gc, pci)) != NULL ) {
             LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
                 dom, bus, dev, func, driver_path);
         } else {
@@ -815,10 +815,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                 dom, bus, dev, func);
         }
     } else {
-        pci_assignable_driver_path_remove(gc, pcidev);
+        pci_assignable_driver_path_remove(gc, pci);
     }
 
-    if ( pciback_dev_assign(gc, pcidev) ) {
+    if ( pciback_dev_assign(gc, pci) ) {
         LOG(ERROR, "Couldn't bind device to pciback!");
         return ERROR_FAIL;
     }
@@ -829,7 +829,7 @@ quarantine:
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
      * unnecessarily denied.
      */
-    rc = xc_assign_device(ctx->xch, DOMID_IO, pcidev_encode_bdf(pcidev),
+    rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
                           XEN_DOMCTL_DEV_RDM_RELAXED);
     if ( rc < 0 ) {
         LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
@@ -840,7 +840,7 @@ quarantine:
 }
 
 static int libxl__device_pci_assignable_remove(libxl__gc *gc,
-                                               libxl_device_pci *pcidev,
+                                               libxl_device_pci *pci,
                                                int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -848,24 +848,24 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     char *driver_path;
 
     /* De-quarantine */
-    rc = xc_deassign_device(ctx->xch, DOMID_IO, pcidev_encode_bdf(pcidev));
+    rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
     if ( rc < 0 ) {
-        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pcidev->domain, pcidev->bus,
-            pcidev->dev, pcidev->func);
+        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pci->domain, pci->bus,
+            pci->dev, pci->func);
         return ERROR_FAIL;
     }
 
     /* Unbind from pciback */
-    if ( (rc=pciback_dev_is_assigned(gc, pcidev)) < 0 ) {
+    if ( (rc = pciback_dev_is_assigned(gc, pci)) < 0 ) {
         return ERROR_FAIL;
     } else if ( rc ) {
-        pciback_dev_unassign(gc, pcidev);
+        pciback_dev_unassign(gc, pci);
     } else {
         LOG(WARN, "Not bound to pciback");
     }
 
     /* Rebind if necessary */
-    driver_path = pci_assignable_driver_path_read(gc, pcidev);
+    driver_path = pci_assignable_driver_path_read(gc, pci);
 
     if ( driver_path ) {
         if ( rebind ) {
@@ -873,12 +873,12 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
 
             if ( sysfs_write_bdf(gc,
                                  GCSPRINTF("%s/bind", driver_path),
-                                 pcidev) < 0 ) {
+                                 pci) < 0 ) {
                 LOGE(ERROR, "Couldn't bind device to %s", driver_path);
                 return -1;
             }
 
-            pci_assignable_driver_path_remove(gc, pcidev);
+            pci_assignable_driver_path_remove(gc, pci);
         }
     } else {
         if ( rebind ) {
@@ -890,26 +890,26 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     return 0;
 }
 
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pcidev,
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
                                     int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_add(gc, pcidev, rebind);
+    rc = libxl__device_pci_assignable_add(gc, pci, rebind);
 
     GC_FREE;
     return rc;
 }
 
 
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pcidev,
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
                                        int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_remove(gc, pcidev, rebind);
+    rc = libxl__device_pci_assignable_remove(gc, pci, rebind);
 
     GC_FREE;
     return rc;
@@ -920,7 +920,7 @@ int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pcidev,
  * driver. It also initialises a bit-mask of which function numbers are present
  * on that device.
 */
-static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pcidev, unsigned int *func_mask)
+static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pci, unsigned int *func_mask)
 {
     struct dirent *de;
     DIR *dir;
@@ -940,11 +940,11 @@ static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pcidev, unsi
 
         if ( sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4 )
             continue;
-        if ( pcidev->domain != dom )
+        if ( pci->domain != dom )
             continue;
-        if ( pcidev->bus != bus )
+        if ( pci->bus != bus )
             continue;
-        if ( pcidev->dev != dev )
+        if ( pci->dev != dev )
             continue;
 
         path = GCSPRINTF("%s/" PCI_BDF, SYSFS_PCIBACK_DRIVER, dom, bus, dev, func);
@@ -979,7 +979,7 @@ static int pci_ins_check(libxl__gc *gc, uint32_t domid, const char *state, void
 }
 
 static int qemu_pci_add_xenstore(libxl__gc *gc, uint32_t domid,
-                                 libxl_device_pci *pcidev)
+                                 libxl_device_pci *pci)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     int rc = 0;
@@ -991,15 +991,15 @@ static int qemu_pci_add_xenstore(libxl__gc *gc, uint32_t domid,
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     state = libxl__xs_read(gc, XBT_NULL, path);
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    if (pcidev->vdevfn) {
+    if (pci->vdevfn) {
         libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF_VDEVFN","PCI_OPTIONS,
-                         pcidev->domain, pcidev->bus, pcidev->dev,
-                         pcidev->func, pcidev->vdevfn, pcidev->msitranslate,
-                         pcidev->power_mgmt);
+                         pci->domain, pci->bus, pci->dev,
+                         pci->func, pci->vdevfn, pci->msitranslate,
+                         pci->power_mgmt);
     } else {
         libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF","PCI_OPTIONS,
-                         pcidev->domain,  pcidev->bus, pcidev->dev,
-                         pcidev->func, pcidev->msitranslate, pcidev->power_mgmt);
+                         pci->domain,  pci->bus, pci->dev,
+                         pci->func, pci->msitranslate, pci->power_mgmt);
     }
 
     libxl__qemu_traditional_cmd(gc, domid, "pci-ins");
@@ -1010,7 +1010,7 @@ static int qemu_pci_add_xenstore(libxl__gc *gc, uint32_t domid,
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     if ( rc < 0 )
         LOGD(ERROR, domid, "qemu refused to add device: %s", vdevfn);
-    else if ( sscanf(vdevfn, "0x%x", &pcidev->vdevfn) != 1 ) {
+    else if ( sscanf(vdevfn, "0x%x", &pci->vdevfn) != 1 ) {
         LOGD(ERROR, domid, "wrong format for the vdevfn: '%s'", vdevfn);
         rc = -1;
     }
@@ -1054,7 +1054,7 @@ typedef struct pci_add_state {
     libxl__xswait_state xswait;
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
-    libxl_device_pci *pcidev;
+    libxl_device_pci *pci;
     int pci_domid;
 } pci_add_state;
 
@@ -1072,7 +1072,7 @@ static void pci_add_dm_done(libxl__egc *,
 
 static void do_pci_add(libxl__egc *egc,
                        libxl_domid domid,
-                       libxl_device_pci *pcidev,
+                       libxl_device_pci *pci,
                        pci_add_state *pas)
 {
     STATE_AO_GC(pas->aodev->ao);
@@ -1082,7 +1082,7 @@ static void do_pci_add(libxl__egc *egc,
     /* init pci_add_state */
     libxl__xswait_init(&pas->xswait);
     libxl__ev_qmp_init(&pas->qmp);
-    pas->pcidev = pcidev;
+    pas->pci = pci;
     pas->pci_domid = domid;
     libxl__ev_time_init(&pas->timeout);
 
@@ -1128,7 +1128,7 @@ static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pcidev = pas->pcidev;
+    libxl_device_pci *pci = pas->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1136,7 +1136,7 @@ static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
     if (rc)
         goto out;
 
-    rc = qemu_pci_add_xenstore(gc, domid, pcidev);
+    rc = qemu_pci_add_xenstore(gc, domid, pci);
 out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
@@ -1149,7 +1149,7 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pcidev = pas->pcidev;
+    libxl_device_pci *pci = pas->pci;
     libxl__ev_qmp *const qmp = &pas->qmp;
 
     rc = libxl__ev_time_register_rel(ao, &pas->timeout,
@@ -1160,14 +1160,14 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
-                           pcidev->bus, pcidev->dev, pcidev->func);
+                           pci->bus, pci->dev, pci->func);
     QMP_PARAMETERS_SPRINTF(&args, "hostaddr",
-                           "%04x:%02x:%02x.%01x", pcidev->domain,
-                           pcidev->bus, pcidev->dev, pcidev->func);
-    if (pcidev->vdevfn) {
+                           "%04x:%02x:%02x.%01x", pci->domain,
+                           pci->bus, pci->dev, pci->func);
+    if (pci->vdevfn) {
         QMP_PARAMETERS_SPRINTF(&args, "addr", "%x.%x",
-                               PCI_SLOT(pcidev->vdevfn),
-                               PCI_FUNC(pcidev->vdevfn));
+                               PCI_SLOT(pci->vdevfn),
+                               PCI_FUNC(pci->vdevfn));
     }
     /*
      * Version of QEMU prior to the XSA-131 fix did not support
@@ -1179,7 +1179,7 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
      * set the permissive flag if it is true. Users of older QEMU
      * have no reason to set the flag so this is ok.
      */
-    if (pcidev->permissive)
+    if (pci->permissive)
         libxl__qmp_param_add_bool(gc, &args, "permissive", true);
 
     qmp->ao = pas->aodev->ao;
@@ -1230,7 +1230,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
     int dev_slot, dev_func;
 
     /* Convenience aliases */
-    libxl_device_pci *pcidev = pas->pcidev;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) goto out;
 
@@ -1251,7 +1251,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
      */
 
     asked_id = GCSPRINTF(PCI_PT_QDEV_ID,
-                         pcidev->bus, pcidev->dev, pcidev->func);
+                         pci->bus, pci->dev, pci->func);
 
     for (i = 0; (bus = libxl__json_array_get(response, i)); i++) {
         devices = libxl__json_map_get("devices", bus, JSON_ARRAY);
@@ -1283,7 +1283,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
              }
              dev_func = libxl__json_object_get_integer(o);
 
-             pcidev->vdevfn = PCI_DEVFN(dev_slot, dev_func);
+             pci->vdevfn = PCI_DEVFN(dev_slot, dev_func);
 
              rc = 0;
              goto out;
@@ -1331,7 +1331,7 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     /* Convenience aliases */
     bool starting = pas->starting;
-    libxl_device_pci *pcidev = pas->pcidev;
+    libxl_device_pci *pci = pas->pci;
     bool hvm = libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM;
 
     libxl__ev_qmp_dispose(gc, &pas->qmp);
@@ -1342,8 +1342,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     if (isstubdom)
         starting = false;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pcidev->domain,
-                           pcidev->bus, pcidev->dev, pcidev->func);
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
+                           pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
     start = end = flags = size = 0;
     irq = 0;
@@ -1383,8 +1383,8 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
     fclose(f);
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pcidev->domain,
-                                pcidev->bus, pcidev->dev, pcidev->func);
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                                pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -1411,9 +1411,9 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
 
     /* Don't restrict writes to the PCI config space from this VM */
-    if (pcidev->permissive) {
+    if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pcidev) < 0 ) {
+                             pci) < 0 ) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
@@ -1422,14 +1422,14 @@ static void pci_add_dm_done(libxl__egc *egc,
 
 out_no_irq:
     if (!isstubdom) {
-        if (pcidev->rdm_policy == LIBXL_RDM_RESERVE_POLICY_STRICT) {
+        if (pci->rdm_policy == LIBXL_RDM_RESERVE_POLICY_STRICT) {
             flag &= ~XEN_DOMCTL_DEV_RDM_RELAXED;
-        } else if (pcidev->rdm_policy != LIBXL_RDM_RESERVE_POLICY_RELAXED) {
+        } else if (pci->rdm_policy != LIBXL_RDM_RESERVE_POLICY_RELAXED) {
             LOGED(ERROR, domainid, "unknown rdm check flag.");
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_assign_device(ctx->xch, domid, pcidev_encode_bdf(pcidev), flag);
+        r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), flag);
         if (r < 0 && (hvm || errno != ENOSYS)) {
             LOGED(ERROR, domainid, "xc_assign_device failed");
             rc = ERROR_FAIL;
@@ -1438,7 +1438,7 @@ out_no_irq:
     }
 
     if (!starting && !libxl_get_stubdom_id(CTX, domid))
-        rc = libxl__device_pci_add_xenstore(gc, domid, pcidev, starting);
+        rc = libxl__device_pci_add_xenstore(gc, domid, pci, starting);
     else
         rc = 0;
 out:
@@ -1493,7 +1493,7 @@ int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
 }
 
 int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
-                         libxl_device_pci *pcidev,
+                         libxl_device_pci *pci,
                          const libxl_asyncop_how *ao_how)
 {
     AO_CREATE(ctx, domid, ao_how);
@@ -1504,24 +1504,24 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     aodev->action = LIBXL__DEVICE_ACTION_ADD;
     aodev->callback = device_addrm_aocomplete;
     aodev->update_json = true;
-    libxl__device_pci_add(egc, domid, pcidev, false, aodev);
+    libxl__device_pci_add(egc, domid, pci, false, aodev);
     return AO_INPROGRESS;
 }
 
-static int libxl_pcidev_assignable(libxl_ctx *ctx, libxl_device_pci *pcidev)
+static int libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
 {
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_assignable_list(ctx, &num);
+    pcis = libxl_device_pci_assignable_list(ctx, &num);
     for (i = 0; i < num; i++) {
-        if (pcidevs[i].domain == pcidev->domain &&
-            pcidevs[i].bus == pcidev->bus &&
-            pcidevs[i].dev == pcidev->dev &&
-            pcidevs[i].func == pcidev->func)
+        if (pcis[i].domain == pci->domain &&
+            pcis[i].bus == pci->bus &&
+            pcis[i].dev == pci->dev &&
+            pcis[i].func == pci->func)
             break;
     }
-    free(pcidevs);
+    free(pcis);
     return i != num;
 }
 
@@ -1535,7 +1535,7 @@ static void device_pci_add_done(libxl__egc *egc,
     pci_add_state *, int rc);
 
 void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
-                           libxl_device_pci *pcidev, bool starting,
+                           libxl_device_pci *pci, bool starting,
                            libxl__ao_device *aodev)
 {
     STATE_AO_GC(aodev->ao);
@@ -1545,9 +1545,9 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     int stubdomid = 0;
     pci_add_state *pas;
 
-    /* Store *pcidev to be used by callbacks */
-    aodev->device_config = pcidev;
-    aodev->device_type = &libxl__pcidev_devtype;
+    /* Store *pci to be used by callbacks */
+    aodev->device_config = pci;
+    aodev->device_type = &libxl__pci_devtype;
 
     GCNEW(pas);
     pas->aodev = aodev;
@@ -1556,29 +1556,29 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->callback = device_pci_add_stubdom_done;
 
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
-        rc = xc_test_assign_device(ctx->xch, domid, pcidev_encode_bdf(pcidev));
+        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
         if (rc) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
-                 pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
+                 pci->domain, pci->bus, pci->dev, pci->func,
                  errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
                  : "already assigned to a different guest");
             goto out;
         }
     }
 
-    rc = libxl__device_pci_setdefault(gc, domid, pcidev, !starting);
+    rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
     if (rc) goto out;
 
-    if (pcidev->seize && !pciback_dev_is_assigned(gc, pcidev)) {
-        rc = libxl__device_pci_assignable_add(gc, pcidev, 1);
+    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
+        rc = libxl__device_pci_assignable_add(gc, pci, 1);
         if ( rc )
             goto out;
     }
 
-    if (!libxl_pcidev_assignable(ctx, pcidev)) {
+    if (!libxl_pci_assignable(ctx, pci)) {
         LOGD(ERROR, domid, "PCI device %x:%x:%x.%x is not assignable",
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+             pci->domain, pci->bus, pci->dev, pci->func);
         rc = ERROR_FAIL;
         goto out;
     }
@@ -1589,25 +1589,25 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
              "cannot determine if device is assigned, refusing to continue");
         goto out;
     }
-    if ( is_pcidev_in_array(assigned, num_assigned, pcidev->domain,
-                     pcidev->bus, pcidev->dev, pcidev->func) ) {
+    if ( is_pci_in_array(assigned, num_assigned, pci->domain,
+                         pci->bus, pci->dev, pci->func) ) {
         LOGD(ERROR, domid, "PCI device already attached to a domain");
         rc = ERROR_FAIL;
         goto out;
     }
 
-    libxl__device_pci_reset(gc, pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+    libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
     if (stubdomid != 0) {
-        libxl_device_pci *pcidev_s;
+        libxl_device_pci *pci_s;
 
-        GCNEW(pcidev_s);
-        libxl_device_pci_init(pcidev_s);
-        libxl_device_pci_copy(CTX, pcidev_s, pcidev);
+        GCNEW(pci_s);
+        libxl_device_pci_init(pci_s);
+        libxl_device_pci_copy(CTX, pci_s, pci);
         pas->callback = device_pci_add_stubdom_wait;
 
-        do_pci_add(egc, stubdomid, pcidev_s, pas); /* must be last */
+        do_pci_add(egc, stubdomid, pci_s, pas); /* must be last */
         return;
     }
 
@@ -1664,42 +1664,42 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
     /* Convenience aliases */
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pcidev = aodev->device_config;
+    libxl_device_pci *pci = aodev->device_config;
 
     if (rc) goto out;
 
-    orig_vdev = pcidev->vdevfn & ~7U;
+    orig_vdev = pci->vdevfn & ~7U;
 
-    if ( pcidev->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
-        if ( !(pcidev->vdevfn >> 3) ) {
+    if ( pci->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
+        if ( !(pci->vdevfn >> 3) ) {
             LOGD(ERROR, domid, "Must specify a v-slot for multi-function devices");
             rc = ERROR_INVAL;
             goto out;
         }
-        if ( pci_multifunction_check(gc, pcidev, &pfunc_mask) ) {
+        if ( pci_multifunction_check(gc, pci, &pfunc_mask) ) {
             rc = ERROR_FAIL;
             goto out;
         }
-        pcidev->vfunc_mask &= pfunc_mask;
+        pci->vfunc_mask &= pfunc_mask;
         /* so now vfunc_mask == pfunc_mask */
     }else{
-        pfunc_mask = (1 << pcidev->func);
+        pfunc_mask = (1 << pci->func);
     }
 
-    for(rc = 0, i = 7; i >= 0; --i) {
+    for (rc = 0, i = 7; i >= 0; --i) {
         if ( (1 << i) & pfunc_mask ) {
-            if ( pcidev->vfunc_mask == pfunc_mask ) {
-                pcidev->func = i;
-                pcidev->vdevfn = orig_vdev | i;
-            }else{
+            if ( pci->vfunc_mask == pfunc_mask ) {
+                pci->func = i;
+                pci->vdevfn = orig_vdev | i;
+            } else {
                 /* if not passing through multiple devices in a block make
                  * sure that virtual function number 0 is always used otherwise
                  * guest won't see the device
                  */
-                pcidev->vdevfn = orig_vdev;
+                pci->vdevfn = orig_vdev;
             }
             pas->callback = device_pci_add_done;
-            do_pci_add(egc, domid, pcidev, pas); /* must be last */
+            do_pci_add(egc, domid, pci, pas); /* must be last */
             return;
         }
     }
@@ -1715,13 +1715,13 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pcidev = aodev->device_config;
+    libxl_device_pci *pci = aodev->device_config;
 
     if (rc) {
         LOGD(ERROR, domid,
              "libxl__device_pci_add  failed for "
              "PCI device %x:%x:%x.%x (rc %d)",
-             pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
+             pci->domain, pci->bus, pci->dev, pci->func,
              rc);
     }
     aodev->rc = rc;
@@ -1733,16 +1733,16 @@ typedef struct {
     libxl__ao_device *outer_aodev;
     libxl_domain_config *d_config;
     libxl_domid domid;
-} add_pcidevs_state;
+} add_pcis_state;
 
-static void add_pcidevs_done(libxl__egc *, libxl__multidev *, int rc);
+static void add_pcis_done(libxl__egc *, libxl__multidev *, int rc);
 
-static void libxl__add_pcidevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
-                               libxl_domain_config *d_config,
-                               libxl__multidev *multidev)
+static void libxl__add_pcis(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
+                            libxl_domain_config *d_config,
+                            libxl__multidev *multidev)
 {
     AO_GC;
-    add_pcidevs_state *apds;
+    add_pcis_state *apds;
     int i;
 
     /* We need to start a new multidev in order to be able to execute
@@ -1752,23 +1752,23 @@ static void libxl__add_pcidevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
     apds->outer_aodev = libxl__multidev_prepare(multidev);
     apds->d_config = d_config;
     apds->domid = domid;
-    apds->multidev.callback = add_pcidevs_done;
+    apds->multidev.callback = add_pcis_done;
     libxl__multidev_begin(ao, &apds->multidev);
 
-    for (i = 0; i < d_config->num_pcidevs; i++) {
+    for (i = 0; i < d_config->num_pcis; i++) {
         libxl__ao_device *aodev = libxl__multidev_prepare(&apds->multidev);
-        libxl__device_pci_add(egc, domid, &d_config->pcidevs[i],
+        libxl__device_pci_add(egc, domid, &d_config->pcis[i],
                               true, aodev);
     }
 
     libxl__multidev_prepared(egc, &apds->multidev, 0);
 }
 
-static void add_pcidevs_done(libxl__egc *egc, libxl__multidev *multidev,
+static void add_pcis_done(libxl__egc *egc, libxl__multidev *multidev,
                              int rc)
 {
     EGC_GC;
-    add_pcidevs_state *apds = CONTAINER_OF(multidev, *apds, multidev);
+    add_pcis_state *apds = CONTAINER_OF(multidev, *apds, multidev);
 
     /* Convenience aliases */
     libxl_domain_config *d_config = apds->d_config;
@@ -1777,9 +1777,9 @@ static void add_pcidevs_done(libxl__egc *egc, libxl__multidev *multidev,
 
     if (rc) goto out;
 
-    if (d_config->num_pcidevs > 0 && !libxl_get_stubdom_id(CTX, domid)) {
-        rc = libxl__create_pci_backend(gc, domid, d_config->pcidevs,
-            d_config->num_pcidevs);
+    if (d_config->num_pcis > 0 && !libxl_get_stubdom_id(CTX, domid)) {
+        rc = libxl__create_pci_backend(gc, domid, d_config->pcis,
+                                       d_config->num_pcis);
         if (rc < 0) {
             LOGD(ERROR, domid, "libxl_create_pci_backend failed: %d", rc);
             goto out;
@@ -1792,7 +1792,7 @@ out:
 }
 
 static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
-                                    libxl_device_pci *pcidev, int force)
+                                    libxl_device_pci *pci, int force)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     char *state;
@@ -1804,12 +1804,12 @@ static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     state = libxl__xs_read(gc, XBT_NULL, path);
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF, pcidev->domain,
-                     pcidev->bus, pcidev->dev, pcidev->func);
+    libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF, pci->domain,
+                     pci->bus, pci->dev, pci->func);
 
     /* Remove all functions at once atomically by only signalling
      * device-model for function 0 */
-    if ( !force && (pcidev->vdevfn & 0x7) == 0 ) {
+    if ( !force && (pci->vdevfn & 0x7) == 0 ) {
         libxl__qemu_traditional_cmd(gc, domid, "pci-rem");
         if (libxl__wait_for_device_model_deprecated(gc, domid, "pci-removed",
                                          NULL, NULL, NULL) < 0) {
@@ -1830,7 +1830,7 @@ static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
 typedef struct pci_remove_state {
     libxl__ao_device *aodev;
     libxl_domid domid;
-    libxl_device_pci *pcidev;
+    libxl_device_pci *pci;
     bool force;
     bool hvm;
     unsigned int orig_vdev;
@@ -1844,7 +1844,7 @@ typedef struct pci_remove_state {
 } pci_remove_state;
 
 static void libxl__device_pci_remove_common(libxl__egc *egc,
-    uint32_t domid, libxl_device_pci *pcidev, bool force,
+    uint32_t domid, libxl_device_pci *pci, bool force,
     libxl__ao_device *aodev);
 static void device_pci_remove_common_next(libxl__egc *egc,
     pci_remove_state *prs, int rc);
@@ -1869,7 +1869,7 @@ static void pci_remove_done(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 
 static void do_pci_remove(libxl__egc *egc, uint32_t domid,
-                          libxl_device_pci *pcidev, int force,
+                          libxl_device_pci *pci, int force,
                           pci_remove_state *prs)
 {
     STATE_AO_GC(prs->aodev->ao);
@@ -1887,8 +1887,8 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
     libxl__ptr_add(gc, assigned);
 
     rc = ERROR_INVAL;
-    if ( !is_pcidev_in_array(assigned, num, pcidev->domain,
-                      pcidev->bus, pcidev->dev, pcidev->func) ) {
+    if ( !is_pci_in_array(assigned, num, pci->domain,
+                          pci->bus, pci->dev, pci->func) ) {
         LOGD(ERROR, domainid, "PCI device not attached to this domain");
         goto out_fail;
     }
@@ -1917,8 +1917,8 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
     } else {
         assert(type == LIBXL_DOMAIN_TYPE_PV);
 
-        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pcidev->domain,
-                                     pcidev->bus, pcidev->dev, pcidev->func);
+        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
+                                     pci->bus, pci->dev, pci->func);
         FILE *f = fopen(sysfs_path, "r");
         unsigned int start = 0, end = 0, flags = 0, size = 0;
         int irq = 0;
@@ -1953,8 +1953,8 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
         }
         fclose(f);
 skip1:
-        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pcidev->domain,
-                               pcidev->bus, pcidev->dev, pcidev->func);
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                               pci->bus, pci->dev, pci->func);
         f = fopen(sysfs_path, "r");
         if (f == NULL) {
             LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -1988,7 +1988,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = prs->domid;
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1996,7 +1996,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
     if (rc)
         goto out;
 
-    rc = qemu_pci_remove_xenstore(gc, domid, pcidev, prs->force);
+    rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
 
 out:
     pci_remove_detatched(egc, prs, rc);
@@ -2010,7 +2010,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     int rc;
 
     /* Convenience aliases */
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
 
     rc = libxl__ev_time_register_rel(ao, &prs->timeout,
                                      pci_remove_timeout,
@@ -2018,7 +2018,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     if (rc) goto out;
 
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
-                           pcidev->bus, pcidev->dev, pcidev->func);
+                           pci->bus, pci->dev, pci->func);
     prs->qmp.callback = pci_remove_qmp_device_del_cb;
     rc = libxl__ev_qmp_send(egc, &prs->qmp, "device_del", args);
     if (rc) goto out;
@@ -2080,14 +2080,14 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl__ao *const ao = prs->aodev->ao;
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
 
     if (rc) goto out;
 
     libxl__ev_qmp_dispose(gc, qmp);
 
     asked_id = GCSPRINTF(PCI_PT_QDEV_ID,
-                         pcidev->bus, pcidev->dev, pcidev->func);
+                         pci->bus, pci->dev, pci->func);
 
     /* query-pci response:
      * [{ 'devices': [ 'qdev_id': 'str', ...  ], ... }]
@@ -2135,10 +2135,10 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     pci_remove_state *prs = CONTAINER_OF(ev, *prs, timeout);
 
     /* Convenience aliases */
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
 
     LOGD(WARN, prs->domid, "timed out waiting for DM to remove "
-         PCI_PT_QDEV_ID, pcidev->bus, pcidev->dev, pcidev->func);
+         PCI_PT_QDEV_ID, pci->bus, pci->dev, pci->func);
 
     /* If we timed out, we might still want to keep destroying the device
      * (when force==true), so let the next function decide what to do on
@@ -2156,7 +2156,7 @@ static void pci_remove_detatched(libxl__egc *egc,
     bool isstubdom;
 
     /* Convenience aliases */
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
     libxl_domid domid = prs->domid;
 
     /* Cleaning QMP states ASAP */
@@ -2170,30 +2170,30 @@ static void pci_remove_detatched(libxl__egc *egc,
     isstubdom = libxl_is_stubdom(CTX, domid, &domainid);
 
     /* don't do multiple resets while some functions are still passed through */
-    if ( (pcidev->vdevfn & 0x7) == 0 ) {
-        libxl__device_pci_reset(gc, pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func);
+    if ((pci->vdevfn & 0x7) == 0) {
+        libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
     }
 
     if (!isstubdom) {
-        rc = xc_deassign_device(CTX->xch, domid, pcidev_encode_bdf(pcidev));
+        rc = xc_deassign_device(CTX->xch, domid, pci_encode_bdf(pci));
         if (rc < 0 && (prs->hvm || errno != ENOSYS))
             LOGED(ERROR, domainid, "xc_deassign_device failed");
     }
 
     stubdomid = libxl_get_stubdom_id(CTX, domid);
     if (stubdomid != 0) {
-        libxl_device_pci *pcidev_s;
+        libxl_device_pci *pci_s;
         libxl__ao_device *const stubdom_aodev = &prs->stubdom_aodev;
 
-        GCNEW(pcidev_s);
-        libxl_device_pci_init(pcidev_s);
-        libxl_device_pci_copy(CTX, pcidev_s, pcidev);
+        GCNEW(pci_s);
+        libxl_device_pci_init(pci_s);
+        libxl_device_pci_copy(CTX, pci_s, pci);
 
         libxl__prepare_ao_device(ao, stubdom_aodev);
         stubdom_aodev->action = LIBXL__DEVICE_ACTION_REMOVE;
         stubdom_aodev->callback = pci_remove_stubdom_done;
         stubdom_aodev->update_json = prs->aodev->update_json;
-        libxl__device_pci_remove_common(egc, stubdomid, pcidev_s,
+        libxl__device_pci_remove_common(egc, stubdomid, pci_s,
                                         prs->force, stubdom_aodev);
         return;
     }
@@ -2219,14 +2219,14 @@ static void pci_remove_done(libxl__egc *egc,
 
     if (rc) goto out;
 
-    libxl__device_pci_remove_xenstore(gc, prs->domid, prs->pcidev);
+    libxl__device_pci_remove_xenstore(gc, prs->domid, prs->pci);
 out:
     device_pci_remove_common_next(egc, prs, rc);
 }
 
 static void libxl__device_pci_remove_common(libxl__egc *egc,
                                             uint32_t domid,
-                                            libxl_device_pci *pcidev,
+                                            libxl_device_pci *pci,
                                             bool force,
                                             libxl__ao_device *aodev)
 {
@@ -2237,7 +2237,7 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     GCNEW(prs);
     prs->aodev = aodev;
     prs->domid = domid;
-    prs->pcidev = pcidev;
+    prs->pci = pci;
     prs->force = force;
     libxl__xswait_init(&prs->xswait);
     libxl__ev_qmp_init(&prs->qmp);
@@ -2247,16 +2247,16 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     libxl__ev_time_init(&prs->timeout);
     libxl__ev_time_init(&prs->retry_timer);
 
-    prs->orig_vdev = pcidev->vdevfn & ~7U;
+    prs->orig_vdev = pci->vdevfn & ~7U;
 
-    if ( pcidev->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
-        if ( pci_multifunction_check(gc, pcidev, &prs->pfunc_mask) ) {
+    if ( pci->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
+        if ( pci_multifunction_check(gc, pci, &prs->pfunc_mask) ) {
             rc = ERROR_FAIL;
             goto out;
         }
-        pcidev->vfunc_mask &= prs->pfunc_mask;
-    }else{
-        prs->pfunc_mask = (1 << pcidev->func);
+        pci->vfunc_mask &= prs->pfunc_mask;
+    } else {
+        prs->pfunc_mask = (1 << pci->func);
     }
 
     rc = 0;
@@ -2273,7 +2273,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = prs->domid;
-    libxl_device_pci *const pcidev = prs->pcidev;
+    libxl_device_pci *const pci = prs->pci;
     libxl__ao_device *const aodev = prs->aodev;
     const unsigned int pfunc_mask = prs->pfunc_mask;
     const unsigned int orig_vdev = prs->orig_vdev;
@@ -2284,13 +2284,13 @@ static void device_pci_remove_common_next(libxl__egc *egc,
         const int i = prs->next_func;
         prs->next_func--;
         if ( (1 << i) & pfunc_mask ) {
-            if ( pcidev->vfunc_mask == pfunc_mask ) {
-                pcidev->func = i;
-                pcidev->vdevfn = orig_vdev | i;
-            }else{
-                pcidev->vdevfn = orig_vdev;
+            if ( pci->vfunc_mask == pfunc_mask ) {
+                pci->func = i;
+                pci->vdevfn = orig_vdev | i;
+            } else {
+                pci->vdevfn = orig_vdev;
             }
-            do_pci_remove(egc, domid, pcidev, prs->force, prs);
+            do_pci_remove(egc, domid, pci, prs->force, prs);
             return;
         }
     }
@@ -2306,7 +2306,7 @@ out:
 }
 
 int libxl_device_pci_remove(libxl_ctx *ctx, uint32_t domid,
-                            libxl_device_pci *pcidev,
+                            libxl_device_pci *pci,
                             const libxl_asyncop_how *ao_how)
 
 {
@@ -2318,12 +2318,12 @@ int libxl_device_pci_remove(libxl_ctx *ctx, uint32_t domid,
     aodev->action = LIBXL__DEVICE_ACTION_REMOVE;
     aodev->callback = device_addrm_aocomplete;
     aodev->update_json = true;
-    libxl__device_pci_remove_common(egc, domid, pcidev, false, aodev);
+    libxl__device_pci_remove_common(egc, domid, pci, false, aodev);
     return AO_INPROGRESS;
 }
 
 int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
-                             libxl_device_pci *pcidev,
+                             libxl_device_pci *pci,
                              const libxl_asyncop_how *ao_how)
 {
     AO_CREATE(ctx, domid, ao_how);
@@ -2334,7 +2334,7 @@ int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
     aodev->action = LIBXL__DEVICE_ACTION_REMOVE;
     aodev->callback = device_addrm_aocomplete;
     aodev->update_json = true;
-    libxl__device_pci_remove_common(egc, domid, pcidev, true, aodev);
+    libxl__device_pci_remove_common(egc, domid, pci, true, aodev);
     return AO_INPROGRESS;
 }
 
@@ -2353,7 +2353,7 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
     if (s)
         vdevfn = strtol(s, (char **) NULL, 16);
 
-    pcidev_struct_fill(pci, domain, bus, dev, func, vdevfn);
+    pci_struct_fill(pci, domain, bus, dev, func, vdevfn);
 
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/opts-%d", be_path, nr));
     if (s) {
@@ -2398,7 +2398,7 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid, int *num
     GC_INIT(ctx);
     char *be_path;
     unsigned int n, i;
-    libxl_device_pci *pcidevs = NULL;
+    libxl_device_pci *pcis = NULL;
 
     *num = 0;
 
@@ -2407,28 +2407,28 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid, int *num
     if (libxl__device_pci_get_num(gc, be_path, &n))
         goto out;
 
-    pcidevs = calloc(n, sizeof(libxl_device_pci));
+    pcis = calloc(n, sizeof(libxl_device_pci));
 
     for (i = 0; i < n; i++)
-        libxl__device_pci_from_xs_be(gc, be_path, i, pcidevs + i);
+        libxl__device_pci_from_xs_be(gc, be_path, i, pcis + i);
 
     *num = n;
 out:
     GC_FREE;
-    return pcidevs;
+    return pcis;
 }
 
 void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
                                    libxl__multidev *multidev)
 {
     STATE_AO_GC(multidev->ao);
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_list(CTX, domid, &num);
-    if ( pcidevs == NULL )
+    pcis = libxl_device_pci_list(CTX, domid, &num);
+    if ( pcis == NULL )
         return;
-    libxl__ptr_add(gc, pcidevs);
+    libxl__ptr_add(gc, pcis);
 
     for (i = 0; i < num; i++) {
         /* Force remove on shutdown since, on HVM, qemu will not always
@@ -2436,7 +2436,7 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
          * devices by the time we even get here!
          */
         libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
-        libxl__device_pci_remove_common(egc, domid, pcidevs + i, true,
+        libxl__device_pci_remove_common(egc, domid, pcis + i, true,
                                         aodev);
     }
 }
@@ -2449,13 +2449,13 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
     if (!libxl_defbool_val(d_config->b_info.u.hvm.gfx_passthru))
         return 0;
 
-    for (i = 0 ; i < d_config->num_pcidevs ; i++) {
+    for (i = 0 ; i < d_config->num_pcis ; i++) {
         uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
         uint32_t stubdom_domid;
-        libxl_device_pci *pcidev = &d_config->pcidevs[i];
+        libxl_device_pci *pci = &d_config->pcis[i];
         unsigned long pci_device_class;
 
-        if (sysfs_dev_get_class(gc, pcidev, &pci_device_class))
+        if (sysfs_dev_get_class(gc, pci, &pci_device_class))
             continue;
         if (pci_device_class != 0x030000) /* VGA class */
             continue;
@@ -2494,7 +2494,7 @@ static int libxl_device_pci_compare(const libxl_device_pci *d1,
 
 #define libxl__device_pci_update_devid NULL
 
-DEFINE_DEVICE_TYPE_STRUCT_X(pcidev, pci, PCI,
+DEFINE_DEVICE_TYPE_STRUCT(pci, PCI,
     .get_num = libxl__device_pci_get_num,
     .from_xenstore = libxl__device_pci_from_xs_be,
 );
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9d3f05f39978..20f8dd7cfa5d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -940,7 +940,7 @@ libxl_domain_config = Struct("domain_config", [
 
     ("disks", Array(libxl_device_disk, "num_disks")),
     ("nics", Array(libxl_device_nic, "num_nics")),
-    ("pcidevs", Array(libxl_device_pci, "num_pcidevs")),
+    ("pcis", Array(libxl_device_pci, "num_pcis")),
     ("rdms", Array(libxl_device_rdm, "num_rdms")),
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 12fc0b3a7fdc..1d38fffce357 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -23,15 +23,15 @@ static int hex_convert(const char *str, unsigned int *val, unsigned int mask)
     return 0;
 }
 
-static int pcidev_struct_fill(libxl_device_pci *pcidev, unsigned int domain,
-                               unsigned int bus, unsigned int dev,
-                               unsigned int func, unsigned int vdevfn)
+static int pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
+                           unsigned int bus, unsigned int dev,
+                           unsigned int func, unsigned int vdevfn)
 {
-    pcidev->domain = domain;
-    pcidev->bus = bus;
-    pcidev->dev = dev;
-    pcidev->func = func;
-    pcidev->vdevfn = vdevfn;
+    pci->domain = domain;
+    pci->bus = bus;
+    pci->dev = dev;
+    pci->func = func;
+    pci->vdevfn = vdevfn;
     return 0;
 }
 
@@ -47,7 +47,7 @@ static int pcidev_struct_fill(libxl_device_pci *pcidev, unsigned int domain,
 #define STATE_RDM_STRATEGY      10
 #define STATE_RESERVE_POLICY    11
 #define INVALID         0xffffffff
-int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str)
+int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pci, const char *str)
 {
     unsigned state = STATE_DOMAIN;
     unsigned dom = INVALID, bus = INVALID, dev = INVALID, func = INVALID, vslot = 0;
@@ -110,11 +110,11 @@ int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str
                 }
                 *ptr = '\0';
                 if ( !strcmp(tok, "*") ) {
-                    pcidev->vfunc_mask = LIBXL_PCI_FUNC_ALL;
+                    pci->vfunc_mask = LIBXL_PCI_FUNC_ALL;
                 }else{
                     if ( hex_convert(tok, &func, 0x7) )
                         goto parse_error;
-                    pcidev->vfunc_mask = (1 << 0);
+                    pci->vfunc_mask = (1 << 0);
                 }
                 tok = ptr + 1;
             }
@@ -141,18 +141,18 @@ int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str
                 state = (*ptr == ',') ? STATE_OPTIONS_K : STATE_TERMINAL;
                 *ptr = '\0';
                 if ( !strcmp(optkey, "msitranslate") ) {
-                    pcidev->msitranslate = atoi(tok);
+                    pci->msitranslate = atoi(tok);
                 }else if ( !strcmp(optkey, "power_mgmt") ) {
-                    pcidev->power_mgmt = atoi(tok);
+                    pci->power_mgmt = atoi(tok);
                 }else if ( !strcmp(optkey, "permissive") ) {
-                    pcidev->permissive = atoi(tok);
+                    pci->permissive = atoi(tok);
                 }else if ( !strcmp(optkey, "seize") ) {
-                    pcidev->seize = atoi(tok);
+                    pci->seize = atoi(tok);
                 } else if (!strcmp(optkey, "rdm_policy")) {
                     if (!strcmp(tok, "strict")) {
-                        pcidev->rdm_policy = LIBXL_RDM_RESERVE_POLICY_STRICT;
+                        pci->rdm_policy = LIBXL_RDM_RESERVE_POLICY_STRICT;
                     } else if (!strcmp(tok, "relaxed")) {
-                        pcidev->rdm_policy = LIBXL_RDM_RESERVE_POLICY_RELAXED;
+                        pci->rdm_policy = LIBXL_RDM_RESERVE_POLICY_RELAXED;
                     } else {
                         XLU__PCI_ERR(cfg, "%s is not an valid PCI RDM property"
                                           " policy: 'strict' or 'relaxed'.",
@@ -175,7 +175,7 @@ int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str
     assert(dom != INVALID && bus != INVALID && dev != INVALID && func != INVALID);
 
     /* Just a pretty way to fill in the values */
-    pcidev_struct_fill(pcidev, dom, bus, dev, func, vslot << 3);
+    pci_struct_fill(pci, dom, bus, dev, func, vslot << 3);
 
     free(buf2);
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index cae8eb679c5a..0765780d9f0a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1470,24 +1470,24 @@ void parse_config_data(const char *config_source,
     }
 
     if (!xlu_cfg_get_list (config, "pci", &pcis, 0, 0)) {
-        d_config->num_pcidevs = 0;
-        d_config->pcidevs = NULL;
+        d_config->num_pcis = 0;
+        d_config->pcis = NULL;
         for(i = 0; (buf = xlu_cfg_get_listitem (pcis, i)) != NULL; i++) {
-            libxl_device_pci *pcidev;
+            libxl_device_pci *pci;
 
-            pcidev = ARRAY_EXTEND_INIT_NODEVID(d_config->pcidevs,
-                                               d_config->num_pcidevs,
-                                               libxl_device_pci_init);
-            pcidev->msitranslate = pci_msitranslate;
-            pcidev->power_mgmt = pci_power_mgmt;
-            pcidev->permissive = pci_permissive;
-            pcidev->seize = pci_seize;
+            pci = ARRAY_EXTEND_INIT_NODEVID(d_config->pcis,
+                                            d_config->num_pcis,
+                                            libxl_device_pci_init);
+            pci->msitranslate = pci_msitranslate;
+            pci->power_mgmt = pci_power_mgmt;
+            pci->permissive = pci_permissive;
+            pci->seize = pci_seize;
             /*
              * Like other pci option, the per-device policy always follows
              * the global policy by default.
              */
-            pcidev->rdm_policy = b_info->u.hvm.rdm.policy;
-            e = xlu_pci_parse_bdf(config, pcidev, buf);
+            pci->rdm_policy = b_info->u.hvm.rdm.policy;
+            e = xlu_pci_parse_bdf(config, pci, buf);
             if (e) {
                 fprintf(stderr,
                         "unable to parse PCI BDF `%s' for passthrough\n",
@@ -1495,7 +1495,7 @@ void parse_config_data(const char *config_source,
                 exit(-e);
             }
         }
-        if (d_config->num_pcidevs && c_info->type == LIBXL_DOMAIN_TYPE_PV)
+        if (d_config->num_pcis && c_info->type == LIBXL_DOMAIN_TYPE_PV)
             libxl_defbool_set(&b_info->u.pv.e820_host, true);
     }
 
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 58345bdae213..34fcf5a4fadf 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -24,20 +24,20 @@
 
 static void pcilist(uint32_t domid)
 {
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_list(ctx, domid, &num);
-    if (pcidevs == NULL)
+    pcis = libxl_device_pci_list(ctx, domid, &num);
+    if (pcis == NULL)
         return;
     printf("Vdev Device\n");
     for (i = 0; i < num; i++) {
         printf("%02x.%01x %04x:%02x:%02x.%01x\n",
-               (pcidevs[i].vdevfn >> 3) & 0x1f, pcidevs[i].vdevfn & 0x7,
-               pcidevs[i].domain, pcidevs[i].bus, pcidevs[i].dev, pcidevs[i].func);
-        libxl_device_pci_dispose(&pcidevs[i]);
+               (pcis[i].vdevfn >> 3) & 0x1f, pcis[i].vdevfn & 0x7,
+               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcidevs);
+    free(pcis);
 }
 
 int main_pcilist(int argc, char **argv)
@@ -57,28 +57,28 @@ int main_pcilist(int argc, char **argv)
 
 static int pcidetach(uint32_t domid, const char *bdf, int force)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-detach: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
     if (force) {
-        if (libxl_device_pci_destroy(ctx, domid, &pcidev, 0))
+        if (libxl_device_pci_destroy(ctx, domid, &pci, 0))
             r = 1;
     } else {
-        if (libxl_device_pci_remove(ctx, domid, &pcidev, 0))
+        if (libxl_device_pci_remove(ctx, domid, &pci, 0))
             r = 1;
     }
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -108,24 +108,24 @@ int main_pcidetach(int argc, char **argv)
 
 static int pciattach(uint32_t domid, const char *bdf, const char *vs)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-attach: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_add(ctx, domid, &pcidev, 0))
+    if (libxl_device_pci_add(ctx, domid, &pci, 0))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -155,19 +155,19 @@ int main_pciattach(int argc, char **argv)
 
 static void pciassignable_list(void)
 {
-    libxl_device_pci *pcidevs;
+    libxl_device_pci *pcis;
     int num, i;
 
-    pcidevs = libxl_device_pci_assignable_list(ctx, &num);
+    pcis = libxl_device_pci_assignable_list(ctx, &num);
 
-    if ( pcidevs == NULL )
+    if ( pcis == NULL )
         return;
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
-               pcidevs[i].domain, pcidevs[i].bus, pcidevs[i].dev, pcidevs[i].func);
-        libxl_device_pci_dispose(&pcidevs[i]);
+               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcidevs);
+    free(pcis);
 }
 
 int main_pciassignable_list(int argc, char **argv)
@@ -184,24 +184,24 @@ int main_pciassignable_list(int argc, char **argv)
 
 static int pciassignable_add(const char *bdf, int rebind)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-assignable-add: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pcidev, rebind))
+    if (libxl_device_pci_assignable_add(ctx, &pci, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
@@ -226,24 +226,24 @@ int main_pciassignable_add(int argc, char **argv)
 
 static int pciassignable_remove(const char *bdf, int rebind)
 {
-    libxl_device_pci pcidev;
+    libxl_device_pci pci;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pcidev);
+    libxl_device_pci_init(&pci);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pcidev, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
         fprintf(stderr, "pci-assignable-remove: malformed BDF specification \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_remove(ctx, &pcidev, rebind))
+    if (libxl_device_pci_assignable_remove(ctx, &pci, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pcidev);
+    libxl_device_pci_dispose(&pci);
     xlu_cfg_destroy(config);
 
     return r;
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 359a0015709e..b03e348ffb9a 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -190,16 +190,16 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t)\n");
     }
 
-    for (i = 0; i < d_config->num_pcidevs; i++) {
+    for (i = 0; i < d_config->num_pcis; i++) {
         fprintf(fh, "\t(device\n");
         fprintf(fh, "\t\t(pci\n");
         fprintf(fh, "\t\t\t(pci dev %04x:%02x:%02x.%01x@%02x)\n",
-               d_config->pcidevs[i].domain, d_config->pcidevs[i].bus,
-               d_config->pcidevs[i].dev, d_config->pcidevs[i].func,
-               d_config->pcidevs[i].vdevfn);
+               d_config->pcis[i].domain, d_config->pcis[i].bus,
+               d_config->pcis[i].dev, d_config->pcis[i].func,
+               d_config->pcis[i].vdevfn);
         fprintf(fh, "\t\t\t(opts msitranslate %d power_mgmt %d)\n",
-               d_config->pcidevs[i].msitranslate,
-               d_config->pcidevs[i].power_mgmt);
+               d_config->pcis[i].msitranslate,
+               d_config->pcis[i].power_mgmt);
         fprintf(fh, "\t\t)\n");
         fprintf(fh, "\t)\n");
     }
-- 
2.20.1


